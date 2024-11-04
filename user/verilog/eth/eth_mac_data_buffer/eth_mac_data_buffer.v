//===============================================
//
//	File: eth_mac_data_buffer.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04132024
//	Version: v1.0
//
// 	This is data buffer for ethernet mac.
//
//===============================================

module eth_mac_data_buffer
(
	// pe core clk & rstn
	input						pe_tx_clk,
	input						pe_tx_rstn,
	input						pe_rx_clk,
	input						pe_rx_rstn,

	// datalink interface
	input						txdb_pe2fifo_rdreq,
	input						txdb_pe2fifo_rdreq_done,
	output		[31:0]			txdb_fifo2pe_rdata,
	output						txdb_fifo2pe_empty,
	output						txdb_fifo2pe_done,
	output						txdb_fifo2pe_burst_process_done,
	output						txdb_fifo2pe_single_process_done,
	output						txdb_pe_tx_end,
	output						txdb_data_ready,
	output						txdb_process_doing,
	output						dl_ahbmst_error,

	// ahb master interface
	input						ahb_hclk,
	input						ahb_hrstn,
	output						ahb_hsel,
	input						ahb_hready,
	output		[ 1:0]			ahb_htrans,
	output		[ 2:0]			ahb_hsize,
	output						ahb_hwrite,
	output		[ 2:0]			ahb_hburst,
	output		[31:0]			ahb_haddr,
	output		[ 3:0]			ahb_hprot,
	output		[31:0]			ahb_hwdata,
	output 	  					ahb_hreadyout,
	input 		[ 1:0]			ahb_hresp,
	input 	 	[31:0]			ahb_hrdata,	

	// datalink control
	input						txdb_enable,
	output 						txdb_enable_end,
	input						ahbmst_logic_clr,
	input						txdb_logic_clr,
	input						rxdb_logic_clr,

	// dma config
	input		[ 3:0]			r_hready_tothres,
	input		[ 2:0]			r_priority_ratio,
	input						r_txrx_priority,
	input						r_arb_scheme,

	// descriptors
	input		[ 1:0]			r_tdes_num,
	input		[ 1:0]			r_rdes_num,
	input		[31:0]			r_tdes00,
	input		[31:0]			r_tdes02,
	input		[31:0]			r_tdes03,
	input		[31:0]			r_tdes10,
	input		[31:0]			r_tdes12,
	input		[31:0]			r_tdes13,
	input		[31:0]			r_tdes20,
	input		[31:0]			r_tdes22,
	input		[31:0]			r_tdes23,
	input		[31:0]			r_tdes30,
	input		[31:0]			r_tdes32,
	input		[31:0]			r_tdes33,
	input		[31:0]			r_rdes00,
	input		[31:0]			r_rdes03,
	input		[31:0]			r_rdes10,
	input		[31:0]			r_rdes13,
	input		[31:0]			r_rdes20,
	input		[31:0]			r_rdes23,
	input		[31:0]			r_rdes30,
	input		[31:0]			r_rdes33,

	// tx configs from descriptors	
	output  	[31:0]			r_tx_address1,
	output 						r_tx_ioc_int_en,
	output 		[11:0]			r_tx_length1,
	output		[27:26]			r_tx_cpc,	
	output 		[25:24]			r_tx_saic,
	output 		[17:16]			r_tx_cic,

	// rx configs from descriptors	
	output 		[31:0]			r_rx_address1,
	output 		  				r_rx_ioc_int_en,

	// interrupt status
	output						int_status_dma_hready_to,
	output						int_status_dma_hresp_error, 
	output						int_status_dma_process_finish		
);

//===============================================
// interactive singnal
//===============================================

reg								eth_dma_rx_req;// a request in rx progress request
wire							dl_ahbmst2db_burstack;// dma once acknowledge to tx or rx
wire							dl_ahbmst2db_singleack;// dma once acknowledge to tx or tx
wire							dl_txdb2ahbmst_singlereq;// tx data is less than 16 bytes
wire							dl_txdb2ahbmst_busrtreq;// tx data is more than 16 bytes
wire							dl_rxdb2ahbmst_singlereq;// rx data is less than 16 bytes
wire							dl_rxdb2ahbmst_busrtreq;// rx data is more than 16 bytes
wire							dl_db2ahbmst_direction;// 1: ahb write 0: ahb read
wire		[31:0]				dl_db2ahbmst_address;
wire		[31:0]				dl_ahbmst2txdb_data;
wire		[31:0]				dl_rxdb2ahbmst_data;
wire							dl_ahbmst2txdb_data_valid;
wire							dl_rxdb2ahbmst_data_valid;
wire							dl_ahbmst2db_once_burst_finish;// once ahb master 		
wire							dl_ahbmst2db_once_single_finish;// 		
wire							dl_ahbmst2db_once_finish;// 		

//===============================================
// process singnal
//===============================================

reg								dl_txdb_process_req;// a new tx progress request
wire							dl_txdb_process_grant;// tx process winning arbitration
wire							dl_txdb_process_doing;// a new dma ahb master transder doing
wire							dl_txdb_process_start;// a new dma ahb master transder start 
wire							dl_txdb_process_finish;// a whole tx process is done
reg								dl_rxdb_process_req;// a new rx progress request
wire							dl_rxdb_process_grant;// rx process winning arbitration
wire							dl_rxdb_process_doing;// a new dma ahb master transder doing
wire							dl_rxdb_process_start;// a new dma ahb master transder start 
wire							dl_rxdb_process_finish;// a whole rx process is done
wire							dl_process_doing;// a new dma ahb master transder doing
wire							dl_process_start;// a new dma ahb master transder start 
wire							dl_process_finish;// a new dma ahb master transder finish
reg			[ 9:0]				tx_word_cnt;
reg			[ 9:0]				rx_word_cnt;

//===============================================
// eth data link layer fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//
// Retry is reserved!
//===============================================

localparam						DATALINK_IDLE = 6'b000001;
localparam						DATALINK_ARBITRATION = 6'b000010;
localparam						DATALINK_DESCRIPTOR = 6'b000100;
localparam						DATALINK_TX_DATA = 6'b001000;
localparam						DATALINK_RX_DATA = 6'b010000;
localparam						DATALINK_END = 6'b100000;

reg				[ 5:0]			current_state;
reg				[ 5:0]			next_state;

reg								datalink_state_idle;
reg								datalink_state_arbitration;
reg								datalink_state_descriptor;
reg								datalink_state_tx_data;
reg								datalink_state_rx_data;
reg								datalink_state_end;
wire							datalink_state_idle_to_arbitration;
wire							datalink_state_idle_to_descriptor;
wire							datalink_state_arbitration_to_descriptor;
wire							datalink_state_descriptor_to_tx_data;
wire							datalink_state_descriptor_to_rx_data;
wire							datalink_state_tx_data_to_end;
wire							datalink_state_rx_data_to_end;
wire							datalink_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		current_state <= DATALINK_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// DATALINK_IDLE:
// -> DATALINK_DESCRIPTOR: only received tx or rx enable from regs
// -> DATALINK_ARBITRATION: both tx and rx conditions are met
// DATALINK_ARBITRATION:
// -> DATALINK_DESCRIPTOR: tx or rx data winning in arbitration
// DATALINK_DESCRIPTOR:
// -> DATALINK_TX_DATA: only received tx enable from regs or tx data winning in arbitration
// -> DATALINK_RX_DATA: only rx fifo not empty or rx data winning in arbitration
// DATALINK_TX_DATA:
// -> DATALINK_END:  tx data finish
// DATALINK_RX_DATA:
// -> DATALINK_END:  rx data finish
// DATALINK_END: 
// -> DATALINK_IDLE: prepare for deinit (reserved)
// All state should transition to DATALINK_IDLE when:
// 1. received related dma logic clear
// 2. protocol error occured (reserved)
// 3. auto retry

always @(*)
begin
	case (current_state)
	DATALINK_IDLE:
		if(datalink_state_idle_to_arbitration)
			next_state = DATALINK_ARBITRATION;
		else if(datalink_state_idle_to_descriptor)
			next_state = DATALINK_DESCRIPTOR;
		else
			next_state = DATALINK_IDLE;
	DATALINK_ARBITRATION:
		if(ahbmst_logic_clr)
			next_state = DATALINK_IDLE;
		else if(datalink_state_arbitration_to_descriptor)
			next_state = DATALINK_DESCRIPTOR;
		else
			next_state = DATALINK_ARBITRATION;
	DATALINK_DESCRIPTOR:
		if(ahbmst_logic_clr)
			next_state = DATALINK_IDLE;
		else if(datalink_state_descriptor_to_rx_data)
			next_state = DATALINK_RX_DATA;
		else if(datalink_state_descriptor_to_tx_data)
			next_state = DATALINK_TX_DATA;
		else
			next_state = DATALINK_DESCRIPTOR;
	DATALINK_TX_DATA:
		if(ahbmst_logic_clr)
			next_state = DATALINK_IDLE;
		else if(datalink_state_tx_data_to_end)
			next_state = DATALINK_END;
		else
			next_state = DATALINK_TX_DATA;
	DATALINK_RX_DATA:
		if(ahbmst_logic_clr)
			next_state = DATALINK_IDLE;
		else if(datalink_state_rx_data_to_end)
			next_state = DATALINK_END;
		else
			next_state = DATALINK_RX_DATA;
	DATALINK_END:
		if(ahbmst_logic_clr)
			next_state = DATALINK_IDLE;
		else if(datalink_state_end_to_idle)
			next_state = DATALINK_IDLE;
		else
			next_state = DATALINK_END;
	default:
		next_state = DATALINK_IDLE;
	endcase
end

// state output: sequential logic circuit/
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		datalink_state_idle <= 1'b1;
		datalink_state_arbitration <= 1'b0;
		datalink_state_descriptor <= 1'b0;
		datalink_state_tx_data <= 1'b0;
		datalink_state_rx_data <= 1'b0;
		datalink_state_end <= 1'b0;
	end
	else
	begin
		datalink_state_idle <= next_state == DATALINK_IDLE;
		datalink_state_arbitration <= next_state == DATALINK_ARBITRATION;
		datalink_state_descriptor <= next_state == DATALINK_DESCRIPTOR;
		datalink_state_tx_data <= next_state == DATALINK_TX_DATA;
		datalink_state_rx_data <= next_state == DATALINK_RX_DATA;
		datalink_state_end <= next_state == DATALINK_END;
	end
end

//===============================================
// eth dma ahb bus master arbiter
// If tx is lost, no data will store from dma to 
// data buffer.
// If rx is lost, rx data will store in data buffer
// but dma not working.
//===============================================

wire							arbiter_grant_finish;

assign datalink_state_idle_to_arbitration = dl_txdb_process_req && dl_rxdb_process_req;
assign datalink_state_idle_to_descriptor = dl_txdb_process_req || dl_rxdb_process_req;
assign datalink_state_arbitration_to_descriptor = arbiter_grant_finish;

// only using when confict occuring
eth_ahb_data_arbiter u_eth_ahb_data_arbiter 
(
	.module_clk					(ahb_hclk),
	.module_rstn				(ahb_hrstn),	
	.r_priority_ratio			(r_priority_ratio),
	.r_txrx_priority			(r_txrx_priority),
	.r_arb_scheme				(r_arb_scheme),	
	.arbiter_en					(datalink_state_idle_to_arbitration),
	.tx_req_grant				(dl_txdb_process_grant),
	.rx_req_grant				(dl_rxdb_process_grant),
	.grant_finish				(arbiter_grant_finish)
);

//===============================================
// eth dma ahb bus master
//===============================================

//assign dl_db2ahbmst_direction = dl_txdb_process_grant;
assign dl_db2ahbmst_direction = datalink_state_tx_data;
assign dl_process_doing = dl_txdb_process_doing;// tx or rx process start
assign dl_process_finish = dl_txdb_process_finish;// entire tx or rx process finished
assign dl_db2ahbmst_address = dl_db2ahbmst_direction ? r_tx_address1 : r_rx_address1;
assign dl_process_start = dl_txdb_process_start;// tx or rx

assign dl_rxdb2ahbmst_data = 'h0;//????????

//posedge_detect u_dl_rx_process_start 
//(
//	.clk						(ahb_hclk),
//	.rstn						(ahb_hrstn),
//	.A							(dl_rxdb_process_doing),
//	.Y							(dl_rxdb_process_start)
//);

posedge_detect u_dl_tx_process_start 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(dl_txdb_process_doing),
	.Y							(dl_txdb_process_start)
);

eth_ahb_master u_eth_ahb_master
(
	.ahb_hclk						(ahb_hclk),
	.ahb_hrstn						(ahb_hrstn),
	.ahb_hsel						(ahb_hsel),
	.ahb_hreadyout					(ahb_hreadyout),
	.ahb_htrans						(ahb_htrans),
	.ahb_hsize						(ahb_hsize),
	.ahb_hwrite						(ahb_hwrite),
	.ahb_hburst						(ahb_hburst),
	.ahb_haddr						(ahb_haddr),
	.ahb_hprot						(ahb_hprot),
	.ahb_hwdata						(ahb_hwdata),
	.ahb_hready						(ahb_hready),
	.ahb_hresp						(ahb_hresp),
	.ahb_hrdata						(ahb_hrdata),	

	.r_hready_tothres				(r_hready_tothres),

	.ahbmst_logic_clr				(ahbmst_logic_clr),
	.db2ahbmst_process_start		(dl_process_start),
	.db2ahbmst_singlereq			(dl_txdb2ahbmst_singlereq || dl_rxdb2ahbmst_singlereq),
	.db2ahbmst_burstreq				(dl_txdb2ahbmst_busrtreq || dl_rxdb2ahbmst_busrtreq),
	.db2ahbmst_addr					(dl_db2ahbmst_address),
	.db2ahbmst_direction			(dl_db2ahbmst_direction),			
	.db2ahbmst_data					(dl_rxdb2ahbmst_data),
	.ahbmst2db_data					(dl_ahbmst2txdb_data),
	.ahbmst2db_data_valid			(dl_ahbmst2txdb_data_valid),
	.db2ahbmst_data_valid			(dl_rxdb2ahbmst_data_valid),
	.ahbmst2db_singleack			(dl_ahbmst2db_singleack),
	.ahbmst2db_burstack				(dl_ahbmst2db_burstack),
	.ahbmst2db_once_single_finish	(dl_ahbmst2db_once_single_finish),
	.ahbmst2db_once_burst_finish	(dl_ahbmst2db_once_burst_finish),
	.ahbmst2db_once_finish			(dl_ahbmst2db_once_finish),
	.db2ahbmst_process_finish		(dl_txdb_process_finish),
	.ahbmst_error					(dl_ahbmst_error),
	.int_status_dma_hready_to		(int_status_dma_hready_to),
	.int_status_dma_hresp_error 	(int_status_dma_hresp_error) 
);

//===============================================
// eth datalink descriptor handle
//===============================================

wire							tx_descriptor_update;		
wire							rx_descriptor_update;		
wire							tx_last_descriptor;		
wire							rx_last_descriptor;		
wire							descriptor_handle_finish;		

assign tx_descriptor_handle = datalink_state_descriptor && (dl_txdb_process_grant || dl_txdb_process_req);
assign rx_descriptor_handle = datalink_state_descriptor && (dl_rxdb_process_grant || dl_rxdb_process_req);
assign datalink_state_descriptor_to_tx_data = tx_descriptor_handle && descriptor_handle_finish;
assign datalink_state_descriptor_to_rx_data = rx_descriptor_handle && descriptor_handle_finish;

eth_descriptor_handler u_eth_descriptor_handler
(
	.module_clk					(ahb_hclk),
	.module_rstn				(ahb_hrstn),	

	.descriptor_logic_clr		(ahbmst_logic_clr),
	.tx_descriptor_handle		(tx_descriptor_handle),
	.rx_descriptor_handle		(rx_descriptor_handle),

	.r_tdes_num					(r_tdes_num),
	.r_rdes_num					(r_rdes_num),
	.r_tdes00					(r_tdes00),
	.r_tdes02					(r_tdes02),
	.r_tdes03					(r_tdes03),
	.r_tdes10					(r_tdes10),
	.r_tdes12					(r_tdes12),
	.r_tdes13					(r_tdes13),
	.r_tdes20					(r_tdes20),
	.r_tdes22					(r_tdes22),
	.r_tdes23					(r_tdes23),
	.r_tdes30					(r_tdes30),
	.r_tdes32					(r_tdes32),
	.r_tdes33					(r_tdes33),
	.r_rdes00					(r_rdes00),
	.r_rdes03					(r_rdes03),
	.r_rdes10					(r_rdes10),
	.r_rdes13					(r_rdes13),
	.r_rdes20					(r_rdes20),
	.r_rdes23					(r_rdes23),
	.r_rdes30					(r_rdes30),
	.r_rdes33					(r_rdes33),

	.r_tx_address1				(r_tx_address1),
	.r_tx_ioc_int_en			(r_tx_ioc_int_en),
	.r_tx_length1				(r_tx_length1),
	.r_tx_cpc					(r_tx_cpc),	
	.r_tx_saic					(r_tx_saic),
	.r_tx_cic					(r_tx_cic),
	.r_rx_address1				(r_rx_address1),
	.r_rx_ioc_int_en			(r_rx_ioc_int_en),

	.descriptor_handle_finish	(descriptor_handle_finish),
	.last_tx_descriptor			(tx_last_descriptor),
	.last_rx_descriptor			(rx_last_descriptor),
	.process_finish				(dl_txdb_process_finish)
);

//===============================================
// eth mac tx request
// tx process request
// tx once request
//
// In tx process, data will be transmitted by pingpong
// operation in which data ram and data fifo are
// working simultaneously.
//
// tx data write is controled by htrans
//===============================================

assign dl_txdb_process_doing = datalink_state_tx_data;
assign txdb_process_doing = dl_txdb_process_doing;
assign datalink_state_tx_data_to_end = dl_txdb_process_finish;
assign txdb_enable_end = dl_txdb_process_finish && tx_last_descriptor;

// eth dma tx req is from regs
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		dl_txdb_process_req <= 1'b0;
	end
	else if(txdb_logic_clr)
	begin
		dl_txdb_process_req <= 1'b0;
	end
	// dma tx process request when tx enable from regs
	// enable use edge!!!
	else if(txdb_enable && ~dl_txdb_process_req)
	begin
		dl_txdb_process_req <= 1'b1;
	end
	// request end if the whole tx process is done
	else if(dl_txdb_process_finish)
	begin
		dl_txdb_process_req <= 1'b0;
	end
	else
	begin
		dl_txdb_process_req <= dl_txdb_process_req;
	end
end

//===============================================
// eth tx data buffer
// Firstly, fsm of tx data buffer is actived by 
// fsm of data buffer. Fsm of data buffer is actived
// by ahbmst enable from reg.
// Secondly, fsm of tx data buffer will continue to
// prepare data from ahb master to tx pe core if receiving
// read request from tx pe core. However, tx pe core
// will transmit read request until receiving data 
// ready signal from tx data buffer.
//===============================================

eth_mac_data_tx_buffer u_eth_mac_data_tx_buffer 
(
	.ahb_hclk							(ahb_hclk),
	.ahb_hrstn							(ahb_hrstn),

	.pe_tx_clk							(pe_tx_clk),
	.pe_tx_rstn							(pe_tx_rstn),

	.txdb_ahbmst2db_singleack			(dl_ahbmst2db_singleack),	
	.txdb_ahbmst2db_burstack			(dl_ahbmst2db_burstack),	
	.txdb_ahbmst2db_once_single_finish	(dl_ahbmst2db_once_single_finish),	
	.txdb_ahbmst2db_once_burst_finish	(dl_ahbmst2db_once_burst_finish),	
	.txdb_ahbmst2db_once_finish			(dl_ahbmst2db_once_finish),	
	.txdb_db2ahbmst_singlereq			(dl_txdb2ahbmst_singlereq),	
	.txdb_db2ahbmst_burstreq			(dl_txdb2ahbmst_busrtreq),	
	.txdb_ahbmst2db_data				(dl_ahbmst2txdb_data),	
	.txdb_ahbmst2db_data_valid			(dl_ahbmst2txdb_data_valid),	

	.txdb_pe2fifo_rdreq					(txdb_pe2fifo_rdreq),
	.txdb_pe2fifo_rdreq_done			(txdb_pe2fifo_rdreq_done),
	.txdb_fifo2pe_rdata					(txdb_fifo2pe_rdata),
	.txdb_fifo2pe_empty					(txdb_fifo2pe_empty),
	.txdb_fifo2pe_done					(txdb_fifo2pe_done),
	.txdb_fifo2pe_burst_process_done	(txdb_fifo2pe_burst_process_done),
	.txdb_fifo2pe_single_process_done	(txdb_fifo2pe_single_process_done),
	.txdb_data_ready					(txdb_data_ready),

	.txdb_process_doing					(dl_txdb_process_doing),
	.txdb_process_start					(dl_txdb_process_start),
	.txdb_pe_tx_end						(txdb_pe_tx_end),
	.txdb_process_finish				(dl_txdb_process_finish),
	
	.r_tx_length						(r_tx_length1),
	.ahbmst_logic_clr					(ahbmst_logic_clr),
	.txdb_logic_clr						(txdb_logic_clr)
//	.int_status_txdb_process_finish		(int_status_txdb_process_finish)
);

//===============================================
// eth mac rx request
// rx process request
// rx once request
//
// In rx process, data will be received by pingpong
// operation. However, if bus rx request is granted, 
// data ram and data fifo will work simultaneously.
// If bus rx request is not granted, data fifo will 
// work only and data ram wait for bus granted.
//===============================================

assign dl_rxdb_process_finish = 1'b0;//???? temp
assign rx_fifo_empty = 1'b1;//?????? temp
assign datalink_state_rx_data_to_end = dl_rxdb_process_finish;
wire							rx_fifo_empty_d;

// eth dma rx req is from rx fifo empty
negedge_detect 
#(
	.WIDTH						(1)
)
u_rx_fifo_data_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(rx_fifo_empty),
	.Y							(rx_fifo_empty_d)
);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		dl_rxdb_process_req <= 1'b0;
	end
	// dma rx process request when rx fifo not empty
	// edge detect
	else if(rx_fifo_empty_d && !dl_rxdb_process_req)
	begin
		dl_rxdb_process_req <= 1'b1;
	end
	// request end if the whole rx process is done
	else if(dl_rxdb_process_finish)
	begin
		dl_rxdb_process_req <= 1'b0;
	end
	else
	begin
		dl_rxdb_process_req <= dl_rxdb_process_req;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		eth_dma_rx_req <= 1'b0;
	end
	// dma rx process request when rx enable from regs
	// enable use edge!!!
	else if(rx_fifo_empty_d)
	begin
		eth_dma_rx_req <= 1'b1;
	end
	// once request done and prepare for next request
//	else if(eth_dma_ack)
	else if(dl_txdb_process_finish)// ????????? temp replace
	begin
		eth_dma_rx_req <= 1'b0;
	end
	else
	begin
		eth_dma_rx_req <= eth_dma_rx_req;
	end
end


//===============================================
// eth mac rx fifo
// mac clk fifo write from eth mac rx protocol engine
// ahb hclk fifo read from eth dma
// 2 kbytes = 512 words
// 
// substitution:
//
// rx clk
// async fifo
// ahb clk
// ram 2k(1+1)
// ahb clk
//===============================================
assign dl_rxdb2ahbmst_singlereq = 1'b0;
assign dl_rxdb2ahbmst_busrtreq = 1'b0;

//===============================================
// eth mac tx data buffer state: DATALINK_END
// this state is used to handle some unfinish issue
//===============================================

reg								datalink_end;
assign datalink_state_end_to_idle = datalink_end;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		datalink_end <= 1'b0;
	else if(datalink_state_end)
		datalink_end <= 1'b1;
	else
		datalink_end <= 1'b0;
end

//===============================================
// fifo flag
//===============================================

//assign int_status_rx_fifo_noempty = ~rx_fifo_empty;
//assign int_status_tx_fifo_empty = tx_fifo_empty;
//assign int_status_rx_fifo_warning = (rx_fifo_num >= r_rx_fifo_watermark) ? 1'b1 : 1'b0;
//assign int_status_tx_fifo_warning = (tx_fifo_num >= r_tx_fifo_watermark) ? 1'b1 : 1'b0;
assign int_status_dma_process_finish = dl_txdb_process_finish;

endmodule


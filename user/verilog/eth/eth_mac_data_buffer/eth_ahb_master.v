//===============================================
//
//	File: eth_ahb_master.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04132024
//	Version: v1.0
//
// 	This is ethernet ahb bus master.
//
//===============================================

module eth_ahb_master
(
	// ahb master
	input						ahb_hclk,
	input						ahb_hrstn,
	output						ahb_hsel,
	output						ahb_hreadyout,
	output reg	[ 1:0]			ahb_htrans,
	output reg	[ 2:0]			ahb_hsize,
	output reg					ahb_hwrite,
	output reg	[ 2:0]			ahb_hburst,
	output reg	[31:0]			ahb_haddr,
	output		[ 3:0]			ahb_hprot,
	output reg	[31:0]			ahb_hwdata,
	input 	  					ahb_hready,
	input 	  	[ 1:0]			ahb_hresp,
	input 	 	[31:0]			ahb_hrdata,	

	// reg interface
	input		[ 3:0]			r_hready_tothres,

	// interactive signal
	input						ahbmst_logic_clr,
	input						db2ahbmst_process_start,
	input						db2ahbmst_singlereq,
	input						db2ahbmst_burstreq,
	input		[31:0]			db2ahbmst_addr,
	input						db2ahbmst_direction,// 1:write 0:read
	input		[31:0]			db2ahbmst_data,
	output 		[31:0]			ahbmst2db_data,
	output						ahbmst2db_data_valid,// indicate transfer is valid
	output						db2ahbmst_data_valid,// indicate transfer is valid
	output reg					ahbmst2db_singleack,// indicate transfer is begining
	output reg					ahbmst2db_burstack,// indicate transfer is begining
	output 						ahbmst2db_once_single_finish,// indicate single transfer is done
	output 						ahbmst2db_once_burst_finish,// indicate burst transfer is done
	output						ahbmst2db_once_finish,// indicate transfer is done
	input						db2ahbmst_process_finish,// indicate transfer is done
	output						ahbmst_error,

	// interrupt status
	output						int_status_dma_hready_to,
	output						int_status_dma_hresp_error 
);

// interactive signal
wire							db2ahbmst_req;
wire							db2ahbmst_singlereq_r;
wire							db2ahbmst_burstreq_r;
wire							db2ahbmst_singlereq_f;
wire							db2ahbmst_burstreq_f;
wire							db2ahbmst_burst_lastdata;

// ahb bus master signal
reg				[2:0]			ahbmst_burst_cnt;
wire							ahbmst_bursttransctrl_finish;
reg								ahbmst_singletransctrl_finish;
wire							ahbmst_transctrl_finish;
reg								ahbmst_readtrans_doing;
wire							ahbmst_readtrans_valid;
wire							ahbmst_writetrans_valid;
reg								ahbmst_process_doing;

//===============================================
// ahb master fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						AHBMST_IDLE = 5'b00001;
localparam						AHBMST_TX_SINGLE = 5'b00010;
localparam						AHBMST_TX_BURST = 5'b00100;
localparam						AHBMST_RX_SINGLE = 5'b01000;
localparam						AHBMST_RX_BURST = 5'b10000;

reg				[ 4:0]			current_state;
reg				[ 4:0]			next_state;

wire							ahbmst_state_idle;
wire							ahbmst_state_tx_single;
wire							ahbmst_state_tx_burst;
wire							ahbmst_state_tx;
wire							ahbmst_state_rx_single;
wire							ahbmst_state_rx_burst;
wire							ahbmst_state_rx;
wire							ahbmst_state_single;
wire							ahbmst_state_burst;
wire							ahbmst_state_idle_to_tx_single;
wire							ahbmst_state_idle_to_tx_burst;
wire							ahbmst_state_idle_to_rx_single;
wire							ahbmst_state_idle_to_rx_burst;
wire							ahbmst_state_tx_single_to_idle;
wire							ahbmst_state_tx_burst_to_idle;
wire							ahbmst_state_rx_single_to_idle;
wire							ahbmst_state_rx_burst_to_idle;

// state transition: sequential logic circuit
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		current_state <= AHBMST_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
always @(*)
begin
	case (current_state)
	AHBMST_IDLE:
		if(ahbmst_state_idle_to_tx_single)
			next_state = AHBMST_TX_SINGLE;
		else if(ahbmst_state_idle_to_rx_single)
			next_state = AHBMST_RX_SINGLE;
		else if(ahbmst_state_idle_to_tx_burst)
			next_state = AHBMST_TX_BURST;
		else if(ahbmst_state_idle_to_rx_burst)
			next_state = AHBMST_RX_BURST;
		else
			next_state = AHBMST_IDLE;
	AHBMST_TX_SINGLE:
		if(ahbmst_logic_clr)
			next_state = AHBMST_IDLE;
		else if(ahbmst_state_tx_single_to_idle)
			next_state = AHBMST_IDLE;
		else
			next_state = AHBMST_TX_SINGLE;
	AHBMST_TX_BURST:
		if(ahbmst_logic_clr)
			next_state = AHBMST_IDLE;
		else if(ahbmst_state_tx_burst_to_idle)
			next_state = AHBMST_IDLE;
		else
			next_state = AHBMST_TX_BURST;
	AHBMST_RX_SINGLE:
		if(ahbmst_logic_clr)
			next_state = AHBMST_IDLE;
		else if(ahbmst_state_rx_single_to_idle)
			next_state = AHBMST_IDLE;
		else
			next_state = AHBMST_RX_SINGLE;
	AHBMST_RX_BURST:
		if(ahbmst_logic_clr)
			next_state = AHBMST_IDLE;
		else if(ahbmst_state_rx_burst_to_idle)
			next_state = AHBMST_IDLE;
		else
			next_state = AHBMST_RX_BURST;
	default:
		next_state = AHBMST_IDLE;
	endcase
end

// state output: combinational logic circuit
assign ahbmst_state_idle = current_state == AHBMST_IDLE;
assign ahbmst_state_tx_single = current_state == AHBMST_TX_SINGLE;
assign ahbmst_state_tx_burst = current_state == AHBMST_TX_BURST;
assign ahbmst_state_rx_single = current_state == AHBMST_RX_SINGLE;
assign ahbmst_state_rx_burst = current_state == AHBMST_RX_BURST;
assign ahbmst_state_tx = ahbmst_state_tx_single || ahbmst_state_tx_burst;
assign ahbmst_state_rx = ahbmst_state_rx_single || ahbmst_state_rx_burst;;
assign ahbmst_state_single = ahbmst_state_tx_single || ahbmst_state_rx_single;
assign ahbmst_state_burst = ahbmst_state_tx_burst || ahbmst_state_rx_burst;

//===============================================
// eth ahb master
// start detect
//===============================================

assign ahbmst_state_idle_to_tx_single = db2ahbmst_singlereq_r && db2ahbmst_direction;
assign ahbmst_state_idle_to_rx_single = db2ahbmst_singlereq_r && ~db2ahbmst_direction;
assign ahbmst_state_idle_to_tx_burst = db2ahbmst_burstreq_r && db2ahbmst_direction;
assign ahbmst_state_idle_to_rx_burst = db2ahbmst_burstreq_r && ~db2ahbmst_direction;

assign db2ahbmst_req = db2ahbmst_singlereq_r | db2ahbmst_burstreq_r;

posedge_detect u_singlereq_posedge_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(db2ahbmst_singlereq),
	.Y							(db2ahbmst_singlereq_r)
);

posedge_detect u_burstreq_posedge_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(db2ahbmst_burstreq),
	.Y							(db2ahbmst_burstreq_r)
);

negedge_detect u_singlereq_negedge_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(db2ahbmst_singlereq),
	.Y							(db2ahbmst_singlereq_f)
);

negedge_detect u_burstreq_negedge_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(db2ahbmst_burstreq),
	.Y							(db2ahbmst_burstreq_f)
);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst2db_burstack <= 1'b0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahbmst2db_burstack <= 1'b0;
	end
	else if(db2ahbmst_burstreq_r)
	begin
		ahbmst2db_burstack <= 1'b1;
	end
	else if(db2ahbmst_burstreq_f)
	begin
		ahbmst2db_burstack <= 1'b0;
	end
	else
	begin
		ahbmst2db_burstack <= ahbmst2db_burstack;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst2db_singleack <= 1'b0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahbmst2db_singleack <= 1'b0;
	end
	else if(db2ahbmst_singlereq_r)
	begin
		ahbmst2db_singleack <= 1'b1;
	end
	else if(db2ahbmst_singlereq_f)
	begin
		ahbmst2db_singleack <= 1'b0;
	end
	else
	begin
		ahbmst2db_singleack <= ahbmst2db_singleack;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst_process_doing <= 1'b0;
	end
	else if(ahbmst_logic_clr || db2ahbmst_process_finish)
	begin
		ahbmst_process_doing <= 1'b0;
	end
	else if(db2ahbmst_process_start)
	begin
		ahbmst_process_doing <= 1'b1;
	end
	else
	begin
		ahbmst_process_doing <= ahbmst_process_doing;
	end
end

//===============================================
// address control
// increasing when hready = 1
//===============================================

// address generation
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahb_haddr <= 32'h0;
	end
	else if(ahbmst_logic_clr || db2ahbmst_process_finish)
	begin
		ahb_haddr <= 32'h0;
	end
//	else if(ahb_hready && db2ahbmst_req)
	// Without bus control signal, address & data both are 'don't care'.
//	else if(ahbmst_transctrl_finish)
//	begin
//		ahb_haddr <= 32'h0;
//	end
	// data transfer
	else if(ahbmst_readtrans_valid || ahbmst_writetrans_valid)
	begin
		ahb_haddr <= ahb_haddr + 32'h4;
	end
	// first start address
	else if(db2ahbmst_process_start)
	begin
		ahb_haddr <= db2ahbmst_addr;
	end
	else
	begin
		ahb_haddr <= ahb_haddr;
	end
end

//===============================================
// bus control
// ceasing operation when error occured
// terminating when done
//===============================================

assign ahb_hreadyout = 1'b1;
assign ahb_hprot = 4'h0;
assign ahb_hsel = 1'b1;

// bus control
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahb_hsize <= 3'h0;
		ahb_hwrite <= 1'b0;
	end
	else if(ahbmst_logic_clr || ((ahb_hresp == 2'h1) && (ahb_hready == 1'b0)))
	begin
		ahb_hsize <= 3'h0;
		ahb_hwrite <= 1'b0;
	end
	else if(ahbmst_transctrl_finish)
	begin
		ahb_hsize <= 3'h0;
		ahb_hwrite <= 1'b0;
	end
	else if(db2ahbmst_req)
	begin
		ahb_hsize <= 3'h2;
		ahb_hwrite <= ~db2ahbmst_direction;// 1:write 0:read
	end
	else
	begin
		ahb_hsize <= ahb_hsize;
		ahb_hwrite <= ahb_hwrite;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahb_htrans <= 2'h0;
//		ahbmst2db_singleack <= 1'b0;
//		ahbmst2db_burstack <= 1'b0;
	end
	else if(ahbmst_logic_clr || ((ahb_hresp == 2'h1) && (ahb_hready == 1'b0)))
	begin
		ahb_htrans <= 2'h0;
//		ahbmst2db_singleack <= 1'b0;
//		ahbmst2db_burstack <= 1'b0;
	end
	else if(ahbmst_transctrl_finish)
	begin
		ahb_htrans <= 2'h0;
//		ahbmst2db_singleack <= 1'b0;
//		ahbmst2db_burstack <= 1'b0;
	end
	else if(db2ahbmst_burstreq)
	begin
		if(db2ahbmst_burstreq_r)
			ahb_htrans <= 2'h2;// first htrans in ahb burst transfer is 2!!!!!!
		else
			ahb_htrans <= 2'h3;
//		ahbmst2db_singleack <= 1'b0;
//		ahbmst2db_burstack <= 1'b1;
	end
	else if(db2ahbmst_singlereq_r)
	begin
		ahb_htrans <= 2'h2;
//		ahbmst2db_singleack <= 1'b1;
//		ahbmst2db_burstack <= 1'b0;
	end
	else
	begin
		ahb_htrans <= ahb_htrans;
//		ahbmst2db_singleack <= ahbmst2db_singleack;
//		ahbmst2db_burstack <= ahbmst2db_burstack;
	end
end

//===============================================
// bus burst control
// operating when burst transfer
// bus single control
// operating when single transfer
//===============================================

assign ahbmst_state_tx_burst_to_idle = db2ahbmst_burst_lastdata && (ahb_hready == 1'b1);
assign ahbmst_state_rx_burst_to_idle = ahbmst_state_tx_burst_to_idle; 

assign db2ahbmst_burst_lastdata = (ahbmst_burst_cnt == 3'h4);
assign ahbmst_transctrl_finish = (((ahb_htrans == 2'h2) && ahbmst_state_single) || (db2ahbmst_burst_lastdata == 1'b1)) && ahb_hready;// data is transfering 
assign ahbmst_bursttransctrl_finish = (db2ahbmst_burst_lastdata == 1'b1) && ahb_hready;
assign ahbmst2db_once_burst_finish = (ahbmst_burst_cnt == 3'h5) && ahb_hready;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst_burst_cnt <= 3'h0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahbmst_burst_cnt <= 3'h0;
	end
	else if(ahbmst2db_once_burst_finish)
	begin
		ahbmst_burst_cnt <= 3'h0;
	end
	else if(db2ahbmst_burstreq_r || ahbmst_state_burst)
	begin
		if(ahb_hready == 1'b1)
			ahbmst_burst_cnt <= ahbmst_burst_cnt + 1'b1;
		else
			ahbmst_burst_cnt <= ahbmst_burst_cnt;
	end
	else
	begin
		ahbmst_burst_cnt <= 3'h0;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahb_hburst <= 3'h0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahb_hburst <= 3'h0;
	end
	else if(ahbmst_bursttransctrl_finish)
	begin
		ahb_hburst <= 3'h0;
	end
	else if(db2ahbmst_burstreq_r || ahbmst_state_burst)
	begin
		ahb_hburst <= 3'h2;
	end
	else
	begin
		ahb_hburst <= 3'h0;
	end
end

assign ahbmst2db_once_single_finish = ahbmst_singletransctrl_finish  && ahb_hready;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst_singletransctrl_finish <= 1'b0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahbmst_singletransctrl_finish <= 1'b0;
	end
	else if((ahb_htrans == 2'h2) && ahbmst_state_single && ahb_hready)
	begin
		ahbmst_singletransctrl_finish <= 1'b1;
	end
	else if(ahbmst_singletransctrl_finish && ahb_hready)
	begin
		ahbmst_singletransctrl_finish <= 1'b0;
	end
	else
	begin
		ahbmst_singletransctrl_finish <= ahbmst_singletransctrl_finish;
	end
end

//===============================================
// eth ahb master transfer control end detect
// single transfer: when single requst occuring
// burst transfer: when burst cnt reaching max
//===============================================

assign ahbmst_state_tx_single_to_idle = ahbmst_singletransctrl_finish;
assign ahbmst_state_rx_single_to_idle = ahbmst_singletransctrl_finish;
assign ahbmst_state_tx_burst_to_idle = ahbmst_bursttransctrl_finish;
assign ahbmst_state_rx_burst_to_idle = ahbmst_bursttransctrl_finish;
//assign ahbmst_transctrl_finish = (((ahb_htrans == 2'h2) && (~db2ahbmst_burstreq_r)) || (db2ahbmst_burst_lastdata == 1'b1)) ;// data is transfering 
//assign ahbmst_singletransctrl_finish = (ahb_htrans == 2'h2) && (~db2ahbmst_burstreq_r) && ahb_hready;



//===============================================
// write data
// Valid periods in a write transfer are indicated
// by htrans, hready & hwrite.
//===============================================

assign ahbmst_writetrans_valid = ahb_htrans[1] && ahb_hready && ahb_hwrite;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahb_hwdata <= 32'h0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahb_hwdata <= 32'h0;
	end
	// Without bus control signal, address & data both are 'don't care'.
	else if(ahbmst_writetrans_valid)
	begin
		ahb_hwdata <= db2ahbmst_data;
	end
	else
	begin
		ahb_hwdata <= ahb_hwdata;
	end
end

//===============================================
// read trans valid
// This ahbmst_readtrans_valid is accord with
// the valid control phase in ahb trans.
// For example, the address increment is following
// this signal.
//===============================================

assign ahbmst_readtrans_valid = ahb_htrans[1] && ahb_hready && ~ahb_hwrite;

//===============================================
// read data
// Data phase is 1clk later than control phase
// in ahb trans.
// A read transfer starts at bus ready and 
// htrans[1] = 1.
// A read transfer ends at htrans[1] = 0 and bus
// ready.
// Vaild periods in a read transfer are indicated
// by bus ready. This is accord with data phase
// if hready is high.
//===============================================

assign ahbmst2db_data_valid = ahbmst_readtrans_doing && ahb_hready;
assign ahbmst2db_data = ahb_hrdata;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst_readtrans_doing <= 1'b0;
	end
	else if(ahbmst_logic_clr)
	begin
		ahbmst_readtrans_doing <= 1'b0;
	end
	//trans start
	else if(ahb_htrans[1] && ahb_hready)
	begin
		ahbmst_readtrans_doing <= 1'b1;
	end
	//trans end
//	else if(ahbmst_readtrans_doing && ahb_hready)
	else if(~ahb_htrans[1] && ahb_hready)
	begin
		ahbmst_readtrans_doing <= 1'b0;
	end
	else
	begin
		ahbmst_readtrans_doing <= ahbmst_readtrans_doing;
	end
end

// data delay for reading by data buffer
//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		ahbmst2db_data <= 32'h0;
//	end
//	else if(ahbmst_logic_clr)
//	begin
//		ahbmst2db_data <= 32'h0;
//	end
//	// Without bus control signal, address & data both are 'don't care'.
////	else if(ahbmst_readtrans_valid)
////	begin
////		ahbmst2db_data <= ahb_hrdata;
////	end
//	else
//	begin
////		ahbmst2db_data <= ahbmst2db_data;
//		ahbmst2db_data <= ahb_hrdata;
//	end
//end

//===============================================
// eth ahb master dma ack
// from ahb master to data buffer
// ack: indicate transfer is begining
// done: indicate transfer is beging done
//===============================================

//assign ahbmst2db_ack = ahbmst_transctrl_finish;
//assign ahbmst2db_ack = ahb_htrans[1];

//===============================================
// eth ahb master once finish
// ??? need a ff?
//===============================================

assign ahbmst2db_once_finish = ahbmst2db_once_single_finish || ahbmst2db_once_burst_finish;

//===============================================
// eth ahb master fault handle mechanism
// timeout counter for hready
// hresp detection
//===============================================

wire							ahbmst_hready_to;
reg				[ 3:0]			ahbmst_hready_to_cnt;
assign ahbmst_hready_to = (ahbmst_hready_to_cnt >= r_hready_tothres) ? 1'b1 : 1'b0;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		ahbmst_hready_to_cnt <= 4'h0;
	end
	else if(ahbmst_logic_clr || (&r_hready_tothres))
	begin
		ahbmst_hready_to_cnt <= 4'h0;
	end
	else if(~ahb_hready && ~ahbmst_hready_to && ahbmst_process_doing)
	begin
		ahbmst_hready_to_cnt <= ahbmst_hready_to_cnt + 1'b1;
	end
	else
	begin
		ahbmst_hready_to_cnt <= 4'h0;
	end
end

wire							ahbmst_hresp_error;
assign ahbmst_hresp_error = ahb_hresp && ahbmst_process_doing;

assign ahbmst_error = ahbmst_hresp_error || ahbmst_hready_to;

//===============================================
// interrupt status detect
//===============================================

assign int_status_dma_hready_to = ahbmst_hready_to;
assign int_status_dma_hresp_error = ahbmst_hresp_error; 


//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		ahbmst2db_ack <= 1'b0;
//	end
//	else if(ahbmst_logic_clr)
//	begin
//		ahbmst2db_ack <= 1'b0;
//	end
//	// Without bus control signal, address & data both are 'don't care'.
//	else if(ahbmst_transctrl_finish)
//	begin
//		ahbmst2db_ack <= 1'b1;
//	end
//	else
//	begin
//		ahbmst2db_ack <= 1'b0;
//	end
//end

endmodule


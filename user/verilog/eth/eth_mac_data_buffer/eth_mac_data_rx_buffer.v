//===============================================
//
//	File: eth_mac_data_rx_buffer.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01112024
//	Version: v1.0
//
// 	This is data buffer for ethernet mac rx.
//	Two mode can be selected for rx data buffer.
//	AHB bus clk must be higher than eth pe core rx clk.
//
//	Mode 0: async fifo pingpong
//  In this method, two async fifos are involved into
//  pingpong operation. One is dealing with ahb master,
//  while the other is dealing with mac pe core.
//
//	Mode 1: pushing all data into ram first
//	In this method, a ram and an async fifo are involved
//	into operation. All data will be read from ram and 
//	writen into fifo one by one after all data has been 
//	writen into ram. If ahb bus master is occupied, all 
//	rx data will be pushed in to this ram mandatorily.
//
//	Mode 2: auto retransmission (reserve)
//	In this method, 2 modes above are both able to choose.
//	However, no data will push into ram from ahb master
//	in order to preserve old data.
//
//===============================================

module eth_mac_data_rx_buffer
(
	// ahb master
	input						ahb_hclk,
	input						ahb_hrstn,

	// pe core clk & rstn
	input						pe_rx_clk,
	input						pe_rx_rstn,

	// data interface with ahb master
	input						rxdb_ahbmst2db_singleack,// start each transfer from ahb master ack
	input						rxdb_ahbmst2db_burstack,// start each transfer from ahb master ack
	input						rxdb_ahbmst2db_once_single_finish,// end each transfer from ahb master transctrl
	input						rxdb_ahbmst2db_once_burst_finish,// end each transfer from ahb master transctrl
	input						rxdb_ahbmst2db_once_finish,// end each transfer from ahb master transctrl
	output reg					rxdb_db2ahbmst_singlereq,// request to ahb master to write data
	output reg					rxdb_db2ahbmst_burstreq,// request to ahb master to write data
	input 	 	[31:0]			rxdb_ahbmst2db_data,	
	input 	 					rxdb_ahbmst2db_data_valid,	
	input						rxdb_pingpong_mode,

	// data interface with pe core
	input						rxdb_pe2fifo_wrreq,
	input						rxdb_pe2fifo_wrreq_done,


	// reg interface
	input		[11:0]			r_rx_length,

	// logic clear control
	input						ahbmst_logic_clr,
	input						rxdb_logic_clr


//	// interrupt status
//	output						int_status_txdb_process_finish
);

wire							rxdb_sm_fifo2ram_process_done;
wire							rxdb_process_finish; 


//===============================================
// rx data buffer fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						RXDB_IDLE = 8'b0000001;
localparam						RXDB_FIRST_TRANSFER = 8'b00000010;
localparam						RXDB_WRITE_RAMP_READ_FIFON = 8'b00000100;
localparam						RXDB_WRITE_RAMN_READ_FIFOP = 8'b00001000;
localparam						RXDB_LAST_TRANSFER = 8'b00010000;
localparam						RXDB_FROM_FIFO_TO_RAM = 8'b00100000;
localparam						RXDB_FROM_RAM_TO_AHBMST = 8'b01000000;

localparam						RXDB_WAIT_RX_DONE = 8'b10000000;

//last trans
//
reg				[ 7:0]			current_state;
reg				[ 7:0]			next_state;

reg								rxdb_state_idle;
reg								rxdb_state_first_transfer;
reg								rxdb_state_write_ramp_read_fifon;
reg								rxdb_state_write_ramn_read_fifop;
reg								rxdb_state_last_transfer;
reg								rxdb_state_from_fifo_to_ram;
reg								rxdb_state_from_ram_to_ahbmst;
reg								rxdb_state_wait_rx_done;
wire							rxdb_state_idle_to_first_transfer;
wire							rxdb_state_idle_to_from_fifo_to_ram;
wire							rxdb_state_first_transfer_to_write_ramn_read_fifop;
wire							rxdb_state_first_transfer_to_last_transfer;
wire							rxdb_state_write_ramp_read_fifon_to_last_transfer;
wire							rxdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop;
wire							rxdb_state_write_ramn_read_fifop_to_last_transfer;
wire							rxdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon;
wire							rxdb_state_last_transfer_to_wait_rx_done;
wire							rxdb_state_from_fifo_to_ram_to_from_ram_to_ahbmst;
wire							rxdb_state_from_ram_to_ahbmst_to_wait_rx_done;
wire							rxdb_state_wait_rx_done_to_idle;

// state transition: sequential logic circuit
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		current_state <= RXDB_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// RXDB_IDLE:
// -> RXDB_FIRST_TRANSFER: rx process start(receiving preambles)
// RXDB_FIRST_TRANSFER:
// -> RXDB_WRITE_RAMN_READ_FIFOP : the first bunch of data has been pushed from ahbmst to ram and still remaining
// -> RXDB_LAST_TRANSFER: 1. the first bunch of data has been pushed from ahbmst to ram and no more data will be doing this again
// 						  2. only store data without ahb trans
// RXDB_WRITE_RAMP_READ_FIFON:
// -> RXDB_WRITE_RAMN_READ_FIFOP : pingpong operation, data is transferring from ahbmst to one ram and from the other ram to fifo
// -> RXDB_LAST_TRANSFER: all data has been pushed from ahbmst to ram but still a group of data has not pop from ram
// RXDB_WRITE_RAMN_READ_FIFOP:
// -> RXDB_WRITE_RAMP_READ_FIFON : pingpong operation, data is transferring from ahbmst to one ram and from the other ram to fifo
// -> RXDB_LAST_TRANSFER: all data has been pushed from ahbmst to ram but still a group of data has not pop from ram
// RXDB_LAST_TRANSFER: 
// -> RXDB_IDLE: the last bunch of data has been poped from ram to fifo
// All state should transition to RXDB_IDLE when:
// 1. received related dma logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	RXDB_IDLE:
		if(rxdb_state_idle_to_first_transfer)
			next_state = RXDB_FIRST_TRANSFER;
		else if(rxdb_state_idle_to_from_fifo_to_ram)
			next_state = RXDB_FROM_FIFO_TO_RAM;
		else
			next_state = RXDB_IDLE;
	RXDB_FIRST_TRANSFER:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_first_transfer_to_last_transfer)
			next_state = RXDB_LAST_TRANSFER;
		else if(rxdb_state_first_transfer_to_write_ramn_read_fifop)
			next_state = RXDB_WRITE_RAMN_READ_FIFOP;
		else
			next_state = RXDB_FIRST_TRANSFER;
	RXDB_WRITE_RAMP_READ_FIFON:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_write_ramp_read_fifon_to_last_transfer)
			next_state = RXDB_LAST_TRANSFER;
		else if(rxdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop)
			next_state = RXDB_WRITE_RAMN_READ_FIFOP;
		else
			next_state = RXDB_WRITE_RAMP_READ_FIFON;
	RXDB_WRITE_RAMN_READ_FIFOP:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_write_ramn_read_fifop_to_last_transfer)
			next_state = RXDB_LAST_TRANSFER;
		else if(rxdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon)
			next_state = RXDB_WRITE_RAMP_READ_FIFON;
		else
			next_state = RXDB_WRITE_RAMN_READ_FIFOP;
	RXDB_FROM_FIFO_TO_RAM:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_from_fifo_to_ram_to_from_ram_to_ahbmst)
			next_state = RXDB_FROM_RAM_TO_AHBMST;
		else
			next_state = RXDB_FROM_FIFO_TO_RAM;
	RXDB_FROM_RAM_TO_AHBMST:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_from_ram_to_ahbmst_to_wait_rx_done)
			next_state = RXDB_WAIT_RX_DONE;
		else
			next_state = RXDB_FROM_RAM_TO_AHBMST;
	RXDB_LAST_TRANSFER:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_last_transfer_to_wait_rx_done)
			next_state = RXDB_WAIT_RX_DONE;
		else
			next_state = RXDB_LAST_TRANSFER;
	RXDB_WAIT_RX_DONE:
		if(ahbmst_logic_clr)
			next_state = RXDB_IDLE;
		else if(rxdb_state_wait_rx_done_to_idle)
			next_state = RXDB_IDLE;
		else
			next_state = RXDB_WAIT_RX_DONE;
	default:
		next_state = RXDB_IDLE;
	endcase
end

// state output: sequential logic circuit/
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_state_idle <= 1'b1;
		rxdb_state_first_transfer <= 1'b0;
		rxdb_state_write_ramp_read_fifon <= 1'b0;
		rxdb_state_write_ramn_read_fifop <= 1'b0;
		rxdb_state_last_transfer <= 1'b0;
		rxdb_state_from_fifo_to_ram <= 1'b0;
		rxdb_state_from_ram_to_ahbmst <= 1'b0;
	end
	else
	begin
		rxdb_state_idle <= next_state == RXDB_IDLE;
		rxdb_state_first_transfer <= next_state == RXDB_FIRST_TRANSFER; 
		rxdb_state_write_ramp_read_fifon <= next_state == RXDB_WRITE_RAMP_READ_FIFON; 
		rxdb_state_write_ramn_read_fifop <= next_state == RXDB_WRITE_RAMN_READ_FIFOP; 
		rxdb_state_last_transfer <= next_state == RXDB_LAST_TRANSFER; 
		rxdb_state_from_fifo_to_ram <= next_state == RXDB_FROM_FIFO_TO_RAM;
		rxdb_state_from_ram_to_ahbmst <= next_state == RXDB_FROM_RAM_TO_AHBMST;
	end
end

//===============================================
// state conditions judgement
//===============================================

assign rxdb_state_idle_to_from_fifo_to_ram = ~rxdb_pingpong_mode && rxdb_pe2fifo_wrreq;
assign rxdb_state_from_fifo_to_ram_to_from_ram_to_ahbmst = rxdb_pe2fifo_wrreq_done && rxdb_sm_fifo2ram_process_done;
assign rxdb_process_finish = rxdb_state_wait_rx_done_to_idle; 

assign rxdb_once_process_done = rxdb_ahbmst2ram_once_process_done && rxdb_ram2fifo_once_process_done && (rxdb_data_ready ? rxdb_pe2fifo_once_process_finish_af : 1'b1);//In first 2 trans, tx fifo is not involved in.
assign rxdb_state_idle_to_first_transfer = rxdb_process_start;
assign rxdb_state_first_transfer_to_write_ramn_read_fifop = rxdb_state_first_transfer && rxdb_ahbmst2ram_once_process_done; 
assign rxdb_state_first_transfer_to_last_transfer = rxdb_state_first_transfer && rxdb_state_first_transfer_to_write_ramn_read_fifop && rxdb_ahbmst2ram_process_done; 
assign rxdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop = rxdb_state_write_ramp_read_fifon && rxdb_once_process_done;
assign rxdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon = rxdb_state_write_ramn_read_fifop && rxdb_once_process_done;
assign rxdb_state_write_ramp_read_fifon_to_last_transfer = rxdb_state_write_ramp_read_fifon && rxdb_once_process_done && rxdb_ahbmst2ram_process_done;
assign rxdb_state_write_ramn_read_fifop_to_last_transfer = rxdb_state_write_ramn_read_fifop && rxdb_once_process_done && rxdb_ahbmst2ram_process_done;
//assign rxdb_state_last_transfer_to_idle = rxdb_state_last_transfer && rxdb_ram2fifo_once_process_done && (rxdb_pe2fifo_once_process_finish_af && ~rxdb_data_ready);
assign rxdb_state_last_transfer_to_wait_tx_done = rxdb_state_last_transfer && rxdb_ram2fifo_once_process_done && rxdb_pe2fifo_once_process_finish_af;
assign rxdb_state_wait_tx_done_to_idle = rxdb_pe_tx_end_af;

//===============================================
// flow control pingpong operation
// 1. data from fifo to ramp and from ramn to ahbmst 
// 2. data from fifo to ramn and from ramp to ahbmst 
// Each once start will rise when 'next state' signal
// rises.
// Data will push into or pop from ram when next state has been
// transferred.
//
// rxdb_write/read_ramx singals are only used to
// judge whether the trans is reading or writing and
// whether the destination is p or n.
// The control singal is using data valid seperately
// instead of those signals.
//===============================================

wire 							rxdb_ramp2ahbmst_once_start; 
wire 							rxdb_ramn2ahbmst_once_start; 
wire 							rxdb_ramp2ahbmst_once_finish; 
wire 							rxdb_ramn2ahbmst_once_finish; 
wire							rxdb_ram2ahbmst_once_start;
wire 							rxdb_fifo2ramp_once_start; 
wire 							rxdb_fifo2ramn_once_start; 
wire							rxdb_fifo2ram_once_start;
wire							rxdb_fifo2ram_once_ram_finish;
reg								rxdb_write_ramp;
reg								rxdb_write_ramn;
reg								rxdb_read_ramn;
reg								rxdb_read_ramp;
assign rxdb_ramn2ahbmst_once_start = rxdb_state_first_transfer_to_write_ramn_read_fifop || rxdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop;
assign rxdb_ramp2ahbmst_once_start = rxdb_state_idle_to_first_transfer || rxdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon;
assign rxdb_ram2ahbmst_once_start = rxdb_ramp2ahbmst_once_start || rxdb_ramn2ahbmst_once_start;
assign rxdb_fifo2ramp_once_start = rxdb_ramn2ahbmst_once_start || rxdb_state_write_ramp_read_fifon_to_last_transfer;
assign rxdb_fifo2ramn_once_start = rxdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon || rxdb_state_write_ramn_read_fifop_to_last_transfer;
assign rxdb_fifo2ram_once_start = rxdb_fifo2ramp_once_start || rxdb_fifo2ramn_once_start;
// don't care in last transfer
assign rxdb_ramp2ahbmst_once_finish = rxdb_ahbmst2ram_once_process_done && (rxdb_state_first_transfer || rxdb_state_write_ramp_read_fifon);
assign rxdb_ramn2ahbmst_once_finish = rxdb_ahbmst2ram_once_process_done && (rxdb_state_write_ramn_read_fifop);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_write_ramp <= 1'b0;
	end
	else if(rxdb_ahbmst_clr || rxdb_ramp2ahbmst_once_finish)
	begin
		rxdb_write_ramp <= 1'b0;
	end
	else if(rxdb_ramp2ahbmst_once_start)
	begin
		rxdb_write_ramp <= 1'b1;
	end
	else
	begin
		rxdb_write_ramp <= rxdb_write_ramp;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_write_ramn <= 1'b0;
	end
	else if(rxdb_ahbmst_clr || rxdb_ramn2ahbmst_once_finish)
	begin
		rxdb_write_ramn <= 1'b0;
	end
	else if(rxdb_ramn2ahbmst_once_start)
	begin
		rxdb_write_ramn <= 1'b1;
	end
	else
	begin
		rxdb_write_ramn <= rxdb_write_ramn;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_read_ramp <= 1'b0;
	end
	else if(rxdb_ahbmst_clr || (rxdb_ram2fifo_once_process_done && rxdb_read_ramp))
	begin
		rxdb_read_ramp <= 1'b0;
	end
	else if(rxdb_fifo2ramp_once_start)
	begin
		rxdb_read_ramp <= 1'b1;
	end
	else
	begin
		rxdb_read_ramp <= rxdb_read_ramp;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_read_ramn <= 1'b0;
	end
	else if(rxdb_ahbmst_clr || (rxdb_ram2fifo_once_process_done && rxdb_read_ramn))
	begin
		rxdb_read_ramn <= 1'b0;
	end
	else if(rxdb_fifo2ramn_once_start)
	begin
		rxdb_read_ramn <= 1'b1;
	end
	else
	begin
		rxdb_read_ramn <= rxdb_read_ramn;
	end
end




//===============================================
// rx data word cnt
// from pe to ram
//===============================================

reg			[ 7:0]				rxdb_data_word_cnt;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_data_word_cnt <= 8'h0;
	end
	else if(rxdb_logic_clr)
	begin
		rxdb_data_word_cnt <= 8'h0;
	end
	else if(rxdb_pe2fifo_wrreq)
	begin
		rxdb_data_word_cnt <= rxdb_data_word_cnt + 1'b1;
	end
	else
	begin
		rxdb_data_word_cnt <= rxdb_data_word_cnt;
	end
end

//===============================================
// stored mode
// data from pe to ram
//===============================================

wire							rxdb_sm_fifo2ramp;
wire							rxdb_sm_fifo2ramn;







//===============================================
// data from ahbmst to ram
//===============================================

reg			[31:0]				rxdb_ramp2ahbmst_data;
reg			[31:0]				rxdb_ramn2ahbmst_data;


always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_ramp2ahbmst_data <= 32'h0;
		rxdb_ramn2ahbmst_data <= 32'h0;
	end
	else if(rxdb_db2ahbmst_data_valid)
	begin
		if(rxdb_read_ramp)
		begin
			rxdb_ramp2ahbmst_data <= rxdb_pe2fifo_wdata;
			rxdb_ramn2ahbmst_data <= 32'h0;
		end
		else if(rxdb_read_ramn)
		begin
			rxdb_ramp2ahbmst_data <= 32'h0;
			rxdb_ramn2ahbmst_data <= rxdb_pe2fifo_wdata;
		end
		else
		begin
			rxdb_ramp2ahbmst_data <= rxdb_ramp2ahbmst_data;
			rxdb_ramn2ahbmst_data <= rxdb_ramn2ahbmst_data;
		end
	end
	else
	begin
		rxdb_ramp2ahbmst_data <= rxdb_ramp2ahbmst_data;
		rxdb_ramn2ahbmst_data <= rxdb_ramn2ahbmst_data;
	end
end

//===============================================
// address from ahbmst to ram
// each ram is 1k bytes = 256 words
//===============================================

reg			[ 7:0]				rxdb_ramp2ahbmst_address;
reg			[ 7:0]				rxdb_ramn2ahbmst_address;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_ramp2ahbmst_address <= 8'hff;
		rxdb_ramn2ahbmst_address <= 8'hff;
	end
	else if(rxdb_ahbmst_clr)
	begin
		rxdb_ramp2ahbmst_address <= 8'hff;
		rxdb_ramn2ahbmst_address <= 8'hff;
	end
	else if(rxdb_db2ahbmst_data_valid)
	begin
		if(rxdb_read_ramp)
		begin
			rxdb_ramp2ahbmst_address <= rxdb_ramp2ahbmst_address + 1'b1;
			rxdb_ramn2ahbmst_address <= rxdb_ramn2ahbmst_address;
		end
		else if(rxdb_read_ramn)
		begin
			rxdb_ramp2ahbmst_address <= rxdb_ramp2ahbmst_address;
			rxdb_ramn2ahbmst_address <= rxdb_ramn2ahbmst_address + 1'b1;
		end
		else
		begin
			rxdb_ramp2ahbmst_address <= rxdb_ramp2ahbmst_address;
			rxdb_ramn2ahbmst_address <= rxdb_ramn2ahbmst_address;
		end
	end
	else
	begin
		rxdb_ramp2ahbmst_address <= rxdb_ramp2ahbmst_address;
		rxdb_ramn2ahbmst_address <= rxdb_ramn2ahbmst_address;
	end
end

//===============================================
// ram control from ahbmst to ram
//===============================================

reg								rxdb_ramp2ahbmst_wen;
reg								rxdb_ramn2ahbmst_wen;
reg								rxdb_ramp2ahbmst_cs;
reg								rxdb_ramn2ahbmst_cs;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_ramp2ahbmst_wen <= 1'b1;
		rxdb_ramn2ahbmst_wen <= 1'b1;
		rxdb_ramp2ahbmst_cs <= 1'b0;
		rxdb_ramn2ahbmst_cs <= 1'b0;
	end
	else if(rxdb_db2ahbmst_data_valid)
	begin
		if(rxdb_read_ramp)
		begin
			rxdb_ramp2ahbmst_wen <= 1'b0;
			rxdb_ramn2ahbmst_wen <= 1'b1;
			rxdb_ramp2ahbmst_cs <= 1'b1;
			rxdb_ramn2ahbmst_cs <= 1'b0;
		end
		else if(rxdb_read_ramn)
		begin
			rxdb_ramp2ahbmst_wen <= 1'b1;
			rxdb_ramn2ahbmst_wen <= 1'b0;
			rxdb_ramp2ahbmst_cs <= 1'b0;
			rxdb_ramn2ahbmst_cs <= 1'b1;
		end
		else
		begin
			rxdb_ramp2ahbmst_wen <= rxdb_ramp2ahbmst_wen;
			rxdb_ramn2ahbmst_wen <= rxdb_ramn2ahbmst_wen;
			rxdb_ramp2ahbmst_cs <= rxdb_ramp2ahbmst_cs;
			rxdb_ramn2ahbmst_cs <= rxdb_ramn2ahbmst_cs;
		end
	end
	else
	begin
		rxdb_ramp2ahbmst_wen <= 1'b1;
		rxdb_ramn2ahbmst_wen <= 1'b1;
		rxdb_ramp2ahbmst_cs <= 1'b0;
		rxdb_ramn2ahbmst_cs <= 1'b0;
	end
end

//===============================================
// async fifo operation in ahb end
// clk domain: ahb clk
// Due to pipeline in reading data from rams,
// the first data from rams is invalid.
// Thus, tx_fifo_we should delay 2 clks.
// (1 in ram and 2 in address delay)
//===============================================

wire							rxdb_fifo2ram_rdreq;
wire							rxdb_fifo2ram_rdreq_f;
wire							rxdb_fifo2ram_process_data_valid_2d;

sync_ff_2d u_rxdb_fifo2ram_data_valid_2d
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(rxdb_fifo2ram_process_data_valid),
	.Y							(rxdb_fifo2ram_process_data_valid_2d)
);

sync_ff u_rxdb_fifo2ram_rdreq
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(rxdb_fifo2ram_process_data_valid_2d),
	.Y							(rxdb_fifo2ram_rdreq)
);

negedge_detect u_rxdb_fifo2ram_once_process_done 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(rxdb_fifo2ram_rdreq),
	.Y							(rxdb_fifo2ram_rdreq_f)
);

reg								rxdb_ram2fifo_once_process_done_temp;
assign rxdb_ram2fifo_once_process_done = rxdb_ram2fifo_once_process_done_temp || rxdb_ram2fifo_wrreq_f;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_ram2fifo_once_process_done_temp <= 1'b0;
	end
	else if(rxdb_ahbmst_clr || rxdb_fifo2ram_once_start)
	begin
		rxdb_ram2fifo_once_process_done_temp <= 1'b0;
	end
	else if(rxdb_ram2fifo_wrreq_f)
	begin
		rxdb_ram2fifo_once_process_done_temp <= 1'b1;
	end
	else
	begin
		rxdb_ram2fifo_once_process_done_temp <= rxdb_ram2fifo_once_process_done_temp;
	end
end

//===============================================
// address from fifo to ram
// each ram is 1k bytes = 256 words
//===============================================

reg			[ 7:0]				rxdb_fifo2ramp_address;
reg			[ 7:0]				rxdb_fifo2ramn_address;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_fifo2ramp_address <= 8'hff;
		rxdb_fifo2ramn_address <= 8'hff;
	end
	else if(rxdb_ahbmst_clr)
	begin
		rxdb_fifo2ramp_address <= 8'hff;
		rxdb_fifo2ramn_address <= 8'hff;
	end
//	else if(rxdb_ram2fifo_process_doing)
	else if(rxdb_ram2fifo_process_data_valid)
	begin
		if(rxdb_write_ramp)
		begin
			rxdb_fifo2ramp_address <= rxdb_fifo2ramp_address + 1'b1;
			rxdb_fifo2ramn_address <= rxdb_fifo2ramn_address;
		end
		else if(rxdb_write_ramn)
		begin
			rxdb_fifo2ramp_address <= rxdb_fifo2ramp_address;
			rxdb_fifo2ramn_address <= rxdb_fifo2ramn_address + 1'b1;
		end
		else
		begin
			rxdb_fifo2ramp_address <= rxdb_fifo2ramp_address;
			rxdb_fifo2ramn_address <= rxdb_fifo2ramn_address;
		end
	end
	else
	begin
		rxdb_fifo2ramp_address <= rxdb_fifo2ramp_address;
		rxdb_fifo2ramn_address <= rxdb_fifo2ramn_address;
	end
end

//===============================================
// ram control from fifo to ram
//===============================================

reg								rxdb_fifo2ramp_wen;
reg								rxdb_fifo2ramn_wen;
reg								rxdb_fifo2ramp_cs;
reg								rxdb_fifo2ramn_cs;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_fifo2ramp_wen <= 1'b1;
		rxdb_fifo2ramn_wen <= 1'b1;
		rxdb_fifo2ramp_cs <= 1'b0;
		rxdb_fifo2ramn_cs <= 1'b0;
	end
	else if(rxdb_fifo2ram_process_data_valid)
	begin
		if(rxdb_read_ramp)
		begin
			rxdb_fifo2ramp_wen <= 1'b1;
			rxdb_fifo2ramn_wen <= 1'b1;
			rxdb_fifo2ramp_cs <= 1'b1;
			rxdb_fifo2ramn_cs <= 1'b0;
		end
		else if(rxdb_read_ramn)
		begin
			rxdb_fifo2ramp_wen <= 1'b1;
			rxdb_fifo2ramn_wen <= 1'b1;
			rxdb_fifo2ramp_cs <= 1'b0;
			rxdb_fifo2ramn_cs <= 1'b1;
		end
		else
		begin
			rxdb_fifo2ramp_wen <= 1'b1;
			rxdb_fifo2ramn_wen <= 1'b1;
			rxdb_fifo2ramp_cs <= 1'b0;
			rxdb_fifo2ramn_cs <= 1'b0;
		end
	end
	else
	begin
		rxdb_fifo2ramp_wen <= 1'b1;
		rxdb_fifo2ramn_wen <= 1'b1;
		rxdb_fifo2ramp_cs <= 1'b0;
		rxdb_fifo2ramn_cs <= 1'b0;
	end
end

//===============================================
// data from ram to fifo
//===============================================

wire		[31:0]				rxdb_fifo2ramp_q;
wire		[31:0]				rxdb_fifo2ramn_q;
reg			[31:0]				rxdb_fifo2ram_wdata;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		rxdb_fifo2ram_wdata <= 32'h0;
	end
	else if(rxdb_fifo2ram_process_data_valid_2d)
	begin
		if(rxdb_read_ramp)
		begin
			rxdb_fifo2ram_wdata <= rxdb_fifo2ramp_q;
		end
		else if(rxdb_read_ramn)
		begin
			rxdb_fifo2ram_wdata <= rxdb_fifo2ramn_q;
		end
		else
		begin
			rxdb_fifo2ram_wdata <= rxdb_fifo2ram_wdata;
		end
	end
	else
	begin
		rxdb_fifo2ram_wdata <= 32'h0;
	end
end

//===============================================
// ram mux
// pingpong operation
// 1. data from ahbmst to ramp & data from ramn to fifo
// 2. data from ahbmst to ramn & data from ramp to fifo
// using combinational logic to meet ahb operations
//===============================================

wire	[ 7:0]				ramp_address;
wire						ramp_wen;
wire						ramp_cs;
wire	[ 7:0]				ramn_address;
wire						ramn_wen;
wire						ramn_cs;

assign ramp_address = rxdb_write_ramp ? rxdb_fifo2ramp_address : (rxdb_read_ramp ? rxdb_ramp2ahbmst_address : 8'h0);
assign ramn_address = rxdb_write_ramn ? rxdb_fifo2ramn_address : (rxdb_read_ramn ? rxdb_ramn2ahbmst_address : 8'h0);
assign ramp_wen = rxdb_write_ramp ? rxdb_fifo2ramp_wen : (rxdb_read_ramp ? rxdb_ramp2ahbmst_wen : 8'h0);
assign ramn_wen = rxdb_write_ramn ? rxdb_fifo2ramn_wen : (rxdb_read_ramn ? rxdb_ramn2ahbmst_wen : 8'h0);
assign ramp_cs = rxdb_write_ramp ? rxdb_fifo2ramp_cs : (rxdb_read_ramp ? rxdb_ramp2ahbmst_cs : 8'h0);
assign ramn_cs = rxdb_write_ramn ? rxdb_fifo2ramn_cs : (rxdb_read_ramn ? rxdb_ramn2ahbmst_cs : 8'h0);

//===============================================
// eth mac tx fifo
// ahb hclk fifo write from eth dma
// mac clk fifo read from eth mac tx protocol engine
// 2 kbytes = 512 words
//
// pingpong operation
//
// substitution:
//
// ahb clk
// ram 2k(1+1)
// ahb clk
// async fifo 4word
// tx clk
//===============================================

sp_sram_1k_256x32_wrapper u_eth_mac_tx_ram_p
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.wen						(ramp_wen),
	.cs							(ramp_cs),
	.addr						(ramp_address),
	.data						(rxdb_fifo2ramp_q),
	.q							(rxdb_ahbmst2ramp_data)
);

sp_sram_1k_256x32_wrapper u_eth_mac_tx_ram_n
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.wen						(ramn_wen),
	.cs							(ramn_cs),
	.addr						(ramn_address),
	.data						(rxdb_fifo2ramn_q),
	.q							(rxdb_ahbmst2ramn_data)
);

fifo_async 
#(
	.ADDR_WIDTH					(3), 
	.DATA_WIDTH					(32)
)          
u_eth_mac_rx_fifo
(                                           
	.wr_clk						(pe_rx_clk),
	.rd_clk						(ahb_hclk),
	.wr_rstn					(pe_tx_rstn),
	.rd_rstn					(ahb_hrstn),
                                       
	.wr_req						(rxdb_pe2fifo_wrreq),
	.rd_req						(rxdb_fifo2ram_rdreq),
	.rd_empty					(rxdb_fifo2ram_empty),
	.wr_full					(rxdb_fifo2pe_full),
	.wr_fifo_num				(rxdb_fifo_wrnum),
	.rd_fifo_num				(),                                

	.data						(rxdb_pe2fifo_wdata),
	.q							(rxdb_fifo2ram_rdata)
);

endmodule


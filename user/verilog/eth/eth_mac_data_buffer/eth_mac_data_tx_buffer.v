//===============================================
//
//	File: eth_mac_data_tx_buffer.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 05022024
//	Version: v1.0
//
// 	This is data buffer for ethernet mac tx.
//	Two mode can be selected for tx data buffer.
//	AHB bus clk must be higher than eth pe core tx clk.
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
//	writen into ram.
//
//	Mode 2: auto retransmission (reserve)
//	In this method, 2 modes above are both able to choose.
//	However, no data will push into ram from ahb master
//	in order to preserve old data.
//
//===============================================

module eth_mac_data_tx_buffer
(
	// ahb master
	input						ahb_hclk,
	input						ahb_hrstn,

	// pe core clk & rstn
	input						pe_tx_clk,
	input						pe_tx_rstn,

	// data interface with ahb master
	input						txdb_ahbmst2db_singleack,// start each transfer from ahb master ack
	input						txdb_ahbmst2db_burstack,// start each transfer from ahb master ack
	input						txdb_ahbmst2db_once_single_finish,// end each transfer from ahb master transctrl
	input						txdb_ahbmst2db_once_burst_finish,// end each transfer from ahb master transctrl
	input						txdb_ahbmst2db_once_finish,// end each transfer from ahb master transctrl
	output reg					txdb_db2ahbmst_singlereq,// request to ahb master to write data
	output reg					txdb_db2ahbmst_burstreq,// request to ahb master to write data
	input 	 	[31:0]			txdb_ahbmst2db_data,	
	input 	 					txdb_ahbmst2db_data_valid,	

	// data interface with pe core
	input						txdb_pe2fifo_rdreq,
	input						txdb_pe2fifo_rdreq_done,
	output		[31:0]			txdb_fifo2pe_rdata,
	output						txdb_fifo2pe_empty,
	output						txdb_fifo2pe_done,
	output						txdb_fifo2pe_burst_process_done,// whether pe should handle burst or single data
	output						txdb_fifo2pe_single_process_done,// whether pe should handle burst or single data
	output reg					txdb_data_ready,// informing pe core for reading data

	// tx data buffer process control
	input						txdb_process_doing,// start whole write process
	input						txdb_process_start,// pulse, start whole write process
	input						txdb_pe_tx_end,
	output						txdb_process_finish,// pulse, whole write process is done

	// reg interface
	input		[11:0]			r_tx_length,

	// logic clear control
	input						ahbmst_logic_clr,
	input						txdb_logic_clr

//	// interrupt status
//	output						int_status_txdb_process_finish
);

wire							txdb_ahbmst_clr;
wire							txdb_data_clr;
reg								txdb_ahbmst2ram_process_done;// using to indicate whether all data are pushed into ram or not
reg								txdb_ahbmst2ram_once_process_done;
wire							txdb_ram2fifo_once_process_done;// using to indicate whether all data are poped from fifo or not
reg								txdb_ram2fifo_process_doing;	
wire							txdb_pe2fifo_once_process_finish_bf;// clk domain: pe tx clk
wire							txdb_pe2fifo_once_process_finish_af;
reg								txdb_pe2fifo_once_process_valid;
//reg								txdb_fifo2pe_data_ready;
wire							txdb_once_process_done;
wire							txdb_pe_tx_end_af;
assign txdb_ahbmst_clr = ahbmst_logic_clr || txdb_process_finish;// ahb2ram clr occurs when clr from reg or process done ???
assign txdb_data_clr = txdb_logic_clr || txdb_process_finish;// fifo2pe clr occurs when clr from reg or process done ???

//===============================================
// tx data buffer fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						TXDB_IDLE = 6'b00001;
localparam						TXDB_FIRST_TRANSFER = 6'b000010;
localparam						TXDB_WRITE_RAMP_READ_FIFON = 6'b000100;
localparam						TXDB_WRITE_RAMN_READ_FIFOP = 6'b001000;
localparam						TXDB_LAST_TRANSFER = 6'b010000;
localparam						TXDB_WAIT_TX_DONE = 6'b100000;

//last trans
//
reg				[ 5:0]			current_state;
reg				[ 5:0]			next_state;

reg								txdb_state_idle;
reg								txdb_state_first_transfer;
reg								txdb_state_write_ramp_read_fifon;
reg								txdb_state_write_ramn_read_fifop;
reg								txdb_state_last_transfer;
reg								txdb_state_wait_tx_done;
reg								txdb_state_first_transfer_and_write_ramn_read_fifop;// reducing combinational logic complexity
wire							txdb_state_idle_to_first_transfer;
wire							txdb_state_first_transfer_to_write_ramn_read_fifop;
wire							txdb_state_first_transfer_to_last_transfer;
wire							txdb_state_write_ramp_read_fifon_to_last_transfer;
wire							txdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop;
wire							txdb_state_write_ramn_read_fifop_to_last_transfer;
wire							txdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon;
wire							txdb_state_last_transfer_to_wait_tx_done;
wire							txdb_state_wait_tx_done_to_idle;

// state transition: sequential logic circuit
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
		current_state <= TXDB_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// TXDB_IDLE:
// -> TXDB_FIRST_TRANSFER: tx process start
// TXDB_FIRST_TRANSFER:
// -> TXDB_WRITE_RAMN_READ_FIFOP : the first bunch of data has been pushed from ahbmst to ram and still remaining
// -> TXDB_LAST_TRANSFER: the first bunch of data has been pushed from ahbmst to ram and no more data will be doing this again
// TXDB_WRITE_RAMP_READ_FIFON:
// -> TXDB_WRITE_RAMN_READ_FIFOP : pingpong operation, data is transferring from ahbmst to one ram and from the other ram to fifo
// -> TXDB_LAST_TRANSFER: all data has been pushed from ahbmst to ram but still a group of data has not pop from ram
// TXDB_WRITE_RAMN_READ_FIFOP:
// -> TXDB_WRITE_RAMP_READ_FIFON : pingpong operation, data is transferring from ahbmst to one ram and from the other ram to fifo
// -> TXDB_LAST_TRANSFER: all data has been pushed from ahbmst to ram but still a group of data has not pop from ram
// TXDB_LAST_TRANSFER: 
// -> TXDB_IDLE: the last bunch of data has been poped from ram to fifo
// All state should transition to TXDB_IDLE when:
// 1. received related dma logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	TXDB_IDLE:
		if(txdb_state_idle_to_first_transfer)
			next_state = TXDB_FIRST_TRANSFER;
		else
			next_state = TXDB_IDLE;
	TXDB_FIRST_TRANSFER:
		if(ahbmst_logic_clr)
			next_state = TXDB_IDLE;
		else if(txdb_state_first_transfer_to_last_transfer)
			next_state = TXDB_LAST_TRANSFER;
		else if(txdb_state_first_transfer_to_write_ramn_read_fifop)
			next_state = TXDB_WRITE_RAMN_READ_FIFOP;
		else
			next_state = TXDB_FIRST_TRANSFER;
	TXDB_WRITE_RAMP_READ_FIFON:
		if(ahbmst_logic_clr)
			next_state = TXDB_IDLE;
		else if(txdb_state_write_ramp_read_fifon_to_last_transfer)
			next_state = TXDB_LAST_TRANSFER;
		else if(txdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop)
			next_state = TXDB_WRITE_RAMN_READ_FIFOP;
		else
			next_state = TXDB_WRITE_RAMP_READ_FIFON;
	TXDB_WRITE_RAMN_READ_FIFOP:
		if(ahbmst_logic_clr)
			next_state = TXDB_IDLE;
		else if(txdb_state_write_ramn_read_fifop_to_last_transfer)
			next_state = TXDB_LAST_TRANSFER;
		else if(txdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon)
			next_state = TXDB_WRITE_RAMP_READ_FIFON;
		else
			next_state = TXDB_WRITE_RAMN_READ_FIFOP;
	TXDB_LAST_TRANSFER:
		if(ahbmst_logic_clr)
			next_state = TXDB_IDLE;
		else if(txdb_state_last_transfer_to_wait_tx_done)
			next_state = TXDB_WAIT_TX_DONE;
		else
			next_state = TXDB_LAST_TRANSFER;
	TXDB_WAIT_TX_DONE:
		if(ahbmst_logic_clr)
			next_state = TXDB_IDLE;
		else if(txdb_state_wait_tx_done_to_idle)
			next_state = TXDB_IDLE;
		else
			next_state = TXDB_WAIT_TX_DONE;
	default:
		next_state = TXDB_IDLE;
	endcase
end

// state output: sequential logic circuit/
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_state_idle <= 1'b1;
		txdb_state_first_transfer <= 1'b0;
		txdb_state_write_ramp_read_fifon <= 1'b0;
		txdb_state_write_ramn_read_fifop <= 1'b0;
		txdb_state_last_transfer <= 1'b0;
		txdb_state_first_transfer_and_write_ramn_read_fifop <= 1'b0;
	end
	else
	begin
		txdb_state_idle <= next_state == TXDB_IDLE;
		txdb_state_first_transfer <= next_state == TXDB_FIRST_TRANSFER; 
		txdb_state_write_ramp_read_fifon <= next_state == TXDB_WRITE_RAMP_READ_FIFON; 
		txdb_state_write_ramn_read_fifop <= next_state == TXDB_WRITE_RAMN_READ_FIFOP; 
		txdb_state_last_transfer <= next_state == TXDB_LAST_TRANSFER; 
		txdb_state_first_transfer_and_write_ramn_read_fifop <= ((next_state == TXDB_FIRST_TRANSFER) || (next_state == TXDB_WRITE_RAMP_READ_FIFON));
	end
end

//===============================================
// state conditions judgement
//===============================================

assign txdb_process_finish = txdb_state_wait_tx_done_to_idle; 
//assign txdb_once_process_done = txdb_ahbmst2ram_once_process_done && txdb_ram2fifo_once_process_done && (txdb_pe2fifo_once_process_finish_af && ~txdb_data_ready);
//assign txdb_once_process_done = txdb_ahbmst2ram_once_process_done && txdb_ram2fifo_once_process_done && (txdb_pe2fifo_once_process_valid ? txdb_pe2fifo_once_process_finish_af : 1'b1);//In first 2 trans, tx fifo is not involved in.
assign txdb_once_process_done = txdb_ahbmst2ram_once_process_done && txdb_ram2fifo_once_process_done && (txdb_data_ready ? txdb_pe2fifo_once_process_finish_af : 1'b1);//In first 2 trans, tx fifo is not involved in.
assign txdb_state_idle_to_first_transfer = txdb_process_start;
assign txdb_state_first_transfer_to_write_ramn_read_fifop = txdb_state_first_transfer && txdb_ahbmst2ram_once_process_done; 
assign txdb_state_first_transfer_to_last_transfer = txdb_state_first_transfer && txdb_state_first_transfer_to_write_ramn_read_fifop && txdb_ahbmst2ram_process_done; 
assign txdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop = txdb_state_write_ramp_read_fifon && txdb_once_process_done;
assign txdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon = txdb_state_write_ramn_read_fifop && txdb_once_process_done;
assign txdb_state_write_ramp_read_fifon_to_last_transfer = txdb_state_write_ramp_read_fifon && txdb_once_process_done && txdb_ahbmst2ram_process_done;
assign txdb_state_write_ramn_read_fifop_to_last_transfer = txdb_state_write_ramn_read_fifop && txdb_once_process_done && txdb_ahbmst2ram_process_done;
//assign txdb_state_last_transfer_to_idle = txdb_state_last_transfer && txdb_ram2fifo_once_process_done && (txdb_pe2fifo_once_process_finish_af && ~txdb_data_ready);
assign txdb_state_last_transfer_to_wait_tx_done = txdb_state_last_transfer && txdb_ram2fifo_once_process_done && txdb_pe2fifo_once_process_finish_af;
assign txdb_state_wait_tx_done_to_idle = txdb_pe_tx_end_af;

//===============================================
// flow control pingpong operation
// 1. data from ahbmst to ramp and from ramn to fifo
// 2. data from ahbmst to ramn and from ramp to fifo
// Each once start will rise when 'next state' signal
// rises.
// Requests to ahb master will also rise when 'next
// state' signal rises.
// Data will push into or pop from ram when next state has been
// transferred.
//
// txdb_write/read_ramx singals are only used to
// judge whether the trans is reading or writing and
// whether the destination is p or n.
// The control singal is using data valid seperately
// instead of those signals.
//===============================================

wire 							txdb_ahbmst2ramp_once_start; 
wire 							txdb_ahbmst2ramn_once_start; 
wire 							txdb_ahbmst2ramp_once_finish; 
wire 							txdb_ahbmst2ramn_once_finish; 
wire							txdb_ahbmst2ram_once_start;
wire 							txdb_ramp2fifo_once_start; 
wire 							txdb_ramn2fifo_once_start; 
wire							txdb_ram2fifo_once_start;
wire							txdb_ram2fifo_once_ram_finish;
reg								txdb_write_ramp;
reg								txdb_write_ramn;
reg								txdb_read_ramn;
reg								txdb_read_ramp;
assign txdb_ahbmst2ramn_once_start = txdb_state_first_transfer_to_write_ramn_read_fifop || txdb_state_write_ramp_read_fifon_to_write_ramn_read_fifop;
assign txdb_ahbmst2ramp_once_start = txdb_state_idle_to_first_transfer || txdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon;
assign txdb_ahbmst2ram_once_start = txdb_ahbmst2ramp_once_start || txdb_ahbmst2ramn_once_start;
assign txdb_ramp2fifo_once_start = txdb_ahbmst2ramn_once_start || txdb_state_write_ramp_read_fifon_to_last_transfer;
assign txdb_ramn2fifo_once_start = txdb_state_write_ramn_read_fifop_to_write_ramp_read_fifon || txdb_state_write_ramn_read_fifop_to_last_transfer;
assign txdb_ram2fifo_once_start = txdb_ramp2fifo_once_start || txdb_ramn2fifo_once_start;
// don't care in last transfer
assign txdb_ahbmst2ramp_once_finish = txdb_ahbmst2ram_once_process_done && (txdb_state_first_transfer || txdb_state_write_ramp_read_fifon);
assign txdb_ahbmst2ramn_once_finish = txdb_ahbmst2ram_once_process_done && (txdb_state_write_ramn_read_fifop);

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_write_ramp <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ahbmst2ramp_once_finish)
	begin
		txdb_write_ramp <= 1'b0;
	end
	else if(txdb_ahbmst2ramp_once_start)
	begin
		txdb_write_ramp <= 1'b1;
	end
	else
	begin
		txdb_write_ramp <= txdb_write_ramp;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_write_ramn <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ahbmst2ramn_once_finish)
	begin
		txdb_write_ramn <= 1'b0;
	end
	else if(txdb_ahbmst2ramn_once_start)
	begin
		txdb_write_ramn <= 1'b1;
	end
	else
	begin
		txdb_write_ramn <= txdb_write_ramn;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_read_ramp <= 1'b0;
	end
	else if(txdb_ahbmst_clr || (txdb_ram2fifo_once_process_done && txdb_read_ramp))
	begin
		txdb_read_ramp <= 1'b0;
	end
	else if(txdb_ramp2fifo_once_start)
	begin
		txdb_read_ramp <= 1'b1;
	end
	else
	begin
		txdb_read_ramp <= txdb_read_ramp;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_read_ramn <= 1'b0;
	end
	else if(txdb_ahbmst_clr || (txdb_ram2fifo_once_process_done && txdb_read_ramn))
	begin
		txdb_read_ramn <= 1'b0;
	end
	else if(txdb_ramn2fifo_once_start)
	begin
		txdb_read_ramn <= 1'b1;
	end
	else
	begin
		txdb_read_ramn <= txdb_read_ramn;
	end
end

//===============================================
// data cnt
// Once burst transfer is 4words = 16bytes.
// The unit of cnt is word.
// The unit of r_tx_length is byte.
// Thus: 
// If txdb_burst_cnt > r_tx_length[11:4],
// burst transfer should continue.
// If txdb_single_cnt > r_tx_length[3:2],
// single transfer should continue.
// If r_tx_length[1:0] != 0,
// another single or burst transfer should operate.
//
// Burst first and then single.
// Single transfer must occur after all burst transfer
// finish. Thus, last transfer must be single tranfer
// if the number of remaining data is less than
// 4 words.
//===============================================

reg			[ 7:0]				txdb_burst_cnt;
reg			[ 1:0]				txdb_single_cnt;
reg								txdb_burst_process_doing;
reg								txdb_single_process_doing;
reg								txdb_last_process_is_burst;
reg								txdb_last_process_is_single;
wire							txdb_data_cnt_burst_done;
wire							txdb_data_cnt_single_done;
wire							txdb_remaining_burst;// for burst request
wire							txdb_remaining_single;// for single request
wire 							txdb_db2ahbmst_singlereq_r;
wire 							txdb_db2ahbmst_burstreq_r;
wire		[11:0]				r_tx_length_real;

assign r_tx_length_real = (r_tx_length[1:0] > 2'h0) ? (r_tx_length + 4'h4) : r_tx_length;// another transfer 
assign txdb_data_cnt_burst_done = (txdb_process_doing && (txdb_burst_cnt >= r_tx_length_real[11:4])) ? 1'b1 : 1'b0;	
assign txdb_data_cnt_single_done = (txdb_process_doing && (txdb_single_cnt >= r_tx_length_real[3:2])) ? 1'b1 : 1'b0;// if less than 1word should transfer another once(in reg +1)	
assign txdb_remaining_burst = ~txdb_data_cnt_burst_done;
assign txdb_remaining_single = ~txdb_data_cnt_single_done && txdb_data_cnt_burst_done;

// unit is 4 words
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_burst_cnt <= 8'h0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_burst_cnt <= 8'h0;
	end
	else
	begin
		if(txdb_db2ahbmst_burstreq_r)
		begin
			txdb_burst_cnt <= txdb_burst_cnt + 1'b1;
		end
		else
		begin
			txdb_burst_cnt <= txdb_burst_cnt;
		end
	end
end

// unit is 1 word
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_single_cnt <= 2'h0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_single_cnt <= 2'h0;
	end
	else
	begin
		if(txdb_db2ahbmst_singlereq_r)
		begin
			txdb_single_cnt <= txdb_single_cnt + 1'b1;
		end
		else
		begin
			txdb_single_cnt <= txdb_single_cnt;
		end
	end
end

//// burst transfer cnt
//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		tx_data_once_cnt <= 3'h0;
//	end
//	else if(txdb_ahbmst_clr)
//	begin
//		tx_data_once_cnt <= 3'h0;
//	end
//	else if(txdb_remaining_burst)
//	begin
//	end


always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_burst_process_doing <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_burst_process_doing <= 1'b0;
	end
	else if(txdb_ahbmst2ram_once_start)
	begin
		if(txdb_remaining_burst)
		begin
			txdb_burst_process_doing <= 1'b1;
		end
		else
		begin
			txdb_burst_process_doing <= 1'b0;
		end
	end
	else
	begin
		txdb_burst_process_doing <= txdb_burst_process_doing;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_single_process_doing <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_single_process_doing <= 1'b0;
	end
	else if(txdb_ahbmst2ram_once_start)
	begin
		if(txdb_remaining_single)
		begin
			txdb_single_process_doing <= 1'b1;
		end
		else
		begin
			txdb_single_process_doing <= 1'b0;
		end
	end
	else
	begin
		txdb_single_process_doing <= txdb_single_process_doing;
	end
end



//===============================================
// request handle
// only working when a new operation
// Each request should rise when state transfer and
// still remaining data.
//===============================================

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_db2ahbmst_burstreq <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ahbmst2db_burstack)
	begin
		txdb_db2ahbmst_burstreq <= 1'b0;
	end
	else if(txdb_remaining_burst && txdb_ahbmst2ram_once_start)
	begin
		txdb_db2ahbmst_burstreq <= 1'b1;
	end
	else
	begin
		txdb_db2ahbmst_burstreq <= txdb_db2ahbmst_burstreq;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_db2ahbmst_singlereq <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ahbmst2db_singleack)
	begin
		txdb_db2ahbmst_singlereq <= 1'b0;
	end
	else if(txdb_remaining_single && txdb_ahbmst2ram_once_start)
	begin
		txdb_db2ahbmst_singlereq <= 1'b1;
	end
	else
	begin
		txdb_db2ahbmst_singlereq <= txdb_db2ahbmst_singlereq;
	end
end

posedge_detect u_singlereg_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(txdb_db2ahbmst_singlereq),
	.Y							(txdb_db2ahbmst_singlereq_r)
);

posedge_detect u_burstreg_detect 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.A							(txdb_db2ahbmst_burstreq),
	.Y							(txdb_db2ahbmst_burstreq_r)
);



//===============================================
// process done generation
// If length can be divided without reminder by 4 words,
// the last transfer must be burst.
// If length cannot be divided without reminder by 4 words,
// the last transfer must be single.
// Also, single transfer must be after all burst transfer.
//
// ahb2ram process done must occur after the whole
// tx data buffer preparation process.
//===============================================

//wire							txdb_ahbmst2ram_max;
//reg		[2:0]					txdb_ahbmst2ram_cnt;
//assign txdb_ahbmst2ram_max = (txdb_ahbmst2ram_cnt == 3'h4);// Here is 5 not 4, because the delay between ramq and ctrl is 1 clk.
//
//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		txdb_ahbmst2ram_cnt <= 3'h0;
//	end
//	else if(txdb_ahbmst_clr || txdb_ahbmst2ram_max)
//	begin
//		txdb_ahbmst2ram_cnt <= 3'h0;
//	end
//	else if(txdb_ahbmst_readtrans_valid)
//	begin
//		txdb_ahbmst2ram_cnt <= txdb_ahbmst2ram_cnt + 1'b1;
//	end
//	// readtrans vaild may not be consistent due to hready
//	else
//	begin
//		txdb_ahbmst2ram_cnt <= txdb_ahbmst2ram_cnt;
//	end
//end
//
//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		txdb_ahbmst2ram_once_process_done <= 1'b0;
//	end
//	else if(txdb_ahbmst_clr || txdb_ahbmst2ram_once_start)
//	begin
//		txdb_ahbmst2ram_once_process_done <= 1'b0;
//	end
//	// single
//	else if(txdb_data_cnt_single_done)
//	begin
//		txdb_ahbmst2ram_once_process_done <= 1'b1;
//	// burst
//	else if(txdb_ahbmst2ram_max)
//	begin
//		txdb_ahbmst2ram_once_process_done <= 1'b1;
//	end
//	else
//	begin
//		txdb_ahbmst2ram_once_process_done <= txdb_ahbmst2ram_once_process_done;
//	end
//end

// maybe this cannot judge single condition
always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ahbmst2ram_once_process_done <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ahbmst2ram_once_start)
	begin
		txdb_ahbmst2ram_once_process_done <= 1'b0;
	end
	// burst
	else if(txdb_ahbmst2db_once_burst_finish)
	begin
		txdb_ahbmst2ram_once_process_done <= 1'b1;
	end
	// single
//	else if(txdb_data_cnt_single_done)
	else if(txdb_ahbmst2db_once_single_finish)
	begin
		txdb_ahbmst2ram_once_process_done <= 1'b1;
	end
	else
	begin
		txdb_ahbmst2ram_once_process_done <= txdb_ahbmst2ram_once_process_done;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ahbmst2ram_process_done <= 1'b0;
	end
	// clr after the whole process done
//	else if(txdb_ahbmst_clr || txdb_process_finish)
	else if(txdb_ahbmst_clr)//???
	begin
		txdb_ahbmst2ram_process_done <= 1'b0;
	end
	else if(txdb_ahbmst2db_once_single_finish)
	begin
		if(txdb_data_cnt_single_done)
		begin
			txdb_ahbmst2ram_process_done <= 1'b1;
		end
		else
		begin
			txdb_ahbmst2ram_process_done <= 1'b0;
		end
	end
	else if(txdb_ahbmst2db_once_burst_finish)
	begin
		if(txdb_data_cnt_single_done && txdb_data_cnt_burst_done)
		begin
			txdb_ahbmst2ram_process_done <= 1'b1;
		end
		else
		begin
			txdb_ahbmst2ram_process_done <= 1'b0;
		end
	end
//	// there is no need to transfer
//	else if(txdb_data_cnt_single_done && (r_tx_length[3:2] == 2'h0))
//	begin
//	end
//	// all single transfer are done
//	else if(txdb_data_cnt_single_done && txdb_ahbmst2db_singleack)
//	begin
//		txdb_ahbmst2ram_process_done <= 1'b1;
//	end
	else
	begin
		txdb_ahbmst2ram_process_done <= txdb_ahbmst2ram_process_done;
	end
end

//===============================================
// data from ahbmst to ram
//===============================================

reg			[31:0]				txdb_ahbmst2ramp_data;
reg			[31:0]				txdb_ahbmst2ramn_data;


always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ahbmst2ramp_data <= 32'h0;
		txdb_ahbmst2ramn_data <= 32'h0;
	end
	else if(txdb_ahbmst2db_data_valid)
	begin
		if(txdb_write_ramp)
		begin
			txdb_ahbmst2ramp_data <= txdb_ahbmst2db_data;
			txdb_ahbmst2ramn_data <= 32'h0;
		end
		else if(txdb_write_ramn)
		begin
			txdb_ahbmst2ramp_data <= 32'h0;
			txdb_ahbmst2ramn_data <= txdb_ahbmst2db_data;
		end
		else
		begin
			txdb_ahbmst2ramp_data <= txdb_ahbmst2ramp_data;
			txdb_ahbmst2ramn_data <= txdb_ahbmst2ramn_data;
		end
	end
	else
	begin
		txdb_ahbmst2ramp_data <= txdb_ahbmst2ramp_data;
		txdb_ahbmst2ramn_data <= txdb_ahbmst2ramn_data;
	end
end

//===============================================
// address from ahbmst to ram
// each ram is 1k bytes = 256 words
//===============================================

reg			[ 7:0]				txdb_ahbmst2ramp_address;
reg			[ 7:0]				txdb_ahbmst2ramn_address;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ahbmst2ramp_address <= 8'hff;
		txdb_ahbmst2ramn_address <= 8'hff;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_ahbmst2ramp_address <= 8'hff;
		txdb_ahbmst2ramn_address <= 8'hff;
	end
	else if(txdb_ahbmst2db_data_valid)
	begin
		if(txdb_write_ramp)
		begin
			txdb_ahbmst2ramp_address <= txdb_ahbmst2ramp_address + 1'b1;
			txdb_ahbmst2ramn_address <= txdb_ahbmst2ramn_address;
		end
		else if(txdb_write_ramn)
		begin
			txdb_ahbmst2ramp_address <= txdb_ahbmst2ramp_address;
			txdb_ahbmst2ramn_address <= txdb_ahbmst2ramn_address + 1'b1;
		end
		else
		begin
			txdb_ahbmst2ramp_address <= txdb_ahbmst2ramp_address;
			txdb_ahbmst2ramn_address <= txdb_ahbmst2ramn_address;
		end
	end
	else
	begin
		txdb_ahbmst2ramp_address <= txdb_ahbmst2ramp_address;
		txdb_ahbmst2ramn_address <= txdb_ahbmst2ramn_address;
	end
end

//===============================================
// ram control from ahbmst to ram
//===============================================

reg								txdb_ahbmst2ramp_wen;
reg								txdb_ahbmst2ramn_wen;
reg								txdb_ahbmst2ramp_cs;
reg								txdb_ahbmst2ramn_cs;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ahbmst2ramp_wen <= 1'b1;
		txdb_ahbmst2ramn_wen <= 1'b1;
		txdb_ahbmst2ramp_cs <= 1'b0;
		txdb_ahbmst2ramn_cs <= 1'b0;
	end
//	else if(txdb_ahbmst_clr)
//	begin
//		txdb_ahbmst2ramp_wen <= 1'b1;
//		txdb_ahbmst2ramn_wen <= 1'b1;
//		txdb_ahbmst2ramp_cs <= 1'b0;
//		txdb_ahbmst2ramn_cs <= 1'b0;
//	end
	else if(txdb_ahbmst2db_data_valid)
	begin
		if(txdb_write_ramp)
		begin
			txdb_ahbmst2ramp_wen <= 1'b0;
			txdb_ahbmst2ramn_wen <= 1'b1;
			txdb_ahbmst2ramp_cs <= 1'b1;
			txdb_ahbmst2ramn_cs <= 1'b0;
		end
		else if(txdb_write_ramn)
		begin
			txdb_ahbmst2ramp_wen <= 1'b1;
			txdb_ahbmst2ramn_wen <= 1'b0;
			txdb_ahbmst2ramp_cs <= 1'b0;
			txdb_ahbmst2ramn_cs <= 1'b1;
		end
		else
		begin
			txdb_ahbmst2ramp_wen <= txdb_ahbmst2ramp_wen;
			txdb_ahbmst2ramn_wen <= txdb_ahbmst2ramn_wen;
			txdb_ahbmst2ramp_cs <= txdb_ahbmst2ramp_cs;
			txdb_ahbmst2ramn_cs <= txdb_ahbmst2ramn_cs;
		end
	end
	else
	begin
		txdb_ahbmst2ramp_wen <= 1'b1;
		txdb_ahbmst2ramn_wen <= 1'b1;
		txdb_ahbmst2ramp_cs <= 1'b0;
		txdb_ahbmst2ramn_cs <= 1'b0;
	end
end

//===============================================
// async fifo operation process handle
// clk domain: ahb clk
//
// Fifo operation begins from second pingpong operation
// lasting to after pingpong operation done.
// Each time, 4 words data for burst or 1 word data
// for single is pushed into fifo.
//
// txdb_ram2fifo_cnt_max is used to count for data
// word pushed in to fifo from ram. The threshold is 
// depending on last transfer from ahb master to
// ram. Pay attention to the first transfer whose
// is an ahb master single transfer.
//
// txdb_fifo_space_valid is used to indicate the fifo
// space in order to avoid fifo overflow.
// If last transfer is burst transfer, the fifo must
// have more than 4 words space or equal.
// If last transfer is single transfer, the fifo must
// have more than 1 word space or equal.
//===============================================

wire							txdb_ram2fifo_cnt_max;
wire							txdb_fifo2ram_full;
wire	[3:0]					txdb_fifo_wrnum;
reg		[2:0]					txdb_ram2fifo_cnt;
reg								txdb_ram2fifo_process_data_valid;
reg								txdb_fifo_space_valid;
assign txdb_ram2fifo_cnt_max = (r_tx_length_real[11:4] != 8'h0) ? (txdb_last_process_is_single ? (txdb_ram2fifo_cnt == 3'h1) : (txdb_ram2fifo_cnt == 3'h4)) : (txdb_ram2fifo_cnt == 3'h1);
//assign txdb_ram2fifo_cnt_max = (txdb_ram2fifo_cnt == 3'h5);// Here is 5 not 4, because the delay between ramq and ctrl is 1 clk.
assign txdb_ram2fifo_once_ram_finish = txdb_ram2fifo_cnt_max;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ram2fifo_process_doing <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_ram2fifo_process_doing <= 1'b0;
	end
	else if(txdb_ram2fifo_once_start)
	begin
		txdb_ram2fifo_process_doing <= 1'b1;
	end
	else if(txdb_ram2fifo_once_process_done)
	begin
		txdb_ram2fifo_process_doing <= 1'b0;
	end
	else
	begin
		txdb_ram2fifo_process_doing <= txdb_ram2fifo_process_doing;
	end
end

//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
//		txdb_ram2fifo_once_process_done <= 1'b0;
//	end
//	else if(txdb_ahbmst_clr || txdb_ram2fifo_once_start)
//	begin
//		txdb_ram2fifo_once_process_done <= 1'b0;
//	end
//	else if(txdb_ram2fifo_cnt_max)
//	begin
//		txdb_ram2fifo_once_process_done <= 1'b1;
//	end
//	else
//	begin
//		txdb_ram2fifo_once_process_done <= txdb_ram2fifo_once_process_done;
//	end
//end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_fifo_space_valid <= 1'b1;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_fifo_space_valid <= 1'b1;
	end
	else if(txdb_fifo_wrnum > 4'h4)
	begin
		txdb_fifo_space_valid <= 1'b0;
	end
	else
	begin
		txdb_fifo_space_valid <= 1'b1;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ram2fifo_cnt <= 3'h0;
	end
	else if(txdb_ahbmst_clr || txdb_ram2fifo_once_process_done)
	begin
		txdb_ram2fifo_cnt <= 3'h0;
	end
	else if(txdb_ram2fifo_process_doing && txdb_fifo_space_valid)
	begin
		if(txdb_ram2fifo_cnt_max)
		begin
			txdb_ram2fifo_cnt <= txdb_ram2fifo_cnt;
		end
		else
		begin
			txdb_ram2fifo_cnt <= txdb_ram2fifo_cnt + 1'b1;
		end
	end
	else
	begin
		txdb_ram2fifo_cnt <= 3'h0;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ram2fifo_process_data_valid <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ram2fifo_cnt_max)
	begin
		txdb_ram2fifo_process_data_valid <= 1'b0;
	end
	else if(txdb_ram2fifo_process_doing && txdb_fifo_space_valid)
	begin
		txdb_ram2fifo_process_data_valid <= 1'b1;
	end
	else
	begin
		txdb_ram2fifo_process_data_valid <= 1'b0;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_last_process_is_burst <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_last_process_is_burst <= 1'b0;
	end
	else if(txdb_ram2fifo_once_process_done)
	begin
		if(txdb_burst_process_doing)
		begin
			txdb_last_process_is_burst <= 1'b1;
		end
		else
		begin
			txdb_last_process_is_burst <= 1'b0;
		end
	end
	else
	begin
		txdb_last_process_is_burst <= txdb_last_process_is_burst;
	end
end

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_last_process_is_single <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_last_process_is_single <= 1'b0;
	end
	else if(txdb_ram2fifo_once_process_done)
	begin
		if(txdb_single_process_doing)
		begin
			txdb_last_process_is_single <= 1'b1;
		end
		else
		begin
			txdb_last_process_is_single <= 1'b0;
		end
	end
	else
	begin
		txdb_last_process_is_single <= txdb_last_process_is_single;
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

wire							txdb_ram2fifo_wrreq;
wire							txdb_ram2fifo_wrreq_f;
wire							txdb_ram2fifo_process_data_valid_2d;

sync_ff_2d u_txdb_ram2fifo_data_valid_2d
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(txdb_ram2fifo_process_data_valid),
	.Y							(txdb_ram2fifo_process_data_valid_2d)
);

sync_ff u_txdb_ram2fifo_wrreq
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(txdb_ram2fifo_process_data_valid_2d),
	.Y							(txdb_ram2fifo_wrreq)
);

negedge_detect u_txdb_ram2fifo_once_process_done 
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),	
	.A							(txdb_ram2fifo_wrreq),
	.Y							(txdb_ram2fifo_wrreq_f)
);

reg								txdb_ram2fifo_once_process_done_temp;
assign txdb_ram2fifo_once_process_done = txdb_ram2fifo_once_process_done_temp || txdb_ram2fifo_wrreq_f;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ram2fifo_once_process_done_temp <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_ram2fifo_once_start)
	begin
		txdb_ram2fifo_once_process_done_temp <= 1'b0;
	end
	else if(txdb_ram2fifo_wrreq_f)
	begin
		txdb_ram2fifo_once_process_done_temp <= 1'b1;
	end
	else
	begin
		txdb_ram2fifo_once_process_done_temp <= txdb_ram2fifo_once_process_done_temp;
	end
end

//===============================================
// address from ram to fifo
// each ram is 1k bytes = 256 words
//===============================================

reg			[ 7:0]				txdb_ramp2fifo_address;
reg			[ 7:0]				txdb_ramn2fifo_address;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ramp2fifo_address <= 8'hff;
		txdb_ramn2fifo_address <= 8'hff;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_ramp2fifo_address <= 8'hff;
		txdb_ramn2fifo_address <= 8'hff;
	end
//	else if(txdb_ram2fifo_process_doing)
	else if(txdb_ram2fifo_process_data_valid)
	begin
		if(txdb_read_ramp)
		begin
			txdb_ramp2fifo_address <= txdb_ramp2fifo_address + 1'b1;
			txdb_ramn2fifo_address <= txdb_ramn2fifo_address;
		end
		else if(txdb_read_ramn)
		begin
			txdb_ramp2fifo_address <= txdb_ramp2fifo_address;
			txdb_ramn2fifo_address <= txdb_ramn2fifo_address + 1'b1;
		end
		else
		begin
			txdb_ramp2fifo_address <= txdb_ramp2fifo_address;
			txdb_ramn2fifo_address <= txdb_ramn2fifo_address;
		end
	end
	else
	begin
		txdb_ramp2fifo_address <= txdb_ramp2fifo_address;
		txdb_ramn2fifo_address <= txdb_ramn2fifo_address;
	end
end

//===============================================
// ram control from ram to fifo
//===============================================

reg								txdb_ramp2fifo_wen;
reg								txdb_ramn2fifo_wen;
reg								txdb_ramp2fifo_cs;
reg								txdb_ramn2fifo_cs;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ramp2fifo_wen <= 1'b1;
		txdb_ramn2fifo_wen <= 1'b1;
		txdb_ramp2fifo_cs <= 1'b0;
		txdb_ramn2fifo_cs <= 1'b0;
//		txdb_ram2fifo_wrreq <= 1'b0;
	end
//	else if(txdb_ahbmst_clr)
//	begin
//		txdb_ramp2fifo_wen <= 1'b1;
//		txdb_ramn2fifo_wen <= 1'b1;
//		txdb_ramp2fifo_cs <= 1'b0;
//		txdb_ramn2fifo_cs <= 1'b0;
//	end
	else if(txdb_ram2fifo_process_data_valid)
	begin
		if(txdb_read_ramp)
		begin
			txdb_ramp2fifo_wen <= 1'b1;
			txdb_ramn2fifo_wen <= 1'b1;
			txdb_ramp2fifo_cs <= 1'b1;
			txdb_ramn2fifo_cs <= 1'b0;
//			txdb_ram2fifo_wrreq <= 1'b1;
		end
		else if(txdb_read_ramn)
		begin
			txdb_ramp2fifo_wen <= 1'b1;
			txdb_ramn2fifo_wen <= 1'b1;
			txdb_ramp2fifo_cs <= 1'b0;
			txdb_ramn2fifo_cs <= 1'b1;
//			txdb_ram2fifo_wrreq <= 1'b1;
		end
		else
		begin
			txdb_ramp2fifo_wen <= 1'b1;
			txdb_ramn2fifo_wen <= 1'b1;
			txdb_ramp2fifo_cs <= 1'b0;
			txdb_ramn2fifo_cs <= 1'b0;
//			txdb_ram2fifo_wrreq <= 1'b0;
		end
	end
	else
	begin
		txdb_ramp2fifo_wen <= 1'b1;
		txdb_ramn2fifo_wen <= 1'b1;
		txdb_ramp2fifo_cs <= 1'b0;
		txdb_ramn2fifo_cs <= 1'b0;
//		txdb_ram2fifo_wrreq <= 1'b0;
	end
end

//===============================================
// data from ram to fifo
//===============================================

wire		[31:0]				txdb_ramp2fifo_q;
wire		[31:0]				txdb_ramn2fifo_q;
reg			[31:0]				txdb_ram2fifo_wdata;

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_ram2fifo_wdata <= 32'h0;
	end
	else if(txdb_ram2fifo_process_data_valid_2d)
	begin
		if(txdb_read_ramp)
		begin
			txdb_ram2fifo_wdata <= txdb_ramp2fifo_q;
		end
		else if(txdb_read_ramn)
		begin
			txdb_ram2fifo_wdata <= txdb_ramn2fifo_q;
		end
		else
		begin
			txdb_ram2fifo_wdata <= txdb_ram2fifo_wdata;
		end
	end
	else
	begin
		txdb_ram2fifo_wdata <= 32'h0;
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

assign ramp_address = txdb_write_ramp ? txdb_ahbmst2ramp_address : (txdb_read_ramp ? txdb_ramp2fifo_address : 8'h0);
assign ramn_address = txdb_write_ramn ? txdb_ahbmst2ramn_address : (txdb_read_ramn ? txdb_ramn2fifo_address : 8'h0);
assign ramp_wen = txdb_write_ramp ? txdb_ahbmst2ramp_wen : (txdb_read_ramp ? txdb_ramp2fifo_wen : 8'h0);
assign ramn_wen = txdb_write_ramn ? txdb_ahbmst2ramn_wen : (txdb_read_ramn ? txdb_ramn2fifo_wen : 8'h0);
assign ramp_cs = txdb_write_ramp ? txdb_ahbmst2ramp_cs : (txdb_read_ramp ? txdb_ramp2fifo_cs : 8'h0);
assign ramn_cs = txdb_write_ramn ? txdb_ahbmst2ramn_cs : (txdb_read_ramn ? txdb_ramn2fifo_cs : 8'h0);


//reg							txdb_pingpong_flag;
//reg		[ 8:0]				ramp_address;
//reg							ramp_wen;
//reg							ramp_cs;
//reg		[ 8:0]				ramn_address;
//reg							ramn_wen;
//reg							ramn_cs;
//
//
//// using this to decrease the complexity of logic
//always @(posedge ahb_hclk or negedge ahb_hrstn)
//begin
//	if(!ahb_hrstn)
//	begin
////		txdb_pingpong_flag <= 1'b1;
//		ramp_address <= 9'h0;
//		ramp_wen <= 1'b1;
//		ramp_cs <= 1'b0;
//		ramn_address <= 9'h0;
//		ramn_wen <= 1'b1;
//		ramn_cs <= 1'b0;
//	end
////	else if(txdb_ahbmst_clr)
////	begin
////		ramp_address <= 9'h0;
////		ramp_wen <= 1'b1;
////		ramp_cs <= 1'b0;
////		ramn_address <= 9'h0;
////		ramn_wen <= 1'b1;
////		ramn_cs <= 1'b0;
////	end
//	else if(txdb_ahbmst_readtrans_valid)
//	begin
//		if(txdb_write_ramp || txdb_read_ramn)
//	//		txdb_pingpong_flag <= 1'b1;
//			ramp_address <= txdb_ahbmst2ramp_address;
//			ramp_wen <= txdb_ahbmst2ramp_wen;
//			ramp_cs <= txdb_ahbmst2ramp_cs;
//			ramn_address <= txdb_ramn2fifo_address;
//			ramn_wen <= txdb_ramn2fifo_wen;
//			ramn_cs <= txdb_ramn2fifo_cs;
//		end
//		else if(txdb_write_ramn || txdb_read_ramp)
//		begin
//	//		txdb_pingpong_flag <= 1'b0;
//			ramn_address <= txdb_ahbmst2ramn_address;
//			ramn_wen <= txdb_ahbmst2ramn_wen;
//			ramn_cs <= txdb_ahbmst2ramn_cs;
//			ramp_address <= txdb_ramp2fifo_address;
//			ramp_wen <= txdb_ramp2fifo_wen;
//			ramp_cs <= txdb_ramp2fifo_cs;
//		end
//	else
//	begin
////		txdb_pingpong_flag <= txdb_pingpong_flag;
//		ramp_address <= 9'h0;
//		ramp_wen <= 1'b1;
//		ramp_cs <= 1'b0;
//		ramn_address <= 9'h0;
//		ramn_wen <= 1'b1;
//		ramn_cs <= 1'b0;
////		ramp_address <= ramp_address;
////		ramp_wen <= ramp_wen;
////		ramp_cs <= ramp_cs;
////		ramn_address <= ramn_address;
////		ramn_wen <= ramn_wen;
////		ramn_cs <= ramn_cs;
//	end
//end

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
	.data						(txdb_ahbmst2ramp_data),
	.q							(txdb_ramp2fifo_q)
);

sp_sram_1k_256x32_wrapper u_eth_mac_tx_ram_n
(
	.clk						(ahb_hclk),
	.rstn						(ahb_hrstn),
	.wen						(ramn_wen),
	.cs							(ramn_cs),
	.addr						(ramn_address),
	.data						(txdb_ahbmst2ramn_data),
	.q							(txdb_ramn2fifo_q)
);

wire							txdb_fifo_rstn;

//sync_ff u_eth_mac_txdb_rstn_sync
//(
//	.clk						(ahb_hclk),
//	.rstn						(ahb_hrstn),	
//
//	.A							(~(pe_tx_rstn || txdb_data_clr)),
//	.Y							(txdb_fifo_rstn)
//);

fifo_async 
#(
	.ADDR_WIDTH					(3), 
	.DATA_WIDTH					(32)
)          
u_eth_mac_tx_fifo
(                                           
	.wr_clk						(ahb_hclk),
	.rd_clk						(pe_tx_clk),
	.wr_rstn					(ahb_hrstn),
//	.wr_rstn					(txdb_fifo_rstn),
	.rd_rstn					(pe_tx_rstn),
                                       
	.wr_req						(txdb_ram2fifo_wrreq),
//	.rd_req						(~txdb_fifo2pe_empty),//temp??? for sim
	.rd_req						(txdb_pe2fifo_rdreq),
	.rd_empty					(txdb_fifo2pe_empty),
	.wr_full					(txdb_fifo2ram_full),
	.wr_fifo_num				(txdb_fifo_wrnum),
	.rd_fifo_num				(),                                

	.data						(txdb_ram2fifo_wdata),
	.q							(txdb_fifo2pe_rdata)
);

//===============================================
// async fifo operation in pe core end
// clk domain: pe tx data clk
// detecting read data by pe process
// At least a group of data has been pushed into 
// fifo then informing pe to pop data from fifo.
// Read request signal from pe falling means that
// once process that reading data from fifo to pe
// has done.
// Read end of this fifo is only controlled by pe
// core not fsm. It means that if the fsm is back
// to idle state, the (or last group) data in fifo
// can be read out by pe core.
//===============================================

//assign txdb_fifo2pe_done = txdb_fifo2pe_empty && txdb_state_last_transfer;// only until all data pop from fifo
assign txdb_fifo2pe_done = txdb_fifo2pe_empty && txdb_fifo2pe_single_process_done;// only until all data pop from fifo

always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_data_ready <= 1'b0;
	end
	else if(txdb_ahbmst_clr)
	begin
		txdb_data_ready <= 1'b0;
	end
	else if(txdb_ram2fifo_once_process_done)
	begin
		txdb_data_ready <= 1'b1;
	end
	else
	begin
		txdb_data_ready <= txdb_data_ready;
	end
end

//assign txdb_data_ready = txdb_ram2fifo_wrreq_f;
//posedge_pulse_sync u_txdb_data_ready
//(
//	.src_clk					(ahb_hclk),
//	.src_rstn					(ahb_hrstn),
//	.des_clk 					(pe_tx_clk),
//	.des_rstn					(pe_tx_rstn),
//
//	.src_A	 					(txdb_ram2fifo_once_process_done),
//	.des_Y	 					(txdb_data_ready)
//);

//whether pe should handle burst or single data
reg			[ 7:0]				txdb_pe2fifo_rdreq_done_cnt;
reg			[ 1:0]				txdb_pe2fifo_single_rdreq_done_cnt;
assign txdb_fifo2pe_burst_process_done = (txdb_pe2fifo_rdreq_done_cnt >= r_tx_length_real[11:4]) ? 1'b1 : 1'b0;
assign txdb_fifo2pe_single_process_done = txdb_fifo2pe_burst_process_done && (txdb_pe2fifo_single_rdreq_done_cnt >= r_tx_length_real[3:2]) ? 1'b1 : 1'b0;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		txdb_pe2fifo_rdreq_done_cnt <= 8'h0;
	end
	else if(txdb_data_clr || txdb_fifo2pe_done)
	begin
		txdb_pe2fifo_rdreq_done_cnt <= 8'h0;
	end
	else if(txdb_pe2fifo_rdreq_done)
	begin
		txdb_pe2fifo_rdreq_done_cnt <= txdb_pe2fifo_rdreq_done_cnt + 1'b1;
	end
	else
	begin
		txdb_pe2fifo_rdreq_done_cnt <= txdb_pe2fifo_rdreq_done_cnt;
	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		txdb_pe2fifo_single_rdreq_done_cnt <= 2'h0;
	end
	else if(txdb_data_clr || txdb_fifo2pe_done)
	begin
		txdb_pe2fifo_single_rdreq_done_cnt <= 2'h0;
	end
	else if(txdb_pe2fifo_rdreq_done && txdb_fifo2pe_burst_process_done)
	begin
		txdb_pe2fifo_single_rdreq_done_cnt <= txdb_pe2fifo_single_rdreq_done_cnt + 1'b1;
	end
	else
	begin
		txdb_pe2fifo_single_rdreq_done_cnt <= txdb_pe2fifo_single_rdreq_done_cnt;
	end
end

negedge_detect u_pe_once_process_finish
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),
	.A							(txdb_pe2fifo_rdreq_done),
	.Y							(txdb_pe2fifo_once_process_finish_bf)
);

// If no data read from fifo to pe core, 
// it will be no meaning to wait for negedge of fifo rdreq.
posedge_pulse_sync u_pe_once_process_finish_sync
(
	.src_clk					(pe_tx_clk),
	.src_rstn					(pe_tx_rstn),
	.des_clk 					(ahb_hclk),
	.des_rstn					(ahb_hrstn),

	.src_A	 					(txdb_pe2fifo_once_process_finish_bf),//temp??????
//	.src_A	 					(1),//temp for sim??????
	.des_Y	 					(txdb_pe2fifo_once_process_finish_af)
);

//===============================================
// txdb_pe2fifo_once_process_valid is used to
// indicate that pe has already working, which
// means pe once process finish should be
// taken into consideration for once process 
// finish determination from now on.
//===============================================


always @(posedge ahb_hclk or negedge ahb_hrstn)
begin
	if(!ahb_hrstn)
	begin
		txdb_pe2fifo_once_process_valid <= 1'b0;
	end
	else if(txdb_ahbmst_clr || txdb_state_idle)
	begin
		txdb_pe2fifo_once_process_valid <= 1'b0;
	end
	else if(txdb_pe2fifo_once_process_finish_af)
	begin
		txdb_pe2fifo_once_process_valid <= 1'b1;
	end
	else
	begin
		txdb_pe2fifo_once_process_valid <= txdb_pe2fifo_once_process_valid;
	end
end

//===============================================
// tx process done detect
//===============================================

posedge_pulse_sync u_txdb_pe_tx_end_sync
(
	.src_clk					(pe_tx_clk),
	.src_rstn					(pe_tx_rstn),
	.des_clk 					(ahb_hclk),
	.des_rstn					(ahb_hrstn),

	.src_A	 					(txdb_pe_tx_end),//temp??????
//	.src_A	 					(1),//temp for sim??????
	.des_Y	 					(txdb_pe_tx_end_af)
);

//===============================================
// tx data buffer flag
//===============================================

//assign int_status_txdb_process_finish = txdb_process_finish;

endmodule


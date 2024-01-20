//===============================================
//
//	File: uart_pe_core.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is protocol engine core for uart.
//	This core is including:
//	uart tx protocol implementation
//	uart rx protocol implementation
//	uart status management
//	uart pin control
//
//===============================================

module uart_pe_core
(
	input  						pe_clk,  
	input  						pe_rstn,

	// pin
	output 						uart_tx,
	output 						uart_tx_oen,
	input    					uart_rx,
	output 						uart_rx_oen,

	// data
	output						tx_fifo_re,
	input		[ 9:0]			tx_fifo_data,
	input		[ 4:0]			tx_fifo_num,
	output						rx_fifo_we,
	output		[ 9:0]			rx_fifo_data,
	input		[ 4:0]			rx_fifo_num,

	// control
	input						pe_tx_logic_clr,
	input						pe_rx_logic_clr,
	input						pe_tx_enable,
	input						pe_rx_enable,
	output						pe_tx_end,
	output						pe_rx_end,

	// config
	input		[ 3:0]			r_oversampling,
	input		[11:0]			r_clkdiv,
	input 		[ 3:0]			r_interval_bit,
	input						r_error_ignore,
	input 						r_rts,
	input 						r_cts,
	input 						r_stop_bit,
	input 						r_parity_en,
	input 		[ 1:0]			r_parity,
	input 		[ 1:0]			r_data_bit,

	// interrupt status
	output						int_status_tx_done,
	output						int_status_rx_parity_error,
	output						int_status_rx_stop_error,
	output						int_status_rx_stop_detect,
	output						int_status_rx_noise_detect
);

//===============================================
// uart status management
//===============================================

wire	[3:0]					r_data_bit_real;
wire	[1:0]					r_stop_bit_real;
assign r_data_bit_real = (r_data_bit == 2'h0) ? 4'd7 : 
						 (r_data_bit == 2'h1) ? 4'd8 :
						 (r_data_bit == 2'h2) ? 4'd9 : 4'd10;
assign r_stop_bit_real = (r_stop_bit == 1'b0) ? 2'd1 : 2'd2; 

//===============================================
// uart status control
//===============================================

wire							pe_tx_enable_r;

posedge_detect u_posedge_detect 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),
	.A							(pe_tx_enable),
	.Y							(pe_tx_enable_r)
);

wire							uart_rx_d;

//// guarantee rx signal is align with bit timing
//sync_ff_en
//#(
//	WIDTH						(1),
//	DEFAULT_VAL					(0)
//)u_sync_ff_inst0
//(
//	.clk						(pe_clk),
//	.rstn						(pe_rstn),	
//
//	.en							(pe_rx_enable)
//	.A							(uart_rx),
//	.Y							(uart_rx_d)
//);
//
//wire							pe_rx_enable_2d;
//
//// due to the input uart rx signal need to be synced by 2 ff
//// in acccord with this signal
//sync_ff_2d
//#(
//	WIDTH						(1),
//	DEFAULT_VAL					(1)
//)u_sync_ff_2d_inst0
//(
//	.clk						(pe_clk),
//	.rstn						(pe_rstn),	
//
//	.A							(pe_rx_enable),
//	.Y							(pe_rx_enable_2d)
//);

//===============================================
// uart pin control (reserved)
// full duplex
// half duplex
//===============================================


//===============================================
// uart tx protocol engine
//===============================================

uart_pe_tx u_uart_pe_tx
(
	.pe_clk						(pe_clk),  
	.pe_rstn					(pe_rstn),
                                                
	.uart_tx					(uart_tx),
	.uart_tx_oen				(uart_tx_oen),
                                                
	.fifo_re					(tx_fifo_re),
	.fifo_data					(tx_fifo_data),
	.fifo_num					(tx_fifo_num),
                                                
	.pe_tx_logic_clr			(pe_tx_logic_clr),
	.pe_tx_enable				(pe_tx_enable),
	.pe_tx_enable_r				(pe_tx_enable_r),
	.pe_tx_end					(pe_tx_end),

	.r_oversampling				(r_oversampling),
	.r_clkdiv					(r_clkdiv),
	.r_interval_bit				(r_interval_bit),
	.r_rts						(r_rts),
	.r_cts						(r_cts),
	.r_stop_bit					(r_stop_bit_real),
	.r_parity_en				(r_parity_en),
	.r_parity					(r_parity),
	.r_data_bit					(r_data_bit_real),

	.int_status_tx_done			(int_status_tx_done)
);

//===============================================
// uart rx protocol engine
//===============================================

uart_pe_rx u_uart_pe_rx
(
	.pe_clk						(pe_clk),  
	.pe_rstn					(pe_rstn),
                                                
	.uart_rx					(uart_rx),
	.uart_rx_oen				(uart_rx_oen),
                                                
	.fifo_we					(rx_fifo_we),
	.fifo_data					(rx_fifo_data),
	.fifo_num					(rx_fifo_num),
                                                
	.pe_rx_logic_clr			(pe_rx_logic_clr),
	.pe_rx_enable				(pe_rx_enable),
	.pe_rx_end					(pe_rx_end),

	.r_oversampling				(r_oversampling),
	.r_clkdiv					(r_clkdiv),
	.r_interval_bit				(r_interval_bit),
	.r_error_ignore				(r_error_ignore),
	.r_rts						(r_rts),
	.r_cts						(r_cts),
	.r_stop_bit					(r_stop_bit_real),
	.r_parity_en				(r_parity_en),
	.r_parity					(r_parity),
	.r_data_bit					(r_data_bit_real),

	.int_status_rx_parity_error	(int_status_rx_parity_error),
	.int_status_rx_stop_error	(int_status_rx_stop_error),
	.int_status_rx_stop_detect	(int_status_rx_stop_detect),
	.int_status_rx_noise_detect	(int_status_rx_noise_detect)
);

endmodule


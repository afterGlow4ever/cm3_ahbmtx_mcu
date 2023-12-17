//===============================================
//
//	File: uart_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 12122023
//	Version: v1.0
//
//	This is used for uart spyglass analysis.
//
//===============================================

module uart_sg 
(
	input						apb0_root_clk,
	input						apb0_root_rstn,
	
	//pin
	output 						uart0_tx,
	output 						uart0_tx_oen,
	input    					uart0_rx,
	output 						uart0_rx_oen,

	//apb bus interface
	input	[31:0]				paddr,  
	input						penable,
	input						psel,  
	input						pwrite, 
	input	[31:0]				pwdata, 
	output	[31:0]				prdata 
);

uart_top u_uart0
(
	.module_clk					(apb0_root_clk),  
	.module_rstn				(apb0_root_rstn),
	
	.uart_tx					(uart0_tx),
	.uart_tx_oen				(uart0_tx_oen),
	.uart_rx					(uart0_rx),
	.uart_rx_oen				(uart0_rx_oen),

	.reg_clk					(apb0_root_clk),
	.reg_rstn					(apb0_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.uart_int_line				()
);

endmodule


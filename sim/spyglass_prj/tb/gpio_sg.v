//===============================================
//
//	File: gpio_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 01142024
//	Version: v1.0
//
//	This is used for gpio spyglass analysis.
//
//===============================================

module gpio_sg 
(
	// module interface
	input  						apb0_root_clk,  
	input  						apb0_root_rstn,

	// port
	inout	[15:0]				gpioa,

	// regs interface
	input 	[31:0]				paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 	[31:0]				pwdata, 
	output	[31:0]				prdata,

	// gpioa mux
	input						uart1_tx,	
	input						uart1_tx_oen,	
	output						uart1_rx,	
	input						uart1_rx_oen,

	// interrupt
	output						gpio_int_line
);

gpio_top u_gpio
(
	.module_clk					(apb0_root_clk),  
	.module_rstn				(apb0_root_rstn),
	
	.gpioa						(gpioa),

	.uart1_tx					(uart1_tx),
	.uart1_tx_oen				(uart1_tx_oen),
	.uart1_rx					(uart1_rx),
	.uart1_rx_oen				(uart1_rx_oen),

	.reg_clk					(apb0_root_clk),
	.reg_rstn					(apb0_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.gpio_int_line				(gpio_int_line)
);

endmodule


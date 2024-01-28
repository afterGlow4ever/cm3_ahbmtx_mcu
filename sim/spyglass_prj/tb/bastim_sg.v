//===============================================
//
//	File: bastim_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 01272024
//	Version: v1.0
//
//	This is used for basic timer spyglass analysis.
//
//===============================================

module bastim_sg 
(
	// module interface
	input  						apb1_root_clk,  
	input  						apb1_root_rstn,

	// regs interface
	input 	[31:0]				paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 	[31:0]				pwdata, 
	output	[31:0]				prdata,


	// interrupt
	output	[ 3:0]				bastim_int_line
);

bastim_top u_bastim
(
	.module_clk					(apb1_root_clk),  
	.module_rstn				(apb1_root_rstn),
	
	.reg_clk					(apb1_root_clk),
	.reg_rstn					(apb1_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.bastim_int_line			(bastim_int_line)
);

endmodule


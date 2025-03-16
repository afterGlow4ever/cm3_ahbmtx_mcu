//===============================================
//
//	File: advtim_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 11172024
//	Version: v1.0
//
//	This is used for advance timer spyglass analysis.
//
//===============================================

module advtim_sg 
(
	// module interface
	input  						apb2_root_clk,  
	input  						apb2_root_rstn,
	input  						advtim_clk,  
	input  						advtim_rstn,

	// regs interface
	input 	[31:0]				paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 	[31:0]				pwdata, 
	output	[31:0]				prdata,

	// interrupt
	output						advtim_gen_int_line,
	output						advtim_cap_int_line
);
//
//wire							advtim_rstn_af;
//
//rstn_sync u_rstn_sync
//(
//	.clk						(advtim_clk),
//	.rstn						(advtim_rstn),
//	.sync_rstn					(advtim_rstn_af)
//);

advtim_top u_advtim
(
	.module_clk					(advtim_clk),  
	.module_rstn				(advtim_rstn),
//	.module_rstn				(advtim_rstn_af),
	
	.reg_clk					(apb2_root_clk),
	.reg_rstn					(apb2_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.advtim_gen_int_line		(advtim_gen_int_line),
	.advtim_cap_int_line		(advtim_cap_int_line)
);

endmodule


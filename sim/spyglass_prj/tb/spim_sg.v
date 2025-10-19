//===============================================
//
//	File: spim_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 10032025
//	Version: v1.0
//
//	This is used for spi master spyglass analysis.
//
//===============================================

module spim_sg 
(
	input						apb2_root_clk,
	input						apb2_root_rstn,
	input						spim_clk,
	input						spim_rstn,
	
	//pin
	output 						spim_sck,
	output 						spim_sck_oen,
	output 						spim_mosi_o,
	output 						spim_mosi_oen,
	input						spim_miso_i,
	output 						spim_miso_oen,
	output 						spim_cs_o,
	output 						spim_cs_oen,

	//apb bus interface
	input	[31:0]				paddr,  
	input						penable,
	input						psel,  
	input						pwrite, 
	input	[31:0]				pwdata, 
	output	[31:0]				prdata,

	output						spim0_int
);

wire							spim_rstn_af;
wire							apb2_root_rstn_af;

rstn_sync u_rstn_sync0
(
	.clk						(spim_clk),
	.rstn						(spim_rstn),

	.sync_rstn					(spim_rstn_af)
);

rstn_sync u_rstn_sync1
(
	.clk						(apb2_root_clk),
	.rstn						(apb2_root_rstn),

	.sync_rstn					(apb2_root_rstn_af)
);

spim_top u_spim
(
	.module_clk					(spim_clk),  
	.module_rstn				(spim_rstn_af),
	
	.spim_sck					(spim_sck),
	.spim_sck_oen				(spim_sck_oen),
	.spim_mosi_o				(spim_mosi_o),
	.spim_mosi_oen				(spim_mosi_oen),
	.spim_miso_i				(spim_miso_i),
	.spim_miso_oen				(spim_miso_oen),
	.spim_cs_o					(spim_cs_o),
	.spim_cs_oen				(spim_cs_oen),

	.reg_clk					(apb2_root_clk),
	.reg_rstn					(apb2_root_rstn_af),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.spim_int_line				(spim0_int)
);

endmodule


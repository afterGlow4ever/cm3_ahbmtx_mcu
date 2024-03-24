//===============================================
//
//	File: eth_sg.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 03092023
//	Version: v1.0
//
//	This is used for ethernet spyglass analysis.
//
//===============================================

module eth_sg 
(
	input						apb2_root_clk,
	input						apb2_root_rstn,
	
	//pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,	

	//apb bus interface
	input	[31:0]				paddr,  
	input						penable,
	input						psel,  
	input						pwrite, 
	input	[31:0]				pwdata, 
	output	[31:0]				prdata,

	output						eth_sma_int_line			
);

eth_top u_eth0
(
	.module_clk					(apb2_root_clk),  
	.module_rstn				(apb2_root_rstn),
                                	                
	.eth_mdc					(eth_mdc),
	.eth_mdc_oen				(eth_mdc_oen),
	.eth_mdio_o					(eth_mdio_o),
	.eth_mdio_i					(eth_mdio_i),
	.eth_mdio_oen				(eth_mdio_oen),

	.reg_clk					(apb2_root_clk),
	.reg_rstn					(apb2_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.eth_sma_int_line			(eth_sma_int_line)
);

endmodule


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
	input  						tx_clk,  
	input  						tx_rstn,
	input  						rx_clk,  
	input  						rx_rstn,
	
	//pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,	
	output 		[ 3:0]			eth_tx,
	output 		[ 3:0]			eth_tx_oen,
	output 						eth_tx_ctrl,
	output 						eth_tx_ctrl_oen,
	output						eth_tx_clk,	
	output						eth_tx_clk_oen,		

	// ahb master
	input						ahb_hclk,
	input						ahb_hrstn,
	output						ahb_hsel,
	output						ahb_hreadyout,
	output	[ 1:0]				ahb_htrans,
	output	[ 2:0]				ahb_hsize,
	output						ahb_hwrite,
	output	[ 2:0]				ahb_hburst,
	output	[31:0]				ahb_haddr,
	output	[ 3:0]				ahb_hprot,
	output	[31:0]				ahb_hwdata,
	input						ahb_hready,
	input	[ 1:0]				ahb_hresp,
	input	[31:0]				ahb_hrdata,	

	//apb bus interface
	input	[31:0]				paddr,  
	input						penable,
	input						psel,  
	input						pwrite, 
	input	[31:0]				pwdata, 
	output	[31:0]				prdata,

	output						eth_sma_int_line,			
	output						eth_mac_tx_int_line,			
	output						eth_mac_rx_int_line			
);

eth_top u_eth0
(
	.module_clk					(apb2_root_clk),  
	.module_rstn				(apb2_root_rstn),
	.pe_tx_clk					(tx_clk),  
	.pe_tx_rstn					(tx_rstn),
	.pe_rx_clk					(rx_clk),  
	.pe_rx_rstn					(rx_rstn),

	.eth_mdc					(eth_mdc),
	.eth_mdc_oen				(eth_mdc_oen),
	.eth_mdio_o					(eth_mdio_o),
	.eth_mdio_i					(eth_mdio_i),
	.eth_mdio_oen				(eth_mdio_oen),
	.eth_tx						(eth_tx),
	.eth_tx_oen					(eth_tx_oen),
	.eth_tx_ctrl				(eth_tx_ctrl),
	.eth_tx_ctrl_oen			(eth_tx_ctrl_oen),
	.eth_tx_clk					(eth_tx_clk),	
	.eth_tx_clk_oen				(eth_tx_clk_oen),	

	.ahb_hclk					(ahb_hclk),
	.ahb_hrstn					(ahb_hrstn),
	.ahb_hsel					(ahb_hsel),
	.ahb_hreadyout				(ahb_hreadyout),
	.ahb_htrans					(ahb_htrans),
	.ahb_hsize					(ahb_hsize),
	.ahb_hwrite					(ahb_hwrite),
	.ahb_hburst					(ahb_hburst),
	.ahb_haddr					(ahb_haddr),
	.ahb_hprot					(ahb_hprot),
	.ahb_hwdata					(ahb_hwdata),
	.ahb_hready					(ahb_hready),
	.ahb_hresp					(ahb_hresp),
	.ahb_hrdata					(ahb_hrdata),	

	.reg_clk					(apb2_root_clk),
	.reg_rstn					(apb2_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.eth_sma_int_line			(eth_sma_int_line),
	.eth_mac_tx_int_line		(eth_mac_tx_int_line),
	.eth_mac_rx_int_line		(eth_mac_rx_int_line)
);

endmodule


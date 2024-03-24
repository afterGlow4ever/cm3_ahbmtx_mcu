//===============================================
//
//	File: apb2_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02272024
//	Version: v1.0
//
// 	This is top for apb2 async peripherals domain.
//	This domain is including:
//	1. Ethernet
//
//===============================================

module apb2_top 
(
	input						apb2_root_clk,
	input						apb2_root_rstn,
	
	// pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output 						eth_mdio_o,
	input 						eth_mdio_i,
	output 						eth_mdio_oen,

	input	[31:0]				paddr,  
	input						penable,
	input	[ 3:0]				pstrb,  
	input	[ 2:0]				pprot,  
	input						pwrite, 
	input	[31:0]				pwdata, 
	input						psel,   
	output	[31:0]				prdata, 
	output						pready,
	output						pslverr,

	output						eth_sma_int
);

//===============================================
// APB2 slave mux
//===============================================

wire						 	psel_eth; 
wire						 	pready_eth; 
wire	[31:0]				 	prdata_eth; 
wire						 	pslverr_eth; 
wire	[31:0]				 	paddr_eth; 

cmsdk_apb_slave_mux 
#(
    .PORT0_ENABLE                       (1),
    .PORT1_ENABLE                       (0),
    .PORT2_ENABLE                       (0),
    .PORT3_ENABLE                       (0),
    .PORT4_ENABLE                       (0),
    .PORT5_ENABLE                       (0),
    .PORT6_ENABLE                       (0),
    .PORT7_ENABLE                       (0),
    .PORT8_ENABLE                       (0),
    .PORT9_ENABLE                       (0),
    .PORT10_ENABLE                      (0),
    .PORT11_ENABLE                      (0),
    .PORT12_ENABLE                      (0),
    .PORT13_ENABLE                      (0),
    .PORT14_ENABLE                      (0),
    .PORT15_ENABLE                      (0)
)   
u_apb2_slave_mux
(
    .DECODE4BIT                         (paddr[15:12]),
    .PSEL                               (psel),

    .PSEL0                              (psel_eth),
    .PREADY0                            (pready_eth),
    .PRDATA0                            (prdata_eth),
    .PSLVERR0                           (pslverr_eth),
    
    .PSEL1                              (),
    .PREADY1                            (1'b0),
    .PRDATA1                            (32'b0),
    .PSLVERR1                           (1'b0),

    .PSEL2                              (),
    .PREADY2                            (1'b0),
    .PRDATA2                            (32'b0),
    .PSLVERR2                           (1'b0),

    .PSEL3                              (),
    .PREADY3                            (1'b0),
    .PRDATA3                            (32'b0),
    .PSLVERR3                           (1'b0),

    .PSEL4                              (),
    .PREADY4                            (1'b0),
    .PRDATA4                            (32'b0),
    .PSLVERR4                           (1'b0),

    .PSEL5                              (),
    .PREADY5                            (1'b0),
    .PRDATA5                            (32'b0),
    .PSLVERR5                           (1'b0),

    .PSEL6                              (),
    .PREADY6                            (1'b0),
    .PRDATA6                            (32'b0),
    .PSLVERR6                           (1'b0),

    .PSEL7                              (),
    .PREADY7                            (1'b0),
    .PRDATA7                            (32'b0),
    .PSLVERR7                           (1'b0),

    .PSEL8                              (),
    .PREADY8                            (1'b0),
    .PRDATA8                            (32'b0),
    .PSLVERR8                           (1'b0),

    .PSEL9                              (),
    .PREADY9                            (1'b0),
    .PRDATA9                            (32'b0),
    .PSLVERR9                           (1'b0),

    .PSEL10                             (),
    .PREADY10                           (1'b0),
    .PRDATA10                           (32'b0),
    .PSLVERR10                          (1'b0),

    .PSEL11                             (),
    .PREADY11                           (1'b0),
    .PRDATA11                           (32'b0),
    .PSLVERR11                          (1'b0),

    .PSEL12                             (),
    .PREADY12                           (1'b0),
    .PRDATA12                           (32'b0),
    .PSLVERR12                          (1'b0),
    
    .PSEL13                             (),
    .PREADY13                           (1'b0),
    .PRDATA13                           (32'b0),
    .PSLVERR13                          (1'b0),

    .PSEL14                             (),
    .PREADY14                           (1'b0),
    .PRDATA14                           (32'b0),
    .PSLVERR14                          (1'b0),

    .PSEL15                             (),
    .PREADY15                           (1'b0),
    .PRDATA15                           (32'b0),
    .PSLVERR15                          (1'b0),

    .PREADY                             (pready),
    .PRDATA                             (prdata),
    .PSLVERR                            (pslverr)

);

//===============================================
// APB2 ethernet
// 0x40020000~0x40020FFF 
//===============================================

assign pready_eth = 1'b1;
assign pslverr_eth = 1'b0;

`ifdef ETH
assign paddr_eth = paddr;// compatible with ethernet reg

eth_top u_eth
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
	.psel						(psel_eth),						
	.penable					(penable),
	.paddr						(paddr_eth),
	.pwdata						(pwdata),
	.prdata						(prdata_eth),

	.eth_sma_int_line			(eth_sma_int)
);
`else
assign eth_mdc = 1'b0;
assign eth_mdc_oen = 1'b0;
assign eth_mdio_o = 1'b0;
assign eth_mdio_oen = 1'b0;
assign prdata_eth = 32'h0;
assign eth_sma_int = 1'b0;
`endif

endmodule


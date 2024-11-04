//===============================================
//
//	File: mcu_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 07022023
//	Version: v1.0
//
// 	This is top for mcu 'cm3_ahbmtx'.
//	This top is including:
//	ao domain: Always on domain.
//	fp domain: Full function domain.
//	pad top: Ports top.
//	fpga top: Only used in fpga platform.
//
//===============================================

module mcu_top 
(
	// debug port group
	input  						CLK,  
	input  						RSTN,

`ifdef GPIO
	inout	[15:0]				GPIOA,
`else
	input  						RXD1, 
	output  					TXD1, 
	output						MDC,
	inout						MDIO,
	output	[ 3:0]				ETH_TXD,
	output						ETH_TXC,
	output						ETH_TXEN,
`endif
`ifdef ETH
	output						ETH_RST,
`endif
	input  						RXD, 
	output  					TXD, 
	input  						TDI, 
	input  						TCK, 
	inout  						TMS, 
	output 						TDO, 
	input  						TRST 
);

//===============================================
// rcc
// Logics below will be redesigned after RCC module
//===============================================

wire							hsi;
wire							hsi2;
wire							lsi;
wire							sys_root_clk;
wire							apb1_root_clk;
wire							apb2_root_clk;
wire							eth_pe_tx_clk;
wire							eth_pe_rx_clk;
wire							sys_root_rstn;
wire							apb1_root_rstn;
wire							apb2_root_rstn;
wire							eth_pe_tx_rstn;
wire							eth_pe_rx_rstn;
wire							pll_locked;

assign sys_root_clk = hsi;
assign apb0_root_clk = sys_root_clk;
assign apb1_root_clk = lsi;
assign apb2_root_clk = hsi2;
assign eth_pe_tx_clk = hsi2;
assign eth_pe_rx_clk = hsi2;
assign sys_root_rstn = RSTN & pll_locked;
assign apb0_root_rstn = RSTN & pll_locked;
assign apb1_root_rstn = RSTN & pll_locked;
assign apb2_root_rstn = RSTN & pll_locked;
assign eth_pe_tx_rstn = RSTN & pll_locked;
assign eth_pe_rx_rstn = RSTN & pll_locked;

//===============================================
// gpio
//===============================================

wire								uart1_tx;	 
wire								uart1_tx_oen;
wire								uart1_rx;	 
wire								uart1_rx_oen;
wire								eth_mdc;	 
wire								eth_mdc_oen; 
wire								eth_mdio_o;	 
wire								eth_mdio_i;	 
wire								eth_mdio_oen;
wire	[ 3:0]						eth_tx;
wire								eth_tx_oen;
wire								eth_tx_ctrl;
wire								eth_tx_ctrl_oen;
wire								eth_tx_clk;	
wire								eth_tx_clk_oen;

wire	      						gpioa_int; 

`ifdef GPIO

wire								psel0_gpioa;
wire								penable0;
wire	[31:0]					 	paddr0_gpioa; 
wire	      						pwrite0; 
wire	[31:0]					 	pwdata0; 
wire	[31:0]					 	prdata0_gpioa; 

gpio_top u_gpio
(
	.module_clk						(apb0_root_clk),  
	.module_rstn					(apb0_root_rstn),

	.gpioa							(GPIOA),

	.reg_clk						(apb0_root_clk),				
	.reg_rstn						(apb0_root_rstn),
	.paddr							(paddr0_gpioa),
	.pwrite							(pwrite0),
	.psel							(psel0_gpioa),
	.penable						(penable0),
	.pwdata							(pwdata0), 
	.prdata							(prdata0_gpioa), 

	.uart1_tx						(uart1_tx), 
	.uart1_tx_oen					(uart1_tx_oen), 
	.uart1_rx						(uart1_rx), 
	.uart1_rx_oen					(uart1_rx_oen), 

	.gpio_int_line					(gpioa_int)
);
`else

// uart1
assign TXD1 = uart1_tx;
assign uart1_rx = RXD1;

// ethernet
assign MDC = eth_mdc;
assign MDIO = eth_mdio_oen ? 1'bz : eth_mdio_o;
assign eth_mdio_i = MDIO;			
assign ETH_TXD = eth_tx;
assign ETH_TXC = eth_tx_clk;
assign ETH_TXEN = eth_tx_ctrl;

assign gpioa_int = 1'b0;

`endif

`ifdef ETH
assign ETH_RST = RSTN;
`endif

//===============================================
// top for full function domain
//===============================================

fp_domain u_fp_domain
(
	.sys_root_clk				(sys_root_clk		),
	.sys_root_rstn				(sys_root_rstn		),
	.apb0_root_clk				(apb0_root_clk		),
	.apb0_root_rstn				(apb0_root_rstn		),
	.apb1_root_clk				(apb1_root_clk		),
	.apb1_root_rstn				(apb1_root_rstn		),
	.apb2_root_clk				(apb2_root_clk		),
	.apb2_root_rstn				(apb2_root_rstn		),
	.eth_pe_tx_clk				(eth_pe_tx_clk		),  
	.eth_pe_tx_rstn				(eth_pe_tx_rstn		),
	.eth_pe_rx_clk				(eth_pe_rx_clk		),  
	.eth_pe_rx_rstn				(eth_pe_rx_rstn		),
	.power_on_rstn				(RSTN				),


	.uart0_tx					(TXD				),
	.uart0_tx_oen				(					),
	.uart0_rx					(RXD				),
	.uart0_rx_oen				(					),

`ifdef GPIO
	.psel0_gpioa				(psel0_gpioa		),
	.penable0_o					(penable0			),
	.paddr0_gpioa				(paddr0_gpioa		),
	.pwrite0_o					(pwrite0			), 
	.pwdata0_o					(pwdata0			),
	.prdata0_gpioa				(prdata0_gpioa		), 	
`else
	.uart1_tx					(uart1_tx			), 
	.uart1_tx_oen				(uart1_tx_oen		), 
	.uart1_rx					(uart1_rx			), 
	.uart1_rx_oen				(uart1_rx_oen		), 
	.eth_mdc					(eth_mdc			),
	.eth_mdc_oen				(eth_mdc_oen		),
	.eth_mdio_o					(eth_mdio_o			),
	.eth_mdio_i					(eth_mdio_i			),
	.eth_mdio_oen				(eth_mdio_oen		),
	.eth_tx						(eth_tx				),
	.eth_tx_oen					(eth_tx_oen			),
	.eth_tx_ctrl				(eth_tx_ctrl		),
	.eth_tx_ctrl_oen			(eth_tx_ctrl_oen	),
	.eth_tx_clk					(eth_tx_clk			),	
	.eth_tx_clk_oen				(eth_tx_clk_oen		),	
`endif

	.gpioa_int					(gpioa_int			),

	.TDI						(TDI				),
	.TCK						(TCK				),
	.TMS						(TMS				),
	.TDO						(TDO				),
	.TRST						(TRST				)
);

//===============================================
// fpga platform
// Logics below will be redesigned after RCC module
//===============================================

`ifdef FPGA

fpga_platform u_fpga_platform
(
	.input_clk					(CLK				),  
	.rstn						(RSTN				),
	.clk_40mhz					(hsi				),
	.clk_80mhz					(hsi3				),
	.clk_50mhz					(hsi2				),
	.clk_10mhz					(lsi				),
	.pll_locked					(pll_locked			),	
	.lsi_locked					(					)	
);

`else
	
assign hsi = CLK;
assign hsi2 = CLK;
assign lsi = CLK;
assign pll_locked = 1'b1;	

`endif

endmodule


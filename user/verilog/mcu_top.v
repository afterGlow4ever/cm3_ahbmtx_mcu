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
//===============================================

wire							hsi;
wire							lsi;
wire							sys_root_clk;
wire							apb1_root_clk;
wire							sys_root_rstn;
wire							apb1_root_rstn;
wire							pll_locked;

assign sys_root_clk = hsi;
assign apb0_root_clk = sys_root_clk;
assign apb1_root_clk = lsi;
assign sys_root_rstn = RSTN & pll_locked;
assign apb0_root_rstn = RSTN & pll_locked;
assign apb1_root_rstn = RSTN & pll_locked;

//===============================================
// gpio
//===============================================

wire	      						gpioa_int; 

`ifdef GPIO

wire								psel0_gpioa;
wire								penable0;
wire	[31:0]					 	paddr0_gpioa; 
wire	      						pwrite0; 
wire	[31:0]					 	pwdata0; 
wire	[31:0]					 	prdata0_gpioa; 
wire								uart1_tx;	 
wire								uart1_tx_oen;
wire								uart1_rx;	 
wire								uart1_rx_oen;

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

assign gpioa_int = 1'b0;

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
	.uart1_tx					(uart1_tx			), 
	.uart1_tx_oen				(uart1_tx_oen		), 
	.uart1_rx					(uart1_rx			), 
	.uart1_rx_oen				(uart1_rx_oen		), 
`else
	.uart1_tx					(TXD1				),
	.uart1_tx_oen				(					),
	.uart1_rx					(RXD1				),
	.uart1_rx_oen				(					),
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
	.clk_80mhz					(					),
	.clk_50mhz					(					),
	.clk_10mhz					(lsi				),
	.pll_locked					(pll_locked			),	
	.lsi_locked					(					)	
);

`else
	
assign hsi = CLK;
assign lsi = CLK;
assign pll_locked = 1'b1;	

`endif

endmodule


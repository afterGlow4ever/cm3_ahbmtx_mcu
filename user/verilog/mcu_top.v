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
`ifdef UART1
	input  						RXD1, 
	output  					TXD1, 
`endif
`ifdef ETH
	output						MDC,
	inout						MDIO,
	output	[ 3:0]				ETH_TXD,
	output						ETH_TXC,
	output						ETH_TXEN,
`endif
`ifdef ADVTIM
	output						ADVTIM0_PWM_CH1P,
	output						ADVTIM0_PWM_CH1N,
	output						ADVTIM0_PWM_CH2P,
	output						ADVTIM0_PWM_CH2N,
	output						ADVTIM0_PWM_CH3P,
	output						ADVTIM0_PWM_CH3N,
	output						ADVTIM0_PWM_CH4,
	output						ADVTIM0_PWM_CH5,
	output						ADVTIM0_PWM_CH6,
	input						ADVTIM0_BK1,
	input						ADVTIM0_BK2,
	input						ADVTIM0_CAP_CH1P,
	input						ADVTIM0_CAP_CH1N,
	input						ADVTIM0_ENC_CH1P,
	input						ADVTIM0_ENC_CH1N,
`endif
`ifdef SPIM
	output						SPIM0_SCK,
	inout						SPIM0_MOSI,
	input						SPIM0_MISO,
	output						SPIM0_CS,
`endif
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
wire							hsi3;
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
assign advtim_pe_clk = hsi3;
assign spim_pe_clk = hsi3;
assign sys_root_rstn = RSTN & pll_locked;
assign apb0_root_rstn = RSTN & pll_locked;
assign apb1_root_rstn = RSTN & pll_locked;
assign apb2_root_rstn = RSTN & pll_locked;
assign eth_pe_tx_rstn = RSTN & pll_locked;
assign eth_pe_rx_rstn = RSTN & pll_locked;
assign advtim_pe_rstn = RSTN & pll_locked;
assign spim_pe_rstn = RSTN & pll_locked;

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
wire	[ 3:0]						eth_tx_oen;
wire								eth_tx_ctrl;
wire								eth_tx_ctrl_oen;
wire								eth_tx_clk;	
wire								eth_tx_clk_oen;
wire								advtmr0_pwm_ch1p;
wire								advtmr0_pwm_ch1n;
wire								advtmr0_pwm_ch2p;
wire								advtmr0_pwm_ch2n;
wire								advtmr0_pwm_ch3p;
wire								advtmr0_pwm_ch3n;
wire								advtmr0_pwm_ch4;
wire								advtmr0_pwm_ch5;
wire								advtmr0_pwm_ch6;
wire								advtmr0_pwm_ch1p_oen;
wire								advtmr0_pwm_ch1n_oen;
wire								advtmr0_pwm_ch2p_oen;
wire								advtmr0_pwm_ch2n_oen;
wire								advtmr0_pwm_ch3p_oen;
wire								advtmr0_pwm_ch3n_oen;
wire								advtmr0_pwm_ch4_oen;
wire								advtmr0_pwm_ch5_oen;
wire								advtmr0_pwm_ch6_oen;
wire								advtmr0_bk1;
wire								advtmr0_bk2;
wire								advtmr0_bk1_oen;
wire								advtmr0_bk2_oen;
wire								advtmr0_cap_ch1p;
wire								advtmr0_cap_ch1n;
wire								advtmr0_cap_ch1p_oen;
wire								advtmr0_cap_ch1n_oen;
wire		 						spim0_sck;
wire		 						spim0_sck_oen;
wire		 						spim0_cs_o;
wire		 						spim0_cs_oen;
wire		 						spim0_mosi_o;
wire		 						spim0_mosi_oen;
wire		 						spim0_miso_i;
wire		 						spim0_miso_oen;

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

`ifdef UART1
// uart1
assign TXD1 = uart1_tx;
assign uart1_rx = RXD1;
`else
assign uart1_rx = 1'b0;
`endif
`ifdef ETH
// ethernet
assign MDC = eth_mdc;
assign MDIO = eth_mdio_oen ? 1'bz : eth_mdio_o;
assign eth_mdio_i = MDIO;			
assign ETH_TXD = eth_tx;
assign ETH_TXC = eth_tx_clk;
assign ETH_TXEN = eth_tx_ctrl;
`else
assign eth_mdio_i = 1'b0;			
`endif
`ifdef ADVTIM
// advance timer 0
assign ADVTIM0_PWM_CH1P = advtmr0_pwm_ch1p;
assign ADVTIM0_PWM_CH1N = advtmr0_pwm_ch1n;
assign ADVTIM0_PWM_CH2P = advtmr0_pwm_ch2p;
assign ADVTIM0_PWM_CH2N = advtmr0_pwm_ch2n;
assign ADVTIM0_PWM_CH3P = advtmr0_pwm_ch3p;
assign ADVTIM0_PWM_CH3N = advtmr0_pwm_ch3n;
assign ADVTIM0_PWM_CH4 = advtmr0_pwm_ch4;
assign ADVTIM0_PWM_CH5 = advtmr0_pwm_ch5;
assign ADVTIM0_PWM_CH6 = advtmr0_pwm_ch6;
assign advtmr0_bk1 = ADVTIM0_BK1;
assign advtmr0_bk2 = ADVTIM0_BK2;
assign advtmr0_cap_ch1p = ADVTIM0_CAP_CH1P;
assign advtmr0_cap_ch1n = ADVTIM0_CAP_CH1N;
assign advtmr0_enc_ch1p = ADVTIM0_ENC_CH1P;
assign advtmr0_enc_ch1n = ADVTIM0_ENC_CH1N;
`else
assign advtmr0_bk1 = 1'b0;
assign advtmr0_bk2 = 1'b0;
assign advtmr0_cap_ch1p = 1'b0;
assign advtmr0_cap_ch1n = 1'b0;
assign advtmr0_enc_ch1p = 1'b0;
assign advtmr0_enc_ch1n = 1'b0;
`endif
`ifdef SPIM
assign SPIM0_SCK = spim0_sck;
assign SPIM0_CS = spim0_cs_oen ? 1'bz : spim0_cs_o;
assign SPIM0_MOSI = spim0_mosi_oen ? 1'bz : spim0_mosi_o;
assign spim0_miso_i = SPIM0_MISO;
`else

`endif
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
	.advtim_pe_clk				(advtim_pe_clk		),  
	.advtim_pe_rstn				(advtim_pe_rstn		),
	.spim_pe_clk				(spim_pe_clk		),
	.spim_pe_rstn				(spim_pe_rstn		),
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
`endif
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

	.advtmr0_pwm_ch1p			(advtmr0_pwm_ch1p	),
	.advtmr0_pwm_ch1n			(advtmr0_pwm_ch1n	),
	.advtmr0_pwm_ch2p			(advtmr0_pwm_ch2p	),
	.advtmr0_pwm_ch2n			(advtmr0_pwm_ch2n	),
	.advtmr0_pwm_ch3p			(advtmr0_pwm_ch3p	),
	.advtmr0_pwm_ch3n			(advtmr0_pwm_ch3n	),
	.advtmr0_pwm_ch4			(advtmr0_pwm_ch4	),
	.advtmr0_pwm_ch5			(advtmr0_pwm_ch5	),
	.advtmr0_pwm_ch6			(advtmr0_pwm_ch6	),
	.advtmr0_pwm_ch1p_oen		(advtmr0_pwm_ch1p_oen),
	.advtmr0_pwm_ch1n_oen		(advtmr0_pwm_ch1n_oen),
	.advtmr0_pwm_ch2p_oen		(advtmr0_pwm_ch2p_oen),
	.advtmr0_pwm_ch2n_oen		(advtmr0_pwm_ch2n_oen),
	.advtmr0_pwm_ch3p_oen		(advtmr0_pwm_ch3p_oen),
	.advtmr0_pwm_ch3n_oen		(advtmr0_pwm_ch3n_oen),
	.advtmr0_pwm_ch4_oen		(advtmr0_pwm_ch4_oen),
	.advtmr0_pwm_ch5_oen		(advtmr0_pwm_ch5_oen),
	.advtmr0_pwm_ch6_oen		(advtmr0_pwm_ch6_oen),
	.advtmr0_bk1				(advtmr0_bk1		),
	.advtmr0_bk2				(advtmr0_bk2		),
	.advtmr0_bk1_oen			(advtmr0_bk1_oen	),
	.advtmr0_bk2_oen			(advtmr0_bk2_oen	),
	.advtmr0_cap_ch1p			(advtmr0_cap_ch1p	),
	.advtmr0_cap_ch1n			(advtmr0_cap_ch1n	),
	.advtmr0_cap_ch1p_oen		(advtmr0_cap_ch1p_oen),
	.advtmr0_cap_ch1n_oen		(advtmr0_cap_ch1n_oen),
	.advtmr0_enc_ch1p			(advtmr0_enc_ch1p	),
	.advtmr0_enc_ch1n			(advtmr0_enc_ch1n	),
	.advtmr0_enc_ch1p_oen		(advtmr0_enc_ch1p_oen),
	.advtmr0_enc_ch1n_oen		(advtmr0_enc_ch1n_oen),
	.spim0_sck					(spim0_sck			),
	.spim0_sck_oen				(spim0_sck_oen		),
	.spim0_mosi_o				(spim0_mosi_o		),
	.spim0_mosi_oen				(spim0_mosi_oen		),
	.spim0_miso_i				(spim0_miso_i		),
	.spim0_miso_oen				(spim0_miso_oen		),
	.spim0_cs_o					(spim0_cs_o			),
	.spim0_cs_oen				(spim0_cs_oen		),

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
assign hsi3 = CLK;
assign lsi = CLK;
assign pll_locked = 1'b1;	

`endif

endmodule


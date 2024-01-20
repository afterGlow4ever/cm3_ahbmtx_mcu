//===============================================
//
//	File: apb0_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11252023
//	Version: v1.0
//
// 	This is top for apb0 sync peripherals domain.
//	This domain is including:
//	1. Debug regs
//
//===============================================

module apb0_top 
(
	input						apb0_root_clk,
	input						apb0_root_rstn,
	
	//pin
	output 						uart0_tx,
	output 						uart0_tx_oen,
	input    					uart0_rx,
	output 						uart0_rx_oen,
	output 						uart1_tx,
	output 						uart1_tx_oen,
	input    					uart1_rx,
	output 						uart1_rx_oen,

	//apb bus interface
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

`ifdef GPIO
	output						psel_gpioa_o,
	output	[31:0]			 	paddr_gpioa_o, 
	input	[31:0]			 	prdata_gpioa_o, 
`endif

	//interrupt line
	output						uart0_int,
	output						uart1_int
);

//===============================================
// APB1 slave mux
//===============================================

wire						 	psel_debug; 
wire						 	pready_debug; 
wire	[31:0]				 	prdata_debug; 
wire						 	pslverr_debug; 
wire	[31:0]					paddr_uart0;
wire						 	psel_uart0; 
wire						 	pready_uart0; 
wire	[31:0]				 	prdata_uart0; 
wire						 	pslverr_uart0; 
wire	[31:0]					paddr_uart1;
wire						 	psel_uart1; 
wire						 	pready_uart1; 
wire	[31:0]				 	prdata_uart1; 
wire						 	pslverr_uart1; 
wire	[31:0]					paddr_gpioa;
wire						 	psel_gpioa; 
wire						 	pready_gpioa; 
wire	[31:0]				 	prdata_gpioa; 
wire						 	pslverr_gpioa; 

cmsdk_apb_slave_mux 
#(
    .PORT0_ENABLE                       (1),
    .PORT1_ENABLE                       (1),
    .PORT2_ENABLE                       (1),
    .PORT3_ENABLE                       (0),
    .PORT4_ENABLE                       (0),
    .PORT5_ENABLE                       (0),
    .PORT6_ENABLE                       (0),
    .PORT7_ENABLE                       (0),
    .PORT8_ENABLE                       (0),
    .PORT9_ENABLE                       (0),
    .PORT10_ENABLE                      (1),
    .PORT11_ENABLE                      (0),
    .PORT12_ENABLE                      (0),
    .PORT13_ENABLE                      (0),
    .PORT14_ENABLE                      (0),
    .PORT15_ENABLE                      (0)
)   
u_apb0_slave_mux
(
    .DECODE4BIT                         (paddr[15:12]),
    .PSEL                               (psel),

    .PSEL0                              (psel_debug),
    .PREADY0                            (pready_debug),
    .PRDATA0                            (prdata_debug),
    .PSLVERR0                           (pslverr_debug),
    
    .PSEL1                              (psel_uart0),
    .PREADY1                            (pready_uart0),
    .PRDATA1                            (prdata_uart0),
    .PSLVERR1                           (pslverr_uart0),

    .PSEL2                              (psel_uart1),
    .PREADY2                            (pready_uart1),
    .PRDATA2                            (prdata_uart1),
    .PSLVERR2                           (pslverr_uart1),

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

    .PSEL10                             (psel_gpioa),
    .PREADY10                           (pready_gpioa),
    .PRDATA10                           (prdata_gpioa),
    .PSLVERR10                          (pslverr_gpioa),

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
// APB0 debug reg
// 0x40000000~0x40000010
//===============================================

assign pready_debug = 1'b1;
assign pslverr_debug = 1'b0;

debug0_apb_cfg u_debug_reg
(
	.clk						(apb0_root_clk),
	.rst_n						(apb0_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel_debug),						
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata_debug),
	.debug0						(),
	.debug1						(),
	.debug2						(),
	.debug3						()
);

//===============================================
// APB0 uart0
// 0x40001000~0x40001FFF
//===============================================

assign pready_uart0 = 1'b1;
assign pslverr_uart0 = 1'b0;

`ifdef UART0
assign paddr_uart0 = paddr;// compatible with uart reg

uart_top u_uart0
(
	.module_clk					(apb0_root_clk),  
	.module_rstn				(apb0_root_rstn),
	
	.uart_tx					(uart0_tx),
	.uart_tx_oen				(uart0_tx_oen),
	.uart_rx					(uart0_rx),
	.uart_rx_oen				(uart0_rx_oen),

	.reg_clk					(apb0_root_clk),
	.reg_rstn					(apb0_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel_uart0),						
	.penable					(penable),
	.paddr						(paddr_uart0),
	.pwdata						(pwdata),
	.prdata						(prdata_uart0),

	.uart_int_line				(uart0_int)
);
`else
assign uart0_tx = 1'b0;
assign uart0_tx_oen = 1'b1;
assign uart0_rx_oen = 1'b1;
assign prdata_uart0 = 32'h0;
assign uart0_int = 1'b0;
`endif

//===============================================
// APB0 uart1
// 0x40002000~0x40002FFF
//===============================================

assign pready_uart1 = 1'b1;
assign pslverr_uart1 = 1'b0;

`ifdef UART1
assign paddr_uart1 = {paddr[31:16], 4'h1, paddr[11:0]};// compatible with uart reg

uart_top u_uart1
(
	.module_clk					(apb0_root_clk),  
	.module_rstn				(apb0_root_rstn),
	
	.uart_tx					(uart1_tx),
	.uart_tx_oen				(uart1_tx_oen),
	.uart_rx					(uart1_rx),
	.uart_rx_oen				(uart1_rx_oen),

	.reg_clk					(apb0_root_clk),
	.reg_rstn					(apb0_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel_uart1),						
	.penable					(penable),
	.paddr						(paddr_uart1),
	.pwdata						(pwdata),
	.prdata						(prdata_uart1),

	.uart_int_line				(uart1_int)
);
`else
assign uart1_tx = 1'b0;
assign uart1_tx_oen = 1'b1;
assign uart1_rx_oen = 1'b1;
assign prdata_uart1 = 32'h0;
assign uart1_int = 1'b0;
`endif

//===============================================
// APB0 gpioa
// 0x4000a000~0x4000aFFF
//===============================================

assign pready_gpioa = 1'b1;
assign pslverr_gpioa = 1'b0;

`ifdef GPIO
assign paddr_gpioa = paddr;// compatible with gpioa reg
assign psel_gpioa_o = psel_gpioa;
assign paddr_gpioa_o = paddr_gpioa;
assign prdata_gpioa = prdata_gpioa_o;
`else
assign prdata_gpioa = 32'h0;
`endif


endmodule


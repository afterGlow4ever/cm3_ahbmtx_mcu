//===============================================
//
//	File: apb1_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11252023
//	Version: v1.0
//
// 	This is top for apb1 async peripherals domain.
//	This domain is including:
//	1. Debug regs
//
//===============================================

module apb1_top 
(
	input						apb1_root_clk,
	input						apb1_root_rstn,
	
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

	output	[ 3:0]				bastim_int
);

//===============================================
// APB1 slave mux
//===============================================

wire						 	psel_bastim; 
wire						 	pready_bastim; 
wire	[31:0]				 	prdata_bastim; 
wire						 	pslverr_bastim; 
wire	[31:0]				 	paddr_bastim; 

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
u_apb1_slave_mux
(
    .DECODE4BIT                         (paddr[15:12]),
    .PSEL                               (psel),

    .PSEL0                              (psel_bastim),
    .PREADY0                            (pready_bastim),
    .PRDATA0                            (prdata_bastim),
    .PSLVERR0                           (pslverr_bastim),
    
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
// APB1 basic timer
// 0x40001000~0x40001FFF
//===============================================

assign pready_bastim = 1'b1;
assign pslverr_bastim = 1'b0;

`ifdef BASTIM
assign paddr_bastim = paddr;// compatible with basic timer reg

bastim_top u_bastim
(
	.module_clk					(apb1_root_clk),  
	.module_rstn				(apb1_root_rstn),

	.reg_clk					(apb1_root_clk),
	.reg_rstn					(apb1_root_rstn),
	.pwrite						(pwrite),
	.psel						(psel_bastim),						
	.penable					(penable),
	.paddr						(paddr_bastim),
	.pwdata						(pwdata),
	.prdata						(prdata_bastim),

	.bastim_int_line			(bastim_int)
);
`else
assign prdata_bastim = 32'h0;
assign bastim_int = 4'h0;
`endif

endmodule


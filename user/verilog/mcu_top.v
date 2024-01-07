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
	input  						TDI, 
	input  						TCK, 
	inout  						TMS, 
	output 						TDO, 
	input  						TRST 
);

//===============================================
// rcc
//===============================================

wire							sys_root_clk;
wire							apb1_root_clk;
wire							sys_root_rstn;
wire							apb1_root_rstn;
wire							pll_locked;

assign sys_root_rstn = RSTN & pll_locked;
assign apb0_root_rstn = RSTN & pll_locked;
assign apb1_root_rstn = RSTN & pll_locked;

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

	.TDI						(TDI				),
	.TCK						(TCK				),
	.TMS						(TMS				),
	.TDO						(TDO				),
	.TRST						(TRST				)
);

//===============================================
// fpga platform
//===============================================

assign apb0_root_clk = sys_root_clk;;

`ifdef FPGA

fpga_platform u_fpga_platform
(
	.input_clk					(CLK				),  
	.rstn						(RSTN				),
	.output_clk0				(sys_root_clk		),
	.output_clk1				(apb1_root_clk		),
	.output_clk2				(					),
	.pll_locked					(pll_locked			)	
);

`else
	
assign pll_locked = 1'b1;	
assign sys_root_clk = CLK;
assign apb1_root_clk = CLK;

`endif

endmodule


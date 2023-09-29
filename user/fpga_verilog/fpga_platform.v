//===============================================
//
//	File: fpga_platform.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09102023
//	Version: v1.0
//
// 	This is top for fpga issue.
//	This top is including:
//	unlock protect: protect when fpga pll unlock.
//	pll: Generate different clock for mcu in fpga.
//
//===============================================

module fpga_platform
(
	input  						input_clk,  
	input  						rstn,
	output 						output_clk0, 
	output 						output_clk1, 
	output 						output_clk2, 
	output reg 					pll_locked 	
);

//===============================================
// pll lock loss protection
//===============================================

// PLL locked signal
wire							pll0_locked;
reg		[3:0]					pll_locked_cnt;
reg								pll_locked_d;

// PLL rstn signal
wire							pll_rstn;
wire							pll_rstn_flag;

// PLL locked logic
// PLL should reset after PLL unlocked.
always @(posedge input_clk or negedge rstn)
begin
	if(!rstn)
		pll_locked_cnt <= 4'd10;
	else if(pll0_locked)
		if(pll_locked_cnt > 4'd0)
			pll_locked_cnt <= pll_locked_cnt - 1'b1;
		else
			pll_locked_cnt <= pll_locked_cnt;
	else
		pll_locked_cnt <= 4'd10;
end

always @(posedge input_clk or negedge rstn)
begin
	if(!rstn)
		pll_locked <= 1'b0;
	else if(pll_locked_cnt == 1'b0)
		pll_locked <= 1'b1;
	else
		pll_locked <= 1'b0;
end

always @(posedge input_clk or negedge rstn)
begin
	if(!rstn)
		pll_locked_d <= 1'b0;
	else
		pll_locked_d <= pll_locked;
end

// PLL rstn logic
assign pll_rstn_flag = ((pll_locked == 1'b0) & (pll_locked_d == 1'b1)) ? 1'b0 : 1'b1;
assign pll_rstn = rstn & pll_rstn_flag;

//===============================================
// pll ipcores
//===============================================

`ifdef ALTERA_EP4
pll_50m u_pll0
(
	.areset						(~pll_rstn),
	.inclk0						(input_clk),
	.c0							(output_clk0),//40mhz
	.c1							(output_clk1),//50mhz
	.c2							(output_clk2),//80mhz
	.locked						(pll0_locked)
);
`elsif ZYNQ_7020
pll_50m u_pll0
(
	.reset						(~pll_rstn),
	.clk_in1					(input_clk),
	.clk_out1					(output_clk0),//40mhz
	.clk_out2					(output_clk1),//50mhz
	.clk_out3					(output_clk2),//80mhz
	.locked						(pll0_locked)
);
`endif

endmodule


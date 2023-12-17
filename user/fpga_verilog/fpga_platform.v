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
	output 						clk_40mhz, 
	output 						clk_50mhz, 
	output 						clk_80mhz, 
	output 						clk_10mhz, 
	output reg 					pll_locked, 	
	output	 					lsi_locked 	
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
// hsi & pll : pll ipcores
//===============================================

`ifdef ALTERA_EP4
pll_50m u_pll0
(
	.areset						(~pll_rstn),
	.inclk0						(input_clk),
	.c0							(clk_40mhz),//40mhz
	.c1							(clk_50mhz),//50mhz
	.c2							(clk_80mhz),//80mhz
	.locked						(pll0_locked)
);
`elsif ZYNQ_7020
pll_50m u_pll0
(
	.reset						(~pll_rstn),
	.clk_in1					(input_clk),
	.clk_out1					(clk_40mhz),//40mhz
	.clk_out2					(clk_50mhz),//50mhz
	.clk_out3					(clk_80mhz),//80mhz
	.locked						(pll0_locked)
);
`endif

//===============================================
// lsi : clock divider
//===============================================

clk_even_division 
#(
	.N							(8)
)
u_lsi
(
	.inclk						(clk_80mhz),
	.rstn						(pll0_locked),
	.outclk						(),
	.outclkn					(clk_10mhz),
	.locked						(lsi_locked)
);

endmodule


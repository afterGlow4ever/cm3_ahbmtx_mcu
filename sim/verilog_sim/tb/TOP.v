//===============================================
//
//	File: TOP.v
//	Author: afterGlow,4ever
//	Date: 07022023
//	Version: v1.0
//
// 	This is testbench for mcu 'cm3_ahbmtx'.
//	This test bench is used for asic sim.
//
//===============================================

`timescale 1ns/1ns

module TOP;

reg											clk;
reg											rstn;
wire										tdi;
wire										tdo;
wire										tck;
wire										tms;
wire										trstn;

//===============================================
// Clk and rst
//===============================================

// clk 25MHz
initial
begin
	clk = 1'b0;
	#100
	forever #(20) clk = ~clk;
end

// system reset will be release at 500ns
initial
begin
	rstn = 1'b0;
	#500
	rstn = 1'b1;
end

//===============================================
// Mcu top
//===============================================

mcu_top u_mcu_top
(
	.CLK									(clk				),
	.RSTN									(rstn				),

	.TDI									(tdi				),
	.TCK									(tck				),
	.TMS									(tms				),
	.TDO									(tdo				),
	.TRST									(trstn			)	
);

//===============================================
// Waveform config
//===============================================

`ifdef FSDB_DUMP
initial
begin
	$fsdbDumpfile("TOP.fsdb");
	$fsdbDumpvars(0, TOP);
	$fsdbDumpMDA();
end
`endif

//===============================================
// Other modules
//===============================================

`include "modules.v"

endmodule


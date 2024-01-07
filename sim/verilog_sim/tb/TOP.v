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

reg								clk_50mhz;
reg								clk_20mhz;
reg								rstn;
wire							tdi;
wire							tdo;
wire							tck;
wire							tms;
wire							trstn;

//===============================================
// Clk and rst
//===============================================

// clk 50MHz
initial
begin
	clk_50mhz = 1'b0;
	#100
	forever #(10) clk_50mhz = ~clk_50mhz;
end

// clk 20MHz
initial
begin
	clk_20mhz = 1'b0;
	#100
	forever #(25) clk_20mhz = ~clk_20mhz;
end

//initial
//begin
//	force TOP.u_mcu_top.apb1_root_clk = clk_20mhz;
//end

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
	.CLK						(clk_50mhz			),
	.RSTN						(rstn				),

	.TDI						(tdi				),
	.TCK						(tck				),
	.TMS						(tms				),
	.TDO						(tdo				),
	.TRST						(trstn				)	
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
// Simulation result check monitor
//===============================================

sim_monitor u_sim_monitor();

//===============================================
// Other modules
//===============================================

`include "modules.v"

endmodule


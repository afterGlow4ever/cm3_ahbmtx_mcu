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
reg								clk_40mhz;
reg								clk_20mhz;
reg								clk_10mhz;
wire							clk;
reg								rstn;
wire							txd;
wire							rxd;
wire							txd1;
wire							rxd1;
wire							mdc;
wire							mdio;
wire							tdi;
wire							tdo;
wire							tck;
wire							tms;
wire							trstn;

//===============================================
// gpio
//===============================================

`ifdef GPIO
wire							a15;
wire							a14;
wire							a13;
wire							a12;
wire							a11;
wire							a10;
wire							a9;
wire							a8;
wire							a7;
wire							a6;
wire							a5;
wire							a4;
wire							a3;
wire							a2;
wire							a1;
wire							a0;
`endif

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

// clk 40MHz
initial
begin
	clk_40mhz = 1'b0;
	#100
	forever #(12.5) clk_40mhz = ~clk_40mhz;
end

// clk 20MHz
initial
begin
	clk_20mhz = 1'b0;
	#100
	forever #(25) clk_20mhz = ~clk_20mhz;
end

// clk 10MHz
initial
begin
	clk_10mhz = 1'b0;
	#100
	forever #(50) clk_10mhz = ~clk_10mhz;
end

`ifdef FPGA
assign clk = clk_50mhz;
`else
assign clk = clk_40mhz;
`endif

initial
begin
`ifdef FPGA
`else
	force TOP.u_mcu_top.apb1_root_clk = clk_10mhz;
	force TOP.u_mcu_top.apb2_root_clk = clk_50mhz;
`endif
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
	.CLK						(clk				),
	.RSTN						(rstn				),

`ifdef GPIO
	.GPIOA						({a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0}),
`else
	.TXD1						(txd1				),
	.RXD1						(rxd1				),
	.MDC						(mdc				),
	.MDIO						(mdio				),
`endif
	.TXD						(txd				),
	.RXD						(rxd				),
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


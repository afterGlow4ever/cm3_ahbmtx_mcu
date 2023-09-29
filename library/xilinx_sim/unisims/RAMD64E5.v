///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                   Static Dual Port Synchronous RAM 64-Deep by 1-Wide
// /___/   /\      Filename    : RAMD64E5.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    10/05/16 - Initial from RAMD64E
// End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAMD64E5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT = 64'h0000000000000000,
  parameter [0:0] IS_CLK_INVERTED = 1'b0
)(
  output O,

  input ADR0,
  input ADR1,
  input ADR2,
  input ADR3,
  input ADR4,
  input ADR5,
  input CLK,
  input I,
  input WADR0,
  input WADR1,
  input WADR2,
  input WADR3,
  input WADR4,
  input WADR5,
  input WE,
  input WE2
);
  
// define constants
  localparam MODULE_NAME = "RAMD64E5";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "RAMD64E5_dr.v"
`else
  reg [63:0] INIT_REG = INIT;
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
`endif

  wire ADR0_in;
  wire ADR1_in;
  wire ADR2_in;
  wire ADR3_in;
  wire ADR4_in;
  wire ADR5_in;
  wire CLK_in;
  wire I_in;
  wire WADR0_in;
  wire WADR1_in;
  wire WADR2_in;
  wire WADR3_in;
  wire WADR4_in;
  wire WADR5_in;
  wire WE2_in;
  wire WE_in;

`ifdef XIL_TIMING
  wire CLK_delay;
  wire I_delay;
  wire WADR0_delay;
  wire WADR1_delay;
  wire WADR2_delay;
  wire WADR3_delay;
  wire WADR4_delay;
  wire WADR5_delay;
  wire WE2_delay;
  wire WE_delay;
`endif

`ifdef XIL_TIMING
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_REG;
  assign I_in = I_delay;
  assign WADR0_in = WADR0_delay;
  assign WADR1_in = WADR1_delay;
  assign WADR2_in = WADR2_delay;
  assign WADR3_in = WADR3_delay;
  assign WADR4_in = WADR4_delay;
  assign WADR5_in = WADR5_delay;
  assign WE2_in = (WE2 === 1'bz) || WE2_delay; // rv 1
  assign WE_in = (WE === 1'bz) || WE_delay; // rv 1
`else
  assign CLK_in = CLK ^ IS_CLK_INVERTED_REG;
  assign I_in = I;
  assign WADR0_in = WADR0;
  assign WADR1_in = WADR1;
  assign WADR2_in = WADR2;
  assign WADR3_in = WADR3;
  assign WADR4_in = WADR4;
  assign WADR5_in = WADR5;
  assign WE2_in = (WE2 === 1'bz) || WE2; // rv 1
  assign WE_in = (WE === 1'bz) || WE; // rv 1
`endif

  assign ADR0_in = ADR0;
  assign ADR1_in = ADR1;
  assign ADR2_in = ADR2;
  assign ADR3_in = ADR3;
  assign ADR4_in = ADR4;
  assign ADR5_in = ADR5;

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
  end
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg O_out;

  assign O = O_out;

  reg [63:0] mem;

`ifndef XIL_XECLIB
  initial begin
    mem = INIT_REG;
    O_out = mem[{ADR5_in,ADR4_in,ADR3_in,ADR2_in,ADR1_in,ADR0_in}];
  end
`endif

  always @(posedge CLK_in)
    if ((WE_in == 1'b1) && (WE2_in == 1'b1)) begin
      mem[{WADR5_in,WADR4_in,WADR3_in,WADR2_in,WADR1_in,WADR0_in}] = I_in;
    end

  always @ (*) begin
    O_out = mem[{ADR5_in,ADR4_in,ADR3_in,ADR2_in,ADR1_in,ADR0_in}];
  end

`ifdef XIL_TIMING
  always @(notifier) mem[{WADR5_in,WADR4_in,WADR3_in,WADR2_in,WADR1_in,WADR0_in}] = 1'bx;
`endif

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING

  wire clk_en_n;
  wire clk_en_p;

  assign clk_en_n = IS_CLK_INVERTED_REG;
  assign clk_en_p = ~IS_CLK_INVERTED_REG;

`endif

  specify
    (ADR0 => O) = (0:0:0, 0:0:0);
    (ADR1 => O) = (0:0:0, 0:0:0);
    (ADR2 => O) = (0:0:0, 0:0:0);
    (ADR3 => O) = (0:0:0, 0:0:0);
    (ADR4 => O) = (0:0:0, 0:0:0);
    (ADR5 => O) = (0:0:0, 0:0:0);
    (CLK => O) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $setuphold (negedge CLK, negedge I, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, I_delay);
    $setuphold (negedge CLK, negedge WADR0, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR0_delay);
    $setuphold (negedge CLK, negedge WADR1, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR1_delay);
    $setuphold (negedge CLK, negedge WADR2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR2_delay);
    $setuphold (negedge CLK, negedge WADR3, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR3_delay);
    $setuphold (negedge CLK, negedge WADR4, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR4_delay);
    $setuphold (negedge CLK, negedge WADR5, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR5_delay);
    $setuphold (negedge CLK, negedge WE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE_delay);
    $setuphold (negedge CLK, negedge WE2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE2_delay);
    $setuphold (negedge CLK, posedge I, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, I_delay);
    $setuphold (negedge CLK, posedge WADR0, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR0_delay);
    $setuphold (negedge CLK, posedge WADR1, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR1_delay);
    $setuphold (negedge CLK, posedge WADR2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR2_delay);
    $setuphold (negedge CLK, posedge WADR3, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR3_delay);
    $setuphold (negedge CLK, posedge WADR4, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR4_delay);
    $setuphold (negedge CLK, posedge WADR5, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WADR5_delay);
    $setuphold (negedge CLK, posedge WE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE_delay);
    $setuphold (negedge CLK, posedge WE2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE2_delay);
    $setuphold (posedge CLK, negedge I, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, I_delay);
    $setuphold (posedge CLK, negedge WADR0, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR0_delay);
    $setuphold (posedge CLK, negedge WADR1, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR1_delay);
    $setuphold (posedge CLK, negedge WADR2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR2_delay);
    $setuphold (posedge CLK, negedge WADR3, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR3_delay);
    $setuphold (posedge CLK, negedge WADR4, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR4_delay);
    $setuphold (posedge CLK, negedge WADR5, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR5_delay);
    $setuphold (posedge CLK, negedge WE, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE_delay);
    $setuphold (posedge CLK, negedge WE2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE2_delay);
    $setuphold (posedge CLK, posedge I, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, I_delay);
    $setuphold (posedge CLK, posedge WADR0, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR0_delay);
    $setuphold (posedge CLK, posedge WADR1, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR1_delay);
    $setuphold (posedge CLK, posedge WADR2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR2_delay);
    $setuphold (posedge CLK, posedge WADR3, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR3_delay);
    $setuphold (posedge CLK, posedge WADR4, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR4_delay);
    $setuphold (posedge CLK, posedge WADR5, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WADR5_delay);
    $setuphold (posedge CLK, posedge WE, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE_delay);
    $setuphold (posedge CLK, posedge WE2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE2_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine

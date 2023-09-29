///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                   Static Single Port Synchronous RAM 64-Deep by 1-Wide
// /___/   /\      Filename    : RAMS64E5.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    10/05/16 - Initial from RAMS64E.
// End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAMS64E5 #(
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
  input WE,
  input WE2
);
  
// define constants
  localparam MODULE_NAME = "RAMS64E5";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "RAMS64E5_dr.v"
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
  wire WE2_in;
  wire WE_in;

`ifdef XIL_TIMING
  wire ADR0_delay;
  wire ADR1_delay;
  wire ADR2_delay;
  wire ADR3_delay;
  wire ADR4_delay;
  wire ADR5_delay;
  wire CLK_delay;
  wire I_delay;
  wire WE2_delay;
  wire WE_delay;
`endif

`ifdef XIL_TIMING
  assign ADR0_in = ADR0_delay;
  assign ADR1_in = ADR1_delay;
  assign ADR2_in = ADR2_delay;
  assign ADR3_in = ADR3_delay;
  assign ADR4_in = ADR4_delay;
  assign ADR5_in = ADR5_delay;
  assign CLK_in = CLK_delay ^ IS_CLK_INVERTED_REG;
  assign I_in = I_delay;
  assign WE2_in = (WE2 === 1'bz) || WE2_delay; // rv 1
  assign WE_in = (WE === 1'bz) || WE_delay; // rv 1
`else
  assign ADR0_in = ADR0;
  assign ADR1_in = ADR1;
  assign ADR2_in = ADR2;
  assign ADR3_in = ADR3;
  assign ADR4_in = ADR4;
  assign ADR5_in = ADR5;
  assign CLK_in = CLK ^ IS_CLK_INVERTED_REG;
  assign I_in = I;
  assign WE2_in = (WE2 === 1'bz) || WE2; // rv 1
  assign WE_in = (WE === 1'bz) || WE; // rv 1
`endif

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
     O_out = mem[{ADR5_in, ADR4_in, ADR3_in, ADR2_in, ADR1_in, ADR0_in}];
  end
`endif

  always @(posedge CLK_in)
    if ((WE_in == 1'b1) && (WE2_in == 1'b1)) begin
      mem[{ADR5_in, ADR4_in, ADR3_in, ADR2_in, ADR1_in, ADR0_in}] = I_in;
    end

   always @ (*) begin
     O_out = mem[{ADR5_in, ADR4_in, ADR3_in, ADR2_in, ADR1_in, ADR0_in}];
   end

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
    $setuphold (negedge CLK, negedge ADR0, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR0_delay);
    $setuphold (negedge CLK, negedge ADR1, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR1_delay);
    $setuphold (negedge CLK, negedge ADR2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR2_delay);
    $setuphold (negedge CLK, negedge ADR3, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR3_delay);
    $setuphold (negedge CLK, negedge ADR4, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR4_delay);
    $setuphold (negedge CLK, negedge ADR5, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR5_delay);
    $setuphold (negedge CLK, negedge I, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, I_delay);
    $setuphold (negedge CLK, negedge WE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE_delay);
    $setuphold (negedge CLK, negedge WE2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE2_delay);
    $setuphold (negedge CLK, posedge ADR0, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR0_delay);
    $setuphold (negedge CLK, posedge ADR1, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR1_delay);
    $setuphold (negedge CLK, posedge ADR2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR2_delay);
    $setuphold (negedge CLK, posedge ADR3, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR3_delay);
    $setuphold (negedge CLK, posedge ADR4, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR4_delay);
    $setuphold (negedge CLK, posedge ADR5, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, ADR5_delay);
    $setuphold (negedge CLK, posedge I, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, I_delay);
    $setuphold (negedge CLK, posedge WE, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE_delay);
    $setuphold (negedge CLK, posedge WE2, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, WE2_delay);
    $setuphold (posedge CLK, negedge ADR0, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR0_delay);
    $setuphold (posedge CLK, negedge ADR1, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR1_delay);
    $setuphold (posedge CLK, negedge ADR2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR2_delay);
    $setuphold (posedge CLK, negedge ADR3, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR3_delay);
    $setuphold (posedge CLK, negedge ADR4, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR4_delay);
    $setuphold (posedge CLK, negedge ADR5, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR5_delay);
    $setuphold (posedge CLK, negedge I, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, I_delay);
    $setuphold (posedge CLK, negedge WE, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE_delay);
    $setuphold (posedge CLK, negedge WE2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, WE2_delay);
    $setuphold (posedge CLK, posedge ADR0, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR0_delay);
    $setuphold (posedge CLK, posedge ADR1, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR1_delay);
    $setuphold (posedge CLK, posedge ADR2, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR2_delay);
    $setuphold (posedge CLK, posedge ADR3, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR3_delay);
    $setuphold (posedge CLK, posedge ADR4, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR4_delay);
    $setuphold (posedge CLK, posedge ADR5, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, ADR5_delay);
    $setuphold (posedge CLK, posedge I, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, I_delay);
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

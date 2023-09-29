///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2014 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 2014.3
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  Static Synchronous RAM 64-Deep by 1-Wide
// /___/   /\     Filename : RAM64X1S.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Remove input/output bufs; Remove for-loop in initial block;
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    04/18/13 - PR683925 - add invertible pin support.
//    10/22/14 - Added #1 to $finish (CR 808642).
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module RAM64X1S #(
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED",
`endif
    parameter [63:0] INIT = 64'h0,
    parameter [0:0] IS_WCLK_INVERTED = 1'b0
) (
    output O,

    input  A0,
    input  A1,
    input  A2,
    input  A3,
    input  A4,
    input  A5,
    input D,
    input WCLK,
    input WE
);

// define constants
  localparam MODULE_NAME = "RAM64X1S";

  reg trig_attr = 1'b0;

`ifdef XIL_ATTR_TEST
  reg attr_test = 1'b1;
`else
  reg attr_test = 1'b0;
`endif
  reg attr_err = 1'b0;

  wire IS_WCLK_INVERTED_BIN;

  wire D_in;
  wire WCLK_in;
  wire WE_in;
  wire [5:0] A_in;

  assign IS_WCLK_INVERTED_BIN = IS_WCLK_INVERTED;

`ifdef XIL_TIMING
  wire D_dly;
  wire WCLK_dly;
  wire WE_dly;
  wire [5:0] A_dly;
    
  reg notifier;

  wire sh_clk_en_p;
  wire sh_clk_en_n;
  wire sh_we_clk_en_p;
  wire sh_we_clk_en_n;

  assign A_in = A_dly;
  assign D_in = D_dly;
  assign WCLK_in = WCLK_dly ^ IS_WCLK_INVERTED_BIN;
  assign WE_in = (WE === 1'bz) || WE_dly; // rv 1
`else
  assign A_in = {A5, A4, A3, A2, A1, A0};
  assign D_in = D;
  assign WCLK_in = WCLK ^ IS_WCLK_INVERTED_BIN;
  assign WE_in = (WE === 1'bz) || WE; // rv 1
`endif
    
  reg  [63:0] mem;

  initial 
    mem = INIT;

  assign O = mem[A_in];
  always @(posedge WCLK_in) 
    if (WE_in == 1'b1) mem[A_in] <= #100 D_in;
    
`ifdef XIL_TIMING
  always @(notifier) mem[A_in] <= 1'bx;
  assign sh_clk_en_p = ~IS_WCLK_INVERTED_BIN;
  assign sh_clk_en_n = IS_WCLK_INVERTED_BIN;
  assign sh_we_clk_en_p = WE_in && ~IS_WCLK_INVERTED_BIN;
  assign sh_we_clk_en_n = WE_in && IS_WCLK_INVERTED_BIN;
    
  specify
  (WCLK => O) = (0:0:0, 0:0:0);
  (A0 => O) = (0:0:0, 0:0:0);
  (A1 => O) = (0:0:0, 0:0:0);
  (A2 => O) = (0:0:0, 0:0:0);
  (A3 => O) = (0:0:0, 0:0:0);
  (A4 => O) = (0:0:0, 0:0:0);
  (A5 => O) = (0:0:0, 0:0:0);
  $period (negedge WCLK &&& WE, 0:0:0, notifier);
  $period (posedge WCLK &&& WE, 0:0:0, notifier);
  $setuphold (negedge WCLK, negedge A0, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, negedge A1, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, negedge A2, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, negedge A3, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, negedge A4, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, negedge A5, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, negedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_n,sh_clk_en_n,WCLK_dly,WE_dly);
  $setuphold (negedge WCLK, posedge A0, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[0]);
  $setuphold (negedge WCLK, posedge A1, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[1]);
  $setuphold (negedge WCLK, posedge A2, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[2]);
  $setuphold (negedge WCLK, posedge A3, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[3]);
  $setuphold (negedge WCLK, posedge A4, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[4]);
  $setuphold (negedge WCLK, posedge A5, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,A_dly[5]);
  $setuphold (negedge WCLK, posedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_n,sh_we_clk_en_n,WCLK_dly,D_dly);
  $setuphold (negedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_n,sh_clk_en_n,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, negedge A0, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, negedge A1, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, negedge A2, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, negedge A3, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, negedge A4, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, negedge A5, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, negedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, negedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_p,sh_clk_en_p,WCLK_dly,WE_dly);
  $setuphold (posedge WCLK, posedge A0, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[0]);
  $setuphold (posedge WCLK, posedge A1, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[1]);
  $setuphold (posedge WCLK, posedge A2, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[2]);
  $setuphold (posedge WCLK, posedge A3, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[3]);
  $setuphold (posedge WCLK, posedge A4, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[4]);
  $setuphold (posedge WCLK, posedge A5, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,A_dly[5]);
  $setuphold (posedge WCLK, posedge D, 0:0:0, 0:0:0, notifier,sh_we_clk_en_p,sh_we_clk_en_p,WCLK_dly,D_dly);
  $setuphold (posedge WCLK, posedge WE, 0:0:0, 0:0:0, notifier,sh_clk_en_p,sh_clk_en_p,WCLK_dly,WE_dly);
   specparam PATHPULSE$ = 0;
  endspecify
`endif
    
endmodule

`endcelldefine

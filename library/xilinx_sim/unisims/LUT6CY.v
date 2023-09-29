///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                   6-input Look-Up-Table with Two Outputs and Carry
// /___/   /\      Filename : LUT6CY.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    07/09/16 Initial
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUT6CY #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [63:0] INIT = 64'h0000000000000000
)(
  output GE,
  output O51,
  output O52,
  output PROP,

  input I0,
  input I1,
  input I2,
  input I3,
  input I4
);

// define constants
  localparam MODULE_NAME = "LUT6CY";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUT6CY_dr.v"
`else
  reg [63:0] INIT_REG = INIT;
`endif

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
  end
`endif

// begin behavioral model

  reg O51_out;
  reg O52_out;
  reg PROP_out;

  assign O51 = O51_out;
  assign O52 = O52_out;
  assign PROP = PROP_out;

  function lut_mux4_f;
  input [3:0] d;
  input [1:0] s;
  begin
    if (((s[1]^s[0]) === 1'b1) || ((s[1]^s[0]) === 1'b0))
      lut_mux4_f = d[s];
    else if ( ~(|d) || &d)
      lut_mux4_f = d[0];
    else if (((s[0] === 1'b1) || (s[0] === 1'b0)) && (d[{1'b0,s[0]}] === d[{1'b1,s[0]}]))
      lut_mux4_f = d[{1'b0,s[0]}];
    else if (((s[1] === 1'b1) || (s[1] === 1'b0)) && (d[{s[1],1'b0}] === d[{s[1],1'b1}]))
      lut_mux4_f = d[{s[1],1'b0}];
    else
      lut_mux4_f = 1'bx;
  end
  endfunction

  function lut_mux8_f;
  input [7:0] d;
  input [2:0] s;
  begin
    if (((s[2]^s[1]^s[0]) === 1'b1) || ((s[2]^s[1]^s[0]) === 1'b0))
      lut_mux8_f = d[s];
    else if ( ~(|d) || &d)
      lut_mux8_f = d[0];
    else if ((((s[1]^s[0]) === 1'b1) || ((s[1]^s[0]) === 1'b0)) &&
             (d[{1'b0,s[1:0]}] === d[{1'b1,s[1:0]}]))
      lut_mux8_f = d[{1'b0,s[1:0]}];
    else if ((((s[2]^s[0]) === 1'b1) || ((s[2]^s[0]) === 1'b0)) &&
             (d[{s[2],1'b0,s[0]}] === d[{s[2],1'b1,s[0]}]))
      lut_mux8_f = d[{s[2],1'b0,s[0]}];
    else if ((((s[2]^s[1]) === 1'b1) || ((s[2]^s[1]) === 1'b0)) &&
             (d[{s[2],s[1],1'b0}] === d[{s[2],s[1],1'b1}]))
      lut_mux8_f = d[{s[2:1],1'b0}];
    else if (((s[0] === 1'b1) || (s[0] === 1'b0)) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b0,1'b1,s[0]}]) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b1,1'b0,s[0]}]) &&
             (d[{1'b0,1'b0,s[0]}] === d[{1'b1,1'b1,s[0]}]))
      lut_mux8_f = d[{1'b0,1'b0,s[0]}];
    else if (((s[1] === 1'b1) || (s[1] === 1'b0)) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b0,s[1],1'b1}]) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b1,s[1],1'b0}]) &&
             (d[{1'b0,s[1],1'b0}] === d[{1'b1,s[1],1'b1}]))
      lut_mux8_f = d[{1'b0,s[1],1'b0}];
    else if (((s[2] === 1'b1) || (s[2] === 1'b0)) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b0,1'b1}]) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b1,1'b0}]) &&
             (d[{s[2],1'b0,1'b0}] === d[{s[2],1'b1,1'b1}]))
      lut_mux8_f = d[{s[2],1'b0,1'b0}];
    else
      lut_mux8_f = 1'bx;
  end
  endfunction

  always @( I0 or I1 or I2 or I3)  begin
    if ( (I0 ^ I1  ^ I2 ^ I3) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3) === 1'b1) begin
      PROP_out = INIT_REG[{1'b0, 1'b0, I3, I2, I1, I0}];
    end else if ( ~(|INIT_REG[15:0]) || &INIT_REG[15:0] ) begin
      PROP_out = INIT_REG[0];
    end else begin
      PROP_out =  lut_mux4_f ({lut_mux4_f ( INIT_REG[15:12], {I1, I0}),
                           lut_mux4_f (  INIT_REG[11:8], {I1, I0}),
                           lut_mux4_f (   INIT_REG[7:4], {I1, I0}),
                           lut_mux4_f (   INIT_REG[3:0], {I1, I0}) }, {I3, I2});
    end
  end

  always @(I0 or I1 or I2 or I3 or I4)  begin
    if ( (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b1) begin
       O51_out = INIT_REG[{1'b0, I4, I3, I2, I1, I0}];
       O52_out = INIT_REG[{1'b1, I4, I3, I2, I1, I0}];
    end else begin
      if ( ~(|INIT_REG[31:0]) || &INIT_REG[31:0] ) begin
        O51_out = INIT_REG[0];
      end else begin
        O51_out = lut_mux4_f ({lut_mux8_f (INIT_REG[31:24], {I2, I1, I0}),
                           lut_mux8_f (INIT_REG[23:16], {I2, I1, I0}),
                           lut_mux8_f ( INIT_REG[15:8], {I2, I1, I0}),
                           lut_mux8_f (  INIT_REG[7:0], {I2, I1, I0})}, {I4, I3});
      end
      if ( ~(|INIT_REG[63:32]) || &INIT_REG[63:32] ) begin
        O52_out = INIT_REG[32];
      end else begin
        O52_out = lut_mux4_f ({lut_mux8_f ( INIT_REG[63:56], {I2, I1, I0}),
                           lut_mux8_f ( INIT_REG[55:48], {I2, I1, I0}),
                           lut_mux8_f ( INIT_REG[47:40], {I2, I1, I0}),
                           lut_mux8_f ( INIT_REG[39:32], {I2, I1, I0}) }, {I4, I3});
      end
    end
  end

// end behavioral model

endmodule

`endcelldefine

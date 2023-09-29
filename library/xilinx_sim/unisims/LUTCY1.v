///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2018.1
//  \   \         Description : Xilinx Unified Simulation Library Component
//  /   /                  5-Bit Look-Up Table with Carry
// /___/   /\     Filename : LUTCY1.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps

`celldefine

module LUTCY1 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [31:0] INIT = 32'h00000000
)(
  output O,
  output PROP,

  input I0,
  input I1,
  input I2,
  input I3,
  input I4
);

// define constants
  localparam MODULE_NAME = "LUTCY1";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LUTCY1_dr.v"
`else
  reg [31:0] INIT_REG = INIT;
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

// begin behavioral model

  reg O_out;
  reg PROP_out;

  assign O = O_out;
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
      PROP_out = INIT_REG[{1'b0, I3, I2, I1, I0}];
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
   if ( (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b0 || (I0 ^ I1  ^ I2 ^ I3 ^ I4) === 1'b1)
     O_out = INIT_REG[{I4, I3, I2, I1, I0}];
   else if ( ~(|INIT_REG) || &INIT_REG )
     O_out = INIT_REG[0];
   else
     O_out = lut_mux4_f ({lut_mux8_f (INIT_REG[31:24], {I2, I1, I0}),
                      lut_mux8_f (INIT_REG[23:16], {I2, I1, I0}),
                      lut_mux8_f ( INIT_REG[15:8], {I2, I1, I0}),
                      lut_mux8_f (  INIT_REG[7:0], {I2, I1, I0})}, {I4, I3});
  end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (I0 => O) = (0:0:0, 0:0:0);
    (I0 => PROP) = (0:0:0, 0:0:0);
    (I1 => O) = (0:0:0, 0:0:0);
    (I1 => PROP) = (0:0:0, 0:0:0);
    (I2 => O) = (0:0:0, 0:0:0);
    (I2 => PROP) = (0:0:0, 0:0:0);
    (I3 => O) = (0:0:0, 0:0:0);
    (I3 => PROP) = (0:0:0, 0:0:0);
    (I4 => O) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine

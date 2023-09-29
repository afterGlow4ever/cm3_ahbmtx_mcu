///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        3-State Diffential Signaling I/O Buffer
// /___/   /\      Filename    : IOBUFDS.v
// \   \  /  \
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    05/23/07 - Added wire declaration for internal signals.
//    07/26/07 - Add else to handle x case for o_out (CR 424214). 
//    07/16/08 - Added IBUF_LOW_PWR attribute.
//    03/19/09 - CR 511590 - Added Z condition handling
//    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
//    10/14/09 - CR 535630 - Added DIFF_TERM attribute.
//    05/12/10 - CR 559468 - Added DRC warnings for LVDS_25 bus architectures.
//    12/01/10 - CR 584500 - added attribute SLEW
//    08/08/11 - CR 616816 - ncsim compile error during XIL_TIMING
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/13/12 - 669215 - add parameter DQS_BIAS
//    08/28/12 - 675511 - add DQS_BIAS functionality
//    09/11/12 - 677753 - remove X glitch on O
//    10/22/14 - Added #1 to $finish (CR 808642).
// End Revision

`timescale 1 ps / 1 ps

`celldefine

module IOBUFDS #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter SLEW = "SLOW"
)(
  output O,

  inout IO,
  inout IOB,

  input I,
  input T
);

// define constants
  localparam MODULE_NAME = "IOBUFDS";
  
// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam IBUF_LOW_PWR_FALSE = 1;
  localparam IBUF_LOW_PWR_TRUE = 0;
  localparam SLEW_FAST = 1;
  localparam SLEW_MEDIUM = 2;
  localparam SLEW_SLOW = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_dr.v"
`else
  reg [40:1] DIFF_TERM_REG = DIFF_TERM;
  reg [40:1] DQS_BIAS_REG = DQS_BIAS;
  reg [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg [48:1] SLEW_REG = SLEW;
`endif

`ifdef XIL_XECLIB
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire IBUF_LOW_PWR_BIN;
  wire [1:0] SLEW_BIN;
`else
  reg DIFF_TERM_BIN;
  reg DQS_BIAS_BIN;
  reg IBUF_LOW_PWR_BIN;
  reg [1:0] SLEW_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGTS = 1'b0;
`else
tri0 glblGTS = glbl.GTS;
`endif

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifdef XIL_XECLIB
  assign DIFF_TERM_BIN =
      (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
      (DIFF_TERM_REG == "TRUE") ? DIFF_TERM_TRUE :
       DIFF_TERM_FALSE;
  
  assign DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  assign IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
      (IBUF_LOW_PWR_REG == "TRUE")  ? IBUF_LOW_PWR_TRUE  :
       IBUF_LOW_PWR_TRUE;
  
  assign SLEW_BIN =
      (SLEW_REG == "SLOW") ? SLEW_SLOW :
      (SLEW_REG == "FAST") ? SLEW_FAST :
      (SLEW_REG == "MEDIUM") ? SLEW_MEDIUM :
       SLEW_SLOW;
  
`else
  always @ (trig_attr) begin
  #1;
  DIFF_TERM_BIN =
      (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
      (DIFF_TERM_REG == "TRUE") ? DIFF_TERM_TRUE :
       DIFF_TERM_FALSE;
  
  DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
      (IBUF_LOW_PWR_REG == "TRUE")  ? IBUF_LOW_PWR_TRUE  :
       IBUF_LOW_PWR_TRUE;
  
  SLEW_BIN =
      (SLEW_REG == "SLOW") ? SLEW_SLOW :
      (SLEW_REG == "FAST") ? SLEW_FAST :
      (SLEW_REG == "MEDIUM") ? SLEW_MEDIUM :
       SLEW_SLOW;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DIFF_TERM_REG != "FALSE") &&
         (DIFF_TERM_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] DIFF_TERM attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_TERM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-103] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_REG != "SLOW") &&
         (SLEW_REG != "FAST") &&
         (SLEW_REG != "MEDIUM"))) begin
      $display("Error: [Unisim %s-106] SLEW attribute is set to %s.  Legal values for this attribute are SLOW, FAST or MEDIUM. Instance: %m", MODULE_NAME, SLEW_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

    wire i_in, io_in, iob_in, t_in;
    reg o_out, io_out, iob_out;
    reg O_int;

    //reg DQS_BIAS_BINARY = 1'b0;

    wire t_or_gts; 
    tri0 GTS = glbl.GTS;

    assign i_in = I;
    assign t_in = T;
    assign io_in = IO;
    assign iob_in = IOB;

    assign t_or_gts = GTS || t_in;
    assign IO  = t_or_gts ? 1'bz :  i_in;
    assign IOB = t_or_gts ? 1'bz : ~i_in;

initial begin

if((IOSTANDARD == "LVDS_25") || (IOSTANDARD == "LVDSEXT_25")) begin
            $display("DRC Warning : The IOSTANDARD attribute on %s instance %m is set to %s.  LVDS_25 is a fixed impedance structure optimized to 100ohm differential. If the intended usage is a bus architecture, please use BLVDS. This is only intended to be used in point to point transmissions that do not have turn around timing requirements", MODULE_NAME, IOSTANDARD);
        end
end

always @(io_in or iob_in or DQS_BIAS_BIN) begin
        if (io_in == 1'b1 && iob_in == 1'b0)
          o_out <= 1'b1;
        else if (io_in == 1'b0 && iob_in == 1'b1)
          o_out <= 1'b0;
        else if ((io_in === 1'bz || io_in == 1'b0) && (iob_in === 1'bz || iob_in == 1'b1))
          if (DQS_BIAS_BIN == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if ((io_in === 1'bx) || (iob_in == 1'bx))
          o_out <= 1'bx;
        end

//    assign O  =  (t_in === 1'b0) ? 1'b1 : ((t_in === 1'b1) ? o_out : 1'bx));
    assign O  =  o_out;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (I => IO) = (0:0:0, 0:0:0);
    (I => IOB) = (0:0:0, 0:0:0);
    (IO => O) = (0:0:0, 0:0:0);
    (IOB => O) = (0:0:0, 0:0:0);
    (T => IO) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (T => IOB) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine

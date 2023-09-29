///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        LOOKAHEAD8
// /___/   /\      Filename    : LOOKAHEAD8.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module LOOKAHEAD8 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter LOOKB = "FALSE",
  parameter LOOKD = "FALSE",
  parameter LOOKF = "FALSE",
  parameter LOOKH = "FALSE"
)(
  output COUTB,
  output COUTD,
  output COUTF,
  output COUTH,

  input CIN,
  input CYA,
  input CYB,
  input CYC,
  input CYD,
  input CYE,
  input CYF,
  input CYG,
  input CYH,
  input GEA,
  input GEB,
  input GEC,
  input GED,
  input GEE,
  input GEF,
  input GEG,
  input GEH,
  input PROPA,
  input PROPB,
  input PROPC,
  input PROPD,
  input PROPE,
  input PROPF,
  input PROPG,
  input PROPH
);
  
// define constants
  localparam MODULE_NAME = "LOOKAHEAD8";

// Parameter encodings and registers
  localparam LOOKB_FALSE = 0;
  localparam LOOKB_TRUE = 1;
  localparam LOOKD_FALSE = 0;
  localparam LOOKD_TRUE = 1;
  localparam LOOKF_FALSE = 0;
  localparam LOOKF_TRUE = 1;
  localparam LOOKH_FALSE = 0;
  localparam LOOKH_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LOOKAHEAD8_dr.v"
`else
  reg [40:1] LOOKB_REG = LOOKB;
  reg [40:1] LOOKD_REG = LOOKD;
  reg [40:1] LOOKF_REG = LOOKF;
  reg [40:1] LOOKH_REG = LOOKH;
`endif

`ifdef XIL_XECLIB
  wire LOOKB_BIN;
  wire LOOKD_BIN;
  wire LOOKF_BIN;
  wire LOOKH_BIN;
`else
  reg LOOKB_BIN;
  reg LOOKD_BIN;
  reg LOOKF_BIN;
  reg LOOKH_BIN;
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
  assign LOOKB_BIN =
      (LOOKB_REG == "FALSE") ? LOOKB_FALSE :
      (LOOKB_REG == "TRUE") ? LOOKB_TRUE :
       LOOKB_FALSE;
  
  assign LOOKD_BIN =
      (LOOKD_REG == "FALSE") ? LOOKD_FALSE :
      (LOOKD_REG == "TRUE") ? LOOKD_TRUE :
       LOOKD_FALSE;
  
  assign LOOKF_BIN =
      (LOOKF_REG == "FALSE") ? LOOKF_FALSE :
      (LOOKF_REG == "TRUE") ? LOOKF_TRUE :
       LOOKF_FALSE;
  
  assign LOOKH_BIN =
      (LOOKH_REG == "FALSE") ? LOOKH_FALSE :
      (LOOKH_REG == "TRUE") ? LOOKH_TRUE :
       LOOKH_FALSE;

`else
  always @(trig_attr) begin
  #1;
  LOOKB_BIN =
      (LOOKB_REG == "FALSE") ? LOOKB_FALSE :
      (LOOKB_REG == "TRUE") ? LOOKB_TRUE :
       LOOKB_FALSE;
  
  LOOKD_BIN =
      (LOOKD_REG == "FALSE") ? LOOKD_FALSE :
      (LOOKD_REG == "TRUE") ? LOOKD_TRUE :
       LOOKD_FALSE;
  
  LOOKF_BIN =
      (LOOKF_REG == "FALSE") ? LOOKF_FALSE :
      (LOOKF_REG == "TRUE") ? LOOKF_TRUE :
       LOOKF_FALSE;
  
  LOOKH_BIN =
      (LOOKH_REG == "FALSE") ? LOOKH_FALSE :
      (LOOKH_REG == "TRUE") ? LOOKH_TRUE :
       LOOKH_FALSE;

  end
`endif

`ifndef XIL_XECLIB
always @ (trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((LOOKB_REG != "FALSE") &&
         (LOOKB_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] LOOKB attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOOKB_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOOKD_REG != "FALSE") &&
         (LOOKD_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] LOOKD attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOOKD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOOKF_REG != "FALSE") &&
         (LOOKF_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] LOOKF attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOOKF_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOOKH_REG != "FALSE") &&
         (LOOKH_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] LOOKH attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOOKH_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire PROP_AB;
  wire PROP_ABF;
  wire PROP_CD;
  wire PROP_EF;
  wire PROP_GH;

 assign PROP_AB  = PROPA && PROPB && (LOOKB_BIN == LOOKB_TRUE);
 assign PROP_ABF = PROPA && PROPB && (LOOKB_BIN == LOOKB_FALSE);
 assign PROP_CD = PROPC && PROPD && (LOOKD_BIN == LOOKD_TRUE);
 assign PROP_EF = PROPE && PROPF && (LOOKF_BIN == LOOKF_TRUE);
 assign PROP_GH = PROPG && PROPH && (LOOKH_BIN == LOOKH_TRUE);
 assign COUTB = (((LOOKB_BIN == LOOKB_FALSE) || ~PROPB) && CYB) ||
                (((LOOKB_BIN == LOOKB_TRUE) && PROPB) &&
                 ((~PROPA && CYA) || (PROPA && CIN)));
 assign COUTD = (PROP_AB & PROP_CD && CIN) ||
                (((LOOKD_BIN == LOOKD_FALSE) || ~PROPD) && CYD) ||
                (((LOOKD_BIN == LOOKD_TRUE) && PROPD) &&
                 ((~PROPC && CYC) ||
                  (PROPC && ~PROP_AB && COUTB) ||
                  (PROPC &&  PROP_AB && CIN)));

 assign COUTF = (((LOOKF_BIN == LOOKF_FALSE) || ~PROPF) && CYF) ||
                (((LOOKF_BIN == LOOKF_TRUE) && PROPF) &&
                 ((~PROPE && CYE) ||
                  (PROPE && ~(PROP_AB && PROP_CD) && COUTD) ||
                  (PROPE && PROP_AB && PROP_CD && CIN)));

 assign COUTH = (PROP_AB && PROP_CD && PROP_EF && PROP_GH && CIN) ||
                (((LOOKH_BIN == LOOKH_FALSE) || ~PROPH) && CYH) ||
                (((LOOKH_BIN == LOOKH_TRUE) && PROPH) &&
                 ((~PROPG && CYG) ||
                  (PROPG && ~(PROP_AB && PROP_CD && PROP_EF) && COUTF) ||
                  (PROPG && ~(PROP_AB && PROP_CD) && PROPE && PROPF && COUTD) ||
                  (PROP_ABF && PROP_CD && PROP_EF && PROP_GH && CIN)));


// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (CIN => COUTB) = (0:0:0, 0:0:0);
    (CIN => COUTD) = (0:0:0, 0:0:0);
    (CIN => COUTF) = (0:0:0, 0:0:0);
    (CIN => COUTH) = (0:0:0, 0:0:0);
    (CYA => COUTB) = (0:0:0, 0:0:0);
    (CYA => COUTD) = (0:0:0, 0:0:0);
    (CYA => COUTF) = (0:0:0, 0:0:0);
    (CYA => COUTH) = (0:0:0, 0:0:0);
    (CYB => COUTB) = (0:0:0, 0:0:0);
    (CYB => COUTD) = (0:0:0, 0:0:0);
    (CYB => COUTF) = (0:0:0, 0:0:0);
    (CYB => COUTH) = (0:0:0, 0:0:0);
    (CYC => COUTD) = (0:0:0, 0:0:0);
    (CYC => COUTF) = (0:0:0, 0:0:0);
    (CYC => COUTH) = (0:0:0, 0:0:0);
    (CYD => COUTD) = (0:0:0, 0:0:0);
    (CYD => COUTF) = (0:0:0, 0:0:0);
    (CYD => COUTH) = (0:0:0, 0:0:0);
    (CYE => COUTF) = (0:0:0, 0:0:0);
    (CYE => COUTH) = (0:0:0, 0:0:0);
    (CYF => COUTF) = (0:0:0, 0:0:0);
    (CYF => COUTH) = (0:0:0, 0:0:0);
    (CYG => COUTH) = (0:0:0, 0:0:0);
    (CYH => COUTH) = (0:0:0, 0:0:0);
    (GEA => COUTB) = (0:0:0, 0:0:0);
    (GEA => COUTD) = (0:0:0, 0:0:0);
    (GEA => COUTF) = (0:0:0, 0:0:0);
    (GEA => COUTH) = (0:0:0, 0:0:0);
    (GEB => COUTB) = (0:0:0, 0:0:0);
    (GEB => COUTD) = (0:0:0, 0:0:0);
    (GEB => COUTF) = (0:0:0, 0:0:0);
    (GEB => COUTH) = (0:0:0, 0:0:0);
    (GEC => COUTD) = (0:0:0, 0:0:0);
    (GEC => COUTF) = (0:0:0, 0:0:0);
    (GEC => COUTH) = (0:0:0, 0:0:0);
    (GED => COUTD) = (0:0:0, 0:0:0);
    (GED => COUTF) = (0:0:0, 0:0:0);
    (GED => COUTH) = (0:0:0, 0:0:0);
    (GEE => COUTF) = (0:0:0, 0:0:0);
    (GEE => COUTH) = (0:0:0, 0:0:0);
    (GEF => COUTF) = (0:0:0, 0:0:0);
    (GEF => COUTH) = (0:0:0, 0:0:0);
    (GEG => COUTH) = (0:0:0, 0:0:0);
    (GEH => COUTH) = (0:0:0, 0:0:0);
    (PROPA => COUTB) = (0:0:0, 0:0:0);
    (PROPA => COUTD) = (0:0:0, 0:0:0);
    (PROPA => COUTF) = (0:0:0, 0:0:0);
    (PROPA => COUTH) = (0:0:0, 0:0:0);
    (PROPB => COUTB) = (0:0:0, 0:0:0);
    (PROPB => COUTD) = (0:0:0, 0:0:0);
    (PROPB => COUTF) = (0:0:0, 0:0:0);
    (PROPB => COUTH) = (0:0:0, 0:0:0);
    (PROPC => COUTD) = (0:0:0, 0:0:0);
    (PROPC => COUTF) = (0:0:0, 0:0:0);
    (PROPC => COUTH) = (0:0:0, 0:0:0);
    (PROPD => COUTD) = (0:0:0, 0:0:0);
    (PROPD => COUTF) = (0:0:0, 0:0:0);
    (PROPD => COUTH) = (0:0:0, 0:0:0);
    (PROPE => COUTF) = (0:0:0, 0:0:0);
    (PROPE => COUTH) = (0:0:0, 0:0:0);
    (PROPF => COUTF) = (0:0:0, 0:0:0);
    (PROPF => COUTH) = (0:0:0, 0:0:0);
    (PROPG => COUTH) = (0:0:0, 0:0:0);
    (PROPH => COUTH) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine

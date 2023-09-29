///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//  ____  ____
//  /   /\/   /
// /___/  \  /    Vendor      : Xilinx
// \   \   \/     Version     : 2019.1
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /                       General Clock Mux Buffer
// /___/   /\     Filename : BUFGMUX.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    01/11/08 - Add CLK_SEL_TYPE attribute.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    03/02/12 - model retargets to BUFGCTRL (CR 647981)
// End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

module BUFGMUX #(
  parameter CLK_SEL_TYPE = "SYNC"
)(
  output O,

  input I0,
  input I1,
  input S
);

// begin behavioral model
    pulldown P1 (O);
    
    wire NS;
    wire IG0, IG1;

     assign IG0 = (CLK_SEL_TYPE == "SYNC") ? 1'b0 : 1'b1;
     assign IG1 = (CLK_SEL_TYPE == "SYNC") ? 1'b0 : 1'b1;

    BUFGCTRL #(
    .INIT_OUT (0),
    .PRESELECT_I0 ("TRUE"),
    .PRESELECT_I1 ("FALSE"))
    BUFGCTRL_BUFGMUX
    (.O (O),
    .CE0 (NS),
    .CE1 (S),
    .I0 (I0),
    .I1 (I1),
    .IGNORE0 (IG0),
    .IGNORE1 (IG1),
    .S0 (1'b1),
    .S1 (1'b1));

    INV INV_S (
    .O (NS),
    .I (S)
    );


// end behavioral model

  specify

      specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine

//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2001-2013-2024 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-10-15 18:01:36 +0100 (Mon, 15 Oct 2012) $
//
//      Revision            : $Revision: 225465 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//  Abstract            : BusMatrix is the top-level which connects together
//                        the required Input Stages, MatrixDecodes, Output
//                        Stages and Output Arbitration blocks.
//
//                        Supports the following configured options:
//
//                         - Architecture type 'ahb2',
//                         - 4 slave ports (connecting to masters),
//                         - 5 master ports (connecting to slaves),
//                         - Routing address width of 32 bits,
//                         - Routing data width of 32 bits,
//                         - xUSER signal width of 32 bits,
//                         - Arbiter type 'round',
//                         - Connectivity mapping:
//                             S0 -> M0, M1, 
//                             S1 -> M0, M1, 
//                             S2 -> M6, M7, M8, 
//                             S4 -> M0,
//                         - Connectivity type 'sparse'.
//
//------------------------------------------------------------------------------

`timescale 1ns/1ps

module ahb_bus_matrix (

    // Common AHB signals
    HCLK,
    HRESETn,

    // System address remapping control
    REMAP,

    // Input port SI0 (inputs from master 0)
    HSELS0,
    HADDRS0,
    HTRANSS0,
    HWRITES0,
    HSIZES0,
    HBURSTS0,
    HPROTS0,
    HMASTERS0,
    HWDATAS0,
    HMASTLOCKS0,
    HREADYS0,
    HAUSERS0,
    HWUSERS0,

    // Input port SI1 (inputs from master 1)
    HSELS1,
    HADDRS1,
    HTRANSS1,
    HWRITES1,
    HSIZES1,
    HBURSTS1,
    HPROTS1,
    HMASTERS1,
    HWDATAS1,
    HMASTLOCKS1,
    HREADYS1,
    HAUSERS1,
    HWUSERS1,

    // Input port SI2 (inputs from master 2)
    HSELS2,
    HADDRS2,
    HTRANSS2,
    HWRITES2,
    HSIZES2,
    HBURSTS2,
    HPROTS2,
    HMASTERS2,
    HWDATAS2,
    HMASTLOCKS2,
    HREADYS2,
    HAUSERS2,
    HWUSERS2,

    // Input port SI3 (inputs from master 3)
    HSELS4,
    HADDRS4,
    HTRANSS4,
    HWRITES4,
    HSIZES4,
    HBURSTS4,
    HPROTS4,
    HMASTERS4,
    HWDATAS4,
    HMASTLOCKS4,
    HREADYS4,
    HAUSERS4,
    HWUSERS4,

    // Output port MI0 (inputs from slave 0)
    HRDATAM0,
    HREADYOUTM0,
    HRESPM0,
    HRUSERM0,

    // Output port MI1 (inputs from slave 1)
    HRDATAM1,
    HREADYOUTM1,
    HRESPM1,
    HRUSERM1,

    // Output port MI2 (inputs from slave 2)
    HRDATAM6,
    HREADYOUTM6,
    HRESPM6,
    HRUSERM6,

    // Output port MI3 (inputs from slave 3)
    HRDATAM7,
    HREADYOUTM7,
    HRESPM7,
    HRUSERM7,

    // Output port MI4 (inputs from slave 4)
    HRDATAM8,
    HREADYOUTM8,
    HRESPM8,
    HRUSERM8,

    // Scan test dummy signals; not connected until scan insertion
    SCANENABLE,   // Scan Test Mode Enable
    SCANINHCLK,   // Scan Chain Input


    // Output port MI0 (outputs to slave 0)
    HSELM0,
    HADDRM0,
    HTRANSM0,
    HWRITEM0,
    HSIZEM0,
    HBURSTM0,
    HPROTM0,
    HMASTERM0,
    HWDATAM0,
    HMASTLOCKM0,
    HREADYMUXM0,
    HAUSERM0,
    HWUSERM0,

    // Output port MI1 (outputs to slave 1)
    HSELM1,
    HADDRM1,
    HTRANSM1,
    HWRITEM1,
    HSIZEM1,
    HBURSTM1,
    HPROTM1,
    HMASTERM1,
    HWDATAM1,
    HMASTLOCKM1,
    HREADYMUXM1,
    HAUSERM1,
    HWUSERM1,

    // Output port MI2 (outputs to slave 2)
    HSELM6,
    HADDRM6,
    HTRANSM6,
    HWRITEM6,
    HSIZEM6,
    HBURSTM6,
    HPROTM6,
    HMASTERM6,
    HWDATAM6,
    HMASTLOCKM6,
    HREADYMUXM6,
    HAUSERM6,
    HWUSERM6,

    // Output port MI3 (outputs to slave 3)
    HSELM7,
    HADDRM7,
    HTRANSM7,
    HWRITEM7,
    HSIZEM7,
    HBURSTM7,
    HPROTM7,
    HMASTERM7,
    HWDATAM7,
    HMASTLOCKM7,
    HREADYMUXM7,
    HAUSERM7,
    HWUSERM7,

    // Output port MI4 (outputs to slave 4)
    HSELM8,
    HADDRM8,
    HTRANSM8,
    HWRITEM8,
    HSIZEM8,
    HBURSTM8,
    HPROTM8,
    HMASTERM8,
    HWDATAM8,
    HMASTLOCKM8,
    HREADYMUXM8,
    HAUSERM8,
    HWUSERM8,

    // Input port SI0 (outputs to master 0)
    HRDATAS0,
    HREADYOUTS0,
    HRESPS0,
    HRUSERS0,

    // Input port SI1 (outputs to master 1)
    HRDATAS1,
    HREADYOUTS1,
    HRESPS1,
    HRUSERS1,

    // Input port SI2 (outputs to master 2)
    HRDATAS2,
    HREADYOUTS2,
    HRESPS2,
    HRUSERS2,

    // Input port SI3 (outputs to master 3)
    HRDATAS4,
    HREADYOUTS4,
    HRESPS4,
    HRUSERS4,

    // Scan test dummy signals; not connected until scan insertion
    SCANOUTHCLK   // Scan Chain Output

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input         HCLK;            // AHB System Clock
    input         HRESETn;         // AHB System Reset

    // System address remapping control
    input   [3:0] REMAP;           // REMAP input

    // Input port SI0 (inputs from master 0)
    input         HSELS0;          // Slave Select
    input  [31:0] HADDRS0;         // Address bus
    input   [1:0] HTRANSS0;        // Transfer type
    input         HWRITES0;        // Transfer direction
    input   [2:0] HSIZES0;         // Transfer size
    input   [2:0] HBURSTS0;        // Burst type
    input   [3:0] HPROTS0;         // Protection control
    input   [3:0] HMASTERS0;       // Master select
    input  [31:0] HWDATAS0;        // Write data
    input         HMASTLOCKS0;     // Locked Sequence
    input         HREADYS0;        // Transfer done
    input  [31:0] HAUSERS0;        // Address USER signals
    input  [31:0] HWUSERS0;        // Write-data USER signals

    // Input port SI1 (inputs from master 1)
    input         HSELS1;          // Slave Select
    input  [31:0] HADDRS1;         // Address bus
    input   [1:0] HTRANSS1;        // Transfer type
    input         HWRITES1;        // Transfer direction
    input   [2:0] HSIZES1;         // Transfer size
    input   [2:0] HBURSTS1;        // Burst type
    input   [3:0] HPROTS1;         // Protection control
    input   [3:0] HMASTERS1;       // Master select
    input  [31:0] HWDATAS1;        // Write data
    input         HMASTLOCKS1;     // Locked Sequence
    input         HREADYS1;        // Transfer done
    input  [31:0] HAUSERS1;        // Address USER signals
    input  [31:0] HWUSERS1;        // Write-data USER signals

    // Input port SI2 (inputs from master 2)
    input         HSELS2;          // Slave Select
    input  [31:0] HADDRS2;         // Address bus
    input   [1:0] HTRANSS2;        // Transfer type
    input         HWRITES2;        // Transfer direction
    input   [2:0] HSIZES2;         // Transfer size
    input   [2:0] HBURSTS2;        // Burst type
    input   [3:0] HPROTS2;         // Protection control
    input   [3:0] HMASTERS2;       // Master select
    input  [31:0] HWDATAS2;        // Write data
    input         HMASTLOCKS2;     // Locked Sequence
    input         HREADYS2;        // Transfer done
    input  [31:0] HAUSERS2;        // Address USER signals
    input  [31:0] HWUSERS2;        // Write-data USER signals

    // Input port SI3 (inputs from master 3)
    input         HSELS4;          // Slave Select
    input  [31:0] HADDRS4;         // Address bus
    input   [1:0] HTRANSS4;        // Transfer type
    input         HWRITES4;        // Transfer direction
    input   [2:0] HSIZES4;         // Transfer size
    input   [2:0] HBURSTS4;        // Burst type
    input   [3:0] HPROTS4;         // Protection control
    input   [3:0] HMASTERS4;       // Master select
    input  [31:0] HWDATAS4;        // Write data
    input         HMASTLOCKS4;     // Locked Sequence
    input         HREADYS4;        // Transfer done
    input  [31:0] HAUSERS4;        // Address USER signals
    input  [31:0] HWUSERS4;        // Write-data USER signals

    // Output port MI0 (inputs from slave 0)
    input  [31:0] HRDATAM0;        // Read data bus
    input         HREADYOUTM0;     // HREADY feedback
    input   [1:0] HRESPM0;         // Transfer response
    input  [31:0] HRUSERM0;        // Read-data USER signals

    // Output port MI1 (inputs from slave 1)
    input  [31:0] HRDATAM1;        // Read data bus
    input         HREADYOUTM1;     // HREADY feedback
    input   [1:0] HRESPM1;         // Transfer response
    input  [31:0] HRUSERM1;        // Read-data USER signals

    // Output port MI2 (inputs from slave 2)
    input  [31:0] HRDATAM6;        // Read data bus
    input         HREADYOUTM6;     // HREADY feedback
    input   [1:0] HRESPM6;         // Transfer response
    input  [31:0] HRUSERM6;        // Read-data USER signals

    // Output port MI3 (inputs from slave 3)
    input  [31:0] HRDATAM7;        // Read data bus
    input         HREADYOUTM7;     // HREADY feedback
    input   [1:0] HRESPM7;         // Transfer response
    input  [31:0] HRUSERM7;        // Read-data USER signals

    // Output port MI4 (inputs from slave 4)
    input  [31:0] HRDATAM8;        // Read data bus
    input         HREADYOUTM8;     // HREADY feedback
    input   [1:0] HRESPM8;         // Transfer response
    input  [31:0] HRUSERM8;        // Read-data USER signals

    // Scan test dummy signals; not connected until scan insertion
    input         SCANENABLE;      // Scan enable signal
    input         SCANINHCLK;      // HCLK scan input


    // Output port MI0 (outputs to slave 0)
    output        HSELM0;          // Slave Select
    output [31:0] HADDRM0;         // Address bus
    output  [1:0] HTRANSM0;        // Transfer type
    output        HWRITEM0;        // Transfer direction
    output  [2:0] HSIZEM0;         // Transfer size
    output  [2:0] HBURSTM0;        // Burst type
    output  [3:0] HPROTM0;         // Protection control
    output  [3:0] HMASTERM0;       // Master select
    output [31:0] HWDATAM0;        // Write data
    output        HMASTLOCKM0;     // Locked Sequence
    output        HREADYMUXM0;     // Transfer done
    output [31:0] HAUSERM0;        // Address USER signals
    output [31:0] HWUSERM0;        // Write-data USER signals

    // Output port MI1 (outputs to slave 1)
    output        HSELM1;          // Slave Select
    output [31:0] HADDRM1;         // Address bus
    output  [1:0] HTRANSM1;        // Transfer type
    output        HWRITEM1;        // Transfer direction
    output  [2:0] HSIZEM1;         // Transfer size
    output  [2:0] HBURSTM1;        // Burst type
    output  [3:0] HPROTM1;         // Protection control
    output  [3:0] HMASTERM1;       // Master select
    output [31:0] HWDATAM1;        // Write data
    output        HMASTLOCKM1;     // Locked Sequence
    output        HREADYMUXM1;     // Transfer done
    output [31:0] HAUSERM1;        // Address USER signals
    output [31:0] HWUSERM1;        // Write-data USER signals

    // Output port MI2 (outputs to slave 2)
    output        HSELM6;          // Slave Select
    output [31:0] HADDRM6;         // Address bus
    output  [1:0] HTRANSM6;        // Transfer type
    output        HWRITEM6;        // Transfer direction
    output  [2:0] HSIZEM6;         // Transfer size
    output  [2:0] HBURSTM6;        // Burst type
    output  [3:0] HPROTM6;         // Protection control
    output  [3:0] HMASTERM6;       // Master select
    output [31:0] HWDATAM6;        // Write data
    output        HMASTLOCKM6;     // Locked Sequence
    output        HREADYMUXM6;     // Transfer done
    output [31:0] HAUSERM6;        // Address USER signals
    output [31:0] HWUSERM6;        // Write-data USER signals

    // Output port MI3 (outputs to slave 3)
    output        HSELM7;          // Slave Select
    output [31:0] HADDRM7;         // Address bus
    output  [1:0] HTRANSM7;        // Transfer type
    output        HWRITEM7;        // Transfer direction
    output  [2:0] HSIZEM7;         // Transfer size
    output  [2:0] HBURSTM7;        // Burst type
    output  [3:0] HPROTM7;         // Protection control
    output  [3:0] HMASTERM7;       // Master select
    output [31:0] HWDATAM7;        // Write data
    output        HMASTLOCKM7;     // Locked Sequence
    output        HREADYMUXM7;     // Transfer done
    output [31:0] HAUSERM7;        // Address USER signals
    output [31:0] HWUSERM7;        // Write-data USER signals

    // Output port MI4 (outputs to slave 4)
    output        HSELM8;          // Slave Select
    output [31:0] HADDRM8;         // Address bus
    output  [1:0] HTRANSM8;        // Transfer type
    output        HWRITEM8;        // Transfer direction
    output  [2:0] HSIZEM8;         // Transfer size
    output  [2:0] HBURSTM8;        // Burst type
    output  [3:0] HPROTM8;         // Protection control
    output  [3:0] HMASTERM8;       // Master select
    output [31:0] HWDATAM8;        // Write data
    output        HMASTLOCKM8;     // Locked Sequence
    output        HREADYMUXM8;     // Transfer done
    output [31:0] HAUSERM8;        // Address USER signals
    output [31:0] HWUSERM8;        // Write-data USER signals

    // Input port SI0 (outputs to master 0)
    output [31:0] HRDATAS0;        // Read data bus
    output        HREADYOUTS0;     // HREADY feedback
    output  [1:0] HRESPS0;         // Transfer response
    output [31:0] HRUSERS0;        // Read-data USER signals

    // Input port SI1 (outputs to master 1)
    output [31:0] HRDATAS1;        // Read data bus
    output        HREADYOUTS1;     // HREADY feedback
    output  [1:0] HRESPS1;         // Transfer response
    output [31:0] HRUSERS1;        // Read-data USER signals

    // Input port SI2 (outputs to master 2)
    output [31:0] HRDATAS2;        // Read data bus
    output        HREADYOUTS2;     // HREADY feedback
    output  [1:0] HRESPS2;         // Transfer response
    output [31:0] HRUSERS2;        // Read-data USER signals

    // Input port SI3 (outputs to master 3)
    output [31:0] HRDATAS4;        // Read data bus
    output        HREADYOUTS4;     // HREADY feedback
    output  [1:0] HRESPS4;         // Transfer response
    output [31:0] HRUSERS4;        // Read-data USER signals

    // Scan test dummy signals; not connected until scan insertion
    output        SCANOUTHCLK;     // Scan Chain Output


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    wire         HCLK;            // AHB System Clock
    wire         HRESETn;         // AHB System Reset

    // System address remapping control
    wire   [3:0] REMAP;           // REMAP signal

    // Input Port SI0
    wire         HSELS0;          // Slave Select
    wire  [31:0] HADDRS0;         // Address bus
    wire   [1:0] HTRANSS0;        // Transfer type
    wire         HWRITES0;        // Transfer direction
    wire   [2:0] HSIZES0;         // Transfer size
    wire   [2:0] HBURSTS0;        // Burst type
    wire   [3:0] HPROTS0;         // Protection control
    wire   [3:0] HMASTERS0;       // Master select
    wire  [31:0] HWDATAS0;        // Write data
    wire         HMASTLOCKS0;     // Locked Sequence
    wire         HREADYS0;        // Transfer done

    wire  [31:0] HRDATAS0;        // Read data bus
    wire         HREADYOUTS0;     // HREADY feedback
    wire   [1:0] HRESPS0;         // Transfer response
    wire  [31:0] HAUSERS0;        // Address USER signals
    wire  [31:0] HWUSERS0;        // Write-data USER signals
    wire  [31:0] HRUSERS0;        // Read-data USER signals

    // Input Port SI1
    wire         HSELS1;          // Slave Select
    wire  [31:0] HADDRS1;         // Address bus
    wire   [1:0] HTRANSS1;        // Transfer type
    wire         HWRITES1;        // Transfer direction
    wire   [2:0] HSIZES1;         // Transfer size
    wire   [2:0] HBURSTS1;        // Burst type
    wire   [3:0] HPROTS1;         // Protection control
    wire   [3:0] HMASTERS1;       // Master select
    wire  [31:0] HWDATAS1;        // Write data
    wire         HMASTLOCKS1;     // Locked Sequence
    wire         HREADYS1;        // Transfer done

    wire  [31:0] HRDATAS1;        // Read data bus
    wire         HREADYOUTS1;     // HREADY feedback
    wire   [1:0] HRESPS1;         // Transfer response
    wire  [31:0] HAUSERS1;        // Address USER signals
    wire  [31:0] HWUSERS1;        // Write-data USER signals
    wire  [31:0] HRUSERS1;        // Read-data USER signals

    // Input Port SI2
    wire         HSELS2;          // Slave Select
    wire  [31:0] HADDRS2;         // Address bus
    wire   [1:0] HTRANSS2;        // Transfer type
    wire         HWRITES2;        // Transfer direction
    wire   [2:0] HSIZES2;         // Transfer size
    wire   [2:0] HBURSTS2;        // Burst type
    wire   [3:0] HPROTS2;         // Protection control
    wire   [3:0] HMASTERS2;       // Master select
    wire  [31:0] HWDATAS2;        // Write data
    wire         HMASTLOCKS2;     // Locked Sequence
    wire         HREADYS2;        // Transfer done

    wire  [31:0] HRDATAS2;        // Read data bus
    wire         HREADYOUTS2;     // HREADY feedback
    wire   [1:0] HRESPS2;         // Transfer response
    wire  [31:0] HAUSERS2;        // Address USER signals
    wire  [31:0] HWUSERS2;        // Write-data USER signals
    wire  [31:0] HRUSERS2;        // Read-data USER signals

    // Input Port SI3
    wire         HSELS4;          // Slave Select
    wire  [31:0] HADDRS4;         // Address bus
    wire   [1:0] HTRANSS4;        // Transfer type
    wire         HWRITES4;        // Transfer direction
    wire   [2:0] HSIZES4;         // Transfer size
    wire   [2:0] HBURSTS4;        // Burst type
    wire   [3:0] HPROTS4;         // Protection control
    wire   [3:0] HMASTERS4;       // Master select
    wire  [31:0] HWDATAS4;        // Write data
    wire         HMASTLOCKS4;     // Locked Sequence
    wire         HREADYS4;        // Transfer done

    wire  [31:0] HRDATAS4;        // Read data bus
    wire         HREADYOUTS4;     // HREADY feedback
    wire   [1:0] HRESPS4;         // Transfer response
    wire  [31:0] HAUSERS4;        // Address USER signals
    wire  [31:0] HWUSERS4;        // Write-data USER signals
    wire  [31:0] HRUSERS4;        // Read-data USER signals

    // Output Port MI0
    wire         HSELM0;          // Slave Select
    wire  [31:0] HADDRM0;         // Address bus
    wire   [1:0] HTRANSM0;        // Transfer type
    wire         HWRITEM0;        // Transfer direction
    wire   [2:0] HSIZEM0;         // Transfer size
    wire   [2:0] HBURSTM0;        // Burst type
    wire   [3:0] HPROTM0;         // Protection control
    wire   [3:0] HMASTERM0;       // Master select
    wire  [31:0] HWDATAM0;        // Write data
    wire         HMASTLOCKM0;     // Locked Sequence
    wire         HREADYMUXM0;     // Transfer done

    wire  [31:0] HRDATAM0;        // Read data bus
    wire         HREADYOUTM0;     // HREADY feedback
    wire   [1:0] HRESPM0;         // Transfer response
    wire  [31:0] HAUSERM0;        // Address USER signals
    wire  [31:0] HWUSERM0;        // Write-data USER signals
    wire  [31:0] HRUSERM0;        // Read-data USER signals

    // Output Port MI1
    wire         HSELM1;          // Slave Select
    wire  [31:0] HADDRM1;         // Address bus
    wire   [1:0] HTRANSM1;        // Transfer type
    wire         HWRITEM1;        // Transfer direction
    wire   [2:0] HSIZEM1;         // Transfer size
    wire   [2:0] HBURSTM1;        // Burst type
    wire   [3:0] HPROTM1;         // Protection control
    wire   [3:0] HMASTERM1;       // Master select
    wire  [31:0] HWDATAM1;        // Write data
    wire         HMASTLOCKM1;     // Locked Sequence
    wire         HREADYMUXM1;     // Transfer done

    wire  [31:0] HRDATAM1;        // Read data bus
    wire         HREADYOUTM1;     // HREADY feedback
    wire   [1:0] HRESPM1;         // Transfer response
    wire  [31:0] HAUSERM1;        // Address USER signals
    wire  [31:0] HWUSERM1;        // Write-data USER signals
    wire  [31:0] HRUSERM1;        // Read-data USER signals

    // Output Port MI2
    wire         HSELM6;          // Slave Select
    wire  [31:0] HADDRM6;         // Address bus
    wire   [1:0] HTRANSM6;        // Transfer type
    wire         HWRITEM6;        // Transfer direction
    wire   [2:0] HSIZEM6;         // Transfer size
    wire   [2:0] HBURSTM6;        // Burst type
    wire   [3:0] HPROTM6;         // Protection control
    wire   [3:0] HMASTERM6;       // Master select
    wire  [31:0] HWDATAM6;        // Write data
    wire         HMASTLOCKM6;     // Locked Sequence
    wire         HREADYMUXM6;     // Transfer done

    wire  [31:0] HRDATAM6;        // Read data bus
    wire         HREADYOUTM6;     // HREADY feedback
    wire   [1:0] HRESPM6;         // Transfer response
    wire  [31:0] HAUSERM6;        // Address USER signals
    wire  [31:0] HWUSERM6;        // Write-data USER signals
    wire  [31:0] HRUSERM6;        // Read-data USER signals

    // Output Port MI3
    wire         HSELM7;          // Slave Select
    wire  [31:0] HADDRM7;         // Address bus
    wire   [1:0] HTRANSM7;        // Transfer type
    wire         HWRITEM7;        // Transfer direction
    wire   [2:0] HSIZEM7;         // Transfer size
    wire   [2:0] HBURSTM7;        // Burst type
    wire   [3:0] HPROTM7;         // Protection control
    wire   [3:0] HMASTERM7;       // Master select
    wire  [31:0] HWDATAM7;        // Write data
    wire         HMASTLOCKM7;     // Locked Sequence
    wire         HREADYMUXM7;     // Transfer done

    wire  [31:0] HRDATAM7;        // Read data bus
    wire         HREADYOUTM7;     // HREADY feedback
    wire   [1:0] HRESPM7;         // Transfer response
    wire  [31:0] HAUSERM7;        // Address USER signals
    wire  [31:0] HWUSERM7;        // Write-data USER signals
    wire  [31:0] HRUSERM7;        // Read-data USER signals

    // Output Port MI4
    wire         HSELM8;          // Slave Select
    wire  [31:0] HADDRM8;         // Address bus
    wire   [1:0] HTRANSM8;        // Transfer type
    wire         HWRITEM8;        // Transfer direction
    wire   [2:0] HSIZEM8;         // Transfer size
    wire   [2:0] HBURSTM8;        // Burst type
    wire   [3:0] HPROTM8;         // Protection control
    wire   [3:0] HMASTERM8;       // Master select
    wire  [31:0] HWDATAM8;        // Write data
    wire         HMASTLOCKM8;     // Locked Sequence
    wire         HREADYMUXM8;     // Transfer done

    wire  [31:0] HRDATAM8;        // Read data bus
    wire         HREADYOUTM8;     // HREADY feedback
    wire   [1:0] HRESPM8;         // Transfer response
    wire  [31:0] HAUSERM8;        // Address USER signals
    wire  [31:0] HWUSERM8;        // Write-data USER signals
    wire  [31:0] HRUSERM8;        // Read-data USER signals


// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------

    // Bus-switch input SI0
    wire         i_sel0;            // HSEL signal
    wire  [31:0] i_addr0;           // HADDR signal
    wire   [1:0] i_trans0;          // HTRANS signal
    wire         i_write0;          // HWRITE signal
    wire   [2:0] i_size0;           // HSIZE signal
    wire   [2:0] i_burst0;          // HBURST signal
    wire   [3:0] i_prot0;           // HPROTS signal
    wire   [3:0] i_master0;         // HMASTER signal
    wire         i_mastlock0;       // HMASTLOCK signal
    wire         i_active0;         // Active signal
    wire         i_held_tran0;       // HeldTran signal
    wire         i_readyout0;       // Readyout signal
    wire   [1:0] i_resp0;           // Response signal
    wire  [31:0] i_auser0;          // HAUSER signal

    // Bus-switch input SI1
    wire         i_sel1;            // HSEL signal
    wire  [31:0] i_addr1;           // HADDR signal
    wire   [1:0] i_trans1;          // HTRANS signal
    wire         i_write1;          // HWRITE signal
    wire   [2:0] i_size1;           // HSIZE signal
    wire   [2:0] i_burst1;          // HBURST signal
    wire   [3:0] i_prot1;           // HPROTS signal
    wire   [3:0] i_master1;         // HMASTER signal
    wire         i_mastlock1;       // HMASTLOCK signal
    wire         i_active1;         // Active signal
    wire         i_held_tran1;       // HeldTran signal
    wire         i_readyout1;       // Readyout signal
    wire   [1:0] i_resp1;           // Response signal
    wire  [31:0] i_auser1;          // HAUSER signal

    // Bus-switch input SI2
    wire         i_sel2;            // HSEL signal
    wire  [31:0] i_addr2;           // HADDR signal
    wire   [1:0] i_trans2;          // HTRANS signal
    wire         i_write2;          // HWRITE signal
    wire   [2:0] i_size2;           // HSIZE signal
    wire   [2:0] i_burst2;          // HBURST signal
    wire   [3:0] i_prot2;           // HPROTS signal
    wire   [3:0] i_master2;         // HMASTER signal
    wire         i_mastlock2;       // HMASTLOCK signal
    wire         i_active2;         // Active signal
    wire         i_held_tran2;       // HeldTran signal
    wire         i_readyout2;       // Readyout signal
    wire   [1:0] i_resp2;           // Response signal
    wire  [31:0] i_auser2;          // HAUSER signal

    // Bus-switch input SI3
    wire         i_sel3;            // HSEL signal
    wire  [31:0] i_addr3;           // HADDR signal
    wire   [1:0] i_trans3;          // HTRANS signal
    wire         i_write3;          // HWRITE signal
    wire   [2:0] i_size3;           // HSIZE signal
    wire   [2:0] i_burst3;          // HBURST signal
    wire   [3:0] i_prot3;           // HPROTS signal
    wire   [3:0] i_master3;         // HMASTER signal
    wire         i_mastlock3;       // HMASTLOCK signal
    wire         i_active3;         // Active signal
    wire         i_held_tran3;       // HeldTran signal
    wire         i_readyout3;       // Readyout signal
    wire   [1:0] i_resp3;           // Response signal
    wire  [31:0] i_auser3;          // HAUSER signal

    // Bus-switch SI0 to MI0 signals
    wire         i_sel0to0;         // Routing selection signal
    wire         i_active0to0;      // Active signal

    // Bus-switch SI0 to MI1 signals
    wire         i_sel0to1;         // Routing selection signal
    wire         i_active0to1;      // Active signal

    // Bus-switch SI1 to MI0 signals
    wire         i_sel1to0;         // Routing selection signal
    wire         i_active1to0;      // Active signal

    // Bus-switch SI1 to MI1 signals
    wire         i_sel1to1;         // Routing selection signal
    wire         i_active1to1;      // Active signal

    // Bus-switch SI2 to MI2 signals
    wire         i_sel2to2;         // Routing selection signal
    wire         i_active2to2;      // Active signal

    // Bus-switch SI2 to MI3 signals
    wire         i_sel2to3;         // Routing selection signal
    wire         i_active2to3;      // Active signal

    // Bus-switch SI2 to MI4 signals
    wire         i_sel2to4;         // Routing selection signal
    wire         i_active2to4;      // Active signal

    // Bus-switch SI3 to MI0 signals
    wire         i_sel3to0;         // Routing selection signal
    wire         i_active3to0;      // Active signal

    wire         i_hready_mux_m0;    // Internal HREADYMUXM for MI0
    wire         i_hready_mux_m1;    // Internal HREADYMUXM for MI1
    wire         i_hready_mux_m6;    // Internal HREADYMUXM for MI2
    wire         i_hready_mux_m7;    // Internal HREADYMUXM for MI3
    wire         i_hready_mux_m8;    // Internal HREADYMUXM for MI4


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

  // Input stage for SI0
  ahb_bus_matrix_i u_ahb_bus_matrix_i_0 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Input Port Address/Control Signals
    .HSELS      (HSELS0),
    .HADDRS     (HADDRS0),
    .HTRANSS    (HTRANSS0),
    .HWRITES    (HWRITES0),
    .HSIZES     (HSIZES0),
    .HBURSTS    (HBURSTS0),
    .HPROTS     (HPROTS0),
    .HMASTERS   (HMASTERS0),
    .HMASTLOCKS (HMASTLOCKS0),
    .HREADYS    (HREADYS0),
    .HAUSERS    (HAUSERS0),

    // Internal Response
    .active_ip     (i_active0),
    .readyout_ip   (i_readyout0),
    .resp_ip       (i_resp0),

    // Input Port Response
    .HREADYOUTS (HREADYOUTS0),
    .HRESPS     (HRESPS0),

    // Internal Address/Control Signals
    .sel_ip        (i_sel0),
    .addr_ip       (i_addr0),
    .auser_ip      (i_auser0),
    .trans_ip      (i_trans0),
    .write_ip      (i_write0),
    .size_ip       (i_size0),
    .burst_ip      (i_burst0),
    .prot_ip       (i_prot0),
    .master_ip     (i_master0),
    .mastlock_ip   (i_mastlock0),
    .held_tran_ip   (i_held_tran0)

    );


  // Input stage for SI1
  ahb_bus_matrix_i u_ahb_bus_matrix_i_1 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Input Port Address/Control Signals
    .HSELS      (HSELS1),
    .HADDRS     (HADDRS1),
    .HTRANSS    (HTRANSS1),
    .HWRITES    (HWRITES1),
    .HSIZES     (HSIZES1),
    .HBURSTS    (HBURSTS1),
    .HPROTS     (HPROTS1),
    .HMASTERS   (HMASTERS1),
    .HMASTLOCKS (HMASTLOCKS1),
    .HREADYS    (HREADYS1),
    .HAUSERS    (HAUSERS1),

    // Internal Response
    .active_ip     (i_active1),
    .readyout_ip   (i_readyout1),
    .resp_ip       (i_resp1),

    // Input Port Response
    .HREADYOUTS (HREADYOUTS1),
    .HRESPS     (HRESPS1),

    // Internal Address/Control Signals
    .sel_ip        (i_sel1),
    .addr_ip       (i_addr1),
    .auser_ip      (i_auser1),
    .trans_ip      (i_trans1),
    .write_ip      (i_write1),
    .size_ip       (i_size1),
    .burst_ip      (i_burst1),
    .prot_ip       (i_prot1),
    .master_ip     (i_master1),
    .mastlock_ip   (i_mastlock1),
    .held_tran_ip   (i_held_tran1)

    );


  // Input stage for SI2
  ahb_bus_matrix_i u_ahb_bus_matrix_i_2 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Input Port Address/Control Signals
    .HSELS      (HSELS2),
    .HADDRS     (HADDRS2),
    .HTRANSS    (HTRANSS2),
    .HWRITES    (HWRITES2),
    .HSIZES     (HSIZES2),
    .HBURSTS    (HBURSTS2),
    .HPROTS     (HPROTS2),
    .HMASTERS   (HMASTERS2),
    .HMASTLOCKS (HMASTLOCKS2),
    .HREADYS    (HREADYS2),
    .HAUSERS    (HAUSERS2),

    // Internal Response
    .active_ip     (i_active2),
    .readyout_ip   (i_readyout2),
    .resp_ip       (i_resp2),

    // Input Port Response
    .HREADYOUTS (HREADYOUTS2),
    .HRESPS     (HRESPS2),

    // Internal Address/Control Signals
    .sel_ip        (i_sel2),
    .addr_ip       (i_addr2),
    .auser_ip      (i_auser2),
    .trans_ip      (i_trans2),
    .write_ip      (i_write2),
    .size_ip       (i_size2),
    .burst_ip      (i_burst2),
    .prot_ip       (i_prot2),
    .master_ip     (i_master2),
    .mastlock_ip   (i_mastlock2),
    .held_tran_ip   (i_held_tran2)

    );


  // Input stage for SI3
  ahb_bus_matrix_i u_ahb_bus_matrix_i_3 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Input Port Address/Control Signals
    .HSELS      (HSELS4),
    .HADDRS     (HADDRS4),
    .HTRANSS    (HTRANSS4),
    .HWRITES    (HWRITES4),
    .HSIZES     (HSIZES4),
    .HBURSTS    (HBURSTS4),
    .HPROTS     (HPROTS4),
    .HMASTERS   (HMASTERS4),
    .HMASTLOCKS (HMASTLOCKS4),
    .HREADYS    (HREADYS4),
    .HAUSERS    (HAUSERS4),

    // Internal Response
    .active_ip     (i_active3),
    .readyout_ip   (i_readyout3),
    .resp_ip       (i_resp3),

    // Input Port Response
    .HREADYOUTS (HREADYOUTS4),
    .HRESPS     (HRESPS4),

    // Internal Address/Control Signals
    .sel_ip        (i_sel3),
    .addr_ip       (i_addr3),
    .auser_ip      (i_auser3),
    .trans_ip      (i_trans3),
    .write_ip      (i_write3),
    .size_ip       (i_size3),
    .burst_ip      (i_burst3),
    .prot_ip       (i_prot3),
    .master_ip     (i_master3),
    .mastlock_ip   (i_mastlock3),
    .held_tran_ip   (i_held_tran3)

    );


  // Matrix decoder for SI0
  ahb_bus_matrix_decoderS0 u_ahb_bus_matrix_decoders0 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Signals from Input stage SI0
    .HREADYS    (HREADYS0),
    .sel_dec        (i_sel0),
    .decode_addr_dec (i_addr0[31:10]),   // HADDR[9:0] is not decoded
    .trans_dec      (i_trans0),

    // Control/Response for Output Stage MI0
    .active_dec0    (i_active0to0),
    .readyout_dec0  (i_hready_mux_m0),
    .resp_dec0      (HRESPM0),
    .rdata_dec0     (HRDATAM0),
    .ruser_dec0     (HRUSERM0),

    // Control/Response for Output Stage MI1
    .active_dec1    (i_active0to1),
    .readyout_dec1  (i_hready_mux_m1),
    .resp_dec1      (HRESPM1),
    .rdata_dec1     (HRDATAM1),
    .ruser_dec1     (HRUSERM1),

    .sel_dec0       (i_sel0to0),
    .sel_dec1       (i_sel0to1),

    .active_dec     (i_active0),
    .HREADYOUTS (i_readyout0),
    .HRESPS     (i_resp0),
    .HRUSERS    (HRUSERS0),
    .HRDATAS    (HRDATAS0)

    );


  // Matrix decoder for SI1
  ahb_bus_matrix_decoderS1 u_ahb_bus_matrix_decoders1 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Signals from Input stage SI1
    .HREADYS    (HREADYS1),
    .sel_dec        (i_sel1),
    .decode_addr_dec (i_addr1[31:10]),   // HADDR[9:0] is not decoded
    .trans_dec      (i_trans1),

    // Control/Response for Output Stage MI0
    .active_dec0    (i_active1to0),
    .readyout_dec0  (i_hready_mux_m0),
    .resp_dec0      (HRESPM0),
    .rdata_dec0     (HRDATAM0),
    .ruser_dec0     (HRUSERM0),

    // Control/Response for Output Stage MI1
    .active_dec1    (i_active1to1),
    .readyout_dec1  (i_hready_mux_m1),
    .resp_dec1      (HRESPM1),
    .rdata_dec1     (HRDATAM1),
    .ruser_dec1     (HRUSERM1),

    .sel_dec0       (i_sel1to0),
    .sel_dec1       (i_sel1to1),

    .active_dec     (i_active1),
    .HREADYOUTS (i_readyout1),
    .HRESPS     (i_resp1),
    .HRUSERS    (HRUSERS1),
    .HRDATAS    (HRDATAS1)

    );


  // Matrix decoder for SI2
  ahb_bus_matrix_decoderS2 u_ahb_bus_matrix_decoders2 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Signals from Input stage SI2
    .HREADYS    (HREADYS2),
    .sel_dec        (i_sel2),
    .decode_addr_dec (i_addr2[31:10]),   // HADDR[9:0] is not decoded
    .trans_dec      (i_trans2),

    // Control/Response for Output Stage MI2
    .active_dec2    (i_active2to2),
    .readyout_dec2  (i_hready_mux_m6),
    .resp_dec2      (HRESPM6),
    .rdata_dec2     (HRDATAM6),
    .ruser_dec2     (HRUSERM6),

    // Control/Response for Output Stage MI3
    .active_dec3    (i_active2to3),
    .readyout_dec3  (i_hready_mux_m7),
    .resp_dec3      (HRESPM7),
    .rdata_dec3     (HRDATAM7),
    .ruser_dec3     (HRUSERM7),

    // Control/Response for Output Stage MI4
    .active_dec4    (i_active2to4),
    .readyout_dec4  (i_hready_mux_m8),
    .resp_dec4      (HRESPM8),
    .rdata_dec4     (HRDATAM8),
    .ruser_dec4     (HRUSERM8),

    .sel_dec2       (i_sel2to2),
    .sel_dec3       (i_sel2to3),
    .sel_dec4       (i_sel2to4),

    .active_dec     (i_active2),
    .HREADYOUTS (i_readyout2),
    .HRESPS     (i_resp2),
    .HRUSERS    (HRUSERS2),
    .HRDATAS    (HRDATAS2)

    );


  // Matrix decoder for SI3
  ahb_bus_matrix_decoderS4 u_ahb_bus_matrix_decoders4 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Signals from Input stage SI3
    .HREADYS    (HREADYS4),
    .sel_dec        (i_sel3),
    .decode_addr_dec (i_addr3[31:10]),   // HADDR[9:0] is not decoded
    .trans_dec      (i_trans3),

    // Control/Response for Output Stage MI0
    .active_dec0    (i_active3to0),
    .readyout_dec0  (i_hready_mux_m0),
    .resp_dec0      (HRESPM0),
    .rdata_dec0     (HRDATAM0),
    .ruser_dec0     (HRUSERM0),

    .sel_dec0       (i_sel3to0),

    .active_dec     (i_active3),
    .HREADYOUTS (i_readyout3),
    .HRESPS     (i_resp3),
    .HRUSERS    (HRUSERS4),
    .HRDATAS    (HRDATAS4)

    );


  // Output stage for MI0
  ahb_bus_matrix_oM0 u_ahb_bus_matrix_om0_0 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Port 0 Signals
    .sel_op0       (i_sel0to0),
    .addr_op0      (i_addr0),
    .auser_op0     (i_auser0),
    .trans_op0     (i_trans0),
    .write_op0     (i_write0),
    .size_op0      (i_size0),
    .burst_op0     (i_burst0),
    .prot_op0      (i_prot0),
    .master_op0    (i_master0),
    .mastlock_op0  (i_mastlock0),
    .wdata_op0     (HWDATAS0),
    .wuser_op0     (HWUSERS0),
    .held_tran_op0  (i_held_tran0),

    // Port 1 Signals
    .sel_op1       (i_sel1to0),
    .addr_op1      (i_addr1),
    .auser_op1     (i_auser1),
    .trans_op1     (i_trans1),
    .write_op1     (i_write1),
    .size_op1      (i_size1),
    .burst_op1     (i_burst1),
    .prot_op1      (i_prot1),
    .master_op1    (i_master1),
    .mastlock_op1  (i_mastlock1),
    .wdata_op1     (HWDATAS1),
    .wuser_op1     (HWUSERS1),
    .held_tran_op1  (i_held_tran1),

    // Port 3 Signals
    .sel_op3       (i_sel3to0),
    .addr_op3      (i_addr3),
    .auser_op3     (i_auser3),
    .trans_op3     (i_trans3),
    .write_op3     (i_write3),
    .size_op3      (i_size3),
    .burst_op3     (i_burst3),
    .prot_op3      (i_prot3),
    .master_op3    (i_master3),
    .mastlock_op3  (i_mastlock3),
    .wdata_op3     (HWDATAS4),
    .wuser_op3     (HWUSERS4),
    .held_tran_op3  (i_held_tran3),

    // Slave read data and response
    .HREADYOUTM (HREADYOUTM0),

    .active_op0    (i_active0to0),
    .active_op1    (i_active1to0),
    .active_op3    (i_active3to0),

    // Slave Address/Control Signals
    .HSELM      (HSELM0),
    .HADDRM     (HADDRM0),
    .HAUSERM    (HAUSERM0),
    .HTRANSM    (HTRANSM0),
    .HWRITEM    (HWRITEM0),
    .HSIZEM     (HSIZEM0),
    .HBURSTM    (HBURSTM0),
    .HPROTM     (HPROTM0),
    .HMASTERM   (HMASTERM0),
    .HMASTLOCKM (HMASTLOCKM0),
    .HREADYMUXM (i_hready_mux_m0),
    .HWUSERM    (HWUSERM0),
    .HWDATAM    (HWDATAM0)

    );

  // Drive output with internal version
  assign HREADYMUXM0 = i_hready_mux_m0;


  // Output stage for MI1
  ahb_bus_matrix_oM1 u_ahb_bus_matrix_om1_1 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Port 0 Signals
    .sel_op0       (i_sel0to1),
    .addr_op0      (i_addr0),
    .auser_op0     (i_auser0),
    .trans_op0     (i_trans0),
    .write_op0     (i_write0),
    .size_op0      (i_size0),
    .burst_op0     (i_burst0),
    .prot_op0      (i_prot0),
    .master_op0    (i_master0),
    .mastlock_op0  (i_mastlock0),
    .wdata_op0     (HWDATAS0),
    .wuser_op0     (HWUSERS0),
    .held_tran_op0  (i_held_tran0),

    // Port 1 Signals
    .sel_op1       (i_sel1to1),
    .addr_op1      (i_addr1),
    .auser_op1     (i_auser1),
    .trans_op1     (i_trans1),
    .write_op1     (i_write1),
    .size_op1      (i_size1),
    .burst_op1     (i_burst1),
    .prot_op1      (i_prot1),
    .master_op1    (i_master1),
    .mastlock_op1  (i_mastlock1),
    .wdata_op1     (HWDATAS1),
    .wuser_op1     (HWUSERS1),
    .held_tran_op1  (i_held_tran1),

    // Slave read data and response
    .HREADYOUTM (HREADYOUTM1),

    .active_op0    (i_active0to1),
    .active_op1    (i_active1to1),

    // Slave Address/Control Signals
    .HSELM      (HSELM1),
    .HADDRM     (HADDRM1),
    .HAUSERM    (HAUSERM1),
    .HTRANSM    (HTRANSM1),
    .HWRITEM    (HWRITEM1),
    .HSIZEM     (HSIZEM1),
    .HBURSTM    (HBURSTM1),
    .HPROTM     (HPROTM1),
    .HMASTERM   (HMASTERM1),
    .HMASTLOCKM (HMASTLOCKM1),
    .HREADYMUXM (i_hready_mux_m1),
    .HWUSERM    (HWUSERM1),
    .HWDATAM    (HWDATAM1)

    );

  // Drive output with internal version
  assign HREADYMUXM1 = i_hready_mux_m1;


  // Output stage for MI2
  ahb_bus_matrix_oM6 u_ahb_bus_matrix_om6_2 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Port 2 Signals
    .sel_op2       (i_sel2to2),
    .addr_op2      (i_addr2),
    .auser_op2     (i_auser2),
    .trans_op2     (i_trans2),
    .write_op2     (i_write2),
    .size_op2      (i_size2),
    .burst_op2     (i_burst2),
    .prot_op2      (i_prot2),
    .master_op2    (i_master2),
    .mastlock_op2  (i_mastlock2),
    .wdata_op2     (HWDATAS2),
    .wuser_op2     (HWUSERS2),
    .held_tran_op2  (i_held_tran2),

    // Slave read data and response
    .HREADYOUTM (HREADYOUTM6),

    .active_op2    (i_active2to2),

    // Slave Address/Control Signals
    .HSELM      (HSELM6),
    .HADDRM     (HADDRM6),
    .HAUSERM    (HAUSERM6),
    .HTRANSM    (HTRANSM6),
    .HWRITEM    (HWRITEM6),
    .HSIZEM     (HSIZEM6),
    .HBURSTM    (HBURSTM6),
    .HPROTM     (HPROTM6),
    .HMASTERM   (HMASTERM6),
    .HMASTLOCKM (HMASTLOCKM6),
    .HREADYMUXM (i_hready_mux_m6),
    .HWUSERM    (HWUSERM6),
    .HWDATAM    (HWDATAM6)

    );

  // Drive output with internal version
  assign HREADYMUXM6 = i_hready_mux_m6;


  // Output stage for MI3
  ahb_bus_matrix_oM7 u_ahb_bus_matrix_om7_3 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Port 2 Signals
    .sel_op2       (i_sel2to3),
    .addr_op2      (i_addr2),
    .auser_op2     (i_auser2),
    .trans_op2     (i_trans2),
    .write_op2     (i_write2),
    .size_op2      (i_size2),
    .burst_op2     (i_burst2),
    .prot_op2      (i_prot2),
    .master_op2    (i_master2),
    .mastlock_op2  (i_mastlock2),
    .wdata_op2     (HWDATAS2),
    .wuser_op2     (HWUSERS2),
    .held_tran_op2  (i_held_tran2),

    // Slave read data and response
    .HREADYOUTM (HREADYOUTM7),

    .active_op2    (i_active2to3),

    // Slave Address/Control Signals
    .HSELM      (HSELM7),
    .HADDRM     (HADDRM7),
    .HAUSERM    (HAUSERM7),
    .HTRANSM    (HTRANSM7),
    .HWRITEM    (HWRITEM7),
    .HSIZEM     (HSIZEM7),
    .HBURSTM    (HBURSTM7),
    .HPROTM     (HPROTM7),
    .HMASTERM   (HMASTERM7),
    .HMASTLOCKM (HMASTLOCKM7),
    .HREADYMUXM (i_hready_mux_m7),
    .HWUSERM    (HWUSERM7),
    .HWDATAM    (HWDATAM7)

    );

  // Drive output with internal version
  assign HREADYMUXM7 = i_hready_mux_m7;


  // Output stage for MI4
  ahb_bus_matrix_oM8 u_ahb_bus_matrix_om8_4 (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Port 2 Signals
    .sel_op2       (i_sel2to4),
    .addr_op2      (i_addr2),
    .auser_op2     (i_auser2),
    .trans_op2     (i_trans2),
    .write_op2     (i_write2),
    .size_op2      (i_size2),
    .burst_op2     (i_burst2),
    .prot_op2      (i_prot2),
    .master_op2    (i_master2),
    .mastlock_op2  (i_mastlock2),
    .wdata_op2     (HWDATAS2),
    .wuser_op2     (HWUSERS2),
    .held_tran_op2  (i_held_tran2),

    // Slave read data and response
    .HREADYOUTM (HREADYOUTM8),

    .active_op2    (i_active2to4),

    // Slave Address/Control Signals
    .HSELM      (HSELM8),
    .HADDRM     (HADDRM8),
    .HAUSERM    (HAUSERM8),
    .HTRANSM    (HTRANSM8),
    .HWRITEM    (HWRITEM8),
    .HSIZEM     (HSIZEM8),
    .HBURSTM    (HBURSTM8),
    .HPROTM     (HPROTM8),
    .HMASTERM   (HMASTERM8),
    .HMASTLOCKM (HMASTLOCKM8),
    .HREADYMUXM (i_hready_mux_m8),
    .HWUSERM    (HWUSERM8),
    .HWDATAM    (HWDATAM8)

    );

  // Drive output with internal version
  assign HREADYMUXM8 = i_hready_mux_m8;


endmodule

// --================================= End ===================================--

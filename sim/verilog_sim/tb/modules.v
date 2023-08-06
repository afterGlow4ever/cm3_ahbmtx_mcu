//===============================================
//
//	File: modules.v
//	Group: Fall For Laboratory
//	Author: afterGlow,4ever
//	Date: 07022023
//	Version: v1.0
//
//	This is used for adding stimulus, models and so on.
//
//===============================================

`ifdef CPU_SWD_SIM
`include "cpu_swd.v"
`endif

`ifdef CPU_BUS_SIM
`include "ahb_apb_bus.v"
`endif




>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//
//	File: CHANGELOG.MD
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//
// 	This is update log for 'cm3_ahbmtx_mcu'.
//
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 08062023

ADD:		First Release.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 08182023

ADD:		AHB SRAM & FPGA SRAM.
ADD:		FW environment.
FIX:		SWD model bug in read operation. tv files are also fixed.	

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 08302023

ADD:    ITCM bootloader firmware.
ADD:		Boot simulations for bootloader in rtl or fpga platform are ready.
FIX:		Boot fail. CPU DBUS can access ITCM.	

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 09292023

ADD:		FPGA verilog rtl, pin assignment, timing constrain.
ADD:    FPGA enviroment for quartus & vivado including generate bitfile & debug cores.
ADD:		Both quartus & vivado ip cores for ram & pll. Only in quartus environment, init file is valid currently.
(Try to solve later)

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 11262023

ADD:		SGDC constrain for spyglass.
ADD:    APB0(sync) & APB1(async) with debug regs. Also, simulation has been updated in 'cpu_bus_sim'.
ADD:		Simualtion monitor model for simulation data check and result display.
ADD:		APB regs generation script.
MODIFY:	AHB bus matrix has been updated for apb0. CPU sbus can access it.
MODIFY:	Fall For Laboratory Script modify.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
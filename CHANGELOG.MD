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

Date: 12172023

ADD:    Uart RTL, Uart model, uart testbench and uart testcase.
ADD:		Uart SGDC constrain for spyglass.	
ADD:		Interrupt handle RTL.
FIX:		SWD model bug in ack bit.
FIX:		Vivado fpga compile script error.
MODIFY:	RTL logic lib has been modified, including async fifo, sync fifo, enable for signal sync.
MODIFY:	AHB bus matrix has been updated for apb0 and apb1. CPU sbus can access them.
MODIFY:	Simualtion monitor model for simulation data specify bits check and result display.
MODIFY:	Update xilinx vivado IP cores.
MODIFY:	Fall For Laboratory Script modify.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 01072024

ADD:    Uart driver and extented driver.
ADD:		MCU test firmware framework including FLM to itcm. FLM is storaged in dtcm.
ADD:		Uart1. Now, this mcu has 2 uart instance.	
ADD:		Cortex-M3 int line logic handle. A document was used to indicate.
ADD:		Uart1 test firmware.
FIX:		Uart reg table ports has been changed due to the error behavior in RWSC regs. 
				However, the script for apb regs generations will not be modified.
MODIFY:	apb0 peripherals address logic.
MODIFY:	CPU IBUS can access DTCM.
MODIFY:	Uart1 has been added into Startup.S.
MODIFY:	Altera FPGA pin assinment for uart1 with the document updated.
MODIFY:	Altera FPGA sof for mcu uart test.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 01202024

ADD:    GPIO RTL and gpio testcase. (AF mode not sim to verify)
ADD:    GPIO driver, armgcc env and keil env.
ADD:		GPIO SGDC constrain and wavier for spyglass.	
ADD:		GPIO af table document.
FIX:		Uart rx driver when error occurs. If not ignoring any errors, rx driver will exit when error occurs.
MODIFY:	Edge detection logic in lib has been modify for multiple bits.
MODIFY:	CPU interrupt input logic including GPIO.
MODIFY:	GPIO has been added into Startup.S.
MODIFY:	Altera FPGA pin assinment for gpio with the document updated.
MODIFY:	Altera FPGA sof for mcu gpio test.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 01272024

ADD:    Basic timer RTL and basic timer testcase.
ADD:    Basic timer driver, armgcc env and keil env.
ADD:		Basic timer SGDC constrain and wavier for spyglass.	
ADD:		Arch diagram for UART and Basic timer.
ADD:		CPU & bus arch diagram.
FIX:		Uart driver warning in init function.
MODIFY:	RWSC reg logic.
MODIFY:	CPU interrupt input logic add basic timer. Some interrupt line is sync and the other is async.
MODIFY:	Basic timer has been added into Startup.S.
MODIFY:	Altera FPGA sof for mcu basic timer test.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 03242024

ADD:    Hyper peripherals APB2 with async APB. This is connected AHB by S8.
ADD:		Ethernet sma, which is connected on APB2, has been added into.
ADD:    Ethernet sma RTL and basic timer testcase.
ADD:    Ethernet sma driver, armgcc env and keil env.
ADD:		Ethernet sma SGDC constrain and wavier for spyglass.	
ADD:		Arch diagram for ethernet sma.
ADD:		Ethernet simulation environment including sim model, testcases and related fw.
ADD:		SRAM0 & SRAM1 has been enlarge to 128K in order to be compatible with ethernet. Two capacity sram are both support via a define.
FIX:		SWD model readreg32. However, reading data still use twice swd_readreg32 cmd.
FIX:		Simple testcases in uart due to fix read in swd  model.
FIX:		According to spyglass starc05-1.3.1.3, rd_empty and wr_full logic in sync FIFO were fixed.
FIX:		Xilinx ZYNQ 7020 fpga compile script was updated and refreshed IP cores.
MODIFY:	128K version sram read & write simulation including cmsdk asic, altera ram ip and xilinx ram ip.
MODIFY:	CPU & bus arch diagram has been updated due to ethernet sma.
MODIFY:	CPU interrupt input logic add ethernet sma.
MODIFY:	Ethernet sma has been added into Startup.S.
MODIFY:	Altera FPGA sof and Xilinx ZYNQ for mcu ethernet sma test.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 04062024
ADD:    Quartus update mif scripts.
FIX:		Ethernet sma driver: Clear master frame done before operation each reg in read or write reglist functions.
MODIFY:	Keil FLM support both 128K sram and 32k sram version.
MODIFY:	Vivado fpga script: Add aggressive hold fix operation in vivado script.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Date: 11042024
ADD:    Ethernet mac tx rtl section. Only simple verification.
ADD:    Ethernet mac tx rtl testbench.
ADD:    Ethernet mac tx rtl spyglass testbench and script.
ADD:    CRC32D4 and CRC32D8 in rtl lib.
ADD:    Sync fifo with different input and output width in rtl lib.
ADD:    Univerisal ram generator in rtl lib for fpga ip and rtl. Only simple verification.
ADD:    Ethernet mac tx driver. Only simple verification.
MODIFY:	Ethernet sma driver name.
MODIFY:	Changing AHB bus matrix for ethernet ip ahb master.
MODIFY:	Changing interrupt line for ethernet ip.

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
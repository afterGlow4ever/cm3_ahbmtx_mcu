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
`include "cpu_bus_wr.v"
`endif

`ifdef SRAM_WR_SIM
`include "sram_wr.v"
`endif

`ifdef CPU_ITCM_BOOT
`include "cpu_itcm_boot.v"
`endif

`ifdef UART0_SIM
`include "uart0_test.v"
`endif

`ifdef UART0_TESTCASE
`include "uart0_testcase.v"
`endif

`ifdef UART_FW_TEST
`include "uart_fw_test.v"
`endif

`ifdef GPIO_SIM
`include "gpio_test.v"
`endif

`ifdef GPIO_TESTCASE
`include "gpio_testcase.v"
`endif

`ifdef GPIO_FW_TEST
`include "gpio_fw_test.v"
`endif

`ifdef BASTIM_SIM
`include "bastim_test.v"
`endif

`ifdef BASTIM_TESTCASE
`include "bastim_testcase.v"
`endif

`ifdef BASTIM_FW_TEST
`include "bastim_fw_test.v"
`endif

`ifdef ETH_SMA_SIM
`include "eth_sma_test.v"
`endif

`ifdef ETH_SMA_TESTCASE
`include "eth_sma_testcase.v"
`endif

`ifdef ETH_SMA_FW_TEST
`include "eth_sma_fw_test.v"
`endif

`ifdef ETH_MAC_FW_TEST
`include "eth_mac_fw_test.v"
`endif

`ifdef ADVTIM_FW_TEST
`include "advtim_fw_test.v"
`endif


#===============================================
#
#		File: makefile
#		Author: afterGlow,4ever
#		Group: Fall For Laboratory
#		Date: 07292023
#		Version: v1.0
#
# 	This is script top for any operation in this project.
# 	Including:
# 	1. RTL & fpga simulation
# 	2. RTL auto generation
# 	3. FW build
# 	4. cpu boot simulation
# 	5. fpga synthesis
#
#===============================================

#===============================================
# RTL & fpga simulation 
# system intergration
#===============================================

cpu_swd_sim:
	make -f makefile.cpu_swd_sim

cpu_bus_sim:
	make -f makefile.cpu_bus_sim

sram_wr_sim:
	make -f makefile.sram_wr_sim

fpga_ep4_cpu_swd_sim:
	make -f makefile.fpga_ep4_cpu_swd_sim

fpga_ep4_cpu_bus_sim:
	make -f makefile.fpga_ep4_cpu_bus_sim

fpga_7020_cpu_bus_sim:
	make -f makefile.fpga_7020_cpu_bus_sim

fpga_sram_wr_sim:
	make -f makefile.fpga_sram_wr_sim

fpga_7020_sram_wr_sim:
	make -f makefile.fpga_7020_sram_wr_sim

#===============================================
# RTL & fpga simulation 
# model function
#===============================================

uart0_test:
	make -f makefile.uart0_test

uart0_testcase:
	make -f makefile.uart0_testcase

uart_fw_sim:
	make -f makefile.uart_fw_sim

gpio_test:
	make -f makefile.gpio_test

gpio_testcase:
	make -f makefile.gpio_testcase

gpio_fw_sim:
	make -f makefile.gpio_fw_sim

bastim_test:
	make -f makefile.bastim_test

bastim_testcase:
	make -f makefile.bastim_testcase

bastim_fw_sim:
	make -f makefile.bastim_fw_sim

eth_sma_test:
	make -f makefile.eth_sma_test

eth_sma_testcase:
	make -f makefile.eth_sma_testcase

eth_sma_fw_sim:
	make -f makefile.eth_sma_fw_sim

eth_mac_fw_sim:
	make -f makefile.eth_mac_fw_sim

#===============================================
# RTL auto generation
#===============================================

ahbmtx_gen:
	make -f makefile.ahbmtx_gen

uart_reg_gen:
	make -f makefile.uart_reg_gen

gpio_reg_gen:
	make -f makefile.gpio_reg_gen

bastim_reg_gen:
	make -f makefile.bastim_reg_gen

eth_reg_gen:
	make -f makefile.eth_reg_gen

#===============================================
# firmware build
#===============================================

bootloader:
	make -f makefile.bootloader

fw_test:
	make -f makefile.fw_test

fw_bin_test:
	make -f makefile.fw_bin_test

#===============================================
# cpu boot simulation
#===============================================

cpu_itcm_boot_sim:
	make -f makefile.cpu_itcm_boot_sim

fpga_ep4_cpu_itcm_boot_sim:
	make -f makefile.fpga_ep4_cpu_itcm_boot_sim

fpga_7020_cpu_itcm_boot_sim:
	make -f makefile.fpga_7020_cpu_itcm_boot_sim

#===============================================
# fpga synthesis
#===============================================

fpga_ep4_mcu_full_quartus:
	make -f makefile.fpga_ep4_mcu_full_quartus

fpga_ep4_mcu_update_mif:
	make -f makefile.fpga_ep4_mcu_update_mif

fpga_7020_mcu_full_vivado:
	make -f makefile.fpga_7020_mcu_full_vivado


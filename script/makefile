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
# 	1. RTL simulation
# 	2. RTL auto generation
# 	3. FW build
# 	4. cpu boot simulation
#
#===============================================

#===============================================
# RTL simulation
#===============================================

cpu_swd_sim:
	make -f makefile.cpu_swd_sim

cpu_bus_sim:
	make -f makefile.cpu_bus_sim

sram_wr_sim:
	make -f makefile.sram_wr_sim

fpga_sram_wr_sim:
	make -f makefile.fpga_sram_wr_sim

#===============================================
# RTL auto generation
#===============================================

ahbmtx_gen:
	make -f makefile.ahbmtx_gen

#===============================================
# firmware build
#===============================================

bootloader:
	make -f makefile.bootloader

#===============================================
# cpu boot simulation
#===============================================

cpu_itcm_boot_sim:
	make -f makefile.cpu_itcm_boot_sim

fpga_cpu_itcm_boot_sim:
	make -f makefile.fpga_cpu_itcm_boot_sim


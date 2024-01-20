#===============================================
#
#		File: fpga_7020_mcu_full_pin_assignments.xdc
#		Author: afterGlow,4ever
#		Group: Fall For Laboratory
#		Date: 09242023
#		Version: v1.0
#
# 	This is pin assignment for xilinx fpga.
# 	Using alientek zynq 7020 navigator board.
#
#===============================================

#p4 header
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports CLK]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports RSTN]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports TDI]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports TCK]
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33} [get_ports TMS]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports TDO]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports TRST]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports TXD]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports RXD]
























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
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports MDC]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports MDIO]
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports ETH_RST]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports TCK]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports TMS]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports TXD]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports RXD]


set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH1P]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH1N]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH2P]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH2P]
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH3P]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH3P]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH4]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH5]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_PWM_CH6]

set_property -dict {PACKAGE_PIN R19 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_CAP_CH1P]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_CAP_CH1N]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_ENC_CH1P]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_ENC_CH1N]

set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_BK1]
set_property -dict {PACKAGE_PIN J20 IOSTANDARD LVCMOS33} [get_ports ADVTIM0_BK2]




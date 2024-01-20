#===============================================
#
#		File: fpga_ep4_mcu_full_pin_assignments.tcl
#		Author: afterGlow,4ever
#		Group: Fall For Laboratory
#		Date: 09102023
#		Version: v1.0
#
# 	This is pin assignment for altera fpga.
# 	Using ep4ce55 ad9361 eval board.
#
#===============================================

#base pin
set_location_assignment PIN_T2 		-to CLK
set_location_assignment PIN_K17 	-to RSTN

#left header
set_location_assignment PIN_D8	 	-to TDI
set_location_assignment PIN_C10	 	-to TCK
set_location_assignment PIN_E11	 	-to TMS
set_location_assignment PIN_E14	 	-to TDO
set_location_assignment PIN_E13	 	-to TRST

#to ft2232
set_location_assignment PIN_B16	 	-to RXD
set_location_assignment PIN_A17	 	-to TXD
#set_location_assignment PIN_B13	 	-to RXD1
#set_location_assignment PIN_A13	 	-to TXD1
set_location_assignment PIN_E3	 	-to GPIOA[2]
set_location_assignment PIN_E4	 	-to GPIOA[3]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RSTN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TDI
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TDO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TMS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TRST
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RXD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TXD
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RXD1
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TXD1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIOA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIOA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tck
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tdi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tdo
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tms



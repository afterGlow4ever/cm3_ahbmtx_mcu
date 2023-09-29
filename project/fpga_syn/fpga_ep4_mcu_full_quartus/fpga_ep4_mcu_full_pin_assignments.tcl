#base pin
set_location_assignment PIN_T2 		-to CLK
set_location_assignment PIN_K17 	-to RSTN

#left header
set_location_assignment PIN_D8	 	-to TDI
set_location_assignment PIN_C10	 	-to TCK
set_location_assignment PIN_E11	 	-to TMS
set_location_assignment PIN_E14	 	-to TDO
set_location_assignment PIN_E13	 	-to TRST

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to RSTN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TDI
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TDO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TMS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TRST
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tck
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tdi
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tdo
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to altera_reserved_tms



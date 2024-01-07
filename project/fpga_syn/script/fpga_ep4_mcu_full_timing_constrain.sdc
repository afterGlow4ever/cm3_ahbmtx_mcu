#===============================================
#
#		File: fpga_ep4_mcu_full_timing_constrain.tcl
#		Author: afterGlow,4ever
#		Group: Fall For Laboratory
#		Date: 09102023
#		Version: v1.0
#
# 	This is timing constrain for altera fpga.
# 	Using ep4ce55 ad9361 eval board.
#
#===============================================

create_clock -name {hse} -period 25.000 -waveform {0.000 12.500} [get_ports {CLK}]
create_clock -name {jtag_tck} -period 200.000 -waveform {0.000 100.000} [get_ports {TCK}]

derive_pll_clocks

set_clock_groups -async -group [get_clocks {hse}]
set_clock_groups -async -group [get_clocks {jtag_tck}]

set_false_path -from [get_ports RSTN]


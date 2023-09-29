create_clock -name {hse} -period 25.000 -waveform {0.000 12.500} [get_ports {CLK}]
create_clock -name {jtag_tck} -period 200.000 -waveform {0.000 100.000} [get_ports {TCK}]

derive_pll_clocks

set_clock_groups -async -group [get_clocks {hse}]
set_clock_groups -async -group [get_clocks {jtag_tck}]

set_false_path -from [get_ports RSTN]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets TCK_IBUF]


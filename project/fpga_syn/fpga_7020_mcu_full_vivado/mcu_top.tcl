file mkdir ./checkpoint

set PROJECT_NAME mcu_top 

if {[ catch {create_project $PROJECT_NAME -part xc7z020clg400-2} ]} {
	open_project $PROJECT_NAME
}

read_verilog design_define.v
source fpga_7020_ip.tcl
source fpga_7020_dut.tcl
source dut.tcl
source fpga_7020_mcu_full_cfg.tcl
read_xdc fpga_7020_mcu_full_pin_assignments.xdc
read_xdc fpga_7020_mcu_full_timing_constrain.xdc

#generate_target
synth_ip [get_ips]

update_compile_order

synth_design -top $PROJECT_NAME
write_checkpoint -force ./checkpoint/synthesis

report_utilization -file ./checkpoint/synthesis_util.rpt
report_utilization -hierarchical -hierarchical_depth 3 -file ./checkpoint/synthesis_hier.rpt
report_clocks -file ./checkpoint/synthesis_clk.rpt

place_design
phys_opt_design
write_checkpoint -force ./checkpoint/place

route_design
write_checkpoint -force ./checkpoint/route

report_timing_summary -file ./checkpoint/sta.rpt
report_timing -sort_by group -max_paths 1000 -path_type summary -file ./checkpoint/sta.rpt
report_utilization -file ./checkpoint/implementation_util.rpt
report_utilization -hierarchical -hierarchical_depth 3 -file ./checkpoint/implementation_hier.rpt
#report_clock_utilization -quiet -write_xdc /checkpoint/implementation_clk.xdc
report_clocks -file ./checkpoint/implementation_clk.rpt
report_drc -file ./checkpoint/implementation_drc.rpt
write_xdc -no_fixed_only -force ./checkpoint/implementation_clk.xdc

write_bitstream -bin_file -force ./bitstream


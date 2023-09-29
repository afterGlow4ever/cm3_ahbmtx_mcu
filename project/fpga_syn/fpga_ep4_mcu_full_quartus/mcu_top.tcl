package require ::quartus::project
package require ::quartus::flow
package require ::quartus::misc

set need_to_close_project 0
set make_assignments 1

set PROJECT_NAME mcu_top 

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) $PROJECT_NAME]} {
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists $PROJECT_NAME]} {
		project_open -revision $PROJECT_NAME $PROJECT_NAME
	} else {
		project_new -revision $PROJECT_NAME $PROJECT_NAME
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name VERILOG_FILE design_define.v
	source dut.tcl
	source fpga_dut.tcl
	source fpga_ep4_mcu_full_cfg.tcl
	source fpga_ep4_mcu_full_pin_assignments.tcl
	set_global_assignment -name SDC_FILE fpga_ep4_mcu_full_timing_constrain.sdc

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}


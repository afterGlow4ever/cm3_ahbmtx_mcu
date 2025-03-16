//===============================================
//
//	File: advtim_fw_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 11242024
//	Version: v1.0
//
//	This is stimulus for advance timer.
//
//===============================================

//===============================================
// advtim command sequences
//===============================================

reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;

initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	test_start = 1'b1;
end

initial
begin
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hed);
	#200000
	$finish;
end

//===============================================
// advtim iut & lt case
//===============================================

initial
begin	
	wait(test_start == 1'b1);

	#50000
	test_end = 1'b1;
end


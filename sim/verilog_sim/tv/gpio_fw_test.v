//===============================================
//
//	File: gpio_fw_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 01202024
//	Version: v1.0
//
//	This is stimulus for gpio.
//
//===============================================

//===============================================
// gpio command sequences
//===============================================

reg		[15:0]					wdata;
reg		[15:0]					rdata;
reg		[31:0]					gpioa_r_mode;
reg		[31:0]					gpioa_r_od;
reg		[31:0]					gpioa_r_toggle;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;
reg		[15:0]					gpioa_in;
wire	[15:0]					gpioa_out;

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
// gpioa iut & lt case
//===============================================

assign a3 = a2; 

initial
begin	
	wait(test_start == 1'b1);

	#50000
	test_end = 1'b1;
end


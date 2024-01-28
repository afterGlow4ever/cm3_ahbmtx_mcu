//===============================================
//
//	File: bastim_testcase.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 02272024
//	Version: v1.0
//
//	This is stimulus for basic timer testcase.
//	Details are listed in bastim_testcase.xls.
//
//===============================================

//===============================================
// clk and rst for swd
// simulation config
//===============================================

reg								jlink_rstn;

// jlink internal reset will be release at 10us
initial
begin
	jlink_rstn = 1'b0;
	#10000
	jlink_rstn = 1'b1;
end

//===============================================
// swd simulation model
//===============================================

pullup(tms);
pullup(tdo);
pulldown(tck);

jlink_model u_swd_model
(
	.rstn_i						(jlink_rstn),
	.tck_o						(tck),
	.tms_io						(tms),
	.tdi_i						(tdi),
	.tdo_o						(tdo),
	.trstn_o					(trstn),
	.tms_oen_o					()
);

//===============================================
// gpio command sequences
//===============================================

reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;
reg		[31:0]					bastim_r_ch0_ctrl0;
reg		[31:0]					bastim_r_ch0_ctrl1;
reg		[31:0]					bastim_r_ch1_ctrl0;
reg		[31:0]					bastim_r_ch1_ctrl1;
reg		[31:0]					bastim_r_ch2_ctrl0;
reg		[31:0]					bastim_r_ch2_ctrl1;
reg		[31:0]					bastim_r_ch3_ctrl0;
reg		[31:0]					bastim_r_ch3_ctrl1;

initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	bastim_r_ch0_ctrl0 = 32'h0;
	bastim_r_ch0_ctrl1 = 32'h0;
	bastim_r_ch1_ctrl0 = 32'h0;
	bastim_r_ch1_ctrl1 = 32'h0;
	bastim_r_ch2_ctrl0 = 32'h0;
	bastim_r_ch2_ctrl1 = 32'h0;
	bastim_r_ch3_ctrl0 = 32'h0;
	bastim_r_ch3_ctrl1 = 32'h0;
	u_sim_monitor.sim_monitor_init("basic timer test");
	u_swd_model.swd_init;
	test_start = 1'b1;
	// sim will finish 
	wait(test_end == 1'b1);
	#1000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("basic timer test");
	$finish;
end

//===============================================
// gpioa iut & lt case
//===============================================

initial
begin	
	wait(test_start == 1'b1);

	#100
`ifdef TP_0
	bastim_r_ch0_ctrl0 =  16'h2			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch0_ctrl1 =  16'h0			<<  0 ; // start cnt

	bastim_r_ch1_ctrl0 =  16'h5			<<  0 | // arr
						  16'h3			<< 16 ; // psc
	bastim_r_ch1_ctrl1 =  16'h1			<<  0 ; // start cnt

	bastim_r_ch2_ctrl0 =  16'h9			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch2_ctrl1 =  16'h5			<<  0 ; // start cnt

	bastim_r_ch3_ctrl0 =  16'h7			<<  0 | // arr
						  16'h5			<< 16 ; // psc
	bastim_r_ch3_ctrl1 =  16'h2			<<  0 ; // start cnt

	// int enable
	u_swd_model.swd_writereg32(32'h40010040, 32'h0000000f);

	u_swd_model.swd_writereg32(32'h40010004, bastim_r_ch0_ctrl0);
	u_swd_model.swd_writereg32(32'h40010008, bastim_r_ch0_ctrl1);
	u_swd_model.swd_writereg32(32'h40010000, 32'h00000007);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010014, bastim_r_ch1_ctrl0);
	u_swd_model.swd_writereg32(32'h40010018, bastim_r_ch1_ctrl1);
	u_swd_model.swd_writereg32(32'h40010010, 32'h00000007);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010024, bastim_r_ch2_ctrl0);
	u_swd_model.swd_writereg32(32'h40010028, bastim_r_ch2_ctrl1);
	u_swd_model.swd_writereg32(32'h40010020, 32'h00000007);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010034, bastim_r_ch3_ctrl0);
	u_swd_model.swd_writereg32(32'h40010038, bastim_r_ch3_ctrl1);
	u_swd_model.swd_writereg32(32'h40010030, 32'h00000007);// set autoreload & enable & update

	#1000000
	test_end = 1'b1;
`endif

`ifdef TP_1
	bastim_r_ch0_ctrl0 =  16'h2			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch0_ctrl1 =  16'h0			<<  0 ; // start cnt

	bastim_r_ch1_ctrl0 =  16'h5			<<  0 | // arr
						  16'h3			<< 16 ; // psc
	bastim_r_ch1_ctrl1 =  16'h1			<<  0 ; // start cnt

	bastim_r_ch2_ctrl0 =  16'h9			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch2_ctrl1 =  16'h5			<<  0 ; // start cnt

	bastim_r_ch3_ctrl0 =  16'h7			<<  0 | // arr
						  16'h5			<< 16 ; // psc
	bastim_r_ch3_ctrl1 =  16'h2			<<  0 ; // start cnt

	// int enable
	u_swd_model.swd_writereg32(32'h40010040, 32'h0000000f);

	u_swd_model.swd_writereg32(32'h40010004, bastim_r_ch0_ctrl0);
	u_swd_model.swd_writereg32(32'h40010008, bastim_r_ch0_ctrl1);
	u_swd_model.swd_writereg32(32'h40010000, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010014, bastim_r_ch1_ctrl0);
	u_swd_model.swd_writereg32(32'h40010018, bastim_r_ch1_ctrl1);
	u_swd_model.swd_writereg32(32'h40010010, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010024, bastim_r_ch2_ctrl0);
	u_swd_model.swd_writereg32(32'h40010028, bastim_r_ch2_ctrl1);
	u_swd_model.swd_writereg32(32'h40010020, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010034, bastim_r_ch3_ctrl0);
	u_swd_model.swd_writereg32(32'h40010038, bastim_r_ch3_ctrl1);
	u_swd_model.swd_writereg32(32'h40010030, 32'h00000003);// set autoreload & enable & update

	#500000
	test_end = 1'b1;
`endif

`ifdef TP_2
	bastim_r_ch0_ctrl0 =  16'h2			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch0_ctrl1 =  16'h0			<<  0 ; // start cnt

	bastim_r_ch1_ctrl0 =  16'h5			<<  0 | // arr
						  16'h3			<< 16 ; // psc
	bastim_r_ch1_ctrl1 =  16'h1			<<  0 ; // start cnt

	bastim_r_ch2_ctrl0 =  16'h9			<<  0 | // arr
						  16'h2			<< 16 ; // psc
	bastim_r_ch2_ctrl1 =  16'h5			<<  0 ; // start cnt

	bastim_r_ch3_ctrl0 =  16'h7			<<  0 | // arr
						  16'h5			<< 16 ; // psc
	bastim_r_ch3_ctrl1 =  16'h2			<<  0 ; // start cnt

	// int enable
	u_swd_model.swd_writereg32(32'h40010040, 32'h0000000f);

	u_swd_model.swd_writereg32(32'h40010004, bastim_r_ch0_ctrl0);
	u_swd_model.swd_writereg32(32'h40010008, bastim_r_ch0_ctrl1);
	u_swd_model.swd_writereg32(32'h40010000, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010014, bastim_r_ch1_ctrl0);
	u_swd_model.swd_writereg32(32'h40010018, bastim_r_ch1_ctrl1);
	u_swd_model.swd_writereg32(32'h40010010, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010024, bastim_r_ch2_ctrl0);
	u_swd_model.swd_writereg32(32'h40010028, bastim_r_ch2_ctrl1);
	u_swd_model.swd_writereg32(32'h40010020, 32'h00000003);// set autoreload & enable & update
	u_swd_model.swd_writereg32(32'h40010034, bastim_r_ch3_ctrl0);
	u_swd_model.swd_writereg32(32'h40010038, bastim_r_ch3_ctrl1);
	u_swd_model.swd_writereg32(32'h40010030, 32'h00000003);// set autoreload & enable & update

	u_swd_model.swd_writereg32(32'h40010000, 32'h00000000);// set enable again
	u_swd_model.swd_writereg32(32'h40010000, 32'h00000003);// set enable again
	u_swd_model.swd_writereg32(32'h40010010, 32'h00000000);// set enable again
	u_swd_model.swd_writereg32(32'h40010010, 32'h00000003);// set enable again
	u_swd_model.swd_writereg32(32'h40010020, 32'h00000000);// set enable again
	u_swd_model.swd_writereg32(32'h40010020, 32'h00000003);// set enable again
	u_swd_model.swd_writereg32(32'h40010030, 32'h00000000);// set enable again
	u_swd_model.swd_writereg32(32'h40010030, 32'h00000003);// set enable again

	#500000
	test_end = 1'b1;
`endif


end


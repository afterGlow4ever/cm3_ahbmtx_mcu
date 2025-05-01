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
// pwm model
//===============================================

reg								pwm_enable;

pwm_model u_pwm_model
(
	.pwm_period_number			(16'd999),
	.pwm_half					(16'd63),
	.pwm_period					(16'd127),
	.pwm_enable					(pwm_enable),
	.pwm_output					(advtmr0_cap_ch1p)
);

//===============================================
// encoder model
//===============================================

reg								encoder_direction;
reg								encoder_direct_enable;
reg								encoder_quadrature_enable;

encoder_model u_encoder_model
(
	.encoder_period_number		(16'd9999),
	.encoder_half				(16'd1),
	.encoder_period				(16'd3),
	.encoder_direction			(encoder_direction),
	.encoder_direct_enable		(encoder_direct_enable),
	.encoder_quadrature_enable	(encoder_quadrature_enable),
	.encoder_direct_output		(advtmr0_enc_ch1p),
	.encoder_quadrature_output	(advtmr0_enc_ch1n)
);

//===============================================
// break model
//===============================================

pullup(advtmr0_bk1);
pullup(advtmr0_bk2);

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
`ifdef TP1_1
	pwm_enable = 1'b0;
`endif
`ifdef TP1_5
	pwm_enable = 1'b0;
`endif
`ifdef TP2_1
	encoder_direct_enable = 1'b0;
	encoder_quadrature_enable = 1'b0;
	encoder_direction = 1'b0;
`endif
`ifdef TP2_2
	encoder_direct_enable = 1'b0;
	encoder_quadrature_enable = 1'b0;
	encoder_direction = 1'b1;
`endif
`ifdef TP2_5
	encoder_direct_enable = 1'b0;
	encoder_quadrature_enable = 1'b0;
	encoder_direction = 1'b1;
`endif
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hbd);
`ifdef TP1_1
	pwm_enable = 1'b1;
`endif
`ifdef TP1_5
	pwm_enable = 1'b1;
`endif
`ifdef TP2_1
	encoder_direct_enable = 1'b1;
	encoder_quadrature_enable = 1'b1;
`endif
`ifdef TP2_2
	encoder_direct_enable = 1'b1;
	encoder_quadrature_enable = 1'b1;
`endif
`ifdef TP2_5
	encoder_direct_enable = 1'b1;
	encoder_quadrature_enable = 1'b1;
`endif
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hed);
	#200000
	$finish;
end

initial
begin
`ifdef TP1_5
	#146750
	force TOP.u_pwm_model.pwm_output = 1'b1;
	#50
	release TOP.u_pwm_model.pwm_output;
`endif
`ifdef TP2_5
	#1355140
	force TOP.u_encoder_model.encoder_direct_output = 1'b1;
	#50
	release TOP.u_encoder_model.encoder_direct_output;
`endif
end

`ifdef TP1_6
reg								break1;
reg								break2;
assign advtmr0_bk1 = break1;
assign advtmr0_bk2 = break2;

initial
begin
	break1 = 1'b1;
	break2 = 1'b0;
	#200000
	break1 = 1'b0;
	#1000
	break1 = 1'b1;
end
`endif

//===============================================
// advtim iut & lt case
//===============================================

initial
begin	
	wait(test_start == 1'b1);

	#50000
	test_end = 1'b1;
end


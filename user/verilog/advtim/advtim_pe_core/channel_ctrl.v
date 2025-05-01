//===============================================
//
//	File: channel_ctrl.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12082024
//	Version: v1.0
//
// 	This is channel control for advance timer.
// 	For pwm generator:
// 	channel 1pn
// 	channel 2pn
// 	channel 3pn
// 	channel 4
// 	channel 5
// 	channel 6
//
// 	For input capture
// 	channel 1pn
//
//===============================================

module channel_ctrl
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,
	input  						pe_cap_clk,  
	input  						pe_cap_rstn,
	input  						pe_enc_clk,  
	input  						pe_enc_rstn,

	// configs
	input						r0_ss1,	 
	input						r0_ss1n, 
	input						r0_moe1, 
	input						r0_moe1n,
	input						r0_dze1,
	input						r0_cc1p,
	input						r0_cc1np,
	input						r0_cc1e,
	input						r0_cc1ne,
	input						r0_ss2,	 
	input						r0_ss2n, 
	input						r0_moe2, 
	input						r0_moe2n,
	input						r0_dze2,
	input						r0_cc2p,
	input						r0_cc2np,
	input						r0_cc2e,
	input						r0_cc2ne,
	input						r0_ss3,	 
	input						r0_ss3n, 
	input						r0_moe3, 
	input						r0_moe3n,
	input						r0_dze3,
	input						r0_cc3p,
	input						r0_cc3np,
	input						r0_cc3e,
	input						r0_cc3ne,
	input						r0_ss4,	 
	input						r0_cc4p,
	input						r0_cc4e,
	input						r0_ss5,	 
	input						r0_cc5p,
	input						r0_cc5e,
	input						r0_ss6,	 
	input						r0_cc6p,
	input						r0_cc6e,
	input 		[ 9:0]			r0_dtg,

	// control
	input						pwm_channel_output_enable,
	input						fault_detected,

	// pwm output
	input						oc1refc,
	input						oc2refc,
	input						oc3refc,
	input						oc4refc,
	input						oc5refc,
	input						oc6refc,
	input	  					oc5c1refc,
	input	  					oc5c2refc,
	input	  					oc5c3refc,

	// gpio output
	input						oc1po,
	input						oc1no,
	input						oc2po,
	input						oc2no,
	input						oc3po,
	input						oc3no,

	// output
	output reg					pwm_channel1p,
	output reg					pwm_channel1n,
	output reg					pwm_channel2p,
	output reg					pwm_channel2n,
	output reg					pwm_channel3p,
	output reg					pwm_channel3n,
	output reg					pwm_channel4,
	output reg					pwm_channel5,
	output reg					pwm_channel6,
	output 						pwm_channel1p_oen,
	output 						pwm_channel1n_oen,
	output 						pwm_channel2p_oen,
	output 						pwm_channel2n_oen,
	output 						pwm_channel3p_oen,
	output 						pwm_channel3n_oen,
	output 						pwm_channel4_oen,
	output 						pwm_channel5_oen,
	output 						pwm_channel6_oen,

	// config
	input		[ 3:0]			r1_bt,
	input						r1_cc1p,
	input						r1_cc1np,
	input						r1_cc1e,
	input						r1_cc1ne,

	// control
	input						cap_channel_input_enable,

	// input capture
	output						ic1prefc,
	output						ic1nrefc,
	output						ic1prefc_d,
	output						ic1nrefc_d,

	// input channel
	output						ic1prefc_first_detected,
	output						ic1prefc_second_detected,
	output						ic1nrefc_first_detected,
	output						ic1nrefc_second_detected,
	output						ic1prefc_first_valid,
	output						ic1prefc_second_valid,
	output						ic1nrefc_first_valid,
	output						ic1nrefc_second_valid,
	output						ic1prefc_first_capturing,
	output						ic1prefc_second_capturing,
	output						ic1nrefc_first_capturing,
	output						ic1nrefc_second_capturing,

	// input
	input						cap_channel1p,
	input						cap_channel1n,
	output 						cap_channel1p_oen,
	output 						cap_channel1n_oen,

	// config
	input		[ 3:0]			r2_bt,
	input						r2_ec1p,
	input						r2_ec1np,
	input						r2_ec1e,
	input						r2_ec1ne,

	// control
	input						enc_channel_input_enable,

	// input capture
	output						ec1prefc,
	output						ec1nrefc,

	// input channel
	output						ec1prefc_first_detected,
	output						ec1prefc_second_detected,
	output						ec1nrefc_first_detected,
	output						ec1nrefc_second_detected,
	output						ec1prefc_first_valid,
	output						ec1prefc_second_valid,
	output						ec1nrefc_first_valid,
	output						ec1nrefc_second_valid,
	output						ec1prefc_first_capturing,
	output						ec1prefc_second_capturing,
	output						ec1nrefc_first_capturing,
	output						ec1nrefc_second_capturing,

	// input
	input						enc_channel1p,
	input						enc_channel1n,
	output 						enc_channel1p_oen,
	output 						enc_channel1n_oen
);

//===============================================
// pwm output section
//===============================================

//===============================================
// pwm output pin direction
//===============================================

assign pwm_channel1p_oen = r0_cc1e ? 1'b0 : 1'b1;
assign pwm_channel1n_oen = r0_cc1ne ? 1'b0 : 1'b1;
assign pwm_channel2p_oen = r0_cc2e ? 1'b0 : 1'b1;
assign pwm_channel2n_oen = r0_cc2ne ? 1'b0 : 1'b1;
assign pwm_channel3p_oen = r0_cc3e ? 1'b0 : 1'b1;
assign pwm_channel3n_oen = r0_cc3ne ? 1'b0 : 1'b1;
assign pwm_channel4_oen = r0_cc4e ? 1'b0 : 1'b1;
assign pwm_channel5_oen = r0_cc5e ? 1'b0 : 1'b1;
assign pwm_channel6_oen = r0_cc6e ? 1'b0 : 1'b1;

//===============================================
// pwm_channel enable control
// need a clock delay for timing reqirement
//===============================================

wire							pwm_channel_output_enable_d;

sync_ff u_enable_delay
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),	

	.A							(pwm_channel_output_enable),
	.Y							(pwm_channel_output_enable_d)
);

//===============================================
// pwm_channel 1pn
//===============================================

wire							pwm_channel1p_deadzone;
wire							pwm_channel1n_deadzone;

deadzone u_pwm_channel1_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r0_dze1 && r0_cc1e && r0_cc1ne),
	.r_ccp						(r0_cc1p),
	.r_ccnp						(r0_cc1np),
	.r_dtg						(r0_dtg),

	.ocrefc						(oc5c1refc),

	.channelp_deadzone			(pwm_channel1p_deadzone),
	.channeln_deadzone			(pwm_channel1n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel1p <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc1e) || fault_detected)
	begin
		pwm_channel1p <= r0_ss1;
	end
	else if(r0_moe1)
	begin
		pwm_channel1p <= oc1po;
	end
	else
	begin
		if(r0_cc1p)
		begin
			pwm_channel1p <= ~oc5c1refc && ~pwm_channel1p_deadzone;
		end
		else
		begin
			pwm_channel1p <= oc5c1refc && ~pwm_channel1p_deadzone;
		end
	end
end


always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel1n <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc1ne) || fault_detected)
	begin
		pwm_channel1n <= r0_ss1n;
	end
	else if(r0_moe1n)
	begin
		pwm_channel1n <= oc1no;
	end
	else
	begin
		if(r0_cc1np)
		begin
			pwm_channel1n <= oc5c1refc && ~pwm_channel1n_deadzone;
		end
		else
		begin
			pwm_channel1n <= ~oc5c1refc && ~pwm_channel1n_deadzone;
		end
	end
end

//===============================================
// pwm_channel 2pn
//===============================================

wire							pwm_channel2p_deadzone;
wire							pwm_channel2n_deadzone;

deadzone u_pwm_channel2_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r0_dze2 && r0_cc2e && r0_cc2ne),
	.r_ccp						(r0_cc2p),
	.r_ccnp						(r0_cc2np),
	.r_dtg						(r0_dtg),

	.ocrefc						(oc5c2refc),

	.channelp_deadzone			(pwm_channel2p_deadzone),
	.channeln_deadzone			(pwm_channel2n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel2p <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc2e) || fault_detected)
	begin
		pwm_channel2p <= r0_ss2;
	end
	else if(r0_moe2)
	begin
		pwm_channel2p <= oc2po;
	end
	else
	begin
		if(r0_cc2p)
		begin
			pwm_channel2p <= ~oc5c2refc && ~pwm_channel2p_deadzone;
		end
		else
		begin
			pwm_channel2p <= oc5c2refc && ~pwm_channel2p_deadzone;
		end
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel2n <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc2ne) || fault_detected)
	begin
		pwm_channel2n <= r0_ss2n;
	end
	else if(r0_moe2n)
	begin
		pwm_channel2n <= oc2no;
	end
	else
	begin
		if(r0_cc2np)
		begin
			pwm_channel2n <= oc5c2refc && ~pwm_channel2n_deadzone;
		end
		else
		begin
			pwm_channel2n <= ~oc5c2refc && ~pwm_channel2n_deadzone;
		end
	end
end

//===============================================
// pwm_channel 3pn
//===============================================

wire							pwm_channel3p_deadzone;
wire							pwm_channel3n_deadzone;

deadzone u_pwm_channel3_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r0_dze3 && r0_cc3e && r0_cc3ne),
	.r_ccp						(r0_cc3p),
	.r_ccnp						(r0_cc3np),
	.r_dtg						(r0_dtg),

	.ocrefc						(oc5c3refc),

	.channelp_deadzone			(pwm_channel3p_deadzone),
	.channeln_deadzone			(pwm_channel3n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel3p <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc3e) || fault_detected)
	begin
		pwm_channel3p <= r0_ss3;
	end
	else if(r0_moe3)
	begin
		pwm_channel3p <= oc3po;
	end
	else
	begin
		if(r0_cc3p)
		begin
			pwm_channel3p <= ~oc5c3refc && ~pwm_channel3p_deadzone;
		end
		else
		begin
			pwm_channel3p <= oc5c3refc && ~pwm_channel3p_deadzone;
		end
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel3n <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc3ne) || fault_detected)
	begin
		pwm_channel3n <= r0_ss3n;
	end
	else if(r0_moe3n)
	begin
		pwm_channel3n <= oc3no;
	end
	else
	begin
		if(r0_cc3np)
		begin
			pwm_channel3n <= oc5c3refc && ~pwm_channel3n_deadzone;
		end
		else
		begin
			pwm_channel3n <= ~oc5c3refc && ~pwm_channel3n_deadzone;
		end
	end
end

//===============================================
// pwm_channel 4
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel4 <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc4e) || fault_detected)
	begin
		pwm_channel4 <= r0_ss4;
	end
	else
	begin
		if(r0_cc4p)
		begin
			pwm_channel4 <= ~oc4refc;
		end
		else
		begin
			pwm_channel4 <= oc4refc;
		end
	end
end

//===============================================
// pwm_channel 5
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel5 <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc5e) || fault_detected)
	begin
		pwm_channel5 <= r0_ss5;
	end
	else
	begin
		if(r0_cc5p)
		begin
			pwm_channel5 <= ~oc5refc;
		end
		else
		begin
			pwm_channel5 <= oc5refc;
		end
	end
end

//===============================================
// pwm_channel 6
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		pwm_channel6 <= 1'b0;
	end
	else if(~(pwm_channel_output_enable_d && r0_cc6e) || fault_detected)
	begin
		pwm_channel6 <= r0_ss6;
	end
	else
	begin
		if(r0_cc6p)
		begin
			pwm_channel6 <= ~oc6refc;
		end
		else
		begin
			pwm_channel6 <= oc6refc;
		end
	end
end

//===============================================
// input capture section
//===============================================

//===============================================
// input capture pin direction
//===============================================

assign cap_channel1p_oen = r1_cc1e ? 1'b1 : 1'b0;
assign cap_channel1n_oen = r1_cc1ne ? 1'b1 : 1'b0;

//===============================================
// input sync
// Using this delay to drive main capture cnt working
// properly.
// In fact, this input need not sync for edge detect.
//===============================================

//wire							ic1prefc_d;
//wire							ic1nrefc_d;
assign ic1prefc = cap_channel1p;
assign ic1nrefc = cap_channel1n;

sync_ff u_input_capture_channel1p_d
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1prefc),// enable ???
	.Y							(ic1prefc_d)
);

sync_ff u_input_capture_channel1n_d
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1nrefc),
	.Y							(ic1nrefc_d)
);

//===============================================
// input edge detect
//===============================================

wire							ic1prefc_r;
wire							ic1prefc_f;
wire							ic1nrefc_r;
wire							ic1nrefc_f;

posedge_detect u_input_capture_channel1p_posedge_detect 
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1prefc && r1_cc1e),// enable ???
	.Y							(ic1prefc_r)
);

negedge_detect u_input_capture_channel1p_negedge_detect 
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1prefc || ~r1_cc1e),
	.Y							(ic1prefc_f)
);

posedge_detect u_input_capture_channel1n_posedge_detect 
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1nrefc && r1_cc1ne),
	.Y							(ic1nrefc_r)
);

negedge_detect u_input_capture_channel1n_negedge_detect 
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(ic1nrefc || ~r1_cc1ne),
	.Y							(ic1nrefc_f)
);

edge_delay_hold_detect u_input_capture_channel1p_first_detect
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),

	.enable						(cap_channel_input_enable),
	.delay_value				(r1_bt),
	.input_value				(ic1prefc),
	.expected_value				(r1_cc1p),
	.input_valid				(ic1prefc_first_valid),
	.input_detected				(ic1prefc_first_detected)
);

edge_delay_hold_detect u_input_capture_channel1p_second_detect
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),

	.enable						(cap_channel_input_enable),
	.delay_value				(r1_bt),
	.input_value				(ic1prefc),
	.expected_value				(~r1_cc1p),
	.input_valid				(ic1prefc_second_valid),
	.input_detected				(ic1prefc_second_detected)
);

edge_delay_hold_detect u_input_capture_channel1n_first_detect
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),

	.enable						(cap_channel_input_enable),
	.delay_value				(r1_bt),
	.input_value				(ic1prefc),
	.expected_value				(r1_cc1np),
	.input_valid				(ic1nrefc_first_valid),
	.input_detected				(ic1nrefc_first_detected)
);

edge_delay_hold_detect u_input_capture_channel1n_second_detect
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),

	.enable						(cap_channel_input_enable),
	.delay_value				(r1_bt),
	.input_value				(ic1nrefc),
	.expected_value				(~r1_cc1np),
	.input_valid				(ic1nrefc_second_valid),
	.input_detected				(ic1nrefc_second_detected)
);

reg								ic1prefc_first_valid_temp;
reg								ic1nrefc_first_valid_temp;
reg								ic1prefc_second_valid_temp;
reg								ic1nrefc_second_valid_temp;
assign ic1prefc_first_capturing = ic1prefc_first_valid_temp && ic1prefc_first_valid;
assign ic1prefc_second_capturing = ic1prefc_second_valid_temp && ic1prefc_second_valid;
assign ic1nrefc_first_capturing = ic1nrefc_first_valid_temp && ic1nrefc_first_valid;
assign ic1nrefc_second_capturing = ic1nrefc_second_valid_temp && ic1nrefc_second_valid;

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		ic1prefc_first_valid_temp <= 1'b0;
	end
	else if(~r1_cc1e || ~cap_channel_input_enable)
	begin
		ic1prefc_first_valid_temp <= 1'b0;
	end
	else if((ic1prefc_r && r1_cc1p) || (ic1prefc_f && ~r1_cc1p))
	begin
		ic1prefc_first_valid_temp <= 1'b1;
	end
	else
	begin
		ic1prefc_first_valid_temp <= ic1prefc_first_valid_temp;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		ic1prefc_second_valid_temp <= 1'b0;
	end
	else if(~r1_cc1e || ~cap_channel_input_enable)
	begin
		ic1prefc_second_valid_temp <= 1'b0;
	end
	else if((ic1prefc_r && ~r1_cc1p) || (ic1prefc_f && r1_cc1p))
	begin
		ic1prefc_second_valid_temp <= 1'b1;
	end
	else
	begin
		ic1prefc_second_valid_temp <= ic1prefc_second_valid_temp;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		ic1nrefc_first_valid_temp <= 1'b0;
	end
	else if(~r1_cc1ne || ~cap_channel_input_enable)
	begin
		ic1nrefc_first_valid_temp <= 1'b0;
	end
	else if((ic1nrefc_r && r1_cc1np) || (ic1nrefc_f && ~r1_cc1np))
	begin
		ic1nrefc_first_valid_temp <= 1'b1;
	end
	else
	begin
		ic1nrefc_first_valid_temp <= ic1nrefc_first_valid_temp;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		ic1nrefc_second_valid_temp <= 1'b0;
	end
	else if(~r1_cc1ne || ~cap_channel_input_enable)
	begin
		ic1nrefc_second_valid_temp <= 1'b0;
	end
	else if((ic1nrefc_r && ~r1_cc1np) || (ic1nrefc_f && r1_cc1np))
	begin
		ic1nrefc_second_valid_temp <= 1'b1;
	end
	else
	begin
		ic1nrefc_second_valid_temp <= ic1nrefc_second_valid_temp;
	end
end
//===============================================
// encoder input pin direction
//===============================================

assign enc_channel1p_oen = r2_ec1e ? 1'b1 : 1'b0;
assign enc_channel1n_oen = r2_ec1ne ? 1'b1 : 1'b0;

//===============================================
// encoder input edge detect
//===============================================

assign ec1prefc = enc_channel1p;
assign ec1nrefc = enc_channel1n;

wire							ec1prefc_r;
wire							ec1prefc_f;
wire							ec1nrefc_r;
wire							ec1nrefc_f;

posedge_detect u_encoder_input_channel1p_posedge_detect 
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),
	.A							(ec1prefc && r2_ec1e),// enable ???
	.Y							(ec1prefc_r)
);

negedge_detect u_encoder_input_channel1p_negedge_detect 
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),
	.A							(ec1prefc || ~r2_ec1e),
	.Y							(ec1prefc_f)
);

posedge_detect u_encoder_input_channel1n_posedge_detect 
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),
	.A							(ec1nrefc && r2_ec1ne),
	.Y							(ec1nrefc_r)
);

negedge_detect u_encoder_input_channel1n_negedge_detect 
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),
	.A							(ec1nrefc || ~r2_ec1ne),
	.Y							(ec1nrefc_f)
);

edge_delay_hold_detect u_encoder_input_channel1p_first_detect
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),

	.enable						(enc_channel_input_enable && r2_ec1e),
	.delay_value				(r2_bt),
	.input_value				(ec1prefc),
	.expected_value				(r2_ec1p),
	.input_valid				(ec1prefc_first_valid),
	.input_detected				(ec1prefc_first_detected)
);

edge_delay_hold_detect u_encoder_input_channel1p_second_detect
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),

	.enable						(enc_channel_input_enable && r2_ec1e),
	.delay_value				(r2_bt),
	.input_value				(ec1prefc),
	.expected_value				(~r2_ec1p),
	.input_valid				(ec1prefc_second_valid),
	.input_detected				(ec1prefc_second_detected)
);

edge_delay_hold_detect u_encoder_input_channel1n_first_detect
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),

	.enable						(enc_channel_input_enable && r2_ec1ne),
	.delay_value				(r2_bt),
	.input_value				(ec1nrefc),
	.expected_value				(r2_ec1np),
	.input_valid				(ec1nrefc_first_valid),
	.input_detected				(ec1nrefc_first_detected)
);

edge_delay_hold_detect u_encoder_input_channel1n_second_detect
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),

	.enable						(enc_channel_input_enable && r2_ec1ne),
	.delay_value				(r2_bt),
	.input_value				(ec1nrefc),
	.expected_value				(~r2_ec1np),
	.input_valid				(ec1nrefc_second_valid),
	.input_detected				(ec1nrefc_second_detected)
);

reg								ec1prefc_first_valid_temp;
reg								ec1nrefc_first_valid_temp;
reg								ec1prefc_second_valid_temp;
reg								ec1nrefc_second_valid_temp;
assign ec1prefc_first_capturing = ec1prefc_first_valid_temp && ec1prefc_first_valid;
assign ec1prefc_second_capturing = ec1prefc_second_valid_temp && ec1prefc_second_valid;
assign ec1nrefc_first_capturing = ec1nrefc_first_valid_temp && ec1nrefc_first_valid;
assign ec1nrefc_second_capturing = ec1nrefc_second_valid_temp && ec1nrefc_second_valid;

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		ec1prefc_first_valid_temp <= 1'b0;
	end
	else if(~r2_ec1e || ~enc_channel_input_enable)
	begin
		ec1prefc_first_valid_temp <= 1'b0;
	end
	else if((ec1prefc_r && r2_ec1p) || (ec1prefc_f && ~r2_ec1p))
	begin
		ec1prefc_first_valid_temp <= 1'b1;
	end
	else
	begin
		ec1prefc_first_valid_temp <= ec1prefc_first_valid_temp;
	end
end

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		ec1prefc_second_valid_temp <= 1'b0;
	end
	else if(~r2_ec1e || ~enc_channel_input_enable)
	begin
		ec1prefc_second_valid_temp <= 1'b0;
	end
	else if((ec1prefc_r && ~r2_ec1p) || (ec1prefc_f && r2_ec1p))
	begin
		ec1prefc_second_valid_temp <= 1'b1;
	end
	else
	begin
		ec1prefc_second_valid_temp <= ec1prefc_second_valid_temp;
	end
end

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		ec1nrefc_first_valid_temp <= 1'b0;
	end
	else if(~r2_ec1ne || ~enc_channel_input_enable)
	begin
		ec1nrefc_first_valid_temp <= 1'b0;
	end
	else if((ec1nrefc_r && r2_ec1np) || (ec1nrefc_f && ~r2_ec1np))
	begin
		ec1nrefc_first_valid_temp <= 1'b1;
	end
	else
	begin
		ec1nrefc_first_valid_temp <= ec1nrefc_first_valid_temp;
	end
end

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		ec1nrefc_second_valid_temp <= 1'b0;
	end
	else if(~r2_ec1ne || ~enc_channel_input_enable)
	begin
		ec1nrefc_second_valid_temp <= 1'b0;
	end
	else if((ec1nrefc_r && ~r2_ec1np) || (ec1nrefc_f && r2_ec1np))
	begin
		ec1nrefc_second_valid_temp <= 1'b1;
	end
	else
	begin
		ec1nrefc_second_valid_temp <= ec1nrefc_second_valid_temp;
	end
end




endmodule


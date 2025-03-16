//===============================================
//
//	File: channel_ctrl.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12082024
//	Version: v1.0
//
// 	This is channel control for advance timer.
// 	channel 1pn
// 	channel 2pn
// 	channel 3pn
// 	channel 4
// 	channel 5
// 	channel 6
//
//===============================================

module channel_ctrl
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,

	// configs
	input						r_ss1,	 
	input						r_ss1n, 
	input						r_moe1, 
	input						r_moe1n,
	input						r_dze1,
	input						r_cc1p,
	input						r_cc1np,
	input						r_cc1e,
	input						r_cc1ne,
	input						r_ss2,	 
	input						r_ss2n, 
	input						r_moe2, 
	input						r_moe2n,
	input						r_dze2,
	input						r_cc2p,
	input						r_cc2np,
	input						r_cc2e,
	input						r_cc2ne,
	input						r_ss3,	 
	input						r_ss3n, 
	input						r_moe3, 
	input						r_moe3n,
	input						r_dze3,
	input						r_cc3p,
	input						r_cc3np,
	input						r_cc3e,
	input						r_cc3ne,
	input						r_ss4,	 
	input						r_cc4p,
	input						r_cc4e,
	input						r_ss5,	 
	input						r_cc5p,
	input						r_cc5e,
	input						r_ss6,	 
	input						r_cc6p,
	input						r_cc6e,
	input 		[ 9:0]			r_dtg,

	// control
	input						channel_output_enable,

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
	output reg					channel1p,
	output reg					channel1n,
	output reg					channel2p,
	output reg					channel2n,
	output reg					channel3p,
	output reg					channel3n,
	output reg					channel4,
	output reg					channel5,
	output reg					channel6,
	output 						channel1p_oen,
	output 						channel1n_oen,
	output 						channel2p_oen,
	output 						channel2n_oen,
	output 						channel3p_oen,
	output 						channel3n_oen,
	output 						channel4_oen,
	output 						channel5_oen,
	output 						channel6_oen
);

assign channel1p_oen = 1'b0;
assign channel1n_oen = 1'b0;
assign channel2p_oen = 1'b0;
assign channel2n_oen = 1'b0;
assign channel3p_oen = 1'b0;
assign channel3n_oen = 1'b0;
assign channel4_oen = 1'b0;
assign channel5_oen = 1'b0;
assign channel6_oen = 1'b0;

//===============================================
// channel enable control
// need a clock delay for timing reqirement
//===============================================

wire							channel_output_enable_d;

sync_ff u_enable_delay
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),	

	.A							(channel_output_enable),
	.Y							(channel_output_enable_d)
);

//===============================================
// channel 1pn
//===============================================

wire							channel1p_deadzone;
wire							channel1n_deadzone;

deadzone u_channel1_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r_dze1 && r_cc1e && r_cc1ne),
	.r_ccp						(r_cc1p),
	.r_ccnp						(r_cc1np),
	.r_dtg						(r_dtg),

	.ocrefc						(oc5c1refc),

	.channelp_deadzone			(channel1p_deadzone),
	.channeln_deadzone			(channel1n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel1p <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc1e))
	begin
		channel1p <= r_ss1;
	end
	else if(r_moe1)
	begin
		channel1p <= oc1po;
	end
	else
	begin
		if(r_cc1p)
		begin
			channel1p <= ~oc5c1refc && ~channel1p_deadzone;
		end
		else
		begin
			channel1p <= oc5c1refc && ~channel1p_deadzone;
		end
	//	else if(~r_cc1p)
	//	begin
	//		channel1p <= oc5c1refc && ~channel1p_deadzone;
	//	end
	//	else
	//	begin
	//		channel1p <= 1'b0;
	//	end
	end
end

//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		channel1p_oen <= 1'b0;
//	end
//	else if(~(channel_output_enable_d && r_cc1e))
//	begin
//		channel1p_oen  <= 1'b0;
//	end
//	else
//	begin
//		channel1p_oen  <= 1'b1;
//	end
//end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel1n <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc1ne))
	begin
		channel1n <= r_ss1n;
	end
	else if(r_moe1n)
	begin
		channel1n <= oc1no;
	end
	else
	begin
		if(r_cc1np)
		begin
			channel1n <= oc5c1refc && ~channel1n_deadzone;
		end
		else
		begin
			channel1n <= ~oc5c1refc && ~channel1n_deadzone;
		end
//		else if(~r_cc1np)
//		begin
//			channel1n <= ~oc5c1refc && ~channel1n_deadzone;
//		end
//		else
//		begin
//			channel1n <= 1'b0;
//		end
	end
end

//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		channel1n_oen <= 1'b0;
//	end
//	else if(~(channel_output_enable_d && r_cc1ne))
//	begin
//		channel1n_oen  <= 1'b0;
//	end
//	else
//	begin
//		channel1n_oen  <= 1'b1;
//	end
//end

//===============================================
// channel 2pn
//===============================================

wire							channel2p_deadzone;
wire							channel2n_deadzone;

deadzone u_channel2_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r_dze2 && r_cc2e && r_cc2ne),
	.r_ccp						(r_cc2p),
	.r_ccnp						(r_cc2np),
	.r_dtg						(r_dtg),

	.ocrefc						(oc5c2refc),

	.channelp_deadzone			(channel2p_deadzone),
	.channeln_deadzone			(channel2n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel2p <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc2e))
	begin
		channel2p <= r_ss2;
	end
	else if(r_moe2)
	begin
		channel2p <= oc2po;
	end
	else
	begin
		if(r_cc2p)
		begin
			channel2p <= ~oc5c2refc && ~channel2p_deadzone;
		end
		else
		begin
			channel2p <= oc5c2refc && ~channel2p_deadzone;
		end
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel2n <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc2ne))
	begin
		channel2n <= r_ss2n;
	end
	else if(r_moe2n)
	begin
		channel2n <= oc2no;
	end
	else
	begin
		if(r_cc2np)
		begin
			channel2n <= oc5c2refc && ~channel2n_deadzone;
		end
		else
		begin
			channel2n <= ~oc5c2refc && ~channel2n_deadzone;
		end
	end
end

//===============================================
// channel 3pn
//===============================================

wire							channel3p_deadzone;
wire							channel3n_deadzone;

deadzone u_channel3_deadzone 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_dze						(r_dze3 && r_cc3e && r_cc3ne),
	.r_ccp						(r_cc3p),
	.r_ccnp						(r_cc3np),
	.r_dtg						(r_dtg),

	.ocrefc						(oc5c3refc),

	.channelp_deadzone			(channel3p_deadzone),
	.channeln_deadzone			(channel3n_deadzone)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel3p <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc3e))
	begin
		channel3p <= r_ss3;
	end
	else if(r_moe3)
	begin
		channel3p <= oc3po;
	end
	else
	begin
		if(r_cc3p)
		begin
			channel3p <= ~oc5c3refc && ~channel3p_deadzone;
		end
		else
		begin
			channel3p <= oc5c3refc && ~channel3p_deadzone;
		end
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel3n <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc3ne))
	begin
		channel3n <= r_ss3n;
	end
	else if(r_moe3n)
	begin
		channel3n <= oc3no;
	end
	else
	begin
		if(r_cc3np)
		begin
			channel3n <= oc5c3refc && ~channel3n_deadzone;
		end
		else
		begin
			channel3n <= ~oc5c3refc && ~channel3n_deadzone;
		end
	end
end

//===============================================
// channel 4
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel4 <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc4e))
	begin
		channel4 <= r_ss4;
	end
	else
	begin
		if(r_cc4p)
		begin
			channel4 <= ~oc4refc;
		end
		else
		begin
			channel4 <= oc4refc;
		end
	end
end

//===============================================
// channel 5
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel5 <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc5e))
	begin
		channel5 <= r_ss5;
	end
	else
	begin
		if(r_cc5p)
		begin
			channel5 <= ~oc5refc;
		end
		else
		begin
			channel5 <= oc5refc;
		end
	end
end

//===============================================
// channel 6
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		channel6 <= 1'b0;
	end
	else if(~(channel_output_enable_d && r_cc6e))
	begin
		channel6 <= r_ss6;
	end
	else
	begin
		if(r_cc6p)
		begin
			channel6 <= ~oc6refc;
		end
		else
		begin
			channel6 <= oc6refc;
		end
	end
end








//wire							oc5c1refc_r;
//wire							oc5c1refc_f;
//reg 			[ 9:0]			dtg1_cnt;
//reg 							dtg1_cnt_valid_for_posedge;
//reg 							dtg1_cnt_valid_for_negedge;
//
//wire							channel1p_deadzone;
//wire							channel1n_deadzone;
//
//assign channel1n_deadzone = r_dze1 && (r_cc1np ? (oc5c1refc_f || (dtg1_cnt_valid_for_negedge && |dtg1_cnt)) : (oc5c1refc_r || (dtg1_cnt_valid_for_posedge && |dtg1_cnt)));
//assign channel1p_deadzone = r_dze1 && (r_cc1p ? (oc5c1refc_r || (dtg1_cnt_valid_for_posedge && |dtg1_cnt)) : (oc5c1refc_f || (dtg1_cnt_valid_for_negedge && |dtg1_cnt)));
//
//posedge_detect u_channel1_posedge_detect 
//(
//	.clk						(pe_gen_clk),
//	.rstn						(pe_gen_rstn),
//	.A							(oc5c1refc),
//	.Y							(oc5c1refc_r)
//);
//
//negedge_detect u_channel1_negedge_detect 
//(
//	.clk						(pe_gen_clk),
//	.rstn						(pe_gen_rstn),
//	.A							(oc5c1refc),
//	.Y							(oc5c1refc_f)
//);
//
//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		dtg1_cnt_valid_for_posedge <= 1'b0;
//	end
//	else if(oc5c1refc_r || ~r_dze1)
//	begin
//		dtg1_cnt_valid_for_posedge <= 1'b1;
//	end
////	else if(~(|dtg1_cnt))
//	else if(oc5c1refc_f)
//	begin
//		dtg1_cnt_valid_for_posedge <= 1'b0;
//	end
//	else
//	begin
//		dtg1_cnt_valid_for_posedge <= dtg1_cnt_valid_for_posedge;
//	end
//end
//
//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		dtg1_cnt_valid_for_negedge <= 1'b0;
//	end
//	else if(oc5c1refc_f || ~r_dze1)
//	begin
//		dtg1_cnt_valid_for_negedge <= 1'b1;
//	end
////	else if(~(|dtg1_cnt))
//	else if(oc5c1refc_r)
//	begin
//		dtg1_cnt_valid_for_negedge <= 1'b0;
//	end
//	else
//	begin
//		dtg1_cnt_valid_for_negedge <= dtg1_cnt_valid_for_negedge;
//	end
//end
//
//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		dtg1_cnt <= r_dtg;
//	end
//	else if(oc5c1refc_f || oc5c1refc_r)
//	begin
//		dtg1_cnt <= r_dtg;
//	end
//	else if(~(|dtg1_cnt))
//	begin
//		dtg1_cnt <= dtg1_cnt;
//	end
//	else if(dtg1_cnt_valid_for_posedge || dtg1_cnt_valid_for_negedge)
//	begin
//		dtg1_cnt <= dtg1_cnt - 1'b1;
//	end
//	else
//	begin
//		dtg1_cnt <= r_dtg;
//	end
//end
//
//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		channel1p <= 1'b0;
//	end
//	else if(~(channel_output_enable_d && r_cc1e) || (|dtg1_cnt && r_dze1))
//	begin
//		channel1p <= 1'b0;
//	end
////	else if(r_cc1e && ~(|dtg1_cnt) && (dtg1_cnt_valid_for_posedge || dtg1_cnt_valid_for_negedge))
////	else if(~(|dtg1_cnt) || ~r_dze1)
//	else
//	begin
//		if(r_cc1p && dtg1_cnt_valid_for_negedge)
//		begin
//			channel1p <= ~oc5c1refc;
//		end
//		else if(~r_cc1p && dtg1_cnt_valid_for_posedge)
//		begin
//			channel1p <= oc5c1refc;
//		end
//		else
//		begin
//			channel1p <= 1'b0;
//		end
//	end
////	else
////	begin
////		channel1p <= 1'b0;
////	end
//end
//
//always @(posedge pe_gen_clk or negedge pe_gen_rstn)
//begin
//	if(!pe_gen_rstn)
//	begin
//		channel1n <= 1'b0;
//	end
////	else if(~(channel_output_enable_d && r_cc1ne))
//	else if(~(channel_output_enable_d && r_cc1ne) || (|dtg1_cnt && r_dze1))
//	begin
//		channel1n <= 1'b0;
//	end
//	else
////	else if(~(|dtg1_cnt))
////	else if(r_cc1ne && ~(|dtg1_cnt) && (dtg1_cnt_valid_for_posedge || dtg1_cnt_valid_for_negedge))
//	begin
//		if(r_cc1np && dtg1_cnt_valid_for_posedge)
//		begin
//			channel1n <= oc5c1refc;
//		end
//		else if(~r_cc1np && dtg1_cnt_valid_for_negedge)
//		begin
//			channel1n <= ~oc5c1refc;
//		end
//		else
//		begin
//			channel1n <= 1'b0;
//		end
//	end
////	else
////	begin
////		channel1n <= 1'b0;
////	end
//end






endmodule


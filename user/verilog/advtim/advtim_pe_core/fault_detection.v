//===============================================
//
//	File: fault_detection.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02172025
//	Version: v1.0
//
// 	This is fault detection module.
// 	Failure scenarios are including:
// 	1. External fault events from break channel.
// 	2. Internal system failure.
//
// 	When any fault detected, output pwm channels
// 	will be shut down soon and this advance timer
// 	will also be disabled soon.
//
//===============================================

module fault_detection
(
	input  						pe_fault_clk,  
	input  						pe_fault_rstn,

	// configs
	input						r_bk2p,
	input						r_bk2e,
	input						r_bk1p,
	input 						r_bk1e,

	// pin
	input						advtmr_bk2,
	input						advtmr_bk1,
	input						system_failure,

	output						fault_detected
);








wire							ocrefc_r;
wire							ocrefc_f;
reg 			[ 9:0]			dtg_cnt;
reg 							dtg_cnt_valid_for_posedge;
reg 							dtg_cnt_valid_for_negedge;

assign channelp_deadzone = r_dze && (r_ccp ? (ocrefc_f || (dtg_cnt_valid_for_negedge && |dtg_cnt)) : (ocrefc_r || (dtg_cnt_valid_for_posedge && |dtg_cnt)));
assign channeln_deadzone = r_dze && (r_ccnp ? (ocrefc_r || (dtg_cnt_valid_for_posedge && |dtg_cnt)) : (ocrefc_f || (dtg_cnt_valid_for_negedge && |dtg_cnt)));

posedge_detect u_channelref_posedge_detect 
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),
	.A							(ocrefc),
	.Y							(ocrefc_r)
);

negedge_detect u_channelref_negedge_detect 
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),
	.A							(ocrefc),
	.Y							(ocrefc_f)
);

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		dtg_cnt_valid_for_posedge <= 1'b0;
	end
	else if(ocrefc_r || ~r_dze)
	begin
		dtg_cnt_valid_for_posedge <= 1'b1;
	end
	else if(ocrefc_f)
	begin
		dtg_cnt_valid_for_posedge <= 1'b0;
	end
	else
	begin
		dtg_cnt_valid_for_posedge <= dtg_cnt_valid_for_posedge;
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		dtg_cnt_valid_for_negedge <= 1'b0;
	end
	else if(ocrefc_f || ~r_dze)
	begin
		dtg_cnt_valid_for_negedge <= 1'b1;
	end
	else if(ocrefc_r)
	begin
		dtg_cnt_valid_for_negedge <= 1'b0;
	end
	else
	begin
		dtg_cnt_valid_for_negedge <= dtg_cnt_valid_for_negedge;
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		dtg_cnt <= r_dtg;
	end
	else if(ocrefc_f || ocrefc_r)
	begin
		dtg_cnt <= r_dtg;
	end
	else if(~(|dtg_cnt))
	begin
		dtg_cnt <= dtg_cnt;
	end
	else if(dtg_cnt_valid_for_posedge || dtg_cnt_valid_for_negedge)
	begin
		dtg_cnt <= dtg_cnt - 1'b1;
	end
	else
	begin
		dtg_cnt <= r_dtg;
	end
end

endmodule


//===============================================
//
//	File: deadzone.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12092024
//	Version: v1.0
//
// 	This is channel deadzone control.
//
//===============================================

module deadzone
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,

	// configs
	input						r_dze,
	input						r_ccp,
	input						r_ccnp,
	input 		[ 9:0]			r_dtg,

	input						ocrefc,

	output						channelp_deadzone,
	output						channeln_deadzone
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


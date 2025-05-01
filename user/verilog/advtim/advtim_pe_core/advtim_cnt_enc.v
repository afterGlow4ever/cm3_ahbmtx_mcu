//===============================================
//
//	File: advtim_cnt_enc.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04102025
//	Version: v1.0
//
// 	This is encoder input for advance timer.
//
//===============================================

module advtim_cnt_enc
(
	input  						pe_enc_clk,  
	input  						pe_enc_rstn,

	// input capture
	input						ec1prefc,
	input						ec1nrefc,

	// control
	input						pe_enc_tim_enable,
	input						pe_enc_logic_clr,
	output						pe_enc_hw_update,

	// configs
	input 		[23:0]			r_arr,
	input 						r_ec1m,
	input						r_ec1p,
	input						r_ec1np,
	input						r_ec1e,
	input						r_ec1ne,

	// input
	input						ec1prefc_first_detected,
	input						ec1prefc_second_detected,
	input						ec1nrefc_first_detected,
	input						ec1nrefc_second_detected,
	input						ec1prefc_first_valid,
	input						ec1prefc_second_valid,
	input						ec1nrefc_first_valid,
	input						ec1nrefc_second_valid,
	input						ec1prefc_first_capturing,
	input						ec1prefc_second_capturing,
	input						ec1nrefc_first_capturing,
	input						ec1nrefc_second_capturing,

	// output regs
	output 		[15:0]			r_ec,
	output 						r_ed,
	
	// interactive
	output						enc_cnt_pre_end,
	output						enc_cnt_enable,

	// interrupt status
	output						int_status_enc_detected,
	output						int_status_enc_reloaded
);

//===============================================
//
//===============================================

wire							cnt_start;// indicate a data bit start when the first psc unit is meeting first arr unit
										// only sustaining 1 clk
wire							cnt_end;// indicate a data bit end when the last psc unit is meeting last arr unit
wire							cnt_pre_end;// indicate a data bit pre end when the last psc unit is meeting last arr unit
										// only sustaining 1 clk
wire							encoder_detected;

//===============================================
// shadow config
//===============================================

reg	 			[23:0]			r_arr_last;

//===============================================
// enable control
//===============================================

wire							pe_enc_tim_enable_r;

posedge_detect u_posedge_detect 
(
	.clk						(pe_enc_clk),
	.rstn						(pe_enc_rstn),
	.A							(pe_enc_tim_enable),
	.Y							(pe_enc_tim_enable_r)
);

//===============================================
// counter control
// timing_base_enable should dessert before counter
// disable a clk earlier in order to avoiding 
// counter disabled late.
// Using timing_base_enable to implement.
//===============================================

reg								timing_base_enable;
assign enc_cnt_enable = timing_base_enable;

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		timing_base_enable <= 1'b0;
	end
	else if(pe_enc_logic_clr)
	begin
		timing_base_enable <= 1'b0;
	end
	else
	begin
		timing_base_enable <= pe_enc_tim_enable;
	end
end

//===============================================
// advance timer counter base
// counter for encoder input period
// This counter can be used for feedback loop timer.
// Operating only when channel enable. 
//
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 oversampling flag 
// 1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 arr start
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 arr end
// 1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 cnt start
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0 cnt pre end
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 cnt end
//===============================================

// The comment section for arr is a counter
// which from N to 1.
// The other one is from N-1 to 0.
reg				[23:0]			arr_cnt;// this unit is composed of psc_cnt
wire							arr_flag_start;
wire							arr_flag_pre_end;
wire							arr_flag_end;
assign arr_flag_start = (arr_cnt == 1'b0) ? 1'b1 : 1'b0;
assign arr_flag_end = ((arr_cnt == (r_arr_last - 1'b1)) ? 1'b1 : 1'b0);
assign arr_flag_pre_end = ((arr_cnt == (r_arr_last - 2'h2)) ? 1'b1 : 1'b0);

// channel cnt for input capture
always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		arr_cnt <= 24'h0;
	end
	else if(timing_base_enable)
	begin
		if(arr_flag_end == 1'b1)
		begin
			arr_cnt <= 24'h0;
		end
		else
		begin
			arr_cnt <= arr_cnt + 1'b1;
		end
	end
	else
	begin
		arr_cnt <= 24'h0;
	end
end

assign cnt_end = arr_flag_end && timing_base_enable; // only sustaining 1 clock
assign cnt_pre_end = arr_flag_pre_end && timing_base_enable; // only sustaining 1 clock
assign pe_enc_hw_update = cnt_pre_end;//???? 
assign enc_cnt_pre_end = cnt_pre_end;

//===============================================
// update
//===============================================

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		r_arr_last <= 24'h8000;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(arr_flag_end == 1'b1)
		begin
			r_arr_last <= r_arr;
		end
		else
		begin
			r_arr_last <= r_arr_last;
		end
	end
	else
	begin
		r_arr_last <= r_arr;
	end
end

//===============================================
// encoder input
//===============================================

channel_encoder_input u_channel_encoder_input 
(
	.pe_enc_clk					(pe_enc_clk),  
	.pe_enc_rstn				(pe_enc_rstn),

	.pe_enc_logic_clr			(pe_enc_logic_clr),

	.r_ec1m						(r_ec1m),
	.r_ec1p						(r_ec1p),
	.r_ec1np					(r_ec1np),
	.r_ec1e						(r_ec1e),
	.r_ec1ne					(r_ec1ne),

	.r_ec						(r_ec),
	.r_ed						(r_ed),

	.arr_cnt					(arr_cnt),
	.timing_enable				(timing_base_enable),
	.arr_cnt_end				(arr_flag_end),
	.encoder_detected			(encoder_detected),

	.ec1prefc					(ec1prefc),
	.ec1nrefc					(ec1nrefc),

	.ec1prefc_first_detected	(ec1prefc_first_detected),
	.ec1prefc_second_detected	(ec1prefc_second_detected),
	.ec1nrefc_first_detected	(ec1nrefc_first_detected),
	.ec1nrefc_second_detected	(ec1nrefc_second_detected),
	.ec1prefc_first_valid		(ec1prefc_first_valid),
	.ec1prefc_second_valid		(ec1prefc_second_valid),
	.ec1nrefc_first_valid		(ec1nrefc_first_valid),
	.ec1nrefc_second_valid		(ec1nrefc_second_valid)
);

//===============================================
// interrupt status detect
//===============================================

assign int_status_enc_detected = encoder_detected; 
assign int_status_enc_reloaded = cnt_end;

endmodule


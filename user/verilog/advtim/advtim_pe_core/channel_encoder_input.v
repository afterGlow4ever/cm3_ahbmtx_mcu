//===============================================
//
//	File: channel_encoder_input.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04102025
//	Version: v1.0
//
// 	This is encoder input channel.
//
//===============================================

module channel_encoder_input
(
	input  						pe_enc_clk,  
	input  						pe_enc_rstn,

	// control
	input						pe_enc_logic_clr,

	// configs
	input						r_ec1m,
	input						r_ec1p,
	input						r_ec1np,
	input						r_ec1e,
	input						r_ec1ne,

	// output regs
	output reg	[15:0]			r_ec,
	output 						r_ed,

	input 		[23:0]			arr_cnt,
	input						timing_enable,
	input						arr_cnt_end,
	output						encoder_detected,

	// encoder input
	input						ec1prefc,
	input						ec1nrefc,

	// input channel
	input						ec1prefc_first_detected,
	input						ec1prefc_second_detected,
	input						ec1nrefc_first_detected,
	input						ec1nrefc_second_detected,
	input						ec1prefc_first_valid,
	input						ec1prefc_second_valid,
	input						ec1nrefc_first_valid,
	input						ec1nrefc_second_valid
);

//===============================================
// encoder counter mode:
// Using direct channel:
// 1. only first edge
// 2. first and second edge
// Using quadrature channel(direct channel is reference):
// 3. all 4 edge
//
// forward:
//                 ___     ___     ___
// direct      ___|   |___|   |___|   |___
//                   ___     ___     ___
// quadrature    ___|   |___|   |___|   |__
//
// mode 1         V       V       V
// mode 2         V   V   V   V   V   V
// mode 3         V V V V V V V V V V V V
// 
// reverse:
//                  ___     ___     ___
// quadrature   ___|   |___|   |___|   |___
//                ___     ___     ___
// direct     ___|   |___|   |___|   |__
//
//===============================================

wire							r_encoder_mode1;// direct channel first edge
wire							r_encoder_mode2;// direct channel first and second edge
wire							r_encoder_mode3;// direct and quadrature 4 edge;

assign r_encoder_mode1 = (r_ec1e != r_ec1ne) && ~r_ec1m;
assign r_encoder_mode2 = (r_ec1e != r_ec1ne) && r_ec1m;
assign r_encoder_mode3 = r_ec1e && r_ec1ne;

//===============================================
// direction input
// Only using in quadrature mode.
// 1: reverse
// 0: forward
//
// Treating direct channel as reference.
//===============================================

reg								encoder_dir;
//wire							encoder_dir_forward_first_trigger;
//wire							encoder_dir_forward_second_trigger;
//wire							encoder_dir_reverse_first_trigger;
//wire							encoder_dir_reverse_second_trigger;
wire							encoder_dir_forward_trigger;
wire							encoder_dir_reverse_trigger;
//assign encoder_dir_forward_first_trigger = ec1prefc_first_detected && ((r_ec1p && ~ec1nrefc) || (~r_ec1np && ec1nrefc));
//assign encoder_dir_forward_second_trigger = ec1prefc_second_detected && ((r_ec1p && ec1nrefc) || (~r_ec1np && ~ec1nrefc));
//assign encoder_dir_reverse_first_trigger = ec1prefc_first_detected && ((r_ec1p && ec1nrefc) || (~r_ec1np && ~ec1nrefc));
//assign encoder_dir_reverse_second_trigger = ec1prefc_second_detected && ((r_ec1p && ~ec1nrefc) || (~r_ec1np && ec1nrefc));
//assign encoder_dir_forward_trigger = encoder_dir_forward_first_trigger || encoder_dir_forward_second_trigger; 
//assign encoder_dir_reverse_trigger = encoder_dir_reverse_first_trigger || encoder_dir_reverse_second_trigger; 
assign encoder_dir_forward_trigger = (ec1prefc_first_detected && ~ec1nrefc) || (ec1prefc_second_detected && ec1nrefc); 
assign encoder_dir_reverse_trigger = (ec1prefc_first_detected && ec1nrefc) || (ec1prefc_second_detected && ~ec1nrefc); 
assign r_ed = encoder_dir;

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		encoder_dir <= 1'b0;
	end
	else if(pe_enc_logic_clr || ~r_encoder_mode3 || encoder_dir_forward_trigger)
	begin
		encoder_dir <= 1'b0;
	end
	else if(encoder_dir_reverse_trigger)
	begin
		encoder_dir <= 1'b1;
	end
	else
	begin
		encoder_dir <= encoder_dir;
	end
end

//===============================================
// encoder valid input
//===============================================

wire							encoder_detected_in_mode1;
wire							encoder_detected_in_mode2;
wire							encoder_detected_in_mode3;
// original logic
//assign encoder_detected_in_mode1 = r_ec1e ? ec1prefc_first_detected : ec1nrefc_first_detected;
//assign encoder_detected_in_mode2 = r_ec1e ? (ec1prefc_first_detected  || ec1prefc_second_detected) : (ec1nrefc_first_detected || ec1nrefc_second_detected);
//assign encoder_detected_in_mode3 = ec1prefc_first_detected  || ec1prefc_second_detected || ec1nrefc_first_detected || ec1nrefc_second_detected;
//assign encoder_detected = timing_enable && (r_encoder_mode1 ? encoder_detected_in_mode1 : (r_encoder_mode2 ? encoder_detected_in_mode2 : encoder_detected_in_mode3));
// concise logic
assign encoder_detected_in_mode1 = (r_ec1e && ec1prefc_first_detected) || (r_ec1ne && ec1nrefc_first_detected);
assign encoder_detected_in_mode2 = (r_ec1e && ec1prefc_second_detected) || (r_ec1ne && ec1nrefc_second_detected) || encoder_detected_in_mode1 ;
assign encoder_detected_in_mode3 = encoder_detected_in_mode2;
assign encoder_detected = timing_enable && (r_encoder_mode1 ? encoder_detected_in_mode1 : encoder_detected_in_mode2);

//===============================================
// encoder counter
// add 1: forward
// minus 1: reverse
// Capture data only when detection is valid.
// Capture data must be saved even after ending.
// Otherwise, data will be lost and cannot be read.
//===============================================

reg				[15:0]			encoder_cnt;

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		encoder_cnt <= 16'h0;
	end
	else if(pe_enc_logic_clr || arr_cnt_end)
	begin
		encoder_cnt <= 16'h0;
	end
	else if(encoder_detected)
	begin
		if(encoder_dir)
		begin
			encoder_cnt <= encoder_cnt - 1'b1;
		end
		else
		begin
			encoder_cnt <= encoder_cnt + 1'b1;
		end
	end
	else
	begin
		encoder_cnt <= encoder_cnt;
	end
end

always @(posedge pe_enc_clk or negedge pe_enc_rstn)
begin
	if(!pe_enc_rstn)
	begin
		r_ec <= 16'h0;
	end
	else if(pe_enc_logic_clr)
	begin
		r_ec <= 16'h0;
	end
	else if(arr_cnt_end)
	begin
		r_ec <= encoder_cnt;
	end
	else
	begin
		r_ec <= r_ec;
	end
end

endmodule


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
// 	will also be disabled in pwm section soon.
//
//===============================================

module fault_detection
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,

	// configs
	input 		[ 3:0]			r_bt,
	input						r_bk2p,
	input						r_bk2e,
	input						r_bk1p,
	input 						r_bk1e,

	// pin
	input						advtmr_bk1,
	input						advtmr_bk2,
	output						advtmr_bk1_oen,
	output						advtmr_bk2_oen,
	input						system_failure,

	output reg					fault_detected,
	output 						int_status_gen_fault_detected
);

//===============================================
// break detection pin direction
//===============================================

assign advtmr_bk1_oen = r_bk1e ? 1'b1 : 1'b0;
assign advtmr_bk2_oen = r_bk1e ? 1'b1 : 1'b0;

//===============================================
// break input filter
// channel1 : external
// channel2 : external & internal system failure
//===============================================

wire							break1_valid;
wire							break2_valid;

edge_delay_hold_detect u_break1_detection
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),

	.enable						(r_bk1e),
	.delay_value				(r_bt),
	.input_value				(advtmr_bk1),
	.expected_value				(r_bk1p),
	.input_detected				(),
	.input_valid				(break1_valid)
);

edge_delay_hold_detect u_break2_detection
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),

	.enable						(r_bk2e),
	.delay_value				(r_bt),
	.input_value				(advtmr_bk2),
	.expected_value				(r_bk2p),// only 1
	.input_detected				(),
	.input_valid				(break2_valid)
);

//===============================================
// fault detect
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		fault_detected <= 1'b0;
	end
	else if((break1_valid && r_bk1e) || ((system_failure || break2_valid) && r_bk2e))
	begin
		fault_detected <= 1'b1;
	end
	else
	begin
		fault_detected <= 1'b0;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_gen_fault_detected = fault_detected;

endmodule


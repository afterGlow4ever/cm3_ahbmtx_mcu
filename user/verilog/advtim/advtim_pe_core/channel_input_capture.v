//===============================================
//
//	File: channel_input_capture.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03232025
//	Version: v1.0
//
// 	This is input capture channel.
// 	channel 1
//
//===============================================

module channel_input_capture
(
	input  						pe_cap_clk,  
	input  						pe_cap_rstn,

	// control
	input						pe_cap_logic_clr,

	// configs
	input						r_ic1m,

	// output regs
	output reg	[15:0]			r_ifr,
	output reg	[15:0]			r_ilr,
	output reg	[15:0]			r_ifc,
	output reg	[15:0]			r_ilc,

	input 		[15:0]			arr_cnt,
	input 		[15:0]			rcr_cnt,
	input						timing_enable,

	// input capture
	input						ic1prefc,
	input						ic1nrefc,
	input						ic1prefc_d,
	input						ic1nrefc_d,

	// input channel
	input						ic1prefc_first_detected,
	input						ic1prefc_second_detected,
	input						ic1nrefc_first_detected,
	input						ic1nrefc_second_detected,
	input						ic1prefc_first_valid,
	input						ic1prefc_second_valid,
	input						ic1nrefc_first_valid,
	input						ic1nrefc_second_valid
);

//===============================================
// channel 1 & 2
// Capture data only when detection is valid.
// Capture data must be saved even after ending.
// Otherwise, data will be lost and cannot be read.
//===============================================

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		r_ifc <= 16'h0;
	end
	else if(pe_cap_logic_clr)
	begin
		r_ifc <= 16'h0;
	end
	else if(ic1prefc_second_detected)
	begin
		r_ifc <= arr_cnt;
	end
	else
	begin
		r_ifc <= r_ifc;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		r_ilc <= 16'h0;
	end
	else if(pe_cap_logic_clr)
	begin
		r_ilc <= 16'h0;
	end
	else if(ic1prefc_first_detected)
	begin
		r_ilc <= arr_cnt;
	end
	else
	begin
		r_ilc <= r_ilc;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		r_ifr <= 16'h0;
	end
	else if(pe_cap_logic_clr)
	begin
		r_ifr <= 16'h0;
	end
	else if(ic1prefc_second_detected)
	begin
		r_ifr <= rcr_cnt;
	end
	else
	begin
		r_ifr <= r_ifr;
	end
end

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		r_ilr <= 16'h0;
	end
	else if(pe_cap_logic_clr)
	begin
		r_ilr <= 16'h0;
	end
	else if(ic1prefc_first_detected)
	begin
		r_ilr <= rcr_cnt;
	end
	else
	begin
		r_ilr <= r_ilr;
	end
end

endmodule


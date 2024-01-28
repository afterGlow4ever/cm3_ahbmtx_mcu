//===============================================
//
//	File: bastim_ch.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01212024
//	Version: v1.0
//
// 	This is channel for basic timer.
//
//===============================================

module bastim_ch
(
	input  						ch_clk,  
	input  						ch_rstn,

	// control
	input						ch_auto_reload,
	input						ch_tim_enable,

	//configs
	input 		[15:0]			r_psc,
	input 		[15:0]			r_arr,
	input 		[15:0]			r_startcnt,

	// interrupt status
	output						int_status_ch_reload
);

//===============================================
// reload control
// Enable is directly controlled by reg only
// when auto reload is disabled.
//===============================================

wire							ch_tim_enable_r;
wire							ch_reload_flag;
reg								timing_base_enable;

posedge_detect u_posedge_detect 
(
	.clk						(ch_clk),
	.rstn						(ch_rstn),
	.A							(ch_tim_enable),
	.Y							(ch_tim_enable_r)
);

always @(posedge ch_clk or negedge ch_rstn)
begin
	if(!ch_rstn)
		timing_base_enable <= 1'b0;
	// If disabled, the counter will stop immediately.
	else if(ch_tim_enable == 1'b0)
		timing_base_enable <= 1'b0;
	// If reload occuring,  the counter will continue 
	// only when auto reload is on.
	else if(ch_reload_flag == 1'b1)
		timing_base_enable <= ch_auto_reload;
	// If enabled and counter is running, this signal will remain.
	// If idle, enable control will occur at rising edge.
	else 
		if(ch_tim_enable_r == 1'b1)
			timing_base_enable <= 1'b1;
		else
			timing_base_enable <= timing_base_enable;
end

//===============================================
// basic timer counter base
// operating when channel enable 
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 oversampling flag 
// 0           1           2           3          bit flag
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 clkdiv start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 clkdiv end
// 1  1  1  1  0  0  0  0  0  0  0  0  0  0  0  0 cnt start
// 0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1 cnt end
// 1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 bit start
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 bit end
//===============================================

reg				[15:0]			clkdiv_cnt;// the smallest unit of timing base
reg				[15:0]			channel_cnt;// this unit is composed of clkdiv_cnt
wire							clkdiv_flag_start;// indicate a bit start
wire							clkdiv_flag_end;// indicate a bit end
wire							channel_flag_start;// indicate a channel point start
wire							channel_flag_end;// indicate a channel point end
wire							bit_start;// indicate a data bit start when the first clkdiv unit is meeting first channel unit
										// only sustaining 1 clk
wire							bit_end;// indicate a data bit end when the last clkdiv unit is meeting last channel unit
										// only sustaining 1 clk
assign clkdiv_flag_start = (clkdiv_cnt == 1'b0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == (r_psc - 1'b1)) ? 1'b1 : 1'b0;
assign channel_flag_start = (channel_cnt == 1'b0) ? 1'b1 : 1'b0;
assign channel_flag_end = (channel_cnt == (r_arr - 1'b1)) ? 1'b1 : 1'b0;
assign bit_end = channel_flag_end && clkdiv_flag_end; // only sustaining 1 clock
assign ch_reload_flag = bit_end;

// div cnt for clkdiv
always @(posedge ch_clk or negedge ch_rstn)
begin
	if(!ch_rstn)
	begin
		clkdiv_cnt <= 16'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			clkdiv_cnt <= 16'h0;
		end
		else
		begin
			clkdiv_cnt <= clkdiv_cnt + 1'b1;
		end
	end
	else
	begin
		clkdiv_cnt <= 16'h0;
	end
end

// channel cnt for channel point
always @(posedge ch_clk or negedge ch_rstn)
begin
	if(!ch_rstn)
	begin
		channel_cnt <= 16'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			if(channel_flag_end == 1'b1)
			begin
				channel_cnt <= r_startcnt;
			end
			else
			begin
				channel_cnt <= channel_cnt + 1'b1;
			end
		end
	end
	else
	begin
		channel_cnt <= r_startcnt;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_ch_reload = ch_reload_flag; 

endmodule


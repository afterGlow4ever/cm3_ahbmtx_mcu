//===============================================
//
//	File: advtim_cnt_gen.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11102024
//	Version: v1.0
//
// 	This is pwm generator for advance timer.
//
//===============================================

module advtim_cnt_gen
(
	input  						pe_gen_clk,  
	input  						pe_gen_rstn,

	// control
	input						pe_gen_tim_enable,
	output						pe_gen_tim_end,
	input						pe_gen_logic_clr,
	output						pe_gen_hw_update,

	// configs
	input 		[15:0]			r_psc,
	input 		[15:0]			r_arr,
	input 		[15:0]			r_rcr,
	input		[ 1:0]			r_cms,
	input						r_dir,
	input		[15:0]			r_cc1,
	input		[ 3:0]			r_oc1m,
	input		[15:0]			r_cc2,
	input		[ 3:0]			r_oc2m,
	input 		[15:0]			r_cc3,
	input 		[ 3:0]			r_oc3m,
	input 		[15:0]			r_cc4,
	input 		[ 3:0]			r_oc4m,
	input 		[15:0]			r_cc5,
	input 						r_cc5c3,
	input 						r_cc5c2,
	input 						r_cc5c1,
	input 		[ 3:0]			r_oc5m,
	input 		[15:0]			r_cc6,
	input 		[ 3:0]			r_oc6m,

	// output compare
	output 						oc1refc,
	output 						oc2refc,
	output 						oc3refc,
	output 						oc4refc,
	output 						oc5refc,
	output 						oc6refc,
	output 						oc5c1refc,
	output 						oc5c2refc,
	output 						oc5c3refc,

	// interactive
	output reg					gen_cnt_dir,
	output						gen_cnt_pre_end,
	output						gen_cnt_enable,
	input						fault_detected,

	// interrupt status
	output						int_status_gen_end,
	output						int_status_gen_reloaded
);

//===============================================
//
//===============================================

wire							cnt_start;// indicate a data bit start when the first psc unit is meeting first arr unit
										// only sustaining 1 clk
wire							cnt_end;// indicate a data bit end when the last psc unit is meeting last arr unit
wire							cnt_pre_end;// indicate a data bit pre end when the last psc unit is meeting last arr unit
										// only sustaining 1 clk

//===============================================
// shadow config
//===============================================

reg	 			[15:0]			r_psc_last;
reg	 			[15:0]			r_arr_last;
reg				[ 1:0]			r_cms_last;
reg								r_dir_last;
reg	 			[15:0]			r_cc1_last;
reg	 			[15:0]			r_cc2_last;
reg	 			[15:0]			r_cc3_last;
reg	 			[15:0]			r_cc4_last;
reg	 			[15:0]			r_cc5_last;
reg	 			[15:0]			r_cc6_last;

//===============================================
// enable control
//===============================================

wire							pe_gen_tim_enable_r;

posedge_detect u_posedge_detect 
(
	.clk						(pe_gen_clk),
	.rstn						(pe_gen_rstn),
	.A							(pe_gen_tim_enable),
	.Y							(pe_gen_tim_enable_r)
);

//===============================================
// reload control
// r_rcr=0 means always on.
//===============================================

wire							gen_reload_flag;
wire							gen_reload_finish;
reg				[15:0]			rcr_counter;
assign gen_reload_finish = ((|r_rcr) ? ((rcr_counter == r_rcr - 1'b1) ? cnt_end : 1'b0) : 1'b0);
assign pe_gen_tim_end = gen_reload_finish;

// rcr counter
always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		rcr_counter <= 16'h0;
	end
	else if(pe_gen_logic_clr || gen_reload_finish || fault_detected)
	begin
		rcr_counter <= 16'h0;
	end
	else if(gen_reload_flag && ((|r_rcr) != 1'b0))
	begin
		rcr_counter <= rcr_counter + 1'b1;
	end
	else
	begin
		rcr_counter <= rcr_counter;
	end
end

//===============================================
// counter control
// timing_base_enable should dessert before counter
// disable a clk earlier in order to avoiding 
// counter disabled late.
// Using timing_base_real_enable to implement.
//===============================================

reg								timing_base_enable;
wire							timing_base_real_enable;
assign timing_base_real_enable = timing_base_enable && ~gen_reload_finish; 
assign gen_cnt_enable = timing_base_real_enable;

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		timing_base_enable <= 1'b0;
	end
	// If disabled, the counter will stop immediately.
	// If reload occuring,  the counter will continue 
	// only when reloading is not finish.
	else if(pe_gen_logic_clr || gen_reload_finish || fault_detected)
	begin
		timing_base_enable <= 1'b0;
	end
	// If enabled and counter is running, this signal will remain.
	// If idle, enable control will occur at rising edge.
	else if(pe_gen_tim_enable_r == 1'b1)
	begin
		timing_base_enable <= 1'b1;
	end
	else
	begin
		timing_base_enable <= timing_base_enable;
	end
end

//===============================================
// direction control
// For edge aligned mode, the direction is fixed.
// For center aligned mode, the direction is up
// and down or down and up.
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		gen_cnt_dir <= 1'b0;
	end
	//edge align mode
//	else if(pe_gen_logic_clr || (|r_cms == 1'b0) || gen_reload_finish || fault_detected)
	else if(pe_gen_logic_clr || (|r_cms == 1'b0) || ~timing_base_real_enable)
	begin
		gen_cnt_dir <= r_dir;
	end
	//center align mode 
	else if(gen_cnt_pre_end)
	begin
		gen_cnt_dir <= ~gen_cnt_dir;
	end
	else
	begin
		gen_cnt_dir <= gen_cnt_dir;
	end
end

//===============================================
// advance timer counter base
// for pwm generator
// operating when channel enable 
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 oversampling flag 
// 0           1           2           3          bit flag
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 psc start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 psc end
// 1  1  1  1  0  0  0  0  0  0  0  0  0  0  0  0 arr start
// 0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1 arr end
// 1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 cnt start
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0 cnt pre end
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 cnt end
//===============================================

reg				[15:0]			psc_cnt;// the smallest unit of timing base
reg				[15:0]			arr_cnt;// this unit is composed of psc_cnt
wire							psc_flag_start;
wire							psc_flag_end;
//wire							psc_flag_pre_end;
wire							arr_flag_start;
wire							arr_flag_pre_end;
wire							arr_flag_end;
assign psc_flag_start = (psc_cnt == 1'b0) ? 1'b1 : 1'b0;
assign psc_flag_end = (psc_cnt == (r_psc_last - 1'b1)) ? 1'b1 : 1'b0;
//assign psc_flag_pre_end = (psc_cnt == (r_psc - 2'h2)) ? 1'b1 : 1'b0;

// div cnt for clkdiv
always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		psc_cnt <= 16'h0;
	end
	else if(timing_base_real_enable == 1'b1)
	begin
		if(psc_flag_end == 1'b1)
		begin
			psc_cnt <= 16'h0;
		end
		else
		begin
			psc_cnt <= psc_cnt + 1'b1;
		end
	end
	else
	begin
		psc_cnt <= 16'h0;
	end
end

// The comment section for arr is a counter
// which from N to 1.
// The other one is from N-1 to 0.
assign arr_flag_start = (arr_cnt == 1'b0) ? 1'b1 : 1'b0;
//assign arr_flag_end = ((r_dir_last == 1'b1) ? ((arr_cnt == 16'h1) ? 1'b1 : 1'b0) : ((arr_cnt == (r_arr_last - 1'b1)) ? 1'b1 : 1'b0)) && psc_flag_end;// ???
//assign arr_flag_pre_end = ((r_dir_last == 1'b1) ? ((arr_cnt == 16'h2) ? 1'b1 : 1'b0) : ((arr_cnt == (r_arr_last - 2'h2)) ? 1'b1 : 1'b0)) && psc_flag_end;// ???
assign arr_flag_end = ((r_dir_last == 1'b1) ? ((|arr_cnt == 1'b0) ? 1'b1 : 1'b0) : ((arr_cnt == (r_arr_last - 1'b1)) ? 1'b1 : 1'b0)) && psc_flag_end;// ???
assign arr_flag_pre_end = ((r_dir_last == 1'b1) ? ((arr_cnt == 16'h1) ? 1'b1 : 1'b0) : ((arr_cnt == (r_arr_last - 2'h2)) ? 1'b1 : 1'b0)) && psc_flag_end;// ???

// channel cnt for pwm generator
always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		arr_cnt <= 16'h0;
	end
	else if(timing_base_real_enable == 1'b1)
	begin
		if(psc_flag_end == 1'b1)
		begin
			if(arr_flag_end == 1'b1)
			begin
				if(((|r_cms == 1'b0) && r_dir) || gen_cnt_dir)
				begin
					arr_cnt <= r_arr - 1'b1;
					end
				else
				begin
					arr_cnt <= 16'h0;
				end
			end
			else
			begin
				if(((|r_cms == 1'b0) && r_dir) || gen_cnt_dir)
				begin
					arr_cnt <= arr_cnt - 1'b1;
				end
				else
				begin
					arr_cnt <= arr_cnt + 1'b1;
				end
			end
		end
		else
		begin
			arr_cnt <= arr_cnt;
		end
	end
	else
	begin
		arr_cnt <= r_arr - 1'b1;
	end
end

assign cnt_end = psc_flag_end && arr_flag_end && timing_base_enable; // only sustaining 1 clock
assign cnt_pre_end = psc_flag_end && arr_flag_pre_end && timing_base_enable; // only sustaining 1 clock
assign gen_reload_flag = cnt_end;
assign pe_gen_hw_update = cnt_pre_end;//???? 
assign gen_cnt_pre_end = cnt_pre_end;

//===============================================
// update 
//===============================================

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
//		r_psc_last <= r_psc;
//		r_arr_last <= r_arr;
//		r_cms_last <= r_cms;
//		r_cc1_last <= r_cc1;
//		r_cc2_last <= r_cc2;
//		r_cc3_last <= r_cc3;
//		r_cc4_last <= r_cc4;
//		r_cc5_last <= r_cc5;
//		r_cc6_last <= r_cc6;
		r_psc_last <= 16'h0002;
		r_arr_last <= 16'h0032;
		r_cms_last <= 2'h0;
		r_cc1_last <= 16'h0;
		r_cc2_last <= 16'h0;
		r_cc3_last <= 16'h0;
		r_cc4_last <= 16'h0;
		r_cc5_last <= 16'h0;
		r_cc6_last <= 16'h0;
	end
	else if(timing_base_real_enable == 1'b1)
	begin
		if(psc_flag_end == 1'b1)
		begin
			if(arr_flag_end == 1'b1)
			begin
				r_psc_last <= r_psc;
				r_arr_last <= r_arr;
				r_cms_last <= r_cms;
				r_cc1_last <= r_cc1;
				r_cc2_last <= r_cc2;
				r_cc3_last <= r_cc3;
				r_cc4_last <= r_cc4;
				r_cc5_last <= r_cc5;
				r_cc6_last <= r_cc6;
			end
			else
			begin
				r_psc_last <= r_psc_last;
				r_arr_last <= r_arr_last;
				r_cms_last <= r_cms_last;
				r_cc1_last <= r_cc1_last;
				r_cc2_last <= r_cc2_last;
				r_cc3_last <= r_cc3_last;
				r_cc4_last <= r_cc4_last;
				r_cc5_last <= r_cc5_last;
				r_cc6_last <= r_cc6_last;
			end
		end
		else
		begin
			r_psc_last <= r_psc_last;
			r_arr_last <= r_arr_last;
			r_cms_last <= r_cms_last;
			r_cc1_last <= r_cc1_last;
			r_cc2_last <= r_cc2_last;
			r_cc3_last <= r_cc3_last;
			r_cc4_last <= r_cc4_last;
			r_cc5_last <= r_cc5_last;
			r_cc6_last <= r_cc6_last;
		end
	end
	else
	begin
		r_psc_last <= r_psc;
		r_arr_last <= r_arr;
		r_cms_last <= r_cms;
		r_cc1_last <= r_cc1;
		r_cc2_last <= r_cc2;
		r_cc3_last <= r_cc3;
		r_cc4_last <= r_cc4;
		r_cc5_last <= r_cc5;
		r_cc6_last <= r_cc6;
	end
end

always @(posedge pe_gen_clk or negedge pe_gen_rstn)
begin
	if(!pe_gen_rstn)
	begin
		r_dir_last <= r_dir;
	end
	else if(timing_base_real_enable == 1'b1)
	begin
		if(psc_flag_end == 1'b1)
		begin
			if(arr_flag_end == 1'b1)
			begin
				if(|r_cms == 1'b0)
				begin
					r_dir_last <= r_dir;
				end
				else
				begin
					r_dir_last <= gen_cnt_dir;
				end
			end
			else
			begin
				r_dir_last <= r_dir_last;
			end
		end
		else
		begin
			r_dir_last <= r_dir_last;
		end
	end
	else
	begin
		r_dir_last <= r_dir;
	end
end

//===============================================
// pwm compare
//===============================================

channel_output_compare u_channel_output_compare 
(
	.pe_gen_clk					(pe_gen_clk),  
	.pe_gen_rstn				(pe_gen_rstn),

	.r_cc1						(r_cc1_last),
	.r_oc1m						(r_oc1m),
	.r_cc2						(r_cc2_last),
	.r_oc2m						(r_oc2m),
	.r_cc3						(r_cc3_last),
	.r_oc3m						(r_oc3m),
	.r_cc4						(r_cc4_last),
	.r_oc4m						(r_oc4m),
	.r_cc5						(r_cc5_last),
	.r_cc5c3					(r_cc5c3),
	.r_cc5c2					(r_cc5c2),
	.r_cc5c1					(r_cc5c1),
	.r_oc5m						(r_oc5m),
	.r_cc6						(r_cc6_last),
	.r_oc6m						(r_oc6m),

	.arr_cnt					(arr_cnt),
	.dir						(r_dir_last),
	.timing_enable				(timing_base_enable),

	.oc1refc					(oc1refc),
	.oc2refc					(oc2refc),
	.oc3refc					(oc3refc),
	.oc4refc					(oc4refc),
	.oc5refc					(oc5refc),
	.oc6refc					(oc6refc),
	.oc5c1refc					(oc5c1refc),
	.oc5c2refc					(oc5c2refc),
	.oc5c3refc					(oc5c3refc)
);

//===============================================
// interrupt status detect
//===============================================

assign int_status_gen_end = gen_reload_finish; 
assign int_status_gen_reloaded = gen_reload_flag; 

endmodule


//===============================================
//
//	File: advtim_cnt_cap.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03222025
//	Version: v1.0
//
// 	This is input capture for advance timer.
//
//===============================================

module advtim_cnt_cap
(
	input  						pe_cap_clk,  
	input  						pe_cap_rstn,

	// input capture
	input						ic1prefc,
	input						ic1nrefc,
	input						ic1prefc_d,
	input						ic1nrefc_d,

	// control
	input						pe_cap_tim_enable,
	output						pe_cap_tim_end,
	input						pe_cap_logic_clr,
	output						pe_cap_hw_update,

	// configs
	input 		[15:0]			r_psc,
	input 		[15:0]			r_arr,
	input 		[15:0]			r_rcr,
	input 						r_ic1m,

	// input
	input						ic1prefc_first_detected,
	input						ic1prefc_second_detected,
	input						ic1nrefc_first_detected,
	input						ic1nrefc_second_detected,
	input						ic1prefc_first_valid,
	input						ic1prefc_second_valid,
	input						ic1nrefc_first_valid,
	input						ic1nrefc_second_valid,
	input						ic1prefc_first_capturing,
	input						ic1prefc_second_capturing,
	input						ic1nrefc_first_capturing,
	input						ic1nrefc_second_capturing,

	// output regs
	output 		[15:0]			r_ifr,
	output 		[15:0]			r_ilr,
	output 		[15:0]			r_ifc,
	output 		[15:0]			r_ilc,
	
	// interactive
	output						cap_cnt_pre_end,
	output						cap_cnt_enable,

	// interrupt status
	output						int_status_cap_end,
	output						int_status_cap_reloaded
);

//===============================================
//
//===============================================

wire							cnt_start;// indicate a data bit start when the first psc unit is meeting first arr unit
										// only sustaining 1 clk
wire							cnt_end;// indicate a data bit end when the last psc unit is meeting last arr unit
wire							cnt_pre_end;// indicate a data bit pre end when the last psc unit is meeting last arr unit
										// only sustaining 1 clk
wire							cap_start;
wire							cap_period_start;
wire							cap_running;
wire							cap_half_period_start;
//reg								cap_first_detected;// ensure that first detection cannot trigger rcr counter adding 1
wire							cap_reload_last;// for timing need
wire							cap_reload_finish;

//===============================================
// shadow config
//===============================================

reg	 			[15:0]			r_psc_last;
reg	 			[15:0]			r_arr_last;

//===============================================
// enable control
//===============================================

wire							pe_cap_tim_enable_r;

posedge_detect u_posedge_detect 
(
	.clk						(pe_cap_clk),
	.rstn						(pe_cap_rstn),
	.A							(pe_cap_tim_enable),
	.Y							(pe_cap_tim_enable_r)
);

//===============================================
// state
//===============================================

localparam						CAPTURE_IDLE = 4'b0001;
localparam						CAPTURE_FIRST_STAGE = 4'b0010;
localparam						CAPTURE_SECOND_STAGE = 4'b0100;
localparam						CAPTURE_WAIT = 4'b1000;

reg				[ 3:0]			current_state;
reg				[ 3:0]			next_state;

wire							capture_state_idle;
wire							capture_state_first_stage;
wire							capture_state_second_stage;
wire							capture_state_wait;
wire							capture_state_idle_to_first_stage;
wire							capture_state_first_stage_to_second_stage;
wire							capture_state_first_stage_to_wait;
wire							capture_state_first_stage_to_idle;
wire							capture_state_second_stage_to_idle;
wire							capture_state_second_stage_to_first_stage;
wire							capture_state_wait_to_first_stage;

// state transition: sequential logic circuit
always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
		current_state <= CAPTURE_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// CAPTURE_IDLE:
// -> CAPTURE_FIRST_STAGE: received first edge
// CAPTURE_FIRST_STAGE:
// -> CAPTURE_SECOND_STAGE: first half end
// -> CAPTURE_WAIT: discarding second half
// -> CAPTURE_IDLE: step periods reaching maxmium
// CAPTURE_SECOND_STAGE:
// -> CAPTURE_IDLE: periods reaching maxmium
// -> CAPTURE_FIRST_STAGE: received first edge
// CAPTURE_WAIT:
// -> CAPTURE_IDLE: periods reaching maxmium
// -> CAPTURE_FIRST_STAGE: received first edge
// All state should transition to TX_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	CAPTURE_IDLE:
		if(cap_start)
			next_state = CAPTURE_FIRST_STAGE;
		else
			next_state = CAPTURE_IDLE;
	CAPTURE_FIRST_STAGE:
		if(capture_state_first_stage_to_idle || pe_cap_logic_clr)
			next_state = CAPTURE_IDLE;
		else if(capture_state_first_stage_to_wait)
			next_state = CAPTURE_WAIT;
		else if(capture_state_first_stage_to_second_stage)
			next_state = CAPTURE_SECOND_STAGE;
		else
			next_state = CAPTURE_FIRST_STAGE;
	CAPTURE_SECOND_STAGE:
		if(capture_state_second_stage_to_idle || pe_cap_logic_clr)
			next_state = CAPTURE_IDLE;
		else if(capture_state_second_stage_to_first_stage)
			next_state = CAPTURE_FIRST_STAGE;
		else
			next_state = CAPTURE_SECOND_STAGE;
	CAPTURE_WAIT:
		if(pe_cap_logic_clr)
			next_state = CAPTURE_IDLE;
		else if(capture_state_wait_to_first_stage)
			next_state = CAPTURE_FIRST_STAGE;
		else
			next_state = CAPTURE_WAIT;
	default:
		next_state = CAPTURE_IDLE;
	endcase
end

// state output: combinational logic circuit
assign capture_state_idle = current_state == CAPTURE_IDLE;
assign capture_state_first_stage = current_state == CAPTURE_FIRST_STAGE;
assign capture_state_second_stage = current_state == CAPTURE_SECOND_STAGE;

//===============================================
// capture process
//                      ____________            ____
// input        _______|            |__________|
//                      __                      __
// 1st_edge     _______|  |____________________|
//                                   __
// 2nd_edge     ____________________|  |_________
//                      __                      __
// period_start _______|  |____________________|  
//                                   __          
// haper_start  ____________________|  |_________
//
// arr                     0        
//===============================================

assign capture_state_idle_to_first_stage = ic1prefc_first_detected && pe_cap_tim_enable;
assign capture_state_first_stage_to_second_stage = capture_state_first_stage && r_ic1m && ic1prefc_second_detected;
assign capture_state_first_stage_to_wait = capture_state_first_stage && ~r_ic1m && ic1prefc_second_detected;
assign capture_state_first_stage_to_idle = capture_state_first_stage && ~r_ic1m && cap_reload_last && ic1prefc_second_detected;
//assign capture_state_first_stage_to_idle = capture_state_first_stage && ~r_ic1m && cap_reload_finish;
assign capture_state_second_stage_to_idle = ic1prefc_first_detected && cap_reload_last;// only consecutive pwm can exit capture correctly ??? timing error ???
assign capture_state_second_stage_to_first_stage = ic1prefc_first_detected;// ???
assign capture_state_wait_to_first_stage = ic1prefc_first_detected;

assign cap_start = capture_state_idle_to_first_stage;
assign cap_period_start = capture_state_idle_to_first_stage || capture_state_second_stage_to_first_stage || capture_state_wait_to_first_stage;
assign cap_half_period_start = capture_state_first_stage_to_second_stage || capture_state_first_stage_to_wait;
assign cap_running = ~capture_state_idle;

//===============================================
// period reload control
// r_rcr=0 means always on.
//===============================================

wire							cap_reload_flag;
wire							cap_reload_flag_in_pwm_mode;
wire							cap_reload_flag_in_step_mode;
reg				[15:0]			period_cnt;
assign cap_reload_finish = ((|r_rcr) ? ((period_cnt == r_rcr) ? 1'b1 : 1'b0) : 1'b0);//???
assign cap_reload_last = period_cnt == (r_rcr - 1'b1);// the period before reaching rcr
assign cap_reload_flag_in_pwm_mode = ic1prefc_first_detected && capture_state_second_stage;
assign cap_reload_flag_in_step_mode = ic1prefc_second_detected && capture_state_first_stage;
assign cap_reload_flag = r_ic1m ? cap_reload_flag_in_pwm_mode : cap_reload_flag_in_step_mode;
assign pe_cap_tim_end = cap_reload_finish;

// rcr cnt
always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		period_cnt <= 16'h0;
	end
	else if(pe_cap_logic_clr || cap_reload_finish)
	begin
		period_cnt <= 16'h0;
	end
	else if(cap_reload_flag && ((|r_rcr) != 1'b0))
	begin
		period_cnt <= period_cnt + 1'b1;
	end
	else
	begin
		period_cnt <= period_cnt;
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
assign timing_base_real_enable = timing_base_enable && ~cap_reload_finish; 
assign cap_cnt_enable = timing_base_real_enable;

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		timing_base_enable <= 1'b0;
	end
	// If disabled, the counter will stop immediately.
	// If reload occuring,  the counter will continue 
	// only when reloading is not finish.
	else if(pe_cap_logic_clr || cap_reload_finish)
	begin
		timing_base_enable <= 1'b0;
	end
	// If enabled and counter is running, this signal will remain.
	// If idle, enable control will occur at rising edge.
	else if(pe_cap_tim_enable_r)
	begin
		timing_base_enable <= 1'b1;
	end
	else
	begin
		timing_base_enable <= timing_base_enable;
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
assign psc_flag_start = (psc_cnt == 1'b0) ? 1'b1 : 1'b0;
assign psc_flag_end = ((psc_cnt == (r_psc_last - 1'b1)) ? 1'b1 : 1'b0) || cap_period_start;

// div cnt for clkdiv
always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		psc_cnt <= 16'h0;
	end
	else if(timing_base_real_enable && cap_running)
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
wire							arr_flag_start;
wire							arr_flag_pre_end;
wire							arr_flag_end;
assign arr_flag_start = (arr_cnt == 1'b0) ? 1'b1 : 1'b0;
assign arr_flag_end = (((arr_cnt == (r_arr_last - 1'b1)) ? 1'b1 : 1'b0) && psc_flag_end) || cap_period_start;// ???
assign arr_flag_pre_end = (((arr_cnt == (r_arr_last - 2'h2)) ? 1'b1 : 1'b0)  && psc_flag_end) || cap_period_start;// ???

// channel cnt for input capture
always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		arr_cnt <= 16'h0;
	end
	else if(timing_base_real_enable && cap_running)
	begin
		if(psc_flag_end == 1'b1)// ?? a period start
		begin
			if(arr_flag_end == 1'b1)
			begin

				arr_cnt <= 16'h0;
			end
			else
			begin

				arr_cnt <= arr_cnt + 1'b1;
			end
		end
		else
		begin
			arr_cnt <= arr_cnt;
		end
	end
	else
	begin
		arr_cnt <= 16'h0;
	end
end

assign cnt_end = psc_flag_end && arr_flag_end && timing_base_enable; // only sustaining 1 clock
assign cnt_pre_end = psc_flag_end && arr_flag_pre_end && timing_base_enable; // only sustaining 1 clock
assign pe_cap_hw_update = cnt_pre_end;//???? 
assign cap_cnt_pre_end = cnt_pre_end;

reg				[15:0]			rcr_cnt;

// channel rcr cnt for input capture
always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		rcr_cnt <= 16'h0;
	end
	else if(timing_base_real_enable && cap_running)
	begin
		if(arr_flag_end == 1'b1)// ?? a period start
		begin
			if(cap_period_start == 1'b1)
			begin

				rcr_cnt <= 16'h0;
			end
			else
			begin

				rcr_cnt <= rcr_cnt + 1'b1;
			end
		end
		else
		begin
			rcr_cnt <= rcr_cnt;
		end
	end
	else
	begin
		rcr_cnt <= 16'h0;
	end
end

//===============================================
// update 
//===============================================

always @(posedge pe_cap_clk or negedge pe_cap_rstn)
begin
	if(!pe_cap_rstn)
	begin
		r_psc_last <= 16'h0002;
		r_arr_last <= 16'h0032;
	end
	else if(timing_base_real_enable == 1'b1)
	begin
		if(psc_flag_end == 1'b1)
		begin
			if(arr_flag_end == 1'b1)
			begin
				r_psc_last <= r_psc;
				r_arr_last <= r_arr;
			end
			else
			begin
				r_psc_last <= r_psc_last;
				r_arr_last <= r_arr_last;
			end
		end
		else
		begin
			r_psc_last <= r_psc_last;
			r_arr_last <= r_arr_last;
		end
	end
	else
	begin
		r_psc_last <= r_psc;
		r_arr_last <= r_arr;
	end
end

//===============================================
// pwm compare
//===============================================

channel_input_capture u_channel_input_capture
(
	.pe_cap_clk					(pe_cap_clk),  
	.pe_cap_rstn				(pe_cap_rstn),

	.r_ic1m						(r_ic1m),

	.pe_cap_logic_clr			(pe_cap_logic_clr),

	.r_ifr						(r_ifr),
	.r_ilr						(r_ilr),
	.r_ifc						(r_ifc),
	.r_ilc						(r_ilc),

	.arr_cnt					(arr_cnt),
	.rcr_cnt					(rcr_cnt),
	.timing_enable				(timing_base_enable),

	.ic1prefc					(ic1prefc),
	.ic1nrefc					(ic1nrefc),
	.ic1prefc_d					(ic1prefc_d),
	.ic1nrefc_d					(ic1nrefc_d),

	.ic1prefc_first_detected	(ic1prefc_first_detected),
	.ic1prefc_second_detected	(ic1prefc_second_detected),
	.ic1nrefc_first_detected	(ic1nrefc_first_detected),
	.ic1nrefc_second_detected	(ic1nrefc_second_detected),
	.ic1prefc_first_valid		(ic1prefc_first_valid),
	.ic1prefc_second_valid		(ic1prefc_second_valid),
	.ic1nrefc_first_valid		(ic1nrefc_first_valid),
	.ic1nrefc_second_valid		(ic1nrefc_second_valid)
);

//===============================================
// interrupt status detect
//===============================================

assign int_status_cap_end = cap_reload_finish; 
// In step mode, this status is asserted at second edge.
// In pwm mode, this status is asserted at the end of a period.
assign int_status_cap_reloaded = cap_reload_flag;

//===============================================
// special section
//===============================================

`ifdef SIMULATION
wire		[31:0]				temp;
wire		[31:0]				temp2;
assign temp = (r_arr * r_ifr + r_ifc) * r_psc;
assign temp2 = (r_arr * r_ilr + r_ilc) * r_psc;
`endif

endmodule


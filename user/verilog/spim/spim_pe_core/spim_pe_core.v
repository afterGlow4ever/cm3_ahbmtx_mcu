//===============================================
//
//	File: spim_pe_core.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is trans protocol engine for spim.
//
//===============================================

module spim_pe_core
(
	input  						pe_clk,  
	input  						pe_rstn,

	// pin
	output reg					spim_sck,
	output reg					spim_sck_oen,
	output reg					spim_mosi_o,
	output reg					spim_mosi_oen,
	input						spim_miso_i,
	output reg					spim_miso_oen,
	output reg					spim_cs_o,
	output reg					spim_cs_oen,

	// data
	output 						tx_fifo_re,
	input		[ 7:0]			tx_fifo_data,
	input		[ 4:0]			tx_fifo_num,
	input						tx_fifo_empty,
	output reg					rx_fifo_we,
	output reg	[ 7:0]			rx_fifo_data,
	input		[ 4:0]			rx_fifo_num,
	input						rx_fifo_full,

	// control
	input						pe_trans_logic_clr,
	input						pe_trans_enable,
	output 						pe_trans_end,
	input		[ 7:0]			r_tx_num,
	input		[ 7:0]			r_trans_num,
	input						r_pause_enable,
	input						r_pause_continue,

	// config
	input		[ 1:0]			r_mode,
	input						r_tm,
	input						r_fm_en,
	input						r_txm,
	input						r_rxm,
	input		[ 7:0]			r_clkdiv,
	input 		[ 3:0]			r_tls,
	input 		[ 3:0]			r_tle,
	input 		[ 3:0]			r_ti,

	output						int_status_trans_pending,
	output						int_status_trans_done
);

//===============================================
// enable control
//===============================================

wire							pe_trans_enable_r;
wire							pe_trans_enable_f;

both_edge_detect u_enable_detection
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),

	.A							(pe_trans_enable),
	.Y_r						(pe_trans_enable_r),
	.Y_f						(pe_trans_enable_f)
);

//===============================================
// global variable
//===============================================

reg								tx_data_preloaded;
reg								tx_data_loaded;
wire							pe_trans_clear;
assign pe_trans_clear = pe_trans_logic_clr || pe_trans_enable_f;


reg								dp_tx_data_byte_done;
wire							dp_tx_data_byte_predone;
wire							dp_tx_data_last_byte;
reg								dp_tx_waiting_for_rx;
//wire							dp_rx_data_done;
wire							dp_rx_data_last_byte;
reg								dp_rx_waiting_for_tx;

reg								trans_data_pending_continue;

//===============================================
// config
//===============================================

wire							duplex_mode;
wire							simplex_mode;
assign duplex_mode = (r_tm == 1'b0);
assign simplex_mode = (r_tm == 1'b1);

wire							rx_num_is_more;
assign rx_num_is_more = r_fm_en ? (r_trans_num > r_tx_num) : 1'b0;

wire							r_rxm_real;
assign r_rxm_real = r_rxm || (r_fm_en ? (r_trans_num == r_tx_num) : 1'b0);

//===============================================
// spim fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						SPIM_IDLE = 8'b00000001;
localparam						SPIM_TLS = 8'b00000010;
localparam						SPIM_DP_TRANS = 8'b00000100;
localparam						SPIM_SP_TRANS = 8'b00001000;
localparam						SPIM_PENDING = 8'b00010000;
localparam						SPIM_TLE = 8'b00100000;
localparam						SPIM_TI = 8'b01000000;
localparam						SPIM_END = 8'b10000000;

reg				[ 7:0]			current_state;
reg				[ 7:0]			next_state;

wire							spim_state_idle;
wire							spim_state_tls;
wire							spim_state_dp_trans;
wire							spim_state_sp_trans;
wire							spim_state_tle;
wire							spim_state_ti;
wire							spim_state_pending;
wire							spim_state_end;
wire							spim_state_idle_to_tls;
wire							spim_state_idle_to_dp_trans;
wire							spim_state_idle_to_sp_trans;
wire							spim_state_tls_to_dp_trans;
wire							spim_state_tls_to_sp_trans;
wire							spim_state_dp_trans_to_tle;
wire							spim_state_dp_trans_to_ti;
wire							spim_state_dp_trans_to_end;
wire							spim_state_dp_trans_to_pending;
wire							spim_state_sp_trans_to_tle;
wire							spim_state_sp_trans_to_ti;
wire							spim_state_sp_trans_to_end;
wire							spim_state_sp_trans_to_pending;
wire							spim_state_pending_to_sp_trans;
wire							spim_state_pending_to_dp_trans;
wire							spim_state_tle_to_ti;
wire							spim_state_tle_to_end;
wire							spim_state_ti_to_end;
wire							spim_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		current_state <= SPIM_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// SPIM_IDLE:
// -> SPIM_TLS: received enable with tls
// -> SPIM_SP_TRANS: received enable in simplex mode without tls
// -> SPIM_DP_TRANS: received enable in duplex mode without tls
// SPIM_TLS:
// -> SPIM_SP_TRANS: tls bit ended in simplex mode
// -> SPIM_DP_TRANS: tls bit ended in duplex mode
// SPIM_DP_TRANS:
// -> SPIM_TLE: data bits ended with tle
// -> SPIM_TI: data bits ended with ti
// -> SPIM_PENDING: trans pause due to tx fifo underflow or rx fifo overflow
// -> SPIM_END: data bits ended without tle & ti
// SPIM_SP_TRANS:
// -> SPIM_TLE: data bits ended with tle
// -> SPIM_TI: data bits ended with ti
// -> SPIM_PENDING: trans pause due to tx fifo underflow or rx fifo overflow
// -> SPIM_END: data bits ended without tle & ti
// SPIM_TLS:
// -> SPIM_TI: tle bit ended with ti
// -> SPIM_END: tle bit ended without ti
// SPIM_TI: 
// -> SPIM_END: interval bits ended
// SPIM_END: 
// -> SPIM_IDLE: prepare for deinit (reserved)
// All state should transition to TX_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
		SPIM_IDLE:
			if(spim_state_idle_to_tls)
				next_state = SPIM_TLS;
			else if(spim_state_idle_to_sp_trans)
				next_state = SPIM_SP_TRANS;
			else if(spim_state_idle_to_dp_trans)
				next_state = SPIM_DP_TRANS;
			else
				next_state = SPIM_IDLE;
		SPIM_TLS:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_tls_to_sp_trans)
				next_state = SPIM_SP_TRANS;
			else if(spim_state_tls_to_dp_trans)
				next_state = SPIM_DP_TRANS;
			else
				next_state = SPIM_TLS;
		SPIM_DP_TRANS:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_dp_trans_to_tle)
				next_state = SPIM_TLE;
			else if(spim_state_dp_trans_to_ti)
				next_state = SPIM_TI;
			else if(spim_state_dp_trans_to_pending)
				next_state = SPIM_PENDING;
			else if(spim_state_dp_trans_to_end)
				next_state = SPIM_END;
			else
				next_state = SPIM_DP_TRANS;
		SPIM_SP_TRANS:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_sp_trans_to_tle)
				next_state = SPIM_TLE;
			else if(spim_state_sp_trans_to_ti)
				next_state = SPIM_TI;
			else if(spim_state_sp_trans_to_pending)
				next_state = SPIM_PENDING;
			else if(spim_state_sp_trans_to_end)
				next_state = SPIM_END;
			else
				next_state = SPIM_SP_TRANS;
		SPIM_PENDING:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_pending_to_sp_trans)
				next_state = SPIM_SP_TRANS;
			else if(spim_state_pending_to_dp_trans)
				next_state = SPIM_DP_TRANS;
			else
				next_state = SPIM_PENDING;
		SPIM_TLE:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_tle_to_ti)
				next_state = SPIM_TI;
			else if(spim_state_tle_to_end)
				next_state = SPIM_END;
			else
				next_state = SPIM_TLE;
		SPIM_TI:
			if(pe_trans_clear)
				next_state = SPIM_IDLE;
			else if(spim_state_ti_to_end)
				next_state = SPIM_END;
			else
				next_state = SPIM_TI;
		SPIM_END:
			if(spim_state_end_to_idle)
				next_state = SPIM_IDLE;
			else
				next_state = SPIM_END;
		default:
			next_state = SPIM_IDLE;
	endcase
end

// state output: combinational logic circuit
assign spim_state_idle = current_state == SPIM_IDLE;
assign spim_state_tls = current_state == SPIM_TLS;
assign spim_state_dp_trans = current_state == SPIM_DP_TRANS;
assign spim_state_sp_trans = current_state == SPIM_SP_TRANS;
assign spim_state_pending = current_state == SPIM_PENDING;
assign spim_state_tle = current_state == SPIM_TLE;
assign spim_state_ti = current_state == SPIM_TI;
assign spim_state_end = current_state== SPIM_END;

//===============================================
// spim tx bit timing base
// operating when spim tx fsm running
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 sdr flag 
// 0           1           0           1          bit flag
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 clkdiv start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 clkdiv end
// 1  1  1  1  0  0  0  0  1  1  1  1  0  0  0  0 sdr start
// 0  0  0  0  1  1  1  1  0  0  0  0  1  1  1  1 sdr end
// 1  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0 bit start
// 0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1 bit end
//===============================================

reg				[7:0]			clkdiv_cnt;// the smallest unit of timing base
reg				[1:0]			sdr_ddr_cnt;// this unit is composed of clkdiv_cnt
wire							timing_base_enable;
wire							clkdiv_flag_start;// indicate a bit start
wire							clkdiv_flag_end;// indicate a bit end
wire							sdr_ddr_flag_start;// indicate a oversampling point start
wire							sdr_ddr_flag_end;// indicate a oversampling point end
wire			[8:0] 			sdr_cnt;
wire			[8:0] 			sdr_cnt_threshold;
wire							bit_start;// indicate a data bit start when the first clkdiv unit is meeting first oversampling unit
wire							bit_half;
										// only sustaining 1 clk
wire							bit_end;// indicate a data bit end when the last clkdiv unit is meeting last oversampling unit
										// only sustaining 1 clk
wire							first_bit_end;
wire							bit_value_sample_point;// indicate bit value sampling time point
assign timing_base_enable = |current_state[7:1] || (pe_trans_enable && spim_state_idle);
assign clkdiv_flag_start = (clkdiv_cnt == 1'b0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == (r_clkdiv - 1'b1)) ? 1'b1 : 1'b0;
assign sdr_ddr_flag_start = (sdr_ddr_cnt == 1'b0) ? 1'b1 : 1'b0;
assign sdr_ddr_flag_end = (sdr_ddr_cnt == 2'h1) ? 1'b1 : 1'b0;
assign bit_end = sdr_ddr_flag_end && clkdiv_flag_end; // only sustaining 1 clock
//assign bit_value_sample_point = clkdiv_cnt == (r_clkdiv[7:1] - 1'b1) && timing_base_enable;
assign bit_value_sample_point = (sdr_ddr_cnt == 2'h1) && timing_base_enable;

// div cnt for clkdiv
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		clkdiv_cnt <= 8'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			clkdiv_cnt <= 8'h0;
		end
		else
		begin
			clkdiv_cnt <= clkdiv_cnt + 1'b1;
		end
	end
	else
	begin
		clkdiv_cnt <= 8'h0;
	end
end

// oversampling cnt for oversampling point
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		sdr_ddr_cnt <= 2'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			if(sdr_ddr_flag_end == 1'b1)
			begin
				sdr_ddr_cnt <= 2'h0;
			end
			else
			begin
				sdr_ddr_cnt <= sdr_ddr_cnt + 1'b1;
			end
		end
	end
	else
	begin
		sdr_ddr_cnt <= 2'h0;
	end
end

// clock generation
wire								clk_gen;// 50% duty cycle clock
										// clock low: shift data
										// clock high: sample data
assign clk_gen = spim_state_dp_trans && ((r_clkdiv > 8'h1) ? clkdiv_flag_end : sdr_ddr_flag_start);

//===============================================
// spim state: SPIM_IDLE
//===============================================

assign spim_state_idle_to_tls = bit_end && spim_state_idle && tx_data_preloaded && ~rx_fifo_full && |r_tls;
assign spim_state_idle_to_dp_trans = bit_end && spim_state_idle && tx_data_preloaded && ~rx_fifo_full && duplex_mode && ~(|r_tls);
//assign spim_state_idle_to_sp_trans = bit_end && spim_state_idle && tx_data_preloaded && ~rx_fifo_full && simplex_mode && ~(|r_tls);

//===============================================
// spim state: SPIM_TLS
//===============================================

reg				[ 3:0]			tls_bit_cnt;
reg								tls_bit_end;// last tls bit
assign spim_state_tls_to_dp_trans = bit_end && spim_state_tls && duplex_mode && (tls_bit_cnt == r_tls);
//assign spim_state_tls_to_sp_trans = bit_end && spim_state_tls && simplex_mode && (tls_bit_cnt == r_tls);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tls_bit_cnt <= 4'b0;
		tls_bit_end <= 1'b0;
	end
	else if(spim_state_dp_trans || spim_state_sp_trans || pe_trans_clear) // clear tls cnt when is in next state
	begin
		tls_bit_cnt <= 4'b0;
		tls_bit_end <= 1'b0;
	end
	else if(spim_state_tls && bit_end) // other tls bit
	begin
		if(tls_bit_cnt == r_tls) // tls bit end
		begin
			tls_bit_end <= 1'b1;
			tls_bit_cnt <= tls_bit_cnt;
		end
		else
		begin
			tls_bit_end <= 1'b0;
			tls_bit_cnt <= tls_bit_cnt + 1'b1;
		end
	end
	else if(spim_state_idle_to_tls) // (timing clk issue) first tls bit
	begin
		tls_bit_cnt <= tls_bit_cnt + 1'b1;
		tls_bit_end <= 1'b0;
	end
	else
	begin
		tls_bit_cnt <= tls_bit_cnt;
		tls_bit_end <= tls_bit_end;
	end
end

//===============================================
// spim state: SPIM_DP_TRANS
//===============================================

reg				[ 2:0]			dp_tx_data_bit_cnt;
reg								dp_tx_data_bit_end;// last data bit
reg				[ 7:0]			dp_tx_data_byte_cnt;
reg								dp_tx_data_byte_end;// last data bit
assign spim_state_dp_trans_to_tle = bit_end && spim_state_dp_trans && dp_tx_data_byte_predone && |r_tle;
assign spim_state_dp_trans_to_ti = bit_end && spim_state_dp_trans && dp_tx_data_byte_predone && |r_ti;
assign spim_state_dp_trans_to_end = bit_end && spim_state_dp_trans && dp_tx_data_byte_predone;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_tx_data_bit_cnt <= 3'b0;
		dp_tx_data_bit_end <= 1'b0;
	end
	// cannot use spim_state_pending, otherwise the first cnt is wrong
//	else if(spim_state_end || spim_state_pending || pe_trans_clear) // clear dp_tx_data cnt when is in next state
	else if(spim_state_end || spim_state_dp_trans_to_pending || pe_trans_clear) // clear dp_tx_data cnt when is in next state
	begin
		dp_tx_data_bit_cnt <= 3'b0;
		dp_tx_data_bit_end <= 1'b0;
	end
	else if(spim_state_dp_trans && bit_end) // other dp_tx_data bit
	begin
		if(dp_tx_data_bit_cnt == 3'h7) // dp_tx_data bit end
		begin
			dp_tx_data_bit_end <= 1'b1;
			dp_tx_data_bit_cnt <= 4'b0;
		end
		else
		begin
			dp_tx_data_bit_end <= 1'b0;
			dp_tx_data_bit_cnt <= dp_tx_data_bit_cnt + 1'b1;
		end
	end
	else if(spim_state_tls_to_dp_trans || spim_state_idle_to_dp_trans || spim_state_pending_to_dp_trans) // (timing clk issue) first dp_tx_data bit
	begin
		dp_tx_data_bit_cnt <= dp_tx_data_bit_cnt + 1'b1;
		dp_tx_data_bit_end <= 1'b0;
	end
	else
	begin
		dp_tx_data_bit_cnt <= dp_tx_data_bit_cnt;
		dp_tx_data_bit_end <= dp_tx_data_bit_end;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_tx_data_byte_cnt <= 4'b0;
		dp_tx_data_byte_end <= 1'b0;
	end
	else if(spim_state_end || pe_trans_logic_clr) // clear dp_tx_data cnt when is in last state
	begin
		dp_tx_data_byte_cnt <= 4'b0;
		dp_tx_data_byte_end <= 1'b0;
	end
	else if(spim_state_dp_trans && bit_end && dp_tx_data_bit_end) 
	begin
		if(dp_tx_data_last_byte) // dp_tx_data byte end
		begin
			dp_tx_data_byte_end <= 1'b1;
			dp_tx_data_byte_cnt <= dp_tx_data_byte_cnt;
		end
		else
		begin
			dp_tx_data_byte_end <= 1'b0;
			dp_tx_data_byte_cnt <= dp_tx_data_byte_cnt + 1'b1;
		end
	end
	else
	begin
		dp_tx_data_byte_cnt <= dp_tx_data_byte_cnt;
		dp_tx_data_byte_end <= dp_tx_data_byte_end;
	end
end

assign dp_tx_data_last_byte = (dp_tx_data_byte_cnt == (r_trans_num - 1'b1));// in order to avoid transferring to pending state
assign dp_tx_data_byte_predone = (dp_tx_data_last_byte && ~(|dp_tx_data_bit_cnt)) || dp_tx_data_byte_end; 


always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_tx_waiting_for_rx <= 1'b0;
	end
	else if(rx_num_is_more && (dp_tx_data_byte_cnt >= (r_tx_num - 1'b1)))
	begin
		dp_tx_waiting_for_rx <= 1'b1;
	end
	else
	begin
		dp_tx_waiting_for_rx <= 1'b0;
	end
end

reg				[ 3:0]			dp_rx_data_bit_cnt;
reg								dp_rx_data_bit_end;// last data bit
reg				[ 7:0]			dp_rx_data_byte_cnt;
reg								dp_rx_data_byte_end;// last data bit
assign dp_rx_data_last_byte = (dp_rx_data_byte_cnt == (r_trans_num - 1'b1));// in order to avoid transferring to pending state

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_rx_data_bit_cnt <= 4'b0;
		dp_rx_data_bit_end <= 1'b0;
	end
	// cannot use spim_state_pending, otherwise the first cnt is wrong
//	else if(spim_state_end || spim_state_pending || pe_trans_clear) // clear dp_rx_data cnt when is in next state
	else if(spim_state_idle || (spim_state_pending && bit_end) || pe_trans_clear) // clear dp_rx_data cnt when is in idle state
//	else if(spim_state_idle || (spim_state_pending && ~(|dp_rx_data_bit_cnt)) || pe_trans_clear) // clear dp_rx_data cnt when is in idle state
	begin
		dp_rx_data_bit_cnt <= 4'b0;
		dp_rx_data_bit_end <= 1'b0;
	end
	else if(spim_state_dp_trans && bit_end) // other dp_rx_data bit
	begin
		if(dp_rx_data_bit_cnt == 4'h7) // dp_rx_data bit end
		begin
			dp_rx_data_bit_end <= 1'b1;
			dp_rx_data_bit_cnt <= 4'b0;
		end
		else
		begin
			dp_rx_data_bit_end <= 1'b0;
			dp_rx_data_bit_cnt <= dp_rx_data_bit_cnt + 1'b1;
		end
	end

	else
	begin
		dp_rx_data_bit_cnt <= dp_rx_data_bit_cnt;
		dp_rx_data_bit_end <= dp_rx_data_bit_end;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_rx_data_byte_cnt <= 4'b0;
		dp_rx_data_byte_end <= 1'b0;
	end
	else if(spim_state_idle || pe_trans_logic_clr) // clear dp_rx_data cnt when is in idle state
	begin
		dp_rx_data_byte_cnt <= 4'b0;
		dp_rx_data_byte_end <= 1'b0;
	end
	else if(bit_end && dp_rx_data_bit_end) 
	begin
		if(dp_rx_data_last_byte) // dp_rx_data byte end
		begin
			dp_rx_data_byte_end <= 1'b1;
			dp_rx_data_byte_cnt <= dp_rx_data_byte_cnt;
		end
		else
		begin
			dp_rx_data_byte_end <= 1'b0;
			dp_rx_data_byte_cnt <= dp_rx_data_byte_cnt + 1'b1;
		end
	end
	else
	begin
		dp_rx_data_byte_cnt <= dp_rx_data_byte_cnt;
		dp_rx_data_byte_end <= dp_rx_data_byte_end;
	end
end

wire							spim_state_dp_trans_to_pending_waiting_for_tx;
wire							spim_state_dp_trans_to_pending_waiting_for_rx;
assign spim_state_dp_trans_to_pending = spim_state_dp_trans_to_pending_waiting_for_rx || spim_state_dp_trans_to_pending_waiting_for_tx;
assign spim_state_dp_trans_to_pending_waiting_for_tx = bit_end && spim_state_dp_trans && tx_fifo_empty && ~(|dp_tx_data_bit_cnt) && (dp_tx_data_byte_cnt != (r_trans_num - 1'b1)) && ~tx_data_loaded && ~dp_tx_waiting_for_rx;
assign spim_state_dp_trans_to_pending_waiting_for_rx = bit_end && spim_state_dp_trans && (rx_fifo_num == 5'hf) && ~(|dp_tx_data_bit_cnt) && (dp_tx_data_byte_cnt != (r_trans_num - 1'b1));

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		dp_rx_waiting_for_tx <= 1'b0;
	end
	else if(rx_num_is_more && (dp_tx_data_byte_cnt <= r_tx_num))
	begin
		dp_rx_waiting_for_tx <= 1'b1;
	end
	else
	begin
		dp_rx_waiting_for_tx <= 1'b0;
	end
end

//===============================================
// spim state: SPIM_PENDING
//===============================================

// If pending state is caused by rx fifo full when tx fifo is normal,
// the state will be transfering to trans state after rx fifo is not full,
// which tx data is loaded instead of preloaded.
assign spim_state_pending_to_dp_trans = bit_end && spim_state_pending && (tx_data_preloaded || tx_data_loaded) && duplex_mode && (r_rxm_real || ~rx_fifo_full) && (r_pause_enable ? trans_data_pending_continue : 1'b1);

//===============================================
// spim state: SPIM_TLE
//===============================================

reg				[ 3:0]			tle_bit_cnt;
reg								tle_bit_end;// last tle bit
assign spim_state_tle_to_ti = bit_end && spim_state_tle && (tle_bit_cnt == r_tle) && |r_ti;
assign spim_state_tle_to_end = bit_end && spim_state_tle && (tle_bit_cnt == r_tle);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tle_bit_cnt <= 4'b0;
		tle_bit_end <= 1'b0;
	end
	else if(spim_state_end || pe_trans_clear) // clear tle cnt when is in next state
	begin
		tle_bit_cnt <= 4'b0;
		tle_bit_end <= 1'b0;
	end
	else if(spim_state_tle && bit_end) // other tle bit
	begin
		if(tle_bit_cnt == r_tle) // tle bit end
		begin
			tle_bit_end <= 1'b1;
			tle_bit_cnt <= tle_bit_cnt;
		end
		else
		begin
			tle_bit_end <= 1'b0;
			tle_bit_cnt <= tle_bit_cnt + 1'b1;
		end
	end
	else if(spim_state_dp_trans_to_tle || spim_state_sp_trans_to_tle) // (timing clk issue) first tle bit
	begin
		tle_bit_cnt <= tle_bit_cnt + 1'b1;
		tle_bit_end <= 1'b0;
	end
	else
	begin
		tle_bit_cnt <= tle_bit_cnt;
		tle_bit_end <= tle_bit_end;
	end
end

//===============================================
// spim state: SPIM_TI
//===============================================

reg				[ 3:0]			ti_bit_cnt;
reg								ti_bit_end;// last ti bit
assign spim_state_ti_to_end = bit_end && spim_state_ti && (ti_bit_cnt == r_ti);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		ti_bit_cnt <= 4'b0;
		ti_bit_end <= 1'b0;
	end
	else if(spim_state_end || pe_trans_clear) // clear ti cnt when is in next state
	begin
		ti_bit_cnt <= 4'b0;
		ti_bit_end <= 1'b0;
	end
	else if(spim_state_ti && bit_end) // other ti bit
	begin
		if(ti_bit_cnt == r_ti) // ti bit end
		begin
			ti_bit_end <= 1'b1;
			ti_bit_cnt <= ti_bit_cnt;
		end
		else
		begin
			ti_bit_end <= 1'b0;
			ti_bit_cnt <= ti_bit_cnt + 1'b1;
		end
	end
	else if(spim_state_dp_trans_to_ti || spim_state_sp_trans_to_ti || spim_state_tle_to_ti) // (timing clk issue) first ti bit
	begin
		ti_bit_cnt <= ti_bit_cnt + 1'b1;
		ti_bit_end <= 1'b0;
	end
	else
	begin
		ti_bit_cnt <= ti_bit_cnt;
		ti_bit_end <= ti_bit_end;
	end
end

//===============================================
// spim state: SPIM_END
// this state is used to handle some unfinish issue
//===============================================

reg								trans_end;
assign spim_state_end_to_idle = trans_end;
assign pe_trans_end = trans_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		trans_end <= 1'b0;
	// waiting until all rx data is done
	else if(spim_state_end && dp_rx_data_byte_end)
		trans_end <= 1'b1;
	else
		trans_end <= 1'b0;
end

//===============================================
// reserve state
//===============================================

assign spim_state_sp_trans_to_pending = 1'b0;
assign spim_state_sp_trans_to_tle = 1'b0;
assign spim_state_sp_trans_to_ti = 1'b0;
assign spim_state_sp_trans_to_end = 1'b0;
assign spim_state_pending_to_sp_trans = 1'b0;
assign spim_state_idle_to_sp_trans = 1'b0;
assign spim_state_tls_to_sp_trans = 1'b0;

//===============================================
// spim trans data pending handle
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		trans_data_pending_continue <= 1'b0;
	end
	else if(r_pause_continue)
	begin
		trans_data_pending_continue <= 1'b1;
	end
	else if(spim_state_pending_to_dp_trans || spim_state_pending_to_sp_trans)
	begin
		trans_data_pending_continue <= 1'b0;
	end
	else
	begin
		trans_data_pending_continue <= trans_data_pending_continue;
	end
end

//===============================================
// spim tx data prepare
// truncating tx data first and then calculating parity bit
//===============================================

reg				[ 7:0]			tx_data;// last bit is used to park data ptr
reg								tx_fifo_re_for_preloading;
reg								tx_fifo_re_for_loading;
assign tx_fifo_re = tx_fifo_re_for_preloading || tx_fifo_re_for_loading;

// preload data from tx fifo
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tx_fifo_re_for_preloading <= 1'b0;
		tx_data_preloaded <= 1'b0;
	end
	else if(pe_trans_clear)
	begin
		tx_fifo_re_for_preloading <= 1'b0;
		tx_data_preloaded <= 1'b0;
	end
	else if(r_txm || dp_tx_waiting_for_rx)
	begin
		tx_fifo_re_for_preloading <= 1'b0;
		tx_data_preloaded <= 1'b1;
	end
	// Data preloading is only performed in case of tx fifo empty or data
	// preload before transferring.
	// If pending state is only result of rx fifo full when tx is normal,
	// no data preloading will occur.
	else if((spim_state_idle || spim_state_pending) && ~tx_data_preloaded && ~tx_fifo_empty && ~tx_data_loaded)
	begin
		tx_fifo_re_for_preloading <= 1'b1;
		tx_data_preloaded <= 1'b1;
	end
	else if(spim_state_dp_trans || spim_state_sp_trans)
	begin
		tx_fifo_re_for_preloading <= 1'b0;
		tx_data_preloaded <= 1'b0;
	end
	else
	begin
		tx_fifo_re_for_preloading <= 1'b0;
		tx_data_preloaded <= tx_data_preloaded;
	end
end

// load data from tx fifo when transferring
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tx_fifo_re_for_loading <= 1'b0;
		tx_data_loaded <= 1'b0;
	end
	else if(pe_trans_clear)
	begin
		tx_fifo_re_for_loading <= 1'b0;
		tx_data_loaded <= 1'b0;
	end
	else if(r_txm || dp_tx_waiting_for_rx)
	begin
		tx_fifo_re_for_loading <= 1'b0;
		tx_data_loaded <= 1'b1;
	end
	else if((spim_state_dp_trans || spim_state_sp_trans) && ~tx_data_loaded && ~tx_fifo_empty && dp_tx_data_bit_end && ~bit_end && ~dp_tx_data_last_byte)
	begin
		tx_fifo_re_for_loading <= 1'b1;
		tx_data_loaded <= 1'b1;
	end
	else if(|dp_tx_data_bit_cnt)
	begin
		tx_fifo_re_for_loading <= 1'b0;
		tx_data_loaded <= 1'b0;
	end
	else
	begin
		tx_fifo_re_for_loading <= 1'b0;
		tx_data_loaded <= tx_data_loaded;
	end
end

// load data from tx fifo
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tx_data <= 8'h0;
	end
	else if(pe_trans_clear || r_txm || (dp_tx_waiting_for_rx && dp_tx_data_bit_end))
	begin
		tx_data <= 8'h0;
	end
	// Data preloading is only performed in case of tx fifo empty or data
	// preload before transferring.
	// If pending state is only result of rx fifo full when tx is normal,
	// no data preloading will occur.
	else if((spim_state_idle || spim_state_pending) && ~tx_data_preloaded && ~tx_data_loaded && ~tx_fifo_empty)
	begin
		tx_data <= tx_fifo_data;
	end
	else if((spim_state_dp_trans || spim_state_sp_trans) && ~tx_data_loaded && ~tx_fifo_empty && dp_tx_data_bit_end && ~bit_end)
	begin
		tx_data <= tx_fifo_data;
	end
	else
	begin
		tx_data <= tx_data;
	end
end

//===============================================
// spim rx data prepare
//===============================================

reg				[ 8:0]			rx_data;// last bit is used to park data ptr
reg								rx_data_loaded;

// push data into rx fifo
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= 8'h0;
		rx_data_loaded <= 1'b0;
	end
	else if(pe_trans_clear || spim_state_end_to_idle || |dp_rx_data_bit_cnt || r_rxm_real || dp_rx_waiting_for_tx)
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= 8'h0;
		rx_data_loaded <= 1'b0;
	end
	else if(dp_rx_data_bit_end && (rx_data_loaded == 1'b0))// Data should not saved until frame ends.
	begin
		rx_fifo_we <= 1'b1;
		rx_fifo_data <= rx_data[7:0];
		rx_data_loaded <= 1'b1;// in case of rx_state last more than 1 clk unexpected and then read data more from rx fifo
	end
	else
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= 8'h0;
		rx_data_loaded <= rx_data_loaded;
	end
end

//===============================================
// pin mux
// default state:
// tx high
// tx disable
//===============================================

reg								spim_dp_mosi_o;
reg								spim_dp_mosi_oen;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		spim_dp_mosi_o <= 1'b0;
		spim_dp_mosi_oen <= 1'b1;
	end
	// current state inside: END
	else if(spim_state_end || pe_trans_clear || r_txm)
	begin
		spim_dp_mosi_o <= 1'b0;
		spim_dp_mosi_oen <= 1'b1;
	end
	else if(bit_end)
	begin
		// the order is critical, cannot be changed randomly
		if(spim_state_tle_to_ti || spim_state_tle_to_end || spim_state_ti_to_end)
		begin
			spim_dp_mosi_o <= 1'b0;
			spim_dp_mosi_oen <= 1'b1;
		end
		else if(spim_state_dp_trans_to_tle || spim_state_dp_trans_to_ti || spim_state_dp_trans_to_end)
		begin
			spim_dp_mosi_o <= 1'b0;
			spim_dp_mosi_oen <= 1'b1;
		end
		else if(spim_state_pending_to_dp_trans)
		begin
			spim_dp_mosi_o <= tx_data[dp_tx_data_bit_cnt];
			spim_dp_mosi_oen <= 1'b0;
		end
		else if(spim_state_dp_trans_to_pending || spim_state_dp_trans_to_ti || spim_state_dp_trans_to_end)
		begin
			spim_dp_mosi_o <= 1'b0;
			spim_dp_mosi_oen <= 1'b1;
		end
		else if(spim_state_idle_to_dp_trans || spim_state_tls_to_dp_trans || spim_state_dp_trans)
		begin
			spim_dp_mosi_o <= tx_data[dp_tx_data_bit_cnt];
			spim_dp_mosi_oen <= 1'b0;
		end
		else if(spim_state_idle_to_tls)
		begin
			spim_dp_mosi_o <= 1'b0;
			spim_dp_mosi_oen <= 1'b0;
		end
		else
		begin
			// in case of unexpected occurs accidently
			spim_dp_mosi_o <= 1'b0;			
			spim_dp_mosi_oen <= 1'b1;
		end
	end
	else
	begin
		spim_dp_mosi_o <= spim_dp_mosi_o;
		spim_dp_mosi_oen <= spim_dp_mosi_oen;
	end
end

reg								spim_dp_cs_o;
reg								spim_dp_cs_oen;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		spim_dp_cs_o <= 1'b1;
		spim_dp_cs_oen <= 1'b1;
	end
	// current state inside: END
	else if(spim_state_end || pe_trans_clear)
	begin
		spim_dp_cs_o <= 1'b1;
		spim_dp_cs_oen <= 1'b0;
	end
	else if(bit_end)
	begin
		// the order is critical, cannot be changed randomly
		if(spim_state_dp_trans_to_tle || spim_state_pending_to_dp_trans || spim_state_dp_trans_to_pending || spim_state_idle_to_dp_trans || spim_state_tls_to_dp_trans || spim_state_idle_to_tls || spim_state_dp_trans || spim_state_pending || spim_state_tls || spim_state_tle)
		begin
			spim_dp_cs_o <= 1'b0;
			spim_dp_cs_oen <= 1'b0;
		end
		else if(spim_state_tle_to_ti || spim_state_tle_to_end || spim_state_ti_to_end || spim_state_dp_trans_to_ti || spim_state_dp_trans_to_end)
		begin
			spim_dp_cs_o <= 1'b1;
			spim_dp_cs_oen <= 1'b0;
		end
		else
		begin
			// in case of unexpected occurs accidently
			spim_dp_cs_o <= 1'b1;			
			spim_dp_cs_oen <= 1'b0;
		end
	end
	else
	begin
		spim_dp_cs_o <= spim_dp_cs_o;
		spim_dp_cs_oen <= spim_dp_cs_oen;
	end
end

//===============================================
// pin control
// default state:
// tx high
// tx disable
// rx low
// rx disable
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		spim_sck <= 1'b0;
		spim_sck_oen <= 1'b1;
	end
	else if(spim_state_idle || spim_state_tls || spim_state_tle || spim_state_ti || spim_state_end)
	begin
		spim_sck <= r_mode[1];
		spim_sck_oen <= 1'b1;
	end
	else if(duplex_mode)
	begin
		if(r_mode[0] ^ r_mode[1])
		begin
			spim_sck <= sdr_ddr_flag_start && spim_state_dp_trans;
		end
		else
		begin
			spim_sck <= sdr_ddr_flag_end && spim_state_dp_trans;
		end
		spim_sck_oen <= 1'b0;
	end
	else
	begin
		spim_sck <= spim_sck;
		spim_sck_oen <= spim_sck_oen;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		spim_mosi_o <= 1'b0;
		spim_mosi_oen <= 1'b1;
	end
	else if(duplex_mode)
	begin
		spim_mosi_o <= spim_dp_mosi_o;
		spim_mosi_oen <= spim_dp_mosi_oen;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		spim_cs_o <= 1'b0;
		spim_cs_oen <= 1'b1;
	end
	else if(duplex_mode)
	begin
		spim_cs_o <= spim_dp_cs_o;
		spim_cs_oen <= spim_dp_cs_oen;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		rx_data <= 9'h0;
		spim_miso_oen <= 1'b0;
	end
		// current state inside: END
	else if(spim_state_end || pe_trans_clear)
	begin
		rx_data <= 9'h0;
		spim_miso_oen <= 1'b0;
	end
	// the order is critical, cannot be changed randomly
	else if(bit_value_sample_point)
	begin
		if(spim_state_dp_trans)
		begin
			rx_data[dp_rx_data_bit_cnt] <= spim_miso_i;// bit cnt is start at 1
//			rx_data[(dp_rx_data_bit_cnt - 1'b1)] <= spim_miso;// bit cnt is start at 1
			spim_miso_oen <= 1'b1;
		end
		else
		begin
			// in case of unexpected occurs accidently
			rx_data <= 9'h0;
			spim_miso_oen <= 1'b0;
		end
	end
	else
	begin
		rx_data <= rx_data;
		spim_miso_oen <= 1'b0;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_trans_pending = spim_state_pending; 
assign int_status_trans_done = spim_state_end; 

endmodule


//===============================================
//
//	File: uart_pe_rx.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12072023
//	Version: v1.0
//
// 	This is rx protocol engine for uart.
//
//===============================================

module uart_pe_rx
(
	input  						pe_clk,  
	input  						pe_rstn,

	// pin
	input						uart_rx,
	output reg					uart_rx_oen,

	// data
	output reg					fifo_we,
	output reg	[ 9:0]			fifo_data,
	input		[ 4:0]			fifo_num,

	// control
	input						pe_rx_logic_clr,
	input						pe_rx_enable,
	output 						pe_rx_end,

	// config
	input		[ 3:0]			r_oversampling,
	input		[11:0]			r_clkdiv,
	input 		[ 3:0]			r_interval_bit,
	input						r_error_ignore,
	input 						r_rts,
	input 						r_cts,
	input 		[ 1:0]			r_stop_bit,
	input 						r_parity_en,
	input 		[ 1:0]			r_parity,
	input 		[ 3:0]			r_data_bit,

	// interrupt status
	output						int_status_rx_parity_error,
	output						int_status_rx_stop_error,
	output						int_status_rx_stop_detect,
	output						int_status_rx_noise_detect
);

wire							uart_rx_f;
wire							uart_rx_r;
reg								rx_noise_detect;

//===============================================
// uart rx fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						RX_IDLE = 6'b000001;
localparam						RX_START = 6'b000010;
localparam						RX_DATA = 6'b000100;
localparam						RX_PARITY = 6'b001000;
localparam						RX_STOP = 6'b010000;
localparam						RX_END = 6'b100000;

reg				[ 5:0]			current_state;
reg				[ 5:0]			next_state;

wire							rx_state_idle;
wire							rx_state_start;
wire							rx_state_data;
wire							rx_state_parity;
wire							rx_state_stop;
wire							rx_state_end;
wire							rx_state_start_to_data;
wire							rx_state_start_to_idle;
wire							rx_state_data_to_parity;
wire							rx_state_data_to_stop;
wire							rx_state_parity_to_stop;
wire							rx_state_stop_to_end;
wire							rx_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		current_state <= RX_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// RX_IDLE:
// -> RX_START: received rx enable (falling edge)
// RX_START:
// -> RX_DATA: start bit ended
// -> RX_IDLE: filter operated
// RX_DATA:
// -> RX_PARITY: data bits ended and enable parity bit
// -> RX_STOP: data bits ended but parity bit is disable
// RX_PARITY:
// -> RX_STOP: parity bit ended
// RX_STOP:
// -> RX_END:  stop bit half ended
// RX_END: 
// -> RX_IDLE: prepare for deinit (put data into rx fifo)
// All state should transition to RX_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	RX_IDLE:
		if(uart_rx_f)
			next_state = RX_START;
		else
			next_state = RX_IDLE;
	RX_START:
		if(pe_rx_logic_clr)
			next_state = RX_IDLE;
		else if(rx_state_start_to_idle)
			next_state = RX_IDLE;
		else if(rx_state_start_to_data)
			next_state = RX_DATA;
		else
			next_state = RX_START;
	RX_DATA:
		if(pe_rx_logic_clr)
			next_state = RX_IDLE;
		else if(rx_state_data_to_stop)
			next_state = RX_STOP;
		else if(rx_state_data_to_parity)
			next_state = RX_PARITY;
		else
			next_state = RX_DATA;
	RX_PARITY:
		if(pe_rx_logic_clr)
			next_state = RX_IDLE;
		else if(rx_state_parity_to_stop)
			next_state = RX_STOP;
		else
			next_state = RX_PARITY;
	RX_STOP:
		if(pe_rx_logic_clr)
			next_state = RX_IDLE;
		else if(rx_state_stop_to_end)
			next_state = RX_END;
		else
			next_state = RX_STOP;
	RX_END:
		if(pe_rx_logic_clr)
			next_state = RX_IDLE;
		else if(rx_state_end_to_idle)
			next_state = RX_IDLE;
		else
			next_state = RX_END;
	default:
		next_state = RX_IDLE;
	endcase
end

// state output: combinational logic circuit
assign rx_state_idle = current_state == RX_IDLE;
assign rx_state_start = current_state == RX_START;
assign rx_state_data = current_state == RX_DATA;
assign rx_state_parity = current_state == RX_PARITY;
assign rx_state_stop = current_state == RX_STOP;
assign rx_state_end = current_state == RX_END;

//===============================================
// uart rx bit timing base
// operating when uart rx fsm running
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 oversampling flag 
// 0           1           2           3          bit flag
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 clkdiv start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 clkdiv end
// 1  1  1  1  0  0  0  0  0  0  0  0  0  0  0  0 os start
// 0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1 os end
// 1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 bit start
// 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1 bit end
//===============================================

reg				[11:0]			clkdiv_cnt;// the smallest unit of timing base
reg				[3:0]			oversampling_cnt;// this unit is composed of clkdiv_cnt
wire							timing_base_enable;
wire							clkdiv_flag_start;// indicate a bit start
wire							clkdiv_flag_end;// indicate a bit end
wire							oversampling_flag_start;// indicate a oversampling point start
wire							oversampling_flag_end;// indicate a oversampling point end
wire							bit_start;// indicate a data bit start when the first clkdiv unit is meeting first oversampling unit
										// only sustaining 1 clk
wire							bit_end;// indicate a data bit end when the last clkdiv unit is meeting last oversampling unit
reg								bit_value;// indicate bit value
wire							bit_value_sample_point;// indicate bit value sampling time point
wire							bit_value_sample_point_d;// In this timing, the bit value has been saved so that the next state can be determined.
										// only sustaining 1 clk
assign timing_base_enable = |current_state[4:1];
assign clkdiv_flag_start = (clkdiv_cnt == 1'b0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == (r_clkdiv - 1'b1)) ? 1'b1 : 1'b0;
assign oversampling_flag_start = (oversampling_cnt == 1'b0) ? 1'b1 : 1'b0;
assign oversampling_flag_end = (oversampling_cnt == (r_oversampling - 1'b1)) ? 1'b1 : 1'b0;
assign bit_end = oversampling_flag_end && clkdiv_flag_end; // only sustaining 1 clock
assign bit_value_sample_point = (oversampling_cnt == (r_oversampling >> 1'b1)) ? 1'b1 : 1'b0;

// div cnt for clkdiv
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		clkdiv_cnt <= 12'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			clkdiv_cnt <= 12'h0;
		end
		else
		begin
			clkdiv_cnt <= clkdiv_cnt + 1'b1;
		end
	end
	else
	begin
		clkdiv_cnt <= 12'h0;
	end
end

// oversampling cnt for oversampling point
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		oversampling_cnt <= 4'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			if(oversampling_flag_end == 1'b1)
			begin
				oversampling_cnt <= 4'h0;
			end
			else
			begin
				oversampling_cnt <= oversampling_cnt + 1'b1;
			end
		end
	end
	else
	begin
		oversampling_cnt <= 4'h0;
	end
end

sync_ff
#(
	.WIDTH						(1),
	.DEFAULT_VAL				(0)
)
u_sync_ff_inst0
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),	

	.A							(bit_value_sample_point),
	.Y							(bit_value_sample_point_d)
);

//===============================================
// uart rx state: RX_START
//===============================================

assign rx_state_start_to_idle = rx_noise_detect;
//assign rx_state_start_to_idle = bit_value_sample_point_d && bit_value && rx_state_start;
assign rx_state_start_to_data = bit_end && ~bit_value && rx_state_start;// If a start bit detect, waiting until the end of this bit.

//===============================================
// uart rx state: RX_DATA
//===============================================

reg				[ 3:0]			data_bit_cnt;
reg								data_bit_end;// last data bit
assign rx_state_data_to_parity = bit_end && rx_state_data && r_parity_en && (data_bit_cnt == r_data_bit);
assign rx_state_data_to_stop = bit_end && rx_state_data && ~r_parity_en && (data_bit_cnt == r_data_bit);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		data_bit_cnt <= 4'b0;
		data_bit_end <= 1'b0;
	end
	else if(rx_state_data && bit_end) // other data bit
	begin
		if(data_bit_cnt == r_data_bit) // data bit end
		begin
			data_bit_end <= 1'b1;
			data_bit_cnt <= data_bit_cnt;
		end
		else
		begin
			data_bit_end <= 1'b0;
			data_bit_cnt <= data_bit_cnt + 1'b1;
		end
	end
	else if(rx_state_start_to_data) // (timing clk issue) first data bit
	begin
		data_bit_cnt <= data_bit_cnt + 1'b1;
		data_bit_end <= 1'b0;
	end
	else if(rx_state_start) // clear data cnt when is in last state
	begin
		data_bit_cnt <= 4'b0;
		data_bit_end <= 1'b0;
	end
	else
	begin
		data_bit_cnt <= data_bit_cnt;
		data_bit_end <= data_bit_end;
	end
end

//===============================================
// uart rx state: RX_PARITY
//===============================================

assign rx_state_parity_to_stop = bit_end && rx_state_parity;

//===============================================
// uart rx state: RX_STOP
//===============================================

reg				[ 1:0]			stop_bit_cnt;
reg								stop_bit_end;// last data bit
assign rx_state_stop_to_end = (stop_bit_cnt == r_stop_bit) && bit_value_sample_point_d && rx_state_stop;// rx logic stop at middle of stop bit in order to wait for next data in advance

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		stop_bit_cnt <= 2'b0;
		stop_bit_end <= 1'b0;
	end
	else if(rx_state_stop && bit_end) // other stop bit
	begin
		if(stop_bit_cnt == r_stop_bit) // stop bit end
		begin
			stop_bit_cnt <= stop_bit_cnt;
			stop_bit_end <= 1'b1;
		end
		else
		begin
			stop_bit_cnt <= stop_bit_cnt + 1'b1;
			stop_bit_end <= 1'b0;
		end
	end
	else if(rx_state_parity_to_stop || rx_state_data_to_stop) // (timing clk issue) first stop bit (this must be before above)
	begin
		stop_bit_cnt <= stop_bit_cnt + 1'b1;
		stop_bit_end <= 1'b0;
	end
	else if(rx_state_data) // clear stop cnt when is in last state
	begin
		stop_bit_cnt <= 1'b0;
		stop_bit_end <= 1'b0;
	end
	else
	begin
		stop_bit_cnt <= stop_bit_cnt;
		stop_bit_end <= stop_bit_end;
	end
end

//===============================================
// uart rx state: RX_END
// this state is used to handle some unfinish issue
//===============================================

reg								rx_end;
assign rx_state_end_to_idle = rx_end;
assign pe_rx_end = rx_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_end <= 1'b0;
	else if(rx_state_end)
		rx_end <= 1'b1;
	else
		rx_end <= 1'b0;
end

//===============================================
// uart rx data process
// if an error detect, it will sustain until stop bit end.
// whether error data is discard or not, the judgement will happen in stop state
//===============================================

// rx start when a falling edge detected (only in rx idle state)
// filter logic is available
negedge_detect u_negedge_detect_inst0 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),
	.A							(uart_rx && pe_rx_enable && rx_state_idle),
	.Y							(uart_rx_f)
);

posedge_detect u_posedge_detect_inst0 
(
	.clk						(pe_clk),
	.rstn						(pe_rstn),
	.A							(uart_rx && pe_rx_enable && rx_state_start),
	.Y							(uart_rx_r)
);

wire							rx_start_bit_half_flag;
reg								rx_start_bit_half;
assign rx_start_bit_half_flag = rx_start_bit_half;

// A start bit should be 0. If 1 was detected, a dominant pulse should be filtered.
// noise detect operating only before the sample point of frame start bit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_start_bit_half <= 1'b1;
	else if(rx_state_start)
		if(bit_value_sample_point_d)
			rx_start_bit_half <= 1'b0;
		else if(rx_start_bit_half_flag == 1'b0)
			rx_start_bit_half <= 1'b0;
		else
			rx_start_bit_half <= 1'b1;
	else
		rx_start_bit_half <= 1'b1;
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_noise_detect <= 1'b0;
	else if(rx_state_start)
		if((rx_start_bit_half_flag == 1'b1) && uart_rx_r)
			rx_noise_detect <= 1'b1;
		else
			rx_noise_detect <= 1'b0;
	else
		rx_noise_detect <= 1'b0;
end

reg				[10:0]			rx_data;// last bit is used to park data ptr
reg								rx_data_loaded;
reg								rx_data_parity;
reg								rx_data_parity_error;
reg								rx_data_stop_error;
reg								rx_error;

// put data from rx fifo
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		fifo_we <= 1'b0;
		fifo_data <= 10'h0;
		rx_data_loaded <= 1'b1;
	end
	else if(rx_state_stop_to_end && (rx_data_loaded == 1'b0))// Data should not saved until frame ends.
	begin
		if((rx_error == 1'b1) && (r_error_ignore == 1'b0))// if error should not be ignored, the error data will not be put into fifo and be discarded
		begin
			fifo_we <= 1'b0;
			fifo_data <= 10'h0;
			rx_data_loaded <= 1'b0;	
		end
		else
		begin
			fifo_we <= 1'b1;
			fifo_data <= rx_data[9:0];
			rx_data_loaded <= 1'b1;// in case of rx_state last more than 1 clk unexpected and then read data more from rx fifo
		end
	end
	else if(rx_state_start)
	begin
		fifo_we <= 1'b0;
		fifo_data <= 10'h0;
		rx_data_loaded <= 1'b0;
	end
	else
	begin
		fifo_we <= 1'b0;
		fifo_data <= 10'h0;
		rx_data_loaded <= rx_data_loaded;
	end
end

// parity caculation
// only valid when enable parity bit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_data_parity <= 1'b0;
	else if(rx_state_data_to_parity)
		if(r_parity == 2'h0)
			rx_data_parity <= ^rx_data[9:0]; 
		else if(r_parity == 2'h1)
			rx_data_parity <= ~(^rx_data[9:0]); 
		else if(r_parity == 2'h2)
			rx_data_parity <= 1'b0; 
		else
			rx_data_parity <= 1'b1; 
	else
		rx_data_parity <= rx_data_parity;
end

// parity error will last to the end of parity state
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_data_parity_error <= 1'b0;
	else if(rx_state_parity)
		if(bit_value_sample_point_d && (bit_value != rx_data_parity))
			rx_data_parity_error <= 1'b1;
		else
			rx_data_parity_error <= rx_data_parity_error;
	else
		rx_data_parity_error <= 1'b0;
end

// stop error will last to the end of stop state
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_data_stop_error <= 1'b0;
	else if(rx_state_stop)
		if(bit_value_sample_point_d && (bit_value == 1'b0))
			rx_data_stop_error <= 1'b1;
		else
			rx_data_stop_error <= rx_data_stop_error;
	else
		rx_data_stop_error <= 1'b0;
end

// rx error status will last to the end of stop state
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		rx_error <= 1'b0;
	else if(rx_state_parity)
		if(rx_data_parity_error)
			rx_error <= 1'b1;
		else
			rx_error <= rx_error;
	else if(rx_state_stop)
		if(rx_data_stop_error)
			rx_error <= 1'b1;
		else
			rx_error <= rx_error;
	else
		rx_error <= 1'b0;
end

//===============================================
// pin control
// default state:
// rx high
// rx disable
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		bit_value <= 1'b1;
		rx_data <= 10'h0;
		uart_rx_oen <= 1'b1;
	end
	// the order is critical, cannot be changed randomly
	else if(bit_value_sample_point == 1'b1)
	begin
		// current state inside: RX_START
		if(rx_state_start)
		begin
			bit_value <= uart_rx;// filter issue
			uart_rx_oen <= 1'b1;
		end
		// current state inside: DATA PARITY STOP
		else if(rx_state_stop)
		begin
			bit_value <= uart_rx;// detect stop bit
			uart_rx_oen <= 1'b1;
		end
		else if(rx_state_parity)
		begin
			bit_value <= uart_rx;// detect parity bit
			uart_rx_oen <= 1'b1;
		end
		else if(rx_state_data)
		begin
			rx_data[(data_bit_cnt - 1'b1)] <= uart_rx;// bit cnt is start at 1
			uart_rx_oen <= 1'b1;
		end
		else
		begin
			// in case of unexpected occurs accidently
			bit_value <= 1'b1;
			rx_data <= 10'h0;
			uart_rx_oen <= 1'b1;
		end
	end
	// current state inside: END
	else if(rx_state_end)
	begin
		bit_value <= bit_value;
		rx_data <= rx_data;
		uart_rx_oen <= 1'b1;
	end
	// rx enable but no data detect
	else if(pe_rx_enable)
	begin
		bit_value <= bit_value;
		rx_data <= rx_data;
		uart_rx_oen <= 1'b1;
	end
	// rx disable
	else
	begin
		bit_value <= 1'b1;
		rx_data <= 10'h0;
		uart_rx_oen <= 1'b1;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_rx_parity_error = rx_data_parity_error; 
assign int_status_rx_stop_error = rx_data_stop_error; 
assign int_status_rx_stop_detect = fifo_we;// rx data valid 
assign int_status_rx_noise_detect = rx_state_start_to_idle;

endmodule


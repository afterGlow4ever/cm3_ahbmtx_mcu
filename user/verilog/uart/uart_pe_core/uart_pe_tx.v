//===============================================
//
//	File: uart_pe_tx.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is tx protocol engine for uart.
//
//===============================================

module uart_pe_tx
(
	input  						pe_clk,  
	input  						pe_rstn,

	// pin
	output reg					uart_tx,
	output reg					uart_tx_oen,

	// data
	output reg					fifo_re,
	input		[ 9:0]			fifo_data,
	input		[ 4:0]			fifo_num,

	// control
	input						pe_tx_logic_clr,
	input						pe_tx_enable,
	input						pe_tx_enable_r,
	output 						pe_tx_end,

	// config
	input		[ 3:0]			r_oversampling,
	input		[11:0]			r_clkdiv,
	input 		[ 3:0]			r_interval_bit,
	input 						r_rts,
	input 						r_cts,
	input 		[ 1:0]			r_stop_bit,
	input 						r_parity_en,
	input 		[ 1:0]			r_parity,
	input 		[ 3:0]			r_data_bit,

	output						int_status_tx_done
);

//===============================================
// uart tx fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						TX_IDLE = 7'b0000001;
localparam						TX_START = 7'b0000010;
localparam						TX_DATA = 7'b0000100;
localparam						TX_PARITY = 7'b0001000;
localparam						TX_STOP = 7'b0010000;
localparam						TX_INTERVAL = 7'b0100000;
localparam						TX_END = 7'b1000000;

reg				[ 6:0]			current_state;
reg				[ 6:0]			next_state;

wire							tx_state_idle;
wire							tx_state_start;
wire							tx_state_data;
wire							tx_state_parity;
wire							tx_state_stop;
wire							tx_state_interval;
wire							tx_state_end;
wire							tx_state_start_to_data;
wire							tx_state_data_to_parity;
wire							tx_state_data_to_stop;
wire							tx_state_parity_to_stop;
wire							tx_state_stop_to_start;
wire							tx_state_stop_to_interval;
wire							tx_state_stop_to_end;
wire							tx_state_interval_to_start;
wire							tx_state_interval_to_end;
wire							tx_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		current_state <= TX_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// TX_IDLE:
// -> TX_START: received tx enable
// TX_START:
// -> TX_DATA: start bit ended
// TX_DATA:
// -> TX_PARITY: data bits ended and enable parity bit
// -> TX_STOP: data bits ended but parity bit is disable
// TX_PARITY:
// -> TX_STOP: parity bit ended
// TX_STOP:
// -> TX_INTERVAL: stop bit ended and next data will be tx but should wait
// -> TX_START: stop bit ended and next data will be tx at once
// -> TX_END:  stop bit ended and no data are needed to tx
// TX_INTERVAL: 
// -> TX_START: interval bits ended and next data will be tx at once
// TX_END: 
// -> TX_IDLE: prepare for deinit (reserved)
// All state should transition to TX_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	TX_IDLE:
		if(pe_tx_enable)
			next_state = TX_START;
		else
			next_state = TX_IDLE;
	TX_START:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_start_to_data)
			next_state = TX_DATA;
		else
			next_state = TX_START;
	TX_DATA:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_data_to_stop)
			next_state = TX_STOP;
		else if(tx_state_data_to_parity)
			next_state = TX_PARITY;
		else
			next_state = TX_DATA;
	TX_PARITY:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_parity_to_stop)
			next_state = TX_STOP;
		else
			next_state = TX_PARITY;
	TX_STOP:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_stop_to_interval)
			next_state = TX_INTERVAL;
		else if(tx_state_stop_to_end)
			next_state = TX_END;
		else if(tx_state_stop_to_start)
			next_state = TX_START;
		else
			next_state = TX_STOP;
	TX_INTERVAL:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_interval_to_end)
			next_state = TX_END;
		else if(tx_state_interval_to_start)
			next_state = TX_START;
		else
			next_state = TX_INTERVAL;
	TX_END:
		if(pe_tx_logic_clr)
			next_state = TX_IDLE;
		else if(tx_state_end_to_idle)
			next_state = TX_IDLE;
		else
			next_state = TX_END;
	default:
		next_state = TX_IDLE;
	endcase
end

// state output: combinational logic circuit
assign tx_state_idle = current_state == TX_IDLE;
assign tx_state_start = current_state == TX_START;
assign tx_state_data = current_state == TX_DATA;
assign tx_state_parity = current_state == TX_PARITY;
assign tx_state_stop = current_state == TX_STOP;
assign tx_state_interval = current_state == TX_INTERVAL;
assign tx_state_end = current_state == TX_END;

//===============================================
// uart tx bit timing base
// operating when uart tx fsm running
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
										// only sustaining 1 clk
assign timing_base_enable = |current_state[5:1];
assign clkdiv_flag_start = (clkdiv_cnt == 1'b0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == (r_clkdiv - 1'b1)) ? 1'b1 : 1'b0;
assign oversampling_flag_start = (oversampling_cnt == 1'b0) ? 1'b1 : 1'b0;
assign oversampling_flag_end = (oversampling_cnt == (r_oversampling - 1'b1)) ? 1'b1 : 1'b0;
assign bit_end = oversampling_flag_end && clkdiv_flag_end; // only sustaining 1 clock

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

//===============================================
// uart tx state: TX_START
//===============================================

assign tx_state_start_to_data = bit_end && tx_state_start;

//===============================================
// uart tx state: TX_DATA
//===============================================

reg				[ 3:0]			data_bit_cnt;
reg								data_bit_end;// last data bit
assign tx_state_data_to_parity = bit_end && tx_state_data && r_parity_en && (data_bit_cnt == r_data_bit);
assign tx_state_data_to_stop = bit_end && tx_state_data && ~r_parity_en && (data_bit_cnt == r_data_bit);

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		data_bit_cnt <= 4'b0;
		data_bit_end <= 1'b0;
	end
	else if(tx_state_data && bit_end) // other data bit
	begin
		data_bit_cnt <= data_bit_cnt + 1'b1;
		if(data_bit_cnt == r_data_bit) // data bit end
			data_bit_end <= 1'b1;
		else
			data_bit_end <= 1'b0;
	end
	else if(tx_state_start_to_data) // (timing clk issue) first data bit
	begin
		data_bit_cnt <= data_bit_cnt + 1'b1;
		data_bit_end <= 1'b0;
	end
	else if(tx_state_start) // clear data cnt when is in last state
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
// uart tx state: TX_PARITY
//===============================================

assign tx_state_parity_to_stop = bit_end && tx_state_parity;

//===============================================
// uart tx state: TX_STOP
//===============================================

reg				[ 1:0]			stop_bit_cnt;
reg								stop_bit_end;// last data bit
reg								interval_enable;

//always @(posedge pe_clk or negedge pe_rstn)
//begin
//	if(!pe_rstn)
//		interval_enable = 1'b0;
//	else if(r_interval_bit != 4'h0)
//		interval_enable = 1'b1;
//	else
//		interval_enable = 1'b0;
//end

assign tx_state_stop_to_start = bit_end && tx_state_stop && (r_interval_bit == 4'h0) && (stop_bit_cnt == r_stop_bit);
assign tx_state_stop_to_interval = bit_end && tx_state_stop && (r_interval_bit != 4'h0) && (stop_bit_cnt == r_stop_bit);
//assign tx_state_stop_to_start = bit_end && tx_state_stop && ~interval_enable && (stop_bit_cnt == r_stop_bit);
//assign tx_state_stop_to_interval = bit_end && tx_state_stop && interval_enable && (stop_bit_cnt == r_stop_bit);
assign tx_state_stop_to_end = tx_state_stop_to_start && (fifo_num == 5'h0);// fifo empty

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		stop_bit_cnt <= 2'b0;
		stop_bit_end <= 1'b0;
	end
	else if(tx_state_stop && bit_end) // other stop bit
	begin
		stop_bit_cnt <= stop_bit_cnt + 1'b1;
		if(stop_bit_cnt == r_stop_bit) // stop bit end
			stop_bit_end <= 1'b1;
		else
			stop_bit_end <= 1'b0;
	end
	else if(tx_state_parity_to_stop || tx_state_data_to_stop) // (timing clk issue) first stop bit (this must be before above)
	begin
		stop_bit_cnt <= stop_bit_cnt + 1'b1;
		stop_bit_end <= 1'b0;
	end
	else if(tx_state_data) // clear stop cnt when is in last state
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
// uart tx state: TX_INTERVAL
//===============================================

reg				[ 3:0]			interval_bit_cnt;
reg								interval_bit_end;// last data bit
assign tx_state_interval_to_start = bit_end && tx_state_interval && (interval_bit_cnt == r_interval_bit);// need not add fifo condition 
assign tx_state_interval_to_end = bit_end && tx_state_interval && (interval_bit_cnt == r_interval_bit) && (fifo_num == 5'h0);// fifo empty

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		interval_bit_cnt <= 4'b0;
		interval_bit_end <= 1'b0;
	end
	else if(tx_state_interval && bit_end) // other interval bit
	begin
		interval_bit_cnt <= interval_bit_cnt + 1'b1;
		if(interval_bit_cnt == r_interval_bit) // interval bit end
			interval_bit_end <= 1'b1;
		else
			interval_bit_end <= 1'b0;
	end
	else if(tx_state_stop_to_interval) // (timing clk issue) first interval bit (this must be before above)
	begin
		interval_bit_cnt <= interval_bit_cnt + 1'b1;
		interval_bit_end <= 1'b0;
	end
	else if(tx_state_stop) // clear interval cnt when is in last state
	begin
		interval_bit_cnt <= 1'b0;
		interval_bit_end <= 1'b0;
	end
	else
	begin
		interval_bit_cnt <= interval_bit_cnt;
		interval_bit_end <= interval_bit_end;
	end
end

//===============================================
// uart tx state: TX_END
// this state is used to handle some unfinish issue
//===============================================

reg								tx_end;
assign tx_state_end_to_idle = tx_end;
assign pe_tx_end = tx_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		tx_end <= 1'b0;
	else if(tx_state_end)
		tx_end <= 1'b1;
	else
		tx_end <= 1'b0;
end

//===============================================
// uart tx data prepare
// truncating tx data first and then calculating parity bit
//===============================================

reg				[10:0]			tx_data;// last bit is used to park data ptr
reg								tx_data_loaded;
reg								tx_data_parity;
reg				[ 9:0]			tx_data_truncate;
reg								tx_data_truncate_valid;

// load data from tx fifo
// truncating tx data for parity calculation is necessary
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		fifo_re <= 1'b0;
		tx_data <= 11'h0;
		tx_data_loaded <= 1'b0;
	end
	else if(tx_state_start && (tx_data_loaded == 1'b0))
	begin
		fifo_re <= 1'b1;
		case(r_data_bit)
			4'd7:
				tx_data <= fifo_data[6:0];
			4'd8:
				tx_data <= fifo_data[7:0];
			4'd9:
				tx_data <= fifo_data[8:0];
			4'd10:
				tx_data <= fifo_data[9:0];
			default:
				tx_data <= fifo_data[7:0];
		endcase
		tx_data_loaded <= 1'b1;// in case of tx_state last more than 1 clk unexpected and then read data more from tx fifo
	end
	else if(tx_state_stop)
	begin
		fifo_re <= 1'b0;
		tx_data <= 11'h0;
		tx_data_loaded <= 1'b0;
	end
	else
	begin
		fifo_re <= 1'b0;
		tx_data <= tx_data;
		tx_data_loaded <= tx_data_loaded;
	end
end

// parity caculation
// only valid when enable parity bit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		tx_data_parity <= 1'b0;
	else if((tx_data_loaded == 1'b1) && (r_parity_en == 1'b1))
		if(r_parity == 2'h0)
			tx_data_parity <= ^tx_data; 
		else if(r_parity == 2'h1)
			tx_data_parity <= ~(^tx_data); 
		else if(r_parity == 2'h2)
			tx_data_parity <= 1'b0; 
		else
			tx_data_parity <= 1'b1; 
	else
		tx_data_parity <= tx_data_parity;
end

//===============================================
// pin control
// default state:
// tx high
// tx disable
//===============================================

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		uart_tx <= 1'b1;
		uart_tx_oen <= 1'b1;
	end
	// current state inside: TX_START
	else if(pe_tx_enable_r)
	begin
		uart_tx_oen <= 1'b0;
		uart_tx <= 1'b0;
	end
	// current state inside: DATA PARITY STOP INTERVAL
	else if(bit_end == 1'b1)
	begin
		// the order is critical, cannot be changed randomly
		if(tx_state_stop_to_end)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b1;
		end
		else if(tx_state_interval_to_end)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b1;
		end
		else if(tx_state_interval_to_start)
		begin
			uart_tx <= 1'b0;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_interval)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_stop_to_interval)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_stop_to_start)
		begin
			uart_tx <= 1'b0;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_stop)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_parity_to_stop)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_data_to_stop)
		begin
			uart_tx <= 1'b1;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_data_to_parity)
		begin
			uart_tx <= tx_data_parity;
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_data)
		begin
			uart_tx <= tx_data[data_bit_cnt];
			uart_tx_oen <= 1'b0;
		end
		else if(tx_state_start_to_data)
		begin
			uart_tx <= tx_data[data_bit_cnt];
			uart_tx_oen <= 1'b0;
		end
		else
		begin
			// in case of unexpected occurs accidently
			uart_tx <= 1'b1;			
			uart_tx_oen <= 1'b1;
		end
	end
	// current state inside: END
	else if(tx_state_end)
	begin
		uart_tx <= 1'b1;
		uart_tx_oen <= 1'b1;
	end
	else
	begin
		uart_tx <= uart_tx;
		uart_tx_oen <= uart_tx_oen;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_tx_done = tx_state_end_to_idle; 

endmodule


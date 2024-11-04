//===============================================
//
//	File: eth_sma_pe_master.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11292023
//	Version: v1.0
//
// 	This is tx protocol engine for uart.
//
//===============================================

module eth_sma_pe_master
(
	input  						pe_clk,  
	input  						pe_rstn,

	// pin
	output 						eth_mdc,
	output 						eth_mdc_oen,
	output reg					eth_mdio_o,
	input 						eth_mdio_i,
	output reg					eth_mdio_oen,

	// data
	output reg					tx_fifo_re,
	input		[22:0]			tx_fifo_data,
	input		[ 2:0]			tx_fifo_num,
	output reg					rx_fifo_we,
	output reg	[15:0]			rx_fifo_data,
	input		[ 2:0]			rx_fifo_num,

	// control
	input						pe_master_logic_clr,
	input						pe_master_enable,
	input						pe_master_enable_r,
	output						pe_master_end,

	// config
	input		[ 7:0]			r_clkdiv,
	input		[ 4:0]			r_phyadr,
	input 		[ 7:0]			r_interval_bit,
	input 						r_interval_en,

	// interrupt status
	output						int_status_rx_turn_nack,
	output						int_status_master_frame_done 
);

//===============================================
// eth sma master fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						MASTER_IDLE = 8'b00000001;
localparam						MASTER_PREAMBLE_AND_START = 8'b00000010;
localparam						MASTER_OP_AND_ADDRESS = 8'b00000100;
localparam						MASTER_TURN = 8'b00001000;
localparam						MASTER_TX_DATA = 8'b00010000;
localparam						MASTER_RX_DATA = 8'b00100000;
localparam						MASTER_INTERVAL = 8'b01000000;
localparam						MASTER_END = 8'b10000000;

reg				[ 7:0]			current_state;
reg				[ 7:0]			next_state;

reg				[ 1:0]			cmd;// from tx fifo
wire							cmd_write;
wire							cmd_read;

wire							master_state_idle;
wire							master_state_preamble_and_start;
wire							master_state_op_and_address;
wire							master_state_turn;
wire							master_state_tx_data;
wire							master_state_rx_data;
wire							master_state_interval;
wire							master_state_end;
wire							master_state_preamble_and_start_to_op_and_address;
wire							master_state_op_and_address_to_turn;
wire							master_state_turn_to_tx_data;
wire							master_state_turn_to_rx_data;
wire							master_state_tx_data_to_preamble_and_start;
wire							master_state_tx_data_to_interval;
wire							master_state_tx_data_to_end;
wire							master_state_rx_data_to_preamble_and_start;
wire							master_state_rx_data_to_interval;
wire							master_state_rx_data_to_end;
wire							master_state_interval_to_preamble_and_start;
wire							master_state_interval_to_end;
wire							master_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		current_state <= MASTER_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// MASTER_IDLE:
// -> MASTER_PREAMBLE_AND_START: received master enable
// MASTER_PREAMBLE_AND_START :
// -> MASTER_OP_AND_ADDRESS: start bit ended
// MASTER_OP_AND_ADDRESS:
// -> MASTER_TURN: phy register address ended
// MASTER_TURN: 
// -> MASTER_TX_DATA: tx cmd from tx fifo
// -> MASTER_RX_DATA: rx cmd from tx fifo
// MASTER_TX_DATA:
// -> MASTER_INTERVAL: tx data bit ended and next frame will be tx but should wait
// -> MASTER_START: tx data bit ended and next frame will be tx at once
// -> MASTER_END:  tx data bit ended and no frame are needed to tx
// MASTER_RX_DATA:
// -> MASTER_INTERVAL: rx data bit ended and next frame will be tx but should wait
// -> MASTER_START: rx data bit ended and next frame will be tx at once
// -> MASTER_END:  rx data bit ended and no frame are needed to tx
// MASTER_INTERVAL: 
// -> MASTER_START: interval bits ended and next frame will be tx at once
// -> MASTER_END: interval bits ended and no frame are needed to tx
// MASTER_END: 
// -> MASTER_IDLE: prepare for deinit (reserved)
// All state should transition to MASTER_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)
always @(*)
begin
	case (current_state)
	MASTER_IDLE:
		if(pe_master_enable)
			next_state = MASTER_PREAMBLE_AND_START;
		else
			next_state = MASTER_IDLE;
	MASTER_PREAMBLE_AND_START:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_preamble_and_start_to_op_and_address)
			next_state = MASTER_OP_AND_ADDRESS;
		else
			next_state = MASTER_PREAMBLE_AND_START;
	MASTER_OP_AND_ADDRESS:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_op_and_address_to_turn)
			next_state = MASTER_TURN;
		else
			next_state = MASTER_OP_AND_ADDRESS;
	MASTER_TURN:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_turn_to_tx_data)
			next_state = MASTER_TX_DATA ;
		else if(master_state_turn_to_rx_data)
			next_state = MASTER_RX_DATA ;
		else
			next_state = MASTER_TURN;
	MASTER_TX_DATA:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_tx_data_to_interval)
			next_state = MASTER_INTERVAL;
		else if(master_state_tx_data_to_end)
			next_state = MASTER_END;
		else if(master_state_tx_data_to_preamble_and_start)
			next_state = MASTER_PREAMBLE_AND_START;
		else
			next_state = MASTER_TX_DATA;
	MASTER_RX_DATA:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_rx_data_to_interval)
			next_state = MASTER_INTERVAL;
		else if(master_state_rx_data_to_end)
			next_state = MASTER_END;
		else if(master_state_rx_data_to_preamble_and_start)
			next_state = MASTER_PREAMBLE_AND_START;
		else
			next_state = MASTER_RX_DATA;
	MASTER_INTERVAL:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_interval_to_end)
			next_state = MASTER_END;
		else if(master_state_interval_to_preamble_and_start)
			next_state = MASTER_PREAMBLE_AND_START;
		else
			next_state = MASTER_INTERVAL;
	MASTER_END:
		if(pe_master_logic_clr)
			next_state = MASTER_IDLE;
		else if(master_state_end_to_idle)
			next_state = MASTER_IDLE;
		else
			next_state = MASTER_END;
	default:
		next_state = MASTER_IDLE;
	endcase
end

// state output: combinational logic circuit
assign master_state_idle = current_state == MASTER_IDLE;
assign master_state_preamble_and_start = current_state == MASTER_PREAMBLE_AND_START;
assign master_state_op_and_address = current_state == MASTER_OP_AND_ADDRESS;
assign master_state_turn = current_state == MASTER_TURN;
assign master_state_tx_data = current_state == MASTER_TX_DATA;
assign master_state_rx_data = current_state == MASTER_RX_DATA;
assign master_state_interval = current_state == MASTER_INTERVAL;
assign master_state_end = current_state == MASTER_END;

//===============================================
// sma frame bit timing base
// operating when sma fsm running
// for example:
// unit: clk
// 0           1           2           3          bit flag
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 clkdiv start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 clkdiv end
// 1  0  0  0  1  0  0  0  1  0  0  0  1  0  0  0 bit start
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 bit end
// 0  0  1  1  0  0  1  1  0  0  1  1  0  0  1  1 clock gen
//===============================================

reg				[ 7:0]			clkdiv_cnt;// the smallest unit of timing base
wire							timing_base_enable;
wire							clkdiv_flag_start;// indicate a bit start
wire							clkdiv_flag_end;// indicate a bit end
wire							bit_start;// indicate a data bit start when the first clkdiv unit is meeting first oversampling unit
										// only sustaining 1 clk
wire							bit_end;// indicate a data bit end when the last clkdiv unit is meeting last oversampling unit
										// only sustaining 1 clk
reg								clk_gen;// 50% duty cycle clock
										// clock low: shift data
										// clock high: sample data
wire							bit_value_sample_point;// indicate bit value sampling time point
assign timing_base_enable = |current_state[6:1];
assign clkdiv_flag_start = (clkdiv_cnt == 1'b0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == (r_clkdiv - 1'b1)) ? 1'b1 : 1'b0;
assign bit_start = clkdiv_flag_start; // only sustaining 1 clock
assign bit_end = clkdiv_flag_end; // only sustaining 1 clock
assign bit_value_sample_point = clkdiv_cnt == (r_clkdiv[7:1] - 1'b1);

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

// clock generation
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		clk_gen <= 1'b0;
	end
	else if(timing_base_enable)
	begin
		if(clkdiv_flag_end)
		begin
			clk_gen <= 1'b0;
		end
		else if(bit_value_sample_point)
		begin
			clk_gen <= 1'b1;
		end
	end
	else
	begin
		clk_gen <= clk_gen;
	end
end		

//===============================================
// eth sma master state: MASTER_PREAMBLE_AND_START 
//===============================================

reg				[ 5:0]			preamble_and_start_bit_cnt;
reg								preamble_and_start_bit_end;// last data bit
wire							preamble_and_start_bit_cnt_end;
assign preamble_and_start_bit_cnt_end = (preamble_and_start_bit_cnt == 6'd34) ? 1'b1 : 1'b0;
assign master_state_preamble_and_start_to_op_and_address = bit_end && master_state_preamble_and_start && preamble_and_start_bit_cnt_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		preamble_and_start_bit_cnt <= 6'd0;
		preamble_and_start_bit_end <= 1'b0;
	end
	else if(master_state_preamble_and_start && bit_end) // other preamble and start bit
	begin
		if(preamble_and_start_bit_cnt_end) // start bit end
		begin
			preamble_and_start_bit_end <= 1'b1;
			preamble_and_start_bit_cnt <= preamble_and_start_bit_cnt;
		end
		else
		begin
			preamble_and_start_bit_end <= 1'b0;
			preamble_and_start_bit_cnt <= preamble_and_start_bit_cnt + 1'b1;
		end
	end
	else if(master_state_tx_data_to_preamble_and_start || master_state_rx_data_to_preamble_and_start || master_state_interval_to_preamble_and_start || pe_master_enable_r) // (timing clk issue) first preamble bit
	begin
		preamble_and_start_bit_end <= 1'b0;
		preamble_and_start_bit_cnt <= preamble_and_start_bit_cnt + 1'b1;
	end
	else if(master_state_tx_data || master_state_rx_data || master_state_interval || master_state_idle) // clear preamble and start cnt when is in last state
	begin
		preamble_and_start_bit_cnt <= 6'd0;
		preamble_and_start_bit_end <= 1'b0;
	end
	else
	begin
		preamble_and_start_bit_end <= preamble_and_start_bit_end;
		preamble_and_start_bit_cnt <= preamble_and_start_bit_cnt;
	end
end

//===============================================
// eth sma master state: MASTER_OP_AND_ADDRESS
//===============================================

reg				[ 3:0]			op_and_address_bit_cnt;
reg								op_and_address_bit_end;// last op bit
wire							op_and_address_bit_cnt_end;
assign op_and_address_bit_cnt_end = (op_and_address_bit_cnt == 4'd12 ) ? 1'b1 : 1'b0;
assign master_state_op_and_address_to_turn = bit_end && master_state_op_and_address && op_and_address_bit_cnt_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		op_and_address_bit_cnt <= 4'd0;
		op_and_address_bit_end <= 1'b0;
	end
	else if(master_state_op_and_address && bit_end) // other op bit
	begin
		if(op_and_address_bit_cnt_end) // op bit end
		begin
			op_and_address_bit_end <= 1'b1;
			op_and_address_bit_cnt <= op_and_address_bit_cnt;
		end
		else
		begin
			op_and_address_bit_end <= 1'b0;
			op_and_address_bit_cnt <= op_and_address_bit_cnt + 1'b1;
		end
	end
	else if(master_state_preamble_and_start_to_op_and_address) // (timing clk issue) first op bit
	begin
		op_and_address_bit_end <= 1'b0;
		op_and_address_bit_cnt <= op_and_address_bit_cnt + 1'b1;
	end
	else if(master_state_preamble_and_start) // clear op cnt when is in last state
	begin
		op_and_address_bit_cnt <= 4'd0;
		op_and_address_bit_end <= 1'b0;
	end
	else
	begin
		op_and_address_bit_end <= op_and_address_bit_end;
		op_and_address_bit_cnt <= op_and_address_bit_cnt;
	end
end

//===============================================
// eth sma master state: MASTER_TURN 
//===============================================

reg				[ 1:0]			turn_bit_cnt;
reg								turn_bit_end;// last turn bit
wire							turn_bit_cnt_end;
assign turn_bit_cnt_end = (turn_bit_cnt == 2'd2) ? 1'b1 : 1'b0; 
assign master_state_turn_to_tx_data = bit_end && master_state_turn && cmd_write && turn_bit_cnt_end;
assign master_state_turn_to_rx_data = bit_end && master_state_turn && cmd_read && turn_bit_cnt_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		turn_bit_cnt <= 2'd0;
		turn_bit_end <= 1'b0;
	end
	else if(master_state_turn && bit_end) // other turn bit
	begin
		if(turn_bit_cnt_end) // turn bit end
		begin
			turn_bit_end <= 1'b1;
			turn_bit_cnt <= turn_bit_cnt;
		end
		else
		begin
			turn_bit_end <= 1'b0;
			turn_bit_cnt <= turn_bit_cnt + 1'b1;
		end
	end
	else if(master_state_op_and_address_to_turn) // (timing clk issue) first turn bit
	begin
		turn_bit_cnt <= turn_bit_cnt + 1'b1;
		turn_bit_end <= 1'b0;
	end
	else if(master_state_preamble_and_start) // clear turn cnt when is in last state
	begin
		turn_bit_cnt <= 2'd0;
		turn_bit_end <= 1'b0;
	end
	else
	begin
		turn_bit_cnt <= turn_bit_cnt;
		turn_bit_end <= turn_bit_end;
	end
end

//===============================================
// eth sma master state: MASTER_TX_DATA
//===============================================

reg				[ 4:0]			tx_data_bit_cnt;
reg								tx_data_bit_end;// last tx data bit
wire							tx_data_bit_cnt_end;
assign tx_data_bit_cnt_end = (tx_data_bit_cnt == 5'd16) ? 1'b1 : 1'b0;
assign master_state_tx_data_to_preamble_and_start = bit_end && master_state_tx_data && !r_interval_en && tx_data_bit_cnt_end;
assign master_state_tx_data_to_interval = bit_end && master_state_tx_data && r_interval_en && tx_data_bit_cnt_end;
assign master_state_tx_data_to_end = master_state_tx_data_to_preamble_and_start && (tx_fifo_num == 3'h0);// no more cmd in tx fifo

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tx_data_bit_cnt <= 5'd0;
		tx_data_bit_end <= 1'b0;
	end
	else if(master_state_tx_data && bit_end) // other tx data bit
	begin
		if(tx_data_bit_cnt_end) // tx data bit end
		begin
			tx_data_bit_end <= 1'b1;
			tx_data_bit_cnt <= tx_data_bit_cnt;
		end
		else
		begin
			tx_data_bit_end <= 1'b0;
			tx_data_bit_cnt <= tx_data_bit_cnt + 1'b1;
		end
	end
	else if(master_state_turn_to_tx_data) // (timing clk issue) first tx data bit
	begin
		tx_data_bit_cnt <= tx_data_bit_cnt + 1'b1;
		tx_data_bit_end <= 1'b0;
	end
	else if(master_state_preamble_and_start) // clear tx data cnt when is in last state
	begin
		tx_data_bit_cnt <= 5'd0;
		tx_data_bit_end <= 1'b0;
	end
	else
	begin
		tx_data_bit_cnt <= tx_data_bit_cnt;
		tx_data_bit_end <= tx_data_bit_end;
	end
end

//===============================================
// eth sma master state: MASTER_RX_DATA
//===============================================

reg				[ 4:0]			rx_data_bit_cnt;
reg								rx_data_bit_end;// last rx data bit
wire							rx_data_bit_cnt_end;
assign rx_data_bit_cnt_end = (rx_data_bit_cnt == 5'd16) ? 1'b1 : 1'b0;
assign master_state_rx_data_to_preamble_and_start = bit_end && master_state_rx_data && !r_interval_en && rx_data_bit_cnt_end;
assign master_state_rx_data_to_interval = bit_end && master_state_rx_data && r_interval_en && rx_data_bit_cnt_end;
assign master_state_rx_data_to_end = master_state_rx_data_to_preamble_and_start && (tx_fifo_num == 3'h0);// no more cmd in tx fifo

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		rx_data_bit_cnt <= 5'd0;
		rx_data_bit_end <= 1'b0;
	end
	else if(master_state_rx_data && bit_end) // other rx data bit
	begin
		if(rx_data_bit_cnt_end) // rx data bit end
		begin
			rx_data_bit_end <= 1'b1;
			rx_data_bit_cnt <= rx_data_bit_cnt;
		end
		else
		begin
			rx_data_bit_end <= 1'b0;
			rx_data_bit_cnt <= rx_data_bit_cnt + 1'b1;
		end
	end
	else if(master_state_turn_to_rx_data) // (timing clk issue) first rx data bit
	begin
		rx_data_bit_cnt <= rx_data_bit_cnt + 1'b1;
		rx_data_bit_end <= 1'b0;
	end
	else if(master_state_preamble_and_start) // clear rx data cnt when is in last state
	begin
		rx_data_bit_cnt <= 5'd0;
		rx_data_bit_end <= 1'b0;
	end
	else
	begin
		rx_data_bit_cnt <= rx_data_bit_cnt;
		rx_data_bit_end <= rx_data_bit_end;
	end
end

//===============================================
// eth sma master state: MASTER_INTERVAL
//===============================================

reg				[ 7:0]			interval_bit_cnt;
reg								interval_bit_end;// last interval bit
wire							interval_bit_cnt_end;
assign interval_bit_cnt_end = (interval_bit_cnt == r_interval_bit) ? 1'b1 : 1'b0;
assign master_state_interval_to_preamble_and_start = bit_end && master_state_interval && interval_bit_cnt_end;// need not add fifo condition 
assign master_state_interval_to_end = bit_end && master_state_interval && interval_bit_cnt_end && (tx_fifo_num == 5'h0);// tx fifo empty

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		interval_bit_cnt <= 8'd0;
		interval_bit_end <= 1'b0;
	end
	else if(master_state_interval && bit_end) // other interval bit
	begin
		if(interval_bit_cnt_end) // interval bit end
		begin
			interval_bit_end <= 1'b1;
			interval_bit_cnt <= interval_bit_cnt;
		end
		else
		begin
			interval_bit_end <= 1'b0;
			interval_bit_cnt <= interval_bit_cnt + 1'b1;
		end
	end
	else if(master_state_tx_data_to_interval || master_state_rx_data_to_interval) // (timing clk issue) first interval bit (this must be before above)
	begin
		interval_bit_cnt <= interval_bit_cnt + 1'b1;
		interval_bit_end <= 1'b0;
	end
	else if(master_state_tx_data || master_state_rx_data) // clear interval cnt when is in last state
	begin
		interval_bit_cnt <= 8'd0;
		interval_bit_end <= 1'b0;
	end
	else
	begin
		interval_bit_cnt <= interval_bit_cnt;
		interval_bit_end <= interval_bit_end;
	end
end

//===============================================
// eth sma master state: MASTER_END
// this state is used to handle some unfinish issue
//===============================================

reg								master_end;
assign master_state_end_to_idle = master_end;
assign pe_master_end = master_end;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
		master_end <= 1'b0;
	else if(master_state_end)
		master_end <= 1'b1;
	else
		master_end <= 1'b0;
end

//===============================================
// eth sma tx cmd and data prepare
// cmd and data are both from tx fifo
// [22:21] cmd
// When cmd = 2'b01, tx data.
// [20:16] reg address
// [15:0] tx data
// When cmd = 2'b10, rx data.
// [19:16] reg address
// [15:0] reseverd
//===============================================

// last bit is used to park ptr
wire			[0:34]			frame_tx_preamble_and_start;
wire			[0: 2]			frame_tx_op;
wire			[0: 5]			frame_tx_phyad;
reg				[0: 5]			frame_tx_regad;
wire			[0:12]			frame_tx_op_and_address;
reg				[0:16]			frame_tx_data;
reg								frame_rx_ack;
reg								frame_rx_nack;
reg				[0:16]			frame_rx_data;
wire			[0: 2]			frame_tx_turn;
reg								tx_loaded;
reg								rx_loaded;

assign frame_tx_preamble_and_start[0:31] = 32'hffff_ffff;// preabmle bits
assign frame_tx_preamble_and_start[32:33] = 2'b01;// start bits
assign frame_tx_preamble_and_start[34] = 1'b0;// park bit for pointer
assign frame_tx_op[0:1] = cmd;// cmd 
assign frame_tx_op[2] = 1'b0;// park bit for pointer 
assign frame_tx_phyad[0:4] = r_phyadr;// phy address
assign frame_tx_phyad[5] = 1'b0;// park bit for pointer
assign frame_tx_op_and_address[0:12] = {frame_tx_op[0:1], frame_tx_phyad[0:4], frame_tx_regad[0:4], 1'b0};
// turn bit
// spyglass lint check: z should not used here
// z should used in the port control section
// just change direction by oen here instead
assign frame_tx_turn[0:1] = 2'b10;
assign frame_tx_turn[2] = 1'b0;// park bit for pointer

assign cmd_write = (cmd == 2'b01) ? 1'b1 : 1'b0;
assign cmd_read = (cmd == 2'b10) ? 1'b1 : 1'b0;

// load data from frame tx fifo
// including cmd, reg address and frame tx data
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		tx_fifo_re <= 1'b0;
		frame_tx_data <= 17'h0;
		frame_tx_regad <= 6'h0;
		cmd <= 2'h0;
		tx_loaded <= 1'b0;
	end
	else if(master_state_preamble_and_start && (tx_loaded == 1'b0))
	begin
		tx_fifo_re <= 1'b1;
		frame_tx_data[0:15] <= tx_fifo_data[15:0];
		frame_tx_regad[0:4] <= tx_fifo_data[20:16];
		cmd <= tx_fifo_data[22:21];
		tx_loaded <= 1'b1;// in case of tx state last more than 1 clk unexpected and then read data more from tx fifo
	end
//	else if((master_state_tx_data && tx_data_bit_end) || (master_state_rx_data && rx_data_bit_end))// when tx data or rx data end, clear 
	else if(tx_data_bit_end || rx_data_bit_end)// when tx data or rx data end, clear 
	begin
		tx_fifo_re <= 1'b0;
		frame_tx_data[0:15] <= 11'h0;
		frame_tx_regad[0:4] <= 5'h0;
		cmd <= 2'h0;
		tx_loaded <= 1'b0;
	end
	else
	begin
		tx_fifo_re <= 1'b0;
		frame_tx_data <= frame_tx_data;
		frame_tx_regad <= frame_tx_regad;
		cmd <= cmd;
		tx_loaded <= tx_loaded;
	end
end

// push data into frame rx fifo
// including cmd, reg address and frame_tx data
always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= 16'h0;
		rx_loaded <= 1'b0;
	end
	else if(rx_data_bit_end && (rx_loaded == 1'b0))// when tx data or rx data end, clear 
	begin
		rx_fifo_we <= 1'b1;
		rx_fifo_data <= frame_rx_data[0:15];
		rx_loaded <= 1'b1;
	end
	else if(master_state_preamble_and_start)
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= 16'h0;
		rx_loaded <= 1'b0;
	end
	else
	begin
		rx_fifo_we <= 1'b0;
		rx_fifo_data <= rx_fifo_data;
		rx_loaded <= rx_loaded;
	end
end

//always @(posedge pe_clk or negedge pe_rstn)
//begin
//	if(!pe_rstn)
//	begin
//		frame_tx_turn <= 3'b0;
//	end
//	else if(master_state_op_and_address)
//	begin
//		frame_tx_turn[2] <= 1'b0;// park bit for pointer
//		if(cmd == 2'b10)
//		begin
//			frame_tx_turn[0:1] <= 2'b10;// actually is z0, however z is not allowed here
//		end
//		else
//		begin
//			frame_tx_turn[0:1] <= 2'b10;
//		end
//	end
//	else
//	begin
//		frame_tx_turn <= frame_tx_turn;
//	end
//end

//===============================================
// pin control
// default state:
// mdio z
// mdio tx rx disable
// mdc tx enable
// mdc tx low
//===============================================

assign eth_mdc = clk_gen;
assign eth_mdc_oen = 1'b0;

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		eth_mdio_o <= 1'b1;
		eth_mdio_oen <= 1'b1;
	end
	// current state inside: MASTER_PREAMBLE_AND_START
	else if(pe_master_enable_r)
	begin
		eth_mdio_o <= frame_tx_preamble_and_start[preamble_and_start_bit_cnt];
		eth_mdio_oen <= 1'b0;
	end
	// current state inside: MASTER_OP PHYAD REGAD TURN TXDATA RXDATA INTERVAL
	else if(bit_end == 1'b1)
	begin
		// the order is critical, cannot be changed randomly
		if(master_state_tx_data_to_end || master_state_rx_data_to_end || master_state_interval_to_end)
		begin
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;// mdc stop in data or interval bits end
		end
		else if(master_state_interval)
		begin
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;// mdc stop in interval bits
		end
		else if(master_state_tx_data_to_interval || master_state_rx_data_to_interval)
		begin
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;// mdc stop in interval bits
		end
		else if(master_state_rx_data)
		begin
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;
		end
		else if(master_state_turn_to_rx_data)
		begin
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;
		end
		else if(master_state_tx_data)
		begin
			eth_mdio_o <= frame_tx_data[tx_data_bit_cnt];
			eth_mdio_oen <= 1'b0;
		end
		else if(master_state_turn_to_tx_data)
		begin
			eth_mdio_o <= frame_tx_data[tx_data_bit_cnt];
			eth_mdio_oen <= 1'b0;
		end
		else if(master_state_op_and_address_to_turn || master_state_turn)
		begin
			eth_mdio_o <= frame_tx_turn[turn_bit_cnt];
			// turn bit 2 is ack bit when read
			// matching output z and input
			if(cmd_write == 1'b1)
			begin
				eth_mdio_oen <= 1'b0;// write
			end
			else
			begin
				eth_mdio_oen <= 1'b1;// read
			end
		end
		else if(master_state_op_and_address)
		begin
			eth_mdio_o <= frame_tx_op_and_address[op_and_address_bit_cnt];
			eth_mdio_oen <= 1'b0;
		end
		else if(master_state_preamble_and_start_to_op_and_address)
		begin
			eth_mdio_o <= frame_tx_op_and_address[op_and_address_bit_cnt];
			eth_mdio_oen <= 1'b0;
		end
		else if(master_state_preamble_and_start)
		begin
			eth_mdio_o <= frame_tx_preamble_and_start[preamble_and_start_bit_cnt];
			eth_mdio_oen <= 1'b0;
		end
		else
		begin
			// in case of unexpected occurs accidently
			eth_mdio_o <= 1'b1;
			eth_mdio_oen <= 1'b1;
		end
	end
	// current state inside: END
	else if(master_state_end)
	begin
		eth_mdio_o <= 1'b1;
		eth_mdio_oen <= 1'b1;
	end
	else
	begin
		eth_mdio_o <= eth_mdio_o;
		eth_mdio_oen <= eth_mdio_oen;
	end
end

always @(posedge pe_clk or negedge pe_rstn)
begin
	if(!pe_rstn)
	begin
		frame_rx_ack <= 1'b0;
		frame_rx_nack <= 1'b0;
		frame_rx_data <= 17'h0;
	end
	// the order is critical, cannot be changed randomly
	else if(bit_value_sample_point == 1'b1)
	begin
		// current state inside: MASTER_RX_DATA
		if(master_state_rx_data)
		begin
			frame_rx_data[(rx_data_bit_cnt - 1'b1)] <= eth_mdio_i;// bit cnt is start at 1
			frame_rx_ack <= 1'b0;
			frame_rx_nack <= 1'b0;
		end
		else if(master_state_turn && (cmd_read == 1'b1) && (turn_bit_cnt == 2'h2))// turn bit 2: ack bit
		begin
			if(eth_mdio_i == 1'b1)
			begin
				frame_rx_ack <= 1'b0;
				frame_rx_nack <= 1'b1;
			end
			else
			begin
				frame_rx_ack <= 1'b1;
				frame_rx_nack <= 1'b0;
			end
		end
		else
		begin
			// in case of unexpected occurs accidently
			frame_rx_data <= 17'h0;
			frame_rx_ack <= 1'b0;
			frame_rx_nack <= 1'b0;
		end
	end
	// master enable but no data detect
	else if(pe_master_enable)
	begin
		frame_rx_ack <= frame_rx_ack;
		frame_rx_nack <= frame_rx_nack;
		frame_rx_data <= frame_rx_data;
	end
	// master disable
	else
	begin
		frame_rx_ack <= 1'b0;
		frame_rx_nack <= 1'b0;
		frame_rx_data <= 17'h0;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_rx_turn_nack = frame_rx_nack;
assign int_status_master_frame_done = master_state_end_to_idle; 

endmodule


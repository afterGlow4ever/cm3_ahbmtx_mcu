//===============================================
//
//	File: eth_mac_pe_tx.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 06232024
//	Version: v1.0
//
// 	This is tx protocol engine for ethernet mac.
//
//===============================================

module eth_mac_pe_tx
(
	input  						pe_tx_clk,  
	input  						pe_tx_rstn,

	// data
	output 						txdb_pe2fifo_re,
	output						txdb_pe2fifo_re_done,
	input		[31:0]			txdb_fifo2pe_rdata,
	input						txdb_fifo_empty,
	input						txdb_fifo_done,
	input						txdb_fifo2pe_burst_process_done,
	input						txdb_fifo2pe_single_process_done,
	input						txdb_fifo_ready,	

	// pin rgmii
	output reg	[ 3:0]			eth_tx,
	output reg	[ 3:0]			eth_tx_oen,
	output reg					eth_tx_ctrl,
	output reg					eth_tx_ctrl_oen,
	output						eth_tx_clk,
	output						eth_tx_clk_oen,

	// control
	input						pe_tx_logic_clr,
	input						pe_tx_enable,
	input						pe_tx_enable_r,
	output 						pe_tx_end,

	// config from regs
	input		[47:0]			r_sa_macaddr,
	input		[ 3:0]			r_pre_byte,
	input		[ 5:0]			r_interval_byte,


	// config from descriptors
	input		[11:0]			r_tx_payload_byte_length,
//	output		[11:0]			r_tx_payload_byte_real_length,
	input						r_hw_sa_mac_en,
	input						r_hw_sa_mac_replace_en,
	input						r_hw_crc_en,
	input						r_hw_crc_replace_en,
	input						r_hw_padding_en,
	input						r_hw_cs_en,
	input						r_hw_cs_replace_en,

	output						int_status_tx_done
);

//===============================================
// eth mac tx configuration
//===============================================

wire			[11:0]			r_tx_payload_byte_real_length;
wire			[11:0]			r_tx_frame_byte_real_length;
wire							r_hw_padding_real_en;
wire			[ 5:0]			r_tx_padding_length;

//===============================================
// eth tx frame fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						TX_FRAME_IDLE = 8'b00000001;
localparam						TX_FRAME_PREPARATION = 8'b00000010;
localparam						TX_FRAME_PREAMBLE = 8'b00000100;
localparam						TX_FRAME_PAYLOAD = 8'b00001000;
localparam						TX_FRAME_PADDING = 8'b00010000;
localparam						TX_FRAME_CRC = 8'b00100000;
localparam						TX_FRAME_INTERVAL = 8'b01000000;
localparam						TX_FRAME_END = 8'b10000000;

reg				[ 7:0]			current_state;
reg				[ 7:0]			next_state;

wire							tx_frame_state_idle;
wire							tx_frame_state_preparation;
wire							tx_frame_state_preamble;
wire							tx_frame_state_payload;
wire							tx_frame_state_padding;
wire							tx_frame_state_crc;
wire							tx_frame_state_interval;
wire							tx_frame_state_end;
wire							tx_frame_state_idle_to_preparation;
wire							tx_frame_state_idle_to_preamble;
wire							tx_frame_state_preparation_to_preamble;
wire							tx_frame_state_preamble_to_payload;
wire							tx_frame_state_pre_preamble_to_payload;
wire							tx_frame_state_pre2_preamble_to_payload;
wire							tx_frame_state_payload_to_padding;
wire							tx_frame_state_payload_to_crc;
wire							tx_frame_state_payload_to_interval;
wire							tx_frame_state_padding_to_crc;
wire							tx_frame_state_crc_to_interval;
wire							tx_frame_state_interval_to_end;
wire							tx_frame_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
		current_state <= TX_FRAME_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// TX_FRAME_IDLE:
// -> TX_FRAME_PREAMBLE: received datalink dma tx enable & fifo not empty
// -> TX_FRAME_PREPARATION: received datalink dma tx enable & hardware checksum
// TX_FRAME_PREPARATION:
// -> TX_FRAME_PREAMBLE: payload handle done
// TX_FRAME_PREAMBLE:
// -> TX_FRAME_PAYLOAD: preamble bits ended
// TX_FRAME_PAYLOAD:
// -> TX_FRAME_PADDING: payload bits ended and hardware padding enable
// -> TX_FRAME_CRC: payload bits ended and hardware crc enable
// -> TX_FRAME_INTERVAL: payload bits ended
// TX_FRAME_PADDING:
// -> TX_FRAME_CRC: hardware padding bits ended
// TX_FRAME_CRC:
// -> TX_FRAME_INTERVAL: hardware crc bits ended
// TX_FRAME_INTERVAL:
// -> TX_FRAME_END:  interval bits ended
// TX_FRAME_END: 
// -> TX_FRAME_IDLE: prepare for deinit (reserved)
// All state should transition to TX_FRAME_IDLE when:
// 1. received logic clear
// 2. protocol error occured (reserved)

always @(*)
begin
	case (current_state)
	TX_FRAME_IDLE:
		if(tx_frame_state_idle_to_preparation)
			next_state = TX_FRAME_PREPARATION;
		else if(tx_frame_state_idle_to_preamble)
			next_state = TX_FRAME_PREAMBLE;
		else
			next_state = TX_FRAME_IDLE;
	TX_FRAME_PREPARATION:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_preparation_to_preamble)
			next_state = TX_FRAME_PREAMBLE;
		else
			next_state = TX_FRAME_PREPARATION;
	TX_FRAME_PREAMBLE:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_preamble_to_payload)
			next_state = TX_FRAME_PAYLOAD;
		else
			next_state = TX_FRAME_PREAMBLE;
	TX_FRAME_PAYLOAD:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_payload_to_padding)
			next_state = TX_FRAME_PADDING;
		else if(tx_frame_state_payload_to_crc)
			next_state = TX_FRAME_CRC;
		else if(tx_frame_state_payload_to_interval)
			next_state = TX_FRAME_INTERVAL;
		else
			next_state = TX_FRAME_PAYLOAD;
	TX_FRAME_PADDING:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_padding_to_crc)
			next_state = TX_FRAME_CRC;
		else
			next_state = TX_FRAME_PADDING;
	TX_FRAME_CRC:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_crc_to_interval)
			next_state = TX_FRAME_INTERVAL;
		else
			next_state = TX_FRAME_CRC;
	TX_FRAME_INTERVAL:
		if(pe_tx_logic_clr)
			next_state = TX_FRAME_IDLE;
		else if(tx_frame_state_interval_to_end)
			next_state = TX_FRAME_END;
		else
			next_state = TX_FRAME_INTERVAL;
	TX_FRAME_END:
		next_state = TX_FRAME_IDLE;
	default:
		next_state = TX_FRAME_IDLE;
	endcase
end

// state output: combinational logic circuit
assign tx_frame_state_idle = current_state == TX_FRAME_IDLE;
assign tx_frame_state_preparation = current_state == TX_FRAME_PREPARATION;
assign tx_frame_state_preamble = current_state == TX_FRAME_PREAMBLE;
assign tx_frame_state_payload = current_state == TX_FRAME_PAYLOAD;
assign tx_frame_state_padding = current_state == TX_FRAME_PADDING;
assign tx_frame_state_crc = current_state == TX_FRAME_CRC;
assign tx_frame_state_interval = current_state == TX_FRAME_INTERVAL;
assign tx_frame_state_end = current_state == TX_FRAME_END;

//===============================================
// eth tx bit timing base
// operating when eth tx fsm running
// 50 mhz -> RGMII 25mhz
// for example:
// unit: clk
// 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 oversampling flag 
// 0     1     2     3     4     5     6     7    bit flag
// 1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0 clkdiv start
// 0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1 clkdiv end
// 1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0 partial byte start
// 0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1 partial byte end
// 0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1 clock gen
// 0  0  0  1  0  0  0  1  0  0  0  1  0  0  0  1 byte end (rgmii)
//===============================================

reg				[1:0]			clkdiv_cnt;// the smallest unit of timing base
wire							timing_base_enable;
wire							clkdiv_flag_start;// indicate partialbyte start
wire							clkdiv_flag_end;// indicate partial byte end
wire							byte_partial_start;// partial byte
wire							byte_partial_end;// partial byte
reg								clk_gen;// 50% duty cycle clock
										// clock high: shift data
										// clock low: sample data
wire							bit_value_sample_point;// indicate bit value sampling time point
wire							half_byte_end;// half byte end
wire							byte_end;// entire byte end
reg				[1:0]			byte_partial_cnt;
assign timing_base_enable = |current_state[6:1];
assign clkdiv_flag_start = (clkdiv_cnt == 2'h0) ? 1'b1 : 1'b0;
assign clkdiv_flag_end = (clkdiv_cnt == 2'h1) ? 1'b1 : 1'b0;
assign byte_partial_end = clkdiv_flag_end; // only sustaining 1 clock
assign bit_value_sample_point = (clkdiv_cnt == 2'h0) && timing_base_enable;
assign byte_end = clkdiv_flag_end;
assign half_byte_end = clkdiv_flag_start;

// div cnt for clkdiv
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		clkdiv_cnt <= 2'h0;
	end
	else if(timing_base_enable == 1'b1)
	begin
		if(clkdiv_flag_end == 1'b1)
		begin
			clkdiv_cnt <= 2'h0;
		end
		else
		begin
			clkdiv_cnt <= clkdiv_cnt + 1'b1;
		end
	end
	else
	begin
		clkdiv_cnt <= 2'h0;
	end
end

// clock generation
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		clk_gen <= 1'b0;
	end
	else if(timing_base_enable || tx_frame_state_preparation_to_preamble || tx_frame_state_idle_to_preamble)
	begin
	//	if(clkdiv_flag_end)
	//	begin
	//		clk_gen <= 1'b1;
	//	end
	//	else if(bit_value_sample_point)
	//	begin
	//		clk_gen <= 1'b0;
	//	end
		if(bit_value_sample_point)
		begin
			clk_gen <= 1'b0;
		end
		else
		begin
			clk_gen <= 1'b1;
		end
	end
	else
	begin
		clk_gen <= 1'b0;
	end
end		

// byte end generation for rgmii
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		byte_partial_cnt <= 2'h0;
	end
	else if(timing_base_enable)
	begin
		if(clkdiv_flag_end == 2'h1)
		begin
			if(byte_end == 1'b1)
			begin
				byte_partial_cnt <= 2'h0;
			end
			else	
			begin
				byte_partial_cnt <= byte_partial_cnt + 2'h1;
			end
		end
		else
		begin
			byte_partial_cnt <= byte_partial_cnt;
		end
	end
	else
	begin
		byte_partial_cnt <= byte_partial_cnt;
	end
end		

//===============================================
// eth mac tx frame state initial
//===============================================

assign tx_frame_state_idle_to_preparation = pe_tx_enable_r && (r_hw_cs_en || r_hw_cs_replace_en || r_hw_sa_mac_en || r_hw_sa_mac_replace_en);
assign tx_frame_state_idle_to_preamble = pe_tx_enable_r && ~r_hw_cs_en && ~r_hw_cs_replace_en && ~r_hw_sa_mac_en && ~r_hw_sa_mac_replace_en;

//===============================================
// eth mac tx frame state: TX_FRAME_PREPARATION
//===============================================

wire							tx_frame_preparation_done;
assign tx_frame_state_preparation_to_preamble = tx_frame_preparation_done && tx_frame_state_preparation;

//===============================================
// eth mac tx frame state: TX_FRAME_PREAMBLE
//===============================================

reg				[ 3:0]			preamble_byte_cnt;
reg								preamble_byte_end;// last data byte
wire							preamble_byte_cnt_end;
wire							preamble_byte_cnt_pre_end;
wire							preamble_byte_cnt_pre2_end;
assign preamble_byte_cnt_end = (preamble_byte_cnt == r_pre_byte) ? 1'b1 : 1'b0;
assign preamble_byte_cnt_pre_end = (preamble_byte_cnt == r_pre_byte - 1'b1) ? 1'b1 : 1'b0;
assign preamble_byte_cnt_pre2_end = (preamble_byte_cnt == r_pre_byte - 2'd2) ? 1'b1 : 1'b0;
assign tx_frame_state_preamble_to_payload = byte_end && tx_frame_state_preamble && preamble_byte_cnt_end;
assign tx_frame_state_pre_preamble_to_payload = byte_end && tx_frame_state_preamble && preamble_byte_cnt_pre_end;
assign tx_frame_state_pre2_preamble_to_payload = byte_end && tx_frame_state_preamble && preamble_byte_cnt_pre2_end;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		preamble_byte_cnt <= 4'd1;
		preamble_byte_end <= 1'b0;
	end
	else if(tx_frame_state_preamble && byte_end) // other preamble byte
	begin
		if(preamble_byte_cnt_end) // preamble byte end
		begin
			preamble_byte_end <= 1'b1;
			preamble_byte_cnt <= preamble_byte_cnt;
		end
		else
		begin
			preamble_byte_end <= 1'b0;
			preamble_byte_cnt <= preamble_byte_cnt + 1'b1;
		end
	end
	else if(pe_tx_enable_r) // (timing clk issue) first preamble bit
	begin
		preamble_byte_end <= 1'b0;
		preamble_byte_cnt <= preamble_byte_cnt + 1'b1;
	end
	else if(~tx_frame_state_preamble) // clear preamble cnt when is in last state
	begin
		preamble_byte_cnt <= 4'd1;
		preamble_byte_end <= 1'b0;
	end
	else
	begin
		preamble_byte_end <= preamble_byte_end;
		preamble_byte_cnt <= preamble_byte_cnt;
	end
end

//===============================================
// eth mac tx frame state: TX_FRAME_PAYLOAD
//===============================================

reg				[11:0]			payload_byte_cnt;
reg								payload_byte_end;// last data byte
wire							payload_byte_cnt_end;
assign payload_byte_cnt_end = (payload_byte_cnt == r_tx_frame_byte_real_length) ? 1'b1 : 1'b0;
assign tx_frame_state_payload_to_padding = byte_end && tx_frame_state_payload && payload_byte_cnt_end && r_hw_padding_real_en;
assign tx_frame_state_payload_to_crc = byte_end && tx_frame_state_payload && payload_byte_cnt_end && (r_hw_crc_en || r_hw_crc_replace_en) && ~r_hw_padding_real_en;
assign tx_frame_state_payload_to_interval = byte_end && tx_frame_state_payload && payload_byte_cnt_end && ~r_hw_crc_en && ~r_hw_crc_replace_en;//hw padding enable must be with hw crc enable

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		payload_byte_cnt <= 12'b0;
		payload_byte_end <= 1'b0;
	end
	else if(tx_frame_state_payload && byte_end) // other data bit
	begin
		if(payload_byte_cnt_end) // payload byte end
		begin
			payload_byte_end <= 1'b1;
			payload_byte_cnt <= payload_byte_cnt;
		end
		else
		begin
			payload_byte_end <= 1'b0;
			payload_byte_cnt <= payload_byte_cnt + 1'b1;
		end
	end
	else if(tx_frame_state_preamble_to_payload) // (timing clk issue) first data bit
	begin
		payload_byte_cnt <= payload_byte_cnt + 1'b1;
		payload_byte_end <= 1'b0;
	end
	else if(~tx_frame_state_payload) // clear data cnt when is in last state
	begin
		payload_byte_cnt <= 12'b0;
		payload_byte_end <= 1'b0;
	end
	else
	begin
		payload_byte_cnt <= payload_byte_cnt;
		payload_byte_end <= payload_byte_end;
	end
end

//===============================================
// eth mac tx frame state: TX_FRAME_PADDING
//===============================================

reg				[ 5:0]			padding_byte_cnt;
reg								padding_byte_end;// last data byte
wire							padding_byte_cnt_end;
assign padding_byte_cnt_end = (padding_byte_cnt == r_tx_padding_length) ? 1'b1 : 1'b0;
assign tx_frame_state_padding_to_crc = byte_end && tx_frame_state_padding && padding_byte_cnt_end;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		padding_byte_cnt <= 6'b0;
		padding_byte_end <= 1'b0;
	end
	else if(tx_frame_state_padding && byte_end) // other data bit
	begin
		if(padding_byte_cnt_end) // padding byte end
		begin
			padding_byte_end <= 1'b1;
			padding_byte_cnt <= padding_byte_cnt;
		end
		else
		begin
			padding_byte_end <= 1'b0;
			padding_byte_cnt <= padding_byte_cnt + 1'b1;
		end
	end
	else if(tx_frame_state_payload_to_padding) // (timing clk issue) first data bit
	begin
		padding_byte_cnt <= padding_byte_cnt + 1'b1;
		padding_byte_end <= 1'b0;
	end
	else if(~tx_frame_state_padding) // clear data cnt when is in last state
	begin
		padding_byte_cnt <= 6'b0;
		padding_byte_end <= 1'b0;
	end
	else
	begin
		padding_byte_cnt <= padding_byte_cnt;
		padding_byte_end <= padding_byte_end;
	end
end

//===============================================
// eth mac tx frame state: TX_FRAME_CRC
//===============================================

reg				[ 2:0]			crc_byte_cnt;
reg								crc_byte_end;// last data byte
wire							crc_byte_cnt_end;
assign crc_byte_cnt_end = (crc_byte_cnt == 3'd4) ? 1'b1 : 1'b0;
assign tx_frame_state_crc_to_interval = byte_end && tx_frame_state_crc && crc_byte_cnt_end;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		crc_byte_cnt <= 3'h0;
		crc_byte_end <= 1'b0;
	end
	else if(tx_frame_state_crc && byte_end) // other data bit
	begin
		if(crc_byte_cnt_end) // crc byte end
		begin
			crc_byte_end <= 1'b1;
			crc_byte_cnt <= crc_byte_cnt;
		end
		else
		begin
			crc_byte_end <= 1'b0;
			crc_byte_cnt <= crc_byte_cnt + 1'b1;
		end
	end
	else if(tx_frame_state_padding_to_crc || tx_frame_state_payload_to_crc) // (timing clk issue) first data bit
	begin
		crc_byte_cnt <= crc_byte_cnt + 1'b1;
		crc_byte_end <= 1'b0;
	end
	else if(~tx_frame_state_crc) // clear data cnt when is in last state
	begin
		crc_byte_cnt <= 3'h0;
		crc_byte_end <= 1'b0;
	end
	else
	begin
		crc_byte_cnt <= crc_byte_cnt;
		crc_byte_end <= crc_byte_end;
	end
end

//===============================================
// eth mac tx frame state: TX_FRAME_INTERVAL
//===============================================

reg				[ 6:0]			interval_byte_cnt;
reg								interval_byte_end;// last interval byte
wire							interval_byte_cnt_end;
assign interval_byte_cnt_end = (interval_byte_cnt == (7'd5 + r_interval_byte)) ? 1'b1 : 1'b0;
//assign tx_frame_state_interval_to_preamble = byte_end && tx_frame_state_interval && interval_byte_cnt_end && tx_enable;// tx still enable 
assign tx_frame_state_interval_to_end = byte_end && tx_frame_state_interval &&  interval_byte_cnt_end;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		interval_byte_cnt <= 7'b0;
		interval_byte_end <= 1'b0;
	end
	else if(tx_frame_state_interval && byte_end) // other interval byte
	begin
		if(interval_byte_cnt_end) // interval byte end
		begin
			interval_byte_end <= 1'b1;
			interval_byte_cnt <= interval_byte_cnt;
		end
		else
		begin
			interval_byte_end <= 1'b0;
			interval_byte_cnt <= interval_byte_cnt + 1'b1;
		end
	end
	else if(tx_frame_state_payload_to_interval || tx_frame_state_crc_to_interval) // (timing clk issue) first interval byte (this must be before above)
	begin
		interval_byte_cnt <= interval_byte_cnt + 1'b1;
		interval_byte_end <= 1'b0;
	end
	else if(~tx_frame_state_interval) // clear interval cnt when is in last state
	begin
		interval_byte_cnt <= 1'b0;
		interval_byte_end <= 1'b0;
	end
	else
	begin
		interval_byte_cnt <= interval_byte_cnt;
		interval_byte_end <= interval_byte_end;
	end
end

//===============================================
// eth mac tx frame state: TX_FRAME_END
// this state is used to handle some unfinish issue
//===============================================

//reg								tx_end;
//assign tx_frame_state_end_to_idle = tx_end;
assign pe_tx_end = tx_frame_state_end;
//
//always @(posedge pe_tx_clk or negedge pe_tx_rstn)
//begin
//	if(!pe_tx_rstn)
//		tx_end <= 1'b0;
//	else if(tx_frame_state_end)
//		tx_end <= 1'b1;
//	else
//		tx_end <= 1'b0;
//end

//===============================================
// eth tx data prepare
//===============================================

reg				[10:0]			tx_data;// last bit is used to park data ptr
wire			[ 7:0]			tx_frame_data;
reg								tx_frame_data_re;
wire			[31:0]			tx_frame_crc;
wire			[ 7:0]			tx_frame_crc_data;
wire							tx_frame_crc_en;
reg								tx_data_mode;
assign r_hw_padding_real_en = r_hw_padding_en && (|r_tx_payload_byte_real_length[11:6] == 1'b0) && (&r_tx_payload_byte_real_length[5:2] == 1'b0);// minimum byte length is 60 (crc is not under consideration)
assign r_tx_padding_length = r_hw_padding_real_en ? (6'd60 - r_tx_payload_byte_real_length[5:0]) : 6'h0; 
assign r_tx_frame_byte_real_length = r_hw_crc_replace_en ? (r_tx_payload_byte_real_length - 3'd4) : r_tx_payload_byte_real_length; 

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_data_mode <= 1'b0;
	end
	else if(pe_tx_logic_clr || tx_frame_state_payload_to_interval || tx_frame_state_crc_to_interval)
	begin
		tx_data_mode <= 1'b0;
	end
	else if(tx_frame_state_idle_to_preparation)
	begin
		tx_data_mode <= 1'b1;
	end
	else
	begin
		tx_data_mode <= tx_data_mode;
	end
end

eth_mac_pe_tx_protocol_handle u_eth_mac_pe_tx_protocol_handle
(
	.pe_tx_clk							(pe_tx_clk),  
	.pe_tx_rstn							(pe_tx_rstn),

	.txdb_pe2fifo_re					(txdb_pe2fifo_re),
	.txdb_pe2fifo_re_done				(txdb_pe2fifo_re_done),
	.txdb_fifo2pe_rdata					(txdb_fifo2pe_rdata),
	.txdb_fifo_empty					(txdb_fifo_empty),
	.txdb_fifo_done						(txdb_fifo_done),
	.txdb_fifo2pe_burst_process_done	(txdb_fifo2pe_burst_process_done),
	.txdb_fifo_ready					(txdb_fifo_ready),
	.tx_byte_data						(tx_frame_data),
	.tx_byte_data_re					(tx_frame_data_re),

	.pe_tx_logic_clr					(pe_tx_logic_clr),
	.tx_data_mode						(tx_frame_state_idle_to_preparation || tx_data_mode),	
	.tx_handle_enable					(tx_frame_state_idle_to_preparation || tx_frame_state_idle_to_preamble),
	.tx_handle_done						(tx_frame_preparation_done),	
	.tx_done							(pe_tx_end),

	.r_sa_macaddr						(r_sa_macaddr),
	.r_interval_byte					(r_interval_byte),
                            		                            
	.r_tx_payload_byte_length			(r_tx_payload_byte_length),
	.r_tx_payload_byte_real_length		(r_tx_payload_byte_real_length),
	.r_hw_sa_mac_en						(r_hw_sa_mac_en),
	.r_hw_sa_mac_replace_en				(r_hw_sa_mac_replace_en),
	.r_hw_crc_en						(r_hw_crc_en),
	.r_hw_crc_replace_en				(r_hw_crc_replace_en),
	.r_hw_padding_en					(r_hw_padding_en),
	.r_hw_cs_en							(r_hw_cs_en),
	.r_hw_cs_replace_en					(r_hw_cs_replace_en)
);

// load data from tx handle
always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		tx_frame_data_re <= 1'b0;
	end
	else if(pe_tx_logic_clr || tx_frame_state_payload_to_interval || tx_frame_state_crc_to_interval)
	begin
		tx_frame_data_re <= 1'b0;
	end
	// bypass mode from precache (no need wait)
	else if(~tx_data_mode && tx_frame_state_preamble_to_payload || (tx_frame_state_payload && byte_end))
	begin
		tx_frame_data_re <= 1'b1;
	end
	// cache mode from tx cache ram (need another 2 clks to wait)
	else if(tx_data_mode && (tx_frame_state_pre2_preamble_to_payload || tx_frame_state_pre_preamble_to_payload || tx_frame_state_preamble_to_payload || (tx_frame_state_payload && byte_end)))
	begin
		tx_frame_data_re <= 1'b1;
	end
	else
	begin
		tx_frame_data_re <= 1'b0;
	end
end

// Crx calculation only performs when hardware crc is enable and tx fsm is at
// data payload state or padding state.
assign tx_frame_crc_en = ((tx_frame_data_re && tx_frame_state_payload) || (half_byte_end && tx_frame_state_padding)) && (r_hw_crc_en || r_hw_crc_replace_en);
assign tx_frame_crc_data = tx_frame_state_payload ? tx_frame_data : 8'h0;// timing ok???

crc32d8 u_eth_mac_pe_tx_crc
(
	.clk						(pe_tx_clk),
	.rstn						(pe_tx_rstn),
	.clr						(pe_tx_logic_clr),

    .data						(tx_frame_crc_data),
	.en							(tx_frame_crc_en),
    .newcrc_result				(tx_frame_crc)
);

//===============================================
// pin control
// default state:
// tx high
// tx disable
//===============================================

assign eth_tx_clk = clk_gen; 
assign eth_tx_clk_oen = timing_base_enable;

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		eth_tx <= 4'h0;
		eth_tx_oen <= 4'hf;
	end
	// current state inside: START or END
	else if(pe_tx_logic_clr || tx_frame_state_end)
	begin
		eth_tx <= 4'h0;
		eth_tx_oen <= 4'hf;
	end
	// current state inside: DATA PARITY STOP INTERVAL
	else if(byte_end == 1'b1)
	begin
		// the order is critical, cannot be changed randomly
		// some conditions cannot reach when half_byte_end = 1
		// those will reach when byte_end = 1 !!!
	//	if(tx_frame_state_interval_to_end)
	//	begin
	//		eth_tx <= 4'hf;
	//		eth_tx_oen <= 4'hf;
	//	end
	//	else if(tx_frame_state_interval || tx_frame_state_crc_to_interval || tx_frame_state_payload_to_interval)
		if(tx_frame_state_interval || tx_frame_state_crc_to_interval || tx_frame_state_payload_to_interval)
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'hf;
		end
		else if(tx_frame_state_crc || tx_frame_state_padding_to_crc || tx_frame_state_payload_to_crc)
		begin
			eth_tx <= tx_frame_crc[((crc_byte_cnt<<3)+0)+:4];
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_padding || tx_frame_state_payload_to_padding)
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_payload || tx_frame_state_preamble_to_payload)
		begin
			eth_tx <= tx_frame_data[3:0];
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_preamble || tx_frame_state_idle_to_preamble || tx_frame_state_preparation_to_preamble)
		begin
			if(preamble_byte_cnt == r_pre_byte)
			begin
				eth_tx <= 4'h5;
			end
			else
			begin
				eth_tx <= 4'h5;
			end
			eth_tx_oen <= 4'h0;
		end
		else
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'hf;
		end
	end
	else
//	else if(byte_end == 1'b1)
	begin
		// the order is critical, cannot be changed randomly
		if(tx_frame_state_interval_to_end)
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'hf;
		end
		else if(tx_frame_state_interval || tx_frame_state_crc_to_interval || tx_frame_state_payload_to_interval)
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'hf;
		end
		else if(tx_frame_state_crc || tx_frame_state_padding_to_crc || tx_frame_state_payload_to_crc)
		begin
			eth_tx <= tx_frame_crc[(((crc_byte_cnt-1)<<3)+4)+:4];
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_padding || tx_frame_state_payload_to_padding)
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_payload || tx_frame_state_preamble_to_payload)
		begin
			eth_tx <= tx_frame_data[7:4];
			eth_tx_oen <= 4'h0;
		end
		else if(tx_frame_state_preamble || tx_frame_state_idle_to_preamble || tx_frame_state_preparation_to_preamble)
		begin
//			if(preamble_byte_cnt == (r_pre_byte - 1'b1))
			if(preamble_byte_cnt == r_pre_byte)
			begin
				eth_tx <= 4'hd;
			end
			else
			begin
				eth_tx <= 4'h5;
			end
			eth_tx_oen <= 4'h0;
		end
		else
		begin
			eth_tx <= 4'h0;
			eth_tx_oen <= 4'hf;
		end
	end
//	else
//	begin
//		eth_tx <= eth_tx;
//		eth_tx_oen <= eth_tx_oen;
//	end
end

always @(posedge pe_tx_clk or negedge pe_tx_rstn)
begin
	if(!pe_tx_rstn)
	begin
		eth_tx_ctrl <= 1'b0;
		eth_tx_ctrl_oen <= 1'b1;
	end
	// current state inside: START or END
	else if(pe_tx_logic_clr || tx_frame_state_payload_to_interval || tx_frame_state_crc_to_interval)
	begin
		eth_tx_ctrl <= 1'b0;
		eth_tx_ctrl_oen <= 1'b1;
	end
	else if(tx_frame_state_preparation_to_preamble || tx_frame_state_idle_to_preamble || tx_frame_state_preamble || tx_frame_state_payload || tx_frame_state_padding || tx_frame_state_crc)
	begin
		eth_tx_ctrl <= ~eth_tx_ctrl;
		eth_tx_ctrl_oen <= 1'b0;
	end
//	else if(tx_frame_state_end)
//	begin
//		eth_tx_ctrl <= ~eth_tx_ctrl;
//		eth_tx_ctrl_oen <= 1'b0;
//	end
	else
	begin
		eth_tx_ctrl <= eth_tx_ctrl;
		eth_tx_ctrl_oen <= eth_tx_ctrl_oen;
	end
end

//===============================================
// interrupt status detect
//===============================================

assign int_status_tx_done = tx_frame_state_end; 

endmodule


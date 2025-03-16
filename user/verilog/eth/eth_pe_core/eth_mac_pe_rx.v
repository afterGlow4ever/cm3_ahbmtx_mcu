//===============================================
//
//	File: eth_mac_pe_rx.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01052024
//	Version: v1.0
//
// 	This is rx protocol engine for ethernet mac.
//
//===============================================

module eth_mac_pe_rx
(
	input  						pe_rx_clk,  
	input  						pe_rx_rstn,

	// data
	input 						rxdb_pe2fifo_we,//frame start
	output 						rxdb_pe2fifo_we_done,// frame end
	output		[31:0]			rxdb_pe2fifo_wdata,
//	input						rxdb_fifo_full,
	input						rxdb_fifo_done,
//	input						rxdb_fifo2pe_burst_process_done,
	input						rxdb_fifo_ready,// after arbitration	

	// pin rgmii
	input 		[ 3:0]			eth_rx,
	output reg	[ 3:0]			eth_rx_oen,
	input 						eth_rx_ctrl,
	output reg					eth_rx_ctrl_oen,
	input						eth_rx_clk,
	output						eth_rx_clk_oen,

	// control
	input						pe_rx_logic_clr,
	input						pe_rx_clk_enable,
	input						pe_rx_data_enable,
	input						pe_rx_data_enable_r,
	output 						pe_rx_data_start,
	output 						pe_rx_data_end,

	// config from regs
	input		[47:0]			r_sa_macaddr,
	input		[ 3:0]			r_pre_byte,
	input		[ 5:0]			r_interval_byte,
	input						r_cs_rm,
	input						r_pc_rm,

	// config out
	output reg	[11:0]			r_rx_payload_byte_length,


	input						int_status_rx_done
);

//===============================================
// eth mac rx configuration
//===============================================

reg								rx_data_valid;
reg								rx_data_error;
reg								rx_data_byte_end;
reg				[ 7:0]			rx_frame_data;

//===============================================
// eth rx frame fsm
// three segments fsm
// 1. state transition
// 2. state condition determine
// 3. state output
//===============================================

localparam						RX_FRAME_IDLE = 5'b00001;
localparam						RX_FRAME_DETECT = 5'b000010;
localparam						RX_FRAME_PAYLOAD = 5'b00100;
localparam						RX_FRAME_HANDLE = 5'b01000;
localparam						RX_FRAME_END = 5'b10000;

reg				[ 4:0]			current_state;
reg				[ 4:0]			next_state;

wire							rx_frame_state_idle;
wire							rx_frame_state_detect;
wire							rx_frame_state_payload;
wire							rx_frame_state_handle;
wire							rx_frame_state_end;
wire							rx_frame_state_idle_to_detect;
wire							rx_frame_state_detect_to_payload;
wire							rx_frame_state_detect_to_end;
wire							rx_frame_state_payload_to_handle;
wire							rx_frame_state_payload_to_end;
wire							rx_frame_state_handle_to_end;
wire							rx_frame_state_end_to_idle;

// state transition: sequential logic circuit
always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
		current_state <= RX_FRAME_IDLE;
	else
		current_state <= next_state;
end

// state condition determine: combinational logic circuit
// RX_FRAME_IDLE:
// -> RX_FRAME_DETECT: received data valid
// RX_FRAME_DETECT:
// -> RX_FRAME_PAYLOAD: received valid preamble
// -> RX_FRAME_END: received invalid data or error
// RX_FRAME_PAYLOAD:
// -> RX_FRAME_HANDLE: received invalid data
// -> RX_FRAME_END: received error or number exceed
// RX_FRAME_HANDLE:
// -> RX_FRAME_END: payload bits handling ended
// RX_FRAME_END: 
// -> RX_FRAME_IDLE: prepare for deinit (reserved)
// All state should transition to RX_FRAME_IDLE when:
// 1. received logic clear
// 2. protocol error occured 

always @(*)
begin
	case (current_state)
	RX_FRAME_IDLE:
		if(rx_frame_state_idle_to_detect)
			next_state = RX_FRAME_DETECT;
		else
			next_state = RX_FRAME_IDLE;
	RX_FRAME_DETECT:
		if(pe_rx_logic_clr)
			next_state = RX_FRAME_IDLE;
		else if(rx_frame_state_detect_to_payload)
			next_state = RX_FRAME_PAYLOAD;
		else if(rx_frame_state_detect_to_end)
			next_state = RX_FRAME_END;
		else
			next_state = RX_FRAME_DETECT;
	RX_FRAME_PAYLOAD:
		if(pe_rx_logic_clr)
			next_state = RX_FRAME_IDLE;
		else if(rx_frame_state_payload_to_handle)
			next_state = RX_FRAME_HANDLE;
		else if(rx_frame_state_payload_to_end)
			next_state = RX_FRAME_END;
		else
			next_state = RX_FRAME_PAYLOAD;
	RX_FRAME_HANDLE:
		if(pe_rx_logic_clr)
			next_state = RX_FRAME_IDLE;
		else if(rx_frame_state_handle_to_end)
			next_state = RX_FRAME_END;
		else
			next_state = RX_FRAME_HANDLE;
	RX_FRAME_END:
		next_state = RX_FRAME_IDLE;
	default:
		next_state = RX_FRAME_IDLE;
	endcase
end

// state output: combinational logic circuit
assign rx_frame_state_idle = current_state == RX_FRAME_IDLE;
assign rx_frame_state_detect = current_state == RX_FRAME_DETECT;
assign rx_frame_state_payload = current_state == RX_FRAME_PAYLOAD;
assign rx_frame_state_handle = current_state == RX_FRAME_HANDLE;
assign rx_frame_state_end = current_state == RX_FRAME_END;

//===============================================
// eth mac rx frame state initial
//===============================================

assign rx_frame_state_idle_to_detect = pe_rx_clk_enable && rx_data_valid;

//===============================================
// eth mac rx frame state: RX_FRAME_DETECT
//===============================================

reg				[ 3:0]			detect_bit_cnt;
reg								detect_bit_end;// last data bit
reg								preamble_detected;
assign rx_frame_state_detect_to_payload = rx_frame_state_detect && preamble_detected;
assign rx_frame_state_detect_to_end = rx_frame_state_detect && (~rx_data_valid || rx_data_error);

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		detect_bit_cnt <= 4'b0;
		detect_bit_end <= 1'b0;
	end
	else if(rx_frame_state_detect && rx_data_byte_end) // other data bit
	begin
		if(rx_frame_data == 8'h55)
		begin
			if(detect_bit_cnt == r_pre_byte)
			begin
				detect_bit_end <= 1'b1;
				detect_bit_cnt <= detect_bit_cnt;
			end
			else
				detect_bit_end <= 1'b0;
				detect_bit_cnt <= detect_bit_cnt + 1'b1;
			end
		end
		else
		begin
			detect_bit_cnt <= 4'b0;
			detect_bit_end <= 1'b0;
		end
	end
	else if(rx_frame_state_end) // clear data cnt when is in last state
	begin
		detect_bit_cnt <= 4'b0;
		detect_bit_end <= 1'b0;
	end
	else
	begin
		detect_bit_cnt <= detect_bit_cnt;
		detect_bit_end <= detect_bit_end;
	end
end

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		preamble_detected <= 1'b0;
	end
	else if(rx_frame_state_detect && ~rx_data_byte_end && detect_bit_end && (rx_frame_data[3:0] == 4'hd))
	begin
		preamble_detected <= 1'b1;
	end
	else
	begin
		preamble_detected <= 1'b0;
	end
end

//===============================================
// eth mac rx frame state: RX_FRAME_PAYLOAD
//===============================================

reg				[11:0]			data_bit_cnt;
reg								data_bit_end;// last data bit
assign rx_frame_state_payload_to_handle = rx_frame_state_payload && ~rx_data_valid;
assign rx_frame_state_payload_to_end = rx_frame_state_data && (data_bit_end || rx_data_error);

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		data_bit_cnt <= 12'h0;
		data_bit_end <= 1'b0;
	end
	else if(rx_frame_state_data && rx_data_byte_end) // other data bit
	begin
		if(data_bit_cnt == 12'h101)
		begin
			data_bit_end <= 1'b1;
			data_bit_cnt <= data_bit_cnt;
		end
		else
			data_bit_end <= 1'b0;
			data_bit_cnt <= data_bit_cnt + 1'b1;
		end
	end
	else if(rx_frame_state_end) // clear data cnt when is in last state
	begin
		data_bit_cnt <= 12'h0;
		data_bit_end <= 1'b0;
	end
	else
	begin
		data_bit_cnt <= data_bit_cnt;
		data_bit_end <= data_bit_end;
	end
end

// initial value is max because
// the frame length is unknown
always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		r_rx_payload_byte_length <= 12'h100;
	end
	else if(rx_frame_state_payload_to_handle)
	begin
//		if(r_cs_rm)//??? padding -? or crc -4
		r_rx_payload_byte_length <= data_bit_cnt;
	end
	else
	begin
		r_rx_payload_byte_length <= r_rx_payload_byte_length;
	end
end

//===============================================
// eth rx data process
// if an error detect, it will sustain until stop bit end.
// whether error data is discard or not, the judgement will happen in stop state
//===============================================

//reg								rx_frame_byte_data_we;
wire							rx_frame_byte_data_we;
wire			[ 7:0]			rx_frame_byte_data;
wire							rx_frame_byte_data_done;
wire			[31:0]			rx_frame_crc;
wire			[ 7:0]			rx_frame_crc_data;
reg				[ 7:0]			rx_frame_crc_data_result[3:0];
wire							rx_frame_crc_en;
assign rx_frame_byte_data = rx_frame_data;
assign rx_frame_byte_data_done = rx_frame_state_payload_to_handle;

// push data to rx handle
assign rx_frame_byte_data_we = rx_frame_state_payload ? rx_data_byte_end : 1'b0;
//always @(posedge pe_rx_clk or negedge pe_rx_rstn)
//begin
//	if(!pe_rx_rstn)
//	begin
//		rx_frame_byte_data_we <= 1'b0;
//	end
//	else if(pe_rx_logic_clr || rx_frame_state_detect_to_payload || rx_frame_state_payload_to_handle)
//	begin
//		rx_frame_byte_data_we <= 1'b0;
//	end
//	else if(rx_frame_state_payload && rx_data_byte_end)
//	begin
//		tx_frame_data_we <= 1'b1;
//	end
//	else
//	begin
//		tx_frame_data_we <= 1'b0;
//	end
//end

eth_mac_pe_rx_protocol_handle u_eth_mac_pe_rx_protocol_handle
(
	.pe_rx_clk							(pe_rx_clk),  
	.pe_rx_rstn							(pe_rx_rstn),

	.rxdb_pe2fifo_we					(rxdb_pe2fifo_we),
	.rxdb_pe2fifo_we_done				(rxdb_pe2fifo_we_done),
	.rxdb_pe2fifo_wdata					(rxdb_pe2fifo_wdata),
//	.rxdb_fifo_full						(rxdb_fifo_full),
	.rxdb_fifo_done						(rxdb_fifo_done),
//	.rxdb_fifo2pe_burst_process_done	(rxdb_fifo2pe_burst_process_done),
//	.rxdb_fifo_ready					(rxdb_fifo_ready),
	.rx_frame_byte_data					(rx_frame_byte_data),
	.rx_frame_byte_data_we				(rx_frame_byte_data_we),
	.rx_frame_byte_data_done			(rx_frame_byte_data_done),

	.pe_rx_logic_clr					(pe_rx_logic_clr),
	.rx_handle_done						(),

	.r_sa_macaddr						(r_sa_macaddr),
	.r_cs_rm							(r_cs_rm),
	.r_pc_rm							(r_pc_rm),

	.r_rx_payload_byte_length			(r_rx_payload_byte_length),
	.r_rx_payload_byte_real_length		()
);



// Crx calculation only performs when hardware crc is enable and tx fsm is at
assign rx_frame_crc_en = rx_frame_byte_data_we && (r_cs_rm || r_pc_rm);
assign rx_frame_crc_data = rx_frame_data;

crc32d8 u_eth_mac_pe_rx_crc
(
	.clk						(pe_rx_clk),
	.rstn						(pe_rx_rstn),
	.clr						(pe_rx_logic_clr),

    .data						(rx_frame_crc_data),
	.en							(rx_frame_crc_en),
    .newcrc_result				(rx_frame_crc)
);

// 8??
always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_frame_crc_data_result[0] <= 8'h0;
		rx_frame_crc_data_result[1] <= 8'h0;
		rx_frame_crc_data_result[2] <= 8'h0;
		rx_frame_crc_data_result[3] <= 8'h0;
	end
	else if(rx_frame_crc_en)
	begin
		rx_frame_crc_data_result[0] <= rx_frame_crc;
		rx_frame_crc_data_result[1] <= rx_frame_crc_data_result[0];
		rx_frame_crc_data_result[2] <= rx_frame_crc_data_result[1];
		rx_frame_crc_data_result[3] <= rx_frame_crc_data_result[2];
	end
	else
	begin
		rx_frame_crc_data_result[0] <= rx_frame_crc_data_result[0];
		rx_frame_crc_data_result[1] <= rx_frame_crc_data_result[1];
		rx_frame_crc_data_result[2] <= rx_frame_crc_data_result[2];
		rx_frame_crc_data_result[3] <= rx_frame_crc_data_result[3];
	end
end

//===============================================
// pin control
// default state:
// rx high
// rx disable
//===============================================

assign eth_rx_clk_oen = pe_rx_clk_enable ? 1'b1 : 1'b0;//??? regsotu
assign eth_rx_ctrl_oen = pe_rx_clk_enable ? 1'b1 : 1'b0;

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_data_valid <= 1'b0;
	end
	else if(eth_rx_ctrl)
	begin
		rx_data_valid <= 1'b1;
	end
	else
	begin
		rx_data_valid <= 1'b0;
	end
end

// if detect data error, current frame should discard
always @(negedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_data_error <= 1'b0;
	end
	else if(pe_rx_logic_clr || rx_frame_state_end)
	begin
		rx_data_error <= 1'b0;
	end
	else if(eth_rx_ctrl)
	begin
		rx_data_error <= 1'b1;
	end
	else
	begin
		rx_data_error <= rx_data_error;
	end
end

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_data_byte_end <= 1'b0;
	end
	else if(pe_rx_logic_clr)
	begin
		rx_data_byte_end <= 1'b0;
	end
	else if(eth_rx_ctrl)
	begin
		rx_data_byte_end <= ~rx_data_byte_end;
	end
	else
	begin
		rx_data_byte_end <= 1'b0;
	end
end

always @(posedge pe_rx_clk or negedge pe_rx_rstn)
begin
	if(!pe_rx_rstn)
	begin
		rx_frame_data <= 8'h0;
	end
	else if(eth_rx_ctrl)
	begin
		rx_frame_data[(1 << rx_data_byte_end)+:4] <= eth_rx;
	end
	else
	begin
		rx_frame_data <= rx_frame_data;
	end
end

endmodule



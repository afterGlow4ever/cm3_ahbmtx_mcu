//===============================================
//
//	File: spim_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 10042025
//	Version: v1.0
//
// 	This model is simulate spi slave trans.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module spis_model
#(
	parameter					BIT_TIMING = 25
)
(
	input						spim_sck,
	input						spim_cs,
	input						spim_mosi,
	output reg					spim_miso
);


reg				[31:0] 			byte_cnt;
reg				[ 7:0] 			bit_cnt;

//===============================================
// status init
//===============================================


//===============================================
// spim tx data
//===============================================

task tx_1byte_data;
	input		[ 1:0]			mode;
	input						cs_mode;
	input		[ 7:0] 			tx_data;

`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR]  mode %8h.", mode);
`endif


	if(cs_mode)
	begin
		@(negedge spim_cs);
	end
	if(mode == 2'h0)
	begin
		bit_cnt = 0;
		spim_miso =  tx_data[bit_cnt];
		bit_cnt = 1;
		for(; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA0
			@(negedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
	else if(mode == 2'h1)
	begin
		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA1
			@(posedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
	else if(mode == 2'h2)
	begin
		bit_cnt = 0;
		spim_miso =  tx_data[bit_cnt];
		bit_cnt = 1;
		for(; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA2
			@(posedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
	else
	begin
		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA3
			@(negedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR] tx data %8h.", tx_data);
`endif

	if(cs_mode)
	begin
		@(posedge spim_cs);
	end
endtask

task tx_data;
	input		[ 1:0]			mode;
	input						cs_mode;
	input		[ 7:0] 			tx_data;
	input		[31:0] 			tx_data_num;

`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR]  mode %8h.", mode);
`endif


	if(cs_mode)
	begin
		@(negedge spim_cs);
	end
	if(mode == 2'h0)
	begin
		bit_cnt = 0;
		spim_miso =  tx_data[bit_cnt];
		bit_cnt = 1;
		for(byte_cnt = 0; byte_cnt < tx_data_num; byte_cnt++)
		begin: TX_BYTE_DATA0
			for(; bit_cnt < 8; bit_cnt++)
			begin: TX_BIT_DATA0
				@(negedge spim_sck)
				spim_miso = tx_data[bit_cnt];
			end
			bit_cnt = 0;
			tx_data = tx_data + byte_cnt;
		end
	end
	else if(mode == 2'h1)
	begin
		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA1
			@(posedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
	else if(mode == 2'h2)
	begin
		bit_cnt = 0;
		spim_miso =  tx_data[bit_cnt];
		bit_cnt = 1;
		for(; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA2
			@(posedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
	else
	begin
		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
		begin: TX_BIT_DATA3
			@(negedge spim_sck)
			spim_miso = tx_data[bit_cnt];
		end
	end
`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR] tx data %8h.", tx_data);
`endif

	if(cs_mode)
	begin
		@(posedge spim_cs);
	end
endtask


//===============================================
// spim rx data
//===============================================

//task rx_1byte_data;
//	input		[1:0]			mode;
//	input						cs_mode;
//	output reg	[7:0] 			rx_data;
//
//	rx_data = 8'h0;
//
//
//	if((mode == 2'h1) || (mode == 2'h2))
//	begin
//		@(negedge spim_sck)
//		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
//		begin: RX_BIT_DATA
//			rx_data[bit_cnt] = spim_mosi && ~spim_cs;
//		end
//	end
//	else
//	begin
//		@(posedge spim_sck)
//		for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
//		begin: RX_BIT_DATA
//			rx_data[bit_cnt] = spim_mosi && ~spim_cs;
//		end
//	end
//`ifdef SPIM_MONITOR
//	$display($time, "[SPIM MONITOR] rx data %8h.", rx_data);
//`endif
//
//endtask

task rx_data;
	input		[ 1:0]			mode;
	input						cs_mode;
	output reg	[ 7:0] 			rx_data;
	input		[31:0] 			rx_data_num;

	rx_data = 8'h0;

`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR]  mode %8h.", mode);
`endif

	if(cs_mode)
	begin
		@(negedge spim_cs);
	end

	for(byte_cnt = 0; byte_cnt < rx_data_num; byte_cnt++)
	begin: RX_BYTE_DATA

		if((mode == 2'h1) || (mode == 2'h2))
		begin
			for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
			begin: RX_BIT_DATA0
				@(negedge spim_sck)
				rx_data[bit_cnt] = spim_mosi;
//`ifdef SPIM_MONITOR
//	$display($time, "[SPIM MONITOR] rx mode12 bit %8h.", bit_cnt);
//	$display($time, "[SPIM MONITOR] rx data %8h.", rx_data);
//`endif
			end
		end
		else
		begin
			for(bit_cnt = 0; bit_cnt < 8; bit_cnt++)
			begin: RX_BIT_DATA1
				@(posedge spim_sck)
				rx_data[bit_cnt] = spim_mosi;
//`ifdef SPIM_MONITOR
//	$display($time, "[SPIM MONITOR] rx mode03 bit %8h.", bit_cnt);
//	$display($time, "[SPIM MONITOR] rx data %8h.", rx_data);
//`endif
			end
		end
`ifdef SPIM_MONITOR
	$display($time, "[SPIM MONITOR] rx byte %8h data %8h.", byte_cnt, rx_data);
`endif
	end

	if(cs_mode)
	begin
		@(posedge spim_cs);
	end
endtask

endmodule



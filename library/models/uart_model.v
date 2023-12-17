//===============================================
//
//	File: uart_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 12092023
//	Version: v1.0
//
// 	This model is simulate uart tx & rx.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module uart_model
#(
	parameter					BIT_TIMING = 8681
)
(
	input						uart_rx,
	output reg					uart_tx
);

//===============================================
// status init
//===============================================

initial
begin
	uart_tx = 1'b1;
end

//===============================================
// uart tx data
//===============================================

task put_char;
	input		[7:0] 			tx_data;

	#BIT_TIMING
	uart_tx = 1'b0;

	for(int bit_cnt = 0; bit_cnt < 4'h8; bit_cnt++)
	begin: TX_DATA
		#BIT_TIMING
		uart_tx = tx_data[bit_cnt];
	end

	#BIT_TIMING
	uart_tx = 1'b1;

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] tx data %10h.", tx_data);
`endif
endtask

task tx_data_specify_with_no_parity;
	input		[3:0]			data_bit_num;
	input		[1:0]			stop_bit_num;
	input		[3:0]			interval_bit_num;
	input		[9:0] 			tx_data;
	input		[1:0] 			tx_stop;

	#BIT_TIMING
	uart_tx = 1'b0;

	for(int bit_cnt = 0; bit_cnt < data_bit_num; bit_cnt++)
	begin: TX_DATA
		#BIT_TIMING
		uart_tx = tx_data[bit_cnt];
	end

	for(int bit_cnt = 0; bit_cnt < stop_bit_num; bit_cnt++)
	begin: TX_STOP
		#BIT_TIMING
		uart_tx = tx_stop[bit_cnt];
	end

	for(int bit_cnt = 0; bit_cnt < interval_bit_num; bit_cnt++)
	begin: TX_INTERVAL
		#BIT_TIMING
		uart_tx = 1'b1;
	end

	#BIT_TIMING
	uart_tx = 1'b1;

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] tx data %10h with %2d stop bit.", tx_data, stop_bit_num);
`endif
endtask

task tx_data_specify_with_parity;
	input		[ 3:0]			data_bit_num;
	input		[ 1:0]			stop_bit_num;
	input		[ 3:0]			interval_bit_num;
	input		[10:0] 			tx_data;
	input		[ 1:0] 			tx_stop;
	input			 			tx_parity;

	#BIT_TIMING
	uart_tx = 1'b0;

	for(int bit_cnt = 0; bit_cnt < data_bit_num; bit_cnt++)
	begin: TX_DATA
		#BIT_TIMING
		uart_tx = tx_data[bit_cnt];
	end

	#BIT_TIMING
	uart_tx = tx_parity;

	for(int bit_cnt = 0; bit_cnt < stop_bit_num; bit_cnt++)
	begin: TX_STOP
		#BIT_TIMING
		uart_tx = tx_stop[bit_cnt];
	end

	for(int bit_cnt = 0; bit_cnt < interval_bit_num; bit_cnt++)
	begin: TX_INTERVAL
		#BIT_TIMING
		uart_tx = 1'b1;
	end

	#BIT_TIMING
	uart_tx = 1'b1;

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] tx data %10h with %1b parity bit & %2d stop bit.", tx_data, tx_parity, stop_bit_num);
`endif
endtask

//===============================================
// uart rx data
//===============================================

task rx_data_specify_with_no_parity;
	input		[3:0]			data_bit_num;
	input		[1:0]			stop_bit_num;
	output		[9:0] 			rx_data;
	output		[1:0] 			rx_stop;

	rx_data = 10'h0;
	rx_stop = 2'h0;
	wait(uart_rx == 1'b0);

	#(BIT_TIMING/2)

	for(int bit_cnt = 0; bit_cnt < data_bit_num; bit_cnt++)
	begin: RX_DATA
		#BIT_TIMING
		rx_data[bit_cnt] = uart_rx;
	end

	for(int bit_cnt = 0; bit_cnt < stop_bit_num; bit_cnt++)
	begin: RX_STOP
		#BIT_TIMING
		rx_stop[bit_cnt] = uart_rx;
	end

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] rx data %10h with %2d stop bit.", rx_data, stop_bit_num);
`endif
endtask

task rx_data_specify_with_parity;
	input		[3:0]			data_bit_num;
	input		[1:0]			stop_bit_num;
	output		[9:0] 			rx_data;
	output		[1:0] 			rx_stop;
	output			 			rx_parity;

	rx_data = 10'h0;
	rx_stop = 2'h0;
	rx_parity = 1'b0;
	wait(uart_rx == 1'b0);

	#(BIT_TIMING/2)

	for(int bit_cnt = 0; bit_cnt < data_bit_num; bit_cnt++)
	begin: RX_DATA
		#BIT_TIMING
		rx_data[bit_cnt] = uart_rx;
	end

	#BIT_TIMING
	rx_parity = uart_rx;

	for(int bit_cnt = 0; bit_cnt < stop_bit_num; bit_cnt++)
	begin: RX_STOP
		#BIT_TIMING
		rx_stop[bit_cnt] = uart_rx;
	end

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] rx data %10h with %1b parity bit & %2d stop bit.", rx_data, rx_parity, stop_bit_num);
`endif
endtask

//===============================================
// uart parity calculation
//===============================================

task data_parity_cal;
	input		[1:0]			parity;
	input		[9:0] 			data;
	output						parity_bit;

	case(parity)
		2'h0:
			parity_bit = ^data;
		2'h1:
			parity_bit = ~(^data);
		2'h2:
			parity_bit = 1'b0;
		2'h3:
			parity_bit = 1'b1;
		default:
			parity_bit = 1'b1;
	endcase
endtask


//===============================================
// uart noise generation
//===============================================

task tx_noise;
	input		[3:0]			noise_bit_num;
	input		[4:0]			bit_div;

	uart_tx = 1'b1;

	for(int bit_cnt = 0; bit_cnt < noise_bit_num; bit_cnt++)
	begin: TX_DATA
		#(BIT_TIMING/bit_div)
		uart_tx = 1'b0;
	end

	#(BIT_TIMING/bit_div)
	uart_tx = 1'b1;

`ifdef UART_MONITOR
	$display($time, "[UART MONITOR] tx noise.");
`endif
endtask

endmodule



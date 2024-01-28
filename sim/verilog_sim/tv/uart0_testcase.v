//===============================================
//
//	File: uart0_testcase.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 07022023
//	Version: v1.0
//
//	This is stimulus for uart testcase.
//	Details are listed in uart_testcase.xls.
//
//===============================================

//===============================================
// clk and rst for swd
// simulation config
//===============================================

reg								jlink_rstn;

// jlink internal reset will be release at 10us
initial
begin
	jlink_rstn = 1'b0;
	#10000
	jlink_rstn = 1'b1;
end

//===============================================
// swd simulation model
//===============================================

pullup(tms);
pullup(tdo);
pulldown(tck);

jlink_model u_swd_model
(
	.rstn_i						(jlink_rstn),
	.tck_o						(tck),
	.tms_io						(tms),
	.tdi_i						(tdi),
	.tdo_o						(tdo),
	.trstn_o					(trstn),
	.tms_oen_o					()
);

//===============================================
// uart model
//===============================================

uart_model u_uart_model
(
	.uart_tx					(rxd),
	.uart_rx					(txd)
);

//===============================================
// uart command sequences
//===============================================

reg		[31:0]					data_sample[15:0];
reg		[31:0]					data_sample2;
reg		[ 1:0]					stop_sample;
reg								parity_sample;
reg		[ 9:0]					wdata;
reg		[ 9:0]					rdata;
reg		[ 1:0]					rstop;
reg								rparity;
reg		[31:0]					uart0_r_pe_ctrl;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;


initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	rdata = 32'h0;
	for(int data_i = 0; data_i < 16; data_i = data_i + 4)
	begin: DATA_INITIAL
		data_sample[0 + data_i] = 32'hffffffff; 
		data_sample[1 + data_i] = 32'h00000000; 
		data_sample[2 + data_i] = 32'ha55aa55a; 
		data_sample[3 + data_i] = 32'h5aa55aa5; 
	end
	stop_sample = 2'h3;
	uart0_r_pe_ctrl = 32'h0;
	u_sim_monitor.sim_monitor_init("uart test");
	u_swd_model.swd_init;
	test_start = 1'b1;
	// sim will finish 
	wait(test_end == 1'b1);
	#1000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("uart test");
	$finish;
end

//===============================================
// uart iut case
//===============================================

initial
begin	
	wait(test_start == 1'b1);
	#50000
`ifdef TP_0
	for(int iut_m = 0; iut_m < 8; iut_m = iut_m + 1)
	begin:TP_0_IUT3// This loop is used to traverse interval bit
		for(int iut_k = 0; iut_k < 2; iut_k = iut_k + 1)
		begin:TP_0_IUT2// This loop is used to traverse stop bit
			for(int iut_i = 0; iut_i < 4; iut_i = iut_i + 1)
			begin:TP_0_IUT0// This loop is used to traverse data bit
				uart0_r_pe_ctrl =	 2'h0+iut_i			<<  0 | // data bit
								 	 1'b0				<<  4 | // parity disable
									 1'b0+iut_k			<<  5 | // stop bit
									 4'h0+iut_m			<< 12 | // interval bit
								 	 4'hf				<< 16 | // os
									12'h16				<< 20 ; // baudrate divider
				u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
				
				#100
				u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
				u_swd_model.swd_writereg32(32'h40001004, 32'h001);
		
				for(int iut_j = 0; iut_j < 4; iut_j = iut_j + 1)
				begin:TP_0_IUT1// This loop is used to put data sample into tx fifo
					u_swd_model.swd_writereg32(32'h40001000, data_sample[iut_j]);
				end

				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_pe_core.u_uart_pe_tx.int_status_tx_done == 1'b1);
			end
		end
	end
`endif

`ifdef TP_1
	for(int iut_m = 0; iut_m < 4; iut_m = iut_m + 1)
	begin:TP_1_IUT3// This loop is used to traverse parity bit
		for(int iut_k = 0; iut_k < 2; iut_k = iut_k + 1)
		begin:TP_1_IUT2// This loop is used to traverse stop bit
			for(int iut_i = 0; iut_i < 4; iut_i = iut_i + 1)
			begin:TP_1_IUT0// This loop is used to traverse data bit
				uart0_r_pe_ctrl =	 2'h0+iut_i			<<  0 | // data bit
									 2'h0+iut_m			<<  2 | // parity bit
								 	 1'b1				<<  4 | // parity enable
									 1'b0+iut_k			<<  5 | // stop bit
								 	 4'hf				<< 16 | // os
									12'h16				<< 20 ; // baudrate divider
				u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
				
				#100
				u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
				u_swd_model.swd_writereg32(32'h40001004, 32'h001);
		
				for(int iut_j = 0; iut_j < 4; iut_j = iut_j + 1)
				begin:TP_1_IUT1// This loop is used to put data sample into tx fifo
					u_swd_model.swd_writereg32(32'h40001000, data_sample[iut_j]);
				end

				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_pe_core.u_uart_pe_tx.int_status_tx_done == 1'b1);
			end
		end
	end
`endif

`ifdef TP_2
	iut2lt_flag = 1'b0;
	for(int iut_m = 0; iut_m < 8; iut_m = iut_m + 1)
	begin:TP_1_IUT3// This loop is used to traverse interval bit
		for(int iut_k = 0; iut_k < 2; iut_k = iut_k + 1)
		begin:TP_1_IUT2// This loop is used to traverse stop bit
			for(int iut_i = 0; iut_i < 4; iut_i = iut_i + 1)
			begin:TP_1_IUT0// This loop is used to traverse data bit
				wait(lt2iut_flag == 1'b1);
				for(int iut_j = 0; iut_j < 4; iut_j = iut_j + 1)
				begin:TP_1_IUT1// This loop is used to check rx data 
//					wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] != 5'h0)
					#1000
					if(iut_j == 1'b0)
					begin
						u_swd_model.swd_readreg32(32'h4000101c, rdata);
					end
					u_swd_model.swd_readreg32(32'h4000101c, rdata);
					u_sim_monitor.sim_monitor_check_specify_width(iut_j, rdata, data_sample[iut_j], (4'h7 + iut_i-1), 0);				
				end
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] == 5'h0);
				iut2lt_flag = 1'b1;
				wait(lt2iut_flag == 1'b0);
				iut2lt_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_3
	iut2lt_flag = 1'b0;
	for(int iut_m = 0; iut_m < 8; iut_m = iut_m + 1)
	begin:TP_1_IUT3// This loop is used to traverse parity bit
		for(int iut_k = 0; iut_k < 2; iut_k = iut_k + 1)
		begin:TP_1_IUT2// This loop is used to traverse stop bit
			for(int iut_i = 0; iut_i < 4; iut_i = iut_i + 1)
			begin:TP_1_IUT0// This loop is used to traverse data bit
				wait(lt2iut_flag == 1'b1);
				for(int iut_j = 0; iut_j < 4; iut_j = iut_j + 1)
				begin:TP_1_IUT1// This loop is used to check rx data 
//					wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] != 5'h0)
					#1000
					if(iut_j == 1'b0)
					begin
						u_swd_model.swd_readreg32(32'h4000101c, rdata);
					end
					u_swd_model.swd_readreg32(32'h4000101c, rdata);
					u_sim_monitor.sim_monitor_check_specify_width(iut_j, rdata, data_sample[iut_j], (4'h7 + iut_i-1), 0);				
				end
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] == 5'h0);
				iut2lt_flag = 1'b1;
				wait(lt2iut_flag == 1'b0);
				iut2lt_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_4
	iut2lt_flag = 1'b0;
	wait(lt2iut_flag == 1'b1);
	for(int iut_j = 0; iut_j < 8; iut_j = iut_j + 1)
	begin:TP_1_IUT0// This loop is used to check rx data 
		#10000
		if(iut_j == 1'b0)
		begin
			u_swd_model.swd_readreg32(32'h4000101c, rdata);
		end
		u_swd_model.swd_readreg32(32'h4000101c, rdata);
		u_sim_monitor.sim_monitor_check_specify_width(iut_j, rdata, 0, (4'h8 - 1), 0);				
	end
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] == 5'h0);
	iut2lt_flag = 1'b1;
	wait(lt2iut_flag == 1'b0);
	iut2lt_flag = 1'b0;
	test_end = 1'b1;
`endif

`ifdef TP_5
	iut2lt_flag = 1'b0;
	for(int iut_m = 0; iut_m < 8; iut_m = iut_m + 1)
	begin:TP_1_IUT3// This loop is used to traverse parity bit
		for(int iut_k = 0; iut_k < 2; iut_k = iut_k + 1)
		begin:TP_1_IUT2// This loop is used to traverse stop bit
			for(int iut_i = 0; iut_i < 4; iut_i = iut_i + 1)
			begin:TP_1_IUT0// This loop is used to traverse data bit
				wait(lt2iut_flag == 1'b1);
				for(int iut_j = 0; iut_j < 4; iut_j = iut_j + 1)
				begin:TP_1_IUT1// This loop is used to check rx data 
//					wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] != 5'h0)
					#1000
					if(iut_j == 1'b0)
					begin
						u_swd_model.swd_readreg32(32'h4000101c, rdata);
					end
					u_swd_model.swd_readreg32(32'h4000101c, rdata);
					u_sim_monitor.sim_monitor_check_specify_width(iut_j, rdata, data_sample[iut_j], (4'h7 + iut_i-1), 0);				
				end
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] == 5'h0);
				iut2lt_flag = 1'b1;
				wait(lt2iut_flag == 1'b0);
				iut2lt_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

end

//===============================================
// uart lt case
//===============================================

initial
begin
	wait(test_start == 1'b1);
	#50000
`ifdef TP_0
	for(int lt_m = 0; lt_m < 8; lt_m = lt_m + 1)
	begin:TP_0_LT3// This loop is used to traverse interval bit
		for(int lt_k = 0; lt_k < 2; lt_k = lt_k + 1)
		begin:TP_0_LT2// This loop is used to traverse stop bit
			for(int lt_i = 0; lt_i < 4; lt_i = lt_i + 1)
			begin:TP_0_LT0// This loop is used to traverse data bit
				for(int lt_j = 0; lt_j < 4; lt_j = lt_j + 1)
				begin:TP_0_LT1// This loop is used to check tx data 
					u_uart_model.rx_data_specify_with_no_parity((4'h7 + lt_i), (2'h1 + lt_k), rdata, rstop);
					u_sim_monitor.sim_monitor_check_specify_width(lt_j, rdata, data_sample[lt_j], (4'h7 + lt_i-1), 0);
					u_sim_monitor.sim_monitor_check_specify_width(lt_j, rstop, 2'h3, (2'h1 + lt_k-1), 0);
				end
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_1
	for(int lt_m = 0; lt_m < 4; lt_m = lt_m + 1)
	begin:TP_1_LT3// This loop is used to traverse parity bit
		for(int lt_k = 0; lt_k < 2; lt_k = lt_k + 1)
		begin:TP_1_LT2// This loop is used to traverse stop bit
			for(int lt_i = 0; lt_i < 4; lt_i = lt_i + 1)
			begin:TP_1_LT0// This loop is used to traverse data bit
				for(int lt_j = 0; lt_j < 4; lt_j = lt_j + 1)
				begin:TP_1_LT1// This loop is used to check tx data 
					u_uart_model.rx_data_specify_with_parity((4'h7 + lt_i), (2'h1 + lt_k), rdata, rstop, rparity);
					u_uart_model.data_parity_cal(lt_m, rdata, parity_sample);
					u_sim_monitor.sim_monitor_check_specify_width(lt_j, rdata, data_sample[lt_j], (4'h7 + lt_i), 0);
					u_sim_monitor.sim_monitor_check_specify_width(lt_j, rparity, parity_sample, 1, 0);
					u_sim_monitor.sim_monitor_check_specify_width(lt_j, rstop, 2'h3, (2'h1 + lt_k), 0);
				end
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_2
	lt2iut_flag = 1'b0;
//	u_swd_model.swd_readreg32(32'h4000101c, rdata);
	for(int lt_m = 0; lt_m < 8; lt_m = lt_m + 1)
	begin:TP_0_LT3// This loop is used to traverse interval bit
		for(int lt_k = 0; lt_k < 2; lt_k = lt_k + 1)
		begin:TP_0_LT2// This loop is used to traverse stop bit
			for(int lt_i = 0; lt_i < 4; lt_i = lt_i + 1)
			begin:TP_0_LT0// This loop is used to traverse data bit
				uart0_r_pe_ctrl =	 2'h0+lt_i			<<  0 | // data bit
								 	 1'b0				<<  4 | // parity disable
									 1'b0+lt_k			<<  5 | // stop bit
								 	 4'hf				<< 16 | // os
									12'h16				<< 20 ; // baudrate divider
				u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
				
				#100
				u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
				u_swd_model.swd_writereg32(32'h40001004, 32'h003);
//				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.r_update == 1'b1);	
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.pe_rx_enable == 1'b1);
				for(int lt_j = 0; lt_j < 4; lt_j = lt_j + 1)
				begin:TP_0_LT1// This loop is used to tx sample data
//					wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.u_uart_regs_wrap.u_uart_apb_cfg.r_rx_fifo_num[4:0] <= 5'h8);
					u_uart_model.tx_data_specify_with_no_parity((4'h7 + lt_i), (2'h1 + lt_k), lt_m, data_sample[lt_j], stop_sample);
				end
				lt2iut_flag = 1'b1;
				wait(iut2lt_flag == 1'b1);
				lt2iut_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_3
	lt2iut_flag = 1'b0;
//	u_swd_model.swd_readreg32(32'h4000101c, rdata);
	for(int lt_m = 0; lt_m < 8; lt_m = lt_m + 1)
	begin:TP_0_LT3// This loop is used to traverse parity bit
		for(int lt_k = 0; lt_k < 2; lt_k = lt_k + 1)
		begin:TP_0_LT2// This loop is used to traverse stop bit
			for(int lt_i = 0; lt_i < 4; lt_i = lt_i + 1)
			begin:TP_0_LT0// This loop is used to traverse data bit
				uart0_r_pe_ctrl =	 2'h0+lt_i			<<  0 | // data bit
									 2'h0+lt_m			<<	2 | // parity bit
								 	 1'b1				<<  4 | // parity enable
									 1'b0+lt_k			<<  5 | // stop bit
								 	 4'hf				<< 16 | // os
									12'h16				<< 20 ; // baudrate divider
				u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
				
				#100
				u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
				u_swd_model.swd_writereg32(32'h40001004, 32'h003);
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.pe_rx_enable == 1'b1);
				for(int lt_j = 0; lt_j < 4; lt_j = lt_j + 1)
				begin:TP_0_LT1// This loop is used to tx sample data
					data_sample2 = 32'h0;
					for(int lt_n = 0; lt_n < (4'h7 + lt_i); lt_n = lt_n + 1)
					begin:TP_0_LT4// This loop is used to truncate tx sample data
						data_sample2[lt_n] = data_sample[lt_j][lt_n];
					end
					u_uart_model.data_parity_cal(lt_m, data_sample2, parity_sample);
					u_uart_model.tx_data_specify_with_parity((4'h7 + lt_i), (2'h1 + lt_k), 0, data_sample2, stop_sample, parity_sample);
				end
				lt2iut_flag = 1'b1;
				wait(iut2lt_flag == 1'b1);
				lt2iut_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_4
	lt2iut_flag = 1'b0;
	uart0_r_pe_ctrl =	 2'h0				<<  0 | // data bit
					 	 1'b0	  			<<  4 | // parity disable
						 1'b0				<<  5 | // stop bit
					 	 4'hf				<< 16 | // os
						12'h16				<< 20 ; // baudrate divider
	u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
	u_swd_model.swd_writereg32(32'h4000100c, 32'h1f0);
	u_swd_model.swd_writereg32(32'h40001010, 32'h1f0);
	
	#100
	u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
	u_swd_model.swd_writereg32(32'h40001004, 32'h003);
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.pe_rx_enable == 1'b1);
	for(int lt_j = 0; lt_j < 8; lt_j = lt_j + 1)
	begin:TP_0_LT0// This loop is used to tx sample data
//		#5000
		u_uart_model.tx_noise(lt_j, 5'd16);
	end
	u_swd_model.swd_writereg32(32'h40001010, 32'h1f0);
	lt2iut_flag = 1'b1;
	wait(iut2lt_flag == 1'b1);
	lt2iut_flag = 1'b0;
	test_end = 1'b1;
`endif

`ifdef TP_5
	lt2iut_flag = 1'b0;
//	u_swd_model.swd_readreg32(32'h4000101c, rdata);
	for(int lt_m = 0; lt_m < 8; lt_m = lt_m + 1)
	begin:TP_0_LT3// This loop is used to traverse parity bit
		for(int lt_k = 0; lt_k < 2; lt_k = lt_k + 1)
		begin:TP_0_LT2// This loop is used to traverse stop bit
			for(int lt_i = 0; lt_i < 4; lt_i = lt_i + 1)
			begin:TP_0_LT0// This loop is used to traverse data bit
				uart0_r_pe_ctrl =	 2'h0+lt_i			<<  0 | // data bit
									 2'h0+lt_m			<<	2 | // parity bit
								 	 1'b1				<<  4 | // parity enable
									 1'b0+lt_k			<<  5 | // stop bit
								 	 1'b1				<< 11 | // error ignore enable
								 	 4'hf				<< 16 | // os
									12'h16				<< 20 ; // baudrate divider
				u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);
				u_swd_model.swd_writereg32(32'h4000100c, 32'h1f0);
				u_swd_model.swd_writereg32(32'h40001010, 32'h1f0);
				
				#100
				u_swd_model.swd_writereg32(32'h40001004, 32'hf00);
				u_swd_model.swd_writereg32(32'h40001004, 32'h003);
				wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_uart0.pe_rx_enable == 1'b1);
				for(int lt_j = 0; lt_j < 4; lt_j = lt_j + 1)
				begin:TP_0_LT1// This loop is used to tx sample data
					data_sample2 = 32'h0;
					for(int lt_n = 0; lt_n < (4'h7 + lt_i); lt_n = lt_n + 1)
					begin:TP_0_LT4// This loop is used to truncate tx sample data
						data_sample2[lt_n] = data_sample[lt_j][lt_n];
					end
					u_uart_model.data_parity_cal(lt_m, data_sample2, parity_sample);
					u_uart_model.tx_data_specify_with_parity((4'h7 + lt_i), (2'h1 + lt_k), 0, data_sample2, ~stop_sample, ~parity_sample);
				end
				lt2iut_flag = 1'b1;
				wait(iut2lt_flag == 1'b1);
				lt2iut_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

end


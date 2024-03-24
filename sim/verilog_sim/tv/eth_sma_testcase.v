//===============================================
//
//	File: eth_sma_testcase.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03162024
//	Version: v1.0
//
//	This is stimulus for ethernet sma testcase.
//	Details are listed in eth_sma_testcase.xls.
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
// eth model
//===============================================

pullup(mdio);

eth_phy_sma_model u_eth_phy_sma_model
(
	.eth_mdc					(mdc),
	.eth_mdio					(mdio)
);

//===============================================
// eth sma command sequences
//===============================================

reg		[15:0]					data_sample[15:0];
reg		[15:0]					data_sample2;
reg		[15:0]					wdata;
reg		[15:0]					rdata;
reg		[31:0]					eth_r0_pe_ctrl;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;


initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	rdata = 16'h0;
	for(int data_i = 0; data_i < 16; data_i = data_i + 4)
	begin: DATA_INITIAL
		data_sample[0 + data_i] = 16'hf0f0; 
		data_sample[1 + data_i] = 16'h0f0f; 
		data_sample[2 + data_i] = 16'ha55a; 
		data_sample[3 + data_i] = 16'h5aa5; 
	end
	eth_r0_pe_ctrl = 32'h0;
	u_sim_monitor.sim_monitor_init("eth sma test");
	u_swd_model.swd_init;
	iut2lt_flag = 1'b0;
	lt2iut_flag = 1'b0;
	test_start = 1'b1;
	// sim will finish 
	wait(test_end == 1'b1);
	#1000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("eth sma test");
	$finish;
end

//===============================================
// eth sma iut case
//===============================================

initial
begin	
	wait(test_start == 1'b1);
	#50000
`ifdef TP_0
	for(int iut_m = 0; iut_m < 4; iut_m = iut_m + 1)
	begin:TP_0_IUT1// This loop is used to traverse data
		#100
		iut2lt_flag = 1'b0;

		eth_r0_pe_ctrl = 8'h0			<<  8 | // interval 0 bit
						 5'h01			<< 16 | // phyadr
						 8'h14			<< 24 ; // clk divider
		u_swd_model.swd_writereg32(32'h40020008, eth_r0_pe_ctrl);

		u_swd_model.swd_writereg32(32'h40020004, 32'he00);
		u_swd_model.swd_writereg32(32'h40020004, 32'h001);
	
		for(int iut_i = 0; iut_i < 5; iut_i = iut_i + 1)
		begin:TP_0_IUT0// This loop is used to traverse reg address
			#50

			// tx data
			u_swd_model.swd_writereg32(32'h40020000, ((2'b01 << 21) | (iut_i << 16) | (data_sample[iut_m]) << 0));
			wait(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_eth.u_eth_pe_core.u_eth_sma_pe_master.int_status_master_frame_done == 1'b1);
			u_swd_model.swd_writereg32(32'h40020000, ((2'b10 << 21) | (iut_i << 16)));
			wait(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_eth.u_eth_pe_core.u_eth_sma_pe_master.int_status_master_frame_done == 1'b1);

			// rx data
			u_swd_model.swd_readreg32(32'h4002001c, rdata);
			u_swd_model.swd_readreg32(32'h4002001c, rdata);

			iut2lt_flag = 1'b1;
			#50
			iut2lt_flag = 1'b0;
			wait(lt2iut_flag == 1'b1);
		end
	end
`endif

`ifdef TP_1
	for(int iut_m = 0; iut_m < 4; iut_m = iut_m + 1)
	begin:TP_0_IUT2// This loop is used to traverse data
		for(int iut_j = 1; iut_j < 5; iut_j = iut_j + 1)
		begin:TP_0_IUT1// This loop is used to traverse interval bits
			#100
			iut2lt_flag = 1'b0;

			eth_r0_pe_ctrl = iut_j			<<  8 | // interval 0 bit
							 5'h01			<< 16 | // phyadr
							 8'h14			<< 24 ; // clk divider
			u_swd_model.swd_writereg32(32'h40020008, eth_r0_pe_ctrl);

			u_swd_model.swd_writereg32(32'h40020004, 32'he00);
			u_swd_model.swd_writereg32(32'h40020004, 32'h001);
		
			for(int iut_i = 0; iut_i < 5; iut_i = iut_i + 1)
			begin:TP_0_IUT0// This loop is used to traverse reg address
				#50

				// tx data
				u_swd_model.swd_writereg32(32'h40020000, ((2'b01 << 21) | (iut_i << 16) | (data_sample[iut_m]) << 0));
				wait(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_eth.u_eth_pe_core.u_eth_sma_pe_master.int_status_master_frame_done == 1'b1);
				u_swd_model.swd_writereg32(32'h40020000, ((2'b10 << 21) | (iut_i << 16)));
				wait(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_eth.u_eth_pe_core.u_eth_sma_pe_master.int_status_master_frame_done == 1'b1);

				// rx data
				u_swd_model.swd_readreg32(32'h4002001c, rdata);
				u_swd_model.swd_readreg32(32'h4002001c, rdata);

				iut2lt_flag = 1'b1;
				#50
				iut2lt_flag = 1'b0;
				wait(lt2iut_flag == 1'b1);
			end
		end
	end
`endif

end

//===============================================
// eth sma lt case
//===============================================

initial
begin
	wait(test_start == 1'b1);
	#50000
`ifdef TP_0
	lt2iut_flag = 1'b0;
	for(int lt_m = 0; lt_m < 4; lt_m = lt_m + 1)
	begin:TP_0_LT1// This loop is used to traverse data
		for(int lt_i = 0; lt_i < 5; lt_i = lt_i + 1)
		begin:TP_0_LT0// This loop is used to traverse reg address
			wait(iut2lt_flag == 1'b1);
			data_sample2 = data_sample[lt_m];
			u_sim_monitor.sim_monitor_check(lt_i, rdata, data_sample2);

			lt2iut_flag = 1'b1;
			#50
			lt2iut_flag = 1'b0;
		end
	end
	test_end = 1'b1;
`endif

`ifdef TP_1
	lt2iut_flag = 1'b0;
	for(int lt_m = 0; lt_m < 4; lt_m = lt_m + 1)
	begin:TP_0_LT2// This loop is used to traverse data
		for(int lt_j = 1; lt_j < 5; lt_j = lt_j + 1)
		begin:TP_0_LT1// This loop is used to traverse interval bits
			for(int lt_i = 0; lt_i < 5; lt_i = lt_i + 1)
			begin:TP_0_LT0// This loop is used to traverse reg address
				wait(iut2lt_flag == 1'b1);
				data_sample2 = data_sample[lt_m];
				u_sim_monitor.sim_monitor_check(lt_i, rdata, data_sample2);
	
				lt2iut_flag = 1'b1;
				#50
				lt2iut_flag = 1'b0;
			end
		end
	end
	test_end = 1'b1;
`endif

end


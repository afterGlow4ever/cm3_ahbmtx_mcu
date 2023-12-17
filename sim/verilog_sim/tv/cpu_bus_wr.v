//===============================================
//
//	File: cpu_bus_wr.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 07022023
//	Version: v1.0
//
//	This is stimulus for amba bus.
//
//===============================================

//===============================================
// Clk and rst for swd
// Simulation config
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
// Swd simulation model
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
// Swd command sequences
//===============================================

reg		[31:0]					rdata;

initial
begin	
	rdata = 32'h0;

	#50000
	u_sim_monitor.sim_monitor_init("AHB dtcm wr");
	u_swd_model.swd_init;
	for(int i = 0; i < 32'h100; i = i + 4)
	begin: AHB_WR_TEST
		u_swd_model.swd_writereg32(32'h00010000 + i, i);
		u_swd_model.swd_readreg32(32'h00010000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00010000 + i, rdata);
		u_sim_monitor.sim_monitor_check(32'h00010000 + i, rdata, i);
	end

	#25000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("AHB dtcm wr");

	#50000
	u_sim_monitor.sim_monitor_init("APB0 sync debug reg wr");
	u_swd_model.swd_init;
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: APB0_WR_TEST
		u_swd_model.swd_writereg32(32'h40000000 + i, i);
		u_swd_model.swd_readreg32(32'h40000000 + i, rdata);
		u_swd_model.swd_readreg32(32'h40000000 + i, rdata);
		u_sim_monitor.sim_monitor_check(32'h40000000 + i, rdata, i);
	end

	#25000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("APB0 sync debug reg wr");

	#50000
	u_sim_monitor.sim_monitor_init("APB1 async debug reg wr");
	u_swd_model.swd_init;
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: APB1_WR_TEST
		u_swd_model.swd_writereg32(32'h40010000 + i, i);
		u_swd_model.swd_readreg32(32'h40010000 + i, rdata);
		u_swd_model.swd_readreg32(32'h40010000 + i, rdata);
		u_sim_monitor.sim_monitor_check(32'h40010000 + i, rdata, i);
	end

	#25000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("APB1 async debug reg wr");

	// sim will finish
	#1000
	$finish;
end




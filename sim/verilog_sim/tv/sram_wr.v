//===============================================
//
//	File: sram_wr.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 08122023
//	Version: v1.0
//
//	This is stimulus for sram wr simulation.
//
//	Date: 03162024
//	Version: v2.0
//
//	This is stimulus for sram wr simulation.
// 	In order to be compliant with ethernet,
// 	this file is added by different sram version.
//	This normal version is including:
//	1. ITCM 32k 0x00000000~0x00007FFF
//	2. DTCM  8k 0x00020000~0x00021FFF
//	This 128k version is including:
//	1. ITCM 128k 0x00000000~0x0001FFFF
//	2. DTCM 128k 0x00020000~0x0003FFFF
//	Using 'SRAM_128K' define to separate version.
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
	u_sim_monitor.sim_monitor_init("sram wr test");
	u_swd_model.swd_init;

`ifdef PART_TEST
`ifdef SRAM_128K
//	for(int i = 0; i < 32'h10; i = i + 4)
//	begin: ITCM_WR_TEST_S
//		u_swd_model.swd_writereg32(32'h00000000 + i, i);
//		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
//		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
//		u_sim_monitor.sim_monitor_check_with_display((32'h00000000 + i), rdata, i);
//	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: ITCM_WR_TEST_E
		u_swd_model.swd_writereg32(32'h0001FFF0 + i, i);
		u_swd_model.swd_readreg32(32'h0001FFF0 + i, rdata);
		u_swd_model.swd_readreg32(32'h0001FFF0 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h0001FFF0 + i), rdata, i);
	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: DTCM_WR_TEST_S
		u_swd_model.swd_writereg32(32'h00020000 + i, i);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00020000 + i), rdata, i);
	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: DTCM_WR_TEST_E
		u_swd_model.swd_writereg32(32'h0003FFF0 + i, i);
		u_swd_model.swd_readreg32(32'h0003FFF0 + i, rdata);
		u_swd_model.swd_readreg32(32'h0003FFF0 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h0003FFF0 + i), rdata, i);
	end	
`else
//	for(int i = 0; i < 32'h10; i = i + 4)
//	begin: ITCM_WR_TEST_S
//		u_swd_model.swd_writereg32(32'h00000000 + i, i);
//		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
//		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
//		u_sim_monitor.sim_monitor_check_with_display((32'h00000000 + i), rdata, i);
//	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: ITCM_WR_TEST_E
		u_swd_model.swd_writereg32(32'h00007FF0 + i, i);
		u_swd_model.swd_readreg32(32'h00007FF0 + i, rdata);
		u_swd_model.swd_readreg32(32'h00007FF0 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00007FF0 + i), rdata, i);
	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: DTCM_WR_TEST_S
		u_swd_model.swd_writereg32(32'h00020000 + i, i);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00020000 + i), rdata, i);
	end	
	for(int i = 0; i < 32'h10; i = i + 4)
	begin: DTCM_WR_TEST_E
		u_swd_model.swd_writereg32(32'h00021FF0 + i, i);
		u_swd_model.swd_readreg32(32'h00021FF0 + i, rdata);
		u_swd_model.swd_readreg32(32'h00021FF0 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00021FF0 + i), rdata, i);
	end	
`endif
`else
`ifdef SRAM_128K
	for(int i = 0; i < 32'h20000; i = i + 4)
	begin: ITCM_WR_TEST
		u_swd_model.swd_writereg32(32'h00000000 + i, i);
		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00000000 + i), rdata, i);
	end
	for(int i = 0; i < 32'h20000; i = i + 4)
	begin: DTCM_WR_TEST
		u_swd_model.swd_writereg32(32'h00020000 + i, i);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00020000 + i), rdata, i);
	end
`else
	for(int i = 0; i < 32'h8000; i = i + 4)
	begin: ITCM_WR_TEST
		u_swd_model.swd_writereg32(32'h00000000 + i, i);
		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00000000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00000000 + i), rdata, i);
	end
	for(int i = 0; i < 32'h2000; i = i + 4)
	begin: DTCM_WR_TEST
		u_swd_model.swd_writereg32(32'h00020000 + i, i);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00020000 + i, rdata);
		u_sim_monitor.sim_monitor_check_with_display((32'h00020000 + i), rdata, i);
	end
`endif
`endif

	#25000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("sram wr test");
	$finish;
end




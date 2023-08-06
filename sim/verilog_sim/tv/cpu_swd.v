//===============================================
//
//	File: cpu_swd.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 07022023
//	Version: v1.0
//
//	This is stimulus for cpu swd simulation.
//
//===============================================

//===============================================
// Clk and rst for swd
// Simulation config
//===============================================

reg											jlink_rstn;

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
	.rstn_i								(jlink_rstn),
	.tck_o								(tck),
	.tms_io								(tms),
	.tdi_i								(tdi),
	.tdo_o								(tdo),
	.trstn_o							(trstn),
	.tms_oen_o						()
);

//===============================================
// Swd command sequences
//===============================================

reg		[31:0]			rdata;

initial
begin	
	rdata = 32'h0;
	#50000
	u_swd_model.swd_init;
	u_swd_model.swd_writereg32(32'h40000000, 32'h12345678);
	u_swd_model.swd_writereg32(32'h40000000, 32'h22345678);
	u_swd_model.swd_writereg32(32'h10000000, 32'h32345678);
	u_swd_model.swd_readreg32(32'h10000000, rdata);

	#25000
	u_swd_model.swd_deinit;

	#50000
	u_swd_model.swd_init;
	u_swd_model.swd_writereg32(32'h40000000, 32'h12345678);
	u_swd_model.swd_writereg32(32'h40000000, 32'h22345678);
	u_swd_model.swd_writereg32(32'h10000000, 32'h32345678);
	u_swd_model.swd_readreg32(32'h10000000, rdata);

	#25000
	u_swd_model.swd_deinit;

	// sim will finish at 10ms
	#5000000
	$finish;
end




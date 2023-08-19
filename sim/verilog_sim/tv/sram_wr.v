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
	u_swd_model.swd_init;

//	for(int i = 32'h1f00; i < 32'h2000; i = i + 4)
	for(int i = 0; i < 32'h2000; i = i + 4)
	begin: DTCM_WR_TEST
		u_swd_model.swd_writereg32(32'h00010000 + i, i);
		u_swd_model.swd_readreg32(32'h00010000 + i, rdata);
		u_swd_model.swd_readreg32(32'h00010000 + i, rdata);
		if(rdata != i)
		begin
			$display($time, "[ERROR] DTCM wr test error in %32b.", i);
		end
		else
		begin
			$display($time, "[INFO] DTCM wr test pass in %32b.", i);
		end
	end	

	#25000
	u_swd_model.swd_deinit;

	// sim will finish at 10ms
	#5000000
	$finish;
end




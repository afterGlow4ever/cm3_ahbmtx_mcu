//===============================================
//
//	File: gpio_testcase.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 01142024
//	Version: v1.0
//
//	This is stimulus for gpio testcase.
//	Details are listed in gpio_testcase.xls.
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
// gpio command sequences
//===============================================

reg		[15:0]					wdata;
reg		[15:0]					rdata;
reg		[31:0]					gpioa_r_mode;
reg		[31:0]					gpioa_r_od;
reg		[31:0]					gpioa_r_toggle;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;
reg		[15:0]					gpioa_in;
wire	[15:0]					gpioa_out;

initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	rdata = 32'h0;
	u_sim_monitor.sim_monitor_init("gpio test");
	u_swd_model.swd_init;
	test_start = 1'b1;
	// sim will finish 
	wait(test_end == 1'b1);
	#1000
	u_sim_monitor.sim_monitor_result;
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("gpio test");
	$finish;
end

//===============================================
// gpioa iut & lt case
//===============================================

`ifdef TP_0
assign gpioa_out = {a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0};
`endif
`ifdef TP_1
assign gpioa_out = {a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0};
`endif
`ifdef TP_2
assign {a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0} = gpioa_in;
`endif

initial
begin	
	wait(test_start == 1'b1);

	#50000
`ifdef TP_0
	for(int iut_i = 0; iut_i < 16; iut_i = iut_i + 1)
	begin:TP_0_IUT0// This loop is used to traverse gpio bit
		gpioa_r_mode = 1'b1 << (iut_i << 1); // output mode
		u_swd_model.swd_writereg32(32'h4000a000, gpioa_r_mode);
		gpioa_r_od = 1'b1 << iut_i; // output high
		u_swd_model.swd_writereg32(32'h4000a010, gpioa_r_od);
		u_sim_monitor.sim_monitor_check_specify_width(iut_i, gpioa_out, gpioa_r_od, 15, 0);	
	end
	test_end = 1'b1;
`endif

`ifdef TP_1
	for(int iut_i = 0; iut_i < 16; iut_i = iut_i + 1)
	begin:TP_0_IUT1// This loop is used to traverse gpio bit
		gpioa_r_mode = 1'b1 << (iut_i << 1); // output mode
		u_swd_model.swd_writereg32(32'h4000a000, gpioa_r_mode);
		gpioa_r_od = 1'b0 << iut_i; // output low
		u_swd_model.swd_writereg32(32'h4000a010, gpioa_r_od);
		gpioa_r_toggle = 1'b1 << iut_i; // output toggle
		u_swd_model.swd_writereg32(32'h4000a010, gpioa_r_toggle);
		u_sim_monitor.sim_monitor_check_specify_width(iut_i, gpioa_out, gpioa_r_toggle, 15, 0);	
		gpioa_r_toggle = 1'b0 << iut_i; // output toggle
		u_swd_model.swd_writereg32(32'h4000a010, gpioa_r_toggle);
		u_sim_monitor.sim_monitor_check_specify_width(iut_i, gpioa_out, 32'h0, 15, 0);	
	end
	test_end = 1'b1;
`endif

`ifdef TP_2
	gpioa_in = 32'h00000000;
	u_swd_model.swd_writereg32(32'h4000a024, 32'hffffffff);// clear status
	u_swd_model.swd_writereg32(32'h4000a024, 32'h0);// clear status
	for(int iut_i = 0; iut_i < 16; iut_i = iut_i + 1)
	begin:TP_0_IUT2// This loop is used to traverse gpio bit
		gpioa_r_mode = 1'b0 << (iut_i << 1); // input mode
		u_swd_model.swd_writereg32(32'h4000a000, gpioa_r_mode);
		gpioa_in = 1'b1 << iut_i; // input high
		_swd_model.swd_readreg32(32'h4000a028, rdata);// read twice after a write
		u_swd_model.swd_readreg32(32'h4000a028, rdata);
		u_sim_monitor.sim_monitor_check_specify_width(iut_i, rdata, gpioa_in, 15, 0);	
		u_swd_model.swd_readreg32(32'h4000a02c, rdata);// status
		u_sim_monitor.sim_monitor_check_specify_width(iut_i, rdata, gpioa_in, 15, 0);	
		u_swd_model.swd_readreg32(32'h4000a02c, rdata);// status
		u_swd_model.swd_writereg32(32'h4000a024, gpioa_in);// clear status
		u_swd_model.swd_writereg32(32'h4000a024, 32'h0);// clear status
	end
	test_end = 1'b1;
`endif

end


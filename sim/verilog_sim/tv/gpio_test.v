//===============================================
//
//	File: gpio_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 01142024
//	Version: v1.0
//
//	This is simple test for gpio.
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

reg		[31:0]					rdata;
reg		[15:0]					gpioa_in;

`ifdef GPIO_IN_CASE
assign {a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0} = gpioa_in;
`endif
`ifdef GPIO_AF_IN_CASE
assign {a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1} = gpioa_in[15:1];
`endif

initial
begin	
	rdata = 32'h0;

	#50000
	u_sim_monitor.sim_monitor_init("gpio test");
	u_swd_model.swd_init;

`ifdef GPIO_OUT_HIGHLOW_CASE
	u_swd_model.swd_writereg32(32'h4000a000, 32'h55555555);// set output mode
	u_swd_model.swd_writereg32(32'h4000a010, 32'h55555555);// set output
	u_swd_model.swd_writereg32(32'h4000a010, 32'haaaaaaaa);// set output
	u_swd_model.swd_writereg32(32'h4000a010, 32'hc33cc33c);// set output
	u_swd_model.swd_writereg32(32'h4000a010, 32'h3cc33cc3);// set output
`endif
`ifdef GPIO_OUT_TOGGLE_CASE
	u_swd_model.swd_writereg32(32'h4000a000, 32'h55555555);// set output mode
	u_swd_model.swd_writereg32(32'h4000a010, 32'hc33cc33c);// set output
	u_swd_model.swd_writereg32(32'h4000a014, 32'hffffffff);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'h00000000);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'hffffffff);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'h00000000);// set toggle
`endif
`ifdef GPIO_IN_CASE
	gpioa_in = 32'h00000000;
	u_swd_model.swd_writereg32(32'h4000a000, 32'h00000000);// set input mode
	gpioa_in = 32'hc33cc33c;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'h3cc33cc3;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'h00000000;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'hffffffff;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
`endif
`ifdef GPIO_AF_IN_CASE
	gpioa_in = 32'h00000000;
	u_swd_model.swd_writereg32(32'h4000a000, 32'h0000000a);// set af mode
	gpioa_in = 32'hffffffff;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'h00000000;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'hffffffff;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
	gpioa_in = 32'h00000000;
	u_swd_model.swd_readreg32(32'h4000a028, rdata);// get input
`endif
`ifdef GPIO_AF_OUT_CASE
	u_swd_model.swd_writereg32(32'h4000a000, 32'h5555555a);// set af mode
	u_swd_model.swd_writereg32(32'h4000a010, 32'h3cc33cc3);// set output
	u_swd_model.swd_writereg32(32'h4000a014, 32'hffffffff);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'h00000000);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'hffffffff);// set toggle
	u_swd_model.swd_writereg32(32'h4000a014, 32'h00000000);// set toggle
`endif
	#500000
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("gpio test");

	// sim will finish 
	#1000
	$finish;
end

initial
begin

end


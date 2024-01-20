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

reg		[31:0]					rdata;
reg		[31:0]					uart0_r_pe_ctrl;

initial
begin	
	rdata = 32'h0;
	uart0_r_pe_ctrl = 32'h0;

	#100
`ifdef UART_CASE_CONTINOUOS_TX
	uart0_r_pe_ctrl =	 2'h1			<<  0 | // data 8 bit
						 1'b0			<<  4 | // parity disable
						 4'hf			<< 16 | // os
						12'h16			<< 20 ; // baudrate divider
`endif
`ifdef UART_CASE_INTERVAL_TX
	uart0_r_pe_ctrl =	 2'h1			<<  0 | // data 8 bit
						 1'b0			<<  4 | // parity disable
						12'h8			<< 12 | // interval 
						 4'hf			<< 16 | // os
						12'h16			<< 20 ; // baudrate divider
`endif
`ifdef UART_CASE_CONTINOUOS_RX
	uart0_r_pe_ctrl =	 2'h1			<<  0 | // data 8 bit
						 1'b0			<<  4 | // parity disable
						 4'hf			<< 16 | // os
						12'h16			<< 20 ; // baudrate divider
`endif

	#50000
	u_sim_monitor.sim_monitor_init("uart test");
	u_swd_model.swd_init;

	u_swd_model.swd_writereg32(32'h40001008, uart0_r_pe_ctrl);

`ifdef UART_TX_CASE
	u_swd_model.swd_writereg32(32'h40001004, 32'hf01);
	u_swd_model.swd_writereg32(32'h40001000, 32'ha5);
	u_swd_model.swd_writereg32(32'h40001000, 32'h5a);
	u_swd_model.swd_writereg32(32'h40001000, 32'hc3);
	u_swd_model.swd_writereg32(32'h40001000, 32'h3c);
`endif
`ifdef UART_RX_CASE
	u_swd_model.swd_writereg32(32'h40001004, 32'hf03);
	u_uart_model.put_char(8'h34);
	u_uart_model.tx_data_specify_with_no_parity(4'h8, 2'h1, 4'h0, 10'h12, 2'h1);// 8bits data 1bit stop data 0x12 stop 0x1
	#500000
	u_swd_model.swd_readreg32(32'h4000101c, rdata);
	u_swd_model.swd_readreg32(32'h4000101c, rdata);
	u_swd_model.swd_readreg32(32'h4000101c, rdata);
`endif
	#500000
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("uart test");

	// sim will finish 
	#1000
	$finish;
end

initial
begin

end


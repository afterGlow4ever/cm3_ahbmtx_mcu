//===============================================
//
//	File: eth_sma_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03092024
//	Version: v1.0
//
//	This is simple test for eth sma.
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

reg		[15:0]					rdata;
reg		[31:0]					eth_r0_pe_ctrl;

initial
begin	
	rdata = 16'h0;
	eth_r0_pe_ctrl = 32'h0;

	#100
`ifdef ETH_SMA_TX_CASE
	eth_r0_pe_ctrl =	 8'h2			<<  8 | // interval 2 bit
						 5'h01			<< 16 | // phyadr
						 8'h14			<< 24 ; // clk divider
`endif

`ifdef ETH_SMA_RX_CASE
	eth_r0_pe_ctrl =	 8'h2			<<  8 | // interval 2 bit
						 5'h01			<< 16 | // phyadr
						 8'h14			<< 24 ; // clk divider
`endif

	#50000
	u_sim_monitor.sim_monitor_init("eth sma test");
	u_eth_phy_sma_model.init;
	u_swd_model.swd_init;

	u_swd_model.swd_writereg32(32'h40020008, eth_r0_pe_ctrl);

`ifdef ETH_SMA_TX_CASE
	u_swd_model.swd_writereg32(32'h40020004, 32'he00);
	u_swd_model.swd_writereg32(32'h40020004, 32'h001);
	u_swd_model.swd_writereg32(32'h40020000, ((2'b01 << 21) | 32'h02789a));
	u_swd_model.swd_writereg32(32'h40020000, ((2'b01 << 21) | 32'h031234));

	#250000
	u_eth_phy_sma_model.read_phy_regs(5'h02, rdata);
	#1000
	u_eth_phy_sma_model.read_phy_regs(5'h03, rdata);
`endif

`ifdef ETH_SMA_RX_CASE
	u_swd_model.swd_writereg32(32'h40020004, 32'he00);
	u_swd_model.swd_writereg32(32'h40020004, 32'h001);
	u_swd_model.swd_writereg32(32'h40020000, ((2'b10 << 21) | 32'h020000));
	u_swd_model.swd_writereg32(32'h40020000, ((2'b10 << 21) | 32'h030000));
	u_swd_model.swd_readreg32(32'h4002001c, rdata);
	u_swd_model.swd_readreg32(32'h4002001c, rdata);
	u_swd_model.swd_readreg32(32'h4002001c, rdata);

	#250000
	u_eth_phy_sma_model.read_phy_regs(5'h02, rdata);
	#1000
	u_eth_phy_sma_model.read_phy_regs(5'h03, rdata);
`endif

	#500000
	u_swd_model.swd_deinit;
	u_sim_monitor.sim_monitor_deinit("eth sma test");

	// sim will finish 
	#1000
	$finish;
end



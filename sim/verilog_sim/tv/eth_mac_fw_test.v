//===============================================
//
//	File: eth_sma_fw_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03202024
//	Version: v1.0
//
//	This is stimulus for ethernet sma.
//
//===============================================

//===============================================
// eth model
//===============================================

pullup(mdio);

eth_phy_sma_model 
#(
	.PHY_ADDRESS				(5'h19)
)
u_eth_phy_sma_model
(
	.eth_mdc					(mdc),
	.eth_mdio					(mdio)
);

//===============================================
// Time set & initial file 
//===============================================

reg		[31:0]					data_sample[15:0];
reg		[ 9:0]					wdata;
reg		[ 9:0]					rdata;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;

initial
begin	
`ifdef FPGA_SRAM
`ifdef ALTERA_EP4
	$readmemh("bootloader.txt", TOP.u_mcu_top.u_fp_domain.u_sram_top.u_itcm.altsyncram_component.m_default.altsyncram_inst.mem_data);
`elsif ZYNQ_7020
	$readmemh("bootloader.txt", TOP.u_mcu_top.u_fp_domain.u_sram_top.u_itcm.inst.native_mem_module.blk_mem_gen_v8_4_4_inst.memory);
`endif
`endif
	test_start = 1'b1;
end

initial
begin
//	wait(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_eth.u_eth_pe_core.u_eth_mac_pe_tx.int_status_tx_done == 1'b1);
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hed);
//	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug0[31:0] == 32'h02);
	#20000
	$finish;
end

//===============================================
// eth sma lt case
//===============================================

initial
begin
	wait(test_start == 1'b1);
	u_eth_phy_sma_model.init;
end


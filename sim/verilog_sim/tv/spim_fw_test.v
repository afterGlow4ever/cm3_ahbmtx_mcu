//===============================================
//
//	File: spim_fw_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 09212025
//	Version: v1.0
//
//	This is stimulus for spim master.
//
//===============================================

//===============================================
// spi slave model
//===============================================

pulldown(spim0_mosi);

spis_model u_spis_model
(
	.spim_sck					(spim0_sck),
	.spim_cs					(spim0_cs),
	.spim_mosi					(spim0_mosi),
`ifdef TP_3
	.spim_miso					(spim0_miso)
`elsif TP_4
	.spim_miso					(spim0_miso)
`else
	.spim_miso					()
`endif
);

`ifdef TP_3
`elsif TP_4
`elsif TP_5
assign spim0_miso = 1'b1;
`else
assign spim0_miso = spim0_mosi;
`endif

//===============================================
// spim command sequences
//===============================================

reg		[ 7:0]					wdata;
reg		[ 7:0]					rdata;
reg								test_start;
reg								test_end;
reg								iut2lt_flag;
reg								lt2iut_flag;
reg		[31:0]					lt_i;
reg		[31:0]					lt_j;
reg		[31:0]					lt_k;

initial
begin
	test_start = 1'b0;
	test_end = 1'b0;
	rdata = 32'h0;
//	u_spis_model.spis_init;
end

initial
begin
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hbd);
	test_start = 1'b1;
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hed);
	#200000
	$finish;
end

//===============================================
// spim iut & lt case
//===============================================

initial
begin	
	wait(test_start == 1'b1);
`ifdef TP_0
	for(lt_i = 0; lt_i < 32; lt_i = lt_i + 1)
	begin:TP_0
		u_spis_model.rx_data(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_spim.u_spim_pe_core.r_mode[1:0], 1'b1, rdata, 32);
	end
`endif
`ifdef TP_1
	for(lt_i = 0; lt_i < 64; lt_i = lt_i + 1)
	begin:TP_1
		u_spis_model.rx_data(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_spim.u_spim_pe_core.r_mode[1:0], 1'b1, rdata, 64);
	end
`endif
`ifdef TP_3
	for(lt_i = 0; lt_i < 64; lt_i = lt_i + 1)
	begin:TP_3
		u_spis_model.tx_1byte_data(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_spim.u_spim_pe_core.r_mode[1:0], 1'b1, lt_i);
	end
`endif
`ifdef TP_4
	for(lt_i = 0; lt_i < 64; lt_i = lt_i + 1)
	begin:TP_4
		u_spis_model.tx_data(TOP.u_mcu_top.u_fp_domain.u_apb2_async_top.u_spim.u_spim_pe_core.r_mode[1:0], 1'b1, lt_i, 64);
	end
`endif
	#50000
	test_end = 1'b1;
end


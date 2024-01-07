//===============================================
//
//	File: uart_fw_test.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 01032024
//	Version: v1.0
//
//	This is stimulus for uart.
//
//===============================================

//===============================================
// uart model
//===============================================

uart_model u_uart_model
(
	.uart_tx					(rxd1),
	.uart_rx					(txd1)
);

//===============================================
// Time set & initial file 
//===============================================

reg		[31:0]					data_sample[31:0];
reg		[ 1:0]					stop_sample;
reg								parity_sample;
reg		[ 9:0]					wdata;
reg		[ 9:0]					rdata;
reg		[ 1:0]					rstop;
reg								rparity;
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
	for(int data_i = 0; data_i < 32; data_i = data_i + 4)
	begin: DATA_INITIAL
		data_sample[0 + data_i] = 32'hffffffff; 
		data_sample[1 + data_i] = 32'h00000000; 
		data_sample[2 + data_i] = 32'ha55aa55a; 
		data_sample[3 + data_i] = 32'h5aa55aa5; 
	end
	stop_sample = 2'h3;
	test_start = 1'b1;
end

initial
begin
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hed);
	#200000
	$finish;
end

//===============================================
// uart lt case
//===============================================

initial
begin
`ifdef UART_TX
	wait(test_start == 1'b1);
	for(int lt_j = 0; lt_j < 32; lt_j = lt_j + 1)
	begin:UART_TX// This loop is used to check tx data 
		u_uart_model.rx_data_specify_with_no_parity(4'h8, 2'h1, rdata, rstop);
	end
`endif

`ifdef UART_RX
	wait(TOP.u_mcu_top.u_fp_domain.u_apb0_sync_top.u_debug_reg.debug2[31:0] == 32'hbd);
	#100000
	for(int lt_j = 0; lt_j < 32; lt_j = lt_j + 1)
	begin:UART_RX// This loop is used to check tx data 
		u_uart_model.tx_data_specify_with_no_parity(4'h8, 2'h1, 4'h0, data_sample[lt_j], stop_sample);
	end
`endif
end


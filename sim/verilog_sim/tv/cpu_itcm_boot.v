//===============================================
//
//	File: cpu_itcm_boot.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 08122023
//	Version: v1.0
//
//	This is stimulus for cpu boot from itcm.
//
//===============================================


//===============================================
// Time set & initial file 
//===============================================

initial
begin	
`ifdef FPGA_SRAM
`ifdef ALTERA_EP4
	$readmemh("bootloader.txt", TOP.u_mcu_top.u_fp_domain.u_sram_top.u_itcm.altsyncram_component.m_default.altsyncram_inst.mem_data);
`elsif ZYNQ_7020
	$readmemh("bootloader.txt", TOP.u_mcu_top.u_fp_domain.u_sram_top.u_itcm.inst.native_mem_module.blk_mem_gen_v8_4_4_inst.memory);
`endif
`endif
	#500000
	$finish;
end


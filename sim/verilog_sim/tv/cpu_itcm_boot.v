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
// Time set
//===============================================

initial
begin	
`ifdef FPGA_SRAM
	$readmemh("bootloader.txt", TOP.u_mcu_top.u_fp_domain.u_sram_top.u_itcm.altsyncram_component.m_default.altsyncram_inst.mem_data);
`endif
	#2000000
	$finish;
end


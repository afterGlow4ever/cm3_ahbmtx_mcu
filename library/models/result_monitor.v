//===============================================
//
//	File: result_monitor.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 11212023
//	Version: v1.0
//
// 	This model is to monitor simulation result.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module sim_monitor;

reg		[31:0]					total_cnt;
reg		[31:0]					pass_cnt;
reg		[31:0]					fail_cnt;

//===============================================
// Monitor init & deinit
//===============================================

task sim_monitor_init;
	input	[191:0] testcase;
	total_cnt = 32'h0;
	pass_cnt = 32'h0;
	fail_cnt = 32'h0;
	$display($time, "[SIM MONITOR] -----------------------------------------------");
	$display($time, "[SIM MONITOR] Simulation case : %s begins.", testcase);
	$display($time, "[SIM MONITOR] -----------------------------------------------");
endtask

task sim_monitor_deinit;
	input	[191:0] testcase;
	total_cnt = 32'h0;
	pass_cnt = 32'h0;
	fail_cnt = 32'h0;
	$display($time, "[SIM MONITOR] -----------------------------------------------");
	$display($time, "[SIM MONITOR] Simulation case : %s ends.", testcase);
	$display($time, "[SIM MONITOR] -----------------------------------------------");
endtask

//===============================================
// Monitor data compare
//===============================================

task sim_monitor_check;
	input 	[31:0]			addr;
	input 	[31:0]			real_data;
	input 	[31:0]			expect_data;

	total_cnt = total_cnt + 1'b1;

	if(real_data == expect_data)
	begin
		pass_cnt = pass_cnt + 1'b1;
	end
	else
	begin
		fail_cnt = fail_cnt + 1'b1;
		$display($time, "[SIM MONITOR] -----------------------------------------------");
		$display($time, "[SIM MONITOR] Error detect! Address %8h real data %8h expect data %8h.", addr, real_data, expect_data);
		$display($time, "[SIM MONITOR] -----------------------------------------------");
	end
endtask

task sim_monitor_check_with_display;
	input 	[31:0]			addr;
	input 	[31:0]			real_data;
	input 	[31:0]			expect_data;

	total_cnt = total_cnt + 1'b1;

	if(real_data == expect_data)
	begin
		pass_cnt = pass_cnt + 1'b1;
		$display($time, "[SIM MONITOR] Check pass. Address %8h data %8h.", addr, real_data);
	end
	else
	begin
		fail_cnt = fail_cnt + 1'b1;
		$display($time, "[SIM MONITOR] -----------------------------------------------");
		$display($time, "[SIM MONITOR] Error detected! Address %8h real data %8h expect data %8h.", addr, real_data, expect_data);
		$display($time, "[SIM MONITOR] -----------------------------------------------");
	end
endtask

//===============================================
// Monitor result
//===============================================

task sim_monitor_result;
	if(pass_cnt == total_cnt)
	begin
		$display($time, "[SIM MONITOR] -----------------------------------------------");
		$display($time, "[SIM MONITOR] Simulation pass : pass/result %4d/%4d.", pass_cnt, total_cnt);
		$display($time, "[SIM MONITOR] -----------------------------------------------");
	end
	else
	begin
		$display($time, "[SIM MONITOR] -----------------------------------------------");
		$display($time, "[SIM MONITOR] Simulation fail : pass/result %4d/%4d.", pass_cnt, total_cnt);
		$display($time, "[SIM MONITOR] -----------------------------------------------");
	end
endtask

endmodule


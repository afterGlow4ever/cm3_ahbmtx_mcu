//===============================================
//
//	File: jlink_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 06302023
//	Version: v1.0
//
// 	This model is to simulate jilnk including:
// 	1. SWD mode.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module jlink_model
#(
	parameter							JLINK_CLK_PERIOD = 1000
)
(
	input									rstn_i,
	output								tck_o,
	inout									tms_io,
	input									tdi_i,
	output reg						tdo_o,
	output reg						trstn_o,
	output reg						tms_oen_o
);

wire										tms_i;
reg											tms_o;
reg											jlink_clk;
reg											tck_enable;
reg		[2:0]							jlink_ack;
event										jlink_clk_negedge;
event										jlink_clk_posedge;

//===============================================
// IO control
//===============================================

assign tms_io = tms_oen_o ? 1'bz : tms_o;
assign tms_i = tms_oen_o ? tms_io : 1'b0;
assign tck_o = jlink_clk & tck_enable;

//===============================================
// Clk & rst
//===============================================

always @(posedge jlink_clk) -> jlink_clk_posedge;
always @(negedge jlink_clk) -> jlink_clk_negedge;

initial 
begin
	jlink_clk = 1'b0;
	#100
	forever #(JLINK_CLK_PERIOD / 2) jlink_clk = ~jlink_clk;
end

initial
begin
	trstn_o = 1'b0;	
	repeat(50) @tck_o;
	trstn_o = 1'b1;	
end

//===============================================
// Status init
// Any connections to CPU must not be z
//===============================================

initial
begin
	tms_o = 1'b0;
	tdo_o = 1'b0;
	tck_enable = 1'b0;
	tms_oen_o = 1'b0;
	jlink_ack = 3'b0;
end

//===============================================
// SWD init & deinit
//===============================================

wire	[15:0]					jlink2swd_sequence = 16'b0111_1001_1110_0111;
reg  	[31:0]					cpu_idr;

task swd_init;
	wait(rstn_i == 1'b1)
	trstn_o = 1'b1;	
	jlink2swd;
	swd_read_dpreg(2'b00, cpu_idr);
	swd_write_dpreg(2'b01, 32'h10000000);// power up request
	swd_write_apreg(2'b00, 32'h23000042);// csw: data size 32bit
endtask

task jlink2swd;
	@jlink_clk_negedge;
	tck_enable = 1'b1;//clk valid
	tms_o = 1'b1;
	tms_oen_o = 1'b0;// tms output

	// wait at least 50 clk for line reset
	repeat(55) @jlink_clk_negedge;

	// jlink to swd sequence
	for(int bit_cnt = 15; bit_cnt >= 0; bit_cnt--)
	begin: JLINK2SWD_SEQ
		@jlink_clk_negedge;
		tms_o = jlink2swd_sequence[bit_cnt];
	end
	@jlink_clk_negedge;
	tms_o = 1'b1;

	// wait at least 50 clk for line reset
	repeat(55) @jlink_clk_negedge;
	tms_o = 1'b0;
	repeat(5) @jlink_clk_negedge;
	tck_enable = 1'b0;//clk stop
`ifdef JLINK_MONITOR
	$display($time, "[JLINK MONITOR] Enter SWD mode.");
`endif
endtask

task swd_deinit;
	tms_o = 1'b0;
	tdo_o = 1'b0;
	tck_enable = 1'b0;
	tms_oen_o = 1'b0;
	jlink_ack = 3'b0;
	trstn_o = 1'b0;	
endtask

//===============================================
// SWD write & read operation start cmd
//===============================================

task swd_start_cmd;
	input 							apndp;
	input 							rnw;
	input		[1:0]				a23;

	@jlink_clk_negedge;
	tck_enable = 1'b1;// clk valid
	tms_oen_o = 1'b0;// tms output

	// host	
	@jlink_clk_negedge tms_o = 1'b1; // start bit
	@jlink_clk_negedge tms_o = apndp; // dp=0 ap=1
	@jlink_clk_negedge tms_o = rnw;// write=0 read=1
	@jlink_clk_negedge tms_o = a23[0];// addr0
	@jlink_clk_negedge tms_o = a23[1];// addr1
	@jlink_clk_negedge tms_o = apndp ^ rnw ^ a23[0] ^ a23[1];// parity
	@jlink_clk_negedge tms_o = 1'b0;// stop bit
	@jlink_clk_negedge tms_o = 1'b1;// park bit
	@jlink_clk_negedge tms_o = 1'b1;// wait???

	//target(ack)
//	@jlink_clk_posedge tms_o = 1'b1;// wait???
	tms_oen_o = 1'b1;// tms input
	tms_o	= 1'b0;
	@jlink_clk_negedge jlink_ack[2] = tms_i;
	@jlink_clk_negedge jlink_ack[1] = tms_i;
	@jlink_clk_negedge jlink_ack[0] = tms_i;
`ifdef JLINK_MONITOR
	if(jlink_ack != 3'b100)
		$display($time, "[JLINK MONITOR] Ack error %3b.", jlink_ack);
`endif
endtask

//===============================================
// SWD read word data operation
//===============================================

reg									parity;

task swd_read_data32;
	output 	[31:0]			rdata;

//	@jlink_clk_negedge;
	tck_enable = 1'b1;// clk valid
	tms_oen_o = 1'b1;// tms input

	// read data
	for(int i = 0; i < 32; i++)
	begin: RDATA32
		@jlink_clk_negedge rdata[i] = tms_i;
	end

	// read parity
	// parity 1: the number of 1 is odd
	// parity 0: the number of 0 is even
	@jlink_clk_negedge parity = tms_i;
`ifdef JLINK_MONITOR
	if(parity == ^rdata)
		$display($time, "[JLINK MONITOR] Parity error in reading data.");
`endif

	// stop
	repeat(2) @jlink_clk_negedge parity = 1'b1;// ?????
	tms_oen_o = 1'b0;// tms output
	tms_o = 1'b0;
	tck_enable = 1'b0;// clk stop
endtask	

//===============================================
// SWD write word data operation
//===============================================

task swd_write_data32;
	input 	[31:0]			wdata;

	@jlink_clk_negedge;
	tck_enable = 1'b1;// clk valid
	tms_oen_o = 1'b0;// tms output

	// write data
	for(int i = 0; i < 32; i++)
	begin: WDATA32
		@jlink_clk_negedge tms_o = wdata[i];
	end

	// write parity
	// parity 1: the number of 1 is odd
	// parity 0: the number of 0 is even
	@jlink_clk_negedge tms_o = ^wdata;

	// stop
	@jlink_clk_negedge tms_o = 1'b0;
	repeat(8) @jlink_clk_negedge;
	tms_oen_o = 1'b0;// tms output
	tms_o = 1'b0;
	tck_enable = 1'b0;// clk stop
endtask

//===============================================
// SWD read dp register operation
//===============================================

task swd_read_dpreg;
	input 	[1:0]				addr;
	output 	[31:0]			rdata;

	swd_start_cmd(0, 1, addr);// apndp=0, rnw=1
	if(jlink_ack == 3'b100)
		swd_read_data32(rdata);
`ifdef JLINK_MONITOR
	if(jlink_ack == 3'b100)
		$display($time, "[JLINK MONITOR] DP register %2b read data %8h.", addr, rdata);
`endif
endtask

//===============================================
// SWD write dp register operation
//===============================================

task swd_write_dpreg;
	input 	[1:0]				addr;
	input 	[31:0]			wdata;

	swd_start_cmd(0, 0, addr);// apndp=0, rnw=0
	swd_write_data32(wdata);
`ifdef JLINK_MONITOR
	$display($time, "[JLINK MONITOR] DP register %2b write data %8h.", addr, wdata);
`endif
endtask

//===============================================
// SWD read ap register operation
//===============================================

task swd_read_apreg;
	input 	[1:0]				addr;
	output	[31:0]			rdata;

	swd_start_cmd(1, 1, addr);// apndp=1, rnw=1
	if(jlink_ack == 3'b100)
		swd_read_data32(rdata);
`ifdef JLINK_MONITOR
	if(jlink_ack == 3'b100)
		$display($time, "[JLINK MONITOR] AP register %2b read data %8h.", addr, rdata);
`endif
endtask

//===============================================
// SWD write ap register operation
//===============================================

task swd_write_apreg;
	input 	[1:0]				addr;
	input 	[31:0]			wdata;

	swd_start_cmd(1, 0, addr);// apndp=1, rnw=0
	swd_write_data32(wdata);
`ifdef JLINK_MONITOR
	$display($time, "[JLINK MONITOR] AP register %2b write data %8h.", addr, wdata);
`endif
endtask

//===============================================
// SWD readreg32 operation
//===============================================

task swd_readreg32;
	input 	[31:0]			addr;
	output	[31:0]			rdata;

	swd_read_apreg(2'b01, addr);
	swd_read_apreg(2'b11, rdata);
	while(jlink_ack == 3'b010)
		swd_read_apreg(2'b11, rdata);
`ifdef JLINK_MONITOR
	$display($time, "[JLINK MONITOR] System register %8h read data %8h.", addr, wdata);
`endif
endtask

//===============================================
// SWD writereg32 operation
//===============================================

task swd_writereg32;
	input 	[31:0]			addr;
	input 	[31:0]			wdata;

	swd_write_apreg(2'b01, addr);
	swd_write_apreg(2'b11, wdata);
`ifdef JLINK_MONITOR
	$display($time, "[JLINK MONITOR] System register %8h write data %8h.", addr, wdata);
`endif
endtask

endmodule


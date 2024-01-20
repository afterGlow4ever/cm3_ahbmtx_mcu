//===============================================
//
//	File: gpio_top.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01082024
//	Version: v1.0
//
// 	This is top for gpio.
//	This top is including:
//	pad ring: i/o logic
//	i/o control: input or ouput in gpio mode
//	input mux: alternate for input
//	output mux: alternate for output
//	gpio interrupt management
//	gpio regs wrap
//
//===============================================

module gpio_top 
(
	// module interface
	input  						module_clk,  
	input  						module_rstn,

	// port
	inout	[15:0]				gpioa,

	// regs interface
	input  						reg_clk,  
	input  						reg_rstn,
	input 	[31:0]				paddr, 
	input  						pwrite, 
	input  						psel, 
	input  						penable, 
	input 	[31:0]				pwdata, 
	output	[31:0]				prdata,

	// gpioa mux
	input						uart1_tx,	
	input						uart1_tx_oen,	
	output						uart1_rx,	
	input						uart1_rx_oen,

	// interrupt
	output						gpio_int_line
);

wire		[31:0]				r_mode;
wire		[15:0]				r_type;
wire		[31:0]				r_speed;
wire		[31:0]				r_pupd;
wire		[15:0]				r_od;
wire		[15:0]				r_toggle;
wire		[31:0]				r_af;
wire		[31:0]				r_inttrig;
wire		[15:0]				r_id;

wire		[15:0]				gpioa_out;
wire		[15:0]				gpioa_dir;
wire		[15:0]				gpioa_in;

wire		[15:0]				int_en;
wire		[15:0]				int_clr;
wire		[15:0]				int_sta;
wire		[15:0]				inta_tgr;
wire		[15:0]				inta_pos;
wire		[15:0]				inta_line;

//===============================================
// gpio regs wrap
//===============================================

gpio_regs_wrap u_gpioa_regs_wrap
(
	.reg_clk					(reg_clk),
	.reg_rstn					(reg_rstn),
	.pwrite						(pwrite),
	.psel						(psel),
	.penable					(penable),
	.paddr						(paddr),
	.pwdata						(pwdata),
	.prdata						(prdata),

	.r_mode						(r_mode),	
	.r_type						(r_type),
	.r_speed					(r_speed),
	.r_pupd						(r_pupd),	
	.r_od						(r_od),
	.r_toggle					(r_toggle),
	.r_af						(r_af),
	.r_inttrig					(r_inttrig),
	.r_id						(r_id),	

	.r_int_en					(int_en),
	.r_int_clr					(int_clr),
	.r_int_sta					(int_sta)
);

//===============================================
// gpio pad ring
//===============================================

gpio_pad u_gpioa_pad
(
	.gpio						(gpioa),

	.r_type						(r_type),  
	.r_pupd						(r_pupd),  
	.r_speed					(r_speed),  
	
	.gpio_out					(gpioa_out),  
	.gpio_dir					(gpioa_dir),
	.gpio_in					(gpioa_in)
);

//===============================================
// gpio normal input or output
//===============================================

wire		[15:0]				gpioa_normal_out;
wire		[15:0]				gpioa_normal_dir;
wire		[15:0]				gpioa_normal_in;

gpio_normal u_gpioa_normal
(
	.module_clk					(module_clk),  
	.module_rstn				(module_rstn),

	.r_od						(r_od),  
	.r_toggle					(r_toggle),  
	.r_mode						(r_mode),  
	.r_inttrig					(r_inttrig),  
	.r_id						(r_id),  
	
	.gpio_out					(gpioa_normal_out),  
	.gpio_dir					(gpioa_normal_dir),
	.gpio_in					(gpioa_normal_in),

	.gpio_int					(inta_tgr)
);

//===============================================
// gpio alternate function mux
//===============================================

gpioa_mux u_gpioa_mux
(
	.module_clk					(module_clk),  
	.module_rstn				(module_rstn),

	.gpio_out					(gpioa_normal_out),  
	.gpio_dir					(gpioa_normal_dir),
	.gpio_in					(gpioa_normal_in),

	.r_mode						(r_mode),  
	.r_af						(r_af),  

	.uart1_tx					(uart1_tx),	
	.uart1_tx_oen				(uart1_tx_oen),	

	.uart1_rx					(uart1_rx),	
	.uart1_rx_oen				(uart1_rx_oen),		

	.gpioa_out					(gpioa_out),  
	.gpioa_dir					(gpioa_dir),
	.gpioa_in					(gpioa_in)
);

//===============================================
// gpio interrupt management
// each gpio group has 1 interrupt line
// 'int detect' is used to avoid a same int cause 
// more than once interrupt.
//===============================================

assign gpio_int_line = |inta_line;

posedge_detect 
#(
	.WIDTH						(16)
)
u_inta_detect 
(
	.clk						(module_clk),
	.rstn						(module_rstn),
	.A							(inta_tgr),
	.Y							(inta_pos)
);

interrupt_gen 
#(
	.WIDTH						(16)
)
u_gpioa_interrupt_gen
(
	.clk						(module_clk),
	.rstn						(module_rstn),

	.int_en						(int_en),
	.int_tgr					(inta_pos),
	.int_clr					(int_clr),
	.int_sta					(int_sta),
	.int_line					(inta_line)	
);

endmodule


module advtim_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,r3_logic_clr
                ,r2_logic_clr
                ,r1_logic_clr
                ,r0_logic_clr
                ,r3_hall_enable
                ,r2_enc_enable
                ,r1_cap_enable
                ,r0_gen_enable
                ,r0_hw_update_en
                ,r0_sw_update
                ,r0_psc
                ,r0_arr
                ,r0_rcr
                ,r0_cms
                ,r0_dir
                ,r0_cc1
                ,r0_go1
                ,r0_go1n
                ,r0_ss1
                ,r0_ss1n
                ,r0_moe1
                ,r0_moe1n
                ,r0_dze1
                ,r0_cc1p
                ,r0_cc1np
                ,r0_cc1e
                ,r0_cc1ne
                ,r0_oc1m
                ,r0_cc2
                ,r0_go2
                ,r0_go2n
                ,r0_ss2
                ,r0_ss2n
                ,r0_moe2
                ,r0_moe2n
                ,r0_dze2
                ,r0_cc2p
                ,r0_cc2np
                ,r0_cc2e
                ,r0_cc2ne
                ,r0_oc2m
                ,r0_cc3
                ,r0_go3
                ,r0_go3n
                ,r0_ss3
                ,r0_ss3n
                ,r0_moe3
                ,r0_moe3n
                ,r0_dze3
                ,r0_cc3p
                ,r0_cc3np
                ,r0_cc3e
                ,r0_cc3ne
                ,r0_oc3m
                ,r0_cc4
                ,r0_ss4
                ,r0_cc4p
                ,r0_cc4e
                ,r0_oc4m
                ,r0_cc5
                ,r0_cc5c3
                ,r0_cc5c2
                ,r0_cc5c1
                ,r0_ss5
                ,r0_cc5p
                ,r0_cc5e
                ,r0_oc5m
                ,r0_cc6
                ,r0_ss6
                ,r0_cc6p
                ,r0_cc6e
                ,r0_oc6m
                ,r0_bt
                ,r0_bk2p
                ,r0_bk2e
                ,r0_bk1p
                ,r0_bk1e
                ,r0_dtg
                ,r0_int2_en
                ,r0_int1_en
                ,r0_int0_en
                ,r0_int2_clr
                ,r0_int1_clr
                ,r0_int0_clr
                ,r0_int2_sta
                ,r0_int1_sta
                ,r0_int0_sta
                ,r1_psc
                ,r1_arr
                ,r1_rcr
                ,r1_bt
                ,r1_ic1m
                ,r1_cc1p
                ,r1_cc1np
                ,r1_cc1e
                ,r1_cc1ne
                ,r1_int1_en
                ,r1_int0_en
                ,r1_int1_clr
                ,r1_int0_clr
                ,r1_ifr
                ,r1_ilr
                ,r1_ifc
                ,r1_ilc
                ,r1_int1_sta
                ,r1_int0_sta
                ,r2_arr
                ,r2_bt
                ,r2_ec1m
                ,r2_ec1p
                ,r2_ec1np
                ,r2_ec1e
                ,r2_ec1ne
                ,r2_int1_en
                ,r2_int0_en
                ,r2_int1_clr
                ,r2_int0_clr
                ,r2_ed
                ,r2_ec
                ,r2_int1_sta
                ,r2_int0_sta
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output          r3_logic_clr;
output          r2_logic_clr;
output          r1_logic_clr;
output          r0_logic_clr;
output          r3_hall_enable;
output          r2_enc_enable;
output          r1_cap_enable;
output          r0_gen_enable;
output          r0_hw_update_en;
output          r0_sw_update;
output [15:0]   r0_psc;
output [15:0]   r0_arr;
output [15:0]   r0_rcr;
output [1:0]    r0_cms;
output          r0_dir;
output [15:0]   r0_cc1;
output          r0_go1;
output          r0_go1n;
output          r0_ss1;
output          r0_ss1n;
output          r0_moe1;
output          r0_moe1n;
output          r0_dze1;
output          r0_cc1p;
output          r0_cc1np;
output          r0_cc1e;
output          r0_cc1ne;
output [3:0]    r0_oc1m;
output [15:0]   r0_cc2;
output          r0_go2;
output          r0_go2n;
output          r0_ss2;
output          r0_ss2n;
output          r0_moe2;
output          r0_moe2n;
output          r0_dze2;
output          r0_cc2p;
output          r0_cc2np;
output          r0_cc2e;
output          r0_cc2ne;
output [3:0]    r0_oc2m;
output [15:0]   r0_cc3;
output          r0_go3;
output          r0_go3n;
output          r0_ss3;
output          r0_ss3n;
output          r0_moe3;
output          r0_moe3n;
output          r0_dze3;
output          r0_cc3p;
output          r0_cc3np;
output          r0_cc3e;
output          r0_cc3ne;
output [3:0]    r0_oc3m;
output [15:0]   r0_cc4;
output          r0_ss4;
output          r0_cc4p;
output          r0_cc4e;
output [3:0]    r0_oc4m;
output [15:0]   r0_cc5;
output          r0_cc5c3;
output          r0_cc5c2;
output          r0_cc5c1;
output          r0_ss5;
output          r0_cc5p;
output          r0_cc5e;
output [3:0]    r0_oc5m;
output [15:0]   r0_cc6;
output          r0_ss6;
output          r0_cc6p;
output          r0_cc6e;
output [3:0]    r0_oc6m;
output [3:0]    r0_bt;
output          r0_bk2p;
output          r0_bk2e;
output          r0_bk1p;
output          r0_bk1e;
output [9:0]    r0_dtg;
output          r0_int2_en;
output          r0_int1_en;
output          r0_int0_en;
output          r0_int2_clr;
output          r0_int1_clr;
output          r0_int0_clr;
input           r0_int2_sta;
input           r0_int1_sta;
input           r0_int0_sta;
output [15:0]   r1_psc;
output [15:0]   r1_arr;
output [15:0]   r1_rcr;
output [3:0]    r1_bt;
output          r1_ic1m;
output          r1_cc1p;
output          r1_cc1np;
output          r1_cc1e;
output          r1_cc1ne;
output          r1_int1_en;
output          r1_int0_en;
output          r1_int1_clr;
output          r1_int0_clr;
input  [15:0]   r1_ifr;
input  [15:0]   r1_ilr;
input  [15:0]   r1_ifc;
input  [15:0]   r1_ilc;
input           r1_int1_sta;
input           r1_int0_sta;
output [23:0]   r2_arr;
output [3:0]    r2_bt;
output          r2_ec1m;
output          r2_ec1p;
output          r2_ec1np;
output          r2_ec1e;
output          r2_ec1ne;
output          r2_int1_en;
output          r2_int0_en;
output          r2_int1_clr;
output          r2_int0_clr;
input           r2_ed;
input  [15:0]   r2_ec;
input           r2_int1_sta;
input           r2_int0_sta;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg             r3_logic_clr;
reg             r2_logic_clr;
reg             r1_logic_clr;
reg             r0_logic_clr;
reg             r3_hall_enable;
reg             r2_enc_enable;
reg             r1_cap_enable;
reg             r0_gen_enable;
reg             r0_hw_update_en;
reg             r0_sw_update;
reg  [15:0]     r0_psc;
reg  [15:0]     r0_arr;
reg  [15:0]     r0_rcr;
reg  [1:0]      r0_cms;
reg             r0_dir;
reg  [15:0]     r0_cc1;
reg             r0_go1;
reg             r0_go1n;
reg             r0_ss1;
reg             r0_ss1n;
reg             r0_moe1;
reg             r0_moe1n;
reg             r0_dze1;
reg             r0_cc1p;
reg             r0_cc1np;
reg             r0_cc1e;
reg             r0_cc1ne;
reg  [3:0]      r0_oc1m;
reg  [15:0]     r0_cc2;
reg             r0_go2;
reg             r0_go2n;
reg             r0_ss2;
reg             r0_ss2n;
reg             r0_moe2;
reg             r0_moe2n;
reg             r0_dze2;
reg             r0_cc2p;
reg             r0_cc2np;
reg             r0_cc2e;
reg             r0_cc2ne;
reg  [3:0]      r0_oc2m;
reg  [15:0]     r0_cc3;
reg             r0_go3;
reg             r0_go3n;
reg             r0_ss3;
reg             r0_ss3n;
reg             r0_moe3;
reg             r0_moe3n;
reg             r0_dze3;
reg             r0_cc3p;
reg             r0_cc3np;
reg             r0_cc3e;
reg             r0_cc3ne;
reg  [3:0]      r0_oc3m;
reg  [15:0]     r0_cc4;
reg             r0_ss4;
reg             r0_cc4p;
reg             r0_cc4e;
reg  [3:0]      r0_oc4m;
reg  [15:0]     r0_cc5;
reg             r0_cc5c3;
reg             r0_cc5c2;
reg             r0_cc5c1;
reg             r0_ss5;
reg             r0_cc5p;
reg             r0_cc5e;
reg  [3:0]      r0_oc5m;
reg  [15:0]     r0_cc6;
reg             r0_ss6;
reg             r0_cc6p;
reg             r0_cc6e;
reg  [3:0]      r0_oc6m;
reg  [3:0]      r0_bt;
reg             r0_bk2p;
reg             r0_bk2e;
reg             r0_bk1p;
reg             r0_bk1e;
reg  [9:0]      r0_dtg;
reg             r0_int2_en;
reg             r0_int1_en;
reg             r0_int0_en;
reg             r0_int2_clr;
reg             r0_int1_clr;
reg             r0_int0_clr;
wire            r0_int2_sta;
wire            r0_int1_sta;
wire            r0_int0_sta;
reg  [15:0]     r1_psc;
reg  [15:0]     r1_arr;
reg  [15:0]     r1_rcr;
reg  [3:0]      r1_bt;
reg             r1_ic1m;
reg             r1_cc1p;
reg             r1_cc1np;
reg             r1_cc1e;
reg             r1_cc1ne;
reg             r1_int1_en;
reg             r1_int0_en;
reg             r1_int1_clr;
reg             r1_int0_clr;
wire [15:0]     r1_ifr;
wire [15:0]     r1_ilr;
wire [15:0]     r1_ifc;
wire [15:0]     r1_ilc;
wire            r1_int1_sta;
wire            r1_int0_sta;
reg  [23:0]     r2_arr;
reg  [3:0]      r2_bt;
reg             r2_ec1m;
reg             r2_ec1p;
reg             r2_ec1np;
reg             r2_ec1e;
reg             r2_ec1ne;
reg             r2_int1_en;
reg             r2_int0_en;
reg             r2_int1_clr;
reg             r2_int0_clr;
wire            r2_ed;
wire [15:0]     r2_ec;
wire            r2_int1_sta;
wire            r2_int0_sta;
wire [31:0]     R_TOP_CTRL;
wire [31:0]     R0_PE_CTRL;
wire [31:0]     R0_PE_CTRL1;
wire [31:0]     R0_PE_CTRL2;
wire [31:0]     R0_PE_CTRL3;
wire [31:0]     R0_PE_CTRL4;
wire [31:0]     R0_PE_CTRL5;
wire [31:0]     R0_PE_CTRL6;
wire [31:0]     R0_PE_CTRL7;
wire [31:0]     R0_PE_CTRL8;
wire [31:0]     R0_PE_CTRL9;
wire [31:0]     R0_INT_EN;
wire [31:0]     R0_INT_CLR;
wire [31:0]     R0_INT_STA;
wire [31:0]     R1_PE_CTRL;
wire [31:0]     R1_PE_CTRL1;
wire [31:0]     R1_INT_EN;
wire [31:0]     R1_INT_CLR;
wire [31:0]     R1_IR;
wire [31:0]     R1_IC;
wire [31:0]     R1_INT_STA;
wire [31:0]     R2_PE_CTRL0;
wire [31:0]     R2_PE_CTRL1;
wire [31:0]     R2_INT_EN;
wire [31:0]     R2_INT_CLR;
wire [31:0]     R2_EO;
wire [31:0]     R2_INT_STA;
wire            r_top_ctrl_wr;
wire            r_top_ctrl_rd;
wire            r0_pe_ctrl_wr;
wire            r0_pe_ctrl_rd;
wire            r0_pe_ctrl1_wr;
wire            r0_pe_ctrl1_rd;
wire            r0_pe_ctrl2_wr;
wire            r0_pe_ctrl2_rd;
wire            r0_pe_ctrl3_wr;
wire            r0_pe_ctrl3_rd;
wire            r0_pe_ctrl4_wr;
wire            r0_pe_ctrl4_rd;
wire            r0_pe_ctrl5_wr;
wire            r0_pe_ctrl5_rd;
wire            r0_pe_ctrl6_wr;
wire            r0_pe_ctrl6_rd;
wire            r0_pe_ctrl7_wr;
wire            r0_pe_ctrl7_rd;
wire            r0_pe_ctrl8_wr;
wire            r0_pe_ctrl8_rd;
wire            r0_pe_ctrl9_wr;
wire            r0_pe_ctrl9_rd;
wire            r0_int_en_wr;
wire            r0_int_en_rd;
wire            r0_int_clr_wr;
wire            r0_int_clr_rd;
wire            r0_int_sta_wr;
wire            r0_int_sta_rd;
wire            r1_pe_ctrl_wr;
wire            r1_pe_ctrl_rd;
wire            r1_pe_ctrl1_wr;
wire            r1_pe_ctrl1_rd;
wire            r1_int_en_wr;
wire            r1_int_en_rd;
wire            r1_int_clr_wr;
wire            r1_int_clr_rd;
wire            r1_ir_wr;
wire            r1_ir_rd;
wire            r1_ic_wr;
wire            r1_ic_rd;
wire            r1_int_sta_wr;
wire            r1_int_sta_rd;
wire            r2_pe_ctrl0_wr;
wire            r2_pe_ctrl0_rd;
wire            r2_pe_ctrl1_wr;
wire            r2_pe_ctrl1_rd;
wire            r2_int_en_wr;
wire            r2_int_en_rd;
wire            r2_int_clr_wr;
wire            r2_int_clr_rd;
wire            r2_eo_wr;
wire            r2_eo_rd;
wire            r2_int_sta_wr;
wire            r2_int_sta_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r_top_ctrl_wr = (paddr == 32'h40021000 + 8'h00) & reg_wr;
assign r_top_ctrl_rd = (paddr == 32'h40021000 + 8'h00) & reg_rd;
assign r0_pe_ctrl_wr = (paddr == 32'h40021000 + 8'h04) & reg_wr;
assign r0_pe_ctrl_rd = (paddr == 32'h40021000 + 8'h04) & reg_rd;
assign r0_pe_ctrl1_wr = (paddr == 32'h40021000 + 8'h08) & reg_wr;
assign r0_pe_ctrl1_rd = (paddr == 32'h40021000 + 8'h08) & reg_rd;
assign r0_pe_ctrl2_wr = (paddr == 32'h40021000 + 8'h0c) & reg_wr;
assign r0_pe_ctrl2_rd = (paddr == 32'h40021000 + 8'h0c) & reg_rd;
assign r0_pe_ctrl3_wr = (paddr == 32'h40021000 + 8'h10) & reg_wr;
assign r0_pe_ctrl3_rd = (paddr == 32'h40021000 + 8'h10) & reg_rd;
assign r0_pe_ctrl4_wr = (paddr == 32'h40021000 + 8'h14) & reg_wr;
assign r0_pe_ctrl4_rd = (paddr == 32'h40021000 + 8'h14) & reg_rd;
assign r0_pe_ctrl5_wr = (paddr == 32'h40021000 + 8'h18) & reg_wr;
assign r0_pe_ctrl5_rd = (paddr == 32'h40021000 + 8'h18) & reg_rd;
assign r0_pe_ctrl6_wr = (paddr == 32'h40021000 + 8'h1c) & reg_wr;
assign r0_pe_ctrl6_rd = (paddr == 32'h40021000 + 8'h1c) & reg_rd;
assign r0_pe_ctrl7_wr = (paddr == 32'h40021000 + 8'h20) & reg_wr;
assign r0_pe_ctrl7_rd = (paddr == 32'h40021000 + 8'h20) & reg_rd;
assign r0_pe_ctrl8_wr = (paddr == 32'h40021000 + 8'h24) & reg_wr;
assign r0_pe_ctrl8_rd = (paddr == 32'h40021000 + 8'h24) & reg_rd;
assign r0_pe_ctrl9_wr = (paddr == 32'h40021000 + 8'h28) & reg_wr;
assign r0_pe_ctrl9_rd = (paddr == 32'h40021000 + 8'h28) & reg_rd;
assign r0_int_en_wr = (paddr == 32'h40021000 + 8'h40) & reg_wr;
assign r0_int_en_rd = (paddr == 32'h40021000 + 8'h40) & reg_rd;
assign r0_int_clr_wr = (paddr == 32'h40021000 + 8'h44) & reg_wr;
assign r0_int_clr_rd = (paddr == 32'h40021000 + 8'h44) & reg_rd;
assign r0_int_sta_wr = (paddr == 32'h40021000 + 8'h48) & reg_wr;
assign r0_int_sta_rd = (paddr == 32'h40021000 + 8'h48) & reg_rd;
assign r1_pe_ctrl_wr = (paddr == 32'h40021000 + 8'h54) & reg_wr;
assign r1_pe_ctrl_rd = (paddr == 32'h40021000 + 8'h54) & reg_rd;
assign r1_pe_ctrl1_wr = (paddr == 32'h40021000 + 8'h58) & reg_wr;
assign r1_pe_ctrl1_rd = (paddr == 32'h40021000 + 8'h58) & reg_rd;
assign r1_int_en_wr = (paddr == 32'h40021000 + 8'h5c) & reg_wr;
assign r1_int_en_rd = (paddr == 32'h40021000 + 8'h5c) & reg_rd;
assign r1_int_clr_wr = (paddr == 32'h40021000 + 8'h60) & reg_wr;
assign r1_int_clr_rd = (paddr == 32'h40021000 + 8'h60) & reg_rd;
assign r1_ir_wr = (paddr == 32'h40021000 + 8'h64) & reg_wr;
assign r1_ir_rd = (paddr == 32'h40021000 + 8'h64) & reg_rd;
assign r1_ic_wr = (paddr == 32'h40021000 + 8'h68) & reg_wr;
assign r1_ic_rd = (paddr == 32'h40021000 + 8'h68) & reg_rd;
assign r1_int_sta_wr = (paddr == 32'h40021000 + 8'h6c) & reg_wr;
assign r1_int_sta_rd = (paddr == 32'h40021000 + 8'h6c) & reg_rd;
assign r2_pe_ctrl0_wr = (paddr == 32'h40021000 + 8'h70) & reg_wr;
assign r2_pe_ctrl0_rd = (paddr == 32'h40021000 + 8'h70) & reg_rd;
assign r2_pe_ctrl1_wr = (paddr == 32'h40021000 + 8'h74) & reg_wr;
assign r2_pe_ctrl1_rd = (paddr == 32'h40021000 + 8'h74) & reg_rd;
assign r2_int_en_wr = (paddr == 32'h40021000 + 8'h7c) & reg_wr;
assign r2_int_en_rd = (paddr == 32'h40021000 + 8'h7c) & reg_rd;
assign r2_int_clr_wr = (paddr == 32'h40021000 + 8'h80) & reg_wr;
assign r2_int_clr_rd = (paddr == 32'h40021000 + 8'h80) & reg_rd;
assign r2_eo_wr = (paddr == 32'h40021000 + 8'h84) & reg_wr;
assign r2_eo_rd = (paddr == 32'h40021000 + 8'h84) & reg_rd;
assign r2_int_sta_wr = (paddr == 32'h40021000 + 8'h88) & reg_wr;
assign r2_int_sta_rd = (paddr == 32'h40021000 + 8'h88) & reg_rd;
assign R_TOP_CTRL[31:12] = 20'h0;
assign R_TOP_CTRL[11] = r3_logic_clr;
assign R_TOP_CTRL[10] = r2_logic_clr;
assign R_TOP_CTRL[9] = r1_logic_clr;
assign R_TOP_CTRL[8] = r0_logic_clr;
assign R_TOP_CTRL[7:6] = 2'h0;
assign R_TOP_CTRL[5] = r3_hall_enable;
assign R_TOP_CTRL[4] = r2_enc_enable;
assign R_TOP_CTRL[3] = r1_cap_enable;
assign R_TOP_CTRL[2] = r0_gen_enable;
assign R_TOP_CTRL[1] = r0_hw_update_en;
assign R_TOP_CTRL[0] = r0_sw_update;
assign R0_PE_CTRL[31:16] = r0_psc;
assign R0_PE_CTRL[15:0] = r0_arr;
assign R0_PE_CTRL1[31:16] = r0_rcr;
assign R0_PE_CTRL1[15:0] = 16'h0;
assign R0_PE_CTRL2[31:3] = 29'h0;
assign R0_PE_CTRL2[2:1] = r0_cms;
assign R0_PE_CTRL2[0] = r0_dir;
assign R0_PE_CTRL3[31:16] = r0_cc1;
assign R0_PE_CTRL3[15] = 1'h0;
assign R0_PE_CTRL3[14] = r0_go1;
assign R0_PE_CTRL3[13] = r0_go1n;
assign R0_PE_CTRL3[12] = r0_ss1;
assign R0_PE_CTRL3[11] = r0_ss1n;
assign R0_PE_CTRL3[10] = r0_moe1;
assign R0_PE_CTRL3[9] = r0_moe1n;
assign R0_PE_CTRL3[8] = r0_dze1;
assign R0_PE_CTRL3[7] = r0_cc1p;
assign R0_PE_CTRL3[6] = r0_cc1np;
assign R0_PE_CTRL3[5] = r0_cc1e;
assign R0_PE_CTRL3[4] = r0_cc1ne;
assign R0_PE_CTRL3[3:0] = r0_oc1m;
assign R0_PE_CTRL4[31:16] = r0_cc2;
assign R0_PE_CTRL4[15] = 1'h0;
assign R0_PE_CTRL4[14] = r0_go2;
assign R0_PE_CTRL4[13] = r0_go2n;
assign R0_PE_CTRL4[12] = r0_ss2;
assign R0_PE_CTRL4[11] = r0_ss2n;
assign R0_PE_CTRL4[10] = r0_moe2;
assign R0_PE_CTRL4[9] = r0_moe2n;
assign R0_PE_CTRL4[8] = r0_dze2;
assign R0_PE_CTRL4[7] = r0_cc2p;
assign R0_PE_CTRL4[6] = r0_cc2np;
assign R0_PE_CTRL4[5] = r0_cc2e;
assign R0_PE_CTRL4[4] = r0_cc2ne;
assign R0_PE_CTRL4[3:0] = r0_oc2m;
assign R0_PE_CTRL5[31:16] = r0_cc3;
assign R0_PE_CTRL5[15] = 1'h0;
assign R0_PE_CTRL5[14] = r0_go3;
assign R0_PE_CTRL5[13] = r0_go3n;
assign R0_PE_CTRL5[12] = r0_ss3;
assign R0_PE_CTRL5[11] = r0_ss3n;
assign R0_PE_CTRL5[10] = r0_moe3;
assign R0_PE_CTRL5[9] = r0_moe3n;
assign R0_PE_CTRL5[8] = r0_dze3;
assign R0_PE_CTRL5[7] = r0_cc3p;
assign R0_PE_CTRL5[6] = r0_cc3np;
assign R0_PE_CTRL5[5] = r0_cc3e;
assign R0_PE_CTRL5[4] = r0_cc3ne;
assign R0_PE_CTRL5[3:0] = r0_oc3m;
assign R0_PE_CTRL6[31:16] = r0_cc4;
assign R0_PE_CTRL6[15:13] = 3'h0;
assign R0_PE_CTRL6[12] = r0_ss4;
assign R0_PE_CTRL6[11:8] = 4'h0;
assign R0_PE_CTRL6[7] = r0_cc4p;
assign R0_PE_CTRL6[6] = 1'b0;
assign R0_PE_CTRL6[5] = r0_cc4e;
assign R0_PE_CTRL6[4] = 1'b0;
assign R0_PE_CTRL6[3:0] = r0_oc4m;
assign R0_PE_CTRL7[31:16] = r0_cc5;
assign R0_PE_CTRL7[15] = r0_cc5c3;
assign R0_PE_CTRL7[14] = r0_cc5c2;
assign R0_PE_CTRL7[13] = r0_cc5c1;
assign R0_PE_CTRL7[12] = r0_ss5;
assign R0_PE_CTRL7[11:8] = 4'h0;
assign R0_PE_CTRL7[7] = r0_cc5p;
assign R0_PE_CTRL7[6] = 1'b0;
assign R0_PE_CTRL7[5] = r0_cc5e;
assign R0_PE_CTRL7[4] = 1'b0;
assign R0_PE_CTRL7[3:0] = r0_oc5m;
assign R0_PE_CTRL8[31:16] = r0_cc6;
assign R0_PE_CTRL8[15:13] = 3'h0;
assign R0_PE_CTRL8[12] = r0_ss6;
assign R0_PE_CTRL8[11:8] = 4'h0;
assign R0_PE_CTRL8[7] = r0_cc6p;
assign R0_PE_CTRL8[6] = 1'b0;
assign R0_PE_CTRL8[5] = r0_cc6e;
assign R0_PE_CTRL8[4] = 1'b0;
assign R0_PE_CTRL8[3:0] = r0_oc6m;
assign R0_PE_CTRL9[31:20] = 12'h0;
assign R0_PE_CTRL9[19:16] = r0_bt;
assign R0_PE_CTRL9[15:14] = 2'h0;
assign R0_PE_CTRL9[13] = r0_bk2p;
assign R0_PE_CTRL9[12] = r0_bk2e;
assign R0_PE_CTRL9[11] = r0_bk1p;
assign R0_PE_CTRL9[10] = r0_bk1e;
assign R0_PE_CTRL9[9:0] = r0_dtg;
assign R0_INT_EN[31:3] = 29'h0;
assign R0_INT_EN[2] = r0_int2_en;
assign R0_INT_EN[1] = r0_int1_en;
assign R0_INT_EN[0] = r0_int0_en;
assign R0_INT_CLR[31:3] = 29'h0;
assign R0_INT_CLR[2] = r0_int2_clr;
assign R0_INT_CLR[1] = r0_int1_clr;
assign R0_INT_CLR[0] = r0_int0_clr;
assign R0_INT_STA[31:3] = 29'h0;
assign R0_INT_STA[2] = r0_int2_sta;
assign R0_INT_STA[1] = r0_int1_sta;
assign R0_INT_STA[0] = r0_int0_sta;
assign R1_PE_CTRL[31:16] = r1_psc;
assign R1_PE_CTRL[15:0] = r1_arr;
assign R1_PE_CTRL1[31:16] = r1_rcr;
assign R1_PE_CTRL1[15:12] = r1_bt;
assign R1_PE_CTRL1[11:9] = 3'h0;
assign R1_PE_CTRL1[8] = r1_ic1m;
assign R1_PE_CTRL1[7:4] = 4'h0;
assign R1_PE_CTRL1[3] = r1_cc1p;
assign R1_PE_CTRL1[2] = r1_cc1np;
assign R1_PE_CTRL1[1] = r1_cc1e;
assign R1_PE_CTRL1[0] = r1_cc1ne;
assign R1_INT_EN[31:2] = 30'h0;
assign R1_INT_EN[1] = r1_int1_en;
assign R1_INT_EN[0] = r1_int0_en;
assign R1_INT_CLR[31:2] = 30'h0;
assign R1_INT_CLR[1] = r1_int1_clr;
assign R1_INT_CLR[0] = r1_int0_clr;
assign R1_IR[31:16] = r1_ifr;
assign R1_IR[15:0] = r1_ilr;
assign R1_IC[31:16] = r1_ifc;
assign R1_IC[15:0] = r1_ilc;
assign R1_INT_STA[31:2] = 30'h0;
assign R1_INT_STA[1] = r1_int1_sta;
assign R1_INT_STA[0] = r1_int0_sta;
assign R2_PE_CTRL0[31:24] = 8'h0;
assign R2_PE_CTRL0[23:0] = r2_arr;
assign R2_PE_CTRL1[31:28] = r2_bt;
assign R2_PE_CTRL1[27:17] = 11'h0;
assign R2_PE_CTRL1[16] = r2_ec1m;
assign R2_PE_CTRL1[15:4] = 12'h0;
assign R2_PE_CTRL1[3] = r2_ec1p;
assign R2_PE_CTRL1[2] = r2_ec1np;
assign R2_PE_CTRL1[1] = r2_ec1e;
assign R2_PE_CTRL1[0] = r2_ec1ne;
assign R2_INT_EN[31:2] = 30'h0;
assign R2_INT_EN[1] = r2_int1_en;
assign R2_INT_EN[0] = r2_int0_en;
assign R2_INT_CLR[31:2] = 30'h0;
assign R2_INT_CLR[1] = r2_int1_clr;
assign R2_INT_CLR[0] = r2_int0_clr;
assign R2_EO[31:17] = 15'h0;
assign R2_EO[16] = r2_ed;
assign R2_EO[15:0] = r2_ec;
assign R2_INT_STA[31:2] = 30'h0;
assign R2_INT_STA[1] = r2_int1_sta;
assign R2_INT_STA[0] = r2_int0_sta;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r3_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r3_logic_clr <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r2_logic_clr <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r1_logic_clr <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r0_logic_clr <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r3_hall_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r3_hall_enable <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_enc_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r2_enc_enable <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cap_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r1_cap_enable <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_gen_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r0_gen_enable <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_hw_update_en <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r0_hw_update_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_sw_update <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r0_sw_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_psc <= 16'h2;
    end
    else if(r0_pe_ctrl_wr) begin
        r0_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_arr <= 16'h32;
    end
    else if(r0_pe_ctrl_wr) begin
        r0_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_rcr <= 16'h0;
    end
    else if(r0_pe_ctrl1_wr) begin
        r0_rcr <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cms <= 2'h0;
    end
    else if(r0_pe_ctrl2_wr) begin
        r0_cms <= pwdata[2:1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_dir <= 1'b0;
    end
    else if(r0_pe_ctrl2_wr) begin
        r0_dir <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc1 <= 16'h0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_cc1 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go1 <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_go1 <= pwdata[14];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go1n <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_go1n <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss1 <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_ss1 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss1n <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_ss1n <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe1 <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_moe1 <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe1n <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_moe1n <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_dze1 <= 1'b1;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_dze1 <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc1p <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_cc1p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc1np <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_cc1np <= pwdata[6];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc1e <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_cc1e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc1ne <= 1'b0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_cc1ne <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc1m <= 4'h0;
    end
    else if(r0_pe_ctrl3_wr) begin
        r0_oc1m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc2 <= 16'h0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_cc2 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go2 <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_go2 <= pwdata[14];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go2n <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_go2n <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss2 <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_ss2 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss2n <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_ss2n <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe2 <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_moe2 <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe2n <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_moe2n <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_dze2 <= 1'b1;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_dze2 <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc2p <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_cc2p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc2np <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_cc2np <= pwdata[6];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc2e <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_cc2e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc2ne <= 1'b0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_cc2ne <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc2m <= 4'h0;
    end
    else if(r0_pe_ctrl4_wr) begin
        r0_oc2m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc3 <= 16'h0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_cc3 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go3 <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_go3 <= pwdata[14];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_go3n <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_go3n <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss3 <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_ss3 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss3n <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_ss3n <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe3 <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_moe3 <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_moe3n <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_moe3n <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_dze3 <= 1'b1;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_dze3 <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc3p <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_cc3p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc3np <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_cc3np <= pwdata[6];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc3e <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_cc3e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc3ne <= 1'b0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_cc3ne <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc3m <= 4'h0;
    end
    else if(r0_pe_ctrl5_wr) begin
        r0_oc3m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc4 <= 16'h0;
    end
    else if(r0_pe_ctrl6_wr) begin
        r0_cc4 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss4 <= 1'b0;
    end
    else if(r0_pe_ctrl6_wr) begin
        r0_ss4 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc4p <= 1'b0;
    end
    else if(r0_pe_ctrl6_wr) begin
        r0_cc4p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc4e <= 1'b0;
    end
    else if(r0_pe_ctrl6_wr) begin
        r0_cc4e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc4m <= 4'h0;
    end
    else if(r0_pe_ctrl6_wr) begin
        r0_oc4m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5 <= 16'h0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5c3 <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5c3 <= pwdata[15];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5c2 <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5c2 <= pwdata[14];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5c1 <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5c1 <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss5 <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_ss5 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5p <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc5e <= 1'b0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_cc5e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc5m <= 4'h0;
    end
    else if(r0_pe_ctrl7_wr) begin
        r0_oc5m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc6 <= 16'h0;
    end
    else if(r0_pe_ctrl8_wr) begin
        r0_cc6 <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_ss6 <= 1'b0;
    end
    else if(r0_pe_ctrl8_wr) begin
        r0_ss6 <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc6p <= 1'b0;
    end
    else if(r0_pe_ctrl8_wr) begin
        r0_cc6p <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_cc6e <= 1'b0;
    end
    else if(r0_pe_ctrl8_wr) begin
        r0_cc6e <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_oc6m <= 4'h0;
    end
    else if(r0_pe_ctrl8_wr) begin
        r0_oc6m <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_bt <= 4'h0;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_bt <= pwdata[19:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_bk2p <= 1'b0;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_bk2p <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_bk2e <= 1'b0;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_bk2e <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_bk1p <= 1'b0;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_bk1p <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_bk1e <= 1'b0;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_bk1e <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_dtg <= 10'h5;
    end
    else if(r0_pe_ctrl9_wr) begin
        r0_dtg <= pwdata[9:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int2_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int2_en <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int1_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int1_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int0_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int0_en <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int2_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int2_clr <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int1_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int1_clr <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int0_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int0_clr <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_psc <= 16'h2;
    end
    else if(r1_pe_ctrl_wr) begin
        r1_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_arr <= 16'h32;
    end
    else if(r1_pe_ctrl_wr) begin
        r1_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rcr <= 16'h0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_rcr <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_bt <= 4'h0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_bt <= pwdata[15:12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_ic1m <= 1'b0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_ic1m <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cc1p <= 1'b1;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_cc1p <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cc1np <= 1'b1;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_cc1np <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cc1e <= 1'b0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_cc1e <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cc1ne <= 1'b0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_cc1ne <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int1_en <= 1'b0;
    end
    else if(r1_int_en_wr) begin
        r1_int1_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int0_en <= 1'b0;
    end
    else if(r1_int_en_wr) begin
        r1_int0_en <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int1_clr <= 1'b0;
    end
    else if(r1_int_clr_wr) begin
        r1_int1_clr <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int0_clr <= 1'b0;
    end
    else if(r1_int_clr_wr) begin
        r1_int0_clr <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_arr <= 24'h8000;
    end
    else if(r2_pe_ctrl0_wr) begin
        r2_arr <= pwdata[23:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_bt <= 4'h0;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_bt <= pwdata[31:28];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_ec1m <= 1'b0;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_ec1m <= pwdata[16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_ec1p <= 1'b1;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_ec1p <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_ec1np <= 1'b1;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_ec1np <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_ec1e <= 1'b0;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_ec1e <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_ec1ne <= 1'b0;
    end
    else if(r2_pe_ctrl1_wr) begin
        r2_ec1ne <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_int1_en <= 1'b0;
    end
    else if(r2_int_en_wr) begin
        r2_int1_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_int0_en <= 1'b0;
    end
    else if(r2_int_en_wr) begin
        r2_int0_en <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_int1_clr <= 1'b0;
    end
    else if(r2_int_clr_wr) begin
        r2_int1_clr <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r2_int0_clr <= 1'b0;
    end
    else if(r2_int_clr_wr) begin
        r2_int0_clr <= pwdata[0];
    end
end
always@(*) begin
    case(paddr)
        32'h40021000 + 8'h00 : prdata = R_TOP_CTRL;
        32'h40021000 + 8'h04 : prdata = R0_PE_CTRL;
        32'h40021000 + 8'h08 : prdata = R0_PE_CTRL1;
        32'h40021000 + 8'h0c : prdata = R0_PE_CTRL2;
        32'h40021000 + 8'h10 : prdata = R0_PE_CTRL3;
        32'h40021000 + 8'h14 : prdata = R0_PE_CTRL4;
        32'h40021000 + 8'h18 : prdata = R0_PE_CTRL5;
        32'h40021000 + 8'h1c : prdata = R0_PE_CTRL6;
        32'h40021000 + 8'h20 : prdata = R0_PE_CTRL7;
        32'h40021000 + 8'h24 : prdata = R0_PE_CTRL8;
        32'h40021000 + 8'h28 : prdata = R0_PE_CTRL9;
        32'h40021000 + 8'h40 : prdata = R0_INT_EN ;
        32'h40021000 + 8'h44 : prdata = R0_INT_CLR;
        32'h40021000 + 8'h48 : prdata = R0_INT_STA;
        32'h40021000 + 8'h54 : prdata = R1_PE_CTRL;
        32'h40021000 + 8'h58 : prdata = R1_PE_CTRL1;
        32'h40021000 + 8'h5c : prdata = R1_INT_EN ;
        32'h40021000 + 8'h60 : prdata = R1_INT_CLR;
        32'h40021000 + 8'h64 : prdata = R1_IR     ;
        32'h40021000 + 8'h68 : prdata = R1_IC     ;
        32'h40021000 + 8'h6c : prdata = R1_INT_STA;
        32'h40021000 + 8'h70 : prdata = R2_PE_CTRL0;
        32'h40021000 + 8'h74 : prdata = R2_PE_CTRL1;
        32'h40021000 + 8'h7c : prdata = R2_INT_EN ;
        32'h40021000 + 8'h80 : prdata = R2_INT_CLR;
        32'h40021000 + 8'h84 : prdata = R2_EO     ;
        32'h40021000 + 8'h88 : prdata = R2_INT_STA;
        default:prdata = 32'b0;
    endcase
end
endmodule
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sun Sep 17 21:23:07 2023
// Host        : icpc running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim -rename_top ram_8k -prefix
//               ram_8k_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module ram_8k
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.3746 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_8k_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 45440)
`pragma protect data_block
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
+AhGia1JBxZQSkc=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

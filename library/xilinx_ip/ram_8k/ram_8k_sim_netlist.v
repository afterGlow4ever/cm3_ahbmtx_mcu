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
Yt3sU2Tbrb7iC6o=
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

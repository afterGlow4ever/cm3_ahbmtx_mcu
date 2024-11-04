module eth_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,r0_tx_data
                ,r0_tx_data_wr
                ,r0_tx_fifo_watermark
                ,r0_rx_fifo_watermark
                ,r0_tx_fifo_clr
                ,r0_rx_fifo_clr
                ,r0_master_logic_clr
                ,r0_update
                ,r0_clkdiv
                ,r0_phyadr
                ,r0_interval_bit
                ,r0_int5_en
                ,r0_int4_en
                ,r0_int3_en
                ,r0_int2_en
                ,r0_int1_en
                ,r0_int0_en
                ,r0_int5_clr
                ,r0_int4_clr
                ,r0_int3_clr
                ,r0_int2_clr
                ,r0_int1_clr
                ,r0_int0_clr
                ,r0_tx_fifo_num
                ,r0_rx_fifo_num
                ,r0_int5_sta
                ,r0_int4_sta
                ,r0_int3_sta
                ,r0_int2_sta
                ,r0_int1_sta
                ,r0_int0_sta
                ,r0_rx_data
                ,r0_rx_data_rd
                ,r1_dma_clr
                ,r1_tx_data_clr
                ,r1_rx_data_clr
                ,r1_tx_logic_clr
                ,r1_rx_logic_clr
                ,r1_tx_enable
                ,r1_rx_enable
                ,r1_pe_update
                ,r1_dma_update
                ,r1_hready_tothres
                ,r1_priority_ratio
                ,r1_txrx_priority
                ,r1_arb_scheme
                ,r1_tdes_addr
                ,r1_tdes_num
                ,r1_tdes_tail
                ,r1_rdes_addr
                ,r1_rdes_num
                ,r1_rdes_tail
                ,r1_tdes00
                ,r1_tdes01
                ,r1_tdes02
                ,r1_tdes03
                ,r1_tdes10
                ,r1_tdes11
                ,r1_tdes12
                ,r1_tdes13
                ,r1_tdes20
                ,r1_tdes21
                ,r1_tdes22
                ,r1_tdes23
                ,r1_tdes30
                ,r1_tdes31
                ,r1_tdes32
                ,r1_tdes33
                ,r1_rdes00
                ,r1_rdes01
                ,r1_rdes02
                ,r1_rdes03
                ,r1_rdes10
                ,r1_rdes11
                ,r1_rdes12
                ,r1_rdes13
                ,r1_rdes20
                ,r1_rdes21
                ,r1_rdes22
                ,r1_rdes23
                ,r1_rdes30
                ,r1_rdes31
                ,r1_rdes32
                ,r1_rdes33
                ,r1_sa_macaddrl
                ,r1_sa_macaddrh
                ,r1_arp_offload
                ,r1_sa_ctrl
                ,r1_sa_filter
                ,r1_ipc_filter
                ,r1_db_filter
                ,r1_2kp_en
                ,r1_cs_rm
                ,r1_pc_rm
                ,r1_fes
                ,r1_duplex
                ,r1_crsfd
                ,r1_pre_byte
                ,r1_interval_byte
                ,r1_int22_en
                ,r1_int21_en
                ,r1_int20_en
                ,r1_int00_clr
                ,r1_int10_clr
                ,r1_int22_clr
                ,r1_int21_clr
                ,r1_int20_clr
                ,r1_int00_sta
                ,r1_int10_sta
                ,r1_int22_sta
                ,r1_int21_sta
                ,r1_int20_sta
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output [22:0]   r0_tx_data;
output			r0_tx_data_wr;
output [2:0]    r0_tx_fifo_watermark;
output [2:0]    r0_rx_fifo_watermark;
output          r0_tx_fifo_clr;
output          r0_rx_fifo_clr;
output          r0_master_logic_clr;
output          r0_update;
output [7:0]    r0_clkdiv;
output [4:0]    r0_phyadr;
output [7:0]    r0_interval_bit;
output          r0_int5_en;
output          r0_int4_en;
output          r0_int3_en;
output          r0_int2_en;
output          r0_int1_en;
output          r0_int0_en;
output          r0_int5_clr;
output          r0_int4_clr;
output          r0_int3_clr;
output          r0_int2_clr;
output          r0_int1_clr;
output          r0_int0_clr;
input  [2:0]    r0_tx_fifo_num;
input  [2:0]    r0_rx_fifo_num;
input           r0_int5_sta;
input           r0_int4_sta;
input           r0_int3_sta;
input           r0_int2_sta;
input           r0_int1_sta;
input           r0_int0_sta;
input  [15:0]   r0_rx_data;
output			r0_rx_data_rd;
output          r1_dma_clr;
output          r1_tx_data_clr;
output          r1_rx_data_clr;
output          r1_tx_logic_clr;
output          r1_rx_logic_clr;
output          r1_tx_enable;
output          r1_rx_enable;
output          r1_pe_update;
output          r1_dma_update;
output [3:0]    r1_hready_tothres;
output [2:0]    r1_priority_ratio;
output          r1_txrx_priority;
output          r1_arb_scheme;
output [29:0]   r1_tdes_addr;
output [1:0]    r1_tdes_num;
output [29:0]   r1_tdes_tail;
output [29:0]   r1_rdes_addr;
output [1:0]    r1_rdes_num;
output [29:0]   r1_rdes_tail;
output [31:0]   r1_tdes00;
output [31:0]   r1_tdes01;
output [31:0]   r1_tdes02;
output [31:0]   r1_tdes03;
output [31:0]   r1_tdes10;
output [31:0]   r1_tdes11;
output [31:0]   r1_tdes12;
output [31:0]   r1_tdes13;
output [31:0]   r1_tdes20;
output [31:0]   r1_tdes21;
output [31:0]   r1_tdes22;
output [31:0]   r1_tdes23;
output [31:0]   r1_tdes30;
output [31:0]   r1_tdes31;
output [31:0]   r1_tdes32;
output [31:0]   r1_tdes33;
output [31:0]   r1_rdes00;
output [31:0]   r1_rdes01;
output [31:0]   r1_rdes02;
output [31:0]   r1_rdes03;
output [31:0]   r1_rdes10;
output [31:0]   r1_rdes11;
output [31:0]   r1_rdes12;
output [31:0]   r1_rdes13;
output [31:0]   r1_rdes20;
output [31:0]   r1_rdes21;
output [31:0]   r1_rdes22;
output [31:0]   r1_rdes23;
output [31:0]   r1_rdes30;
output [31:0]   r1_rdes31;
output [31:0]   r1_rdes32;
output [31:0]   r1_rdes33;
output [31:0]   r1_sa_macaddrl;
output [15:0]   r1_sa_macaddrh;
output          r1_arp_offload;
output [1:0]    r1_sa_ctrl;
output          r1_sa_filter;
output          r1_ipc_filter;
output          r1_db_filter;
output          r1_2kp_en;
output          r1_cs_rm;
output          r1_pc_rm;
output          r1_fes;
output          r1_duplex;
output          r1_crsfd;
output [1:0]    r1_pre_byte;
output [5:0]    r1_interval_byte;
output          r1_int22_en;
output          r1_int21_en;
output          r1_int20_en;
output          r1_int00_clr;
output          r1_int10_clr;
output          r1_int22_clr;
output          r1_int21_clr;
output          r1_int20_clr;
input           r1_int00_sta;
input           r1_int10_sta;
input           r1_int22_sta;
input           r1_int21_sta;
input           r1_int20_sta;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg  [22:0]     r0_tx_data;
reg  [2:0]      r0_tx_fifo_watermark;
reg  [2:0]      r0_rx_fifo_watermark;
reg             r0_tx_fifo_clr;
reg             r0_rx_fifo_clr;
reg             r0_master_logic_clr;
reg             r0_update;
reg  [7:0]      r0_clkdiv;
reg  [4:0]      r0_phyadr;
reg  [7:0]      r0_interval_bit;
reg             r0_int5_en;
reg             r0_int4_en;
reg             r0_int3_en;
reg             r0_int2_en;
reg             r0_int1_en;
reg             r0_int0_en;
reg             r0_int5_clr;
reg             r0_int4_clr;
reg             r0_int3_clr;
reg             r0_int2_clr;
reg             r0_int1_clr;
reg             r0_int0_clr;
wire [2:0]      r0_tx_fifo_num;
wire [2:0]      r0_rx_fifo_num;
wire            r0_int5_sta;
wire            r0_int4_sta;
wire            r0_int3_sta;
wire            r0_int2_sta;
wire            r0_int1_sta;
wire            r0_int0_sta;
wire [15:0]     r0_rx_data;
reg             r1_dma_clr;
reg             r1_tx_data_clr;
reg             r1_rx_data_clr;
reg             r1_tx_logic_clr;
reg             r1_rx_logic_clr;
reg             r1_tx_enable;
reg             r1_rx_enable;
reg             r1_pe_update;
reg             r1_dma_update;
reg  [3:0]      r1_hready_tothres;
reg  [2:0]      r1_priority_ratio;
reg             r1_txrx_priority;
reg             r1_arb_scheme;
reg  [29:0]     r1_tdes_addr;
reg  [1:0]      r1_tdes_num;
reg  [29:0]     r1_tdes_tail;
reg  [29:0]     r1_rdes_addr;
reg  [1:0]      r1_rdes_num;
reg  [29:0]     r1_rdes_tail;
reg  [31:0]     r1_tdes00;
reg  [31:0]     r1_tdes01;
reg  [31:0]     r1_tdes02;
reg  [31:0]     r1_tdes03;
reg  [31:0]     r1_tdes10;
reg  [31:0]     r1_tdes11;
reg  [31:0]     r1_tdes12;
reg  [31:0]     r1_tdes13;
reg  [31:0]     r1_tdes20;
reg  [31:0]     r1_tdes21;
reg  [31:0]     r1_tdes22;
reg  [31:0]     r1_tdes23;
reg  [31:0]     r1_tdes30;
reg  [31:0]     r1_tdes31;
reg  [31:0]     r1_tdes32;
reg  [31:0]     r1_tdes33;
reg  [31:0]     r1_rdes00;
reg  [31:0]     r1_rdes01;
reg  [31:0]     r1_rdes02;
reg  [31:0]     r1_rdes03;
reg  [31:0]     r1_rdes10;
reg  [31:0]     r1_rdes11;
reg  [31:0]     r1_rdes12;
reg  [31:0]     r1_rdes13;
reg  [31:0]     r1_rdes20;
reg  [31:0]     r1_rdes21;
reg  [31:0]     r1_rdes22;
reg  [31:0]     r1_rdes23;
reg  [31:0]     r1_rdes30;
reg  [31:0]     r1_rdes31;
reg  [31:0]     r1_rdes32;
reg  [31:0]     r1_rdes33;
reg  [31:0]     r1_sa_macaddrl;
reg  [15:0]     r1_sa_macaddrh;
reg             r1_arp_offload;
reg  [1:0]      r1_sa_ctrl;
reg             r1_sa_filter;
reg             r1_ipc_filter;
reg             r1_db_filter;
reg             r1_2kp_en;
reg             r1_cs_rm;
reg             r1_pc_rm;
reg             r1_fes;
reg             r1_duplex;
reg             r1_crsfd;
reg  [1:0]      r1_pre_byte;
reg  [5:0]      r1_interval_byte;
reg             r1_int22_en;
reg             r1_int21_en;
reg             r1_int20_en;
reg             r1_int00_clr;
reg             r1_int10_clr;
reg             r1_int22_clr;
reg             r1_int21_clr;
reg             r1_int20_clr;
wire            r1_int00_sta;
wire            r1_int10_sta;
wire            r1_int22_sta;
wire            r1_int21_sta;
wire            r1_int20_sta;
wire [31:0]     R0_TX_DATA;
wire [31:0]     R0_TOP_CTRL;
wire [31:0]     R0_PE_CTRL;
wire [31:0]     R0_INT_EN;
wire [31:0]     R0_INT_CLR;
wire [31:0]     R0_FIFO_STA;
wire [31:0]     R0_INT_STA;
wire [31:0]     R0_RX_DATA;
wire [31:0]     R1_TOP_CTRL;
wire [31:0]     R1_DMA_CTRL0;
wire [31:0]     R1_DMA_TDES0;
wire [31:0]     R1_DMA_TDES1;
wire [31:0]     R1_DMA_TDES2;
wire [31:0]     R1_DMA_RDES0;
wire [31:0]     R1_DMA_RDES1;
wire [31:0]     R1_DMA_RDES2;
wire [31:0]     R1_TDES00;
wire [31:0]     R1_TDES01;
wire [31:0]     R1_TDES02;
wire [31:0]     R1_TDES03;
wire [31:0]     R1_TDES10;
wire [31:0]     R1_TDES11;
wire [31:0]     R1_TDES12;
wire [31:0]     R1_TDES13;
wire [31:0]     R1_TDES20;
wire [31:0]     R1_TDES21;
wire [31:0]     R1_TDES22;
wire [31:0]     R1_TDES23;
wire [31:0]     R1_TDES30;
wire [31:0]     R1_TDES31;
wire [31:0]     R1_TDES32;
wire [31:0]     R1_TDES33;
wire [31:0]     R1_RDES00;
wire [31:0]     R1_RDES01;
wire [31:0]     R1_RDES02;
wire [31:0]     R1_RDES03;
wire [31:0]     R1_RDES10;
wire [31:0]     R1_RDES11;
wire [31:0]     R1_RDES12;
wire [31:0]     R1_RDES13;
wire [31:0]     R1_RDES20;
wire [31:0]     R1_RDES21;
wire [31:0]     R1_RDES22;
wire [31:0]     R1_RDES23;
wire [31:0]     R1_RDES30;
wire [31:0]     R1_RDES31;
wire [31:0]     R1_RDES32;
wire [31:0]     R1_RDES33;
wire [31:0]     R1_PE_CTRL0;
wire [31:0]     R1_PE_CTRL1;
wire [31:0]     R1_PE_CTRL2;
wire [31:0]     R1_PE_CTRL3;
wire [31:0]     R1_INT0_EN;
wire [31:0]     R1_INT1_EN;
wire [31:0]     R1_INT2_EN;
wire [31:0]     R1_INT0_CLR;
wire [31:0]     R1_INT1_CLR;
wire [31:0]     R1_INT2_CLR;
wire [31:0]     R1_INT0_STA;
wire [31:0]     R1_INT1_STA;
wire [31:0]     R1_INT2_STA;
//wire            r0_tx_data_wr;
wire            r0_tx_data_rd;
wire            r0_top_ctrl_wr;
wire            r0_top_ctrl_rd;
wire            r0_pe_ctrl_wr;
wire            r0_pe_ctrl_rd;
wire            r0_int_en_wr;
wire            r0_int_en_rd;
wire            r0_int_clr_wr;
wire            r0_int_clr_rd;
wire            r0_fifo_sta_wr;
wire            r0_fifo_sta_rd;
wire            r0_int_sta_wr;
wire            r0_int_sta_rd;
wire            r0_rx_data_wr;
//wire            r0_rx_data_rd;
wire            r1_top_ctrl_wr;
wire            r1_top_ctrl_rd;
wire            r1_dma_ctrl0_wr;
wire            r1_dma_ctrl0_rd;
wire            r1_dma_tdes0_wr;
wire            r1_dma_tdes0_rd;
wire            r1_dma_tdes1_wr;
wire            r1_dma_tdes1_rd;
wire            r1_dma_tdes2_wr;
wire            r1_dma_tdes2_rd;
wire            r1_dma_rdes0_wr;
wire            r1_dma_rdes0_rd;
wire            r1_dma_rdes1_wr;
wire            r1_dma_rdes1_rd;
wire            r1_dma_rdes2_wr;
wire            r1_dma_rdes2_rd;
wire            r1_tdes00_wr;
wire            r1_tdes00_rd;
wire            r1_tdes01_wr;
wire            r1_tdes01_rd;
wire            r1_tdes02_wr;
wire            r1_tdes02_rd;
wire            r1_tdes03_wr;
wire            r1_tdes03_rd;
wire            r1_tdes10_wr;
wire            r1_tdes10_rd;
wire            r1_tdes11_wr;
wire            r1_tdes11_rd;
wire            r1_tdes12_wr;
wire            r1_tdes12_rd;
wire            r1_tdes13_wr;
wire            r1_tdes13_rd;
wire            r1_tdes20_wr;
wire            r1_tdes20_rd;
wire            r1_tdes21_wr;
wire            r1_tdes21_rd;
wire            r1_tdes22_wr;
wire            r1_tdes22_rd;
wire            r1_tdes23_wr;
wire            r1_tdes23_rd;
wire            r1_tdes30_wr;
wire            r1_tdes30_rd;
wire            r1_tdes31_wr;
wire            r1_tdes31_rd;
wire            r1_tdes32_wr;
wire            r1_tdes32_rd;
wire            r1_tdes33_wr;
wire            r1_tdes33_rd;
wire            r1_rdes00_wr;
wire            r1_rdes00_rd;
wire            r1_rdes01_wr;
wire            r1_rdes01_rd;
wire            r1_rdes02_wr;
wire            r1_rdes02_rd;
wire            r1_rdes03_wr;
wire            r1_rdes03_rd;
wire            r1_rdes10_wr;
wire            r1_rdes10_rd;
wire            r1_rdes11_wr;
wire            r1_rdes11_rd;
wire            r1_rdes12_wr;
wire            r1_rdes12_rd;
wire            r1_rdes13_wr;
wire            r1_rdes13_rd;
wire            r1_rdes20_wr;
wire            r1_rdes20_rd;
wire            r1_rdes21_wr;
wire            r1_rdes21_rd;
wire            r1_rdes22_wr;
wire            r1_rdes22_rd;
wire            r1_rdes23_wr;
wire            r1_rdes23_rd;
wire            r1_rdes30_wr;
wire            r1_rdes30_rd;
wire            r1_rdes31_wr;
wire            r1_rdes31_rd;
wire            r1_rdes32_wr;
wire            r1_rdes32_rd;
wire            r1_rdes33_wr;
wire            r1_rdes33_rd;
wire            r1_pe_ctrl0_wr;
wire            r1_pe_ctrl0_rd;
wire            r1_pe_ctrl1_wr;
wire            r1_pe_ctrl1_rd;
wire            r1_pe_ctrl2_wr;
wire            r1_pe_ctrl2_rd;
wire            r1_pe_ctrl3_wr;
wire            r1_pe_ctrl3_rd;
wire            r1_int0_en_wr;
wire            r1_int0_en_rd;
wire            r1_int1_en_wr;
wire            r1_int1_en_rd;
wire            r1_int2_en_wr;
wire            r1_int2_en_rd;
wire            r1_int0_clr_wr;
wire            r1_int0_clr_rd;
wire            r1_int1_clr_wr;
wire            r1_int1_clr_rd;
wire            r1_int2_clr_wr;
wire            r1_int2_clr_rd;
wire            r1_int0_sta_wr;
wire            r1_int0_sta_rd;
wire            r1_int1_sta_wr;
wire            r1_int1_sta_rd;
wire            r1_int2_sta_wr;
wire            r1_int2_sta_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r0_tx_data_wr = (paddr == 32'h40020000 + 12'h00) & reg_wr;
assign r0_tx_data_rd = (paddr == 32'h40020000 + 12'h00) & reg_rd;
assign r0_top_ctrl_wr = (paddr == 32'h40020000 + 12'h04) & reg_wr;
assign r0_top_ctrl_rd = (paddr == 32'h40020000 + 12'h04) & reg_rd;
assign r0_pe_ctrl_wr = (paddr == 32'h40020000 + 12'h08) & reg_wr;
assign r0_pe_ctrl_rd = (paddr == 32'h40020000 + 12'h08) & reg_rd;
assign r0_int_en_wr = (paddr == 32'h40020000 + 12'h0c) & reg_wr;
assign r0_int_en_rd = (paddr == 32'h40020000 + 12'h0c) & reg_rd;
assign r0_int_clr_wr = (paddr == 32'h40020000 + 12'h10) & reg_wr;
assign r0_int_clr_rd = (paddr == 32'h40020000 + 12'h10) & reg_rd;
assign r0_fifo_sta_wr = (paddr == 32'h40020000 + 12'h14) & reg_wr;
assign r0_fifo_sta_rd = (paddr == 32'h40020000 + 12'h14) & reg_rd;
assign r0_int_sta_wr = (paddr == 32'h40020000 + 12'h18) & reg_wr;
assign r0_int_sta_rd = (paddr == 32'h40020000 + 12'h18) & reg_rd;
assign r0_rx_data_wr = (paddr == 32'h40020000 + 12'h1c) & reg_wr;
assign r0_rx_data_rd = (paddr == 32'h40020000 + 12'h1c) & reg_rd;
assign r1_top_ctrl_wr = (paddr == 32'h40020000 + 12'h30) & reg_wr;
assign r1_top_ctrl_rd = (paddr == 32'h40020000 + 12'h30) & reg_rd;
assign r1_dma_ctrl0_wr = (paddr == 32'h40020000 + 12'h34) & reg_wr;
assign r1_dma_ctrl0_rd = (paddr == 32'h40020000 + 12'h34) & reg_rd;
assign r1_dma_tdes0_wr = (paddr == 32'h40020000 + 12'h40) & reg_wr;
assign r1_dma_tdes0_rd = (paddr == 32'h40020000 + 12'h40) & reg_rd;
assign r1_dma_tdes1_wr = (paddr == 32'h40020000 + 12'h44) & reg_wr;
assign r1_dma_tdes1_rd = (paddr == 32'h40020000 + 12'h44) & reg_rd;
assign r1_dma_tdes2_wr = (paddr == 32'h40020000 + 12'h48) & reg_wr;
assign r1_dma_tdes2_rd = (paddr == 32'h40020000 + 12'h48) & reg_rd;
assign r1_dma_rdes0_wr = (paddr == 32'h40020000 + 12'h50) & reg_wr;
assign r1_dma_rdes0_rd = (paddr == 32'h40020000 + 12'h50) & reg_rd;
assign r1_dma_rdes1_wr = (paddr == 32'h40020000 + 12'h54) & reg_wr;
assign r1_dma_rdes1_rd = (paddr == 32'h40020000 + 12'h54) & reg_rd;
assign r1_dma_rdes2_wr = (paddr == 32'h40020000 + 12'h58) & reg_wr;
assign r1_dma_rdes2_rd = (paddr == 32'h40020000 + 12'h58) & reg_rd;
assign r1_tdes00_wr = (paddr == 32'h40020000 + 12'h80) & reg_wr;
assign r1_tdes00_rd = (paddr == 32'h40020000 + 12'h80) & reg_rd;
assign r1_tdes01_wr = (paddr == 32'h40020000 + 12'h84) & reg_wr;
assign r1_tdes01_rd = (paddr == 32'h40020000 + 12'h84) & reg_rd;
assign r1_tdes02_wr = (paddr == 32'h40020000 + 12'h88) & reg_wr;
assign r1_tdes02_rd = (paddr == 32'h40020000 + 12'h88) & reg_rd;
assign r1_tdes03_wr = (paddr == 32'h40020000 + 12'h8c) & reg_wr;
assign r1_tdes03_rd = (paddr == 32'h40020000 + 12'h8c) & reg_rd;
assign r1_tdes10_wr = (paddr == 32'h40020000 + 12'h90) & reg_wr;
assign r1_tdes10_rd = (paddr == 32'h40020000 + 12'h90) & reg_rd;
assign r1_tdes11_wr = (paddr == 32'h40020000 + 12'h94) & reg_wr;
assign r1_tdes11_rd = (paddr == 32'h40020000 + 12'h94) & reg_rd;
assign r1_tdes12_wr = (paddr == 32'h40020000 + 12'h98) & reg_wr;
assign r1_tdes12_rd = (paddr == 32'h40020000 + 12'h98) & reg_rd;
assign r1_tdes13_wr = (paddr == 32'h40020000 + 12'h9c) & reg_wr;
assign r1_tdes13_rd = (paddr == 32'h40020000 + 12'h9c) & reg_rd;
assign r1_tdes20_wr = (paddr == 32'h40020000 + 12'ha0) & reg_wr;
assign r1_tdes20_rd = (paddr == 32'h40020000 + 12'ha0) & reg_rd;
assign r1_tdes21_wr = (paddr == 32'h40020000 + 12'ha4) & reg_wr;
assign r1_tdes21_rd = (paddr == 32'h40020000 + 12'ha4) & reg_rd;
assign r1_tdes22_wr = (paddr == 32'h40020000 + 12'ha8) & reg_wr;
assign r1_tdes22_rd = (paddr == 32'h40020000 + 12'ha8) & reg_rd;
assign r1_tdes23_wr = (paddr == 32'h40020000 + 12'hac) & reg_wr;
assign r1_tdes23_rd = (paddr == 32'h40020000 + 12'hac) & reg_rd;
assign r1_tdes30_wr = (paddr == 32'h40020000 + 12'hb0) & reg_wr;
assign r1_tdes30_rd = (paddr == 32'h40020000 + 12'hb0) & reg_rd;
assign r1_tdes31_wr = (paddr == 32'h40020000 + 12'hb4) & reg_wr;
assign r1_tdes31_rd = (paddr == 32'h40020000 + 12'hb4) & reg_rd;
assign r1_tdes32_wr = (paddr == 32'h40020000 + 12'hb8) & reg_wr;
assign r1_tdes32_rd = (paddr == 32'h40020000 + 12'hb8) & reg_rd;
assign r1_tdes33_wr = (paddr == 32'h40020000 + 12'hbc) & reg_wr;
assign r1_tdes33_rd = (paddr == 32'h40020000 + 12'hbc) & reg_rd;
assign r1_rdes00_wr = (paddr == 32'h40020000 + 12'hc0) & reg_wr;
assign r1_rdes00_rd = (paddr == 32'h40020000 + 12'hc0) & reg_rd;
assign r1_rdes01_wr = (paddr == 32'h40020000 + 12'hc4) & reg_wr;
assign r1_rdes01_rd = (paddr == 32'h40020000 + 12'hc4) & reg_rd;
assign r1_rdes02_wr = (paddr == 32'h40020000 + 12'hc8) & reg_wr;
assign r1_rdes02_rd = (paddr == 32'h40020000 + 12'hc8) & reg_rd;
assign r1_rdes03_wr = (paddr == 32'h40020000 + 12'hcc) & reg_wr;
assign r1_rdes03_rd = (paddr == 32'h40020000 + 12'hcc) & reg_rd;
assign r1_rdes10_wr = (paddr == 32'h40020000 + 12'hd0) & reg_wr;
assign r1_rdes10_rd = (paddr == 32'h40020000 + 12'hd0) & reg_rd;
assign r1_rdes11_wr = (paddr == 32'h40020000 + 12'hd4) & reg_wr;
assign r1_rdes11_rd = (paddr == 32'h40020000 + 12'hd4) & reg_rd;
assign r1_rdes12_wr = (paddr == 32'h40020000 + 12'hd8) & reg_wr;
assign r1_rdes12_rd = (paddr == 32'h40020000 + 12'hd8) & reg_rd;
assign r1_rdes13_wr = (paddr == 32'h40020000 + 12'hdc) & reg_wr;
assign r1_rdes13_rd = (paddr == 32'h40020000 + 12'hdc) & reg_rd;
assign r1_rdes20_wr = (paddr == 32'h40020000 + 12'he0) & reg_wr;
assign r1_rdes20_rd = (paddr == 32'h40020000 + 12'he0) & reg_rd;
assign r1_rdes21_wr = (paddr == 32'h40020000 + 12'he4) & reg_wr;
assign r1_rdes21_rd = (paddr == 32'h40020000 + 12'he4) & reg_rd;
assign r1_rdes22_wr = (paddr == 32'h40020000 + 12'he8) & reg_wr;
assign r1_rdes22_rd = (paddr == 32'h40020000 + 12'he8) & reg_rd;
assign r1_rdes23_wr = (paddr == 32'h40020000 + 12'hec) & reg_wr;
assign r1_rdes23_rd = (paddr == 32'h40020000 + 12'hec) & reg_rd;
assign r1_rdes30_wr = (paddr == 32'h40020000 + 12'hf0) & reg_wr;
assign r1_rdes30_rd = (paddr == 32'h40020000 + 12'hf0) & reg_rd;
assign r1_rdes31_wr = (paddr == 32'h40020000 + 12'hf4) & reg_wr;
assign r1_rdes31_rd = (paddr == 32'h40020000 + 12'hf4) & reg_rd;
assign r1_rdes32_wr = (paddr == 32'h40020000 + 12'hf8) & reg_wr;
assign r1_rdes32_rd = (paddr == 32'h40020000 + 12'hf8) & reg_rd;
assign r1_rdes33_wr = (paddr == 32'h40020000 + 12'hfc) & reg_wr;
assign r1_rdes33_rd = (paddr == 32'h40020000 + 12'hfc) & reg_rd;
assign r1_pe_ctrl0_wr = (paddr == 32'h40020000 + 12'h100) & reg_wr;
assign r1_pe_ctrl0_rd = (paddr == 32'h40020000 + 12'h100) & reg_rd;
assign r1_pe_ctrl1_wr = (paddr == 32'h40020000 + 12'h104) & reg_wr;
assign r1_pe_ctrl1_rd = (paddr == 32'h40020000 + 12'h104) & reg_rd;
assign r1_pe_ctrl2_wr = (paddr == 32'h40020000 + 12'h108) & reg_wr;
assign r1_pe_ctrl2_rd = (paddr == 32'h40020000 + 12'h108) & reg_rd;
assign r1_pe_ctrl3_wr = (paddr == 32'h40020000 + 12'h10c) & reg_wr;
assign r1_pe_ctrl3_rd = (paddr == 32'h40020000 + 12'h10c) & reg_rd;
assign r1_int0_en_wr = (paddr == 32'h40020000 + 12'h120) & reg_wr;
assign r1_int0_en_rd = (paddr == 32'h40020000 + 12'h120) & reg_rd;
assign r1_int1_en_wr = (paddr == 32'h40020000 + 12'h124) & reg_wr;
assign r1_int1_en_rd = (paddr == 32'h40020000 + 12'h124) & reg_rd;
assign r1_int2_en_wr = (paddr == 32'h40020000 + 12'h128) & reg_wr;
assign r1_int2_en_rd = (paddr == 32'h40020000 + 12'h128) & reg_rd;
assign r1_int0_clr_wr = (paddr == 32'h40020000 + 12'h130) & reg_wr;
assign r1_int0_clr_rd = (paddr == 32'h40020000 + 12'h130) & reg_rd;
assign r1_int1_clr_wr = (paddr == 32'h40020000 + 12'h134) & reg_wr;
assign r1_int1_clr_rd = (paddr == 32'h40020000 + 12'h134) & reg_rd;
assign r1_int2_clr_wr = (paddr == 32'h40020000 + 12'h138) & reg_wr;
assign r1_int2_clr_rd = (paddr == 32'h40020000 + 12'h138) & reg_rd;
assign r1_int0_sta_wr = (paddr == 32'h40020000 + 12'h140) & reg_wr;
assign r1_int0_sta_rd = (paddr == 32'h40020000 + 12'h140) & reg_rd;
assign r1_int1_sta_wr = (paddr == 32'h40020000 + 12'h144) & reg_wr;
assign r1_int1_sta_rd = (paddr == 32'h40020000 + 12'h144) & reg_rd;
assign r1_int2_sta_wr = (paddr == 32'h40020000 + 12'h148) & reg_wr;
assign r1_int2_sta_rd = (paddr == 32'h40020000 + 12'h148) & reg_rd;
assign R0_TX_DATA[31:23] = 9'h0;
assign R0_TX_DATA[22:0] = 23'h0;
assign R0_TOP_CTRL[31:27] = 5'h0;
assign R0_TOP_CTRL[26:24] = r0_tx_fifo_watermark;
assign R0_TOP_CTRL[23:19] = 5'h0;
assign R0_TOP_CTRL[18:16] = r0_rx_fifo_watermark;
assign R0_TOP_CTRL[15:12] = 4'h0;
assign R0_TOP_CTRL[11] = r0_tx_fifo_clr;
assign R0_TOP_CTRL[10] = r0_rx_fifo_clr;
assign R0_TOP_CTRL[9] = r0_master_logic_clr;
assign R0_TOP_CTRL[8] = 1'b0;
assign R0_TOP_CTRL[7:1] = 7'h0;
assign R0_TOP_CTRL[0] = r0_update;
assign R0_PE_CTRL[31:24] = r0_clkdiv;
assign R0_PE_CTRL[23:21] = 3'h0;
assign R0_PE_CTRL[20:16] = r0_phyadr;
assign R0_PE_CTRL[15:8] = r0_interval_bit;
assign R0_PE_CTRL[7:0] = 8'h0;
assign R0_INT_EN[31:6] = 26'h0;
assign R0_INT_EN[5] = r0_int5_en;
assign R0_INT_EN[4] = r0_int4_en;
assign R0_INT_EN[3] = r0_int3_en;
assign R0_INT_EN[2] = r0_int2_en;
assign R0_INT_EN[1] = r0_int1_en;
assign R0_INT_EN[0] = r0_int0_en;
assign R0_INT_CLR[31:6] = 26'h0;
assign R0_INT_CLR[5] = r0_int5_clr;
assign R0_INT_CLR[4] = r0_int4_clr;
assign R0_INT_CLR[3] = r0_int3_clr;
assign R0_INT_CLR[2] = r0_int2_clr;
assign R0_INT_CLR[1] = r0_int1_clr;
assign R0_INT_CLR[0] = r0_int0_clr;
assign R0_FIFO_STA[31:11] = 21'h0;
assign R0_FIFO_STA[10:8] = r0_tx_fifo_num;
assign R0_FIFO_STA[7:3] = 5'h0;
assign R0_FIFO_STA[2:0] = r0_rx_fifo_num;
assign R0_INT_STA[31:6] = 26'h0;
assign R0_INT_STA[5] = r0_int5_sta;
assign R0_INT_STA[4] = r0_int4_sta;
assign R0_INT_STA[3] = r0_int3_sta;
assign R0_INT_STA[2] = r0_int2_sta;
assign R0_INT_STA[1] = r0_int1_sta;
assign R0_INT_STA[0] = r0_int0_sta;
assign R0_RX_DATA[31:16] = 16'h0;
assign R0_RX_DATA[15:0] = r0_rx_data;
assign R1_TOP_CTRL[31:13] = 19'h0;
assign R1_TOP_CTRL[12] = r1_dma_clr;
assign R1_TOP_CTRL[11] = r1_tx_data_clr;
assign R1_TOP_CTRL[10] = r1_rx_data_clr;
assign R1_TOP_CTRL[9] = r1_tx_logic_clr;
assign R1_TOP_CTRL[8] = r1_rx_logic_clr;
assign R1_TOP_CTRL[7:4] = 4'h0;
assign R1_TOP_CTRL[3] = r1_tx_enable;
assign R1_TOP_CTRL[2] = r1_rx_enable;
assign R1_TOP_CTRL[1] = r1_pe_update;
assign R1_TOP_CTRL[0] = r1_dma_update;
assign R1_DMA_CTRL0[31:28] = r1_hready_tothres;
assign R1_DMA_CTRL0[27:5] = 23'h0;
assign R1_DMA_CTRL0[4:2] = r1_priority_ratio;
assign R1_DMA_CTRL0[1] = r1_txrx_priority;
assign R1_DMA_CTRL0[0] = r1_arb_scheme;
assign R1_DMA_TDES0[31:2] = r1_tdes_addr;
assign R1_DMA_TDES0[1:0] = r1_tdes_num;
assign R1_DMA_TDES1[31:2] = r1_tdes_tail;
assign R1_DMA_TDES1[1:0] = 2'h0;
assign R1_DMA_TDES2[31:0] = 32'h0;
assign R1_DMA_RDES0[31:2] = r1_rdes_addr;
assign R1_DMA_RDES0[1:0] = r1_rdes_num;
assign R1_DMA_RDES1[31:2] = r1_rdes_tail;
assign R1_DMA_RDES1[1:0] = 2'h0;
assign R1_DMA_RDES2[31:0] = 32'h0;
assign R1_TDES00[31:0] = r1_tdes00;
assign R1_TDES01[31:0] = r1_tdes01;
assign R1_TDES02[31:0] = r1_tdes02;
assign R1_TDES03[31:0] = r1_tdes03;
assign R1_TDES10[31:0] = r1_tdes10;
assign R1_TDES11[31:0] = r1_tdes11;
assign R1_TDES12[31:0] = r1_tdes12;
assign R1_TDES13[31:0] = r1_tdes13;
assign R1_TDES20[31:0] = r1_tdes20;
assign R1_TDES21[31:0] = r1_tdes21;
assign R1_TDES22[31:0] = r1_tdes22;
assign R1_TDES23[31:0] = r1_tdes23;
assign R1_TDES30[31:0] = r1_tdes30;
assign R1_TDES31[31:0] = r1_tdes31;
assign R1_TDES32[31:0] = r1_tdes32;
assign R1_TDES33[31:0] = r1_tdes33;
assign R1_RDES00[31:0] = r1_rdes00;
assign R1_RDES01[31:0] = r1_rdes01;
assign R1_RDES02[31:0] = r1_rdes02;
assign R1_RDES03[31:0] = r1_rdes03;
assign R1_RDES10[31:0] = r1_rdes10;
assign R1_RDES11[31:0] = r1_rdes11;
assign R1_RDES12[31:0] = r1_rdes12;
assign R1_RDES13[31:0] = r1_rdes13;
assign R1_RDES20[31:0] = r1_rdes20;
assign R1_RDES21[31:0] = r1_rdes21;
assign R1_RDES22[31:0] = r1_rdes22;
assign R1_RDES23[31:0] = r1_rdes23;
assign R1_RDES30[31:0] = r1_rdes30;
assign R1_RDES31[31:0] = r1_rdes31;
assign R1_RDES32[31:0] = r1_rdes32;
assign R1_RDES33[31:0] = r1_rdes33;
assign R1_PE_CTRL0[31:0] = r1_sa_macaddrl;
assign R1_PE_CTRL1[31:16] = 16'h0;
assign R1_PE_CTRL1[15:0] = r1_sa_macaddrh;
assign R1_PE_CTRL2[31] = r1_arp_offload;
assign R1_PE_CTRL2[30:29] = r1_sa_ctrl;
assign R1_PE_CTRL2[28] = r1_sa_filter;
assign R1_PE_CTRL2[27] = r1_ipc_filter;
assign R1_PE_CTRL2[26] = 1'b0;
assign R1_PE_CTRL2[25] = r1_db_filter;
assign R1_PE_CTRL2[24] = 1'b0;
assign R1_PE_CTRL2[23] = 1'b0;
assign R1_PE_CTRL2[22] = r1_2kp_en;
assign R1_PE_CTRL2[21] = r1_cs_rm;
assign R1_PE_CTRL2[20] = r1_pc_rm;
assign R1_PE_CTRL2[19:15] = 5'h0;
assign R1_PE_CTRL2[14] = r1_fes;
assign R1_PE_CTRL2[13] = r1_duplex;
assign R1_PE_CTRL2[12] = 1'b0;
assign R1_PE_CTRL2[11] = r1_crsfd;
assign R1_PE_CTRL2[10:4] = 7'h0;
assign R1_PE_CTRL2[3:2] = r1_pre_byte;
assign R1_PE_CTRL2[1:0] = 2'h0;
assign R1_PE_CTRL3[31:30] = 2'h0;
assign R1_PE_CTRL3[29:24] = r1_interval_byte;
assign R1_PE_CTRL3[23:0] = 24'h0;
assign R1_INT0_EN[31:0] = 32'h0;
assign R1_INT1_EN[31:0] = 32'h0;
assign R1_INT2_EN[31:3] = 29'h0;
assign R1_INT2_EN[2] = r1_int22_en;
assign R1_INT2_EN[1] = r1_int21_en;
assign R1_INT2_EN[0] = r1_int20_en;
assign R1_INT0_CLR[31:1] = 31'h0;
assign R1_INT0_CLR[0] = r1_int00_clr;
assign R1_INT1_CLR[31:1] = 31'h0;
assign R1_INT1_CLR[0] = r1_int10_clr;
assign R1_INT2_CLR[31:3] = 29'h0;
assign R1_INT2_CLR[2] = r1_int22_clr;
assign R1_INT2_CLR[1] = r1_int21_clr;
assign R1_INT2_CLR[0] = r1_int20_clr;
assign R1_INT0_STA[31:1] = 31'h0;
assign R1_INT0_STA[0] = r1_int00_sta;
assign R1_INT1_STA[31:1] = 31'h0;
assign R1_INT1_STA[0] = r1_int10_sta;
assign R1_INT2_STA[31:3] = 29'h0;
assign R1_INT2_STA[2] = r1_int22_sta;
assign R1_INT2_STA[1] = r1_int21_sta;
assign R1_INT2_STA[0] = r1_int20_sta;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_tx_data <= 23'h0;
    end
    else if(r0_tx_data_wr) begin
        r0_tx_data <= pwdata[22:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_tx_fifo_watermark <= 3'h2;
    end
    else if(r0_top_ctrl_wr) begin
        r0_tx_fifo_watermark <= pwdata[26:24];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_rx_fifo_watermark <= 3'h2;
    end
    else if(r0_top_ctrl_wr) begin
        r0_rx_fifo_watermark <= pwdata[18:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_tx_fifo_clr <= 1'b0;
    end
    else if(r0_top_ctrl_wr) begin
        r0_tx_fifo_clr <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_rx_fifo_clr <= 1'b0;
    end
    else if(r0_top_ctrl_wr) begin
        r0_rx_fifo_clr <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_master_logic_clr <= 1'b0;
    end
    else if(r0_top_ctrl_wr) begin
        r0_master_logic_clr <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_update <= 1'b0;
    end
    else if(r0_top_ctrl_wr) begin
        r0_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_clkdiv <= 8'h4;
    end
    else if(r0_pe_ctrl_wr) begin
        r0_clkdiv <= pwdata[31:24];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_phyadr <= 5'h0;
    end
    else if(r0_pe_ctrl_wr) begin
        r0_phyadr <= pwdata[20:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_interval_bit <= 8'h3;
    end
    else if(r0_pe_ctrl_wr) begin
        r0_interval_bit <= pwdata[15:8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int5_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int5_en <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int4_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int4_en <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int3_en <= 1'b0;
    end
    else if(r0_int_en_wr) begin
        r0_int3_en <= pwdata[3];
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
        r0_int5_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int5_clr <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int4_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int4_clr <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r0_int3_clr <= 1'b0;
    end
    else if(r0_int_clr_wr) begin
        r0_int3_clr <= pwdata[3];
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
        r1_dma_clr <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_dma_clr <= pwdata[12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tx_data_clr <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_tx_data_clr <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rx_data_clr <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_rx_data_clr <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tx_logic_clr <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_tx_logic_clr <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rx_logic_clr <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_rx_logic_clr <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tx_enable <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_tx_enable <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rx_enable <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_rx_enable <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_pe_update <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_pe_update <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_dma_update <= 1'b0;
    end
    else if(r1_top_ctrl_wr) begin
        r1_dma_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_hready_tothres <= 4'h8;
    end
    else if(r1_dma_ctrl0_wr) begin
        r1_hready_tothres <= pwdata[31:28];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_priority_ratio <= 3'h0;
    end
    else if(r1_dma_ctrl0_wr) begin
        r1_priority_ratio <= pwdata[4:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_txrx_priority <= 1'b0;
    end
    else if(r1_dma_ctrl0_wr) begin
        r1_txrx_priority <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_arb_scheme <= 1'b0;
    end
    else if(r1_dma_ctrl0_wr) begin
        r1_arb_scheme <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes_addr <= 30'h0;
    end
    else if(r1_dma_tdes0_wr) begin
        r1_tdes_addr <= pwdata[31:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes_num <= 2'h3;
    end
    else if(r1_dma_tdes0_wr) begin
        r1_tdes_num <= pwdata[1:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes_tail <= 30'h0;
    end
    else if(r1_dma_tdes1_wr) begin
        r1_tdes_tail <= pwdata[31:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes_addr <= 30'h0;
    end
    else if(r1_dma_rdes0_wr) begin
        r1_rdes_addr <= pwdata[31:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes_num <= 2'h3;
    end
    else if(r1_dma_rdes0_wr) begin
        r1_rdes_num <= pwdata[1:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes_tail <= 30'h0;
    end
    else if(r1_dma_rdes1_wr) begin
        r1_rdes_tail <= pwdata[31:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes00 <= 32'h0;
    end
    else if(r1_tdes00_wr) begin
        r1_tdes00 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes01 <= 32'h0;
    end
    else if(r1_tdes01_wr) begin
        r1_tdes01 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes02 <= 32'h0;
    end
    else if(r1_tdes02_wr) begin
        r1_tdes02 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes03 <= 32'h0;
    end
    else if(r1_tdes03_wr) begin
        r1_tdes03 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes10 <= 32'h0;
    end
    else if(r1_tdes10_wr) begin
        r1_tdes10 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes11 <= 32'h0;
    end
    else if(r1_tdes11_wr) begin
        r1_tdes11 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes12 <= 32'h0;
    end
    else if(r1_tdes12_wr) begin
        r1_tdes12 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes13 <= 32'h0;
    end
    else if(r1_tdes13_wr) begin
        r1_tdes13 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes20 <= 32'h0;
    end
    else if(r1_tdes20_wr) begin
        r1_tdes20 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes21 <= 32'h0;
    end
    else if(r1_tdes21_wr) begin
        r1_tdes21 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes22 <= 32'h0;
    end
    else if(r1_tdes22_wr) begin
        r1_tdes22 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes23 <= 32'h0;
    end
    else if(r1_tdes23_wr) begin
        r1_tdes23 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes30 <= 32'h0;
    end
    else if(r1_tdes30_wr) begin
        r1_tdes30 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes31 <= 32'h0;
    end
    else if(r1_tdes31_wr) begin
        r1_tdes31 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes32 <= 32'h0;
    end
    else if(r1_tdes32_wr) begin
        r1_tdes32 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_tdes33 <= 32'h0;
    end
    else if(r1_tdes33_wr) begin
        r1_tdes33 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes00 <= 32'h0;
    end
    else if(r1_rdes00_wr) begin
        r1_rdes00 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes01 <= 32'h0;
    end
    else if(r1_rdes01_wr) begin
        r1_rdes01 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes02 <= 32'h0;
    end
    else if(r1_rdes02_wr) begin
        r1_rdes02 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes03 <= 32'h0;
    end
    else if(r1_rdes03_wr) begin
        r1_rdes03 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes10 <= 32'h0;
    end
    else if(r1_rdes10_wr) begin
        r1_rdes10 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes11 <= 32'h0;
    end
    else if(r1_rdes11_wr) begin
        r1_rdes11 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes12 <= 32'h0;
    end
    else if(r1_rdes12_wr) begin
        r1_rdes12 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes13 <= 32'h0;
    end
    else if(r1_rdes13_wr) begin
        r1_rdes13 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes20 <= 32'h0;
    end
    else if(r1_rdes20_wr) begin
        r1_rdes20 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes21 <= 32'h0;
    end
    else if(r1_rdes21_wr) begin
        r1_rdes21 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes22 <= 32'h0;
    end
    else if(r1_rdes22_wr) begin
        r1_rdes22 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes23 <= 32'h0;
    end
    else if(r1_rdes23_wr) begin
        r1_rdes23 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes30 <= 32'h0;
    end
    else if(r1_rdes30_wr) begin
        r1_rdes30 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes31 <= 32'h0;
    end
    else if(r1_rdes31_wr) begin
        r1_rdes31 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes32 <= 32'h0;
    end
    else if(r1_rdes32_wr) begin
        r1_rdes32 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_rdes33 <= 32'h0;
    end
    else if(r1_rdes33_wr) begin
        r1_rdes33 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_sa_macaddrl <= 32'h0;
    end
    else if(r1_pe_ctrl0_wr) begin
        r1_sa_macaddrl <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_sa_macaddrh <= 16'h0;
    end
    else if(r1_pe_ctrl1_wr) begin
        r1_sa_macaddrh <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_arp_offload <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_arp_offload <= pwdata[31];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_sa_ctrl <= 2'h0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_sa_ctrl <= pwdata[30:29];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_sa_filter <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_sa_filter <= pwdata[28];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_ipc_filter <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_ipc_filter <= pwdata[27];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_db_filter <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_db_filter <= pwdata[25];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_2kp_en <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_2kp_en <= pwdata[22];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_cs_rm <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_cs_rm <= pwdata[21];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_pc_rm <= 1'b0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_pc_rm <= pwdata[20];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_fes <= 1'b1;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_fes <= pwdata[14];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_duplex <= 1'b1;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_duplex <= pwdata[13];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_crsfd <= 1'b1;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_crsfd <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_pre_byte <= 2'h0;
    end
    else if(r1_pe_ctrl2_wr) begin
        r1_pre_byte <= pwdata[3:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_interval_byte <= 6'h7;
    end
    else if(r1_pe_ctrl3_wr) begin
        r1_interval_byte <= pwdata[29:24];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int22_en <= 1'b0;
    end
    else if(r1_int2_en_wr) begin
        r1_int22_en <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int21_en <= 1'b0;
    end
    else if(r1_int2_en_wr) begin
        r1_int21_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int20_en <= 1'b0;
    end
    else if(r1_int2_en_wr) begin
        r1_int20_en <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int00_clr <= 1'b0;
    end
    else if(r1_int0_clr_wr) begin
        r1_int00_clr <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int10_clr <= 1'b0;
    end
    else if(r1_int1_clr_wr) begin
        r1_int10_clr <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int22_clr <= 1'b0;
    end
    else if(r1_int2_clr_wr) begin
        r1_int22_clr <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int21_clr <= 1'b0;
    end
    else if(r1_int2_clr_wr) begin
        r1_int21_clr <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r1_int20_clr <= 1'b0;
    end
    else if(r1_int2_clr_wr) begin
        r1_int20_clr <= pwdata[0];
    end
end
always@(*) begin
    case(paddr)
        32'h40020000 + 12'h00 : prdata = R0_TX_DATA;
        32'h40020000 + 12'h04 : prdata = R0_TOP_CTRL;
        32'h40020000 + 12'h08 : prdata = R0_PE_CTRL;
        32'h40020000 + 12'h0c : prdata = R0_INT_EN ;
        32'h40020000 + 12'h10 : prdata = R0_INT_CLR;
        32'h40020000 + 12'h14 : prdata = R0_FIFO_STA;
        32'h40020000 + 12'h18 : prdata = R0_INT_STA;
        32'h40020000 + 12'h1c : prdata = R0_RX_DATA;
        32'h40020000 + 12'h30 : prdata = R1_TOP_CTRL;
        32'h40020000 + 12'h34 : prdata = R1_DMA_CTRL0;
        32'h40020000 + 12'h40 : prdata = R1_DMA_TDES0;
        32'h40020000 + 12'h44 : prdata = R1_DMA_TDES1;
        32'h40020000 + 12'h48 : prdata = R1_DMA_TDES2;
        32'h40020000 + 12'h50 : prdata = R1_DMA_RDES0;
        32'h40020000 + 12'h54 : prdata = R1_DMA_RDES1;
        32'h40020000 + 12'h58 : prdata = R1_DMA_RDES2;
        32'h40020000 + 12'h80 : prdata = R1_TDES00 ;
        32'h40020000 + 12'h84 : prdata = R1_TDES01 ;
        32'h40020000 + 12'h88 : prdata = R1_TDES02 ;
        32'h40020000 + 12'h8c : prdata = R1_TDES03 ;
        32'h40020000 + 12'h90 : prdata = R1_TDES10 ;
        32'h40020000 + 12'h94 : prdata = R1_TDES11 ;
        32'h40020000 + 12'h98 : prdata = R1_TDES12 ;
        32'h40020000 + 12'h9c : prdata = R1_TDES13 ;
        32'h40020000 + 12'ha0 : prdata = R1_TDES20 ;
        32'h40020000 + 12'ha4 : prdata = R1_TDES21 ;
        32'h40020000 + 12'ha8 : prdata = R1_TDES22 ;
        32'h40020000 + 12'hac : prdata = R1_TDES23 ;
        32'h40020000 + 12'hb0 : prdata = R1_TDES30 ;
        32'h40020000 + 12'hb4 : prdata = R1_TDES31 ;
        32'h40020000 + 12'hb8 : prdata = R1_TDES32 ;
        32'h40020000 + 12'hbc : prdata = R1_TDES33 ;
        32'h40020000 + 12'hc0 : prdata = R1_RDES00 ;
        32'h40020000 + 12'hc4 : prdata = R1_RDES01 ;
        32'h40020000 + 12'hc8 : prdata = R1_RDES02 ;
        32'h40020000 + 12'hcc : prdata = R1_RDES03 ;
        32'h40020000 + 12'hd0 : prdata = R1_RDES10 ;
        32'h40020000 + 12'hd4 : prdata = R1_RDES11 ;
        32'h40020000 + 12'hd8 : prdata = R1_RDES12 ;
        32'h40020000 + 12'hdc : prdata = R1_RDES13 ;
        32'h40020000 + 12'he0 : prdata = R1_RDES20 ;
        32'h40020000 + 12'he4 : prdata = R1_RDES21 ;
        32'h40020000 + 12'he8 : prdata = R1_RDES22 ;
        32'h40020000 + 12'hec : prdata = R1_RDES23 ;
        32'h40020000 + 12'hf0 : prdata = R1_RDES30 ;
        32'h40020000 + 12'hf4 : prdata = R1_RDES31 ;
        32'h40020000 + 12'hf8 : prdata = R1_RDES32 ;
        32'h40020000 + 12'hfc : prdata = R1_RDES33 ;
        32'h40020000 + 12'h100 : prdata = R1_PE_CTRL0;
        32'h40020000 + 12'h104 : prdata = R1_PE_CTRL1;
        32'h40020000 + 12'h108 : prdata = R1_PE_CTRL2;
        32'h40020000 + 12'h10c : prdata = R1_PE_CTRL3;
        32'h40020000 + 12'h120 : prdata = R1_INT0_EN;
        32'h40020000 + 12'h124 : prdata = R1_INT1_EN;
        32'h40020000 + 12'h128 : prdata = R1_INT2_EN;
        32'h40020000 + 12'h130 : prdata = R1_INT0_CLR;
        32'h40020000 + 12'h134 : prdata = R1_INT1_CLR;
        32'h40020000 + 12'h138 : prdata = R1_INT2_CLR;
        32'h40020000 + 12'h140 : prdata = R1_INT0_STA;
        32'h40020000 + 12'h144 : prdata = R1_INT1_STA;
        32'h40020000 + 12'h148 : prdata = R1_INT2_STA;
        default:prdata = 32'b0;
    endcase
end
endmodule

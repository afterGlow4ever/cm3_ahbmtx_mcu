module spim_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,r_tx_data
            	,r_tx_data_wr
                ,r_tx_fifo_watermark
                ,r_rx_fifo_watermark
                ,r_tx_fifo_clr
                ,r_rx_fifo_clr
                ,r_trans_logic_clr
                ,r_trans_enable
                ,r_update
                ,r_clkdiv
                ,r_mode
                ,r_tm
                ,r_fm_en
                ,r_txm
                ,r_rxm
                ,r_tls
                ,r_tle
                ,r_ti
                ,r_rx_msblsb
                ,r_tx_msblsb
                ,r_pause_continue
                ,r_pause_enable
                ,r_tx_num
                ,r_trans_num
                ,r_int5_en
                ,r_int4_en
                ,r_int3_en
                ,r_int2_en
                ,r_int1_en
                ,r_int0_en
                ,r_int5_clr
                ,r_int4_clr
                ,r_int3_clr
                ,r_int2_clr
                ,r_int1_clr
                ,r_int0_clr
                ,r_tx_fifo_num
                ,r_rx_fifo_num
                ,r_int5_sta
                ,r_int4_sta
                ,r_int3_sta
                ,r_int2_sta
                ,r_int1_sta
                ,r_int0_sta
                ,r_rx_data
				,r_rx_data_rd
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output [7:0]    r_tx_data;
output          r_tx_data_wr;
output [4:0]    r_tx_fifo_watermark;
output [4:0]    r_rx_fifo_watermark;
output          r_tx_fifo_clr;
output          r_rx_fifo_clr;
output          r_trans_logic_clr;
output          r_trans_enable;
output          r_update;
output [7:0]    r_clkdiv;
output [1:0]    r_mode;
output          r_tm;
output          r_fm_en;
output          r_txm;
output          r_rxm;
output [3:0]    r_tls;
output [3:0]    r_tle;
output [3:0]    r_ti;
output          r_rx_msblsb;
output          r_tx_msblsb;
output          r_pause_continue;
output          r_pause_enable;
output [7:0]    r_tx_num;
output [7:0]    r_trans_num;
output          r_int5_en;
output          r_int4_en;
output          r_int3_en;
output          r_int2_en;
output          r_int1_en;
output          r_int0_en;
output          r_int5_clr;
output          r_int4_clr;
output          r_int3_clr;
output          r_int2_clr;
output          r_int1_clr;
output          r_int0_clr;
input  [4:0]    r_tx_fifo_num;
input  [4:0]    r_rx_fifo_num;
input           r_int5_sta;
input           r_int4_sta;
input           r_int3_sta;
input           r_int2_sta;
input           r_int1_sta;
input           r_int0_sta;
input  [7:0]    r_rx_data;
output			r_rx_data_rd;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg  [7:0]      r_tx_data;
reg  [4:0]      r_tx_fifo_watermark;
reg  [4:0]      r_rx_fifo_watermark;
reg             r_tx_fifo_clr;
reg             r_rx_fifo_clr;
reg             r_trans_logic_clr;
reg             r_trans_enable;
reg             r_update;
reg  [7:0]      r_clkdiv;
reg  [1:0]      r_mode;
reg             r_tm;
reg             r_fm_en;
reg             r_txm;
reg             r_rxm;
reg  [3:0]      r_tls;
reg  [3:0]      r_tle;
reg  [3:0]      r_ti;
reg             r_rx_msblsb;
reg             r_tx_msblsb;
reg             r_pause_continue;
reg             r_pause_enable;
reg  [7:0]      r_tx_num;
reg  [7:0]      r_trans_num;
reg             r_int5_en;
reg             r_int4_en;
reg             r_int3_en;
reg             r_int2_en;
reg             r_int1_en;
reg             r_int0_en;
reg             r_int5_clr;
reg             r_int4_clr;
reg             r_int3_clr;
reg             r_int2_clr;
reg             r_int1_clr;
reg             r_int0_clr;
wire [4:0]      r_tx_fifo_num;
wire [4:0]      r_rx_fifo_num;
wire            r_int5_sta;
wire            r_int4_sta;
wire            r_int3_sta;
wire            r_int2_sta;
wire            r_int1_sta;
wire            r_int0_sta;
wire [7:0]      r_rx_data;
wire [31:0]     R_TX_DATA;
wire [31:0]     R_TOP_CTRL;
wire [31:0]     R_PE_CTRL0;
wire [31:0]     R_PE_CTRL1;
wire [31:0]     R_TRANS_CTRL;
wire [31:0]     R_INT_EN;
wire [31:0]     R_INT_CLR;
wire [31:0]     R_FIFO_STA;
wire [31:0]     R_INT_STA;
wire [31:0]     R_RX_DATA;
wire            r_tx_data_wr;
wire            r_tx_data_rd;
wire            r_top_ctrl_wr;
wire            r_top_ctrl_rd;
wire            r_pe_ctrl0_wr;
wire            r_pe_ctrl0_rd;
wire            r_pe_ctrl1_wr;
wire            r_pe_ctrl1_rd;
wire            r_trans_ctrl_wr;
wire            r_trans_ctrl_rd;
wire            r_int_en_wr;
wire            r_int_en_rd;
wire            r_int_clr_wr;
wire            r_int_clr_rd;
wire            r_fifo_sta_wr;
wire            r_fifo_sta_rd;
wire            r_int_sta_wr;
wire            r_int_sta_rd;
wire            r_rx_data_wr;
wire            r_rx_data_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r_tx_data_wr = (paddr == 32'h40022000 + 8'h00) & reg_wr;
assign r_tx_data_rd = (paddr == 32'h40022000 + 8'h00) & reg_rd;
assign r_top_ctrl_wr = (paddr == 32'h40022000 + 8'h04) & reg_wr;
assign r_top_ctrl_rd = (paddr == 32'h40022000 + 8'h04) & reg_rd;
assign r_pe_ctrl0_wr = (paddr == 32'h40022000 + 8'h08) & reg_wr;
assign r_pe_ctrl0_rd = (paddr == 32'h40022000 + 8'h08) & reg_rd;
assign r_pe_ctrl1_wr = (paddr == 32'h40022000 + 8'h0c) & reg_wr;
assign r_pe_ctrl1_rd = (paddr == 32'h40022000 + 8'h0c) & reg_rd;
assign r_trans_ctrl_wr = (paddr == 32'h40022000 + 8'h10) & reg_wr;
assign r_trans_ctrl_rd = (paddr == 32'h40022000 + 8'h10) & reg_rd;
assign r_int_en_wr = (paddr == 32'h40022000 + 8'h14) & reg_wr;
assign r_int_en_rd = (paddr == 32'h40022000 + 8'h14) & reg_rd;
assign r_int_clr_wr = (paddr == 32'h40022000 + 8'h18) & reg_wr;
assign r_int_clr_rd = (paddr == 32'h40022000 + 8'h18) & reg_rd;
assign r_fifo_sta_wr = (paddr == 32'h40022000 + 8'h1c) & reg_wr;
assign r_fifo_sta_rd = (paddr == 32'h40022000 + 8'h1c) & reg_rd;
assign r_int_sta_wr = (paddr == 32'h40022000 + 8'h20) & reg_wr;
assign r_int_sta_rd = (paddr == 32'h40022000 + 8'h20) & reg_rd;
assign r_rx_data_wr = (paddr == 32'h40022000 + 8'h24) & reg_wr;
assign r_rx_data_rd = (paddr == 32'h40022000 + 8'h24) & reg_rd;
assign R_TX_DATA[31:8] = 24'h0;
assign R_TX_DATA[7:0] = 8'h0;
assign R_TOP_CTRL[31:29] = 3'h0;
assign R_TOP_CTRL[28:24] = r_tx_fifo_watermark;
assign R_TOP_CTRL[23:21] = 3'h0;
assign R_TOP_CTRL[20:16] = r_rx_fifo_watermark;
assign R_TOP_CTRL[15:12] = 4'h0;
assign R_TOP_CTRL[11] = r_tx_fifo_clr;
assign R_TOP_CTRL[10] = r_rx_fifo_clr;
assign R_TOP_CTRL[9] = 1'b0;
assign R_TOP_CTRL[8] = r_trans_logic_clr;
assign R_TOP_CTRL[7:2] = 6'h0;
assign R_TOP_CTRL[1] = r_trans_enable;
assign R_TOP_CTRL[0] = r_update;
assign R_PE_CTRL0[31:24] = r_clkdiv;
assign R_PE_CTRL0[23:22] = r_mode;
assign R_PE_CTRL0[21] = r_tm;
assign R_PE_CTRL0[20] = r_fm_en;
assign R_PE_CTRL0[19] = r_txm;
assign R_PE_CTRL0[18] = r_rxm;
assign R_PE_CTRL0[17:0] = 18'h0;
assign R_PE_CTRL1[31:12] = 20'h0;
assign R_PE_CTRL1[11:8] = r_tls;
assign R_PE_CTRL1[7:4] = r_tle;
assign R_PE_CTRL1[3:0] = r_ti;
assign R_TRANS_CTRL[31:20] = 12'h0;
assign R_TRANS_CTRL[19] = r_rx_msblsb;
assign R_TRANS_CTRL[18] = r_tx_msblsb;
assign R_TRANS_CTRL[17] = r_pause_continue;
assign R_TRANS_CTRL[16] = r_pause_enable;
assign R_TRANS_CTRL[15:8] = r_tx_num;
assign R_TRANS_CTRL[7:0] = r_trans_num;
assign R_INT_EN[31:6] = 26'h0;
assign R_INT_EN[5] = r_int5_en;
assign R_INT_EN[4] = r_int4_en;
assign R_INT_EN[3] = r_int3_en;
assign R_INT_EN[2] = r_int2_en;
assign R_INT_EN[1] = r_int1_en;
assign R_INT_EN[0] = r_int0_en;
assign R_INT_CLR[31:6] = 26'h0;
assign R_INT_CLR[5] = r_int5_clr;
assign R_INT_CLR[4] = r_int4_clr;
assign R_INT_CLR[3] = r_int3_clr;
assign R_INT_CLR[2] = r_int2_clr;
assign R_INT_CLR[1] = r_int1_clr;
assign R_INT_CLR[0] = r_int0_clr;
assign R_FIFO_STA[31:13] = 19'h0;
assign R_FIFO_STA[12:8] = r_tx_fifo_num;
assign R_FIFO_STA[7:5] = 3'h0;
assign R_FIFO_STA[4:0] = r_rx_fifo_num;
assign R_INT_STA[31:6] = 26'h0;
assign R_INT_STA[5] = r_int5_sta;
assign R_INT_STA[4] = r_int4_sta;
assign R_INT_STA[3] = r_int3_sta;
assign R_INT_STA[2] = r_int2_sta;
assign R_INT_STA[1] = r_int1_sta;
assign R_INT_STA[0] = r_int0_sta;
assign R_RX_DATA[31:8] = 24'h0;
assign R_RX_DATA[7:0] = r_rx_data;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_data <= 8'h0;
    end
    else if(r_tx_data_wr) begin
        r_tx_data <= pwdata[7:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_fifo_watermark <= 5'h8;
    end
    else if(r_top_ctrl_wr) begin
        r_tx_fifo_watermark <= pwdata[28:24];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_fifo_watermark <= 5'h8;
    end
    else if(r_top_ctrl_wr) begin
        r_rx_fifo_watermark <= pwdata[20:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_fifo_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_tx_fifo_clr <= pwdata[11];
    end
    else begin
        r_tx_fifo_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_fifo_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_rx_fifo_clr <= pwdata[10];
    end
    else begin
        r_rx_fifo_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_trans_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_trans_logic_clr <= pwdata[8];
    end
    else begin
        r_trans_logic_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_trans_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_trans_enable <= pwdata[1];
    end
    else begin
        r_trans_enable <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_update <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_update <= pwdata[0];
    end
    else begin
        r_update <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_clkdiv <= 8'h1;
    end
    else if(r_pe_ctrl0_wr) begin
        r_clkdiv <= pwdata[31:24];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_mode <= 2'h0;
    end
    else if(r_pe_ctrl0_wr) begin
        r_mode <= pwdata[23:22];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tm <= 1'b0;
    end
    else if(r_pe_ctrl0_wr) begin
        r_tm <= pwdata[21];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_fm_en <= 1'b0;
    end
    else if(r_pe_ctrl0_wr) begin
        r_fm_en <= pwdata[20];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_txm <= 1'b0;
    end
    else if(r_pe_ctrl0_wr) begin
        r_txm <= pwdata[19];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rxm <= 1'b0;
    end
    else if(r_pe_ctrl0_wr) begin
        r_rxm <= pwdata[18];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tls <= 4'h0;
    end
    else if(r_pe_ctrl1_wr) begin
        r_tls <= pwdata[11:8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tle <= 4'h0;
    end
    else if(r_pe_ctrl1_wr) begin
        r_tle <= pwdata[7:4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ti <= 4'h0;
    end
    else if(r_pe_ctrl1_wr) begin
        r_ti <= pwdata[3:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_msblsb <= 1'b0;
    end
    else if(r_trans_ctrl_wr) begin
        r_rx_msblsb <= pwdata[19];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_msblsb <= 1'b0;
    end
    else if(r_trans_ctrl_wr) begin
        r_tx_msblsb <= pwdata[18];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_pause_continue <= 1'b0;
    end
    else if(r_trans_ctrl_wr) begin
        r_pause_continue <= pwdata[17];
    end
    else begin
        r_pause_continue <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_pause_enable <= 1'b0;
    end
    else if(r_trans_ctrl_wr) begin
        r_pause_enable <= pwdata[16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_num <= 8'h0;
    end
    else if(r_trans_ctrl_wr) begin
        r_tx_num <= pwdata[15:8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_trans_num <= 8'h0;
    end
    else if(r_trans_ctrl_wr) begin
        r_trans_num <= pwdata[7:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int5_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int5_en <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int4_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int4_en <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int3_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int3_en <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int2_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int2_en <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int1_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int1_en <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int0_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int0_en <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int5_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int5_clr <= pwdata[5];
    end
    else begin
        r_int5_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int4_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int4_clr <= pwdata[4];
    end
    else begin
        r_int4_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int3_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int3_clr <= pwdata[3];
    end
    else begin
        r_int3_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int2_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int2_clr <= pwdata[2];
    end
    else begin
        r_int2_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int1_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int1_clr <= pwdata[1];
    end
    else begin
        r_int1_clr <= 1'b0;
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int0_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int0_clr <= pwdata[0];
    end
    else begin
        r_int0_clr <= 1'b0;
    end
end
always@(*) begin
    case(paddr)
        32'h40022000 + 8'h00 : prdata = R_TX_DATA ;
        32'h40022000 + 8'h04 : prdata = R_TOP_CTRL;
        32'h40022000 + 8'h08 : prdata = R_PE_CTRL0;
        32'h40022000 + 8'h0c : prdata = R_PE_CTRL1;
        32'h40022000 + 8'h10 : prdata = R_TRANS_CTRL;
        32'h40022000 + 8'h14 : prdata = R_INT_EN  ;
        32'h40022000 + 8'h18 : prdata = R_INT_CLR ;
        32'h40022000 + 8'h1c : prdata = R_FIFO_STA;
        32'h40022000 + 8'h20 : prdata = R_INT_STA ;
        32'h40022000 + 8'h24 : prdata = R_RX_DATA ;
        default:prdata = 32'b0;
    endcase
end
endmodule

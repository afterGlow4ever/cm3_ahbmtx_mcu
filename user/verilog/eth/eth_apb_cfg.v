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
wire [31:0]     R0_TX_DATA;
wire [31:0]     R0_TOP_CTRL;
wire [31:0]     R0_PE_CTRL;
wire [31:0]     R0_INT_EN;
wire [31:0]     R0_INT_CLR;
wire [31:0]     R0_FIFO_STA;
wire [31:0]     R0_INT_STA;
wire [31:0]     R0_RX_DATA;
wire            r0_tx_data_wr;
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
wire            r0_rx_data_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r0_tx_data_wr = (paddr == 32'h40020000 + 8'h00) & reg_wr;
assign r0_tx_data_rd = (paddr == 32'h40020000 + 8'h00) & reg_rd;
assign r0_top_ctrl_wr = (paddr == 32'h40020000 + 8'h04) & reg_wr;
assign r0_top_ctrl_rd = (paddr == 32'h40020000 + 8'h04) & reg_rd;
assign r0_pe_ctrl_wr = (paddr == 32'h40020000 + 8'h08) & reg_wr;
assign r0_pe_ctrl_rd = (paddr == 32'h40020000 + 8'h08) & reg_rd;
assign r0_int_en_wr = (paddr == 32'h40020000 + 8'h0c) & reg_wr;
assign r0_int_en_rd = (paddr == 32'h40020000 + 8'h0c) & reg_rd;
assign r0_int_clr_wr = (paddr == 32'h40020000 + 8'h10) & reg_wr;
assign r0_int_clr_rd = (paddr == 32'h40020000 + 8'h10) & reg_rd;
assign r0_fifo_sta_wr = (paddr == 32'h40020000 + 8'h14) & reg_wr;
assign r0_fifo_sta_rd = (paddr == 32'h40020000 + 8'h14) & reg_rd;
assign r0_int_sta_wr = (paddr == 32'h40020000 + 8'h18) & reg_wr;
assign r0_int_sta_rd = (paddr == 32'h40020000 + 8'h18) & reg_rd;
assign r0_rx_data_wr = (paddr == 32'h40020000 + 8'h1c) & reg_wr;
assign r0_rx_data_rd = (paddr == 32'h40020000 + 8'h1c) & reg_rd;
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
always@(*) begin
    case(paddr)
        32'h40020000 + 8'h00 : prdata = R0_TX_DATA;
        32'h40020000 + 8'h04 : prdata = R0_TOP_CTRL;
        32'h40020000 + 8'h08 : prdata = R0_PE_CTRL;
        32'h40020000 + 8'h0c : prdata = R0_INT_EN ;
        32'h40020000 + 8'h10 : prdata = R0_INT_CLR;
        32'h40020000 + 8'h14 : prdata = R0_FIFO_STA;
        32'h40020000 + 8'h18 : prdata = R0_INT_STA;
        32'h40020000 + 8'h1c : prdata = R0_RX_DATA;
        default:prdata = 32'b0;
    endcase
end
endmodule

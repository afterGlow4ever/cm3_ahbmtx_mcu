module uart_apb_cfg (
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
                ,r_tx_logic_clr
                ,r_rx_logic_clr
                ,r_rx_enable
                ,r_update
                ,r_clkdiv
                ,r_oversampling
                ,r_interval_bit
                ,r_error_ignore
                ,r_rts
                ,r_cts
                ,r_stop_bit
                ,r_parity_en
                ,r_parity
                ,r_data_bit
                ,r_int8_en
                ,r_int7_en
                ,r_int6_en
                ,r_int5_en
                ,r_int4_en
                ,r_int3_en
                ,r_int2_en
                ,r_int1_en
                ,r_int0_en
                ,r_int8_clr
                ,r_int7_clr
                ,r_int6_clr
                ,r_int5_clr
                ,r_int4_clr
                ,r_int3_clr
                ,r_int2_clr
                ,r_int1_clr
                ,r_int0_clr
                ,r_tx_fifo_num
                ,r_rx_fifo_num
                ,r_int8_sta
                ,r_int7_sta
                ,r_int6_sta
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
output [9:0]    r_tx_data;
output          r_tx_data_wr;
output [4:0]    r_tx_fifo_watermark;
output [4:0]    r_rx_fifo_watermark;
output          r_tx_fifo_clr;
output          r_rx_fifo_clr;
output          r_tx_logic_clr;
output          r_rx_logic_clr;
output          r_rx_enable;
output          r_update;
output [11:0]   r_clkdiv;
output [3:0]    r_oversampling;
output [3:0]    r_interval_bit;
output          r_error_ignore;
output          r_rts;
output          r_cts;
output          r_stop_bit;
output          r_parity_en;
output [1:0]    r_parity;
output [1:0]    r_data_bit;
output          r_int8_en;
output          r_int7_en;
output          r_int6_en;
output          r_int5_en;
output          r_int4_en;
output          r_int3_en;
output          r_int2_en;
output          r_int1_en;
output          r_int0_en;
output          r_int8_clr;
output          r_int7_clr;
output          r_int6_clr;
output          r_int5_clr;
output          r_int4_clr;
output          r_int3_clr;
output          r_int2_clr;
output          r_int1_clr;
output          r_int0_clr;
input  [4:0]    r_tx_fifo_num;
input  [4:0]    r_rx_fifo_num;
input           r_int8_sta;
input           r_int7_sta;
input           r_int6_sta;
input           r_int5_sta;
input           r_int4_sta;
input           r_int3_sta;
input           r_int2_sta;
input           r_int1_sta;
input           r_int0_sta;
input  [9:0]    r_rx_data;
output			r_rx_data_rd;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg  [9:0]      r_tx_data;
reg  [4:0]      r_tx_fifo_watermark;
reg  [4:0]      r_rx_fifo_watermark;
reg             r_tx_fifo_clr;
reg             r_rx_fifo_clr;
reg             r_tx_logic_clr;
reg             r_rx_logic_clr;
reg             r_rx_enable;
reg             r_update;
reg  [11:0]     r_clkdiv;
reg  [3:0]      r_oversampling;
reg  [3:0]      r_interval_bit;
reg             r_error_ignore;
reg             r_rts;
reg             r_cts;
reg             r_stop_bit;
reg             r_parity_en;
reg  [1:0]      r_parity;
reg  [1:0]      r_data_bit;
reg             r_int8_en;
reg             r_int7_en;
reg             r_int6_en;
reg             r_int5_en;
reg             r_int4_en;
reg             r_int3_en;
reg             r_int2_en;
reg             r_int1_en;
reg             r_int0_en;
reg             r_int8_clr;
reg             r_int7_clr;
reg             r_int6_clr;
reg             r_int5_clr;
reg             r_int4_clr;
reg             r_int3_clr;
reg             r_int2_clr;
reg             r_int1_clr;
reg             r_int0_clr;
wire [4:0]      r_tx_fifo_num;
wire [4:0]      r_rx_fifo_num;
wire            r_int8_sta;
wire            r_int7_sta;
wire            r_int6_sta;
wire            r_int5_sta;
wire            r_int4_sta;
wire            r_int3_sta;
wire            r_int2_sta;
wire            r_int1_sta;
wire            r_int0_sta;
wire [9:0]      r_rx_data;
wire [31:0]     R_TX_DATA;
wire [31:0]     R_TOP_CTRL;
wire [31:0]     R_PE_CTRL;
wire [31:0]     R_INT_EN;
wire [31:0]     R_INT_CLR;
wire [31:0]     R_FIFO_STA;
wire [31:0]     R_INT_STA;
wire [31:0]     R_RX_DATA;
wire            r_tx_data_wr;
wire            r_tx_data_rd;
wire            r_top_ctrl_wr;
wire            r_top_ctrl_rd;
wire            r_pe_ctrl_wr;
wire            r_pe_ctrl_rd;
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
assign r_tx_data_wr = (paddr == 32'h40001000 + 8'h00) & reg_wr;
assign r_tx_data_rd = (paddr == 32'h40001000 + 8'h00) & reg_rd;
assign r_top_ctrl_wr = (paddr == 32'h40001000 + 8'h04) & reg_wr;
assign r_top_ctrl_rd = (paddr == 32'h40001000 + 8'h04) & reg_rd;
assign r_pe_ctrl_wr = (paddr == 32'h40001000 + 8'h08) & reg_wr;
assign r_pe_ctrl_rd = (paddr == 32'h40001000 + 8'h08) & reg_rd;
assign r_int_en_wr = (paddr == 32'h40001000 + 8'h0c) & reg_wr;
assign r_int_en_rd = (paddr == 32'h40001000 + 8'h0c) & reg_rd;
assign r_int_clr_wr = (paddr == 32'h40001000 + 8'h10) & reg_wr;
assign r_int_clr_rd = (paddr == 32'h40001000 + 8'h10) & reg_rd;
assign r_fifo_sta_wr = (paddr == 32'h40001000 + 8'h14) & reg_wr;
assign r_fifo_sta_rd = (paddr == 32'h40001000 + 8'h14) & reg_rd;
assign r_int_sta_wr = (paddr == 32'h40001000 + 8'h18) & reg_wr;
assign r_int_sta_rd = (paddr == 32'h40001000 + 8'h18) & reg_rd;
assign r_rx_data_wr = (paddr == 32'h40001000 + 8'h1c) & reg_wr;
assign r_rx_data_rd = (paddr == 32'h40001000 + 8'h1c) & reg_rd;
assign R_TX_DATA[31:10] = 22'h0;
assign R_TX_DATA[9:0] = 10'h0;
assign R_TOP_CTRL[31:29] = 3'h0;
assign R_TOP_CTRL[28:24] = r_tx_fifo_watermark;
assign R_TOP_CTRL[23:21] = 3'h0;
assign R_TOP_CTRL[20:16] = r_rx_fifo_watermark;
assign R_TOP_CTRL[15:12] = 4'h0;
assign R_TOP_CTRL[11] = r_tx_fifo_clr;
assign R_TOP_CTRL[10] = r_rx_fifo_clr;
assign R_TOP_CTRL[9] = r_tx_logic_clr;
assign R_TOP_CTRL[8] = r_rx_logic_clr;
assign R_TOP_CTRL[7:2] = 6'h0;
assign R_TOP_CTRL[1] = r_rx_enable;
assign R_TOP_CTRL[0] = r_update;
assign R_PE_CTRL[31:20] = r_clkdiv;
assign R_PE_CTRL[19:16] = r_oversampling;
assign R_PE_CTRL[15:12] = r_interval_bit;
assign R_PE_CTRL[11] = r_error_ignore;
assign R_PE_CTRL[10:8] = 3'h0;
assign R_PE_CTRL[7] = r_rts;
assign R_PE_CTRL[6] = r_cts;
assign R_PE_CTRL[5] = r_stop_bit;
assign R_PE_CTRL[4] = r_parity_en;
assign R_PE_CTRL[3:2] = r_parity;
assign R_PE_CTRL[1:0] = r_data_bit;
assign R_INT_EN[31:9] = 23'h0;
assign R_INT_EN[8] = r_int8_en;
assign R_INT_EN[7] = r_int7_en;
assign R_INT_EN[6] = r_int6_en;
assign R_INT_EN[5] = r_int5_en;
assign R_INT_EN[4] = r_int4_en;
assign R_INT_EN[3] = r_int3_en;
assign R_INT_EN[2] = r_int2_en;
assign R_INT_EN[1] = r_int1_en;
assign R_INT_EN[0] = r_int0_en;
assign R_INT_CLR[31:9] = 23'h0;
assign R_INT_CLR[8] = r_int8_clr;
assign R_INT_CLR[7] = r_int7_clr;
assign R_INT_CLR[6] = r_int6_clr;
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
assign R_INT_STA[31:9] = 23'h0;
assign R_INT_STA[8] = r_int8_sta;
assign R_INT_STA[7] = r_int7_sta;
assign R_INT_STA[6] = r_int6_sta;
assign R_INT_STA[5] = r_int5_sta;
assign R_INT_STA[4] = r_int4_sta;
assign R_INT_STA[3] = r_int3_sta;
assign R_INT_STA[2] = r_int2_sta;
assign R_INT_STA[1] = r_int1_sta;
assign R_INT_STA[0] = r_int0_sta;
assign R_RX_DATA[31:10] = 22'h0;
assign R_RX_DATA[9:0] = r_rx_data;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_data <= 10'h0;
    end
    else if(r_tx_data_wr) begin
        r_tx_data <= pwdata[9:0];
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
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_fifo_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_rx_fifo_clr <= pwdata[10];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_tx_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_tx_logic_clr <= pwdata[9];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_logic_clr <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_rx_logic_clr <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rx_enable <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_rx_enable <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_update <= 1'b0;
    end
    else if(r_top_ctrl_wr) begin
        r_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_clkdiv <= 12'h16;
    end
    else if(r_pe_ctrl_wr) begin
        r_clkdiv <= pwdata[31:20];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_oversampling <= 4'hf;
    end
    else if(r_pe_ctrl_wr) begin
        r_oversampling <= pwdata[19:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_interval_bit <= 4'h0;
    end
    else if(r_pe_ctrl_wr) begin
        r_interval_bit <= pwdata[15:12];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_error_ignore <= 1'b0;
    end
    else if(r_pe_ctrl_wr) begin
        r_error_ignore <= pwdata[11];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_rts <= 1'b0;
    end
    else if(r_pe_ctrl_wr) begin
        r_rts <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_cts <= 1'b0;
    end
    else if(r_pe_ctrl_wr) begin
        r_cts <= pwdata[6];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_stop_bit <= 1'b0;
    end
    else if(r_pe_ctrl_wr) begin
        r_stop_bit <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_parity_en <= 1'b0;
    end
    else if(r_pe_ctrl_wr) begin
        r_parity_en <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_parity <= 2'h0;
    end
    else if(r_pe_ctrl_wr) begin
        r_parity <= pwdata[3:2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_data_bit <= 2'h1;
    end
    else if(r_pe_ctrl_wr) begin
        r_data_bit <= pwdata[1:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int8_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int8_en <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int7_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int7_en <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int6_en <= 1'b0;
    end
    else if(r_int_en_wr) begin
        r_int6_en <= pwdata[6];
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
        r_int8_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int8_clr <= pwdata[8];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int7_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int7_clr <= pwdata[7];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int6_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int6_clr <= pwdata[6];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int5_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int5_clr <= pwdata[5];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int4_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int4_clr <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int3_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int3_clr <= pwdata[3];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int2_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int2_clr <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int1_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int1_clr <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_int0_clr <= 1'b0;
    end
    else if(r_int_clr_wr) begin
        r_int0_clr <= pwdata[0];
    end
end
always@(*) begin
    case(paddr)
        32'h40001000 + 8'h00 : prdata = R_TX_DATA ;
        32'h40001000 + 8'h04 : prdata = R_TOP_CTRL;
        32'h40001000 + 8'h08 : prdata = R_PE_CTRL ;
        32'h40001000 + 8'h0c : prdata = R_INT_EN  ;
        32'h40001000 + 8'h10 : prdata = R_INT_CLR ;
        32'h40001000 + 8'h14 : prdata = R_FIFO_STA;
        32'h40001000 + 8'h18 : prdata = R_INT_STA ;
        32'h40001000 + 8'h1c : prdata = R_RX_DATA ;
        default:prdata = 32'b0;
    endcase
end
endmodule

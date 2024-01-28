module bastim_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,r_ch0_auto_reload
                ,r_ch0_tim_enable
                ,r_ch0_update
                ,r_ch0_psc
                ,r_ch0_arr
                ,r_ch0_startcnt
                ,r_ch1_auto_reload
                ,r_ch1_tim_enable
                ,r_ch1_update
                ,r_ch1_psc
                ,r_ch1_arr
                ,r_ch1_startcnt
                ,r_ch2_auto_reload
                ,r_ch2_tim_enable
                ,r_ch2_update
                ,r_ch2_psc
                ,r_ch2_arr
                ,r_ch2_startcnt
                ,r_ch3_auto_reload
                ,r_ch3_tim_enable
                ,r_ch3_update
                ,r_ch3_psc
                ,r_ch3_arr
                ,r_ch3_startcnt
                ,r_int3_en
                ,r_int2_en
                ,r_int1_en
                ,r_int0_en
                ,r_int3_clr
                ,r_int2_clr
                ,r_int1_clr
                ,r_int0_clr
                ,r_int3_sta
                ,r_int2_sta
                ,r_int1_sta
                ,r_int0_sta
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output          r_ch0_auto_reload;
output          r_ch0_tim_enable;
output          r_ch0_update;
output [15:0]   r_ch0_psc;
output [15:0]   r_ch0_arr;
output [15:0]   r_ch0_startcnt;
output          r_ch1_auto_reload;
output          r_ch1_tim_enable;
output          r_ch1_update;
output [15:0]   r_ch1_psc;
output [15:0]   r_ch1_arr;
output [15:0]   r_ch1_startcnt;
output          r_ch2_auto_reload;
output          r_ch2_tim_enable;
output          r_ch2_update;
output [15:0]   r_ch2_psc;
output [15:0]   r_ch2_arr;
output [15:0]   r_ch2_startcnt;
output          r_ch3_auto_reload;
output          r_ch3_tim_enable;
output          r_ch3_update;
output [15:0]   r_ch3_psc;
output [15:0]   r_ch3_arr;
output [15:0]   r_ch3_startcnt;
output          r_int3_en;
output          r_int2_en;
output          r_int1_en;
output          r_int0_en;
output          r_int3_clr;
output          r_int2_clr;
output          r_int1_clr;
output          r_int0_clr;
input           r_int3_sta;
input           r_int2_sta;
input           r_int1_sta;
input           r_int0_sta;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg             r_ch0_auto_reload;
reg             r_ch0_tim_enable;
reg             r_ch0_update;
reg  [15:0]     r_ch0_psc;
reg  [15:0]     r_ch0_arr;
reg  [15:0]     r_ch0_startcnt;
reg             r_ch1_auto_reload;
reg             r_ch1_tim_enable;
reg             r_ch1_update;
reg  [15:0]     r_ch1_psc;
reg  [15:0]     r_ch1_arr;
reg  [15:0]     r_ch1_startcnt;
reg             r_ch2_auto_reload;
reg             r_ch2_tim_enable;
reg             r_ch2_update;
reg  [15:0]     r_ch2_psc;
reg  [15:0]     r_ch2_arr;
reg  [15:0]     r_ch2_startcnt;
reg             r_ch3_auto_reload;
reg             r_ch3_tim_enable;
reg             r_ch3_update;
reg  [15:0]     r_ch3_psc;
reg  [15:0]     r_ch3_arr;
reg  [15:0]     r_ch3_startcnt;
reg             r_int3_en;
reg             r_int2_en;
reg             r_int1_en;
reg             r_int0_en;
reg             r_int3_clr;
reg             r_int2_clr;
reg             r_int1_clr;
reg             r_int0_clr;
wire            r_int3_sta;
wire            r_int2_sta;
wire            r_int1_sta;
wire            r_int0_sta;
wire [31:0]     R_TOP0_CTRL;
wire [31:0]     R_PE0_CTRL;
wire [31:0]     R_PE0_CTRL1;
wire [31:0]     R_RSV0;
wire [31:0]     R_TOP1_CTRL;
wire [31:0]     R_PE1_CTRL;
wire [31:0]     R_PE1_CTRL1;
wire [31:0]     R_RSV1;
wire [31:0]     R_TOP2_CTRL;
wire [31:0]     R_PE2_CTRL;
wire [31:0]     R_PE2_CTRL1;
wire [31:0]     R_RSV2;
wire [31:0]     R_TOP3_CTRL;
wire [31:0]     R_PE3_CTRL;
wire [31:0]     R_PE3_CTRL1;
wire [31:0]     R_RSV3;
wire [31:0]     R_INT_EN;
wire [31:0]     R_INT_CLR;
wire [31:0]     R_INT_STA;
wire            r_top0_ctrl_wr;
wire            r_top0_ctrl_rd;
wire            r_pe0_ctrl_wr;
wire            r_pe0_ctrl_rd;
wire            r_pe0_ctrl1_wr;
wire            r_pe0_ctrl1_rd;
wire            r_rsv0_wr;
wire            r_rsv0_rd;
wire            r_top1_ctrl_wr;
wire            r_top1_ctrl_rd;
wire            r_pe1_ctrl_wr;
wire            r_pe1_ctrl_rd;
wire            r_pe1_ctrl1_wr;
wire            r_pe1_ctrl1_rd;
wire            r_rsv1_wr;
wire            r_rsv1_rd;
wire            r_top2_ctrl_wr;
wire            r_top2_ctrl_rd;
wire            r_pe2_ctrl_wr;
wire            r_pe2_ctrl_rd;
wire            r_pe2_ctrl1_wr;
wire            r_pe2_ctrl1_rd;
wire            r_rsv2_wr;
wire            r_rsv2_rd;
wire            r_top3_ctrl_wr;
wire            r_top3_ctrl_rd;
wire            r_pe3_ctrl_wr;
wire            r_pe3_ctrl_rd;
wire            r_pe3_ctrl1_wr;
wire            r_pe3_ctrl1_rd;
wire            r_rsv3_wr;
wire            r_rsv3_rd;
wire            r_int_en_wr;
wire            r_int_en_rd;
wire            r_int_clr_wr;
wire            r_int_clr_rd;
wire            r_int_sta_wr;
wire            r_int_sta_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r_top0_ctrl_wr = (paddr == 32'h40010000 + 8'h00) & reg_wr;
assign r_top0_ctrl_rd = (paddr == 32'h40010000 + 8'h00) & reg_rd;
assign r_pe0_ctrl_wr = (paddr == 32'h40010000 + 8'h04) & reg_wr;
assign r_pe0_ctrl_rd = (paddr == 32'h40010000 + 8'h04) & reg_rd;
assign r_pe0_ctrl1_wr = (paddr == 32'h40010000 + 8'h08) & reg_wr;
assign r_pe0_ctrl1_rd = (paddr == 32'h40010000 + 8'h08) & reg_rd;
assign r_rsv0_wr = (paddr == 32'h40010000 + 8'h0c) & reg_wr;
assign r_rsv0_rd = (paddr == 32'h40010000 + 8'h0c) & reg_rd;
assign r_top1_ctrl_wr = (paddr == 32'h40010000 + 8'h10) & reg_wr;
assign r_top1_ctrl_rd = (paddr == 32'h40010000 + 8'h10) & reg_rd;
assign r_pe1_ctrl_wr = (paddr == 32'h40010000 + 8'h14) & reg_wr;
assign r_pe1_ctrl_rd = (paddr == 32'h40010000 + 8'h14) & reg_rd;
assign r_pe1_ctrl1_wr = (paddr == 32'h40010000 + 8'h18) & reg_wr;
assign r_pe1_ctrl1_rd = (paddr == 32'h40010000 + 8'h18) & reg_rd;
assign r_rsv1_wr = (paddr == 32'h40010000 + 8'h1c) & reg_wr;
assign r_rsv1_rd = (paddr == 32'h40010000 + 8'h1c) & reg_rd;
assign r_top2_ctrl_wr = (paddr == 32'h40010000 + 8'h20) & reg_wr;
assign r_top2_ctrl_rd = (paddr == 32'h40010000 + 8'h20) & reg_rd;
assign r_pe2_ctrl_wr = (paddr == 32'h40010000 + 8'h24) & reg_wr;
assign r_pe2_ctrl_rd = (paddr == 32'h40010000 + 8'h24) & reg_rd;
assign r_pe2_ctrl1_wr = (paddr == 32'h40010000 + 8'h28) & reg_wr;
assign r_pe2_ctrl1_rd = (paddr == 32'h40010000 + 8'h28) & reg_rd;
assign r_rsv2_wr = (paddr == 32'h40010000 + 8'h2c) & reg_wr;
assign r_rsv2_rd = (paddr == 32'h40010000 + 8'h2c) & reg_rd;
assign r_top3_ctrl_wr = (paddr == 32'h40010000 + 8'h30) & reg_wr;
assign r_top3_ctrl_rd = (paddr == 32'h40010000 + 8'h30) & reg_rd;
assign r_pe3_ctrl_wr = (paddr == 32'h40010000 + 8'h34) & reg_wr;
assign r_pe3_ctrl_rd = (paddr == 32'h40010000 + 8'h34) & reg_rd;
assign r_pe3_ctrl1_wr = (paddr == 32'h40010000 + 8'h38) & reg_wr;
assign r_pe3_ctrl1_rd = (paddr == 32'h40010000 + 8'h38) & reg_rd;
assign r_rsv3_wr = (paddr == 32'h40010000 + 8'h3c) & reg_wr;
assign r_rsv3_rd = (paddr == 32'h40010000 + 8'h3c) & reg_rd;
assign r_int_en_wr = (paddr == 32'h40010000 + 8'h40) & reg_wr;
assign r_int_en_rd = (paddr == 32'h40010000 + 8'h40) & reg_rd;
assign r_int_clr_wr = (paddr == 32'h40010000 + 8'h44) & reg_wr;
assign r_int_clr_rd = (paddr == 32'h40010000 + 8'h44) & reg_rd;
assign r_int_sta_wr = (paddr == 32'h40010000 + 8'h48) & reg_wr;
assign r_int_sta_rd = (paddr == 32'h40010000 + 8'h48) & reg_rd;
assign R_TOP0_CTRL[31:3] = 29'h0;
assign R_TOP0_CTRL[2] = r_ch0_auto_reload;
assign R_TOP0_CTRL[1] = r_ch0_tim_enable;
assign R_TOP0_CTRL[0] = r_ch0_update;
assign R_PE0_CTRL[31:16] = r_ch0_psc;
assign R_PE0_CTRL[15:0] = r_ch0_arr;
assign R_PE0_CTRL1[31:16] = 16'h0;
assign R_PE0_CTRL1[15:0] = r_ch0_startcnt;
assign R_RSV0[31:0] = 32'h0;
assign R_TOP1_CTRL[31:3] = 29'h0;
assign R_TOP1_CTRL[2] = r_ch1_auto_reload;
assign R_TOP1_CTRL[1] = r_ch1_tim_enable;
assign R_TOP1_CTRL[0] = r_ch1_update;
assign R_PE1_CTRL[31:16] = r_ch1_psc;
assign R_PE1_CTRL[15:0] = r_ch1_arr;
assign R_PE1_CTRL1[31:16] = 16'h0;
assign R_PE1_CTRL1[15:0] = r_ch1_startcnt;
assign R_RSV1[31:0] = 32'h0;
assign R_TOP2_CTRL[31:3] = 29'h0;
assign R_TOP2_CTRL[2] = r_ch2_auto_reload;
assign R_TOP2_CTRL[1] = r_ch2_tim_enable;
assign R_TOP2_CTRL[0] = r_ch2_update;
assign R_PE2_CTRL[31:16] = r_ch2_psc;
assign R_PE2_CTRL[15:0] = r_ch2_arr;
assign R_PE2_CTRL1[31:16] = 16'h0;
assign R_PE2_CTRL1[15:0] = r_ch2_startcnt;
assign R_RSV2[31:0] = 32'h0;
assign R_TOP3_CTRL[31:3] = 29'h0;
assign R_TOP3_CTRL[2] = r_ch3_auto_reload;
assign R_TOP3_CTRL[1] = r_ch3_tim_enable;
assign R_TOP3_CTRL[0] = r_ch3_update;
assign R_PE3_CTRL[31:16] = r_ch3_psc;
assign R_PE3_CTRL[15:0] = r_ch3_arr;
assign R_PE3_CTRL1[31:16] = 16'h0;
assign R_PE3_CTRL1[15:0] = r_ch3_startcnt;
assign R_RSV3[31:0] = 32'h0;
assign R_INT_EN[31:4] = 28'h0;
assign R_INT_EN[3] = r_int3_en;
assign R_INT_EN[2] = r_int2_en;
assign R_INT_EN[1] = r_int1_en;
assign R_INT_EN[0] = r_int0_en;
assign R_INT_CLR[31:4] = 28'h0;
assign R_INT_CLR[3] = r_int3_clr;
assign R_INT_CLR[2] = r_int2_clr;
assign R_INT_CLR[1] = r_int1_clr;
assign R_INT_CLR[0] = r_int0_clr;
assign R_INT_STA[31:4] = 28'h0;
assign R_INT_STA[3] = r_int3_sta;
assign R_INT_STA[2] = r_int2_sta;
assign R_INT_STA[1] = r_int1_sta;
assign R_INT_STA[0] = r_int0_sta;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_auto_reload <= 1'b1;
    end
    else if(r_top0_ctrl_wr) begin
        r_ch0_auto_reload <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_tim_enable <= 1'b0;
    end
    else if(r_top0_ctrl_wr) begin
        r_ch0_tim_enable <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_update <= 1'b0;
    end
    else if(r_top0_ctrl_wr) begin
        r_ch0_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_psc <= 16'ha;
    end
    else if(r_pe0_ctrl_wr) begin
        r_ch0_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_arr <= 16'h28;
    end
    else if(r_pe0_ctrl_wr) begin
        r_ch0_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch0_startcnt <= 16'h0;
    end
    else if(r_pe0_ctrl1_wr) begin
        r_ch0_startcnt <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_auto_reload <= 1'b1;
    end
    else if(r_top1_ctrl_wr) begin
        r_ch1_auto_reload <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_tim_enable <= 1'b0;
    end
    else if(r_top1_ctrl_wr) begin
        r_ch1_tim_enable <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_update <= 1'b0;
    end
    else if(r_top1_ctrl_wr) begin
        r_ch1_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_psc <= 16'ha;
    end
    else if(r_pe1_ctrl_wr) begin
        r_ch1_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_arr <= 16'h28;
    end
    else if(r_pe1_ctrl_wr) begin
        r_ch1_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch1_startcnt <= 16'h0;
    end
    else if(r_pe1_ctrl1_wr) begin
        r_ch1_startcnt <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_auto_reload <= 1'b1;
    end
    else if(r_top2_ctrl_wr) begin
        r_ch2_auto_reload <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_tim_enable <= 1'b0;
    end
    else if(r_top2_ctrl_wr) begin
        r_ch2_tim_enable <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_update <= 1'b0;
    end
    else if(r_top2_ctrl_wr) begin
        r_ch2_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_psc <= 16'ha;
    end
    else if(r_pe2_ctrl_wr) begin
        r_ch2_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_arr <= 16'h28;
    end
    else if(r_pe2_ctrl_wr) begin
        r_ch2_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch2_startcnt <= 16'h0;
    end
    else if(r_pe2_ctrl1_wr) begin
        r_ch2_startcnt <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_auto_reload <= 1'b1;
    end
    else if(r_top3_ctrl_wr) begin
        r_ch3_auto_reload <= pwdata[2];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_tim_enable <= 1'b0;
    end
    else if(r_top3_ctrl_wr) begin
        r_ch3_tim_enable <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_update <= 1'b0;
    end
    else if(r_top3_ctrl_wr) begin
        r_ch3_update <= pwdata[0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_psc <= 16'ha;
    end
    else if(r_pe3_ctrl_wr) begin
        r_ch3_psc <= pwdata[31:16];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_arr <= 16'h28;
    end
    else if(r_pe3_ctrl_wr) begin
        r_ch3_arr <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_ch3_startcnt <= 16'h0;
    end
    else if(r_pe3_ctrl1_wr) begin
        r_ch3_startcnt <= pwdata[15:0];
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
        32'h40010000 + 8'h00 : prdata = R_TOP0_CTRL;
        32'h40010000 + 8'h04 : prdata = R_PE0_CTRL;
        32'h40010000 + 8'h08 : prdata = R_PE0_CTRL1;
        32'h40010000 + 8'h0c : prdata = R_RSV0    ;
        32'h40010000 + 8'h10 : prdata = R_TOP1_CTRL;
        32'h40010000 + 8'h14 : prdata = R_PE1_CTRL;
        32'h40010000 + 8'h18 : prdata = R_PE1_CTRL1;
        32'h40010000 + 8'h1c : prdata = R_RSV1    ;
        32'h40010000 + 8'h20 : prdata = R_TOP2_CTRL;
        32'h40010000 + 8'h24 : prdata = R_PE2_CTRL;
        32'h40010000 + 8'h28 : prdata = R_PE2_CTRL1;
        32'h40010000 + 8'h2c : prdata = R_RSV2    ;
        32'h40010000 + 8'h30 : prdata = R_TOP3_CTRL;
        32'h40010000 + 8'h34 : prdata = R_PE3_CTRL;
        32'h40010000 + 8'h38 : prdata = R_PE3_CTRL1;
        32'h40010000 + 8'h3c : prdata = R_RSV3    ;
        32'h40010000 + 8'h40 : prdata = R_INT_EN  ;
        32'h40010000 + 8'h44 : prdata = R_INT_CLR ;
        32'h40010000 + 8'h48 : prdata = R_INT_STA ;
        default:prdata = 32'b0;
    endcase
end
endmodule
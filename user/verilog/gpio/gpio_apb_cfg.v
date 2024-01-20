module gpio_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,r_modex
                ,r_typex
                ,r_speedx
                ,r_pupdx
                ,r_odx
                ,r_togglex
                ,r_afx
                ,r_inttrigx
                ,r_intx_en
                ,r_intx_clr
                ,r_idx
                ,r_intx_sta
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output [31:0]   r_modex;
output [15:0]   r_typex;
output [31:0]   r_speedx;
output [31:0]   r_pupdx;
output [15:0]   r_odx;
output [15:0]   r_togglex;
output [31:0]   r_afx;
output [31:0]   r_inttrigx;
output [15:0]   r_intx_en;
output [15:0]   r_intx_clr;
input  [15:0]   r_idx;
input  [15:0]   r_intx_sta;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg  [31:0]     r_modex;
reg  [15:0]     r_typex;
reg  [31:0]     r_speedx;
reg  [31:0]     r_pupdx;
reg  [15:0]     r_odx;
reg  [15:0]     r_togglex;
reg  [31:0]     r_afx;
reg  [31:0]     r_inttrigx;
reg  [15:0]     r_intx_en;
reg  [15:0]     r_intx_clr;
wire [15:0]     r_idx;
wire [15:0]     r_intx_sta;
wire [31:0]     R_MODE;
wire [31:0]     R_TYPE;
wire [31:0]     R_SPEED;
wire [31:0]     R_PUPD;
wire [31:0]     R_OD;
wire [31:0]     R_TOGGLE;
wire [31:0]     R_AF;
wire [31:0]     R_INTTRIG;
wire [31:0]     R_INT_EN;
wire [31:0]     R_INT_CLR;
wire [31:0]     R_ID;
wire [31:0]     R_INT_STA;
wire            r_mode_wr;
wire            r_mode_rd;
wire            r_type_wr;
wire            r_type_rd;
wire            r_speed_wr;
wire            r_speed_rd;
wire            r_pupd_wr;
wire            r_pupd_rd;
wire            r_od_wr;
wire            r_od_rd;
wire            r_toggle_wr;
wire            r_toggle_rd;
wire            r_af_wr;
wire            r_af_rd;
wire            r_inttrig_wr;
wire            r_inttrig_rd;
wire            r_int_en_wr;
wire            r_int_en_rd;
wire            r_int_clr_wr;
wire            r_int_clr_rd;
wire            r_id_wr;
wire            r_id_rd;
wire            r_int_sta_wr;
wire            r_int_sta_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign r_mode_wr = (paddr == 32'h4000a000 + 8'h00) & reg_wr;
assign r_mode_rd = (paddr == 32'h4000a000 + 8'h00) & reg_rd;
assign r_type_wr = (paddr == 32'h4000a000 + 8'h04) & reg_wr;
assign r_type_rd = (paddr == 32'h4000a000 + 8'h04) & reg_rd;
assign r_speed_wr = (paddr == 32'h4000a000 + 8'h08) & reg_wr;
assign r_speed_rd = (paddr == 32'h4000a000 + 8'h08) & reg_rd;
assign r_pupd_wr = (paddr == 32'h4000a000 + 8'h0c) & reg_wr;
assign r_pupd_rd = (paddr == 32'h4000a000 + 8'h0c) & reg_rd;
assign r_od_wr = (paddr == 32'h4000a000 + 8'h10) & reg_wr;
assign r_od_rd = (paddr == 32'h4000a000 + 8'h10) & reg_rd;
assign r_toggle_wr = (paddr == 32'h4000a000 + 8'h14) & reg_wr;
assign r_toggle_rd = (paddr == 32'h4000a000 + 8'h14) & reg_rd;
assign r_af_wr = (paddr == 32'h4000a000 + 8'h18) & reg_wr;
assign r_af_rd = (paddr == 32'h4000a000 + 8'h18) & reg_rd;
assign r_inttrig_wr = (paddr == 32'h4000a000 + 8'h1c) & reg_wr;
assign r_inttrig_rd = (paddr == 32'h4000a000 + 8'h1c) & reg_rd;
assign r_int_en_wr = (paddr == 32'h4000a000 + 8'h20) & reg_wr;
assign r_int_en_rd = (paddr == 32'h4000a000 + 8'h20) & reg_rd;
assign r_int_clr_wr = (paddr == 32'h4000a000 + 8'h24) & reg_wr;
assign r_int_clr_rd = (paddr == 32'h4000a000 + 8'h24) & reg_rd;
assign r_id_wr = (paddr == 32'h4000a000 + 8'h28) & reg_wr;
assign r_id_rd = (paddr == 32'h4000a000 + 8'h28) & reg_rd;
assign r_int_sta_wr = (paddr == 32'h4000a000 + 8'h2c) & reg_wr;
assign r_int_sta_rd = (paddr == 32'h4000a000 + 8'h2c) & reg_rd;
assign R_MODE[31:0] = r_modex;
assign R_TYPE[31:16] = 16'h0;
assign R_TYPE[15:0] = r_typex;
assign R_SPEED[31:0] = r_speedx;
assign R_PUPD[31:0] = r_pupdx;
assign R_OD[31:16] = 16'h0;
assign R_OD[15:0] = r_odx;
assign R_TOGGLE[31:16] = 16'h0;
assign R_TOGGLE[15:0] = r_togglex;
assign R_AF[31:0] = r_afx;
assign R_INTTRIG[31:0] = r_inttrigx;
assign R_INT_EN[31:16] = 16'h0;
assign R_INT_EN[15:0] = r_intx_en;
assign R_INT_CLR[31:16] = 16'h0;
assign R_INT_CLR[15:0] = r_intx_clr;
assign R_ID[31:16] = 16'h0;
assign R_ID[15:0] = r_idx;
assign R_INT_STA[31:16] = 16'h0;
assign R_INT_STA[15:0] = r_intx_sta;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_modex <= 32'hffffffff;
    end
    else if(r_mode_wr) begin
        r_modex <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_typex <= 16'h0;
    end
    else if(r_type_wr) begin
        r_typex <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_speedx <= 32'h0;
    end
    else if(r_speed_wr) begin
        r_speedx <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_pupdx <= 32'h0;
    end
    else if(r_pupd_wr) begin
        r_pupdx <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_odx <= 16'h0;
    end
    else if(r_od_wr) begin
        r_odx <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_togglex <= 16'h0;
    end
    else if(r_toggle_wr) begin
        r_togglex <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_afx <= 32'h0;
    end
    else if(r_af_wr) begin
        r_afx <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_inttrigx <= 32'h0;
    end
    else if(r_inttrig_wr) begin
        r_inttrigx <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_intx_en <= 16'h0;
    end
    else if(r_int_en_wr) begin
        r_intx_en <= pwdata[15:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        r_intx_clr <= 16'h0;
    end
    else if(r_int_clr_wr) begin
        r_intx_clr <= pwdata[15:0];
    end
end
always@(*) begin
    case(paddr)
        32'h4000a000 + 8'h00 : prdata = R_MODE    ;
        32'h4000a000 + 8'h04 : prdata = R_TYPE    ;
        32'h4000a000 + 8'h08 : prdata = R_SPEED   ;
        32'h4000a000 + 8'h0c : prdata = R_PUPD    ;
        32'h4000a000 + 8'h10 : prdata = R_OD      ;
        32'h4000a000 + 8'h14 : prdata = R_TOGGLE  ;
        32'h4000a000 + 8'h18 : prdata = R_AF      ;
        32'h4000a000 + 8'h1c : prdata = R_INTTRIG ;
        32'h4000a000 + 8'h20 : prdata = R_INT_EN  ;
        32'h4000a000 + 8'h24 : prdata = R_INT_CLR ;
        32'h4000a000 + 8'h28 : prdata = R_ID      ;
        32'h4000a000 + 8'h2c : prdata = R_INT_STA ;
        default:prdata = 32'b0;
    endcase
end
endmodule
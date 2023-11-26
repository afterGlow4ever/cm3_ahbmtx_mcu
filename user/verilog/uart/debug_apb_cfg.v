module debug_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,debug0
                ,debug1
                ,debug2
                ,debug3
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
output [31:0]   debug0;
output [31:0]   debug1;
output [31:0]   debug2;
output [31:0]   debug3;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
reg  [31:0]     debug0;
reg  [31:0]     debug1;
reg  [31:0]     debug2;
reg  [31:0]     debug3;
wire [31:0]     DREG0;
wire [31:0]     DREG1;
wire [31:0]     DREG2;
wire [31:0]     DREG3;
wire            dreg0_wr;
wire            dreg0_rd;
wire            dreg1_wr;
wire            dreg1_rd;
wire            dreg2_wr;
wire            dreg2_rd;
wire            dreg3_wr;
wire            dreg3_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign dreg0_wr = (paddr == 32'h40000000 + 8'h00) & reg_wr;
assign dreg0_rd = (paddr == 32'h40000000 + 8'h00) & reg_rd;
assign dreg1_wr = (paddr == 32'h40000000 + 8'h04) & reg_wr;
assign dreg1_rd = (paddr == 32'h40000000 + 8'h04) & reg_rd;
assign dreg2_wr = (paddr == 32'h40000000 + 8'h08) & reg_wr;
assign dreg2_rd = (paddr == 32'h40000000 + 8'h08) & reg_rd;
assign dreg3_wr = (paddr == 32'h40000000 + 8'h0c) & reg_wr;
assign dreg3_rd = (paddr == 32'h40000000 + 8'h0c) & reg_rd;
assign DREG0[31:0] = debug0;
assign DREG1[31:0] = debug1;
assign DREG2[31:0] = debug2;
assign DREG3[31:0] = debug3;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        debug0 <= 32'b0;
    end
    else if(dreg0_wr) begin
        debug0 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        debug1 <= 32'b0;
    end
    else if(dreg1_wr) begin
        debug1 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        debug2 <= 32'b0;
    end
    else if(dreg2_wr) begin
        debug2 <= pwdata[31:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        debug3 <= 32'b0;
    end
    else if(dreg3_wr) begin
        debug3 <= pwdata[31:0];
    end
end
always@(*) begin
    case(paddr)
        32'h40000000 + 8'h00 : prdata = DREG0     ;
        32'h40000000 + 8'h04 : prdata = DREG1     ;
        32'h40000000 + 8'h08 : prdata = DREG2     ;
        32'h40000000 + 8'h0c : prdata = DREG3     ;
        default:prdata = 32'b0;
    endcase
end
endmodule
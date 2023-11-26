module uart_apb_cfg (
                 clk
                ,rst_n
                ,pwrite
                ,psel
                ,penable
                ,paddr
                ,pwdata
                ,prdata
                ,rx_data
                ,tx_data
                ,enable_intr
                ,rst_rx_fifo
                ,rst_tx_fifo
                ,parity_error
                ,frame_error
                ,overrun_error
                ,intr_enabled
                ,tx_fifo_full
                ,tx_fifo_empty
                ,rx_fifo_full
                ,rx_fifo_valid_data
                );
input           clk;
input           rst_n;
input           pwrite;
input           psel;
input           penable;
input  [31:0]   paddr;
input  [31:0]   pwdata;
output [31:0]   prdata;
input  [7:0]    rx_data;
output [7:0]    tx_data;
output          enable_intr;
output          rst_rx_fifo;
output          rst_tx_fifo;
input           parity_error;
input           frame_error;
input           overrun_error;
input           intr_enabled;
input           tx_fifo_full;
input           tx_fifo_empty;
input           rx_fifo_full;
input           rx_fifo_valid_data;
wire            clk;
wire            rst_n;
wire            pwrite;
wire            psel;
wire            penable;
wire [31:0]     paddr;
wire [31:0]     pwdata;
reg  [31:0]     prdata;
wire [7:0]      rx_data;
reg  [7:0]      tx_data;
reg             enable_intr;
reg             rst_rx_fifo;
reg             rst_tx_fifo;
wire            parity_error;
wire            frame_error;
wire            overrun_error;
wire            intr_enabled;
wire            tx_fifo_full;
wire            tx_fifo_empty;
wire            rx_fifo_full;
wire            rx_fifo_valid_data;
wire [31:0]     RX_FIFO;
wire [31:0]     TX_FIFO;
wire [31:0]     STAT_REG;
wire [31:0]     CTRL_REG;
wire            rx_fifo_wr;
wire            rx_fifo_rd;
wire            tx_fifo_wr;
wire            tx_fifo_rd;
wire            stat_reg_wr;
wire            stat_reg_rd;
wire            ctrl_reg_wr;
wire            ctrl_reg_rd;
wire            reg_wr;
wire            reg_rd;
assign reg_wr = psel & pwrite & penable;
assign reg_rd = psel & (~pwrite) & (~penable);
assign rx_fifo_wr = (paddr == 32'h40070050 + 8'h00) & reg_wr;
assign rx_fifo_rd = (paddr == 32'h40070050 + 8'h00) & reg_rd;
assign tx_fifo_wr = (paddr == 32'h40070050 + 8'h04) & reg_wr;
assign tx_fifo_rd = (paddr == 32'h40070050 + 8'h04) & reg_rd;
assign stat_reg_wr = (paddr == 32'h40070050 + 8'h08) & reg_wr;
assign stat_reg_rd = (paddr == 32'h40070050 + 8'h08) & reg_rd;
assign ctrl_reg_wr = (paddr == 32'h40070050 + 8'h0c) & reg_wr;
assign ctrl_reg_rd = (paddr == 32'h40070050 + 8'h0c) & reg_rd;
assign RX_FIFO[31:8] = 24'b0;
assign RX_FIFO[7:0] = rx_data;
assign TX_FIFO[31:8] = 24'b0;
assign TX_FIFO[7:0] = 8'b0;
assign STAT_REG[31:5] = 27'b0;
assign STAT_REG[4] = 1'b0;
assign STAT_REG[3-2] = 1'b0;
assign STAT_REG[1] = 1'b0;
assign STAT_REG[0] = 1'b0;
assign CTRL_REG[31:8] = 24'b0;
assign CTRL_REG[7] = parity_error;
assign CTRL_REG[6] = frame_error;
assign CTRL_REG[5] = overrun_error;
assign CTRL_REG[4] = intr_enabled;
assign CTRL_REG[3] = tx_fifo_full;
assign CTRL_REG[2] = tx_fifo_empty;
assign CTRL_REG[1] = rx_fifo_full;
assign CTRL_REG[0] = rx_fifo_valid_data;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        tx_data <= 8'b0;
    end
    else if(tx_fifo_wr) begin
        tx_data <= pwdata[7:0];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        enable_intr <= 1'b0;
    end
    else if(stat_reg_wr) begin
        enable_intr <= pwdata[4];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rst_rx_fifo <= 1'b0;
    end
    else if(stat_reg_wr) begin
        rst_rx_fifo <= pwdata[1];
    end
end
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rst_tx_fifo <= 1'b0;
    end
    else if(stat_reg_wr) begin
        rst_tx_fifo <= pwdata[0];
    end
end
always@(*) begin
    case(paddr)
        32'h40070050 + 8'h00 : prdata = RX_FIFO   ;
        32'h40070050 + 8'h04 : prdata = TX_FIFO   ;
        32'h40070050 + 8'h08 : prdata = STAT_REG  ;
        32'h40070050 + 8'h0c : prdata = CTRL_REG  ;
        default:prdata = 32'b0;
    endcase
end
endmodule
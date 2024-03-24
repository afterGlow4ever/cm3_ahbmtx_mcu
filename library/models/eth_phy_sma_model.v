//===============================================
//
//	File: eth_phy_sma_model.v
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory	
//	Date: 03102024
//	Version: v1.0
//
// 	This model is simulate ethernet phy sma slave.
// 	
//===============================================

//===============================================
// Interface
//===============================================

module eth_phy_sma_model
#(
	parameter					BIT_TIMING = 400,
	parameter					PHY_ADDRESS = 1
)
(
	input						eth_mdc,
	inout						eth_mdio
);

//===============================================
// status init
//===============================================

wire							eth_mdio_i;
reg								eth_mdio_o;
reg								eth_mdio_oen;

// config
reg				[15:0]			eth_phy_reg00;
reg				[15:0]			eth_phy_reg01;
reg				[15:0]			eth_phy_reg02;
reg				[15:0]			eth_phy_reg03;
reg				[15:0]			eth_phy_reg04;

// rx temp
reg				[0: 1]			eth_phy_op;
reg				[0: 4]			eth_phy_address;
reg				[0: 4]			eth_phy_reg_address;
reg				[0:15]			eth_phy_reg_data;

// status
wire							eth_phy_cmd_write;
wire							eth_phy_cmd_read;
wire							eth_phy_address_match;

// event
event							eth_mdc_posedge;
event							eth_mdc_negedge;

assign eth_mdio_i = eth_mdio;
assign eth_mdio = (eth_mdio_oen == 1'b1) ? 1'bz : eth_mdio_o;

assign eth_phy_cmd_write = (eth_phy_op == 2'b01) ? 1'b1 : 1'b0;
assign eth_phy_cmd_read = (eth_phy_op == 2'b10) ? 1'b1 : 1'b0;
assign eth_phy_address_match = (eth_phy_address == PHY_ADDRESS) ? 1'b1 : 1'b0;

always @(posedge eth_mdc) -> eth_mdc_posedge;
always @(negedge eth_mdc) -> eth_mdc_negedge;

initial
begin
end

//===============================================
// eth phy sma slave
//===============================================

initial
begin
	forever
	begin
		// init status
		eth_phy_op = 2'h0;
		eth_phy_address = 5'h0;
		eth_phy_reg_address = 5'h0;
		eth_phy_reg_data = 16'h0;
		eth_mdio_oen = 1'b1;
		eth_mdio_o = 1'b0;
	
		// preamble, at least 32 bits time
		for(int bit_cnt = 0; bit_cnt < 32; bit_cnt++)
		begin: PREAMBLE
			@eth_mdc_posedge;
			eth_mdio_oen = 1'b1;
		end
	
		// start bit detect
		@(posedge eth_mdio_i);
		@eth_mdc_posedge;

		// op
		for(int bit_cnt = 0; bit_cnt < 2; bit_cnt++)
		begin: OP
			@eth_mdc_posedge;
			eth_phy_op[bit_cnt] = eth_mdio_i;
		end
	
		// phy address
		for(int bit_cnt = 0; bit_cnt < 5; bit_cnt++)
		begin: PHY_ADDRESS
			@eth_mdc_posedge;
			eth_phy_address[bit_cnt] = eth_mdio_i;
		end
	
		// reg address
		for(int bit_cnt = 0; bit_cnt < 5; bit_cnt++)
		begin: REG_ADDRESS
			@eth_mdc_posedge;
			eth_phy_reg_address[bit_cnt] = eth_mdio_i;
		end
	
		// turn 
		@eth_mdc_negedge;
		if(eth_phy_cmd_write)
		begin
			eth_mdio_oen = 1'b1;
			@eth_mdc_negedge;
			eth_mdio_oen = 1'b1;
			@eth_mdc_posedge;
		end
		else if(eth_phy_cmd_read)
		begin
			eth_mdio_oen = 1'b0;
			@eth_mdc_negedge;

			if(eth_phy_address_match == 1'b1)
			begin
				eth_mdio_o = 1'b0;// ack bit: 0 ack
			end
			else
			begin
				eth_mdio_o = 1'b1;// ack bit: 1 nack
			end
			@eth_mdc_posedge;
			eth_mdio_oen = 1'b1;
		end

		// rx data
		if(eth_phy_cmd_write)
		begin
			eth_mdio_oen = 1'b1;
			for(int bit_cnt = 0; bit_cnt < 16; bit_cnt++)
			begin: RX_DATA
				@eth_mdc_posedge;
				eth_phy_reg_data[bit_cnt] = eth_mdio_i;
			end

			if(eth_phy_address_match == 1'b1)
			begin
				case (eth_phy_reg_address)
					5'd0: eth_phy_reg00 = eth_phy_reg_data; 
					5'd1: eth_phy_reg01 = eth_phy_reg_data; 
					5'd2: eth_phy_reg02 = eth_phy_reg_data; 
					5'd3: eth_phy_reg03 = eth_phy_reg_data; 
					5'd4: eth_phy_reg04 = eth_phy_reg_data; 
				endcase
`ifdef ETH_SMA_MONITOR
			$display($time, "[ETH SMA MONITOR] eth sma rx reg %4h with %4h config.", eth_phy_reg_address, eth_phy_reg_data);
`endif
			end
		end
		// tx data
		else if(eth_phy_cmd_read)
		begin
			if(eth_phy_address_match == 1'b1)
			begin
				case (eth_phy_reg_address)
					5'd0: eth_phy_reg_data = eth_phy_reg00; 
					5'd1: eth_phy_reg_data = eth_phy_reg01; 
					5'd2: eth_phy_reg_data = eth_phy_reg02; 
					5'd3: eth_phy_reg_data = eth_phy_reg03; 
					5'd4: eth_phy_reg_data = eth_phy_reg04; 
					default: eth_phy_reg_data = 16'h0;
				endcase
`ifdef ETH_SMA_MONITOR
			$display($time, "[ETH SMA MONITOR] eth sma tx reg %4h with %4h config.", eth_phy_reg_address, eth_phy_reg_data);
`endif
			end
			else
			begin
				eth_phy_reg_data = 16'h0;
`ifdef ETH_SMA_MONITOR
			$display($time, "[ETH SMA MONITOR] eth sma phy address mismatch.");
`endif
			end

			for(int bit_cnt = 0; bit_cnt < 16; bit_cnt++)
			begin: TX_DATA
				@eth_mdc_negedge;
				eth_mdio_oen = 1'b0;
				eth_mdio_o = eth_phy_reg_data[bit_cnt];
			end
			#BIT_TIMING
			eth_mdio_oen = 1'b1;
		end
	end
end

//===============================================
// eth phy sma reg
//===============================================

task init;
	eth_phy_reg00  = 16'h0;
	eth_phy_reg01  = 16'h1;
	eth_phy_reg02  = 16'h2;
	eth_phy_reg03  = 16'h3;
	eth_phy_reg04  = 16'h4;
endtask

task read_phy_regs;
	input		[ 4:0]			reg_address;
	output 		[15:0] 			reg_config;

	case (reg_address)
		5'd0: reg_config = eth_phy_reg00 ;
		5'd1: reg_config = eth_phy_reg01 ;
		5'd2: reg_config = eth_phy_reg02 ;
		5'd3: reg_config = eth_phy_reg03 ;
		5'd4: reg_config = eth_phy_reg04 ;
	endcase
`ifdef ETH_SMA_MONITOR
	$display($time, "[ETH SMA MONITOR] eth sma reg %4h with %4h config.", reg_address, reg_config);
`endif
endtask

endmodule



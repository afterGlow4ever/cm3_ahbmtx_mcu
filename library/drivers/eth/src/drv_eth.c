//===============================================
//
//	File: drv_eth.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is source file for ethernet driver.
//
//===============================================

#include "drv_eth.h"

#ifdef ETH_DRIVER

//===============================================
// eth sma init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_eth_sma_default_config(ETH_HandleTypeDef *eth)
{
	eth->sma_cfg.clkdiv = 20;
	eth->sma_cfg.interval_bit = 3;	
}

bool drv_eth_sma_set_config(ETH_HandleTypeDef *eth)
{
	uint32_t reg_temp = 0x04000300;

	reg_temp = 	(eth->sma_cfg.clkdiv							 			<< 24) |
				(eth->sma_cfg.phy_address									<< 16) |
				(eth->sma_cfg.interval_bit									<< 8)  ;

	return drv_check_rw_data((uint32_t)(&(eth->regs->sma_pe_ctrl)), reg_temp, reg_temp);
}

bool drv_eth_sma_init(ETH_HandleTypeDef *eth)
{
	bool status;

	eth->sma_tx_ptr = 0;
	eth->sma_rx_ptr = 0;
	status = drv_eth_sma_set_config(eth);
	drv_eth_sma_logic_reset(eth);
	drv_eth_sma_int_allclear(eth);
	drv_eth_sma_config_update(eth);

	return status;
}

void drv_eth_sma_deinit(ETH_HandleTypeDef *eth)
{
	eth->sma_tx_ptr = 0;
	eth->sma_rx_ptr = 0;
	drv_eth_sma_logic_reset(eth);
	drv_eth_sma_int_allclear(eth);
}

//===============================================
// eth sma master write reg using polling method
// [22:21] cmd
// When cmd = 2'b01, tx data.
// [20:16] reg address
// [15:0] tx data
// When cmd = 2'b10, rx data.
// [19:16] reg address
// [15:0] reseverd
//===============================================

void drv_eth_sma_master_write_reg(ETH_HandleTypeDef *eth, uint8_t reg_address, uint16_t data)
{
	eth->sma_tx_ptr = 0;

	while(REG_GETBITS(eth->regs->sma_fifo_sta, 8, 10) != 0);// wait until tx fifo empty
	eth->regs->sma_tx_data = data | (reg_address << 16) | (ETH_SMA_CMD_WRITE << 21);
	
	while((drv_eth_sma_int_get(eth) & ETH_SMA_INT_MASTER_FRAME_DONE) == 0);
	drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);
}

void drv_eth_sma_master_write_reglist(ETH_HandleTypeDef *eth, uint32_t data[], uint8_t length)
{
	eth->sma_tx_ptr = 0;

	while(eth->sma_tx_ptr < length)
	{
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);// fixed 04062024: avoid finishing before expected 
		if(REG_GETBITS(eth->regs->sma_fifo_sta, 8, 10) < (ETH_SMA_FIFO_NUM >> 1))
		{
			eth->regs->sma_tx_data = data[eth->sma_tx_ptr++] | (ETH_SMA_CMD_WRITE << 21);
		}
	}
	
	while((drv_eth_sma_int_get(eth) & ETH_SMA_INT_MASTER_FRAME_DONE) == 0);
	drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);
}

//===============================================
// eth sma master read reg using polling method
// return value:
// FALSE 0: DONE
// TRUE 1: RX ERROR
//===============================================

bool drv_eth_sma_master_read_reg(ETH_HandleTypeDef *eth, uint8_t reg_address, uint16_t *data)
{
	while(REG_GETBITS(eth->regs->sma_fifo_sta, 8, 10) != 0);// wait until tx fifo empty
	eth->regs->sma_tx_data = (reg_address << 16) | (ETH_SMA_CMD_READ << 21);

	while(REG_GETBITS(eth->regs->sma_fifo_sta, 0, 2) == 0);
	*data = eth->regs->sma_rx_data;// save reg data bits

	if((drv_eth_sma_int_get(eth) & ETH_SMA_INT_RX_TURN_NACK) != 0)
	{
		drv_eth_sma_logic_reset(eth);
		eth->status = 1 << ETH_SMA_STATUS_RX_NACK;
		return TRUE;
	}

	while((drv_eth_sma_int_get(eth) & ETH_SMA_INT_MASTER_FRAME_DONE) == 0);
	drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);

	return FALSE;
}

bool drv_eth_sma_master_read_reglist(ETH_HandleTypeDef *eth, uint32_t data[], uint8_t length)
{
	eth->sma_rx_ptr = 0;

	while(eth->sma_rx_ptr < length)
	{
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);// fixed 04062024: avoid finishing before expected 
		while(REG_GETBITS(eth->regs->sma_fifo_sta, 8, 10) != 0);// wait until tx fifo empty
		eth->regs->sma_tx_data = data[eth->sma_rx_ptr] | (ETH_SMA_CMD_READ << 21);

		while(REG_GETBITS(eth->regs->sma_fifo_sta, 0, 2) == 0);
		data[eth->sma_rx_ptr] &= 0xffff0000;// clear reg data bits
		data[eth->sma_rx_ptr++] |= eth->regs->sma_rx_data;// save reg data bits
		if((drv_eth_sma_int_get(eth) & ETH_SMA_INT_RX_TURN_NACK) != 0)
		{
			drv_eth_sma_logic_reset(eth);
			eth->status = 1 << ETH_SMA_STATUS_RX_NACK;
			return TRUE;
		}
	}

	while((drv_eth_sma_int_get(eth) & ETH_SMA_INT_MASTER_FRAME_DONE) == 0);
	drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);

	return FALSE;
}

////===============================================
//// eth sma master read reg using interrupt method
////===============================================
//
//void drv_eth_sma_master_read_reg_it(ETH_HandleTypeDef *eth, uint16_t data[], uint8_t length)
//{
//	eth->sma_rx_data = data;
//	eth->sma_rx_num = length;
//	eth->sma_rx_ptr = 0;
//	drv_eth_sma_int_enable(eth, ETH_SMA_INT_RX_FIFO_NOEMPTY | ETH_SMA_INT_RX_FIFO_THRES);
//}

//===============================================
// eth sma weak function
//===============================================

void __attribute__((weak)) eth_sma_int_rx_turn_nack_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_sma_int_master_frame_done_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_sma_int_tx_fifo_empty_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_sma_int_tx_fifo_thres_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_sma_int_rx_fifo_noempty_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_sma_int_rx_fifo_thres_callback(ETH_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

//===============================================
// eth sma interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_eth_sma_interrupt_handler(ETH_HandleTypeDef *eth)
{
	uint8_t status;
	status = drv_eth_sma_int_get(eth) & eth->regs->sma_int_en;

	if(status & ETH_SMA_INT_RX_TURN_NACK)
	{
		eth->status = 1 << ETH_SMA_STATUS_RX_NACK;
		eth_sma_int_rx_turn_nack_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_RX_TURN_NACK);
	}
	if(status & ETH_SMA_INT_MASTER_FRAME_DONE)
	{
		eth_sma_int_master_frame_done_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_MASTER_FRAME_DONE);
	}
	if(status & ETH_SMA_INT_TX_FIFO_THRES)
	{
		eth_sma_int_tx_fifo_thres_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_TX_FIFO_THRES);
	}
	if(status & ETH_SMA_INT_TX_FIFO_EMPTY)
	{
		eth_sma_int_tx_fifo_empty_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_TX_FIFO_EMPTY);
	}
	if(status & ETH_SMA_INT_RX_FIFO_THRES)
	{
		eth_sma_int_rx_fifo_thres_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_RX_FIFO_THRES);
	}
	if(status & ETH_SMA_INT_RX_FIFO_NOEMPTY)
	{
		eth_sma_int_rx_fifo_noempty_callback(eth);
		drv_eth_sma_int_clear(eth, ETH_SMA_INT_RX_FIFO_NOEMPTY);
	}
}

#endif


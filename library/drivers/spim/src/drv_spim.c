//===============================================
//
//	File: drv_spim.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is source file for spim driver.
//
//===============================================

#include "drv_spim.h"

#ifdef SPIM_DRIVER

//===============================================
// spim init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_spim_default_config(SPIM_HandleTypeDef *spim)
{
	spim->cfg.clkdiv = 1;
	spim->cfg.mode = SPIM_MODE0;
	spim->cfg.trans_mode = SPIM_DUPLEX;	
	spim->cfg.tx_mask = SPIM_TX_MASK;	
	spim->cfg.rx_mask = SPIM_RX_MASK;	
	spim->cfg.tls = 0;		
	spim->cfg.tle = 0;		
	spim->cfg.ti = 0;		
}

bool drv_spim_set_config(SPIM_HandleTypeDef *spim)
{
	uint32_t reg_temp;
	uint8_t reg_check = 0;

	reg_temp = 	(spim->cfg.clkdiv 											<< 24) |
				(spim->cfg.mode 											<< 22) |
				(spim->cfg.trans_mode										<< 21) |
				(spim->cfg.tx_mask											<< 19) |
				(spim->cfg.rx_mask											<< 18) ;

	reg_check |=  drv_check_rw_data((uint32_t)(&(spim->regs->pe_ctrl0)), reg_temp, reg_temp);

	reg_temp = 	(spim->cfg.tls 												<<  8) |
				(spim->cfg.tle 												<<  4) |
				(spim->cfg.ti												<<  0) ;

	reg_check |=  drv_check_rw_data((uint32_t)(&(spim->regs->pe_ctrl1)), reg_temp, reg_temp);

	return reg_check;
}

bool drv_spim_init(SPIM_HandleTypeDef *spim)
{
	bool status;

	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
	status = drv_spim_set_config(spim);
	drv_spim_logic_reset(spim);
	drv_spim_int_allclear(spim);
	drv_spim_config_update(spim);

	return status;
}

void drv_spim_deinit(SPIM_HandleTypeDef *spim)
{
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
	drv_spim_logic_reset(spim);
	drv_spim_int_allclear(spim);
	drv_spim_trans_disable(spim);
	drv_spim_pause_continue_disable(spim);
}

//===============================================
// spim basic transfer with polling method
//===============================================

void drv_spim_tx_data(SPIM_HandleTypeDef *spim, uint8_t data[], uint8_t data_num)
{
	uint8_t data_cnt = 0;
	spim->tx_ptr = 0;
	
	drv_spim_tx_mask_set(spim, SPIM_TX_UNMASK);
	drv_spim_rx_mask_set(spim, SPIM_RX_MASK);
	drv_spim_trans_data_num_set(spim, data_num);
	drv_spim_tx_data_num_set(spim, data_num);
	drv_spim_config_update(spim);

	if(data_num <= SPIM_FIFO_NUM)
	{
		data_cnt = data_num;
	}
	else
	{
		data_cnt = SPIM_FIFO_NUM;
	}

	while(spim->tx_ptr < data_cnt)
	{
		spim->regs->tx_data = data[spim->tx_ptr++];
	}

	drv_spim_trans_enable(spim);

	while(spim->tx_ptr < data_num)
	{
		if(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
		{
			spim->regs->tx_data = data[spim->tx_ptr++];
		}
	}
	
	while((drv_spim_int_get(spim) & SPIM_INT_FRAME_DONE) == 0);
	drv_spim_int_clear(spim, SPIM_INT_FRAME_DONE);

	drv_spim_trans_disable(spim);
	spim->tx_ptr = 0;
}

void drv_spim_tx_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t data[], uint8_t data_num)
{
	uint8_t data_cnt = 0;
	spim->tx_ptr = 0;
	
	drv_spim_tx_mask_set(spim, SPIM_TX_UNMASK);
	drv_spim_rx_mask_set(spim, SPIM_RX_MASK);
	drv_spim_trans_data_num_set(spim, data_num);
	drv_spim_tx_data_num_set(spim, data_num);
	drv_spim_pause_continue_enable(spim);
	drv_spim_config_update(spim);

	if(data_num <= SPIM_FIFO_NUM)
	{
		data_cnt = data_num;
	}
	else
	{
		data_cnt = SPIM_FIFO_NUM;
	}

	while(spim->tx_ptr < data_cnt)
	{
		spim->regs->tx_data = data[spim->tx_ptr++];
	}

	drv_spim_trans_enable(spim);

	while(spim->tx_ptr < data_num)
	{
		if(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
		{
			spim->regs->tx_data = data[spim->tx_ptr++];
		}
		// pending state
		if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
		{
			drv_spim_pause_continue_end(spim);
			drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
			while(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
			{
				if(spim->tx_ptr == data_num)
					break;
				spim->regs->tx_data = data[spim->tx_ptr++];
			}
			drv_spim_pause_continue_start(spim);
		}
	}
	
	while((drv_spim_int_get(spim) & SPIM_INT_FRAME_DONE) == 0);
	drv_spim_int_clear(spim, SPIM_INT_FRAME_DONE);

	drv_spim_pause_continue_disable(spim);
	drv_spim_trans_disable(spim);
	spim->tx_ptr = 0;
}

void drv_spim_rx_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t rx_data[], uint8_t data_num)
{
	spim->rx_ptr = 0;
	
	drv_spim_tx_mask_set(spim, SPIM_TX_MASK);
	drv_spim_rx_mask_set(spim, SPIM_RX_UNMASK);
	drv_spim_trans_data_num_set(spim, data_num);
	drv_spim_tx_data_num_set(spim, data_num);
	drv_spim_pause_continue_enable(spim);
	drv_spim_config_update(spim);

	drv_spim_trans_enable(spim);

	while(spim->rx_ptr < data_num)
	{
		// pending state
		if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
		{
			drv_spim_pause_continue_end(spim);
			drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
			{
				if(spim->rx_ptr == data_num)
					break;
				rx_data[spim->rx_ptr++] = spim->regs->rx_data;
			}
			drv_spim_pause_continue_start(spim);
		}	
		while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
		{
			if(spim->rx_ptr == data_num)
				break;
			rx_data[spim->rx_ptr++] = spim->regs->rx_data;
		}
	}
	
	while((drv_spim_int_get(spim) & SPIM_INT_FRAME_DONE) == 0);
	drv_spim_int_clear(spim, SPIM_INT_FRAME_DONE);

	drv_spim_pause_continue_disable(spim);
	drv_spim_trans_disable(spim);
	spim->rx_ptr = 0;
}

void drv_spim_trans_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t tx_data[], uint8_t rx_data[], uint8_t data_num)
{
	uint8_t data_cnt = 0;
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
	
	drv_spim_tx_mask_set(spim, SPIM_TX_UNMASK);
	drv_spim_rx_mask_set(spim, SPIM_RX_UNMASK);
	drv_spim_trans_data_num_set(spim, data_num);
	drv_spim_tx_data_num_set(spim, data_num);
	drv_spim_pause_continue_enable(spim);
	drv_spim_config_update(spim);

	if(data_num <= SPIM_FIFO_NUM)
	{
		data_cnt = data_num;
	}
	else
	{
		data_cnt = SPIM_FIFO_NUM;
	}

	while(spim->tx_ptr < data_cnt)
	{
		spim->regs->tx_data = tx_data[spim->tx_ptr++];
	}

	drv_spim_trans_enable(spim);

	while(spim->tx_ptr < data_num)
	{
		if(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
		{
			spim->regs->tx_data = tx_data[spim->tx_ptr++];
		}
		if(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
		{
			rx_data[spim->rx_ptr++] = spim->regs->rx_data;
		}
		// pending state
		if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
		{
			drv_spim_pause_continue_end(spim);
			drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
			while(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
			{
				if(spim->tx_ptr == data_num)
					break;
				spim->regs->tx_data = tx_data[spim->tx_ptr++];
			}
			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
			{
				if(spim->rx_ptr == data_num)
					break;
				rx_data[spim->rx_ptr++] = spim->regs->rx_data;
			}
			drv_spim_pause_continue_start(spim);
		}
	}

	while(spim->rx_ptr < data_num)
	{
		// pending state
		if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
		{
			drv_spim_pause_continue_end(spim);
			drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
			{
				if(spim->rx_ptr == data_num)
					break;
				rx_data[spim->rx_ptr++] = spim->regs->rx_data;
			}
			drv_spim_pause_continue_start(spim);
		}
		while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
		{
			if(spim->rx_ptr == data_num)
				break;
			rx_data[spim->rx_ptr++] = spim->regs->rx_data;
		}
	}

	while((drv_spim_int_get(spim) & SPIM_INT_FRAME_DONE) == 0);
	drv_spim_int_clear(spim, SPIM_INT_FRAME_DONE);

	drv_spim_pause_continue_disable(spim);
	drv_spim_trans_disable(spim);
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
}

//===============================================
// spim frame transfer with polling method
// tx first and rx second
// Only performing if trans data number is different
// from tx data number.
//===============================================

void drv_spim_trans_frame_with_pending(SPIM_HandleTypeDef *spim, uint8_t tx_data[], uint8_t rx_data[], uint8_t trans_data_num, uint8_t tx_data_num)
{
	uint8_t data_cnt = 0;
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
	uint8_t rx_data_num;
	
	drv_spim_tx_mask_set(spim, SPIM_TX_UNMASK);
	drv_spim_rx_mask_set(spim, SPIM_RX_UNMASK);
	drv_spim_trans_data_num_set(spim, trans_data_num);
	drv_spim_tx_data_num_set(spim, tx_data_num);
	drv_spim_trans_frame_mode_set(spim, SPIM_FRAME_MODE_ENABLE);
	drv_spim_pause_continue_enable(spim);
	drv_spim_config_update(spim);
	rx_data_num = trans_data_num - tx_data_num;

	if(tx_data_num <= SPIM_FIFO_NUM)
	{
		data_cnt = tx_data_num;
	}
	else
	{
		data_cnt = SPIM_FIFO_NUM;
	}

	while(spim->tx_ptr < data_cnt)
	{
		spim->regs->tx_data = tx_data[spim->tx_ptr++];
	}

	drv_spim_trans_enable(spim);

	// master tx frame: no rx data
	if(tx_data_num == trans_data_num)
	{
		while(spim->tx_ptr < tx_data_num)
		{
			if(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
			{
				spim->regs->tx_data = tx_data[spim->tx_ptr++];
			}
			// pending state
			if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
			{
				drv_spim_pause_continue_end(spim);
				drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
				while(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
				{
					if(spim->tx_ptr == tx_data_num)
						break;
					spim->regs->tx_data = tx_data[spim->tx_ptr++];
				}
				drv_spim_pause_continue_start(spim);
			}
		}
	}
	// master rx frame: tx data first rx data second
	else
	{
		while(spim->tx_ptr < tx_data_num)
		{
			if(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
			{
				spim->regs->tx_data = tx_data[spim->tx_ptr++];
			}
			if(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
			{
				rx_data[spim->rx_ptr++] = spim->regs->rx_data;
			}
			// pending state
			if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
			{
				drv_spim_pause_continue_end(spim);
				drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
				while(REG_GETBITS(spim->regs->fifo_sta, 8, 12) < SPIM_FIFO_NUM)
				{
					if(spim->tx_ptr == tx_data_num)
						break;
					spim->regs->tx_data = tx_data[spim->tx_ptr++];
				}
				while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
				{
					if(spim->rx_ptr == rx_data_num)
						break;
					rx_data[spim->rx_ptr++] = spim->regs->rx_data;
				}
				drv_spim_pause_continue_start(spim);
			}
		}
		
		// waiting remaining data
		while(spim->rx_ptr < rx_data_num)
		{
			// pending state
			if((drv_spim_int_get(spim) & SPIM_INT_TRANSFERRING_PENDING))
			{
				drv_spim_pause_continue_end(spim);
				drv_spim_int_clear(spim, SPIM_INT_TRANSFERRING_PENDING);
				while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
				{
					if(spim->rx_ptr == rx_data_num)
						break;
					rx_data[spim->rx_ptr++] = spim->regs->rx_data;
				}
				drv_spim_pause_continue_start(spim);
			}
			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) > 0)
			{
				if(spim->rx_ptr == rx_data_num)
					break;
				rx_data[spim->rx_ptr++] = spim->regs->rx_data;
			}
		}
	}

	while((drv_spim_int_get(spim) & SPIM_INT_FRAME_DONE) == 0);
	drv_spim_int_clear(spim, SPIM_INT_FRAME_DONE);

	drv_spim_pause_continue_disable(spim);
	drv_spim_trans_disable(spim);
	drv_spim_trans_frame_mode_set(spim, SPIM_FRAME_MODE_DISABLE);
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
}

#if 0

//===============================================
// spim rx using interrupt method
//===============================================

void drv_spim_rx_data_it(SPIM_HandleTypeDef *spim, uint16_t data[], uint8_t length)
{
	spim->rx_data = data;
	spim->rx_num = length;
	spim->rx_ptr = 0;
	drv_spim_int_enable(spim, SPIM_INT_RX_STOP_ERROR | SPIM_INT_RX_PARITY_ERROR | SPIM_INT_RX_FIFO_NOEMPTY | SPIM_INT_RX_FIFO_THRES);
}

#endif

//===============================================
// spim weak function
//===============================================

void __attribute__((weak)) spim_int_frame_done_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_transferring_pending_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_rx_stop_detect_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_tx_fifo_empty_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_tx_fifo_thres_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_rx_fifo_noempty_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

void __attribute__((weak)) spim_int_rx_fifo_thres_callback(SPIM_HandleTypeDef *spim)
{
	UNUSED(spim);
	return;
}

//===============================================
// spim interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_spim_interrupt_handler(SPIM_HandleTypeDef *spim)
{
	uint8_t status;
	status = drv_spim_int_get(spim) & spim->regs->int_en;
	spim->regs->int_clr = status;
	
	if(status & SPIM_INT_FRAME_DONE)
	{
		spim_int_frame_done_callback(spim);
	}
	if(status & SPIM_INT_TRANSFERRING_PENDING)
	{
		spim_int_transferring_pending_callback(spim);
	}
	if(status & SPIM_INT_TX_FIFO_THRES)
	{
		spim_int_tx_fifo_thres_callback(spim);
	}
	if(status & SPIM_INT_TX_FIFO_EMPTY)
	{
		spim_int_tx_fifo_empty_callback(spim);
	}
	if(status & SPIM_INT_RX_FIFO_THRES)
	{
//		if(spim->rx_ptr < spim->rx_num)
//		{
//			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) != 0)
//			{
//				spim->rx_data[spim->rx_ptr++] = spim->regs->rx_data;
//			}
//		}
//		else
//		{
//			drv_spim_int_disable(spim, SPIM_INT_RX_FIFO_NOEMPTY | SPIM_INT_RX_FIFO_THRES);
//		}
		spim_int_rx_fifo_thres_callback(spim);
	}
	if(status & SPIM_INT_RX_FIFO_NOEMPTY)
	{
//		if(spim->rx_ptr < spim->rx_num)
//		{
//			while(REG_GETBITS(spim->regs->fifo_sta, 0, 4) != 0)
//			{
//				spim->rx_data[spim->rx_ptr++] = spim->regs->rx_data;
//			}
//		}
//		else
//		{
//			drv_spim_int_disable(spim, SPIM_INT_RX_FIFO_NOEMPTY | SPIM_INT_RX_FIFO_THRES);
//		}
		spim_int_rx_fifo_noempty_callback(spim);
	}
}

#endif


//===============================================
//
//	File: drv_uart.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12272023
//	Version: v1.0
//
// 	This is source file for uart driver.
//
//===============================================

#include "drv_uart.h"

#ifdef UART_DRIVER

//===============================================
// uart init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_uart_default_config(UART_HandleTypeDef *uart)
{
	uart->cfg.baudrate = 115200;
	uart->cfg.oversampling = 0xf;
	uart->cfg.interval_bit = 0x0;	
	uart->cfg.ignore_error = UART_ERROR_DISCARD_DATA;	
	uart->cfg.stop_bit = UART_STOP_1_BIT;		
	uart->cfg.parity_en	= UART_PARITY_DISABLE;
	uart->cfg.parity_bit = UART_PARITY_ODD;	
	uart->cfg.data_bit = UART_DATA_8_BITS;		
}

bool drv_uart_set_config(UART_HandleTypeDef *uart)
{
	uint32_t reg_temp;

	reg_temp = 	(UART_CLK / (uart->cfg.baudrate * uart->cfg.oversampling) 	<< 20) |
				(uart->cfg.oversampling 									<< 16) |
				(uart->cfg.interval_bit										<< 12) |
				(uart->cfg.ignore_error										<< 11) |
				(uart->cfg.stop_bit											<<  5) |
				(uart->cfg.parity_en										<<  4) |
				(uart->cfg.parity_bit										<<  2) |
				(uart->cfg.data_bit											<<  0) ;

	return drv_check_rw_data(&(uart->regs->pe_ctrl), reg_temp, reg_temp);
}

bool drv_uart_init(UART_HandleTypeDef *uart)
{
	bool status;

	uart->tx_ptr = 0;
	uart->rx_ptr = 0;
	status = drv_uart_set_config(uart);
	drv_uart_logic_reset(uart);
	drv_uart_int_allclear(uart);
	drv_uart_config_update(uart);
	drv_uart_rx_enable(uart);

	return status;
}

void drv_uart_deinit(UART_HandleTypeDef *uart)
{
	uart->tx_ptr = 0;
	uart->rx_ptr = 0;
	drv_uart_logic_reset(uart);
	drv_uart_int_allclear(uart);
	drv_uart_rx_disable(uart);
}

//===============================================
// uart tx using polling method
//===============================================

void drv_uart_tx_data(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length)
{
	uart->tx_ptr = 0;

	while(uart->tx_ptr < length)
	{
		if(REG_GETBITS(uart->regs->fifo_sta, 8, 12) < (UART_FIFO_NUM >> 1))
		{
			uart->regs->tx_data = data[uart->tx_ptr++];
		}
	}
	
	while((drv_uart_int_get(uart) & UART_INT_TX_DONE) == 0);
	drv_uart_int_clear(uart, UART_INT_TX_DONE);
}

//===============================================
// uart tx putchar
//===============================================

void drv_uart_putchars(UART_HandleTypeDef *uart, uint8_t data[], uint8_t length)
{
	uart->tx_ptr = 0;

	while(uart->tx_ptr < length)
	{
		if(REG_GETBITS(uart->regs->fifo_sta, 8, 12) < (UART_FIFO_NUM >> 1))
		{
			uart->regs->tx_data = data[uart->tx_ptr++];
		}
	}
	
	while((drv_uart_int_get(uart) & UART_INT_TX_DONE) == 0);
	drv_uart_int_clear(uart, UART_INT_TX_DONE);
}

void drv_uart_putchar(UART_HandleTypeDef *uart, uint8_t *data)
{
	if(REG_GETBITS(uart->regs->fifo_sta, 8, 12) < (UART_FIFO_NUM >> 1))
	{
		uart->regs->tx_data = *data;
	}
	
	while((drv_uart_int_get(uart) & UART_INT_TX_DONE) == 0);
	drv_uart_int_clear(uart, UART_INT_TX_DONE);
}

//===============================================
// uart rx using polling method
// return value:
// FALSE 0: DONE
// TRUE 1: RX ERROR
//===============================================

bool drv_uart_rx_data(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length)
{
	uint16_t status;
	uart->rx_ptr = 0;

	while(uart->rx_ptr < length)
	{
		status = drv_uart_int_get(uart);
		drv_uart_int_clear(uart, UART_INT_RX_PARITY_ERROR | UART_INT_RX_STOP_ERROR);

		// errors occur
		if(status & UART_INT_RX_STOP_ERROR)
		{
			uart->status = UART_STATUS_STOP_ERROR;
		}
		if(status & UART_INT_RX_PARITY_ERROR)
		{
			uart->status = UART_STATUS_PARITY_ERROR;
		}
		if((uart->status != UART_STATUS_OK) && uart->cfg.ignore_error != UART_ERROR_IGNORE)
		{
			drv_uart_logic_reset(uart);
			return TRUE;	
		}

		while(REG_GETBITS(uart->regs->fifo_sta, 0, 4) != 0)
		{
			data[uart->rx_ptr++] = uart->regs->rx_data;
		}
	}
	return FALSE;	
}

//===============================================
// uart rx getchar
// return value:
// FALSE 0: DONE
// TRUE 1: RX ERROR
// 2: TIMEOUT
//===============================================

bool drv_uart_getchar(UART_HandleTypeDef *uart, uint8_t *data)
{
	uint16_t status;

	while(1)
	{
		status = drv_uart_int_get(uart);
		drv_uart_int_clear(uart, UART_INT_RX_PARITY_ERROR | UART_INT_RX_STOP_ERROR);

		// errors occur
		if(status & UART_INT_RX_STOP_ERROR)
		{
			uart->status = UART_STATUS_STOP_ERROR;
		}
		if(status & UART_INT_RX_PARITY_ERROR)
		{
			uart->status = UART_STATUS_PARITY_ERROR;
		}
		if((uart->status != UART_STATUS_OK) && uart->cfg.ignore_error != UART_ERROR_IGNORE)
		{
			drv_uart_logic_reset(uart);
			*data = 0x00;// null
			return TRUE;	
		}

		while(REG_GETBITS(uart->regs->fifo_sta, 0, 4) != 0)
		{
			*data = uart->regs->rx_data;
			return FALSE;	
		}
	}	
	return FALSE;	
}

uint8_t drv_uart_getchar_timeout(UART_HandleTypeDef *uart, uint8_t *data, uint32_t timeout)
{
	uint16_t status;

	while(timeout != 0)
	{
		status = drv_uart_int_get(uart);
		drv_uart_int_clear(uart, UART_INT_RX_PARITY_ERROR | UART_INT_RX_STOP_ERROR);
	
		// errors occur
		if(status & UART_INT_RX_STOP_ERROR)
		{
			uart->status = UART_STATUS_STOP_ERROR;
		}
		if(status & UART_INT_RX_PARITY_ERROR)
		{
			uart->status = UART_STATUS_PARITY_ERROR;
		}
		if((uart->status != UART_STATUS_OK) && uart->cfg.ignore_error != UART_ERROR_IGNORE)
		{
			drv_uart_logic_reset(uart);
			*data = 0x00;// null
			return TRUE;	
		}
	
		while(REG_GETBITS(uart->regs->fifo_sta, 0, 4) != 0)
		{
			*data = uart->regs->rx_data;
			return FALSE;	
		}
		timeout--;
	}
	return 2;	
}

//===============================================
// uart rx using interrupt method
//===============================================

void drv_uart_rx_data_it(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length)
{
	uart->rx_data = data;
	uart->rx_num = length;
	uart->rx_ptr = 0;
	drv_uart_int_enable(uart, UART_INT_RX_STOP_ERROR | UART_INT_RX_PARITY_ERROR | UART_INT_RX_FIFO_NOEMPTY | UART_INT_RX_FIFO_THRES);
}

//===============================================
// uart weak function
//===============================================

void __attribute__((weak)) uart_int_tx_done_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_stop_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_parity_error_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_stop_error_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_noise_detect_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_stop_detect_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_tx_fifo_empty_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_tx_fifo_thres_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_fifo_noempty_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

void __attribute__((weak)) uart_int_rx_fifo_thres_callback(UART_HandleTypeDef *uart)
{
	UNUSED(uart);
	return;
}

//===============================================
// uart interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_uart_interrupt_handler(UART_HandleTypeDef *uart)
{
	uint16_t status;
	status = drv_uart_int_get(uart) & uart->regs->int_en;
//	status = drv_uart_int_get(uart);
	
	if(status & UART_INT_TX_DONE)
	{
		uart_int_tx_done_callback(uart);
		drv_uart_int_clear(uart, UART_INT_TX_DONE);
	}
	if(status & UART_INT_RX_STOP_ERROR)
	{
		uart->status = UART_STATUS_STOP_ERROR;
		if(uart->cfg.ignore_error != UART_ERROR_IGNORE)
		{
			drv_uart_int_disable(uart, UART_INT_RX_STOP_ERROR | UART_INT_RX_PARITY_ERROR | UART_INT_RX_FIFO_NOEMPTY | UART_INT_RX_FIFO_THRES);
			drv_uart_logic_reset(uart);
		}
		uart_int_rx_stop_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_STOP_ERROR);
	}
	if(status & UART_INT_RX_PARITY_ERROR)
	{
		uart->status = UART_STATUS_PARITY_ERROR;
		if(uart->cfg.ignore_error != UART_ERROR_IGNORE)
		{
			drv_uart_int_disable(uart, UART_INT_RX_STOP_ERROR | UART_INT_RX_PARITY_ERROR | UART_INT_RX_FIFO_NOEMPTY | UART_INT_RX_FIFO_THRES);
			drv_uart_logic_reset(uart);
		}
		uart_int_rx_parity_error_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_PARITY_ERROR);
	}
	if(status & UART_INT_RX_NOISE_DETECT)
	{
		uart_int_rx_noise_detect_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_NOISE_DETECT);
	}
	if(status & UART_INT_RX_STOP_DETECT)
	{
		uart_int_rx_stop_detect_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_STOP_DETECT);
	}
	if(status & UART_INT_TX_FIFO_THRES)
	{
		uart_int_tx_fifo_thres_callback(uart);
		drv_uart_int_clear(uart, UART_INT_TX_FIFO_THRES);
	}
	if(status & UART_INT_TX_FIFO_EMPTY)
	{
		uart_int_tx_fifo_empty_callback(uart);
		drv_uart_int_clear(uart, UART_INT_TX_FIFO_EMPTY);
	}
	if(status & UART_INT_RX_FIFO_THRES)
	{
		if(uart->rx_ptr < uart->rx_num)
		{
			while(REG_GETBITS(uart->regs->fifo_sta, 0, 4) != 0)
			{
				uart->rx_data[uart->rx_ptr++] = uart->regs->rx_data;
			}
		}
		else
		{
			drv_uart_int_disable(uart, UART_INT_RX_FIFO_NOEMPTY | UART_INT_RX_FIFO_THRES);
		}
		uart_int_rx_fifo_thres_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_FIFO_THRES);
	}
	if(status & UART_INT_RX_FIFO_NOEMPTY)
	{
		if(uart->rx_ptr < uart->rx_num)
		{
			while(REG_GETBITS(uart->regs->fifo_sta, 0, 4) != 0)
			{
				uart->rx_data[uart->rx_ptr++] = uart->regs->rx_data;
			}
		}
		else
		{
			drv_uart_int_disable(uart, UART_INT_RX_FIFO_NOEMPTY | UART_INT_RX_FIFO_THRES);
		}
		uart_int_rx_fifo_noempty_callback(uart);
		drv_uart_int_clear(uart, UART_INT_RX_FIFO_NOEMPTY);
	}
}

#endif


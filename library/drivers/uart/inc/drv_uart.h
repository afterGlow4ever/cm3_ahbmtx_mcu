//===============================================
//
//	File: drv_uart.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12272023
//	Version: v1.0
//
// 	This is header file for uart driver.
//
//===============================================

#ifndef __DRV_UART_H_
#define __DRV_UART_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define UART_INT_TX_FIFO_THRES					(1<<0)
#define UART_INT_TX_FIFO_EMPTY					(1<<1)
#define UART_INT_RX_FIFO_THRES					(1<<2)
#define UART_INT_RX_FIFO_NOEMPTY				(1<<3)
#define UART_INT_RX_STOP_DETECT					(1<<4)
#define UART_INT_RX_NOISE_DETECT				(1<<5)
#define UART_INT_RX_STOP_ERROR					(1<<6)
#define UART_INT_RX_PARITY_ERROR				(1<<7)
#define UART_INT_TX_DONE						(1<<8)

#define UART_FIFO_NUM							16

//===============================================
// uart regs
//===============================================

typedef struct
{
	volatile uint32_t tx_data;
	volatile uint32_t top_ctrl;
	volatile uint32_t pe_ctrl;
	volatile uint32_t int_en;
	volatile uint32_t int_clr;
	volatile uint32_t fifo_sta;
	volatile uint32_t int_sta;
	volatile uint32_t rx_data;
}UART_TypeDef;

//===============================================
// uart enum
//===============================================

typedef enum
{
	UART_ERROR_DISCARD_DATA,
	UART_ERROR_IGNORE,
}uart_error_ignore;

typedef enum
{
	UART_STOP_1_BIT,
	UART_STOP_2_BITS,
}uart_stop_bit;

typedef enum
{
	UART_PARITY_ODD,
	UART_PARITY_EVEN,
	UART_PARITY_FIXED_0,
	UART_PARITY_FIXED_1,
}uart_parity_bit;

typedef enum
{
	UART_PARITY_DISABLE,
	UART_PARITY_ENABLE,
}uart_parity_en;

typedef enum
{
	UART_DATA_7_BITS,
	UART_DATA_8_BITS,
	UART_DATA_9_BITS,
	UART_DATA_10_BITS,
}uart_data_bit;

typedef enum
{
	UART_STATUS_OK,
	UART_STATUS_STOP_ERROR,
	UART_STATUS_PARITY_ERROR,
}uart_status;

//===============================================
// uart handler
//===============================================

typedef struct
{
	uint32_t baudrate;
	uint8_t oversampling;
	uint8_t interval_bit;
	uart_error_ignore ignore_error;
	uart_stop_bit stop_bit;
	uart_parity_en parity_en;
	uart_parity_bit parity_bit;
	uart_data_bit data_bit;
}UART_FunctionCfg;

typedef struct
{
	UART_TypeDef *regs;
	UART_FunctionCfg cfg;
	uart_status status;
	uint8_t id;
	uint8_t tx_ptr;
	uint8_t rx_ptr;
	uint16_t *rx_data;
	uint8_t rx_num;
}UART_HandleTypeDef;


//===============================================
// uart inline function
//===============================================

static inline void drv_uart_tx_fifo_watermark_set(UART_HandleTypeDef *uart, uint8_t fifo_threshold)
{
	REG_SETBITS(uart->regs->top_ctrl, 24, 28, fifo_threshold);
}

static inline void drv_uart_rx_fifo_watermark_set(UART_HandleTypeDef *uart, uint8_t fifo_threshold)
{
	REG_SETBITS(uart->regs->top_ctrl, 16, 20, fifo_threshold);
}

static inline void drv_uart_logic_reset(UART_HandleTypeDef *uart)
{
	uart->status = UART_STATUS_OK;
	uart->tx_ptr = 0;
	uart->rx_ptr = 0;
	REG_SETBIT(uart->regs->top_ctrl, 8, 1);//rx logic clear
	REG_SETBIT(uart->regs->top_ctrl, 8, 0);//rx logic clear
	REG_SETBIT(uart->regs->top_ctrl, 9, 1);//tx logic clear
	REG_SETBIT(uart->regs->top_ctrl, 9, 0);//tx logic clear
	REG_SETBIT(uart->regs->top_ctrl, 10, 1);//rx fifo clear
	REG_SETBIT(uart->regs->top_ctrl, 10, 0);//rx fifo clear
	REG_SETBIT(uart->regs->top_ctrl, 11, 1);//tx fifo clear
	REG_SETBIT(uart->regs->top_ctrl, 11, 0);//tx fifo clear
}

static inline void drv_uart_rx_enable(UART_HandleTypeDef *uart)
{
	REG_SETBIT(uart->regs->top_ctrl, 1, 1);
}

static inline void drv_uart_rx_disable(UART_HandleTypeDef *uart)
{
	REG_SETBIT(uart->regs->top_ctrl, 1, 0);
}

static inline void drv_uart_config_update(UART_HandleTypeDef *uart)
{
	REG_SETBIT(uart->regs->top_ctrl, 0, 1);
	REG_SETBIT(uart->regs->top_ctrl, 0, 0);
}

static inline void drv_uart_int_enable(UART_HandleTypeDef *uart, uint32_t uart_int)
{
	uart->regs->int_en |= uart_int;
}

static inline void drv_uart_int_disable(UART_HandleTypeDef *uart, uint32_t uart_int)
{
	uart->regs->int_en &= ~uart_int;
}

static inline void drv_uart_int_clear(UART_HandleTypeDef *uart, uint32_t uart_int)
{
	uart->regs->int_clr |= uart_int;
	uart->regs->int_clr = 0;
}

static inline void drv_uart_int_allclear(UART_HandleTypeDef *uart)
{
	uart->regs->int_clr = 0x1ff;
	uart->regs->int_clr = 0;
}

static inline uint32_t drv_uart_int_get(UART_HandleTypeDef *uart)
{
	return uart->regs->int_sta;
}

static inline uint8_t drv_uart_tx_fifo_num_get(UART_HandleTypeDef *uart)
{
	return REG_GETBITS(uart->regs->fifo_sta, 8, 12);
}

static inline uint8_t drv_uart_rx_fifo_num_get(UART_HandleTypeDef *uart)
{
	return REG_GETBITS(uart->regs->fifo_sta, 0, 4);
}

//===============================================
// uart driver function header
//===============================================

void drv_uart_default_config(UART_HandleTypeDef *uart);
bool drv_uart_set_config(UART_HandleTypeDef *uart);
bool drv_uart_init(UART_HandleTypeDef *uart);
void drv_uart_deinit(UART_HandleTypeDef *uart);
void drv_uart_tx_data(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length);
void drv_uart_putchar(UART_HandleTypeDef *uart, uint8_t *data);
void drv_uart_putchars(UART_HandleTypeDef *uart, uint8_t data[], uint8_t length);
bool drv_uart_rx_data(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length);
bool drv_uart_getchar(UART_HandleTypeDef *uart, uint8_t *data);
uint8_t drv_uart_getchar_timeout(UART_HandleTypeDef *uart, uint8_t *data, uint32_t timeout);
void drv_uart_rx_data_it(UART_HandleTypeDef *uart, uint16_t data[], uint8_t length);
void drv_uart_interrupt_handler(UART_HandleTypeDef *uart);

#endif


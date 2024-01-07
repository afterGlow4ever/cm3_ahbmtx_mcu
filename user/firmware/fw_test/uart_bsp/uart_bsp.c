//===============================================
//
//	File: uart_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01032024
//	Version: v1.0
//
// 	This is uart bsp source file.
//
//===============================================

#include "uart_bsp.h"

UART_HandleTypeDef huart0;
UART_HandleTypeDef huart1;

//===============================================
// uart init
//===============================================

void uart0_init(void)
{
	huart0.regs = UART0;
	drv_uart_default_config(&huart0);
//	huart0.cfg.ignore_error = 1;
	drv_uart_init(&huart0);
}

void uart1_init(void)
{
	huart1.regs = UART1;
	drv_uart_default_config(&huart1);
	drv_uart_init(&huart1);
}

//===============================================
// printf wrap
//===============================================

// this is used to printf a string
void test_printf_s(char *s)
{
#ifdef SIM
#else
	drv_uart_printf(s);
#endif
}

// this is used to printf a string with a char
void test_printf_ch(char *s, uint32_t ch)
{
#ifdef SIM
#else
	drv_uart_printf(s, ch);
#endif
}


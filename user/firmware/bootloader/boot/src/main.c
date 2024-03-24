//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08182023
//	Version: v1.0
//
// 	This is bootloader for mcu in itcm.
//	Including:
//	1. system init
//
//===============================================

#include "main.h"

UART_HandleTypeDef huart0;

int main(void)
{
	uint8_t ch;

	huart0.regs = UART0;
	drv_uart_default_config(&huart0);
	drv_uart_init(&huart0);
	drv_uart_printf("Engine is operative, hello and goodbye.\r\n");
	writereg32(0x40000000, 0xed);
	while(1)
	{
		drv_uart_getchar(&huart0, &ch);
		drv_uart_putchar(&huart0, &ch);
	}
}


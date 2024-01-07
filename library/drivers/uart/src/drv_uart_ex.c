//===============================================
//
//	File: drv_uart_ex.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01062024
//	Version: v1.0
//
// 	This is source file for uart extented driver.
//
//===============================================

#include "drv_uart.h"
#include "drv_uart_ex.h"

#ifdef UART_EX_DRIVER

extern UART_HandleTypeDef PRINTF_HUART;

//===============================================
// uart printf
//===============================================

int vprintf(const char *fmt, va_list argp)
{
	char string[64];
	if(vsprintf(string, fmt, argp) > 0)
	{
		drv_uart_putchars(&PRINTF_HUART, (uint8_t *)string, strlen(string));
	}
	return strlen(string);
}

void drv_uart_printf(const char *fmt, ...)
{
	va_list argp;
	va_start(argp, fmt);
	vprintf(fmt, argp);
	va_end(argp);
}

#endif


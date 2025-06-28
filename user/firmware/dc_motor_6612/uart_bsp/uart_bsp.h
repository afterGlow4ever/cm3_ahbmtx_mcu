//===============================================
//
//	File: uart_bsp.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01032024
//	Version: v1.0
//
// 	This is uart bsp header file.
//
//===============================================

#ifndef _UART_BSP_H_
#define _UART_BSP_H_

#include "main.h"

void uart0_init(void);

void test_printf_s(char *s);
void test_printf_ch(char *s, uint32_t ch);

#endif


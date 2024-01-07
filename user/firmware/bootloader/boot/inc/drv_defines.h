//===============================================
//
//	File: drv_defines.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01032024
//	Version: v1.0
//
// 	This is driver define config.
//
//===============================================

#ifndef _DRV_DEFINES_H_
#define _DRV_DEFINES_H_

//===============================================
// common define
//===============================================

#define UART_CLK 40000000

//===============================================
// printf uart define
//===============================================

#define PRINTF_HUART huart0

//===============================================
// driver enable list
//===============================================

//#define UART_DRIVER
//#define COMMON_DRIVER

//===============================================
// driver header list
//===============================================

#ifdef COMMON_DRIVER
#include "drv_common.h"
#endif
#ifdef UART_DRIVER
#include "drv_uart.h"
#endif
#ifdef UART_EX_DRIVER
#include "drv_uart_ex.h"
#endif

#endif


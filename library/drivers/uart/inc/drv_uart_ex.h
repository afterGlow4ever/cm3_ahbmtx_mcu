//===============================================
//
//	File: drv_uart_ex.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01062024
//	Version: v1.0
//
// 	This is header file for uart extented driver.
//
//===============================================

#ifndef __DRV_UART_EX_H_
#define __DRV_UART_EX_H_

#include "mcu_operation.h"
#include "drv_defines.h"
#include "stdio.h"
#include "stdarg.h"
#include "string.h"

//===============================================
// uart driver function header
//===============================================

void drv_uart_printf(const char *fmt, ...);

#endif


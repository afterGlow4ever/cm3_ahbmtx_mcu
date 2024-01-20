//===============================================
//
//	File: gpio_bsp.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01202024
//	Version: v1.0
//
// 	This is gpio bsp header file.
//
//===============================================

#ifndef _GPIO_BSP_H_
#define _GPIO_BSP_H_

#include "main.h"

void gpioa2_init(void);
void gpioa3_init(void);
void gpioa3_int_init(void);
void gpioa2_deinit(void);
void gpioa3_deinit(void);

#endif


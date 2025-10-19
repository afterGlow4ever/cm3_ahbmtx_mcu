//===============================================
//
//	File: spim_bsp.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is spi master bsp header file.
//
//===============================================

#ifndef _SPIM_BSP_H_
#define _SPIM_BSP_H_

#include "main.h"

void spim_init(uint8_t clkdiv, uint8_t mode, uint8_t tl);
void spim_deinit(void);

#endif


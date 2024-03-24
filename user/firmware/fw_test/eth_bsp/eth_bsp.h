//===============================================
//
//	File: eth_bsp.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is ethernet bsp header file.
//
//===============================================

#ifndef _ETH_BSP_H_
#define _ETH_BSP_H_

#include "main.h"

#define B50610_PHY_ADDRESS						0x19

void eth_sma_init(void);
void b50610_init(void);
void b50610_set_config(void);
void b50610_set_swrst(void);
void b50610_get_status(void);

#endif


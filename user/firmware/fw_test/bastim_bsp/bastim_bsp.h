//===============================================
//
//	File: bastim_bsp.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01272024
//	Version: v1.0
//
// 	This is basic timer bsp header file.
//
//===============================================

#ifndef _BASTIM_BSP_H_
#define _BASTIM_BSP_H_

#include "main.h"

void bastim_ch0_init(void);
void bastim_ch1_init(void);
void bastim_ch2_init(void);
void bastim_ch3_init(void);
void bastim_ch0_int_init(void);
void bastim_ch1_int_init(void);
void bastim_ch2_int_init(void);
void bastim_ch3_int_init(void);
void bastim_ch0_deinit(void);
void bastim_ch1_deinit(void);
void bastim_ch2_deinit(void);
void bastim_ch3_deinit(void);

#endif


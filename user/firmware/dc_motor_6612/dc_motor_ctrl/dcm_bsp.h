//===============================================
//
//	File: bldc_bsp.h
//	Author: afterGlow,4ever
//	Date: 06252022
//	Version: v1.0
//
// 	This file is for transplant.
//
//===============================================

#ifndef __DCM_BSP_H_
#define __DCM_BSP_H_

#include "main.h"

//===============================================
// pwm section
// advtimr clk 80MHz
// psc=2 arr=4000
// Each count is 25ns.
// Each period is 100us, 10kHz.
//===============================================

#define DCM_PWM_PERIOD_COUNT     			4000
#define DCM_PWM_PRESCALER_COUNT     		2
#define DCM_PWM_DEADZONE_TIME				4
#define DCM_PWM_INITIAL_COMPARE_VALUE		72

//===============================================
// fault section
//===============================================

#define DCM_FAULT_DETECTION_DELAY_TIME		4

//===============================================
// encoder section
// advtimr clk 80MHz
// arr=40000
// Each count is 12.5ns.
// Each period is 500us, 2kHz.
// Speed loop timer is here.
//===============================================

#define DCM_ENCODER_PERIOD_COUNT     		4000000
#define DCM_ENCODER_DELAY_TIME				8

//===============================================
// sd
//===============================================





#endif


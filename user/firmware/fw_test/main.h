//===============================================
//
//	File: main.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04012024
//	Version: v1.0
//
// 	This is test fw include file.
//
//===============================================

#ifndef _MAIN_H_
#define _MAIN_H_

#include "mcu.h"
#include "mcu_operation.h"
#include "core_cm3.h"
#include "drv_defines.h"
//#include "design_define.h"
#include "string.h"

//===============================================
// testmenu
//===============================================

typedef struct Menu
{
	char ch;
	void (*pFun)(void);
	uint8_t str[128];
}TestMenu;

void show_testmenu(TestMenu menu[], uint8_t num);
void test_execute(TestMenu menu[], uint8_t num);
uint8_t exit_current_test_detection(void);
void exit_current_test_loop(void);
void mcu_testmenu(void);

//===============================================
// including test define
//===============================================

//#define SIM
//#define UART_TEST
//#define GPIO_TEST
//#define BASTIM_TEST
//#define ETH_TEST

//===============================================
// including bsp header files
//===============================================

#include "uart_bsp.h"
#ifdef GPIO_DRIVER
#include "gpio_bsp.h"
#endif
#ifdef BASTIM_DRIVER
#include "bastim_bsp.h"
#endif
#ifdef ETH_DRIVER
#include "eth_bsp.h"
#endif
#ifdef ADVTIM_DRIVER
#include "advtim_bsp.h"
#endif

//===============================================
// including test header files
//===============================================

#include "uart_test.h"
#ifdef GPIO_TEST
#include "gpio_test.h"
#endif
#ifdef BASTIM_TEST
#include "bastim_test.h"
#endif
#ifdef ETH_TEST
#include "eth_test.h"
#endif
#ifdef ADVTIM_TEST
#include "advtim_test.h"
#endif

#endif


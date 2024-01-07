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
#include "string.h"

//===============================================
// testmenu
//===============================================

typedef struct Menu
{
	char ch;
	void (*pFun)(void);
	uint8_t str[64];
}TestMenu;

void show_testmenu(TestMenu menu[], uint8_t num);
void test_execute(TestMenu menu[], uint8_t num);
uint8_t exit_current_test(void);
void mcu_testmenu(void);

//===============================================
// including bsp header files
//===============================================

#include "uart_bsp.h"

//===============================================
// including test header files
//===============================================

#include "uart_test.h"

//===============================================
// including test define
//===============================================

//#define SIM
//#define UART_TEST

#endif


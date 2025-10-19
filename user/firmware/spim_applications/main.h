//===============================================
//
//	File: main.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10072025
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

//===============================================
// including spi master cases related header files
//===============================================

//#include "gd25lb256e.h"
#include "spim_gd25lb256e.h"

//===============================================
// including other bsp header files
//===============================================

#include "uart_bsp.h"

#endif


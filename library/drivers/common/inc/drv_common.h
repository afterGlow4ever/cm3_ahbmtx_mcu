//===============================================
//
//	File: drv_common.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12302023
//	Version: v1.0
//
// 	This is header file for common function driver.
//
//===============================================

#ifndef __DRV_COMMON_H_
#define __DRV_COMMON_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================


//===============================================
// common inline function
//===============================================


//===============================================
// common driver function header
//===============================================

bool drv_check_data(uint32_t address, uint32_t data);
bool drv_check_rw_data(uint32_t address, uint32_t wdata, uint32_t rdata);

#endif


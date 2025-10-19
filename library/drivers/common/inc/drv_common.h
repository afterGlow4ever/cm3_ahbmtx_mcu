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
void drv_byte_data_array_clear(uint8_t *data, uint32_t length);
void drv_halfword_data_array_clear(uint16_t *data, uint32_t length);
void drv_word_data_array_clear(uint32_t *data, uint32_t length);
void drv_dual_byte_data_array_clear(uint8_t *data0, uint8_t *data1, uint32_t length);
void drv_dual_halfword_data_array_clear(uint16_t *data0, uint16_t *data1, uint32_t length);
void drv_dual_word_data_array_clear(uint32_t *data0, uint32_t *data1, uint32_t length);

#endif


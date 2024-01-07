//===============================================
//
//	File: drv_common.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 12272023
//	Version: v1.0
//
// 	This is source file for common function driver.
//
//===============================================

#include "drv_common.h"

#ifdef COMMON_DRIVER

//===============================================
// address read check
// return value:
// FALSE 0: data checked
// TRUE 1: data error
//===============================================

bool drv_check_data(uint32_t address, uint32_t data)
{
	if(readreg32(address) == data)
	{
		writereg32(DEBUG_BASE_ADDR, 0);
		return FALSE;
	}
	else
	{
		writereg32(DEBUG_BASE_ADDR, 1);
		writereg32(DEBUG_BASE_ADDR, readreg32(DEBUG_BASE_ADDR+0x04)+1);
		return TRUE;
	}
}

//===============================================
// address write & read check
// FALSE 0: data checked
// TRUE 1: data error
//===============================================

bool drv_check_rw_data(uint32_t address, uint32_t wdata, uint32_t rdata)
{
	writereg32(address, wdata);
	if(readreg32(address) == rdata)
	{
		writereg32(DEBUG_BASE_ADDR, 0);
		return FALSE;
	}
	else
	{
		writereg32(DEBUG_BASE_ADDR, 1);
		writereg32(DEBUG_BASE_ADDR, readreg32(DEBUG_BASE_ADDR+0x04)+1);
		return TRUE;
	}
}

#endif


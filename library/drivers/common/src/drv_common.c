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
	if(readreg32(address) == rdata)// 01052025 cody, rdata can be instead of wdata
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
// data array clear
//===============================================

void drv_byte_data_array_clear(uint8_t *data, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
		data[i] = 0x00;
}

void drv_halfword_data_array_clear(uint16_t *data, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
		data[i] = 0x0000;
}

void drv_word_data_array_clear(uint32_t *data, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
		data[i] = 0x00000000;
}

void drv_dual_byte_data_array_clear(uint8_t *data0, uint8_t *data1, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
	{
		data0[i] = 0x00;
		data1[i] = 0x00;
	}
}

void drv_dual_halfword_data_array_clear(uint16_t *data0, uint16_t *data1, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
	{
		data0[i] = 0x0000;
		data1[i] = 0x0000;
	}
}

void drv_dual_word_data_array_clear(uint32_t *data0, uint32_t *data1, uint32_t length)
{
	uint32_t i;

	for(i=0;i<length;i++)
	{
		data0[i] = 0x00000000;
		data1[i] = 0x00000000;
	}
}


#endif


//===============================================
//
//	File: mcu_operation.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08182023
//	Version: v1.0
//
// 	This is base operation for mcu.
//
//===============================================

#ifndef __MCU_OPERATION_H_
#define __MCU_OPERATION_H_

#include <stdint.h>
#include "mcu.h"

//===============================================
// write or read register by byte
//===============================================

#define writereg32(addr, data)					(*(volatile uint32_t *)(addr) = data)
#define writereg16(addr, data)					(*(volatile uint16_t *)(addr) = data)
#define writereg8(addr, data)					(*(volatile uint8_t *)(addr) = data)
#define readreg32(addr)							(*(volatile uint32_t *)(addr))
#define readreg16(addr)							(*(volatile uint16_t *)(addr))
#define readreg8(addr)							(*(volatile uint8_t *)(addr))

//===============================================
// write or read register by bit
//===============================================

#define BIT(x)									((uint32_t)((uint32_t)1<<((uint32_t)(x))))
#define BITS(start, end)						((0xFFFFFFFF<<((uint32_t)(start)))&(0xFFFFFFFF>>((uint32_t)31-((uint32_t)(end)))))
#define GETBIT(addr, x)							((readreg32(addr)&BIT((uint32_t)(x)))>>((uint32_t)(x)))
#define GETBITS(addr, start, end)				((readreg32(addr)&BITS((uint32_t)(start),(uint32_t)(end)))>>((uint32_t)(start)))
#define CLEARBIT(addr, x)						(readreg32(addr)&(~BIT((uint32_t)(x))))
#define CLEARBITS(addr, start, end)				(readreg32(addr)&(~BITS((uint32_t)(start),(uint32_t)(end))))
#define SETBIT(addr, x, data)					(writereg32(addr,(CLEARBIT((uint32_t)(addr),(uint32_t)(x))|((uint32_t)(data)<<((uint32_t)(x))))))
#define SETBITS(addr, start, end, data)			(writereg32(addr,(CLEARBITS((uint32_t)(addr),(uint32_t)(start),(uint32_t)(end))|((uint32_t)(data)<<((uint32_t)(start))))))

//===============================================
// write or read register by register pointer
//===============================================

#define REG_WRITE(reg, data)					(reg=data)
#define REG_READ(reg)							(reg)
#define REG_GETBIT(reg, x)						((reg&BIT((uint32_t)(x)))>>((uint32_t)(x)))
#define REG_GETBITS(reg, start, end)			((reg&BITS((uint32_t)(start),(uint32_t)(end)))>>((uint32_t)(start)))
#define REG_CLEARBIT(reg, x)					(reg&(~BIT((uint32_t)(x))))
#define REG_CLEARBITS(reg, start, end)			(reg&(~BITS((uint32_t)(start),(uint32_t)(end))))
#define REG_SETBIT(reg, x, data)				(REG_WRITE(reg,(REG_CLEARBIT(reg,(uint32_t)(x))|((uint32_t)(data)<<((uint32_t)(x))))))
#define REG_SETBITS(reg, start, end, data)		(REG_WRITE(reg,(REG_CLEARBITS(reg,(uint32_t)(start),(uint32_t)(end))|((uint32_t)(data)<<((uint32_t)(start))))))

#endif


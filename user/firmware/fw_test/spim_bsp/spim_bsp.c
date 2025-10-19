//===============================================
//
//	File: spim_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is spi master bsp source file.
//
//===============================================

#include "spim_bsp.h"

SPIM_HandleTypeDef hspim;

//===============================================
// spi master init & deinit
//===============================================

void spim_init(uint8_t clkdiv, uint8_t mode, uint8_t tl)
{
	hspim.regs = SPIM;
	hspim.cfg.mode = mode;
	hspim.cfg.clkdiv = clkdiv;
	hspim.cfg.tls = tl;
	hspim.cfg.tle = tl;
	hspim.cfg.ti = tl;

	drv_spim_init(&hspim);
}

void spim_deinit(void)
{
	drv_spim_deinit(&hspim);
}


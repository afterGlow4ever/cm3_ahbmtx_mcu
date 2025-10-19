//===============================================
//
//	File: spim_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10052025
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

void spim_init(void)
{
	hspim.regs = SPIM;
	hspim.cfg.mode = 0;
	hspim.cfg.clkdiv = 4;
	hspim.cfg.tls = 2;
	hspim.cfg.tle = 2;
	hspim.cfg.ti = 2;

	drv_spim_init(&hspim);
}

void spim_deinit(void)
{
	drv_spim_deinit(&hspim);
}


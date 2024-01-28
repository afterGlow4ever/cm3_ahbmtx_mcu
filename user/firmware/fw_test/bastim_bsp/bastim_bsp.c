//===============================================
//
//	File: bastim_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01272024
//	Version: v1.0
//
// 	This is basic timer bsp source file.
//
//===============================================

#include "bastim_bsp.h"

BASTIM_ChannelCfg bastim_ch0;
BASTIM_ChannelCfg bastim_ch1;
BASTIM_ChannelCfg bastim_ch2;
BASTIM_ChannelCfg bastim_ch3;

//===============================================
// gpio init
//===============================================

void bastim_ch0_init(void)
{
	bastim_ch0.channel = BASTIM_CHANNEL_0;
	bastim_ch0.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch0.arr = 20;
	bastim_ch0.psc = 20;
	bastim_ch0.startcnt = 10;
	drv_bastim_init(BASTIM, &bastim_ch0);
}

void bastim_ch1_init(void)
{
	bastim_ch1.channel = BASTIM_CHANNEL_1;
	bastim_ch1.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch1.arr = 20;
	bastim_ch1.psc = 10;
	bastim_ch1.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch1);
}

void bastim_ch2_init(void)
{
	bastim_ch2.channel = BASTIM_CHANNEL_2;
	bastim_ch2.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch2.arr = 10;
	bastim_ch2.psc = 20;
	bastim_ch2.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch2);
}

void bastim_ch3_init(void)
{
	bastim_ch3.channel = BASTIM_CHANNEL_3;
	bastim_ch3.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch3.arr = 15;
	bastim_ch3.psc = 15;
	bastim_ch3.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch3);
}

void bastim_ch0_int_init(void)
{
	bastim_ch0.channel = BASTIM_CHANNEL_0;
	bastim_ch0.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch0.arr = 20;
	bastim_ch0.psc = 20;
	bastim_ch0.startcnt = 10;
	drv_bastim_init(BASTIM, &bastim_ch0);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_0);
}

void bastim_ch1_int_init(void)
{
	bastim_ch1.channel = BASTIM_CHANNEL_1;
	bastim_ch1.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch1.arr = 20;
	bastim_ch1.psc = 10;
	bastim_ch1.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch1);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_1);
}

void bastim_ch2_int_init(void)
{
	bastim_ch2.channel = BASTIM_CHANNEL_2;
	bastim_ch2.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch2.arr = 10;
	bastim_ch2.psc = 20;
	bastim_ch2.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch2);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_2);
}

void bastim_ch3_int_init(void)
{
	bastim_ch3.channel = BASTIM_CHANNEL_3;
	bastim_ch3.autoreload = BASTIM_CH_AUTORELOAD_ENABLE;
	bastim_ch3.arr = 15;
	bastim_ch3.psc = 15;
	bastim_ch3.startcnt = 0;
	drv_bastim_init(BASTIM, &bastim_ch3);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_3);
}

void bastim_ch0_deinit(void)
{
	drv_bastim_deinit(BASTIM, &bastim_ch0);
}

void bastim_ch1_deinit(void)
{
	drv_bastim_deinit(BASTIM, &bastim_ch1);
}

void bastim_ch2_deinit(void)
{
	drv_bastim_deinit(BASTIM, &bastim_ch2);
}

void bastim_ch3_deinit(void)
{
	drv_bastim_deinit(BASTIM, &bastim_ch3);
}


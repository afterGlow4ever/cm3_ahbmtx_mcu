//===============================================
//
//	File: drv_bastim.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 02272024
//	Version: v1.0
//
// 	This is source file for basic timer function driver.
//
//===============================================

#include "drv_bastim.h"

#ifdef BASTIM_DRIVER

//===============================================
// bastim init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

bool drv_bastim_set_config(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch)
{
	bool reg_temp = FALSE;

	switch(bastim_ch->channel)
	{
		case BASTIM_CHANNEL_0:
		{
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->top0_ctrl)), (bastim_ch->autoreload << 2), (bastim_ch->autoreload << 2)); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch0_ctrl)), (bastim_ch->psc << 16) | bastim_ch->arr, (bastim_ch->psc << 16) | bastim_ch->arr); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch0_ctrl1)), bastim_ch->startcnt, bastim_ch->startcnt); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->top1_ctrl)), (bastim_ch->autoreload << 2), (bastim_ch->autoreload << 2)); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch1_ctrl)), (bastim_ch->psc << 16) | bastim_ch->arr, (bastim_ch->psc << 16) | bastim_ch->arr); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch1_ctrl1)), bastim_ch->startcnt, bastim_ch->startcnt); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->top2_ctrl)), (bastim_ch->autoreload << 2), (bastim_ch->autoreload << 2)); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch2_ctrl)), (bastim_ch->psc << 16) | bastim_ch->arr, (bastim_ch->psc << 16) | bastim_ch->arr); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch2_ctrl1)), bastim_ch->startcnt, bastim_ch->startcnt); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->top3_ctrl)), (bastim_ch->autoreload << 2), (bastim_ch->autoreload << 2)); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch3_ctrl)), (bastim_ch->psc << 16) | bastim_ch->arr, (bastim_ch->psc << 16) | bastim_ch->arr); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch3_ctrl1)), bastim_ch->startcnt, bastim_ch->startcnt); 
		}
		break;
		default:
		{
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->top0_ctrl)), (bastim_ch->autoreload << 2), (bastim_ch->autoreload << 2)); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch0_ctrl)), (bastim_ch->psc << 16) | bastim_ch->arr, (bastim_ch->psc << 16) | bastim_ch->arr); 
			reg_temp |= drv_check_rw_data((uint32_t)(&(bastim->ch0_ctrl1)), bastim_ch->startcnt, bastim_ch->startcnt); 
		}
		break;
	}

	return reg_temp;
}

bool drv_bastim_init(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch)
{
	bool status;

	status = drv_bastim_set_config(bastim, bastim_ch);
	drv_bastim_config_update(bastim, bastim_ch->channel);
	drv_bastim_int_clear(bastim, bastim_ch->channel);

	return status;
}

void drv_bastim_deinit(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch)
{
	drv_bastim_channel_disable(bastim, bastim_ch->channel);
	drv_bastim_int_clear(bastim, bastim_ch->channel);
}

//===============================================
// bastim weak function
//===============================================

void __attribute__((weak)) bastim_channel0_int_callback(BASTIM_TypeDef *bastim)
{
	UNUSED(bastim);
	return;
}

void __attribute__((weak)) bastim_channel1_int_callback(BASTIM_TypeDef *bastim)
{
	UNUSED(bastim);
	return;
}

void __attribute__((weak)) bastim_channel2_int_callback(BASTIM_TypeDef *bastim)
{
	UNUSED(bastim);
	return;
}

void __attribute__((weak)) bastim_channel3_int_callback(BASTIM_TypeDef *bastim)
{
	UNUSED(bastim);
	return;
}

//===============================================
// bastim interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_bastim_channel0_interrupt_handler(BASTIM_TypeDef *bastim)
{
	uint16_t status, mask;
	mask = 1 << BASTIM_CHANNEL_0;
	status = drv_bastim_int_get(bastim) & bastim->int_en & mask;

	if(status & (1 << BASTIM_CHANNEL_0))
	{
		bastim_channel0_int_callback(bastim);
		drv_bastim_int_clear(bastim, BASTIM_CHANNEL_0);
	}
}

void drv_bastim_channel1_interrupt_handler(BASTIM_TypeDef *bastim)
{
	uint16_t status, mask;
	mask = 1 << BASTIM_CHANNEL_1;
	status = drv_bastim_int_get(bastim) & bastim->int_en & mask;

	if(status & (1 << BASTIM_CHANNEL_1))
	{
		bastim_channel1_int_callback(bastim);
		drv_bastim_int_clear(bastim, BASTIM_CHANNEL_1);
	}
}

void drv_bastim_channel2_interrupt_handler(BASTIM_TypeDef *bastim)
{
	uint16_t status, mask;
	mask = 1 << BASTIM_CHANNEL_2;
	status = drv_bastim_int_get(bastim) & bastim->int_en & mask;

	if(status & (1 << BASTIM_CHANNEL_2))
	{
		bastim_channel2_int_callback(bastim);
		drv_bastim_int_clear(bastim, BASTIM_CHANNEL_2);
	}
}

void drv_bastim_channel3_interrupt_handler(BASTIM_TypeDef *bastim)
{
	uint16_t status, mask;
	mask = 1 << BASTIM_CHANNEL_3;
	status = drv_bastim_int_get(bastim) & bastim->int_en & mask;

	if(status & (1 << BASTIM_CHANNEL_3))
	{
		bastim_channel3_int_callback(bastim);
		drv_bastim_int_clear(bastim, BASTIM_CHANNEL_3);
	}
}

#endif


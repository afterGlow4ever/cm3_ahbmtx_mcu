//===============================================
//
//	File: drv_bastim.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01272024
//	Version: v1.0
//
// 	This is header file for basic timer driver.
//
//===============================================

#ifndef __DRV_BASTIM_H_
#define __DRV_BASTIM_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define BASTIM_CHANNEL_3						(3)
#define BASTIM_CHANNEL_2						(2)
#define BASTIM_CHANNEL_1						(1)
#define BASTIM_CHANNEL_0						(0)

//===============================================
// bastim regs
//===============================================

typedef struct
{
	volatile uint32_t top0_ctrl;
	volatile uint32_t ch0_ctrl;
	volatile uint32_t ch0_ctrl1;
	volatile uint32_t rsv0;
	volatile uint32_t top1_ctrl;
	volatile uint32_t ch1_ctrl;
	volatile uint32_t ch1_ctrl1;
	volatile uint32_t rsv1;
	volatile uint32_t top2_ctrl;
	volatile uint32_t ch2_ctrl;
	volatile uint32_t ch2_ctrl1;
	volatile uint32_t rsv2;
	volatile uint32_t top3_ctrl;
	volatile uint32_t ch3_ctrl;
	volatile uint32_t ch3_ctrl1;
	volatile uint32_t rsv3;
	volatile uint32_t int_en;
	volatile uint32_t int_clr;
	volatile uint32_t int_sta;
}BASTIM_TypeDef;

//===============================================
// bastim enum
//===============================================

typedef enum
{
	BASTIM_CH_AUTORELOAD_DISABLE,
	BASTIM_CH_AUTORELOAD_ENABLE,
}bastim_autoreload;

//===============================================
// bastim handler
//===============================================

typedef struct
{
	uint8_t channel;
	bastim_autoreload autoreload;
	uint16_t arr;
	uint16_t psc;
	uint16_t startcnt;
}BASTIM_ChannelCfg;

//===============================================
// bastim inline function
//===============================================

static inline void drv_bastim_channel_enable(BASTIM_TypeDef *bastim, uint8_t bastim_channel)
{
	// write 1 before 0 in order to re enable when auto reload is disable
//	REG_SETBIT((uint32_t *)(&(bastim->top0_ctrl)+0x10*bastim_channel), 1, 0); 
//	REG_SETBIT((uint32_t *)(&(bastim->top0_ctrl)+0x10*bastim_channel), 1, 1); 
	switch(bastim_channel)
	{
		case BASTIM_CHANNEL_0:
		{
			REG_SETBIT(bastim->top0_ctrl, 1, 0); 
			REG_SETBIT(bastim->top0_ctrl, 1, 1); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			REG_SETBIT(bastim->top1_ctrl, 1, 0); 
			REG_SETBIT(bastim->top1_ctrl, 1, 1); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			REG_SETBIT(bastim->top2_ctrl, 1, 0); 
			REG_SETBIT(bastim->top2_ctrl, 1, 1); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			REG_SETBIT(bastim->top3_ctrl, 1, 0); 
			REG_SETBIT(bastim->top3_ctrl, 1, 1); 
		}
		break;
		default:
		{
			REG_SETBIT(bastim->top0_ctrl, 1, 0); 
			REG_SETBIT(bastim->top0_ctrl, 1, 1); 
		}
		break;
	}
}

static inline void drv_bastim_channel_disable(BASTIM_TypeDef *bastim, uint8_t bastim_channel)
{
//	REG_SETBIT((uint32_t *)(&(bastim->top0_ctrl)+0x10*bastim_channel), 1, 0); 
	switch(bastim_channel)
	{
		case BASTIM_CHANNEL_0:
		{
			REG_SETBIT(bastim->top0_ctrl, 1, 0); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			REG_SETBIT(bastim->top1_ctrl, 1, 0); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			REG_SETBIT(bastim->top2_ctrl, 1, 0); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			REG_SETBIT(bastim->top3_ctrl, 1, 0); 
		}
		break;
		default:
		{
			REG_SETBIT(bastim->top0_ctrl, 1, 0); 
		}
		break;
	}
}

static inline void drv_bastim_autoreload_set(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch, bastim_autoreload autoreload)
{
	bastim_ch->autoreload = autoreload;
	switch(bastim_ch->channel)
	{
		case BASTIM_CHANNEL_0:
		{
			REG_SETBIT(bastim->top0_ctrl, 2, autoreload); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			REG_SETBIT(bastim->top1_ctrl, 2, autoreload); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			REG_SETBIT(bastim->top2_ctrl, 2, autoreload); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			REG_SETBIT(bastim->top3_ctrl, 2, autoreload); 
		}
		break;
		default:
		{
			REG_SETBIT(bastim->top0_ctrl, 2, autoreload); 
		}
		break;
	}
}

static inline void drv_bastim_startcnt_set(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch, uint16_t startcnt)
{
	bastim_ch->startcnt = startcnt;
//	REG_SETBITS((uint32_t *)(&(bastim->ch0_ctrl1)+0x10*bastim_ch->channel), 0, 15, startcnt); 
	switch(bastim_ch->channel)
	{
		case BASTIM_CHANNEL_0:
		{
			REG_SETBITS(bastim->top0_ctrl, 0, 15, startcnt); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			REG_SETBITS(bastim->top1_ctrl, 0, 15, startcnt); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			REG_SETBITS(bastim->top2_ctrl, 0, 15, startcnt); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			REG_SETBITS(bastim->top3_ctrl, 0, 15, startcnt); 
		}
		break;
		default:
		{
			REG_SETBITS(bastim->top0_ctrl, 0, 15, startcnt); 
		}
		break;
	}
}

static inline void drv_bastim_config_update(BASTIM_TypeDef *bastim, uint32_t bastim_channel)
{
//	REG_SETBIT((uint32_t *)(&(bastim->top0_ctrl)+0x10*bastim_channel), 0, 1); 
//	REG_SETBIT((uint32_t *)(&(bastim->top0_ctrl)+0x10*bastim_channel), 0, 0); 
	switch(bastim_channel)
	{
		case BASTIM_CHANNEL_0:
		{
			REG_SETBIT(bastim->top0_ctrl, 0, 1); 
			REG_SETBIT(bastim->top0_ctrl, 0, 0); 
		}
		break;
		case BASTIM_CHANNEL_1:
		{
			REG_SETBIT(bastim->top1_ctrl, 0, 1); 
			REG_SETBIT(bastim->top1_ctrl, 0, 0); 
		}
		break;
		case BASTIM_CHANNEL_2:
		{
			REG_SETBIT(bastim->top2_ctrl, 0, 1); 
			REG_SETBIT(bastim->top2_ctrl, 0, 0); 
		}
		break;
		case BASTIM_CHANNEL_3:
		{
			REG_SETBIT(bastim->top3_ctrl, 0, 1); 
			REG_SETBIT(bastim->top3_ctrl, 0, 0); 
		}
		break;
		default:
		{
			REG_SETBIT(bastim->top0_ctrl, 0, 1); 
			REG_SETBIT(bastim->top0_ctrl, 0, 0); 
		}
		break;
	}
}

static inline void drv_bastim_int_enable(BASTIM_TypeDef *bastim, uint32_t bastim_channel)
{
	bastim->int_en |= (1 << bastim_channel);
}

static inline void drv_bastim_int_disable(BASTIM_TypeDef *bastim, uint32_t bastim_channel)
{
	bastim->int_en &= ~(1 << bastim_channel);
}

static inline void drv_bastim_int_clear(BASTIM_TypeDef *bastim, uint32_t bastim_channel)
{
	bastim->int_clr |= (1 << bastim_channel);
	bastim->int_clr = 0;
}

static inline void drv_bastim_int_allclear(BASTIM_TypeDef *bastim)
{
	bastim->int_clr = 0xf;
	bastim->int_clr = 0;
}

static inline uint32_t drv_bastim_int_get(BASTIM_TypeDef *bastim)
{
	return bastim->int_sta;
}

//===============================================
// bastim driver function header
//===============================================

bool drv_bastim_set_config(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch);
bool drv_bastim_init(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch);
void drv_bastim_deinit(BASTIM_TypeDef *bastim, BASTIM_ChannelCfg *bastim_ch);
void drv_bastim_channel0_interrupt_handler(BASTIM_TypeDef *bastim);
void drv_bastim_channel1_interrupt_handler(BASTIM_TypeDef *bastim);
void drv_bastim_channel2_interrupt_handler(BASTIM_TypeDef *bastim);
void drv_bastim_channel3_interrupt_handler(BASTIM_TypeDef *bastim);

#endif


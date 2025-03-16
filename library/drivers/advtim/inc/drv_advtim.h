//===============================================
//
//	File: drv_advtim_gen.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11232024
//	Version: v1.0
//
// 	This is header file for advance timer pwm generator.
//
//===============================================

#ifndef __DRV_ADVTIM_H_
#define __DRV_ADVTIM_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define ADVTIM_GEN_INT_RELOADING				(1<<0)
#define ADVTIM_GEN_INT_RELOADING_REACH_RCR		(1<<1)

//===============================================
// advance timer regs
//===============================================

typedef struct
{
	volatile uint32_t top_ctrl;
	volatile uint32_t gen_pe0;
	volatile uint32_t gen_pe1;
	volatile uint32_t gen_pe2;
	volatile uint32_t gen_pe3;
	volatile uint32_t gen_pe4;
	volatile uint32_t gen_pe5;
	volatile uint32_t gen_pe6;
	volatile uint32_t gen_pe7;
	volatile uint32_t gen_pe8;
	volatile uint32_t gen_pe9;
	volatile uint32_t rsv2c;
	volatile uint32_t rsv30;
	volatile uint32_t rsv34;
	volatile uint32_t rsv38;
	volatile uint32_t rsv3c;
	volatile uint32_t gen_int_en;
	volatile uint32_t gen_int_clr;
	volatile uint32_t gen_int_sta;
}ADVTIM_TypeDef;

//===============================================
// advance timer pwm generator enum
//===============================================

typedef enum
{
	ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE,
	ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0,
	ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE1,
	ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE2,
}advtim_gen_cms;

typedef enum
{
	ADVTIM_GEN_DIR_COUNTER_UP,
	ADVTIM_GEN_DIR_COUNTER_DOWN,
}advtim_gen_dir;

typedef enum
{
	ADVTIM_GEN_OUTPUT_COMPARE_DISABLE,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE1,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE2,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE3,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE4,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE5,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE6,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE7,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE8,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE9,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE10,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE11,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE12,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE13,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE14,
	ADVTIM_GEN_OUTPUT_COMPARE_MODE15,
}advtim_gen_output_compare_mode;

typedef enum
{
	ADVTIM_GEN_OUTPUT_COMPARE_WITHOUT_CHANNEL5_MODE,
	ADVTIM_GEN_OUTPUT_COMPARE_WITH_CHANNEL5_MODE,
}advtim_gen_output_compare_with_channel5_mode;

typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE,
	ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE,
}advtim_gen_output_channel_safety_and_initial_value;

typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE,
	ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE,
}advtim_gen_output_channel_mode;

typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE,
	ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE,
}advtim_gen_output_channel_value_in_gpio_mode;

typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE,
	ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE,
}advtim_gen_output_channel_pwm_enable;

typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD,
	ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE,
}advtim_gen_output_channel_pwm_polarity;


typedef enum
{
	ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_DISABLE,
	ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE,
}advtim_gen_output_channel_deadzone_enable;

//===============================================
// advance timer handler
//===============================================

typedef struct
{
	uint16_t psc;
	uint16_t arr;
	uint16_t rcr;
	advtim_gen_cms cms;
	advtim_gen_dir dir;
	uint16_t channel1_output_compare_value;
	advtim_gen_output_compare_mode channel1_output_compare_mode;
	advtim_gen_output_compare_with_channel5_mode channel1_output_compare_with_channel5_mode;
	advtim_gen_output_channel_safety_and_initial_value channel1_output_positive_safety_and_initial_value;
	advtim_gen_output_channel_safety_and_initial_value channel1_output_negative_safety_and_initial_value;
	advtim_gen_output_channel_mode channel1_output_positive_mode; 
	advtim_gen_output_channel_mode channel1_output_negative_mode; 
	advtim_gen_output_channel_value_in_gpio_mode channel1_output_positive_value_in_gpio_mode;
	advtim_gen_output_channel_value_in_gpio_mode channel1_output_negative_value_in_gpio_mode;
	advtim_gen_output_channel_pwm_enable channel1_output_positive_enable;
	advtim_gen_output_channel_pwm_enable channel1_output_negative_enable;
	advtim_gen_output_channel_pwm_polarity channel1_output_positive_polarity;
	advtim_gen_output_channel_pwm_polarity channel1_output_negative_polarity;
	uint16_t channel2_output_compare_value;
	advtim_gen_output_compare_mode channel2_output_compare_mode;
	advtim_gen_output_compare_with_channel5_mode channel2_output_compare_with_channel5_mode;
	advtim_gen_output_channel_safety_and_initial_value channel2_output_positive_safety_and_initial_value;
	advtim_gen_output_channel_safety_and_initial_value channel2_output_negative_safety_and_initial_value;
	advtim_gen_output_channel_mode channel2_output_positive_mode; 
	advtim_gen_output_channel_mode channel2_output_negative_mode; 
	advtim_gen_output_channel_value_in_gpio_mode channel2_output_positive_value_in_gpio_mode;
	advtim_gen_output_channel_value_in_gpio_mode channel2_output_negative_value_in_gpio_mode;
	advtim_gen_output_channel_pwm_enable channel2_output_positive_enable;
	advtim_gen_output_channel_pwm_enable channel2_output_negative_enable;
	advtim_gen_output_channel_pwm_polarity channel2_output_positive_polarity;
	advtim_gen_output_channel_pwm_polarity channel2_output_negative_polarity;
	uint16_t channel3_output_compare_value;
	advtim_gen_output_compare_mode channel3_output_compare_mode;
	advtim_gen_output_compare_with_channel5_mode channel3_output_compare_with_channel5_mode;
	advtim_gen_output_channel_safety_and_initial_value channel3_output_positive_safety_and_initial_value;
	advtim_gen_output_channel_safety_and_initial_value channel3_output_negative_safety_and_initial_value;
	advtim_gen_output_channel_mode channel3_output_positive_mode; 
	advtim_gen_output_channel_mode channel3_output_negative_mode; 
	advtim_gen_output_channel_value_in_gpio_mode channel3_output_positive_value_in_gpio_mode;
	advtim_gen_output_channel_value_in_gpio_mode channel3_output_negative_value_in_gpio_mode;
	advtim_gen_output_channel_pwm_enable channel3_output_positive_enable;
	advtim_gen_output_channel_pwm_enable channel3_output_negative_enable;
	advtim_gen_output_channel_pwm_polarity channel3_output_positive_polarity;
	advtim_gen_output_channel_pwm_polarity channel3_output_negative_polarity;
	uint16_t channel4_output_compare_value;
	advtim_gen_output_compare_mode channel4_output_compare_mode;
	advtim_gen_output_channel_safety_and_initial_value channel4_output_safety_and_initial_value;
	advtim_gen_output_channel_pwm_enable channel4_output_enable;
	advtim_gen_output_channel_pwm_polarity channel4_output_polarity;
	uint16_t channel5_output_compare_value;
	advtim_gen_output_compare_mode channel5_output_compare_mode;
	advtim_gen_output_channel_safety_and_initial_value channel5_output_safety_and_initial_value;
	advtim_gen_output_channel_pwm_enable channel5_output_enable;
	advtim_gen_output_channel_pwm_polarity channel5_output_polarity;
	uint16_t channel6_output_compare_value;
	advtim_gen_output_compare_mode channel6_output_compare_mode;
	advtim_gen_output_channel_safety_and_initial_value channel6_output_safety_and_initial_value;
	advtim_gen_output_channel_pwm_enable channel6_output_enable;
	advtim_gen_output_channel_pwm_polarity channel6_output_polarity;
	uint16_t deadzone_time;
	advtim_gen_output_channel_deadzone_enable channel1_output_deadzone_enable;
	advtim_gen_output_channel_deadzone_enable channel2_output_deadzone_enable;
	advtim_gen_output_channel_deadzone_enable channel3_output_deadzone_enable;
}ADVTIM_GEN_FunctionCfg;

typedef struct
{
	ADVTIM_TypeDef *regs;
	ADVTIM_GEN_FunctionCfg gen_cfg;
}ADVTIM_HandleTypeDef;

//===============================================
// advance timer inline function
//===============================================

static inline void drv_advtim_gen_logic_reset(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 8, 1);//pwm generator logic clear
	REG_SETBIT(advtim->regs->top_ctrl, 8, 0);//pwm generator logic clear
}

static inline void drv_advtim_cap_logic_reset(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 9, 1);//input capture logic clear
	REG_SETBIT(advtim->regs->top_ctrl, 9, 0);//input capture logic clear
}

static inline void drv_advtim_config_hw_update_enable(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 1, 1);
}

static inline void drv_advtim_config_hw_update_disable(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 1, 0);
}

static inline void drv_advtim_config_sw_update(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 0, 1);
	REG_SETBIT(advtim->regs->top_ctrl, 0, 0);
}

static inline void drv_advtim_gen_enable(ADVTIM_HandleTypeDef *advtim)
{
	REG_SETBIT(advtim->regs->top_ctrl, 2, 1);
	REG_SETBIT(advtim->regs->top_ctrl, 2, 0);
}

static inline void drv_advtim_gen_set_arr(ADVTIM_HandleTypeDef *advtim, uint16_t arr)
{
	REG_SETBITS(advtim->regs->gen_pe0, 0, 15, arr);
}

static inline void drv_advtim_gen_set_psc(ADVTIM_HandleTypeDef *advtim, uint16_t psc)
{
	REG_SETBITS(advtim->regs->gen_pe0, 16, 31, psc);
}

static inline void drv_advtim_gen_set_rcr(ADVTIM_HandleTypeDef *advtim, uint16_t rcr)
{
	REG_SETBITS(advtim->regs->gen_pe1, 16, 31, rcr);
}

static inline void drv_advtim_gen_set_cms(ADVTIM_HandleTypeDef *advtim, advtim_gen_cms cms)
{
	REG_SETBITS(advtim->regs->gen_pe2, 1, 2, cms);
}

static inline void drv_advtim_gen_set_dir(ADVTIM_HandleTypeDef *advtim, advtim_gen_dir dir)
{
	REG_SETBIT(advtim->regs->gen_pe2, 0, dir);
}

static inline void drv_advtim_gen_set_channel1_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe3, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel1_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe3, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel2_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe4, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel2_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe4, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel3_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe5, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel3_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe5, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel4_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe6, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel4_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe6, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel5_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe7, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel5_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe7, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel6_output_compare_value(ADVTIM_HandleTypeDef *advtim, uint16_t output_compare_value)
{
	REG_SETBITS(advtim->regs->gen_pe8, 16, 31, output_compare_value);
}

static inline void drv_advtim_gen_set_channel6_output_compare_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_mode output_compare_mode)
{
	REG_SETBITS(advtim->regs->gen_pe8, 0, 3, output_compare_mode);
}

static inline void drv_advtim_gen_set_channel1_output_compare_with_channel5_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_with_channel5_mode output_compare_with_channel5_mode)
{
	REG_SETBIT(advtim->regs->gen_pe7, 13, output_compare_with_channel5_mode);
}

static inline void drv_advtim_gen_set_channel2_output_compare_with_channel5_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_with_channel5_mode output_compare_with_channel5_mode)
{
	REG_SETBIT(advtim->regs->gen_pe7, 14, output_compare_with_channel5_mode);
}

static inline void drv_advtim_gen_set_channel3_output_compare_with_channel5_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_compare_with_channel5_mode output_compare_with_channel5_mode)
{
	REG_SETBIT(advtim->regs->gen_pe7, 15, output_compare_with_channel5_mode);
}

static inline void drv_advtim_gen_set_channel1_output_positive_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel1_output_positive_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe3, 14, channel1_output_positive_gpio_value);
}

static inline void drv_advtim_gen_set_channel1_output_negative_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel1_output_negative_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe3, 13, channel1_output_negative_gpio_value);
}

static inline void drv_advtim_gen_set_channel1_output_positive_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel1_output_positive_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe3, 12, channel1_output_positive_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel1_output_negative_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel1_output_negative_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe3, 11, channel1_output_negative_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel1_output_positive_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel1_output_positive_mode)
{
	REG_SETBIT(advtim->regs->gen_pe3, 10, channel1_output_positive_mode);
}

static inline void drv_advtim_gen_set_channel1_output_negative_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel1_output_negative_mode)
{
	REG_SETBIT(advtim->regs->gen_pe3, 9, channel1_output_negative_mode);
}

static inline void drv_advtim_gen_set_channel1_output_positive_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel1_output_positive_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe3, 7, channel1_output_positive_polarity);
}

static inline void drv_advtim_gen_set_channel1_output_negative_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel1_output_negative_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe3, 6, channel1_output_negative_polarity);
}

static inline void drv_advtim_gen_set_channel1_output_positive_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel1_output_positive_enable)
{
	REG_SETBIT(advtim->regs->gen_pe3, 5, channel1_output_positive_enable);
}

static inline void drv_advtim_gen_set_channel1_output_negative_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel1_output_negative_enable)
{
	REG_SETBIT(advtim->regs->gen_pe3, 4, channel1_output_negative_enable);
}

static inline void drv_advtim_gen_set_channel2_output_positive_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel2_output_positive_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe4, 14, channel2_output_positive_gpio_value);
}

static inline void drv_advtim_gen_set_channel2_output_negative_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel2_output_negative_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe4, 13, channel2_output_negative_gpio_value);
}

static inline void drv_advtim_gen_set_channel2_output_positive_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel2_output_positive_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe4, 12, channel2_output_positive_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel2_output_negative_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel2_output_negative_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe4, 11, channel2_output_negative_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel2_output_positive_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel2_output_positive_mode)
{
	REG_SETBIT(advtim->regs->gen_pe4, 10, channel2_output_positive_mode);
}

static inline void drv_advtim_gen_set_channel2_output_negative_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel2_output_negative_mode)
{
	REG_SETBIT(advtim->regs->gen_pe4, 9, channel2_output_negative_mode);
}

static inline void drv_advtim_gen_set_channel2_output_positive_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel2_output_positive_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe4, 7, channel2_output_positive_polarity);
}

static inline void drv_advtim_gen_set_channel2_output_negative_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel2_output_negative_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe4, 6, channel2_output_negative_polarity);
}

static inline void drv_advtim_gen_set_channel2_output_positive_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel2_output_positive_enable)
{
	REG_SETBIT(advtim->regs->gen_pe4, 5, channel2_output_positive_enable);
}

static inline void drv_advtim_gen_set_channel2_output_negative_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel2_output_negative_enable)
{
	REG_SETBIT(advtim->regs->gen_pe4, 4, channel2_output_negative_enable);
}

static inline void drv_advtim_gen_set_channel3_output_positive_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel3_output_positive_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe5, 14, channel3_output_positive_gpio_value);
}

static inline void drv_advtim_gen_set_channel3_output_negative_gpio_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_value_in_gpio_mode channel3_output_negative_gpio_value)
{
	REG_SETBIT(advtim->regs->gen_pe5, 13, channel3_output_negative_gpio_value);
}

static inline void drv_advtim_gen_set_channel3_output_positive_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel3_output_positive_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe5, 12, channel3_output_positive_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel3_output_negative_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel3_output_negative_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe5, 11, channel3_output_negative_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel3_output_positive_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel3_output_positive_mode)
{
	REG_SETBIT(advtim->regs->gen_pe5, 10, channel3_output_positive_mode);
}

static inline void drv_advtim_gen_set_channel3_output_negative_mode(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_mode channel3_output_negative_mode)
{
	REG_SETBIT(advtim->regs->gen_pe5, 9, channel3_output_negative_mode);
}

static inline void drv_advtim_gen_set_channel3_output_positive_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel3_output_positive_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe5, 7, channel3_output_positive_polarity);
}

static inline void drv_advtim_gen_set_channel3_output_negative_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel3_output_negative_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe5, 6, channel3_output_negative_polarity);
}

static inline void drv_advtim_gen_set_channel3_output_positive_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel3_output_positive_enable)
{
	REG_SETBIT(advtim->regs->gen_pe5, 5, channel3_output_positive_enable);
}

static inline void drv_advtim_gen_set_channel3_output_negative_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel3_output_negative_enable)
{
	REG_SETBIT(advtim->regs->gen_pe5, 4, channel3_output_negative_enable);
}

static inline void drv_advtim_gen_set_channel4_output_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel4_output_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe6, 12, channel4_output_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel4_output_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel4_output_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe6, 7, channel4_output_polarity);
}

static inline void drv_advtim_gen_set_channel4_output_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel4_output_enable)
{
	REG_SETBIT(advtim->regs->gen_pe6, 5, channel4_output_enable);
}

static inline void drv_advtim_gen_set_channel5_output_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel5_output_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe7, 12, channel5_output_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel5_output_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel5_output_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe7, 7, channel5_output_polarity);
}

static inline void drv_advtim_gen_set_channel5_output_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel5_output_enable)
{
	REG_SETBIT(advtim->regs->gen_pe7, 5, channel5_output_enable);
}

static inline void drv_advtim_gen_set_channel6_output_safety_and_initial_value(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_safety_and_initial_value channel6_output_safety_and_initial_value)
{
	REG_SETBIT(advtim->regs->gen_pe8, 12, channel6_output_safety_and_initial_value);
}

static inline void drv_advtim_gen_set_channel6_output_pwm_polarity(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_polarity channel6_output_polarity)
{
	REG_SETBIT(advtim->regs->gen_pe8, 7, channel6_output_polarity);
}

static inline void drv_advtim_gen_set_channel6_output_pwm_enable(ADVTIM_HandleTypeDef *advtim, advtim_gen_output_channel_pwm_enable channel6_output_enable)
{
	REG_SETBIT(advtim->regs->gen_pe8, 5, channel6_output_enable);
}

static inline void drv_advtim_gen_int_enable(ADVTIM_HandleTypeDef *advtim, uint32_t advtim_gen_int)
{
	advtim->regs->gen_int_en |= advtim_gen_int;
}

static inline void drv_advtim_gen_int_disable(ADVTIM_HandleTypeDef *advtim, uint32_t advtim_gen_int)
{
	advtim->regs->gen_int_en &= ~advtim_gen_int;
}

static inline void drv_advtim_gen_int_clear(ADVTIM_HandleTypeDef *advtim, uint32_t advtim_gen_int)
{
	advtim->regs->gen_int_clr |= advtim_gen_int;
	advtim->regs->gen_int_clr = 0;
}

static inline void drv_advtim_gen_int_allclear(ADVTIM_HandleTypeDef *advtim)
{
	advtim->regs->gen_int_clr = 0x3;
	advtim->regs->gen_int_clr = 0;
}

static inline uint32_t drv_advtim_gen_int_get(ADVTIM_HandleTypeDef *advtim)
{
	return advtim->regs->gen_int_sta;
}

//===============================================
// advtim gen driver function header
//===============================================

void drv_advtim_gen_default_config(ADVTIM_HandleTypeDef *advtim);
bool drv_advtim_gen_set_config(ADVTIM_HandleTypeDef *advtim);
bool drv_advtim_gen_init(ADVTIM_HandleTypeDef *advtim);
void drv_advtim_gen_deinit(ADVTIM_HandleTypeDef *advtim);
void drv_advtim_gen_interrupt_handler(ADVTIM_HandleTypeDef *advtim);

#endif


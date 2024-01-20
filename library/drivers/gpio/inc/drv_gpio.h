//===============================================
//
//	File: drv_gpio.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01152024
//	Version: v1.0
//
// 	This is header file for gpio driver.
//
//===============================================

#ifndef __DRV_GPIO_H_
#define __DRV_GPIO_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define GPIO_PIN_15								(15)
#define GPIO_PIN_14								(14)
#define GPIO_PIN_13								(13)
#define GPIO_PIN_12								(12)
#define GPIO_PIN_11								(11)
#define GPIO_PIN_10								(10)
#define GPIO_PIN_9								(9)
#define GPIO_PIN_8								(8)
#define GPIO_PIN_7								(7)
#define GPIO_PIN_6								(6)
#define GPIO_PIN_5								(5)
#define GPIO_PIN_4								(4)
#define GPIO_PIN_3								(3)
#define GPIO_PIN_2								(2)
#define GPIO_PIN_1								(1)
#define GPIO_PIN_0								(0)

//===============================================
// gpio regs
//===============================================

typedef struct
{
	volatile uint32_t modex;
	volatile uint32_t typex;
	volatile uint32_t speedx;
	volatile uint32_t pupdx;
	volatile uint32_t odx;
	volatile uint32_t togglex;
	volatile uint32_t afx;
	volatile uint32_t inttrigx;
	volatile uint32_t intx_en;
	volatile uint32_t intx_clr;
	volatile uint32_t idx;
	volatile uint32_t intx_sta;
}GPIO_TypeDef;

//===============================================
// gpio enum
//===============================================

typedef enum
{
	GPIO_MODE_INPUT,
	GPIO_MODE_OUTPUT,
	GPIO_MODE_AF,
	GPIO_MODE_ANALOG,
}gpio_mode;

typedef enum
{
	GPIO_TYPE_PUSH_PULL,
	GPIO_TYPE_OPEN_DRAIN,
}gpio_type;

typedef enum
{
	GPIO_NOPULL,
	GPIO_PULLUP,
	GPIO_PULLDOWN,
}gpio_pull;

typedef enum
{
	GPIO_OUTPUT_LOW,
	GPIO_OUTPUT_HIGH,
}gpio_output;

typedef enum
{
	GPIO_AF0,
	GPIO_AF1,
	GPIO_AF2,
	GPIO_AF3,
}gpio_alternate;

typedef enum
{
	GPIO_INT_RISING,
	GPIO_INT_FALLING,
	GPIO_INT_HIGH,
	GPIO_INT_LOW,
}gpio_inttrig;

//===============================================
// gpio handler
//===============================================

typedef struct
{
	uint16_t pin;
	gpio_mode mode;
	gpio_type type;
	gpio_pull pull;
	gpio_alternate alternate;
	gpio_inttrig inttrig;
}GPIO_FunctionCfg;

//===============================================
// gpio inline function
//===============================================

static inline void drv_gpio_output(GPIO_TypeDef *gpio, uint32_t gpio_pin, gpio_output output)
{
	REG_SETBIT(gpio->odx, gpio_pin, output); 
}

static inline void drv_gpio_toggle(GPIO_TypeDef *gpio, uint32_t gpio_pin)
{
	REG_SETBIT(gpio->togglex, gpio_pin, ~REG_GETBIT(gpio->togglex, gpio_pin)); 
}

static inline uint8_t drv_gpio_input(GPIO_TypeDef *gpio, uint32_t gpio_pin)
{
	return REG_GETBIT(gpio->idx, gpio_pin); 
}

static inline void drv_gpio_int_enable(GPIO_TypeDef *gpio, uint32_t gpio_pin)
{
	gpio->intx_en |= (1 << gpio_pin);
}

static inline void drv_gpio_int_disable(GPIO_TypeDef *gpio, uint32_t gpio_pin)
{
	gpio->intx_en &= ~(1 << gpio_pin);
}

static inline void drv_gpio_int_clear(GPIO_TypeDef *gpio, uint32_t gpio_pin)
{
	gpio->intx_clr |= (1 << gpio_pin);
	gpio->intx_clr = 0;
}

static inline void drv_gpio_int_allclear(GPIO_TypeDef *gpio)
{
	gpio->intx_clr = 0xffff;
	gpio->intx_clr = 0;
}

static inline uint32_t drv_gpio_int_get(GPIO_TypeDef *gpio)
{
	return gpio->intx_sta;
}

//===============================================
// gpio driver function header
//===============================================

void drv_gpio_set_config(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg);
void drv_gpio_init(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg);
void drv_gpio_deinit(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg);
void drv_gpio_interrupt_handler(GPIO_TypeDef *gpio);

#endif


//===============================================
//
//	File: drv_gpio.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01182024
//	Version: v1.0
//
// 	This is source file for gpio function driver.
//
//===============================================

#include "drv_gpio.h"

#ifdef GPIO_DRIVER

//===============================================
// gpio init & deinit function
//===============================================

void drv_gpio_set_config(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg)
{
	REG_SETBITS(gpio->modex, (gpio_cfg->pin) << 1, (((gpio_cfg->pin) << 1) + 1), gpio_cfg->mode); 	
	REG_SETBIT(gpio->typex, gpio_cfg->pin, gpio_cfg->type); 	
	REG_SETBIT(gpio->pupdx, gpio_cfg->pin, gpio_cfg->pull); 	
	REG_SETBITS(gpio->afx, (gpio_cfg->pin) << 1, (((gpio_cfg->pin) << 1) + 1), gpio_cfg->alternate); 	
	REG_SETBITS(gpio->inttrigx, (gpio_cfg->pin) << 1, (((gpio_cfg->pin) << 1) + 1), gpio_cfg->inttrig); 	
}

void drv_gpio_init(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg)
{
	drv_gpio_set_config(gpio, gpio_cfg);
	drv_gpio_int_clear(gpio, gpio_cfg->pin);
}

void drv_gpio_deinit(GPIO_TypeDef *gpio, GPIO_FunctionCfg *gpio_cfg)
{
	drv_gpio_output(gpio, gpio_cfg->pin, GPIO_OUTPUT_LOW);
	drv_gpio_int_disable(gpio, gpio_cfg->pin);
	drv_gpio_int_clear(gpio, gpio_cfg->pin);
}

//===============================================
// gpio weak function
//===============================================

void __attribute__((weak)) gpio0_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio1_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio2_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio3_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio4_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio5_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio6_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio7_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio8_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio9_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio10_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio11_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio12_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio13_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio14_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

void __attribute__((weak)) gpio15_int_callback(GPIO_TypeDef *gpio)
{
	UNUSED(gpio);
	return;
}

//===============================================
// gpio interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_gpio_interrupt_handler(GPIO_TypeDef *gpio)
{
	uint16_t status;
	status = drv_gpio_int_get(gpio) & gpio->intx_en;

	if(status & (1 << GPIO_PIN_0))
	{
		gpio0_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_0);
	}
	if(status & (1 << GPIO_PIN_1))
	{
		gpio1_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_1);
	}
	if(status & (1 << GPIO_PIN_2))
	{
		gpio2_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_2);
	}
	if(status & (1 << GPIO_PIN_3))
	{
		gpio3_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_3);
	}
	if(status & (1 << GPIO_PIN_4))
	{
		gpio4_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_4);
	}
	if(status & (1 << GPIO_PIN_5))
	{
		gpio5_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_5);
	}
	if(status & (1 << GPIO_PIN_6))
	{
		gpio6_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_6);
	}
	if(status & (1 << GPIO_PIN_7))
	{
		gpio7_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_7);
	}
	if(status & (1 << GPIO_PIN_8))
	{
		gpio8_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_8);
	}
	if(status & (1 << GPIO_PIN_9))
	{
		gpio9_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_9);
	}
	if(status & (1 << GPIO_PIN_10))
	{
		gpio10_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_10);
	}
	if(status & (1 << GPIO_PIN_11))
	{
		gpio11_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_11);
	}
	if(status & (1 << GPIO_PIN_12))
	{
		gpio12_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_12);
	}
	if(status & (1 << GPIO_PIN_13))
	{
		gpio13_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_13);
	}
	if(status & (1 << GPIO_PIN_14))
	{
		gpio14_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_14);
	}
	if(status & (1 << GPIO_PIN_15))
	{
		gpio15_int_callback(gpio);
		drv_gpio_int_clear(gpio, GPIO_PIN_15);
	}
}

#endif


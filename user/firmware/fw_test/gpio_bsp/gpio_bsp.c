//===============================================
//
//	File: gpio_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01202024
//	Version: v1.0
//
// 	This is gpio bsp source file.
//
//===============================================

#include "gpio_bsp.h"

GPIO_FunctionCfg gpioa2;
GPIO_FunctionCfg gpioa3;

//===============================================
// gpio init
//===============================================

void gpioa2_init(void)
{
	gpioa2.pin = GPIO_PIN_2;
	gpioa2.mode = GPIO_MODE_OUTPUT;
	drv_gpio_init(GPIOA, &gpioa2);
}

void gpioa3_init(void)
{
	gpioa3.pin = GPIO_PIN_3;
	gpioa3.mode = GPIO_MODE_INPUT;
	drv_gpio_init(GPIOA, &gpioa3);
}

void gpioa3_int_init(void)
{
	gpioa3.pin = GPIO_PIN_3;
	gpioa3.mode = GPIO_MODE_INPUT;
	gpioa3.inttrig = GPIO_INT_RISING;
	drv_gpio_init(GPIOA, &gpioa3);
	drv_gpio_int_enable(GPIOA, GPIO_PIN_3);
}

void gpioa2_deinit(void)
{
	drv_gpio_deinit(GPIOA, &gpioa2);
}

void gpioa3_deinit(void)
{
	drv_gpio_deinit(GPIOA, &gpioa3);
}


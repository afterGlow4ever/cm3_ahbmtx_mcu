//===============================================
//
//	File: gpio_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01202024
//	Version: v1.0
//
// 	This is gpio test source file.
//
//===============================================

#include "gpio_test.h"

#ifdef GPIO_TEST

extern GPIO_FunctionCfg gpioa2;
extern GPIO_FunctionCfg gpioa3;
volatile uint8_t gpio_int_flag;

//===============================================
// test prepare
//===============================================

//===============================================
// test functions
//===============================================

void gpioa2_out_gpioa3_in_test(void)
{
	gpioa2_init();
	gpioa3_init();

	drv_gpio_output(GPIOA, GPIO_PIN_2, GPIO_OUTPUT_HIGH);
	while(drv_gpio_input(GPIOA, GPIO_PIN_3) == 0);

	test_printf_s("gpioa3 input high.\r\n");
	gpioa2_deinit();
	gpioa3_deinit();
}

void gpioa2_out_gpioa3_in_it_test(void)
{
	gpioa2_init();
	gpioa3_int_init();
	NVIC_SetPriority(Gpioa_IRQn, 0);
	NVIC_EnableIRQ(Gpioa_IRQn);
	gpio_int_flag = 0;

	drv_gpio_output(GPIOA, GPIO_PIN_2, GPIO_OUTPUT_HIGH);
	while(gpio_int_flag == 0);

	test_printf_s("gpioa3 input high.\r\n");

	NVIC_DisableIRQ(Gpioa_IRQn);
	gpioa2_deinit();
	gpioa3_deinit();
}

void gpio3_int_callback(GPIO_TypeDef *gpio)
{
	gpio_int_flag = 1;
}

//===============================================
// testlist
//===============================================

TestMenu g_gpio_menu[] =
{
	{'1', gpioa2_out_gpioa3_in_test,				"[GPIO] gpioa2 out gpioa3 in\r\n"}, 
	{'2', gpioa2_out_gpioa3_in_it_test,				"[GPIO] gpioa2 out gpioa3 in int\r\n"}
};

void gpio_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_gpio_menu) / sizeof(TestMenu);
	show_testmenu(g_gpio_menu, num);	
	test_execute(g_gpio_menu, num);
}

#endif


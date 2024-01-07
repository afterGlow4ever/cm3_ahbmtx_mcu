//===============================================
//
//	File: uart_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01072024
//	Version: v1.0
//
// 	This is uart test source file.
//
//===============================================

#include "uart_test.h"

#ifdef UART_TEST

extern UART_HandleTypeDef huart1;
uint16_t tx_data[32];
uint16_t rx_data[32];

//===============================================
// test prepare
//===============================================

static void uart_tx_data_prepare(void)
{
	for(uint8_t i = 0; i < 32; i++)
	{
		tx_data[i] = 0xc3 + (i << 2);
	}
}

//===============================================
// test functions
//===============================================

void uart1_tx_test(void)
{
	uart1_init();
	uart_tx_data_prepare();
	drv_uart_tx_data(&huart1, tx_data, 32);
}

void uart1_rx_test(void)
{
	uart1_init();
	drv_uart_rx_data(&huart1, rx_data, 32);

	test_printf_s("uart1 rx data:\r\n");
	for(uint8_t i = 0; i < 32; i++)
	{
		test_printf_ch("%x ", rx_data[i]);
	}	
}

void uart1_rx_it_test(void)
{
	uart1_init();
	NVIC_SetPriority(Uart1_IRQn, 0);
	NVIC_EnableIRQ(Uart1_IRQn);

	drv_uart_rx_data_it(&huart1, rx_data, 32);
	while(huart1.rx_ptr != 32);

	NVIC_DisableIRQ(Uart1_IRQn);

	test_printf_s("uart1 rx data:\r\n");
	for(uint8_t i = 0; i < 32; i++)
	{
				writereg32(0x40000000, rx_data[i]);
		test_printf_ch("%x ", rx_data[i]);
	}	
	test_printf_s("\r\n");
}

void uart1_rx_tx_loop_test(void)
{
	uart1_init();
	NVIC_SetPriority(Uart1_IRQn, 0);
	NVIC_EnableIRQ(Uart1_IRQn);

	drv_uart_rx_data_it(&huart1, rx_data, 32);
	while(huart1.rx_ptr != 32);

	NVIC_DisableIRQ(Uart1_IRQn);

	drv_uart_tx_data(&huart1, rx_data, 32);

	test_printf_s("uart1 rx data:\r\n");
	for(uint8_t i = 0; i < 32; i++)
	{
		test_printf_ch("%x ", rx_data[i]);
	}	
	test_printf_s("\r\n");
}

//===============================================
// testlist
//===============================================

TestMenu g_uart_menu[] =
{
	{'1', uart1_tx_test,						"[UART] uart1 tx data\r\n"}, 
	{'2', uart1_rx_test,						"[UART] uart1 rx data\r\n"}, 
	{'3', uart1_rx_it_test,						"[UART] uart1 rx it data\r\n"}, 
	{'4', uart1_rx_tx_loop_test,				"[UART] uart1 rx tx loop data\r\n"}
};

void uart_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_uart_menu) / sizeof(TestMenu);
	show_testmenu(g_uart_menu, num);	
	test_execute(g_uart_menu, num);
}

#endif


//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04012024
//	Version: v1.0
//
// 	This is test main fw for mcu.
//	Including:
//	1. system init
//
//===============================================

#include "main.h"

extern UART_HandleTypeDef huart0;

//uint16_t tx_data[32];
//uint16_t rx_data[32];

//===============================================
// testlist
//===============================================

TestMenu g_mcu_menu[] =
{
	{'1', uart_testmenu,							"[UART] uart test menu\r\n"} 
};

void mcu_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_mcu_menu) / sizeof(TestMenu);	
	show_testmenu(g_mcu_menu, num);	
	test_execute(g_mcu_menu, num);
}

//===============================================
// main
//===============================================

int main(void)
{
//	uint8_t temp;

	uint8_t ch;
	uart0_init();
//	temp=1;
//	writereg32(0x40000008, 0xbd);
//	drv_uart_printf("Hello%d\r\n", temp);
//	drv_uart_printf("Hello\r\n");
////
//	for(uint8_t i = 0; i < 32; i++)
//	{
//		tx_data[i] = 0xc3 + (i << 2);
//	}
//
////	writereg32(0x40000008, 0xbd);
////	drv_uart_tx_data(&huart0, tx_data, 32);
////	writereg32(0x40000008, 0xed);
////
////	writereg32(0x40000008, 0xbd);
////	drv_uart_rx_data(&huart0, rx_data, 32);
////	writereg32(0x40000008, 0xed);
////	for(uint8_t i = 0; i < 32; i++)
////	{
////		writereg32(0x40000000, rx_data[i]);
////	}
//
//	writereg32(0x40000008, 0xbd);
//	NVIC_SetPriority(Uart0_IRQn, 0);
//	NVIC_EnableIRQ(Uart0_IRQn);
////	writereg32(0x40000000, NVIC->ISER[0]);
//
//	drv_uart_rx_data_it(&huart0, rx_data, 32);
//
//	while(huart0.rx_ptr != 32)
//	{
//		writereg32(0x40000000, huart0.rx_ptr);
//	}
//	NVIC_DisableIRQ(Uart0_IRQn);
//	for(uint8_t i = 0; i < 32; i++)
//	{
//		writereg32(0x40000000, rx_data[i]);
//	}
//		writereg32(0x40000008, 0xed);
//	drv_uart_tx_data(&huart0, rx_data, 32);

#ifdef SIM
	writereg32(0x40000008, 0xbd);
	uart1_rx_it_test();
	writereg32(0x40000008, 0xed);
#else
#endif
	while(1)
	{
#ifdef SIM

#else
		mcu_testmenu();
//		drv_uart_getchar(&huart0, &ch);
//		drv_uart_putchar(&huart0, &ch);
#endif
	}
}

//===============================================
// test menu
//===============================================

void show_testmenu(TestMenu menu[], uint8_t num)
{
	uint8_t i;

	drv_uart_printf("[TEST] Show test menu...\r\n");
	for(i = 0; i < num; i ++)
	{
		drv_uart_printf("[%c] %s", menu[i].ch, menu[i].str);
	}
	drv_uart_printf("[TEST] Press key to execute or 'Q' to exit...\r\n");
}

void test_execute(TestMenu menu[], uint8_t num)
{
	uint8_t i, ret, ch;
	
	while(1)
	{
		ch = 0;
		ret = drv_uart_getchar_timeout(&huart0, &ch, 250000);
		if(ret == FALSE)
		{
			drv_uart_printf("Input %c...\r\n", ch);
			if(ch == 'Q')
			{
				drv_uart_printf("[TEST] Test ends...\r\n\r\n");
				return;
			}
			else 
			{
				for(i = 0; i < num; i ++)
				{
					if(ch == menu[i].ch)
					{
						drv_uart_printf("[TEST] Start:%s", menu[i].str);
						menu[i].pFun();
						drv_uart_printf("[TEST] End:%s", menu[i].str);
						break;
					}
				}
				drv_uart_printf("Input error...\r\n");
			}
		}	
	}
}

//===============================================
// return 1 when press 'Q'
//===============================================

uint8_t exit_current_test(void)
{
#ifdef SIM
#else
	uint8_t ch, ret;
	ret = drv_uart_getchar_timeout(&huart0, &ch, 250000);
	if(ret == FALSE)
	{
		if(ch == 'Q')
			return 1;
	}
#endif
	return 0;
}


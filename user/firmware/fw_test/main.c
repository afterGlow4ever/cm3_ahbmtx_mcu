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

//===============================================
// testlist
//===============================================

TestMenu g_mcu_menu[] =
{
#ifdef UART_TEST
	{'1', uart_testmenu,							"[UART] test menu\r\n"},
#endif
#ifdef GPIO_TEST
	{'2', gpio_testmenu,							"[GPIO] test menu\r\n"},
#endif
#ifdef BASTIM_TEST
	{'3', bastim_testmenu,							"[BASTIM] test menu\r\n"},
#endif
	{'0', mcu_testmenu,								"[MCU] test menu\r\n"}
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
	uart0_init();
#ifdef SIM
	writereg32(0x40000008, 0xbd);
	bastim_4ch_autoreload_int_test();
//	bastim_4ch_test();
//	gpioa2_out_gpioa3_in_it_test();
//	uart1_rx_it_test();
	writereg32(0x40000008, 0xed);
#else
#endif

	while(1)
	{
#ifdef SIM
#else
		mcu_testmenu();
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

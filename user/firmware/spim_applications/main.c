//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10072025
//	Version: v1.0
//
// 	This is main for spi master applications.
//
//===============================================

#include "main.h"

extern UART_HandleTypeDef huart0;
SPIM_HandleTypeDef hspim;

//===============================================
// testlist
//===============================================

TestMenu g_mcu_menu[] =
{
	{'1', gd25lb256e_spi_flash_cases,							"[GD25lb256e] GD25lb256e spi flash cases...\r\n"},
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
	spim_init_for_gd25lb256e();
//	gd25lb256e_write_latch();
//	gd25lb256e_write_latch();
	gd25lb256e_program_case();
	gd25lb256e_program_case();
	writereg32(0x40000008, 0xed);
#else
	test_printf_s("SPI master applications...\r\n");
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
					}
				}
				drv_uart_printf("Input error...\r\n");
			}
		}
	}
}


//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04012024
//	Version: v1.0
//
// 	This is main for dc motor 6612 applications.
//
//===============================================

#include "main.h"

extern UART_HandleTypeDef huart0;
extern dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;
uint32_t temp00;
uint32_t temp01;

//===============================================
// testlist
//===============================================

TestMenu g_mcu_menu[] =
{
	{'1', dcm_system_enable,							"[DCM6612] DCM system enable...\r\n"},
	{'2', dcm_system_disable,							"[DCM6612] DCM system disable...\r\n"},
	{'3', dcm_speed_up,							"[DCM6612] DCM speed up...\r\n"},
	{'4', dcm_speed_down,							"[DCM6612] DCM speed down...\r\n"},
//	{'5', dcm_reverse,							"[DCM6612] DCM reverse...\r\n"},//direction is owing to signal of speed set
	{'q', dcm_show_status,							"[DCM6612] DCM status display...\r\n"}
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
	dcm_system_init();
#ifdef SIM
	writereg32(0x40000008, 0xbd);
	dcm_system_enable();
//	writereg32(0x40000008, 0xed);
#else
	test_printf_s("DC motor with tb6612 applications...\r\n");
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
						return;
					}
				}
				drv_uart_printf("Input error...\r\n");
			}
		}
		test_printf_ch("RO %d\r\n",DCM.encoder.encoder_direction);
		test_printf_ch("RC %d\r\n",DCM.encoder.encoder_count);
	}
}


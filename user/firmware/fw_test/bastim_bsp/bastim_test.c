//===============================================
//
//	File: bastim_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 01202024
//	Version: v1.0
//
// 	This is basic timer test source file.
//
//===============================================

#include "bastim_test.h"

#ifdef BASTIM_TEST

extern BASTIM_ChannelCfg bastim_ch0;
extern BASTIM_ChannelCfg bastim_ch1;
extern BASTIM_ChannelCfg bastim_ch2;
extern BASTIM_ChannelCfg bastim_ch3;

volatile uint8_t bastim_ch0_int_flag;
volatile uint8_t bastim_ch1_int_flag;
volatile uint8_t bastim_ch2_int_flag;
volatile uint8_t bastim_ch3_int_flag;

//===============================================
// test prepare
//===============================================

//===============================================
// test functions
//===============================================

void bastim_4ch_autoreload_test(void)
{
	uint32_t status;

	bastim_ch0_init();
	bastim_ch1_init();
	bastim_ch2_init();
	bastim_ch3_init();

	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_0);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_1);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_2);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_3);

	bastim_ch0_int_flag = 0;
	bastim_ch1_int_flag = 0;
	bastim_ch2_int_flag = 0;
	bastim_ch3_int_flag = 0;

	while(1)
	{
		status = drv_bastim_int_get(BASTIM);
		if(status != 0)
		{
			if(status & (1 << BASTIM_CHANNEL_0))
			{
				bastim_ch0_int_flag++;
				drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_0);
			}
			if(status & (1 << BASTIM_CHANNEL_1))
			{
				bastim_ch1_int_flag++;
				drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_1);
			}
			if(status & (1 << BASTIM_CHANNEL_0))
			{
				bastim_ch2_int_flag++;
				drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_2);
			}
			if(status & (1 << BASTIM_CHANNEL_0))
			{
				bastim_ch3_int_flag++;
				drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_3);
			}
		}
		if((bastim_ch0_int_flag >= 3) && (bastim_ch1_int_flag >= 3) && (bastim_ch2_int_flag >= 3) && (bastim_ch3_int_flag >= 3))
		{
			break;
		}
	}

	test_printf_s("bastim 4ch autoreload.\r\n");

	bastim_ch0_deinit();
	bastim_ch1_deinit();
	bastim_ch2_deinit();
	bastim_ch3_deinit();
}

void bastim_4ch_test(void)
{
	uint32_t status, i;

	bastim_ch0_init();
	bastim_ch1_init();
	bastim_ch2_init();
	bastim_ch3_init();

	drv_bastim_autoreload_set(BASTIM, &bastim_ch0, BASTIM_CH_AUTORELOAD_DISABLE);
	drv_bastim_autoreload_set(BASTIM, &bastim_ch1, BASTIM_CH_AUTORELOAD_DISABLE);
	drv_bastim_autoreload_set(BASTIM, &bastim_ch2, BASTIM_CH_AUTORELOAD_DISABLE);
	drv_bastim_autoreload_set(BASTIM, &bastim_ch3, BASTIM_CH_AUTORELOAD_DISABLE);

	i = 0;

	while(1)
	{
		drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_0);
		drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_1);
		drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_2);
		drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_3);
	
		bastim_ch0_int_flag = 0;
		bastim_ch1_int_flag = 0;
		bastim_ch2_int_flag = 0;
		bastim_ch3_int_flag = 0;
	
		while(1)
		{
			status = drv_bastim_int_get(BASTIM);
			if(status != 0)
			{
				if(status & (1 << BASTIM_CHANNEL_0))
				{
					bastim_ch0_int_flag++;
					drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_0);
				}
				if(status & (1 << BASTIM_CHANNEL_1))
				{
					bastim_ch1_int_flag++;
					drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_1);
				}
				if(status & (1 << BASTIM_CHANNEL_0))
				{
					bastim_ch2_int_flag++;
					drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_2);
				}
				if(status & (1 << BASTIM_CHANNEL_0))
				{
					bastim_ch3_int_flag++;
					drv_bastim_int_clear(BASTIM, BASTIM_CHANNEL_3);
				}
			}
			if((bastim_ch0_int_flag == 1) && (bastim_ch1_int_flag == 1) && (bastim_ch2_int_flag == 1) && (bastim_ch3_int_flag == 1))
			{
				break;
			}
		}

		i++;
		if(i == 2)
			break;
	}

	test_printf_s("bastim 4ch no autoreload.\r\n");

	bastim_ch0_deinit();
	bastim_ch1_deinit();
	bastim_ch2_deinit();
	bastim_ch3_deinit();
}

void bastim_4ch_autoreload_int_test(void)
{
	uint32_t status;

	bastim_ch0_init();
	bastim_ch1_init();
	bastim_ch2_init();
	bastim_ch3_init();

	bastim_ch0_int_flag = 0;
	bastim_ch1_int_flag = 0;
	bastim_ch2_int_flag = 0;
	bastim_ch3_int_flag = 0;

	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_0);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_1);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_2);
	drv_bastim_int_enable(BASTIM, BASTIM_CHANNEL_3);
	NVIC_SetPriority(BastimCh0_IRQn, 0);
	NVIC_EnableIRQ(BastimCh0_IRQn);
	NVIC_SetPriority(BastimCh1_IRQn, 0);
	NVIC_EnableIRQ(BastimCh1_IRQn);
	NVIC_SetPriority(BastimCh2_IRQn, 0);
	NVIC_EnableIRQ(BastimCh2_IRQn);
	NVIC_SetPriority(BastimCh3_IRQn, 0);
	NVIC_EnableIRQ(BastimCh3_IRQn);

	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_0);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_1);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_2);
	drv_bastim_channel_enable(BASTIM, BASTIM_CHANNEL_3);

	while(!((bastim_ch0_int_flag >= 3) && (bastim_ch1_int_flag >= 3) && (bastim_ch2_int_flag >= 3) && (bastim_ch3_int_flag >= 3)));

	test_printf_s("bastim 4ch autoreload int.\r\n");

	NVIC_DisableIRQ(BastimCh0_IRQn);
	NVIC_DisableIRQ(BastimCh1_IRQn);
	NVIC_DisableIRQ(BastimCh2_IRQn);
	NVIC_DisableIRQ(BastimCh3_IRQn);
	bastim_ch0_deinit();
	bastim_ch1_deinit();
	bastim_ch2_deinit();
	bastim_ch3_deinit();
}

void bastim_channel0_int_callback(BASTIM_TypeDef *bastim)
{
	bastim_ch0_int_flag++;
}

void bastim_channel1_int_callback(BASTIM_TypeDef *bastim)
{
	bastim_ch1_int_flag++;
}

void bastim_channel2_int_callback(BASTIM_TypeDef *bastim)
{
	bastim_ch2_int_flag++;
}

void bastim_channel3_int_callback(BASTIM_TypeDef *bastim)
{
	bastim_ch3_int_flag++;
}

//===============================================
// testlist
//===============================================

TestMenu g_bastim_menu[] =
{
	{'1', bastim_4ch_autoreload_test,				"[BASTIM] bastim 4ch autoreload test\r\n"}, 
	{'2', bastim_4ch_test,							"[BASTIM] bastim 4ch test\r\n"}, 
	{'3', bastim_4ch_autoreload_int_test,			"[BASTIM] bastim 4ch autoreload int test\r\n"} 
};

void bastim_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_bastim_menu) / sizeof(TestMenu);
	show_testmenu(g_bastim_menu, num);	
	test_execute(g_bastim_menu, num);
}

#endif


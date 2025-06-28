//===============================================
//
//	File: advtim_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11242024
//	Version: v1.0
//
// 	This is advance timer test source file.
//
//===============================================

#include "advtim_test.h"

#ifdef ADVTIM_TEST

extern ADVTIM_HandleTypeDef hadvtim;

volatile uint16_t advtim_int_flag;
volatile uint8_t advtim_int_flag1;
volatile uint8_t advtim_int_flag2;
volatile uint8_t advtim_int_flag3;
volatile uint8_t advtim_case_flag;
volatile uint8_t advtim_temp;

//===============================================
// test prepare
//===============================================

//===============================================
// test functions
//===============================================

void advtim_autoreload_test(void)
{
	advtim_count_int_init();
	advtim_int_flag = 0;
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);

	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		if((advtim_int_flag > 0))
		{
			break;
		}
	}

	test_printf_s("advtim autoreload.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_mix_count_test(void)
{
	advtim_mix_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);

	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;

		drv_advtim_gen_set_psc(&hadvtim, advtim_int_flag + 1);
		drv_advtim_gen_set_arr(&hadvtim, advtim_int_flag + 400);

		if((advtim_int_flag > 9))
		{
			break;
		}
	}

	test_printf_s("advtim mix count.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_mix_mode_test(void)
{
	advtim_mix_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);

	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_dir(&hadvtim, advtim_int_flag % 2);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 9))
		{
			break;
		}
	}

	test_printf_s("advtim mix mode.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_mix_cm_test(void)
{
	advtim_mix_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_DOWN);
	drv_advtim_gen_set_cms(&hadvtim, ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_psc(&hadvtim, advtim_int_flag + 1);
		drv_advtim_gen_set_arr(&hadvtim, advtim_int_flag + 400);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 9))
		{
			break;
		}
	}

	test_printf_s("advtim mix cms.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_pwm_test(void)
{
	advtim_ch1_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
//	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
//			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_DOWN);	
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch1 pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_ch2_pwm_test(void)
{
	advtim_ch1_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE14);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE15);
//	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE12);
//	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE13);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
//		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 20);
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, 150);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, 350);
//		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, 0);
//		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, 500);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch1 ch2 pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_test(void)
{
	advtim_ch_all_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE12);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE13);
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE14);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE15);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 20);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, 150);
		drv_advtim_gen_set_channel4_output_compare_value(&hadvtim, 350);
		drv_advtim_gen_set_channel5_output_compare_value(&hadvtim, 200);
		drv_advtim_gen_set_channel6_output_compare_value(&hadvtim, 300);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch1 ch2 pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_with_channel5_test(void)
{
	advtim_ch_all_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE14);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE15);
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE12);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE13);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE15);
	drv_advtim_gen_set_channel1_output_compare_with_channel5_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_WITH_CHANNEL5_MODE);
	drv_advtim_gen_set_channel2_output_compare_with_channel5_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_WITH_CHANNEL5_MODE);
	drv_advtim_gen_set_channel3_output_compare_with_channel5_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_WITH_CHANNEL5_MODE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 20);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, 150);
		drv_advtim_gen_set_channel4_output_compare_value(&hadvtim, 350);
		drv_advtim_gen_set_channel5_output_compare_value(&hadvtim, 225);
		drv_advtim_gen_set_channel6_output_compare_value(&hadvtim, 300);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim all channels pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_pwm_with_deadzone_test(void)
{
	advtim_ch1_pwm_with_deadzone_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
			drv_advtim_gen_set_channel1_output_positive_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel1_output_negative_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch1 deadzone pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch123_pwm_with_deadzone_test(void)
{
	advtim_ch123_pwm_with_deadzone_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
			drv_advtim_gen_set_channel1_output_positive_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel1_output_negative_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel2_output_positive_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel2_output_negative_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel3_output_positive_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
			drv_advtim_gen_set_channel3_output_negative_pwm_polarity(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch123 deadzone pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_with_deadzone_test(void)
{
	advtim_ch_all_pwm_with_deadzone_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch all deadzone pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_mode_with_deadzone_test(void)
{
	advtim_ch1_mode_with_deadzone_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel1_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel1_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
			drv_advtim_gen_set_channel1_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch all deadzone pwm.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_and_gpio_with_deadzone_test(void)
{
	advtim_ch_all_pwm_and_gpio_with_deadzone_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel1_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel1_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
	drv_advtim_gen_set_channel2_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_positive_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
			drv_advtim_gen_set_channel1_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
			drv_advtim_gen_set_channel2_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
			drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch all deadzone pwm.\r\n");

	drv_advtim_gen_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_step_once_input_test(void)
{
	uint32_t temp;

	advtim_ch1_once_cap_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_cap_set_psc(&hadvtim, 10);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);

	advtim_deinit();

	test_printf_s("advtim ch1 step once input.\r\n");
}

void advtim_ch1_step_input_test(void)
{
	uint32_t temp;

	advtim_ch1_cap_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	drv_advtim_cap_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimCap_IRQn);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	drv_advtim_cap_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimCap_IRQn);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_cap_set_psc(&hadvtim, 10);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);

	advtim_deinit();

	test_printf_s("advtim ch1 step input.\r\n");
}

void advtim_ch1_pwm_input_test(void)
{
	uint32_t temp;

	advtim_ch1_cap_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_disable(&hadvtim);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_disable(&hadvtim);

	drv_advtim_cap_set_channel1_input_positive_polarity(&hadvtim, ADVTIM_CAP_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_cap_set_psc(&hadvtim, 10);
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
//		if(advtim_int_flag1 == 10)
//		{
//		}
		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim);
		writereg32(0x40000008, temp);

		temp = (drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim) << 16) | drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
		writereg32(0x4000000c, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if(advtim_int_flag2)
		{
			break;
		}
	}

	NVIC_DisableIRQ(AdvtimCap_IRQn);

	advtim_deinit();

	test_printf_s("advtim ch1 pwm input.\r\n");
}

void advtim_ch1_encoder_input_test(void)
{
	uint32_t temp;

	advtim_ch1_enc_direct_first_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimCap_IRQn);

	advtim_ch1_enc_quadrature_first_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_ch1_enc_direct_first_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_enc_set_channel1_encoder_input_direct_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_enc_set_channel1_encoder_input_quadrature_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_ch1_enc_quadrature_first_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_enc_set_channel1_encoder_input_direct_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_enc_set_channel1_encoder_input_quadrature_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_deinit();

	test_printf_s("advtim ch1 encoder d input.\r\n");
}

void advtim_ch1_encoder_both_edge_input_test(void)
{
	uint32_t temp;

	advtim_ch1_enc_direct_both_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_ch1_enc_quadrature_both_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_ch1_enc_direct_both_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_enc_set_channel1_encoder_input_direct_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_enc_set_channel1_encoder_input_quadrature_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_ch1_enc_quadrature_both_edge_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_enc_set_channel1_encoder_input_direct_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_enc_set_channel1_encoder_input_quadrature_polarity(&hadvtim, ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 2)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_deinit();

	test_printf_s("advtim ch1 encoder d both edge input.\r\n");
}

void advtim_ch1_encoder_dq_input_test(void)
{
	uint32_t temp;

	advtim_ch1_enc_direct_quadrature_forward_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 4)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	advtim_deinit();

	advtim_ch1_enc_direct_quadrature_reverse_int_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	while(1)
	{
		temp = (drv_advtim_enc_get_channel1_encoder_direction(&hadvtim) << 16) | drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
		writereg32(0x40000008, temp);

		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag3);
		if(advtim_int_flag == 4)
		{
			break;
		}
	}

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);

	test_printf_s("advtim ch1 encoder dq both edge input.\r\n");
}

void advtim_ch_all_pwm_with_deadzone_with_break_test(void)
{
//	advtim_ch_all_pwm_with_break_init();
	advtim_ch_all_pwm_with_deadzone_with_break_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1)
		{
			if(advtim_int_flag2 > 0)
			{
				break;
			}
		}
		if(advtim_int_flag2 > 0)
		{
			break;
		}
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
	}

	drv_advtim_gen_disable(&hadvtim);

	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{	
		while(advtim_int_flag == advtim_int_flag1);	
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
		if((advtim_int_flag > 19))
		{
			break;
		}
	}

	test_printf_s("advtim ch all deadzone pwm with break.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_and_gpio_with_deadzone_with_break_test(void)
{
//	advtim_ch_all_pwm_and_gpio_with_deadzone_init();
	advtim_ch_all_pwm_with_deadzone_with_break_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel1_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel1_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel2_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
	drv_advtim_gen_set_channel2_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_positive_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel5_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE6);
	drv_advtim_gen_set_channel6_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE7);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	while(1)
	{
		while(advtim_int_flag == advtim_int_flag1)
		{
			if(advtim_int_flag2 > 0)
			{
				break;
			}
		}
		if(advtim_int_flag2 > 0)
		{
			break;
		}
		advtim_int_flag1++;
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		drv_advtim_gen_set_channel3_output_compare_value(&hadvtim, advtim_int_flag1 * 25);
		if(advtim_int_flag1 == 10)
		{
			drv_advtim_gen_set_dir(&hadvtim, ADVTIM_GEN_DIR_COUNTER_UP);	
		}
		writereg32(0x40000000, advtim_int_flag);
		writereg32(0x40000004, advtim_int_flag1);
	}

	test_printf_s("advtim ch all deadzone pwm with break.\r\n");

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_with_deadzone_with_break_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch_all_pwm_with_deadzone_with_break_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch_all_pwm_with_deadzone_with_break_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	advtim_case_flag = 1;
	advtim_temp = 0;
	drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_positive_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch_up_all_pwm_with_deadzone_with_break_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	advtim_case_flag = 1;
	advtim_temp = 0;
	drv_advtim_gen_set_channel2_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
	drv_advtim_gen_set_channel2_output_negative_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	drv_advtim_gen_set_channel3_output_positive_mode(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE);
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	advtim_case_flag = 1;
	advtim_temp = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void advtim_ch1_step_input_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch1_cap_step_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimCap_IRQn);
	advtim_deinit();
}

void advtim_ch1_pwm_input_on_test(void)
{
	test_printf_s("Press Q to exit.\r\n");

	advtim_ch1_cap_pwm_on_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	advtim_int_flag2 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimCap_IRQn, 0);
	NVIC_EnableIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_enable(&hadvtim);

	exit_current_test_loop();

	NVIC_DisableIRQ(AdvtimCap_IRQn);
	advtim_deinit();
}

void advtim_ch1_encoder_direct_both_edge_on_test(void)
{
	uint32_t temp;

	advtim_ch1_enc_direct_both_edge_on_init();
	advtim_int_flag = 0;
	advtim_int_flag3 = 0;
	drv_advtim_config_sw_update(&hadvtim);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_enable(&hadvtim);

	exit_current_test_loop();

	drv_advtim_enc_disable(&hadvtim);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);
}

void advtim_gen_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
	
	if(advtim_case_flag == 1)
	{
		drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, advtim_int_flag);
		drv_advtim_gen_set_channel2_output_compare_value(&hadvtim, advtim_int_flag);
		if(advtim_int_flag >= 2499)
		{
			advtim_int_flag = 0;
			if(advtim_temp)
			{
				drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
				drv_advtim_gen_set_channel3_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
				advtim_temp = 0;
			}
			else
			{
				drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
				drv_advtim_gen_set_channel3_output_negative_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
				advtim_temp = 1;
			}
		}
	}
}

void advtim_gen_int_reloading_reaching_rcr_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
}

void advtim_gen_int_fault_detected_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag2++;
	test_printf_s("Fault detected!\r\n");
	writereg32(0x40000008, advtim_int_flag2);
	writereg32(0x4000000c, 0xe);
}

void advtim_cap_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag2 = drv_advtim_cap_get_channel1_input_capture_first_polarity_reload_value(&hadvtim) * 25 + drv_advtim_cap_get_channel1_input_capture_first_polarity_counter_value(&hadvtim);
	writereg32(0x40000000, advtim_int_flag2 * 25);
	advtim_int_flag2 = drv_advtim_cap_get_channel1_input_capture_last_polarity_reload_value(&hadvtim) * 25 + drv_advtim_cap_get_channel1_input_capture_last_polarity_counter_value(&hadvtim);
	writereg32(0x40000004, advtim_int_flag2 * 25);
}

void advtim_cap_int_reloading_reaching_rcr_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
}

void advtim_enc_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
	writereg32(0x40000000, drv_advtim_enc_get_channel1_encoder_counter(&hadvtim));
	writereg32(0x40000004, advtim_int_flag3);
}

void advtim_enc_int_detected_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag3++;
}

//===============================================
// testlist
//===============================================

TestMenu g_advtim_menu[] =
{
//	{'1', advtim_autoreload_test,				"[ADVTIM] advtim autoreload test\r\n"}, 
	{'q', advtim_ch_all_pwm_with_deadzone_with_break_on_test,				"[ADVTIM] advtim all channels pwm output with deadzone with break detection test...\r\n"}, 
	{'w', advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test,				"[ADVTIM] advtim all channels pwm gpio output with deadzone with break detection test...\r\n"}, 
	{'e', advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test,				"[ADVTIM] advtim all channels up pwm gpio output with deadzone with break detection test...\r\n"}, 
	{'r', advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test,				"[ADVTIM] advtim all channels pwm logic output with deadzone with break detection test...\r\n"}, 
	{'a', advtim_ch1_step_input_on_test,				"[ADVTIM] advtim channel1 step input capture test...\r\n"}, 
	{'s', advtim_ch1_pwm_input_on_test,				"[ADVTIM] advtim channel1 pwm input capture test...\r\n"}, 
	{'d', advtim_ch1_encoder_direct_both_edge_on_test,				"[ADVTIM] advtim channel1 encoder input direct both edge test...\r\n"}, 
};

void advtim_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_advtim_menu) / sizeof(TestMenu);
	show_testmenu(g_advtim_menu, num);	
	test_execute(g_advtim_menu, num);
}

#endif


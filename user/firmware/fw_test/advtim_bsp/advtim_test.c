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

volatile uint8_t advtim_int_flag;
volatile uint8_t advtim_int_flag1;

//===============================================
// test prepare
//===============================================

//===============================================
// test functions
//===============================================

void advtim_autoreload_test(void)
{
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
	advtim_ch_all_pwm_int_init();
	advtim_int_flag = 0;
	advtim_int_flag1 = 0;
	drv_advtim_gen_set_channel3_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE14);
	drv_advtim_gen_set_channel4_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE15);
	drv_advtim_gen_set_channel1_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE12);
	drv_advtim_gen_set_channel2_output_compare_mode(&hadvtim, ADVTIM_GEN_OUTPUT_COMPARE_MODE13);
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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
	uint32_t status;
	
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

	NVIC_DisableIRQ(AdvtimGen_IRQn);
	advtim_deinit();
}

void  advtim_gen_int_reload_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
}

void  advtim_gen_int_reload_reaching_rcr_callback(ADVTIM_HandleTypeDef *advtim)
{
	advtim_int_flag++;
}

//===============================================
// testlist
//===============================================

TestMenu g_advtim_menu[] =
{
	{'1', advtim_autoreload_test,				"[ADVTIM] advtim autoreload test\r\n"}, 
};

void advtim_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_advtim_menu) / sizeof(TestMenu);
	show_testmenu(g_advtim_menu, num);	
	test_execute(g_advtim_menu, num);
}

#endif


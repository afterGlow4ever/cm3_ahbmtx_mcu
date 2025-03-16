//===============================================
//
//	File: advtim_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 11242024
//	Version: v1.0
//
// 	This is advance timer bsp source file.
//
//===============================================

#include "advtim_bsp.h"

ADVTIM_HandleTypeDef hadvtim;

//===============================================
// advance timer init & deinit
//===============================================

void advtim_count_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 1;
	hadvtim.gen_cfg.arr = 20;
	hadvtim.gen_cfg.rcr = 10;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
}

void advtim_mix_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 1;
	hadvtim.gen_cfg.arr = 400;
	hadvtim.gen_cfg.rcr = 10;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch1_pwm_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
//	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
//	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch1_ch2_pwm_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel2_output_compare_value = 1;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch_all_pwm_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel2_output_compare_value = 1;
	hadvtim.gen_cfg.channel3_output_compare_value = 0;
	hadvtim.gen_cfg.channel4_output_compare_value = 1;
	hadvtim.gen_cfg.channel5_output_compare_value = 0;
	hadvtim.gen_cfg.channel6_output_compare_value = 1;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch1_pwm_with_deadzone_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.deadzone_time = 5;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch123_pwm_with_deadzone_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
//	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel2_output_compare_value = 0;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel3_output_compare_value = 0;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch_all_pwm_with_deadzone_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
//	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel2_output_compare_value = 0;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel3_output_compare_value = 0;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel4_output_compare_value = 100;
	hadvtim.gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel5_output_compare_value = 100;
	hadvtim.gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel6_output_compare_value = 250;
	hadvtim.gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch1_mode_with_deadzone_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
//	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_ch_all_pwm_and_gpio_with_deadzone_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 20;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
//	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 0;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel2_output_compare_value = 0;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel3_output_compare_value = 0;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel4_output_compare_value = 100;
	hadvtim.gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel5_output_compare_value = 100;
	hadvtim.gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel6_output_compare_value = 250;
	hadvtim.gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACH_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING);
}

void advtim_deinit(void)
{
	drv_advtim_gen_deinit(&hadvtim);
}



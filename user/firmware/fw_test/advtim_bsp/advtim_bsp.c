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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
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
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
}

void advtim_ch1_once_cap_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.cap_cfg.psc = 2;
	hadvtim.cap_cfg.arr = 35;
	hadvtim.cap_cfg.rcr = 1;
	hadvtim.cap_cfg.capture_delay_time = 4;
	hadvtim.cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_STEP_MODE;
	hadvtim.cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_ENABLE;
	hadvtim.cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	hadvtim.cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_cap_init(&hadvtim);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADED);
}

void advtim_ch1_cap_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.cap_cfg.psc = 2;
	hadvtim.cap_cfg.arr = 35;
	hadvtim.cap_cfg.rcr = 10;
	hadvtim.cap_cfg.capture_delay_time = 4;
	hadvtim.cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_STEP_MODE;
	hadvtim.cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_ENABLE;
	hadvtim.cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	hadvtim.cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_cap_init(&hadvtim);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADED);
}

void advtim_ch1_cap_pwm_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.cap_cfg.psc = 2;
	hadvtim.cap_cfg.arr = 35;
	hadvtim.cap_cfg.rcr = 10;
	hadvtim.cap_cfg.capture_delay_time = 4;
	hadvtim.cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_PWM_MODE;
	hadvtim.cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_ENABLE;
	hadvtim.cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	hadvtim.cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_cap_init(&hadvtim);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADED);
}

void advtim_ch1_enc_direct_first_edge_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_FIRST_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch1_enc_quadrature_first_edge_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_FIRST_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch1_enc_direct_both_edge_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch1_enc_quadrature_both_edge_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch1_enc_direct_quadrature_forward_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch1_enc_direct_quadrature_reverse_int_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 0x8000;
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_REVERSE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_ch_all_pwm_with_deadzone_with_break_init(void)
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
	hadvtim.gen_cfg.channel4_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
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
	hadvtim.gen_cfg.fault_detection_delay_time = 6;
	hadvtim.gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel1_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	hadvtim.gen_cfg.break_channel2_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_HIGH_LEVEL_ACTIVE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
}

void advtim_ch_all_pwm_with_deadzone_with_break_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 0;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_DOWN;
	hadvtim.gen_cfg.channel1_output_compare_value = 100;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel1_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel1_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_compare_value = 250;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.channel2_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_compare_value = 400;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel3_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_value = 200;
	hadvtim.gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel4_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel5_output_compare_value = 300;
	hadvtim.gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel5_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel5_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel6_output_compare_value = 250;
	hadvtim.gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel6_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel6_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.fault_detection_delay_time = 6;
	hadvtim.gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel1_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	hadvtim.gen_cfg.break_channel2_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
}

void advtim_ch_up_all_pwm_with_deadzone_with_break_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 0;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;
	hadvtim.gen_cfg.channel1_output_compare_value = 100;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel1_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel1_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_compare_value = 250;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.channel2_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_compare_value = 400;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel3_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_value = 200;
	hadvtim.gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel4_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel5_output_compare_value = 300;
	hadvtim.gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel5_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel5_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel6_output_compare_value = 250;
	hadvtim.gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel6_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel6_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.fault_detection_delay_time = 6;
	hadvtim.gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel1_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	hadvtim.gen_cfg.break_channel2_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
}

void advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = 2;
	hadvtim.gen_cfg.arr = 500;
	hadvtim.gen_cfg.rcr = 0;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_CENTER_ALIGNED_MODE0;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;
	hadvtim.gen_cfg.channel1_output_compare_value = 100;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE12;
	hadvtim.gen_cfg.channel1_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel1_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_compare_value = 400;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel2_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE13;
	hadvtim.gen_cfg.channel2_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_compare_value = 200;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel3_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE14;
	hadvtim.gen_cfg.channel3_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_negative_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_value = 300;
	hadvtim.gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel4_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel4_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE15;
	hadvtim.gen_cfg.channel5_output_compare_value = 250;
	hadvtim.gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel5_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel5_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE6;
	hadvtim.gen_cfg.channel6_output_compare_value = 250;
	hadvtim.gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;
	hadvtim.gen_cfg.channel6_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel6_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.deadzone_time = 10;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	hadvtim.gen_cfg.fault_detection_delay_time = 6;
	hadvtim.gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel1_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	hadvtim.gen_cfg.break_channel2_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
}

void advtim_ch1_cap_step_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.cap_cfg.psc = 2;
	hadvtim.cap_cfg.arr = 25;
	hadvtim.cap_cfg.rcr = 0;
	hadvtim.cap_cfg.capture_delay_time = 4;
	hadvtim.cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_STEP_MODE;
	hadvtim.cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_ENABLE;
	hadvtim.cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	hadvtim.cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_cap_init(&hadvtim);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADED);
}

void advtim_ch1_cap_pwm_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.cap_cfg.psc = 2;
	hadvtim.cap_cfg.arr = 25;
	hadvtim.cap_cfg.rcr = 0;
	hadvtim.cap_cfg.capture_delay_time = 4;
	hadvtim.cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_PWM_MODE;
	hadvtim.cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_ENABLE;
	hadvtim.cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	hadvtim.cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_cap_init(&hadvtim);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	drv_advtim_cap_int_enable(&hadvtim, ADVTIM_CAP_INT_RELOADED);
}

void advtim_ch1_enc_direct_both_edge_on_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.enc_cfg.arr = 4000;// 1us
	hadvtim.enc_cfg.encoder_delay_time = 4;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void advtim_deinit(void)
{
	drv_advtim_gen_deinit(&hadvtim);
	drv_advtim_cap_deinit(&hadvtim);
	drv_advtim_enc_deinit(&hadvtim);
}



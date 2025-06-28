//===============================================
//
//	File: advtim_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 05022025
//	Version: v1.0
//
// 	This is advance timer bsp source file.
//
//===============================================

#include "dcm.h"

ADVTIM_HandleTypeDef hadvtim;

//===============================================
// advance timer init & deinit
//===============================================

void advtim_init(void)
{
	hadvtim.regs = ADVTIM;
	hadvtim.gen_cfg.psc = DCM_PWM_PRESCALER_COUNT;
	hadvtim.gen_cfg.arr = DCM_PWM_PERIOD_COUNT;
	hadvtim.gen_cfg.rcr = 0;
	hadvtim.gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	hadvtim.gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;
	hadvtim.gen_cfg.channel1_output_compare_value = DCM_PWM_INITIAL_COMPARE_VALUE;
	hadvtim.gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	hadvtim.gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_REVERSE;// use to oscilloscope
	hadvtim.gen_cfg.channel1_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_MODE7;
	hadvtim.gen_cfg.channel1_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel1_output_negative_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel2_output_compare_value = DCM_PWM_PERIOD_COUNT;
	hadvtim.gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	hadvtim.gen_cfg.channel2_output_positive_mode = ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE;
	hadvtim.gen_cfg.channel2_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.channel3_output_compare_value = DCM_PWM_PERIOD_COUNT;
	hadvtim.gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_ENABLE;
	hadvtim.gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	hadvtim.gen_cfg.channel3_output_positive_mode = ADVTIM_GEN_OUTPUT_CHANNEL_GPIO_MODE;
	hadvtim.gen_cfg.channel3_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	hadvtim.gen_cfg.deadzone_time = DCM_PWM_DEADZONE_TIME;
	hadvtim.gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_DISABLE;// no h bridge
	hadvtim.gen_cfg.fault_detection_delay_time = DCM_FAULT_DETECTION_DELAY_TIME;
	hadvtim.gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_ENABLE;
	hadvtim.gen_cfg.break_channel1_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	hadvtim.gen_cfg.break_channel2_polarity =ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;

	hadvtim.enc_cfg.arr = DCM_ENCODER_PERIOD_COUNT;
	hadvtim.enc_cfg.encoder_delay_time = DCM_ENCODER_DELAY_TIME;
	hadvtim.enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_BOTH_EDGE_MODE;
	hadvtim.enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_ENABLE;
	hadvtim.enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	hadvtim.enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;

	drv_advtim_config_hw_update_enable(&hadvtim);
	drv_advtim_gen_init(&hadvtim);
	drv_advtim_enc_init(&hadvtim);
	drv_advtim_config_sw_update(&hadvtim);

	NVIC_SetPriority(AdvtimGen_IRQn, 0);
	NVIC_SetPriority(AdvtimEnc_IRQn, 0);
	NVIC_EnableIRQ(AdvtimGen_IRQn);
	NVIC_EnableIRQ(AdvtimEnc_IRQn);
}

void advtim_deinit(void)
{
	NVIC_DisableIRQ(AdvtimGen_IRQn);
	NVIC_DisableIRQ(AdvtimEnc_IRQn);
	drv_advtim_gen_deinit(&hadvtim);
	drv_advtim_enc_deinit(&hadvtim);
}


//===============================================
//
//	File: drv_advtim_gen.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is source file for advance timer pwm generator.
//
//===============================================

#include "drv_advtim.h"

#ifdef ADVTIM_DRIVER

//===============================================
// advance timer pwm generator init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_advtim_gen_default_config(ADVTIM_HandleTypeDef *advtim)
{
	advtim->gen_cfg.psc = 0x2;
	advtim->gen_cfg.arr = 0x32;	
	advtim->gen_cfg.rcr = 0;
	advtim->gen_cfg.cms = ADVTIM_GEN_CMS_EDGE_ALIGNED_MODE;
	advtim->gen_cfg.dir = ADVTIM_GEN_DIR_COUNTER_UP;
	advtim->gen_cfg.channel1_output_compare_value = 0;
	advtim->gen_cfg.channel1_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel1_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel1_output_negative_value_in_gpio_mode	= ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel1_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel1_output_negative_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel1_output_positive_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel1_output_negative_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel1_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel1_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel1_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel1_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel2_output_compare_value = 0;
	advtim->gen_cfg.channel2_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel2_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel2_output_negative_value_in_gpio_mode	= ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel2_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel2_output_negative_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel2_output_positive_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel2_output_negative_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel2_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel2_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel2_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel2_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel3_output_compare_value = 0;
	advtim->gen_cfg.channel3_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel3_output_positive_value_in_gpio_mode = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel3_output_negative_value_in_gpio_mode	= ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE;
	advtim->gen_cfg.channel3_output_positive_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel3_output_negative_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel3_output_positive_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel3_output_negative_mode = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_MODE;
	advtim->gen_cfg.channel3_output_positive_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel3_output_negative_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel3_output_positive_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel3_output_negative_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel4_output_compare_value = 0;
	advtim->gen_cfg.channel4_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel4_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel4_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel4_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel5_output_compare_value = 0;
	advtim->gen_cfg.channel5_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel5_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel5_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel5_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel6_output_compare_value = 0;
	advtim->gen_cfg.channel6_output_compare_mode = ADVTIM_GEN_OUTPUT_COMPARE_DISABLE;
	advtim->gen_cfg.channel6_output_safety_and_initial_value = ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_SAFETY_AND_INITIAL_STATE;
	advtim->gen_cfg.channel6_output_enable = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_DISABLE;
	advtim->gen_cfg.channel6_output_polarity = ADVTIM_GEN_OUTPUT_CHANNEL_PWM_POLARITY_FORWARD;
	advtim->gen_cfg.channel1_output_compare_with_channel5_mode = ADVTIM_GEN_OUTPUT_COMPARE_WITHOUT_CHANNEL5_MODE;
	advtim->gen_cfg.channel2_output_compare_with_channel5_mode = ADVTIM_GEN_OUTPUT_COMPARE_WITHOUT_CHANNEL5_MODE;
	advtim->gen_cfg.channel3_output_compare_with_channel5_mode = ADVTIM_GEN_OUTPUT_COMPARE_WITHOUT_CHANNEL5_MODE;
	advtim->gen_cfg.deadzone_time = 5;
	advtim->gen_cfg.channel1_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	advtim->gen_cfg.channel2_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	advtim->gen_cfg.channel3_output_deadzone_enable = ADVTIM_GEN_OUTPUT_CHANNEL_DEADZONE_ENABLE;
	advtim->gen_cfg.fault_detection_delay_time = 6;
	advtim->gen_cfg.break_channel1_enable = ADVTIM_BREAK_CHANNEL_DISABLE;
	advtim->gen_cfg.break_channel2_enable = ADVTIM_BREAK_CHANNEL_DISABLE;
	advtim->gen_cfg.break_channel1_polarity = ADVTIM_BREAK_CHANNEL_POLARITY_LOW_LEVEL_ACTIVE;
	advtim->gen_cfg.break_channel2_polarity = ADVTIM_BREAK_CHANNEL_POLARITY_HIGH_LEVEL_ACTIVE;
}

bool drv_advtim_gen_set_config(ADVTIM_HandleTypeDef *advtim)
{
	uint32_t reg_temp = 0;
	uint8_t reg_check = 0;

	reg_temp = 	(advtim->gen_cfg.psc					<< 16) |
				(advtim->gen_cfg.arr					<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe0)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.rcr					<< 16) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe1)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.cms					<<  1) |
				(advtim->gen_cfg.dir					<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe2)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel1_output_compare_value						<< 16) |
				(advtim->gen_cfg.channel1_output_positive_value_in_gpio_mode		<< 14) | 
				(advtim->gen_cfg.channel1_output_negative_value_in_gpio_mode		<< 13) | 
				(advtim->gen_cfg.channel1_output_positive_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel1_output_negative_safety_and_initial_value	<< 11) | 
				(advtim->gen_cfg.channel1_output_positive_mode						<< 10) | 
				(advtim->gen_cfg.channel1_output_negative_mode						<<  9) | 
				(advtim->gen_cfg.channel1_output_deadzone_enable 					<<  8) | 
				(advtim->gen_cfg.channel1_output_positive_enable   					<<  5) | 
				(advtim->gen_cfg.channel1_output_negative_enable   					<<  4) | 
				(advtim->gen_cfg.channel1_output_positive_polarity 					<<  7) | 
				(advtim->gen_cfg.channel1_output_negative_polarity 					<<  6) | 
				(advtim->gen_cfg.channel1_output_compare_mode						<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe3)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel2_output_compare_value 						<< 16) |
				(advtim->gen_cfg.channel2_output_positive_value_in_gpio_mode		<< 14) | 
				(advtim->gen_cfg.channel2_output_negative_value_in_gpio_mode		<< 13) | 
				(advtim->gen_cfg.channel2_output_positive_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel2_output_negative_safety_and_initial_value	<< 11) | 
				(advtim->gen_cfg.channel2_output_positive_mode						<< 10) | 
				(advtim->gen_cfg.channel2_output_negative_mode						<<  9) | 
				(advtim->gen_cfg.channel2_output_deadzone_enable 					<<  8) | 
				(advtim->gen_cfg.channel2_output_positive_enable   					<<  5) | 
				(advtim->gen_cfg.channel2_output_negative_enable   					<<  4) | 
				(advtim->gen_cfg.channel2_output_positive_polarity 					<<  7) | 
				(advtim->gen_cfg.channel2_output_negative_polarity 					<<  6) | 
				(advtim->gen_cfg.channel2_output_compare_mode 						<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe4)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel3_output_compare_value 						<< 16) |
				(advtim->gen_cfg.channel3_output_positive_value_in_gpio_mode		<< 14) | 
				(advtim->gen_cfg.channel3_output_negative_value_in_gpio_mode		<< 13) | 
				(advtim->gen_cfg.channel3_output_positive_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel3_output_negative_safety_and_initial_value	<< 11) | 
				(advtim->gen_cfg.channel3_output_positive_mode						<< 10) | 
				(advtim->gen_cfg.channel3_output_negative_mode						<<  9) | 
				(advtim->gen_cfg.channel3_output_deadzone_enable 					<<  8) | 
				(advtim->gen_cfg.channel3_output_positive_enable   					<<  5) | 
				(advtim->gen_cfg.channel3_output_negative_enable   					<<  4) | 
				(advtim->gen_cfg.channel3_output_positive_polarity 					<<  7) | 
				(advtim->gen_cfg.channel3_output_negative_polarity 					<<  6) | 
				(advtim->gen_cfg.channel3_output_compare_mode 						<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe5)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel4_output_compare_value 				<< 16) |
				(advtim->gen_cfg.channel4_output_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel4_output_enable   					<<  5) | 
				(advtim->gen_cfg.channel4_output_polarity 					<<  7) | 
				(advtim->gen_cfg.channel4_output_compare_mode 				<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe6)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel5_output_compare_value 				<< 16) |
				(advtim->gen_cfg.channel1_output_compare_with_channel5_mode << 13) |
				(advtim->gen_cfg.channel2_output_compare_with_channel5_mode << 14) |
				(advtim->gen_cfg.channel3_output_compare_with_channel5_mode << 15) |
				(advtim->gen_cfg.channel5_output_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel5_output_enable   					<<  5) | 
				(advtim->gen_cfg.channel5_output_polarity 					<<  7) | 
				(advtim->gen_cfg.channel5_output_compare_mode 				<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe7)), reg_temp, reg_temp);

	reg_temp = 	(advtim->gen_cfg.channel6_output_compare_value 				<< 16) |
				(advtim->gen_cfg.channel6_output_safety_and_initial_value	<< 12) | 
				(advtim->gen_cfg.channel6_output_enable   					<<  5) | 
				(advtim->gen_cfg.channel6_output_polarity 					<<  7) | 
				(advtim->gen_cfg.channel6_output_compare_mode 				<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe8)), reg_temp, reg_temp);
	
	reg_temp = 	(advtim->gen_cfg.fault_detection_delay_time << 16) |
				(advtim->gen_cfg.break_channel2_polarity	<< 13) |
				(advtim->gen_cfg.break_channel2_enable 		<< 12) |
				(advtim->gen_cfg.break_channel1_polarity	<< 11) |
				(advtim->gen_cfg.break_channel1_enable 		<< 10) |
				(advtim->gen_cfg.deadzone_time 				<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->gen_pe9)), reg_temp, reg_temp);

	return reg_check;
}

bool drv_advtim_gen_init(ADVTIM_HandleTypeDef *advtim)
{
	bool status;

	status = drv_advtim_gen_set_config(advtim);
	drv_advtim_gen_logic_reset(advtim);
	drv_advtim_gen_int_allclear(advtim);
	drv_advtim_config_sw_update(advtim);

	return status;
}

void drv_advtim_gen_deinit(ADVTIM_HandleTypeDef *advtim)
{
	drv_advtim_gen_disable(advtim);
	drv_advtim_gen_int_disable_all(advtim);
	drv_advtim_gen_int_allclear(advtim);
}

//===============================================
// advtim gen weak function
//===============================================

void __attribute__((weak)) advtim_gen_int_fault_detected_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

void __attribute__((weak)) advtim_gen_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

void __attribute__((weak)) advtim_gen_int_reloading_reaching_rcr_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

//===============================================
// advtim gen interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_advtim_gen_interrupt_handler(ADVTIM_HandleTypeDef *advtim)
{
	uint8_t status;
	status = drv_advtim_gen_int_get(advtim) & advtim->regs->gen_int_en;

	if(status & ADVTIM_GEN_INT_FAULT_DETECTED)
	{
		advtim_gen_int_fault_detected_callback(advtim);
		drv_advtim_gen_int_clear(advtim, ADVTIM_GEN_INT_FAULT_DETECTED);
	}
	if(status & ADVTIM_GEN_INT_RELOADED)
	{
		advtim_gen_int_reloaded_callback(advtim);
		drv_advtim_gen_int_clear(advtim, ADVTIM_GEN_INT_RELOADED);
	}
	if(status & ADVTIM_GEN_INT_RELOADING_REACHING_RCR)
	{
		advtim_gen_int_reloading_reaching_rcr_callback(advtim);
		drv_advtim_gen_int_clear(advtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	}
}

#endif


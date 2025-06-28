//===============================================
//
//	File: pwm.c
//	Author: afterGlow,4ever
//	Date: 05022025
//	Version: v1.0
//
// 	This file is related to pwm output. 
//
//===============================================

#include "dcm.h"

extern dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;

//===============================================
// pwm enable or disable
//===============================================

void dcm_pwm_disable(void)
{
	// disable int
	drv_advtim_gen_int_disable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_disable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_disable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
	drv_advtim_gen_int_allclear(&hadvtim);
	// disable pwm
 	drv_advtim_gen_logic_reset(&hadvtim); 
}

void dcm_pwm_enable(void)
{
	// enable pwm
	drv_advtim_gen_enable(&hadvtim);	
	//enable int
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADING_REACHING_RCR);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_RELOADED);
	drv_advtim_gen_int_enable(&hadvtim, ADVTIM_GEN_INT_FAULT_DETECTED);
}

//===============================================
// set pwm dutycycle
//===============================================

void dcm_pwm_set(float speed)
{
	DCM.speed.speed_set_dutycycle = speed * DCM_PWM_PERIOD_COUNT / DCM_MAX_SPEED ;
	drv_advtim_gen_set_channel1_output_compare_value(&hadvtim, DCM.speed.speed_set_dutycycle);
}

//===============================================
// set direction
// In tb6612, 2 GPIOs are used in direction.
//===============================================

void dcm_dir_set(dcm_dir_e dir)
{
	DCM.direction.dir_set = dir;
	if(DCM.direction.dir_set == MOTOR_FWD)
	{
		drv_advtim_gen_set_channel2_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
		drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	}
	else
	{
		drv_advtim_gen_set_channel3_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_LOW_IN_GPIO_MODE);
		drv_advtim_gen_set_channel2_output_positive_gpio_value(&hadvtim, ADVTIM_GEN_OUTPUT_CHANNEL_HIGH_IN_GPIO_MODE);
	}
}

//===============================================
// emergercy stop
//===============================================

void advtim_gen_int_fault_detected_callback(ADVTIM_HandleTypeDef *advtim)
{
	dcm_system_disable();
	DCM.error_status = MOTOR_EMERGERCY_STOP;
	test_printf_s("Fault detected! System disabled...\r\n");
	UNUSED(advtim);
}

//===============================================
// pwm int handler
//===============================================

void AdvtimGen_Handler(void)
{
	NVIC_ClearPendingIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_interrupt_handler(&hadvtim);
}


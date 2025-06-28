//===============================================
//
//	File: drv_advtim_cap.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03302025
//	Version: v1.0
//
// 	This is source file for advance timer input capture.
//
//===============================================

#include "drv_advtim.h"

#ifdef ADVTIM_DRIVER

//===============================================
// advance timer input capture init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_advtim_cap_default_config(ADVTIM_HandleTypeDef *advtim)
{
	advtim->cap_cfg.psc = 0x2;
	advtim->cap_cfg.arr = 0x32;	
	advtim->cap_cfg.rcr = 0;
	advtim->cap_cfg.capture_delay_time = 0;
	advtim->cap_cfg.channel1_input_mode = ADVTIM_CAP_INPUT_CAPTURE_STEP_MODE;
	advtim->cap_cfg.channel1_input_positive_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	advtim->cap_cfg.channel1_input_negative_enable = ADVTIM_CAP_INPUT_CHANNEL_DISABLE;
	advtim->cap_cfg.channel1_input_positive_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
	advtim->cap_cfg.channel1_input_negative_polarity = ADVTIM_CAP_INPUT_CHANNEL_POLARITY_FORWARD;
}

bool drv_advtim_cap_set_config(ADVTIM_HandleTypeDef *advtim)
{
	uint32_t reg_temp = 0;
	uint8_t reg_check = 0;

	reg_temp = 	(advtim->cap_cfg.psc					<< 16) |
				(advtim->cap_cfg.arr					<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->cap_pe0)), reg_temp, reg_temp);

	reg_temp = 	(advtim->cap_cfg.rcr								<< 16) |
				(advtim->cap_cfg.capture_delay_time 				<< 12) |
				(advtim->cap_cfg.channel1_input_mode 				<<  8) |
				(advtim->cap_cfg.channel1_input_positive_polarity 	<<  3) |
				(advtim->cap_cfg.channel1_input_negative_polarity 	<<  2) |
				(advtim->cap_cfg.channel1_input_positive_enable		<<  1) |
				(advtim->cap_cfg.channel1_input_negative_enable		<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->cap_pe1)), reg_temp, reg_temp);


	return reg_check;
}

bool drv_advtim_cap_init(ADVTIM_HandleTypeDef *advtim)
{
	bool status;

	status = drv_advtim_cap_set_config(advtim);
	drv_advtim_cap_logic_reset(advtim);
	drv_advtim_cap_int_allclear(advtim);
	drv_advtim_config_sw_update(advtim);

	return status;
}

void drv_advtim_cap_deinit(ADVTIM_HandleTypeDef *advtim)
{
	drv_advtim_cap_disable(advtim);
	drv_advtim_cap_int_disable_all(advtim);
	drv_advtim_cap_int_allclear(advtim);
}

//===============================================
// advtim cap weak function
//===============================================

void __attribute__((weak)) advtim_cap_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

void __attribute__((weak)) advtim_cap_int_reloading_reaching_rcr_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

//===============================================
// advtim cap interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_advtim_cap_interrupt_handler(ADVTIM_HandleTypeDef *advtim)
{
	uint8_t status;
	status = drv_advtim_cap_int_get(advtim) & advtim->regs->cap_int_en;

	if(status & ADVTIM_CAP_INT_RELOADED)
	{
		advtim_cap_int_reloaded_callback(advtim);
		drv_advtim_cap_int_clear(advtim, ADVTIM_CAP_INT_RELOADED);
	}
	if(status & ADVTIM_CAP_INT_RELOADING_REACHING_RCR)
	{
		advtim_cap_int_reloading_reaching_rcr_callback(advtim);
		drv_advtim_cap_int_clear(advtim, ADVTIM_CAP_INT_RELOADING_REACHING_RCR);
	}
}

#endif


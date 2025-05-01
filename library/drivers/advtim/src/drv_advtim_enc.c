//===============================================
//
//	File: drv_advtim_enc.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04132025
//	Version: v1.0
//
// 	This is source file for advance timer encoder input.
//
//===============================================

#include "drv_advtim.h"

#ifdef ADVTIM_DRIVER

//===============================================
// advance timer encoder input init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_advtim_enc_default_config(ADVTIM_HandleTypeDef *advtim)
{
	advtim->enc_cfg.arr = 0x8000;	
	advtim->enc_cfg.encoder_delay_time = 4;
	advtim->enc_cfg.channel1_input_mode = ADVTIM_ENC_INPUT_FIRST_EDGE_MODE;
	advtim->enc_cfg.channel1_input_direct_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	advtim->enc_cfg.channel1_input_quadrature_enable = ADVTIM_ENC_INPUT_CHANNEL_DISABLE;
	advtim->enc_cfg.channel1_input_direct_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
	advtim->enc_cfg.channel1_input_quadrature_polarity = ADVTIM_ENC_INPUT_CHANNEL_POLARITY_FORWARD;
}

bool drv_advtim_enc_set_config(ADVTIM_HandleTypeDef *advtim)
{
	uint32_t reg_temp = 0;
	uint8_t reg_check = 0;

	reg_temp = 	(advtim->enc_cfg.arr					<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->enc_pe0)), reg_temp, reg_temp);

	reg_temp = 	(advtim->enc_cfg.encoder_delay_time 					<< 28) |
				(advtim->enc_cfg.channel1_input_mode 					<< 16) |
				(advtim->enc_cfg.channel1_input_direct_polarity 		<<  3) |
				(advtim->enc_cfg.channel1_input_quadrature_polarity 	<<  2) |
				(advtim->enc_cfg.channel1_input_direct_enable			<<  1) |
				(advtim->enc_cfg.channel1_input_quadrature_enable		<<  0) ;
	reg_check |= drv_check_rw_data((uint32_t)(&(advtim->regs->enc_pe1)), reg_temp, reg_temp);


	return reg_check;
}

bool drv_advtim_enc_init(ADVTIM_HandleTypeDef *advtim)
{
	bool status;

	status = drv_advtim_enc_set_config(advtim);
	drv_advtim_enc_logic_reset(advtim);
	drv_advtim_enc_int_allclear(advtim);
	drv_advtim_config_sw_update(advtim);

	return status;
}

void drv_advtim_enc_deinit(ADVTIM_HandleTypeDef *advtim)
{
	drv_advtim_enc_logic_reset(advtim);
	drv_advtim_enc_int_disable_all(advtim);
	drv_advtim_enc_int_allclear(advtim);
}

//===============================================
// advtim enc weak function
//===============================================

void __attribute__((weak)) advtim_enc_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

void __attribute__((weak)) advtim_enc_int_detected_callback(ADVTIM_HandleTypeDef *advtim)
{
	UNUSED(advtim);
	return;
}

//===============================================
// advtim enc interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_advtim_enc_interrupt_handler(ADVTIM_HandleTypeDef *advtim)
{
	uint8_t status;
	status = drv_advtim_enc_int_get(advtim) & advtim->regs->enc_int_en;

	if(status & ADVTIM_ENC_INT_RELOADED)
	{
		advtim_enc_int_reloaded_callback(advtim);
		drv_advtim_enc_int_clear(advtim, ADVTIM_ENC_INT_RELOADED);
	}
	if(status & ADVTIM_ENC_INT_DETECTED)
	{
		advtim_enc_int_detected_callback(advtim);
		drv_advtim_enc_int_clear(advtim, ADVTIM_ENC_INT_DETECTED);
	}
}

#endif


//===============================================
//
//	File: encoder.c
//	Author: afterGlow,4ever
//	Date: 05022025
//	Version: v1.0
//
// 	This file is related to encoder.
//
//===============================================

#include "dcm.h"

extern dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;

//===============================================
// encoder enable or disable
//===============================================

void dcm_encoder_disable(void)
{
	// disable encoder
	drv_advtim_enc_disable(&hadvtim);
	// disable int
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
}

void dcm_encoder_enable(void)
{
	// enable interrput
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_DETECTED);
	drv_advtim_enc_int_enable(&hadvtim, ADVTIM_ENC_INT_RELOADED);
	// enable encoder
	drv_advtim_enc_enable(&hadvtim);
}

//===============================================
// encoder elapse counter
//===============================================

void dcm_encoder_read_counter(void)
{
	DCM.encoder.encoder_count = drv_advtim_enc_get_channel1_encoder_counter(&hadvtim);
}

void dcm_encoder_read_direction(void)
{
	DCM.encoder.encoder_direction = drv_advtim_enc_get_channel1_encoder_direction(&hadvtim);
}

//===============================================
// encoder int handler
//===============================================

void AdvtimEnc_Handler(void)
{
	NVIC_ClearPendingIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_interrupt_handler(&hadvtim);
}


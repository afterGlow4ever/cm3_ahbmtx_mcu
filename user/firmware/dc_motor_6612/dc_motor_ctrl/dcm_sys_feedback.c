//===============================================
//
//	File: dcm_sys_feedback.c
//	Author: afterGlow,4ever
//	Date: 02202023
//	Version: v1.0
//
// 	This file is used to operate feedback in the loop. 
//
//===============================================

#include "dcm.h"

extern dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;
extern uint32_t temp00;
extern uint32_t temp01;

//===============================================
// dcm system feedback switch
//===============================================

void dcm_feedback_enable(void)
{
	dcm_encoder_enable();
}

void dcm_feedback_disable(void)
{
	dcm_encoder_disable();
}

//===============================================
// calculate speed from encoder
//===============================================

void dcm_speed_calculate(void)
{
	double temp;
//	temp = DCM.encoder.encoder_count - DCM.encoder.encoder_count_old;
	temp = DCM.encoder.encoder_count;
	DCM.encoder.encoder_speed = temp / DCM_ENCODER_PPR * DCM_REDUCTION_RATIO * 2000 * 60.0;
	DCM.speed.speed_feedback = DCM.encoder.encoder_speed;// ???? actually add filter here
//	DCM.encoder.encoder_count_old = DCM.encoder.encoder_count;
}

//===============================================
// loop timer
// default: 500us
//===============================================

void advtim_enc_int_reloaded_callback(ADVTIM_HandleTypeDef *advtim)
{
	dcm_encoder_read_counter();
	dcm_encoder_read_direction();
	dcm_speed_calculate();
	dcm_loop();
}


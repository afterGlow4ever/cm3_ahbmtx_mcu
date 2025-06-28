//===============================================
//
//	File: dcm_sys_actutor.c
//	Author: afterGlow,4ever
//	Date: 06252022
//	Version: v1.0
//
// 	This file is used to operate actutors in the loop. 
// 	The actutor section is including 2 actutors:
// 	1. PWM
// 	2. Shutdowm pin
//
//===============================================

#include "dcm.h"

extern dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;

//===============================================
// dcm driving board sd
//===============================================

//void dcm_sd_enable(void)
//{
//}    
//                
//void dcm_sd_disable(void)
//{
//}                

//===============================================
// dcm system actutor switch
//===============================================

void dcm_actutor_enable(void)
{
//	dcm_sd_enable();
	dcm_pwm_enable();
}

void dcm_actutor_disable(void)
{
//	dcm_sd_disable();
	dcm_pwm_disable();
}

//===============================================
// dcm system actutor speed set
//===============================================

void dcm_actutor_speed_set(float speed_set)
{	
	DCM.speed.speed_set = speed_set;
	if(speed_set < 0)	
		speed_set = - speed_set;
	dcm_pwm_set(speed_set);
}

void dcm_actutor_dir_set(dcm_dir_e dir_temp)
{
	dcm_dir_set(dir_temp);
}

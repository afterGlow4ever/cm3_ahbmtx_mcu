//===============================================
//
//	File: dcm_sys_ctrl.c
//	Author: afterGlow,4ever
//	Date: 05022025
//	Version: v1.0
//
// 	This file is used to operate cotrollers in the loop. 
//
//===============================================

#include "dcm.h"

dcm_status_t DCM;
extern ADVTIM_HandleTypeDef hadvtim;
//extern pid_pos_controller_t pid_pos_controller0;
//extern pid_inc_controller_t pid_inc_controller0;

//===============================================
// DC motor system loop controller init
//===============================================

void dcm_system_init(void)
{
//#ifdef SPEED_POS_PID		
//	pid_pos_controller0_init();
//#endif		
//#ifdef SPEED_INC_PID	
//	pid_inc_controller0_init();
//#endif		
//#ifdef LOCATION_POS_PID		
//#endif		
//#ifdef LOCATION_INC_PID		
//#endif			
	dcm_para_reset();
	advtim_init();
	DCM.speed.speed_target = DCM_INITIAL_SPEED;	
	DCM.direction.dir_target = DCM_INITIAL_DIRECTION; 
	DCM.error_status = MOTOR_NORMAL;
}

void dcm_system_deinit(void)
{
	dcm_para_reset();
	advtim_deinit();
	DCM.speed.speed_target = DCM_INITIAL_SPEED;	
	DCM.direction.dir_target = DCM_INITIAL_DIRECTION; 
	DCM.error_status = MOTOR_NORMAL;
}

void dcm_para_reset(void)
{
	DCM.enable_status = MOTOR_DISABLE;
	DCM.operation_status = MOTOR_STOP;
	DCM.stall_timeout = 0;
	DCM.speed.speed_set = 0;		
	DCM.speed.speed_set_dutycycle = 0;		
	DCM.speed.speed_feedback = 0;
	DCM.speed.filter_member_count = 0;
	DCM.encoder.encoder_count = 0;	
	DCM.encoder.encoder_count_old = 0;		
	DCM.encoder.encoder_speed = 0;
}

//===============================================
// DC motor system loop controller enable or disable
//===============================================

void dcm_system_enable(void)
{
	dcm_actutor_speed_set(DCM.speed.speed_target);
	dcm_actutor_dir_set(DCM.direction.dir_target);// start direction		
	drv_advtim_config_sw_update(&hadvtim);
//#ifdef SPEED_POS_PID			
//	pid_pos_controller0.target_val = DCM.speed.speed_target;	
//#endif		
//#ifdef SPEED_INC_PID	
//	pid_inc_controller0.target_val = DCM.speed.speed_target;	
//#endif		
//#ifdef LOCATION_POS_PID		
//#endif		
//#ifdef LOCATION_INC_PID		
//#endif			
	DCM.enable_status = MOTOR_ENABLE;
	DCM.operation_status = MOTOR_DRIVING;
	DCM.error_status = MOTOR_NORMAL;
	dcm_actutor_enable();
	dcm_feedback_enable();
	// first driving
//	dcm_loop();// loop logic executes at intial
}

void dcm_system_disable(void)
{
	dcm_actutor_disable();
	dcm_feedback_disable();
//#ifdef SPEED_POS_PID		
//	pid_pos_controller0_para_reset();
//#endif		
//#ifdef SPEED_INC_PID		
//	pid_inc_controller0_para_reset();
//#endif		
//#ifdef LOCATION_POS_PID		
//#endif		
//#ifdef LOCATION_INC_PID		
//#endif			
	dcm_para_reset();
}

//===============================================
// dcm system calibration operation
//===============================================

//void dcm_system_calibration(void)
//{
//}

//===============================================
// DC motor system show status
//===============================================

void dcm_show_status(void)
{
	test_printf_ch("Status %d\r\n", DCM.enable_status);
	test_printf_ch("Speed set %d\r\n", DCM.speed.speed_target);
	test_printf_ch("Current speed %d\r\n", DCM.speed.speed_feedback);
	test_printf_ch("Current direction %d\r\n", DCM.direction.dir_set);
	test_printf_ch("Error %d\r\n", DCM.error_status);
}

//===============================================
// dcm system operation set
//===============================================

// This comes into effect during initial or running sceraio
void dcm_speed_up(void)
{
	DCM.speed.speed_target = DCM.speed.speed_target + 100;
	if(DCM.speed.speed_target > 0)
	{
		if(DCM.speed.speed_target > DCM_MAX_SPEED_PROTECT)
			DCM.speed.speed_target = DCM_MAX_SPEED_PROTECT;
		if(DCM.speed.speed_target < DCM_MIN_SPEED_PROTECT)
			DCM.speed.speed_target = DCM_MIN_SPEED_PROTECT;		
	}
	else if(DCM.speed.speed_target < 0)
	{
		if(DCM.speed.speed_target < -DCM_MAX_SPEED_PROTECT)
			DCM.speed.speed_target = -DCM_MAX_SPEED_PROTECT;
		if(DCM.speed.speed_target > -DCM_MIN_SPEED_PROTECT)
			DCM.speed.speed_target = -DCM_MIN_SPEED_PROTECT;		
	}		
//#ifdef SPEED_POS_PID		
//	pid_pos_controller0.target_val = DCM.speed.speed_target;
//#endif
//#ifdef SPEED_INC_PID	
//	pid_inc_controller0.target_val = DCM.speed.speed_target;
//#endif
}

// This comes into effect during initial or running sceraio
void dcm_speed_down(void)
{
	DCM.speed.speed_target = DCM.speed.speed_target - 100;
	if(DCM.speed.speed_target > 0)
	{
		if(DCM.speed.speed_target > DCM_MAX_SPEED_PROTECT)
			DCM.speed.speed_target = DCM_MAX_SPEED_PROTECT;
		if(DCM.speed.speed_target < DCM_MIN_SPEED_PROTECT)
			DCM.speed.speed_target = DCM_MIN_SPEED_PROTECT;		
	}
	else if(DCM.speed.speed_target < 0)
	{
		if(DCM.speed.speed_target < -DCM_MAX_SPEED_PROTECT)
			DCM.speed.speed_target = -DCM_MAX_SPEED_PROTECT;
		if(DCM.speed.speed_target > -DCM_MIN_SPEED_PROTECT)
			DCM.speed.speed_target = -DCM_MIN_SPEED_PROTECT;		
	}	

//#ifdef SPEED_POS_PID		
//	pid_pos_controller0.target_val = DCM.speed.speed_target;
//#endif
//#ifdef SPEED_INC_PID	
//	pid_inc_controller0.target_val = DCM.speed.speed_target;
//#endif
}

// This comes into effect only during initial
//void dcm_reverse(void)
//{
//	if(DCM.direction.dir_target == MOTOR_FWD)
//	{
//		DCM.direction.dir_target = MOTOR_REV;
//		dcm_dir_set(MOTOR_REV);
//	}
//	else
//	{
//		DCM.direction.dir_target = MOTOR_FWD;
//		dcm_dir_set(MOTOR_FWD);
//	}
//	DCM.speed.speed_target = - DCM.speed.speed_target;	
//#ifdef SPEED_CLOSE_LOOP	
//	#ifdef SPEED_POS_PID		
//	pid_pos_controller0.target_val = DCM.speed.speed_target;
//	#endif
//	#ifdef SPEED_INC_PID	
//	pid_inc_controller0.target_val = DCM.speed.speed_target;
//	#endif	
//#endif
//}

//===============================================
// dcm system loop controller
//===============================================

static void dcm_speed_loop(void)
{
	float speed_temp;
//#ifdef SPEED_CLOSE_LOOP	
//	#ifdef SPEED_POS_PID		
//		pid_pos_controller0.target_val = DCM.speed.speed_target;
//		DCM.speed.speed_set = pid_pos_controller0_control(DCM.speed.speed_feedback);
//	#endif		
//	#ifdef SPEED_INC_PID		
//		pid_inc_controller0.target_val = DCM.speed.speed_target;
//		DCM.speed.speed_set = pid_inc_controller0_control(DCM.speed.speed_feedback);
//	#endif		
//#else
	speed_temp = DCM.speed.speed_target;
//	DCM.speed.speed_set = DCM.speed.speed_target;	
//#endif		
	if(speed_temp < 0)
	{
		if((- speed_temp) > DCM_MAX_SPEED_PROTECT)
			speed_temp =  - DCM_MAX_SPEED_PROTECT;	
		if((- speed_temp) < DCM_MIN_SPEED_PROTECT)
			speed_temp =  - DCM_MIN_SPEED_PROTECT;	
		dcm_dir_set(MOTOR_REV);
	}
	else
	{
		if(speed_temp > DCM_MAX_SPEED_PROTECT)
			speed_temp = DCM_MAX_SPEED_PROTECT;	
		if(speed_temp < DCM_MIN_SPEED_PROTECT)
			speed_temp = DCM_MIN_SPEED_PROTECT;				
		dcm_dir_set(MOTOR_FWD);
	}		
	dcm_actutor_speed_set(speed_temp);
}

void dcm_loop(void)
{
	dcm_speed_loop();
}


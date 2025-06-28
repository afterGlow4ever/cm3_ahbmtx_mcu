//===============================================
//
//	File: dcm.h
//	Author: afterGlow,4ever
//	Date: 05022025
//	Version: v1.0
//
// 	This file is including dc motor define structure.
//
//===============================================

#ifndef _DCM_H_
#define _DCM_H_

#include "dcm_param.h"
#include "dcm_bsp.h"

//===============================================
// DC motor basic enum and structure
//===============================================

typedef enum
{
  MOTOR_FWD = 0,
  MOTOR_REV = 1,
}dcm_dir_e;

typedef enum
{
  MOTOR_NORMAL = 0,
  MOTOR_EMERGERCY_STOP = 1,
}dcm_error_status_e;

typedef enum
{
  MOTOR_STOP = 0,
  MOTOR_DRIVING = 1,
  MOTOR_BRAKING = 2,
}dcm_operation_status_e;

typedef enum
{
  MOTOR_DISABLE = 0,
  MOTOR_ENABLE = 1,
}dcm_enable_status_e;

typedef struct
{	
	float speed_target;// input speed
	float speed_set;// speed from controller to actutor
	uint16_t speed_set_dutycycle;// speed to actutor in dutycycle	
	float speed_feedback_raw;// raw feedback speed from sensor
	float speed_feedback_raw_array[SPEED_FILTER_NUM];
	float speed_feedback;// calculated feedback speed from sensor	
	float speed_error;// input speed minus feedback speed to controller	
	uint8_t filter_member_count;//valid numbers in speed array
}dcm_speed_t;

typedef struct
{	
	dcm_dir_e dir_target;// input dir
	dcm_dir_e dir_set;// dir from controller to actutor
}dcm_dir_t;

typedef struct
{
	int32_t encoder_count;
	int32_t encoder_count_old;	
	float encoder_speed;	
	dcm_dir_e encoder_direction;
}dcm_encoder_t;

typedef struct
{
	dcm_error_status_e error_status;
	dcm_operation_status_e operation_status;
	dcm_enable_status_e enable_status;
	dcm_dir_t direction;
	dcm_speed_t speed;
	dcm_encoder_t encoder;
  	uint32_t stall_timeout;
}dcm_status_t;

typedef struct
{
    float target_val;          
    float actual_val;        	
    float err;             			
    float err_last;          		
    float kp,ki,kd;          	
    float integral;          	
}pid_pos_controller_t;

typedef struct
{
    float target_val;   
    float actual_val;   
    float err;          
    float err_last2;     
		float err_last;     
    float kp,ki,kd;     
}pid_inc_controller_t;

//===============================================
// DC motor function head
//===============================================

// bsp
void advtim_init(void);
void advtim_deinit(void);

// pwm
void dcm_pwm_enable(void);
void dcm_pwm_disable(void);
void dcm_pwm_set(float speed);
void dcm_dir_set(dcm_dir_e dir);
void AdvtimGen_Handler(void);

// actutor
void dcm_actutor_enable(void);
void dcm_actutor_disable(void);
void dcm_actutor_speed_set(float speed_set);
void dcm_actutor_dir_set(dcm_dir_e dir_temp);

// sd
//void dcm_sd_init(void);
//void dcm_sd_enable(void);
//void dcm_sd_disable(void);

// encoder
void dcm_encoder_enable(void);
void dcm_encoder_disable(void);
void dcm_encoder_read_counter(void);
void dcm_encoder_read_direction(void);
void AdvtimEnc_Handler(void);

// feedback
void dcm_feedback_enable(void);
void dcm_feedback_disable(void);

// dcm system
void dcm_system_init(void);
void dcm_system_deinit(void);
void dcm_system_enable(void);
void dcm_system_disable(void);
void dcm_para_reset(void);
void dcm_show_status(void);

// loops
void dcm_loop(void);

//// pid
//void pid_pos_controller0_init(void);
//void pid_inc_controller0_init(void);
//void pid_pos_controller0_para_set(float kp, float ki, float kd);
//void pid_inc_controller0_para_set(float kp, float ki, float kd);
//float pid_pos_controller0_control(float actual_value);
//float pid_inc_controller0_control(float actual_value);
//void pid_pos_controller0_para_reset(void);
//void pid_inc_controller0_para_reset(void);

// operation
void dcm_speed_up(void);
void dcm_speed_down(void);
void dcm_reverse(void);

#endif


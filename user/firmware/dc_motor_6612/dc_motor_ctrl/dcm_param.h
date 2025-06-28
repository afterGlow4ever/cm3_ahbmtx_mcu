//===============================================
//
//	File: dcm_param.h
//	Author: afterGlow,4ever
//	Date: 05022025
//	Version: v1.0
//
// 	This file is including dc motor basic parameters.
//
//===============================================

#ifndef _DCM_PARAM_H_
#define _DCM_PARAM_H_

//===============================================
// DC motor basic parameters
//===============================================

#define DCM_MAX_SPEED 11000
#define DCM_MAX_SPEED_PROTECT 5000
#define DCM_MIN_SPEED_PROTECT 100
#define DCM_STALL_THRESHOLD 1
#define DCM_REDUCTION_RATIO 20.45
#define DCM_ENCODER_PPR 260

#define DCM_INITIAL_SPEED 200
#define DCM_INITIAL_DIRECTION 1

//===============================================
// Filter parameters
//===============================================                 

#define SPEED_FILTER_NUM 30

//===============================================
// Pid parameters
//===============================================   

#define SPEED_POS_PID_KP 1
#define SPEED_POS_PID_KI 0.05
#define SPEED_POS_PID_KD 0.1

#define SPEED_INC_PID_KP 1
#define SPEED_INC_PID_KI 0.03
#define SPEED_INC_PID_KD 0.1

#endif


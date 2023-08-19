//===============================================
//
//	File: mcu.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08182023
//	Version: v1.0
//
// 	This is base define for mcu.
//	Including:
//	1. interrupts and exceptions enum
// 	2. cortex-m3 config
// 	3. base address mapping
// 	4. variable type define
//
//===============================================

#ifdef __MCU_H_
#endif __MCU_H_

#include <stdint.h>
#include "core_cm3.h"

//===============================================
// interrupts and exceptions enum
//===============================================

typedef enum IRQn
{
/******  Cortex-M3 Processor Exceptions Numbers ***************************************************/
  NonMaskableInt_IRQn           = -14,    /*!<  2 Cortex-M3 Non Maskable Interrupt                        */
  HardFault_IRQn                = -13,    /*!<  3 Cortex-M3 Hard Fault Interrupt                          */
  MemoryManagement_IRQn         = -12,    /*!<  4 Cortex-M3 Memory Management Interrupt            */
  BusFault_IRQn                 = -11,    /*!<  5 Cortex-M3 Bus Fault Interrupt                    */
  UsageFault_IRQn               = -10,    /*!<  6 Cortex-M3 Usage Fault Interrupt                  */
  SVCall_IRQn                   = -5,     /*!< 11 Cortex-M3 SV Call Interrupt                      */
  DebugMonitor_IRQn             = -4,     /*!< 12 Cortex-M3 Debug Monitor Interrupt                */
  PendSV_IRQn                   = -2,     /*!< 14 Cortex-M3 Pend SV Interrupt                      */
  SysTick_IRQn                  = -1,     /*!< 15 Cortex-M3 System Tick Interrupt                  */

/******  MCU Specific Interrupt Numbers *******************************************************/
} IRQn_Type;

//===============================================
// cortex-m3 config
// nvic: 3
// preemption priority: 3bit
// sub priority: 1bit
//===============================================

#define __CM3_REV               				0x0201
#define __NVIC_PRIO_BITS          				3
#define __MPU_PRESENT            				0
#define __Vendor_SysTickConfig   				0

//===============================================
// base address map
//===============================================

#define ITCM_BASE_ADDR							0x00000000
#define DTCM_BASE_ADDR							0x00010000

//===============================================
// variable type define
//===============================================

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;
typedef float float32_t;
typedef double float64_t

#define	TRUE									1
#define	FALSE									0

#endif


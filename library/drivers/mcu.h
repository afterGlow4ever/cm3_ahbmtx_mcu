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

#ifndef __MCU_H_
#define __MCU_H_

#include <stdint.h>

//===============================================
// interrupts and exceptions enum
//===============================================

typedef enum IRQn
{
/******  Cortex-M3 Processor Exceptions Numbers ***************************************************/
  NonMaskableInt_IRQn           = -14,    /*!<  2 Cortex-M3 Non Maskable Interrupt                 */
  HardFault_IRQn                = -13,    /*!<  3 Cortex-M3 Hard Fault Interrupt                   */
  MemoryManagement_IRQn         = -12,    /*!<  4 Cortex-M3 Memory Management Interrupt            */
  BusFault_IRQn                 = -11,    /*!<  5 Cortex-M3 Bus Fault Interrupt                    */
  UsageFault_IRQn               = -10,    /*!<  6 Cortex-M3 Usage Fault Interrupt                  */
  SVCall_IRQn                   = -5,     /*!< 11 Cortex-M3 SV Call Interrupt                      */
  DebugMonitor_IRQn             = -4,     /*!< 12 Cortex-M3 Debug Monitor Interrupt                */
  PendSV_IRQn                   = -2,     /*!< 14 Cortex-M3 Pend SV Interrupt                      */
  SysTick_IRQn                  = -1,     /*!< 15 Cortex-M3 System Tick Interrupt                  */
  Uart0_IRQn                 	=  0,     /*!< 16+0 Uart0 Interrupt								   */
  Uart1_IRQn                 	=  1,     /*!< 16+1 Uart1 Interrupt								   */
  Resv2_IRQn                 	=  2,     /*!< 16+2 Resv2 Interrupt								   */
  Resv3_IRQn                 	=  3,     /*!< 16+3 Resv3 Interrupt								   */
  Resv4_IRQn                 	=  4,     /*!< 16+4 Resv4 Interrupt								   */
  Gpioa_IRQn                 	=  5,     /*!< 16+5 Gpioa Interrupt								   */
  Resv6_IRQn                 	=  6,     /*!< 16+6 Resv6 Interrupt								   */
  Resv7_IRQn                 	=  7,     /*!< 16+7 Resv7 Interrupt								   */
  BastimCh0_IRQn                =  8,     /*!< 16+8 BastimCh0 Interrupt							   */
  BastimCh1_IRQn                =  9,     /*!< 16+9 BastimCh1 Interrupt							   */
  BastimCh2_IRQn                =  10,    /*!< 16+10 BastimCh2 Interrupt						   */
  BastimCh3_IRQn                =  11,    /*!< 16+11 BastimCh3 Interrupt						   */
  Resv12_IRQn                 	=  12,    /*!< 16+12 Resv12 Interrupt							   */

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

#define DEBUG_BASE_ADDR							0x40000000
#define UART0_BASE_ADDR							0x40001000
#define UART1_BASE_ADDR							0x40002000
#define GPIOA_BASE_ADDR							0x4000a000
#define BASTIM_BASE_ADDR						0x40010000

//===============================================
// instance define
//===============================================

#define UART0 	((UART_TypeDef *)UART0_BASE_ADDR)
#define UART1 	((UART_TypeDef *)UART1_BASE_ADDR)
#define GPIOA 	((GPIO_TypeDef *)GPIOA_BASE_ADDR)
#define BASTIM 	((BASTIM_TypeDef *)BASTIM_BASE_ADDR)

//===============================================
// variable type define
//===============================================

#ifndef KEIL_SDK
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;
typedef float float32_t;
typedef double float64_t;
#endif

#define	TRUE									1
#define	FALSE									0

#endif


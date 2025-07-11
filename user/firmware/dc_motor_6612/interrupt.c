//===============================================
//
//	File: interrupt.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08182023
//	Version: v1.0
//
// 	This file is including necessary interrupt
// 	handles in mcu fw.
//
//===============================================

#include "main.h"

/**
* @brief This function handles Non maskable interrupt.
*/
void NMI_Handler(void)
{
	test_printf_s("NMI");
}

/**
* @brief This function handles Hard fault interrupt.
*/
void HardFault_Handler(void)
{
  while (1)
  {
  }
}

/**
* @brief This function handles Memory management fault.
*/
void MemManage_Handler(void)
{
  while (1)
  {
  }
}

/**
* @brief This function handles Pre-fetch fault, memory access fault.
*/
void BusFault_Handler(void)
{
  while (1)
  {
  }
}

/**
* @brief This function handles Undefined instruction or illegal state.
*/
void UsageFault_Handler(void)
{
  while (1)
  {
  }
}

/**
* @brief This function handles System service call via SWI instruction.
*/
void SVC_Handler(void)
{

}

/**
* @brief This function handles Debug monitor.
*/
void DebugMon_Handler(void)
{

}

/**
* @brief This function handles Pendable request for system service.
*/
void PendSV_Handler(void)
{

}

/**
* @brief This function handles System tick timer.
*/
void SysTick_Handler(void)
{

}

//===============================================
// external interrupt handler
//===============================================

extern UART_HandleTypeDef huart0;

void Uart0_Handler(void)
{
	NVIC_ClearPendingIRQ(Uart0_IRQn);// 01052025 cody, nvic clearpending not necessary
	drv_uart_interrupt_handler(&huart0);
}


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
	NVIC_ClearPendingIRQ(Uart0_IRQn);
	drv_uart_interrupt_handler(&huart0);
}

#ifdef UART_TEST

extern UART_HandleTypeDef huart1;

void Uart1_Handler(void)
{
	NVIC_ClearPendingIRQ(Uart1_IRQn);
	drv_uart_interrupt_handler(&huart1);
}

#endif

#ifdef GPIO_TEST

extern GPIO_FunctionCfg gpioa2;
extern GPIO_FunctionCfg gpioa3;

void Gpioa_Handler(void)
{
	NVIC_ClearPendingIRQ(Gpioa_IRQn);
	drv_gpio_interrupt_handler(GPIOA);
}

#endif

#ifdef BASTIM_TEST

void Bastim_Ch0_Handler(void)
{
	NVIC_ClearPendingIRQ(BastimCh0_IRQn);
	drv_bastim_channel0_interrupt_handler(BASTIM);
}

void Bastim_Ch1_Handler(void)
{
	NVIC_ClearPendingIRQ(BastimCh1_IRQn);
	drv_bastim_channel1_interrupt_handler(BASTIM);
}

void Bastim_Ch2_Handler(void)
{
	NVIC_ClearPendingIRQ(BastimCh2_IRQn);
	drv_bastim_channel2_interrupt_handler(BASTIM);
}

void Bastim_Ch3_Handler(void)
{
	NVIC_ClearPendingIRQ(BastimCh3_IRQn);
	drv_bastim_channel3_interrupt_handler(BASTIM);
}

#endif

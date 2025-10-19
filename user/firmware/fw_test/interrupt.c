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

#ifdef ETH_TEST

extern ETH_HandleTypeDef heth;
extern ETH_MAC_HandleTypeDef hethmac;

void EthSma_Handler(void)
{
	NVIC_ClearPendingIRQ(EthSma_IRQn);
	drv_eth_sma_interrupt_handler(&heth);
}

void EthTx_Handler(void)
{
	NVIC_ClearPendingIRQ(EthTx_IRQn);
	drv_eth_mac_tx_interrupt_handler(&hethmac);
}

void EthRx_Handler(void)
{
	NVIC_ClearPendingIRQ(EthRx_IRQn);
	drv_eth_mac_rx_interrupt_handler(&hethmac);
}

void EthDma_Handler(void)
{
	NVIC_ClearPendingIRQ(EthDma_IRQn);
	drv_eth_mac_dma_interrupt_handler(&hethmac);
}

#endif

#ifdef ADVTIM_TEST

extern ADVTIM_HandleTypeDef hadvtim;

void AdvtimGen_Handler(void)
{
	NVIC_ClearPendingIRQ(AdvtimGen_IRQn);
	drv_advtim_gen_interrupt_handler(&hadvtim);
}

void AdvtimCap_Handler(void)
{
	NVIC_ClearPendingIRQ(AdvtimCap_IRQn);
	drv_advtim_cap_interrupt_handler(&hadvtim);
}

void AdvtimEnc_Handler(void)
{
	NVIC_ClearPendingIRQ(AdvtimEnc_IRQn);
	drv_advtim_enc_interrupt_handler(&hadvtim);
}

#endif

#ifdef SPIM_TEST

extern SPIM_HandleTypeDef hspim;

void Spim_Handler(void)
{
	NVIC_ClearPendingIRQ(Spim_IRQn);
	drv_spim_interrupt_handler(&hspim);
	
}

#endif


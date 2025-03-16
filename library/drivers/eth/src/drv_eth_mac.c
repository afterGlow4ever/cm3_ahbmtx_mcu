//===============================================
//
//	File: drv_eth_mac.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08302024
//	Version: v1.0
//
// 	This is source file for ethernet mac driver.
//
//===============================================

#include "drv_eth_mac.h"

#ifdef ETH_MAC_DRIVER

//===============================================
// eth mac init & deinit function
// reutrn value:
// FALSE 0: DONE
// TRUE 1: FAILED
//===============================================

void drv_eth_mac_dma_default_config(ETH_MAC_HandleTypeDef *eth)
{
	eth->dma_cfg.ahbmst_hready_tothres = 8;
	eth->dma_cfg.priority_ratio = ETH_MAC_DMA_RX_PRIORITY_RATIO_1;
	eth->dma_cfg.priority = ETH_MAC_DMA_RX_HIGHER_PRIORITY;
	eth->dma_cfg.arbitration_scheme = ETH_MAC_DMA_ARBITRATION_WEIGHTED_RR;
}

void drv_eth_mac_pe_default_config(ETH_MAC_HandleTypeDef *eth)
{
	eth->pe_cfg.sa_macaddrl = 0x04030201;
	eth->pe_cfg.sa_macaddrh = 0x0605;
	eth->pe_cfg.arp_offload = ETH_MAC_PE_ARP_OFFLOAD_DISABLE;
	eth->pe_cfg.sa_filter = ETH_MAC_PE_SA_FILTER_DISABLE;
	eth->pe_cfg.db_filter = ETH_MAC_PE_DB_FILTER_DISABLE;
	eth->pe_cfg.mtu_2kp = ETH_MAC_PE_2KP_ENABLE;
	eth->pe_cfg.duplex = ETH_MAC_PE_FULL_DUPLEX;
	eth->pe_cfg.preamble_length = ETH_MAC_PE_PREAMBLE_7_BYTES;
	eth->pe_cfg.interval_length = 96;	
}

bool drv_eth_mac_set_dma_config(ETH_MAC_HandleTypeDef *eth)
{
	uint32_t reg_temp;
	uint8_t reg_check = 0;

	reg_temp = 	(eth->dma_cfg.ahbmst_hready_tothres 	<< 28) |
			 	(eth->dma_cfg.priority_ratio			<< 2) |
				(eth->dma_cfg.priority					<< 1) |
				(eth->dma_cfg.arbitration_scheme		<< 0) ;
	reg_check = drv_check_rw_data((uint32_t)(&(eth->regs->mac_dma_ctrl)), reg_temp, reg_temp);

	return reg_check;
}

bool drv_eth_mac_set_pe_config(ETH_MAC_HandleTypeDef *eth)
{
	uint32_t reg_temp;
	uint8_t reg_check = 0;

	reg_temp = 	eth->pe_cfg.sa_macaddrl;
	reg_check = drv_check_rw_data((uint32_t)(&(eth->regs->mac_pe_ctrl0)), reg_temp, reg_temp);

	reg_temp = 	eth->pe_cfg.sa_macaddrh;
	reg_check = drv_check_rw_data((uint32_t)(&(eth->regs->mac_pe_ctrl1)), reg_temp, reg_temp);

	reg_temp = 	(eth->pe_cfg.arp_offload			<< 31) |
				(eth->pe_cfg.sa_filter				<< 28) |
				(eth->pe_cfg.db_filter				<< 25) |
				(eth->pe_cfg.mtu_2kp				<< 22) |
				(eth->pe_cfg.duplex					<< 13) |
				(eth->pe_cfg.preamble_length		<< 2)  ;
	reg_check = drv_check_rw_data((uint32_t)(&(eth->regs->mac_pe_ctrl2)), reg_temp, reg_temp);

	reg_temp = 	((eth->pe_cfg.interval_length/8-5)	<< 24) ;
	reg_check = drv_check_rw_data((uint32_t)(&(eth->regs->mac_pe_ctrl3)), reg_temp, reg_temp);

	return reg_check;
}

bool drv_eth_mac_init(ETH_MAC_HandleTypeDef *eth)
{
	bool status;

	status = drv_eth_mac_set_dma_config(eth);
	status |= drv_eth_mac_set_pe_config(eth);
	drv_eth_mac_logic_reset(eth);
	drv_eth_mac_tx_int_allclear(eth);
	drv_eth_mac_rx_int_allclear(eth);
	drv_eth_mac_dma_config_update(eth);
	drv_eth_mac_pe_config_update(eth);
	drv_eth_mac_tx_enable(eth);// enable tx clk pin
	drv_eth_mac_rx_enable(eth);// enable rx clk pin

	return status;
}

void drv_eth_mac_deinit(ETH_MAC_HandleTypeDef *eth)
{
	drv_eth_mac_logic_reset(eth);
	drv_eth_mac_tx_int_allclear(eth);
	drv_eth_mac_rx_int_allclear(eth);
	drv_eth_mac_tx_disable(eth);// disable tx clk pin
	drv_eth_mac_rx_disable(eth);// disable rx clk pin
}

//===============================================
// eth mac address set
// mac address is temp store in a uint8_t array 
//===============================================

void drv_eth_mac_address_set(ETH_MAC_HandleTypeDef *eth, uint8_t mac_address[])
{
	eth->pe_cfg.sa_macaddrl = (mac_address[3] << 24) | 
							  (mac_address[2] << 16) |
							  (mac_address[1] << 8)  |
							  (mac_address[0] << 0)  ;
	eth->pe_cfg.sa_macaddrh = (mac_address[5] << 8)  | 
							  (mac_address[4] << 0)  ;
	REG_SETBITS(eth->regs->mac_pe_ctrl0, 0, 31, eth->pe_cfg.sa_macaddrl);
	REG_SETBITS(eth->regs->mac_pe_ctrl1, 0, 15, eth->pe_cfg.sa_macaddrh);
}

//===============================================
// eth mac dma descriptor config
//===============================================

void drv_eth_mac_tx_descriptor_default_config(ETH_MAC_DmaTxDescriptorCfg *eth_tx_descriptor_cfg)
{
	eth_tx_descriptor_cfg->buffer1_address = 0;
	eth_tx_descriptor_cfg->ioc = ETH_MAC_TXDESC_TX_FRAME_DONE_INT_DISABLE;
	eth_tx_descriptor_cfg->buffer1_length = 0;
	eth_tx_descriptor_cfg->cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	eth_tx_descriptor_cfg->saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_SW;
	eth_tx_descriptor_cfg->cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
}

void drv_eth_mac_rx_descriptor_default_config(ETH_MAC_DmaRxDescriptorCfg *eth_rx_descriptor_cfg)
{
	eth_rx_descriptor_cfg->buffer1_address = 0;
	eth_rx_descriptor_cfg->ioc = ETH_MAC_RXDESC_RX_FRAME_DONE_INT_DISABLE;
}

void drv_eth_mac_tx_descriptor_config(ETH_MAC_DmaTxDescriptorCfg *eth_tx_descriptor_cfg, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor)
{
	eth_tx_descriptor->descriptor0 = eth_tx_descriptor_cfg->buffer1_address				   ;
	eth_tx_descriptor->descriptor1 = 0;// reserved
	eth_tx_descriptor->descriptor2 = (eth_tx_descriptor_cfg->ioc 					<< 31) | 
									 (eth_tx_descriptor_cfg->buffer1_length 		<< 0)  ;
	eth_tx_descriptor->descriptor3 = (eth_tx_descriptor_cfg->cpc 					<< 26) | 
									 (eth_tx_descriptor_cfg->saic 					<< 24) | 
									 (eth_tx_descriptor_cfg->cic 					<< 16) ;
}

void drv_eth_mac_rx_descriptor_config(ETH_MAC_DmaRxDescriptorCfg *eth_rx_descriptor_cfg, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor)
{
	eth_rx_descriptor->descriptor0 = eth_rx_descriptor_cfg->buffer1_address				   ;
	eth_rx_descriptor->descriptor1 = 0;// reserved
	eth_rx_descriptor->descriptor2 = 0;// reserved
	eth_rx_descriptor->descriptor3 = eth_rx_descriptor_cfg->ioc 					<< 30  ; 
}

//===============================================
// eth mac dma descriptor config coming into effect
//===============================================

void drv_eth_mac_set_tx_descriptor_config(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor)
{
	ETH_MAC_DmaDescriptorHandleTypeDef *descriptor;	
	uint32_t *reg_ptr;

	eth->tx_descriptor = eth_tx_descriptor;
	REG_SETBITS(eth->regs->mac_dma_tdes0, 0, 1, eth->tx_descriptor_num - 1);

	for(eth->tx_descriptor_ptr = 0; eth->tx_descriptor_ptr < eth->tx_descriptor_num; eth->tx_descriptor_ptr++)
	{
		reg_ptr = (uint32_t *)(&(eth->regs->mac_tdes00) + eth->tx_descriptor_ptr * 4);
		descriptor = eth->tx_descriptor + eth->tx_descriptor_ptr;
		*(reg_ptr + 0) = descriptor->descriptor0;
		*(reg_ptr + 1) = descriptor->descriptor1;
		*(reg_ptr + 2) = descriptor->descriptor2;
		*(reg_ptr + 3) = descriptor->descriptor3;
	}
	eth->tx_descriptor_ptr = 0;
}

void drv_eth_mac_set_rx_descriptor_config(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor)
{
	ETH_MAC_DmaDescriptorHandleTypeDef *descriptor;	
	uint32_t *reg_ptr;

	eth->rx_descriptor = eth_rx_descriptor;
	REG_SETBITS(eth->regs->mac_dma_rdes0, 0, 1, eth->rx_descriptor_num - 1);

	for(eth->rx_descriptor_ptr = 0; eth->rx_descriptor_ptr < eth->rx_descriptor_num; eth->rx_descriptor_ptr++)
	{
		reg_ptr = (uint32_t *)(eth->regs->mac_rdes00) + eth->rx_descriptor_ptr * 4;
		descriptor = eth->rx_descriptor + eth->rx_descriptor_ptr;

		*(reg_ptr + 0) = descriptor->descriptor0;
		*(reg_ptr + 1) = descriptor->descriptor1;
		*(reg_ptr + 2) = descriptor->descriptor2;
		*(reg_ptr + 3) = descriptor->descriptor3;
	}
	eth->rx_descriptor_ptr = 0;
}

//===============================================
// eth mac dma descriptor clear
//===============================================

void drv_eth_mac_tx_descriptor_clear(ETH_MAC_HandleTypeDef *eth)
{
	ETH_MAC_DmaDescriptorHandleTypeDef *descriptor;	

	for(eth->tx_descriptor_ptr = 0; eth->tx_descriptor_ptr < eth->tx_descriptor_num; eth->tx_descriptor_ptr++)
	{
		descriptor = eth->tx_descriptor + eth->tx_descriptor_ptr;
		descriptor->descriptor0 = 0;
		descriptor->descriptor1 = 0;
		descriptor->descriptor2 = 0;
		descriptor->descriptor3 = 0;
	}
	eth->tx_descriptor_ptr = 0;
}

void drv_eth_mac_rx_descriptor_clear(ETH_MAC_HandleTypeDef *eth)
{
	ETH_MAC_DmaDescriptorHandleTypeDef *descriptor;	

	for(eth->rx_descriptor_ptr = 0; eth->rx_descriptor_ptr < eth->rx_descriptor_num; eth->rx_descriptor_ptr++)
	{
		descriptor = eth->rx_descriptor + eth->rx_descriptor_ptr;
		descriptor->descriptor0 = 0;
		descriptor->descriptor1 = 0;
		descriptor->descriptor2 = 0;
		descriptor->descriptor3 = 0;
	}
	eth->rx_descriptor_ptr = 0;
}

//===============================================
// eth mac tx enable with descriptor config
//===============================================

void drv_eth_mac_set_tx_descriptor_and_tx_enable(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor)
{
//	drv_eth_mac_tx_descriptor_clear(eth);
	drv_eth_mac_set_tx_descriptor_config(eth, eth_tx_descriptor);
	drv_eth_mac_tx_trans_enable(eth);
}

void drv_eth_mac_set_rx_descriptor_and_rx_enable(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor)
{
//	drv_eth_mac_rx_descriptor_clear(eth);
	drv_eth_mac_set_rx_descriptor_config(eth, eth_rx_descriptor);
	drv_eth_mac_rx_trans_enable(eth);
}

//===============================================
// eth mac weak function
//===============================================

void __attribute__((weak)) eth_mac_tx_int_tx_frame_done_callback(ETH_MAC_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_mac_rx_int_rx_frame_done_callback(ETH_MAC_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_mac_dma_int_once_process_done_callback(ETH_MAC_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_mac_dma_int_hready_to_callback(ETH_MAC_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

void __attribute__((weak)) eth_mac_dma_int_bus_error_callback(ETH_MAC_HandleTypeDef *eth)
{
	UNUSED(eth);
	return;
}

//===============================================
// eth mac interrupt handler
// enable int first and then callback function
// will be operated.
//===============================================

void drv_eth_mac_tx_interrupt_handler(ETH_MAC_HandleTypeDef *eth)
{
	uint8_t status;
	status = drv_eth_mac_tx_int_get(eth) & eth->regs->mac_int0_en;

	if(status & ETH_MAC_TX_INT_TX_FRAME_DONE)
	{
		eth->status = 1 << ETH_MAC_TX_INT_TX_FRAME_DONE;
		eth_mac_tx_int_tx_frame_done_callback(eth);
		drv_eth_mac_tx_int_clear(eth, ETH_MAC_TX_INT_TX_FRAME_DONE);
	}
}

void drv_eth_mac_rx_interrupt_handler(ETH_MAC_HandleTypeDef *eth)
{
	uint8_t status;
	status = drv_eth_mac_rx_int_get(eth) & eth->regs->mac_int1_en;

	if(status & ETH_MAC_RX_INT_RX_FRAME_DONE)
	{
		eth->status = 1 << ETH_MAC_RX_INT_RX_FRAME_DONE;
		eth_mac_rx_int_rx_frame_done_callback(eth);
		drv_eth_mac_rx_int_clear(eth, ETH_MAC_RX_INT_RX_FRAME_DONE);
	}
}

void drv_eth_mac_dma_interrupt_handler(ETH_MAC_HandleTypeDef *eth)
{
	uint8_t status;
	status = drv_eth_mac_dma_int_get(eth) & eth->regs->mac_int2_en;

	if(status & ETH_MAC_DMA_INT_ONCE_PROCESS_DONE)
	{
		eth->status = 1 << ETH_MAC_DMA_INT_ONCE_PROCESS_DONE;
		eth_mac_dma_int_once_process_done_callback(eth);
		drv_eth_mac_dma_int_clear(eth, ETH_MAC_DMA_INT_ONCE_PROCESS_DONE);
	}
	if(status & ETH_MAC_DMA_INT_HREADY_TO)
	{
		eth->status = 1 << ETH_MAC_DMA_INT_HREADY_TO;
		eth_mac_dma_int_hready_to_callback(eth);
		drv_eth_mac_dma_int_clear(eth, ETH_MAC_DMA_INT_HREADY_TO);
	}
	if(status & ETH_MAC_DMA_INT_BUS_ERROR)
	{
		eth->status = 1 << ETH_MAC_DMA_INT_BUS_ERROR;
		eth_mac_dma_int_bus_error_callback(eth);
		drv_eth_mac_dma_int_clear(eth, ETH_MAC_DMA_INT_BUS_ERROR);
	}
}

#endif


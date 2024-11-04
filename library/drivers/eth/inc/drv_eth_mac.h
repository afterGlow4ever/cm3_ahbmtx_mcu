//===============================================
//
//	File: drv_eth_mac.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08302024
//	Version: v1.0
//
// 	This is header file for ethernet mac driver.
//
//===============================================

#ifndef __DRV_ETH_MAC_H_
#define __DRV_ETH_MAC_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define ETH_MAC_TX_DESCRIPTOR_NUM					4
#define ETH_MAC_RX_DESCRIPTOR_NUM					4

#define ETH_MAC_TX_INT_TX_FRAME_DONE			(1<<0)
#define ETH_MAC_RX_INT_RX_FRAME_DONE			(1<<0)
#define ETH_MAC_DMA_INT_ONCE_PROCESS_DONE		(1<<0)
#define ETH_MAC_DMA_INT_HREADY_TO				(1<<1)
#define ETH_MAC_DMA_INT_BUS_ERROR				(1<<2)
//
//#define ETH_SMA_FIFO_NUM						4

//===============================================
// eth regs
//===============================================

typedef struct
{
	volatile uint32_t mac_top_ctrl;
	volatile uint32_t mac_dma_ctrl;
	volatile uint32_t rsv38;
	volatile uint32_t rsv3c;
	volatile uint32_t mac_dma_tdes0;
	volatile uint32_t rsv44;
	volatile uint32_t rsv48;
	volatile uint32_t rsv4c;
	volatile uint32_t mac_dma_rdes0;
	volatile uint32_t rsv54;
	volatile uint32_t rsv58;
	volatile uint32_t rsv5c;
	volatile uint32_t rsv60;
	volatile uint32_t rsv64;
	volatile uint32_t rsv68;
	volatile uint32_t rsv6c;
	volatile uint32_t rsv70;
	volatile uint32_t rsv74;
	volatile uint32_t rsv78;
	volatile uint32_t rsv7c;
	volatile uint32_t mac_tdes00;
	volatile uint32_t mac_tdes01;
	volatile uint32_t mac_tdes02;
	volatile uint32_t mac_tdes03;
	volatile uint32_t mac_tdes10;
	volatile uint32_t mac_tdes11;
	volatile uint32_t mac_tdes12;
	volatile uint32_t mac_tdes13;
	volatile uint32_t mac_tdes20;
	volatile uint32_t mac_tdes21;
	volatile uint32_t mac_tdes22;
	volatile uint32_t mac_tdes23;
	volatile uint32_t mac_tdes30;
	volatile uint32_t mac_tdes31;
	volatile uint32_t mac_tdes32;
	volatile uint32_t mac_tdes33;
	volatile uint32_t mac_rdes00;
	volatile uint32_t mac_rdes01;
	volatile uint32_t mac_rdes02;
	volatile uint32_t mac_rdes03;
	volatile uint32_t mac_rdes10;
	volatile uint32_t mac_rdes11;
	volatile uint32_t mac_rdes12;
	volatile uint32_t mac_rdes13;
	volatile uint32_t mac_rdes20;
	volatile uint32_t mac_rdes21;
	volatile uint32_t mac_rdes22;
	volatile uint32_t mac_rdes23;
	volatile uint32_t mac_rdes30;
	volatile uint32_t mac_rdes31;
	volatile uint32_t mac_rdes32;
	volatile uint32_t mac_rdes33;
	volatile uint32_t mac_pe_ctrl0;
	volatile uint32_t mac_pe_ctrl1;
	volatile uint32_t mac_pe_ctrl2;
	volatile uint32_t mac_pe_ctrl3;
	volatile uint32_t rsv110;
	volatile uint32_t rsv114;
	volatile uint32_t rsv118;
	volatile uint32_t rsv11c;
	volatile uint32_t mac_int0_en;
	volatile uint32_t mac_int1_en;
	volatile uint32_t mac_int2_en;
	volatile uint32_t rsv12c;
	volatile uint32_t mac_int0_clr;
	volatile uint32_t mac_int1_clr;
	volatile uint32_t mac_int2_clr;
	volatile uint32_t rsv13c;
	volatile uint32_t mac_int0_sta;
	volatile uint32_t mac_int1_sta;
	volatile uint32_t mac_int2_sta;
	volatile uint32_t rsv14c;
}ETH_MAC_TypeDef;

//===============================================
// eth mac enum
//===============================================

typedef enum
{
	ETH_MAC_DMA_RX_PRIORITY_RATIO_1,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_2,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_3,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_4,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_5,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_6,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_7,
	ETH_MAC_DMA_RX_PRIORITY_RATIO_8,
}eth_mac_dma_priority_ratio;

typedef enum
{
	ETH_MAC_DMA_RX_HIGHER_PRIORITY,
	ETH_MAC_DMA_TX_HIGHER_PRIORITY,
}eth_mac_dma_priority;

typedef enum
{
	ETH_MAC_DMA_ARBITRATION_WEIGHTED_RR,
	ETH_MAC_DMA_ARBITRATION_FIXED_PRIORITY,
}eth_mac_dma_arbitration_scheme;

typedef enum
{
	ETH_MAC_PE_ARP_OFFLOAD_DISABLE,
	ETH_MAC_PE_ARP_OFFLOAD_ENABLE,
}eth_mac_pe_arp_offload;

typedef enum
{
	ETH_MAC_PE_SA_FILTER_DISABLE,
	ETH_MAC_PE_SA_FILTER_ENABLE,
}eth_mac_pe_sa_filter;

typedef enum
{
	ETH_MAC_PE_DB_FILTER_DISABLE,
	ETH_MAC_PE_DB_FILTER_ENABLE,
}eth_mac_pe_db_filter;

typedef enum
{
	ETH_MAC_PE_2KP_DISABLE,
	ETH_MAC_PE_2KP_ENABLE,
}eth_mac_pe_2kp;

typedef enum
{
	ETH_MAC_PE_HALF_DUPLEX,
	ETH_MAC_PE_FULL_DUPLEX,
}eth_mac_pe_duplex;

typedef enum
{
	ETH_MAC_PE_PREAMBLE_7_BYTES,
	ETH_MAC_PE_PREAMBLE_5_BYTES,
	ETH_MAC_PE_PREAMBLE_3_BYTES,
}eth_mac_pe_preamble_length;

//===============================================
// eth mac descriptor enum
//===============================================

typedef enum
{
	ETH_MAC_TXDESC_TX_FRAME_DONE_INT_DISABLE,
	ETH_MAC_TXDESC_TX_FRAME_DONE_INT_ENABLE,
}eth_mac_txdesc_ioc;

typedef enum
{
	ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW,
	ETH_MAC_TXDESC_ONLY_CRC_INSERTED_BY_HW,
	ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_SW,
	ETH_MAC_TXDESC_ONLY_CRC_REPLACED_BY_HW,
}eth_mac_txdesc_cpc;

typedef enum
{
	ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_SW,
	ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW,
	ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW,
}eth_mac_txdesc_saic;

typedef enum
{
	ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_SW,
	ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW,
	ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW,
}eth_mac_txdesc_cic;

typedef enum
{
	ETH_MAC_RXDESC_RX_FRAME_DONE_INT_DISABLE,
	ETH_MAC_RXDESC_RX_FRAME_DONE_INT_ENABLE,
}eth_mac_rxdesc_ioc;

//===============================================
// eth descriptor handler
//===============================================

typedef struct
{
	uint32_t buffer1_address;
	eth_mac_txdesc_ioc ioc;
	uint16_t buffer1_length;
	eth_mac_txdesc_cpc cpc;
	eth_mac_txdesc_saic saic;
	eth_mac_txdesc_cic cic;
}ETH_MAC_DmaTxDescriptorCfg;

typedef struct
{
	uint32_t buffer1_address;
	eth_mac_rxdesc_ioc ioc;
}ETH_MAC_DmaRxDescriptorCfg;

typedef struct
{
	uint32_t descriptor0;
	uint32_t descriptor1;
	uint32_t descriptor2;
	uint32_t descriptor3;
}ETH_MAC_DmaDescriptorHandleTypeDef;

//===============================================
// eth mac handler
//===============================================

typedef struct
{
	uint8_t ahbmst_hready_tothres;
	eth_mac_dma_priority_ratio priority_ratio;
	eth_mac_dma_priority priority;
	eth_mac_dma_arbitration_scheme arbitration_scheme;
	uint8_t tx_desciptor_num;
	uint8_t rx_desciptor_num;
}ETH_MAC_DmaCfg;

typedef struct
{
	uint32_t sa_macaddrl;
	uint16_t sa_macaddrh;
	eth_mac_pe_arp_offload arp_offload;
	eth_mac_pe_sa_filter sa_filter;
	eth_mac_pe_db_filter db_filter;
	eth_mac_pe_2kp mtu_2kp;
	eth_mac_pe_duplex duplex;
	eth_mac_pe_preamble_length preamble_length;
	uint8_t interval_length;
}ETH_MAC_FunctionCfg;

typedef struct
{
	ETH_MAC_TypeDef *regs;
	ETH_MAC_DmaCfg dma_cfg;
	ETH_MAC_FunctionCfg pe_cfg;
	ETH_MAC_DmaDescriptorHandleTypeDef *tx_descriptor;
	ETH_MAC_DmaDescriptorHandleTypeDef *rx_descriptor;
	uint8_t tx_descriptor_num;
	uint8_t rx_descriptor_num;
	uint8_t tx_descriptor_ptr;
	uint8_t rx_descriptor_ptr;
	uint8_t status;// status defined in status bit enum
	uint8_t id;
}ETH_MAC_HandleTypeDef;

//===============================================
// eth inline function
//===============================================

static inline void drv_eth_mac_logic_reset(ETH_MAC_HandleTypeDef *eth)
{
	eth->status = 0;
	eth->tx_descriptor = NULL;
	eth->rx_descriptor = NULL;
	eth->tx_descriptor_num = ETH_MAC_TX_DESCRIPTOR_NUM;
	eth->rx_descriptor_num = ETH_MAC_RX_DESCRIPTOR_NUM;
	eth->tx_descriptor_ptr = 0;
	eth->rx_descriptor_ptr = 0;
	REG_SETBIT(eth->regs->mac_top_ctrl, 8, 1);//rx logic clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 8, 0);//rx logic clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 9, 1);//tx logic clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 9, 0);//tx logic clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 10, 1);//tx datalink clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 10, 0);//tx datalink clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 11, 1);//rx datalink clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 11, 0);//rx datalink clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 12, 1);//dma ahb master clear
	REG_SETBIT(eth->regs->mac_top_ctrl, 12, 0);//dma ahb master clear
}

static inline void drv_eth_mac_tx_enable(ETH_MAC_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->mac_top_ctrl, 3, 0);
	REG_SETBIT(eth->regs->mac_top_ctrl, 3, 1);
	REG_SETBIT(eth->regs->mac_top_ctrl, 3, 0);
}

static inline void drv_eth_mac_rx_enable(ETH_MAC_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->mac_top_ctrl, 2, 1);
}

static inline void drv_eth_mac_rx_disable(ETH_MAC_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->mac_top_ctrl, 2, 0);
}

static inline void drv_eth_mac_dma_config_update(ETH_MAC_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->mac_top_ctrl, 0, 1);
	REG_SETBIT(eth->regs->mac_top_ctrl, 0, 0);
}

static inline void drv_eth_mac_pe_config_update(ETH_MAC_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->mac_top_ctrl, 1, 1);
	REG_SETBIT(eth->regs->mac_top_ctrl, 1, 0);
}

static inline void drv_eth_mac_dma_tx_descriptor_num_set(ETH_MAC_HandleTypeDef *eth, uint8_t descriptor_num)
{
	eth->tx_descriptor_num = descriptor_num;
	REG_SETBITS(eth->regs->mac_dma_tdes0, 0, 1, descriptor_num - 1);
}

static inline void drv_eth_mac_dma_rx_descriptor_num_set(ETH_MAC_HandleTypeDef *eth, uint8_t descriptor_num)
{
	eth->rx_descriptor_num = descriptor_num;
	REG_SETBITS(eth->regs->mac_dma_rdes0, 0, 1, descriptor_num - 1);
}

static inline void drv_eth_mac_tx_int_enable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int0_en |= eth_mac_int;
}

static inline void drv_eth_mac_rx_int_enable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int1_en |= eth_mac_int;
}

static inline void drv_eth_mac_dma_int_enable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int2_en |= eth_mac_int;
}

static inline void drv_eth_mac_tx_int_disable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int0_en &= ~eth_mac_int;
}

static inline void drv_eth_mac_rx_int_disable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int1_en &= ~eth_mac_int;
}

static inline void drv_eth_mac_dma_int_disable(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int2_en &= ~eth_mac_int;
}

static inline void drv_eth_mac_tx_int_clear(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int0_clr |= eth_mac_int;
	eth->regs->mac_int0_clr = 0;
}

static inline void drv_eth_mac_rx_int_clear(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int1_clr |= eth_mac_int;
	eth->regs->mac_int1_clr = 0;
}

static inline void drv_eth_mac_dma_int_clear(ETH_MAC_HandleTypeDef *eth, uint32_t eth_mac_int)
{
	eth->regs->mac_int2_clr |= eth_mac_int;
	eth->regs->mac_int2_clr = 0;
}

static inline void drv_eth_mac_tx_int_allclear(ETH_MAC_HandleTypeDef *eth)
{
	eth->regs->mac_int0_clr = 0x1;
	eth->regs->mac_int0_clr = 0;
}

static inline void drv_eth_mac_rx_int_allclear(ETH_MAC_HandleTypeDef *eth)
{
	eth->regs->mac_int1_clr = 0x1;
	eth->regs->mac_int1_clr = 0;
}

static inline void drv_eth_mac_dma_int_allclear(ETH_MAC_HandleTypeDef *eth)
{
	eth->regs->mac_int2_clr = 0x7;
	eth->regs->mac_int2_clr = 0;
}

static inline uint32_t drv_eth_mac_tx_int_get(ETH_MAC_HandleTypeDef *eth)
{
	return eth->regs->mac_int0_sta;
}

static inline uint32_t drv_eth_mac_rx_int_get(ETH_MAC_HandleTypeDef *eth)
{
	return eth->regs->mac_int1_sta;
}

static inline uint32_t drv_eth_mac_dma_int_get(ETH_MAC_HandleTypeDef *eth)
{
	return eth->regs->mac_int2_sta;
}

//===============================================
// eth mac driver function header
//===============================================

void drv_eth_mac_dma_default_config(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_pe_default_config(ETH_MAC_HandleTypeDef *eth);
bool drv_eth_mac_set_dma_config(ETH_MAC_HandleTypeDef *eth);
bool drv_eth_mac_set_pe_config(ETH_MAC_HandleTypeDef *eth);
bool drv_eth_mac_init(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_deinit(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_address_set(ETH_MAC_HandleTypeDef *eth, uint8_t mac_address[]);
void drv_eth_mac_tx_descriptor_default_config(ETH_MAC_DmaTxDescriptorCfg *eth_tx_descriptor_cfg);
void drv_eth_mac_rx_descriptor_default_config(ETH_MAC_DmaRxDescriptorCfg *eth_rx_descriptor_cfg);
void drv_eth_mac_tx_descriptor_config(ETH_MAC_DmaTxDescriptorCfg *eth_tx_descriptor_cfg, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor);
void drv_eth_mac_rx_descriptor_config(ETH_MAC_DmaRxDescriptorCfg *eth_rx_descriptor_cfg, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor);
void drv_eth_mac_set_tx_descriptor_config(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor);
void drv_eth_mac_set_rx_descriptor_config(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor);
void drv_eth_mac_tx_descriptor_clear(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_rx_descriptor_clear(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_set_tx_descriptor_and_tx_enable(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_tx_descriptor);
void drv_eth_mac_set_rx_descriptor_and_rx_enable(ETH_MAC_HandleTypeDef *eth, ETH_MAC_DmaDescriptorHandleTypeDef *eth_rx_descriptor);
void drv_eth_mac_tx_interrupt_handler(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_rx_interrupt_handler(ETH_MAC_HandleTypeDef *eth);
void drv_eth_mac_dma_interrupt_handler(ETH_MAC_HandleTypeDef *eth);

#endif


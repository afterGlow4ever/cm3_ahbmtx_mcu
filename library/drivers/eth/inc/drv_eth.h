//===============================================
//
//	File: drv_eth.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is header file for ethernet driver.
//
//===============================================

#ifndef __DRV_ETH_H_
#define __DRV_ETH_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define ETH_SMA_INT_TX_FIFO_THRES				(1<<0)
#define ETH_SMA_INT_TX_FIFO_EMPTY				(1<<1)
#define ETH_SMA_INT_RX_FIFO_THRES				(1<<2)
#define ETH_SMA_INT_RX_FIFO_NOEMPTY				(1<<3)
#define ETH_SMA_INT_MASTER_FRAME_DONE			(1<<4)
#define ETH_SMA_INT_RX_TURN_NACK				(1<<5)

#define ETH_SMA_FIFO_NUM						4

//===============================================
// eth regs
//===============================================

typedef struct
{
	volatile uint32_t sma_tx_data;
	volatile uint32_t sma_top_ctrl;
	volatile uint32_t sma_pe_ctrl;
	volatile uint32_t sma_int_en;
	volatile uint32_t sma_int_clr;
	volatile uint32_t sma_fifo_sta;
	volatile uint32_t sma_int_sta;
	volatile uint32_t sma_rx_data;
}ETH_TypeDef;

//===============================================
// eth enum
//===============================================

typedef enum
{
	ETH_SMA_RX_ACK,
	ETH_SMA_RX_NACK,
}eth_rx_ack;

typedef enum
{
	ETH_SMA_CMD_WRITE = 0x01,
	ETH_SMA_CMD_READ = 0x02,
}eth_sma_cmd;

typedef enum
{
	ETH_SMA_STATUS_DEFAULT,
	ETH_SMA_STATUS_RX_NACK,
}eth_sma_status_bit;

//===============================================
// eth handler
//===============================================

typedef struct
{
	uint8_t clkdiv;
	uint8_t phy_address;
	uint8_t interval_bit;
}ETH_SMA_FunctionCfg;

typedef struct
{
	ETH_TypeDef *regs;
	ETH_SMA_FunctionCfg sma_cfg;
	uint8_t status;// status defined in status bit enum
	uint8_t id;
	uint8_t sma_tx_ptr;
	uint8_t sma_rx_ptr;
	uint32_t *sma_rx_data;
	uint8_t sma_rx_num;
}ETH_HandleTypeDef;

//===============================================
// eth inline function
//===============================================

static inline void drv_eth_sma_tx_fifo_watermark_set(ETH_HandleTypeDef *eth, uint8_t fifo_threshold)
{
	REG_SETBITS(eth->regs->sma_top_ctrl, 24, 26, fifo_threshold);
}

static inline void drv_eth_sma_rx_fifo_watermark_set(ETH_HandleTypeDef *eth, uint8_t fifo_threshold)
{
	REG_SETBITS(eth->regs->sma_top_ctrl, 16, 18, fifo_threshold);
}

static inline void drv_eth_sma_logic_reset(ETH_HandleTypeDef *eth)
{
	eth->status = 0;
	eth->sma_tx_ptr = 0;
	eth->sma_rx_ptr = 0;
	REG_SETBIT(eth->regs->sma_top_ctrl, 9, 1);//master logic clear
	REG_SETBIT(eth->regs->sma_top_ctrl, 9, 0);//master logic clear
	REG_SETBIT(eth->regs->sma_top_ctrl, 10, 1);//rx fifo clear
	REG_SETBIT(eth->regs->sma_top_ctrl, 10, 0);//rx fifo clear
	REG_SETBIT(eth->regs->sma_top_ctrl, 11, 1);//tx fifo clear
	REG_SETBIT(eth->regs->sma_top_ctrl, 11, 0);//tx fifo clear
}

static inline void drv_eth_sma_config_update(ETH_HandleTypeDef *eth)
{
	REG_SETBIT(eth->regs->sma_top_ctrl, 0, 1);
	REG_SETBIT(eth->regs->sma_top_ctrl, 0, 0);
}

static inline void drv_eth_sma_int_enable(ETH_HandleTypeDef *eth, uint32_t eth_sma_int)
{
	eth->regs->sma_int_en |= eth_sma_int;
}

static inline void drv_eth_sma_int_disable(ETH_HandleTypeDef *eth, uint32_t eth_sma_int)
{
	eth->regs->sma_int_en &= ~eth_sma_int;
}

static inline void drv_eth_sma_int_clear(ETH_HandleTypeDef *eth, uint32_t eth_sma_int)
{
	eth->regs->sma_int_clr |= eth_sma_int;
	eth->regs->sma_int_clr = 0;
}

static inline void drv_eth_sma_int_allclear(ETH_HandleTypeDef *eth)
{
	eth->regs->sma_int_clr = 0x1f;
	eth->regs->sma_int_clr = 0;
}

static inline uint32_t drv_eth_sma_int_get(ETH_HandleTypeDef *eth)
{
	return eth->regs->sma_int_sta;
}

static inline uint8_t drv_eth_sma_tx_fifo_num_get(ETH_HandleTypeDef *eth)
{
	return REG_GETBITS(eth->regs->sma_fifo_sta, 8, 10);
}

static inline uint8_t drv_eth_sma_rx_fifo_num_get(ETH_HandleTypeDef *eth)
{
	return REG_GETBITS(eth->regs->sma_fifo_sta, 0, 2);
}

//===============================================
// eth sma driver function header
//===============================================

void drv_eth_sma_default_config(ETH_HandleTypeDef *eth);
bool drv_eth_sma_set_config(ETH_HandleTypeDef *eth);
bool drv_eth_sma_init(ETH_HandleTypeDef *eth);
void drv_eth_sma_deinit(ETH_HandleTypeDef *eth);
void drv_eth_sma_master_write_reg(ETH_HandleTypeDef *eth, uint8_t reg_address, uint16_t data);
void drv_eth_sma_master_write_reglist(ETH_HandleTypeDef *eth, uint32_t data[], uint8_t length);
bool drv_eth_sma_master_read_reg(ETH_HandleTypeDef *eth, uint8_t reg_address, uint16_t *data);
bool drv_eth_sma_master_read_reglist(ETH_HandleTypeDef *eth, uint32_t data[], uint8_t length);
void drv_eth_sma_interrupt_handler(ETH_HandleTypeDef *eth);

#endif


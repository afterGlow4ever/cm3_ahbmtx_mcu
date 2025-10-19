//===============================================
//
//	File: drv_spim.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is header file for spim driver.
//
//===============================================

#ifndef __DRV_SPIM_H_
#define __DRV_SPIM_H_

#include "mcu_operation.h"
#include "drv_defines.h"

//===============================================
// macro defines
//===============================================

#define SPIM_INT_TX_FIFO_THRES					(1<<0)
#define SPIM_INT_TX_FIFO_EMPTY					(1<<1)
#define SPIM_INT_RX_FIFO_THRES					(1<<2)
#define SPIM_INT_RX_FIFO_NOEMPTY				(1<<3)
#define SPIM_INT_TRANSFERRING_PENDING			(1<<4)
#define SPIM_INT_FRAME_DONE						(1<<5)

#define SPIM_FIFO_NUM							16

//===============================================
// spim regs
//===============================================

typedef struct
{
	volatile uint32_t tx_data;
	volatile uint32_t top_ctrl;
	volatile uint32_t pe_ctrl0;
	volatile uint32_t pe_ctrl1;
	volatile uint32_t trans_ctrl;
	volatile uint32_t int_en;
	volatile uint32_t int_clr;
	volatile uint32_t fifo_sta;
	volatile uint32_t int_sta;
	volatile uint32_t rx_data;
}SPIM_TypeDef;

//===============================================
// spim enum
//===============================================

typedef enum
{
	SPIM_MODE0,
	SPIM_MODE1,
	SPIM_MODE2,
	SPIM_MODE3,
}spim_mode;

typedef enum
{
	SPIM_DUPLEX,
	SPIM_SIMPLEX,
}spim_trans_mode;

typedef enum
{
	SPIM_FRAME_MODE_DISABLE,
	SPIM_FRAME_MODE_ENABLE,
}spim_trans_frame_mode;

typedef enum
{
	SPIM_TX_UNMASK,
	SPIM_TX_MASK,
}spim_tx_mask;

typedef enum
{
	SPIM_RX_UNMASK,
	SPIM_RX_MASK,
}spim_rx_mask;

typedef enum
{
	SPIM_TX_LSB,
	SPIM_TX_MSB,
}spim_tx_msblsb;

typedef enum
{
	SPIM_RX_LSB,
	SPIM_RX_MSB,
}spim_rx_msblsb;

typedef enum
{
	SPIM_PAUSE_DISABLE,
	SPIM_PAUSE_ENABLE,
}spim_pause_en;

//===============================================
// spim handler
//===============================================

typedef struct
{
	uint32_t clkdiv;
	spim_mode mode;
	spim_trans_mode trans_mode;
	spim_tx_mask tx_mask;
	spim_rx_mask rx_mask;
	uint8_t tls;
	uint8_t tle;
	uint8_t ti;
}SPIM_FunctionCfg;

typedef struct
{
	SPIM_TypeDef *regs;
	SPIM_FunctionCfg cfg;
	uint8_t id;
	uint8_t tx_ptr;
	uint8_t rx_ptr;
	uint16_t *rx_data;
	uint8_t rx_num;
}SPIM_HandleTypeDef;

//===============================================
// spim inline function
//===============================================

static inline void drv_spim_tx_fifo_watermark_set(SPIM_HandleTypeDef *spim, uint8_t fifo_threshold)
{
	REG_SETBITS(spim->regs->top_ctrl, 24, 28, fifo_threshold);
}

static inline void drv_spim_rx_fifo_watermark_set(SPIM_HandleTypeDef *spim, uint8_t fifo_threshold)
{
	REG_SETBITS(spim->regs->top_ctrl, 16, 20, fifo_threshold);
}

static inline void drv_spim_logic_reset(SPIM_HandleTypeDef *spim)
{
	spim->tx_ptr = 0;
	spim->rx_ptr = 0;
	REG_SETBIT(spim->regs->top_ctrl, 8, 1);// trans logic clear
	REG_SETBIT(spim->regs->top_ctrl, 10, 1);// rx fifo clear
	REG_SETBIT(spim->regs->top_ctrl, 11, 1);// tx fifo clear
}

static inline void drv_spim_tx_mask_set(SPIM_HandleTypeDef *spim, spim_tx_mask tx_mask)
{
	REG_SETBIT(spim->regs->pe_ctrl0, 19, tx_mask);
}

static inline void drv_spim_rx_mask_set(SPIM_HandleTypeDef *spim, spim_rx_mask rx_mask)
{
	REG_SETBIT(spim->regs->pe_ctrl0, 18, rx_mask);
}

static inline void drv_spim_trans_enable(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->top_ctrl, 1, 1);
}

static inline void drv_spim_trans_disable(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->top_ctrl, 1, 0);
}

static inline void drv_spim_trans_frame_mode_set(SPIM_HandleTypeDef *spim, spim_trans_frame_mode trans_frame_mode)
{
	REG_SETBIT(spim->regs->pe_ctrl0, 20, trans_frame_mode);
}

static inline void drv_spim_trans_data_num_set_in_trans_frame_mode(SPIM_HandleTypeDef *spim, uint8_t trans_data_num, uint8_t tx_data_num)
{
	REG_SETBITS(spim->regs->trans_ctrl, 0, 7, trans_data_num);
	REG_SETBITS(spim->regs->trans_ctrl, 8, 15, tx_data_num);
}

static inline void drv_spim_trans_data_num_set(SPIM_HandleTypeDef *spim, uint8_t trans_data_num)
{
	REG_SETBITS(spim->regs->trans_ctrl, 0, 7, trans_data_num);
}

static inline void drv_spim_tx_data_num_set(SPIM_HandleTypeDef *spim, uint8_t tx_data_num)
{
	REG_SETBITS(spim->regs->trans_ctrl, 8, 15, tx_data_num);
}

static inline void drv_spim_config_update(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->top_ctrl, 0, 1);
}

static inline void drv_spim_rx_msblsb_set(SPIM_HandleTypeDef *spim, spim_rx_msblsb msblsb)
{
	REG_SETBIT(spim->regs->trans_ctrl, 19, msblsb);
}

static inline void drv_spim_tx_msblsb_set(SPIM_HandleTypeDef *spim, spim_tx_msblsb msblsb)
{
	REG_SETBIT(spim->regs->trans_ctrl, 18, msblsb);
}

static inline void drv_spim_pause_continue_start(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->trans_ctrl, 17, 1);
}

static inline void drv_spim_pause_continue_end(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->trans_ctrl, 17, 0);
}

static inline void drv_spim_pause_continue_enable(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->trans_ctrl, 16, 1);
}

static inline void drv_spim_pause_continue_disable(SPIM_HandleTypeDef *spim)
{
	REG_SETBIT(spim->regs->trans_ctrl, 16, 0);
}

static inline void drv_spim_int_enable(SPIM_HandleTypeDef *spim, uint32_t spim_int)
{
	spim->regs->int_en |= spim_int;
}

static inline void drv_spim_int_disable(SPIM_HandleTypeDef *spim, uint32_t spim_int)
{
	spim->regs->int_en &= ~spim_int;
}

static inline void drv_spim_int_clear(SPIM_HandleTypeDef *spim, uint32_t spim_int)
{
	spim->regs->int_clr |= spim_int;
}

static inline void drv_spim_int_allclear(SPIM_HandleTypeDef *spim)
{
	spim->regs->int_clr = 0x3f;
}

static inline uint32_t drv_spim_int_get(SPIM_HandleTypeDef *spim)
{
	return spim->regs->int_sta;
}

static inline uint8_t drv_spim_tx_fifo_num_get(SPIM_HandleTypeDef *spim)
{
	return REG_GETBITS(spim->regs->fifo_sta, 8, 12);
}

static inline uint8_t drv_spim_rx_fifo_num_get(SPIM_HandleTypeDef *spim)
{
	return REG_GETBITS(spim->regs->fifo_sta, 0, 4);
}

//===============================================
// spim driver function header
//===============================================

void drv_spim_default_config(SPIM_HandleTypeDef *spim);
bool drv_spim_set_config(SPIM_HandleTypeDef *spim);
bool drv_spim_init(SPIM_HandleTypeDef *spim);
void drv_spim_deinit(SPIM_HandleTypeDef *spim);
void drv_spim_tx_data(SPIM_HandleTypeDef *spim, uint8_t data[], uint8_t data_num);
void drv_spim_tx_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t data[], uint8_t data_num);
void drv_spim_trans_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t tx_data[], uint8_t rx_data[], uint8_t data_num);
void drv_spim_rx_data_with_pending(SPIM_HandleTypeDef *spim, uint8_t rx_data[], uint8_t data_num);
void drv_spim_trans_frame_with_pending(SPIM_HandleTypeDef *spim, uint8_t tx_data[], uint8_t rx_data[], uint8_t trans_data_num, uint8_t tx_data_num);
void drv_spim_interrupt_handler(SPIM_HandleTypeDef *spim);

#endif


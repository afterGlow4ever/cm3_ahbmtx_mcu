//===============================================
//
//	File: gd25lb256e_op.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10052025
//	Version: v1.0
//
// 	This is gd25lb256e operation wrap file.
//
//===============================================

#include "gd25lb256e.h"

extern SPIM_HandleTypeDef hspim;

//===============================================
// init operation
//===============================================

void spim_init_for_gd25lb256e(void)
{
	hspim.regs = SPIM;
	hspim.cfg.mode = 0;
	hspim.cfg.clkdiv = 40;
	hspim.cfg.tls = 2;
	hspim.cfg.tle = 2;
	hspim.cfg.ti = 0;

	drv_spim_init(&hspim);
	drv_spim_tx_msblsb_set(&hspim, SPIM_TX_MSB);
	drv_spim_rx_msblsb_set(&hspim, SPIM_RX_MSB);
}

void spim_deinit_for_gd25lb256e(void)
{
	drv_spim_deinit(&hspim);
}

//===============================================
// basic operation
//===============================================

void gd25lb256e_read_id(uint8_t *data)
{
	uint8_t tx_data[5], rx_data[5], i;
//	drv_dual_byte_data_array_clear(tx_data, rx_data, 5);
	memset(tx_data, 0 ,sizeof(tx_data));
	memset(rx_data, 0 ,sizeof(rx_data));
	tx_data[0] = GD25LB256E_READ_IDENTIFICATION;
	drv_spim_trans_data_with_pending(&hspim, tx_data, rx_data, 5);

	for(i=0;i<5;i++)
	{
		test_printf_ch("%x ",rx_data[i]);
	}
//	drv_spim_trans_frame_with_pending(&hspim, tx_data, data, length, 1);
	memcpy(data, &rx_data[1], 4);
}

uint8_t gd25lb256e_read_status_reg(void)
{
	uint8_t tx_data[2], rx_data[2];
	memset(tx_data, 0 ,sizeof(tx_data));
	memset(rx_data, 0 ,sizeof(rx_data));
	tx_data[0] = GD25LB256E_READ_STATUS_REG;
	drv_spim_trans_data_with_pending(&hspim, tx_data, rx_data, 2);
	test_printf_ch("%x ",rx_data[1]);

	return rx_data[1];
}

uint8_t gd25lb256e_read_flag_status_reg(void)
{
	uint8_t tx_data[2], rx_data[2];
	memset(tx_data, 0 ,sizeof(tx_data));
	memset(rx_data, 0 ,sizeof(rx_data));
	tx_data[0] = GD25LB256E_READ_FLAG_STATUS_REG;
	drv_spim_trans_data_with_pending(&hspim, tx_data, rx_data, 2);
	test_printf_ch("%x ",rx_data[1]);

	return rx_data[1];
}

void gd25lb256e_4bytes_address_enable(void)
{
	uint8_t tx_data[1];
	memset(tx_data, 0 ,sizeof(tx_data));
	tx_data[0] = GD25LB256E_4BYTES_ENABLE;
	drv_spim_tx_data(&hspim, tx_data, 1);
}

void gd25lb256e_4bytes_address_disable(void)
{
	uint8_t tx_data[1];
	memset(tx_data, 0 ,sizeof(tx_data));
	tx_data[0] = GD25LB256E_4BYTES_DISABLE;
	drv_spim_tx_data(&hspim, tx_data, 1);
}

void gd25lb256e_write_enable(void)
{
	uint8_t tx_data[1];
	memset(tx_data, 0 ,sizeof(tx_data));
	tx_data[0] = GD25LB256E_WRITE_ENABLE;
	drv_spim_tx_data(&hspim, tx_data, 1);

	// waiting for enable latch
	while(!(gd25lb256e_read_status_reg() & 0x02));
}

void gd25lb256e_write_disable(void)
{
	uint8_t tx_data[1];
	memset(tx_data, 0 ,sizeof(tx_data));
	tx_data[0] = GD25LB256E_WRITE_DISABLE;
	drv_spim_tx_data(&hspim, tx_data, 1);

	// waiting for disable actived
	while((gd25lb256e_read_status_reg() & 0x02));
}

void gd25lb256e_erase(uint32_t addr, gd25lb256e_byte_mode byte_mode, gd25lb256e_erase_mode erase_mode)
{
	uint8_t tx_data[5];
	memset(tx_data, 0 ,sizeof(tx_data));

	switch(erase_mode)
	{
		case SECTOR_ERASE:
			tx_data[0] = GD25LB256E_SECTOR_ERASE;
			break;
		case BLOCK_32K_ERASE:
			tx_data[0] = GD25LB256E_BLOCK_32K_ERASE;
			break;
		case BLOCK_64K_ERASE:
			tx_data[0] = GD25LB256E_BLOCK_64K_ERASE;
			break;
		case CHIP_ERASE:
			tx_data[0] = GD25LB256E_CHIP_ERASE;
			break;
		default:
			tx_data[0] = GD25LB256E_SECTOR_ERASE;
	}

	gd25lb256e_write_enable();

	if(erase_mode == GD25LB256E_CHIP_ERASE)
	{
		drv_spim_tx_data(&hspim, tx_data, 1);
	}
	else
	{
		// msb mode
		if(byte_mode == ADDRESS_3BYTES_MODE)
		{
			tx_data[3] = addr & 0x000000ff;
			tx_data[2] = addr & 0x0000ff00 >> 8;
			tx_data[1] = addr & 0x00ff0000 >> 16;
			drv_spim_tx_data(&hspim, tx_data, 4);
		}
		else
		{
			tx_data[4] = addr & 0x000000ff;
			tx_data[3] = addr & 0x0000ff00 >> 8;
			tx_data[2] = addr & 0x00ff0000 >> 16;
			tx_data[1] = addr & 0xff000000 >> 24;
			drv_spim_tx_data(&hspim, tx_data, 5);
		}
	}

	// waiting for operation done
	while(gd25lb256e_read_status_reg() & 0x01);
}

void gd25lb256e_read_data_bytes(uint32_t addr, gd25lb256e_byte_mode byte_mode, uint8_t *data, uint8_t data_num)
{
	uint8_t tx_data[5];
	uint8_t length;

	memset(tx_data, 0 ,sizeof(tx_data));

	tx_data[0] = GD25LB256E_READ_DATA_BYTES;

	// msb mode
	if(byte_mode == ADDRESS_3BYTES_MODE)
	{
		length = data_num + 4;
		tx_data[3] = addr & 0x000000ff;
		tx_data[2] = addr & 0x0000ff00 >> 8;
		tx_data[1] = addr & 0x00ff0000 >> 16;
		drv_spim_trans_frame_with_pending(&hspim, tx_data, data, length, 4);
	}
	else
	{
		length = data_num + 5;
		tx_data[4] = addr & 0x000000ff;
		tx_data[3] = addr & 0x0000ff00 >> 8;
		tx_data[2] = addr & 0x00ff0000 >> 16;
		tx_data[1] = addr & 0xff000000 >> 24;
		drv_spim_trans_frame_with_pending(&hspim, tx_data, data, length, 5);
	}
}

void gd25lb256e_program_data_bytes(uint32_t addr, gd25lb256e_byte_mode byte_mode, uint8_t *data, uint8_t data_num)
{
	uint8_t tx_data[64];
	uint8_t length;

	gd25lb256e_write_enable();

	tx_data[0] = GD25LB256E_PROGRAM_DATA_BYTES;

	// msb mode
	if(byte_mode == ADDRESS_3BYTES_MODE)
	{
		memcpy(&tx_data[4], data, data_num);
		length = data_num + 4;
		tx_data[3] = addr & 0x00000000;// start address must be at start of a page
		tx_data[2] = addr & 0x0000ff00 >> 8;
		tx_data[1] = addr & 0x00ff0000 >> 16;
//		drv_spim_trans_frame_with_pending(&hspim, tx_data, data, length, length);
		drv_spim_tx_data(&hspim, tx_data, length);
	}
	else
	{
		memcpy(&tx_data[5], data, data_num);
		length = data_num + 5;
		tx_data[4] = addr & 0x00000000;// start address must be at start of a page
		tx_data[3] = addr & 0x0000ff00 >> 8;
		tx_data[2] = addr & 0x00ff0000 >> 16;
		tx_data[1] = addr & 0xff000000 >> 24;
//		drv_spim_trans_frame_with_pending(&hspim, tx_data, data, length, length);
		drv_spim_tx_data(&hspim, tx_data, length);
	}

	// waiting for operation done
	while(gd25lb256e_read_status_reg() & 0x01);
}


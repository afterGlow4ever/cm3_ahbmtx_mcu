//===============================================
//
//	File: gd25lb256.h
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10052025
//	Version: v1.0
//
// 	This is gd25lb256e header file.
//
//===============================================

#ifndef _GD25LB256E_H_
#define _GD25LB256E_H_

#include "main.h"

//===============================================
// gd25lb256e parameters
//===============================================

#define GD25LB256E_PAGE_ADDRESS 0x100
#define GD25LB256E_SECTOR_ADDRESS 0x1000
#define GD25LB256E_BLOCK_ADDRESS 0x10000
#define GD25LB256E_PAGES_IN_A_SECTOR 16
#define GD25LB256E_SECTORS_IN_A_BLOCK 16
#define GD25LB256E_BLOCKS_IN_A_CHIP_IN_ADDRESS_3BYTES_MODE 256
#define GD25LB256E_BLOCKS_IN_A_CHIP_IN_ADDRESS_4BYTES_MODE 512

//===============================================
// gd25lb256e mode
//===============================================

typedef enum
{
	ADDRESS_3BYTES_MODE,
	ADDRESS_4BYTES_MODE,
}gd25lb256e_byte_mode;

typedef enum
{
	SECTOR_ERASE,
	BLOCK_32K_ERASE,
	BLOCK_64K_ERASE,
	CHIP_ERASE,
}gd25lb256e_erase_mode;

//===============================================
// gd25lb256e commands
//===============================================

#define GD25LB256E_READ_IDENTIFICATION 0x9f
#define GD25LB256E_4BYTES_ENABLE 0xb7
#define GD25LB256E_4BYTES_DISABLE 0xe9
#define GD25LB256E_WRITE_ENABLE 0x06
#define GD25LB256E_WRITE_DISABLE 0x04
#define GD25LB256E_READ_STATUS_REG 0x05
#define GD25LB256E_READ_FLAG_STATUS_REG 0x70
#define GD25LB256E_READ_NONVOLATILE_CONFIG_STATUS_REG 0xb5
#define GD25LB256E_READ_VOLATILE_CONFIG_STATUS_REG 0x85
#define GD25LB256E_READ_EXTENDED_ADDRESS_STATUS_REG 0xc8
#define GD25LB256E_WRITE_STATUS_REG 0x01
#define GD25LB256E_WRITE_NONVOLATILE_CONFIG_REG 0xb1
#define GD25LB256E_WRITE_VOLATILE_CONFIG_REG 0x81
#define GD25LB256E_WRITE_EXTENDED_ADDRESS_CONFIG_REG 0xc5
#define GD25LB256E_SECTOR_ERASE 0x20
#define GD25LB256E_BLOCK_32K_ERASE 0x52
#define GD25LB256E_BLOCK_64K_ERASE 0xd8
#define GD25LB256E_CHIP_ERASE 0x60
#define GD25LB256E_READ_DATA_BYTES 0x03
#define GD25LB256E_PROGRAM_DATA_BYTES 0x02

//===============================================
// basic operation
//===============================================

void spim_init_for_gd25lb256e(void);
void spim_deinit_for_gd25lb256e(void);
void gd25lb256e_read_id(uint8_t *data);
uint8_t gd25lb256e_read_status_reg(void);
uint8_t gd25lb256e_read_flag_status_reg(void);
void gd25lb256e_4bytes_address_enable(void);
void gd25lb256e_4bytes_address_disable(void);
void gd25lb256e_write_enable(void);
void gd25lb256e_write_disable(void);
void gd25lb256e_erase(uint32_t addr, gd25lb256e_byte_mode byte_mode, gd25lb256e_erase_mode erase_mode);
void gd25lb256e_read_data_bytes(uint32_t addr, gd25lb256e_byte_mode byte_mode, uint8_t *data, uint8_t data_num);
void gd25lb256e_program_data_bytes(uint32_t addr, gd25lb256e_byte_mode byte_mode, uint8_t *data, uint8_t data_num);





#endif


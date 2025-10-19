//===============================================
//
//	File: spim_gd25lb256e.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 10072025
//	Version: v1.0
//
// 	This is gd25lb256e spi flash cases.
//
//===============================================

#include "spim_gd25lb256e.h"

extern SPIM_HandleTypeDef hspim;

uint8_t tx_flash_data[64];
uint8_t rx_flash_data[64];

//===============================================
// test prepare
//===============================================

void tx_flash_data_prepare(void)
{
	uint8_t i;

	for(i=0;i<64;i++)
		tx_flash_data[i] = i;
}

void rx_flash_data_prepare(void)
{
	uint8_t i;

	for(i=0;i<64;i++)
		rx_flash_data[i] = 0;
}

//===============================================
// test functions
//===============================================

void gd25lb256e_read_id_case(void)
{
	uint8_t i;
	rx_flash_data_prepare();

	gd25lb256e_read_id(rx_flash_data);

	for(i=0;i<4;i++)
	{
		test_printf_ch("%x ",rx_flash_data[i]);
	}
	test_printf_s("\r\n ");
}

void gd25lb256e_read_case(void)
{
	uint8_t i;
	rx_flash_data_prepare();

	gd25lb256e_read_data_bytes(0x00000000, ADDRESS_3BYTES_MODE, rx_flash_data, 32);
	test_printf_s("\r\n read: ");
	for(i=0;i<32;i++)
	{
		test_printf_ch("%x ",rx_flash_data[i]);
	}
}

void gd25lb256e_erase_case(void)
{
	uint8_t i;

	gd25lb256e_erase(0x00000000, ADDRESS_3BYTES_MODE, SECTOR_ERASE);
}

void gd25lb256e_program_case(void)
{
	uint8_t i;
	tx_flash_data_prepare();

	gd25lb256e_program_data_bytes(0x00000000, ADDRESS_3BYTES_MODE, tx_flash_data, 32);
}

void gd25lb256e_operations_case(void)
{
	uint8_t i;
	tx_flash_data_prepare();
	rx_flash_data_prepare();

	gd25lb256e_erase(0x00000000, ADDRESS_3BYTES_MODE, SECTOR_ERASE);
	gd25lb256e_read_data_bytes(0x00000000, ADDRESS_3BYTES_MODE, rx_flash_data, 16);
	test_printf_s("\r\n read: ");
	for(i=0;i<16;i++)
	{
		test_printf_ch("%x ",rx_flash_data[i]);
	}
	gd25lb256e_program_data_bytes(0x00000000, ADDRESS_3BYTES_MODE, tx_flash_data, 16);
	gd25lb256e_read_data_bytes(0x00000000, ADDRESS_3BYTES_MODE, rx_flash_data, 16);
	test_printf_s("\r\n read: ");
	for(i=0;i<16;i++)
	{
		test_printf_ch("%x ",rx_flash_data[i]);
	}
}

void gd25lb256e_write_latch(void)
{
	gd25lb256e_write_enable();
}

void gd25lb256e_read_all_status(void)
{
	gd25lb256e_read_status_reg();
}

//===============================================
// testlist
//===============================================

TestMenu g_gd25lb256e_menu[] =
{
	{'1', gd25lb256e_read_id_case,				"[GD25LB256E] GD25LB256E read id case\r\n"}, 
	{'2', gd25lb256e_read_case,				"[GD25LB256E] GD25LB256E read case\r\n"}, 
	{'3', gd25lb256e_erase_case,				"[GD25LB256E] GD25LB256E erase case\r\n"}, 
	{'4', gd25lb256e_program_case,				"[GD25LB256E] GD25LB256E program case\r\n"}, 
	{'5', gd25lb256e_operations_case,				"[GD25LB256E] GD25LB256E operations case\r\n"}, 
	{'6', gd25lb256e_write_latch,				"[GD25LB256E] GD25LB256E write enable\r\n"}, 
	{'7', gd25lb256e_read_all_status,				"[GD25LB256E] GD25LB256E status\r\n"}, 
};

void gd25lb256e_spi_flash_cases(void)
{
	uint8_t num;

	spim_init_for_gd25lb256e();

	num = sizeof(g_gd25lb256e_menu) / sizeof(TestMenu);
	show_testmenu(g_gd25lb256e_menu, num);	
	test_execute(g_gd25lb256e_menu, num);

	spim_deinit_for_gd25lb256e();
}



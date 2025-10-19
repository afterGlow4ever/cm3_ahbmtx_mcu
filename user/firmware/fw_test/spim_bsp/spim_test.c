//===============================================
//
//	File: spim_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 09212025
//	Version: v1.0
//
// 	This is spi master test source file.
//
//===============================================

#include "spim_test.h"

#ifdef SPIM_TEST

extern SPIM_HandleTypeDef hspim;

volatile uint16_t spim_int_flag;
volatile uint8_t spim_int_flag1;
volatile uint8_t spim_int_flag2;
volatile uint8_t spim_int_flag3;
volatile uint8_t spim_case_flag;
volatile uint8_t spim_temp;
uint8_t tx_data[64];
uint8_t rx_data[64];

//===============================================
// test prepare
//===============================================

void tx_data_prepare(void)
{
	uint8_t i;

	for(i=0;i<64;i++)
		tx_data[i] = i;
}

void rx_data_prepare(void)
{
	uint8_t i;

	for(i=0;i<64;i++)
		rx_data[i] = 0;
}

//===============================================
// test functions
//===============================================

void spim_tx_data_test(void)
{
	uint8_t i, j, k;
	tx_data_prepare();
	tx_data[0] = 0x99;
	tx_data[31] = 0x99;

	for(i=1;i<4;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
				drv_spim_tx_msblsb_set(&hspim, SPIM_TX_MSB);
				drv_spim_tx_data(&hspim, tx_data, 32);
				spim_deinit();
			}
	for(i=10;i<11;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
				drv_spim_tx_data(&hspim, tx_data, 32);
				spim_deinit();
			}
//	spim_init(1, 0, 1);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
//	spim_init(1, 0, 0);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
//	spim_init(2, 0, 1);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
//	spim_init(2, 0, 0);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
//	spim_init(3, 0, 1);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
//	spim_init(3, 0, 0);
//	drv_spim_tx_data(&hspim, tx_data, 32);
//	spim_deinit();
}

void spim_tx_data_pending_test(void)
{
	uint8_t i, j, k;
	tx_data_prepare();
	tx_data[0] = 0x99;
	tx_data[63] = 0x99;

	for(i=1;i<3;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
				drv_spim_tx_data_with_pending(&hspim, tx_data, 64);
				spim_deinit();
			}
}

void spim_trans_data_pending_test(void)
{
	uint8_t i, j, k;
	tx_data_prepare();
	rx_data_prepare();
	tx_data[0] = 0x99;
	tx_data[63] = 0x99;

	for(i=1;i<4;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
//				drv_spim_tx_msblsb_set(&hspim, SPIM_TX_MSB);
				drv_spim_trans_data_with_pending(&hspim, tx_data, rx_data, 64);
				spim_deinit();
			}
}

void spim_rx_data_pending_test(void)
{
	uint8_t i, j, k;
	tx_data_prepare();
	rx_data_prepare();

	for(i=1;i<4;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
				drv_spim_rx_data_with_pending(&hspim, rx_data, 64);
				spim_deinit();
			}
}

void spim_trans_frame_pending_test(void)
{
	uint8_t i, j, k;
	tx_data_prepare();
	tx_data[0] = 0x99;
	tx_data[1] = 0x99;

	for(i=1;i<3;i++)
		for(j=0;j<4;j++)
			for(k=0;k<2;k++)
			{
				spim_init(i, j, k);
				drv_spim_trans_frame_with_pending(&hspim, tx_data, rx_data, 64, 2);
				spim_deinit();
			}
}

//===============================================
// testlist
//===============================================

TestMenu g_spim_menu[] =
{
	{'1', spim_tx_data_test,				"[SPIM] spim tx data test\r\n"}, 
	{'2', spim_tx_data_pending_test,				"[SPIM] spim tx data pending test\r\n"}, 
	{'3', spim_trans_data_pending_test,				"[SPIM] spim trans data pending test\r\n"}, 
};

void spim_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_spim_menu) / sizeof(TestMenu);
	show_testmenu(g_spim_menu, num);	
	test_execute(g_spim_menu, num);
}

#endif


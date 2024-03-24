//===============================================
//
//	File: eth_test.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is ethernet test source file.
//
//===============================================

#include "eth_test.h"

#ifdef ETH_TEST

extern ETH_HandleTypeDef heth;
extern uint32_t b50610_init_conifg[1];
extern uint32_t b50610_reglist[5];
uint32_t tx_data[32];
uint16_t rx_data[32];
volatile uint8_t sma_callback_cnt;

//===============================================
// test prepare
//===============================================

//static void uart_tx_data_prepare(void)
//{
//	for(uint8_t i = 0; i < 32; i++)
//	{
//		tx_data[i] = 0xc3 + (i << 2);
//	}
//}

//===============================================
// test functions
//===============================================

void b50610_init_test(void)
{
	eth_sma_init();
	b50610_init();
}

void b50610_get_reglist_test(void)
{
	uint8_t status;

	status = drv_eth_sma_master_read_reglist(&heth, b50610_reglist, 8);
	if(status == 1)
	{
		test_printf_s("b50610 nack.\r\n");
		writereg32(0x40000000, 0xffff);
		return;
	}

	test_printf_s("b50610 read:\r\n");
	for(uint8_t i = 0; i < 8; i++)
	{
		test_printf_ch("%x ", b50610_reglist[i]);
		writereg32(0x40000004, b50610_reglist[i]);
	}	
	test_printf_s("\r\n");
}

//void yt8511_get_status_test(void)
//{
//	eth_sma_init();
//}

//void yt8511_get_status_it_test(void)
//{
//	uint16_t temp;
//
//	eth_sma_init();
//	drv_eth_sma_int_enable(&heth, ETH_SMA_INT_MASTER_FRAME_DONE);
//	NVIC_SetPriority(EthSma_IRQn, 0);
//	NVIC_EnableIRQ(EthSma_IRQn);
//
//	sma_callback_cnt = 0;
//
//	temp =  yt8511_get_status();
//	while(sma_callback_cnt != 1);
//
//	NVIC_DisableIRQ(EthSma_IRQn);
//
//	test_printf_ch("%x ", temp);
//	writereg32(0x40000000, temp);
//	test_printf_s("\r\n");
//	writereg32(0x40000004, sma_callback_cnt);
//	test_printf_ch("rx callback times: %x ", sma_callback_cnt);
//	test_printf_s("\r\n");
//}
//
//void eth_sma_int_master_frame_done_callback(ETH_HandleTypeDef *heth)
//{
//	sma_callback_cnt++;
//	writereg32(0x4000000c, sma_callback_cnt);
//}

//===============================================
// testlist
//===============================================

TestMenu g_eth_menu[] =
{
	{'1', b50610_init_test,						"[ETH SMA] b50610 init\r\n"}, 
	{'2', b50610_set_config,					"[ETH SMA] b50610 set config\r\n"}, 
	{'3', b50610_get_reglist_test,				"[ETH SMA] b50610 get reglist\r\n"}, 
	{'4', b50610_get_status,					"[ETH SMA] b50610 get status\r\n"}, 
	{'5', b50610_set_swrst,						"[ETH SMA] b50610 sw reset\r\n"}, 
//	{'4', yt8511_get_status_it_test,			"[ETH SMA] yt8511 get status int\r\n"}, 
};

void eth_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_eth_menu) / sizeof(TestMenu);
	show_testmenu(g_eth_menu, num);	
	test_execute(g_eth_menu, num);
}

#endif


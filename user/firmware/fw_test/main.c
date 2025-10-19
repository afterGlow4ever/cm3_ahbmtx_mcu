//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 04012024
//	Version: v1.0
//
// 	This is test main fw for mcu.
//	Including:
//	1. system init
//
//===============================================

#include "main.h"

extern UART_HandleTypeDef huart0;

//===============================================
// testlist
//===============================================

TestMenu g_mcu_menu[] =
{
#ifdef UART_TEST
	{'1', uart_testmenu,							"[UART] test menu\r\n"},
#endif
#ifdef GPIO_TEST
	{'2', gpio_testmenu,							"[GPIO] test menu\r\n"},
#endif
#ifdef BASTIM_TEST
	{'3', bastim_testmenu,							"[BASTIM] test menu\r\n"},
#endif
#ifdef ETH_TEST
	{'4', eth_testmenu,								"[ETH] test menu\r\n"},
#endif
#ifdef ADVTIM_TEST
	{'5', advtim_testmenu,							"[ADVTIM] test menu\r\n"},
#endif
#ifdef SPIM_TEST
	{'6', spim_testmenu,							"[SPIM] test menu\r\n"},
#endif
	{'0', mcu_testmenu,								"[MCU] test menu\r\n"}
};

void mcu_testmenu(void)
{
	uint8_t num;
	num = sizeof(g_mcu_menu) / sizeof(TestMenu);	
	show_testmenu(g_mcu_menu, num);	
	test_execute(g_mcu_menu, num);
}

//===============================================
// main
//===============================================

int main(void)
{
	uart0_init();
#ifdef SIM
	writereg32(0x40000008, 0xbd);
//	eth_mac_tx_data_by_sw(2048);
//	eth_mac_tx_data_by_sw(53);
//	eth_mac_tx_data_by_sw(102);
//	eth_mac_tx_data_by_sw(4);
//	eth_mac_tx_data_by_sw(7);
//	eth_mac_tx_data_by_hw(4);
//	eth_mac_tx_data_by_hw(7);
//	eth_mac_tx_data_by_hw(21);
//	eth_mac_tx_data_by_hw(39);
//	eth_mac_tx_data_by_hw(80);
//	eth_mac_tx_data_by_sw(2048);
//	eth_mac_tx_arp_frame_by_hw_replacement();
//	eth_mac_tx_arp_frame_by_hw_insertion();
//	eth_mac_tx_ip_tcp_frame_by_hw_replacement();
//	eth_mac_tx_ip_tcp_frame_by_hw_insertion();
//	eth_mac_tx_ip_icmp_frame_by_hw_replacement();
//	eth_mac_tx_ip_icmp_frame_by_hw_insertion();
//	eth_mac_tx_ip_udp_frame_by_hw_replacement();
//	eth_mac_tx_ip_udp_frame_by_hw_insertion();
//	eth_mac_tx_ip_igmp_frame_by_hw_replacement();
//	eth_mac_tx_ip_igmp_frame_by_hw_insertion();
//	eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement();
//	eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion();
////	eth_mac_tx_ip_igmp_frame_by_hw_crc_insertion();
//	eth_mac_tx_ip_igmp_frame_by_sw_padding_crc();
//	eth_mac_tx_ip_udp_frame2_by_hw_replacement();
//	eth_mac_tx_ip_udp_frame2_by_hw_insertion();
//	b50610_init_test();
//	writereg32(0x40000008, 0xbd1);
//	b50610_get_reglist_test();
//	bastim_4ch_autoreload_int_test();
//	bastim_4ch_test();
//	gpioa2_out_gpioa3_in_it_test();
//	uart1_rx_it_test();
//	advtim_autoreload_test();//
//	advtim_mix_count_test();//
//	advtim_mix_mode_test();
//	advtim_mix_cm_test();
//	advtim_ch1_pwm_test();
//	advtim_ch_all_pwm_test();
//	advtim_ch_all_pwm_with_channel5_test();
//	advtim_ch1_pwm_with_deadzone_test();
//	advtim_ch123_pwm_with_deadzone_test();
//	advtim_ch1_mode_with_deadzone_test();
//	advtim_ch_all_pwm_with_deadzone_test();
//	advtim_ch_all_pwm_and_gpio_with_deadzone_test();//
//	advtim_ch1_step_input_test();//
//	advtim_ch1_step_once_input_test();
//	advtim_ch1_pwm_input_test();//
//	advtim_ch1_encoder_input_test();
//	advtim_ch1_encoder_both_edge_input_test();//
//	advtim_ch1_encoder_dq_input_test();//
//	advtim_ch_all_pwm_with_deadzone_with_break_test();//
//	advtim_ch_all_pwm_and_gpio_with_deadzone_with_break_test();//
//	advtim_ch_all_pwm_with_deadzone_with_break_on_test();
//	advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test();//
//	advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test();
//	advtim_ch1_encoder_direct_both_edge_on_test();
//	spim_tx_data_test();
//	spim_tx_data_pending_test();
//	spim_trans_data_pending_test();
//	spim_rx_data_pending_test();
	spim_trans_frame_pending_test();
	writereg32(0x40000008, 0xed);
#else
#endif
//advtim_ch_all_pwm_and_gpio_with_deadzone_with_break_on_test();
	while(1)
	{
#ifdef SIM
#else
		mcu_testmenu();
#endif
	}
}

//===============================================
// test menu
//===============================================

void show_testmenu(TestMenu menu[], uint8_t num)
{
	uint8_t i;

	drv_uart_printf("[TEST] Show test menu...\r\n");
	for(i = 0; i < num; i ++)
	{
		drv_uart_printf("[%c] %s", menu[i].ch, menu[i].str);
	}
	drv_uart_printf("[TEST] Press key to execute or 'Q' to exit...\r\n");
}

void test_execute(TestMenu menu[], uint8_t num)
{
	uint8_t i, ret, ch;
	
	while(1)
	{
		ch = 0;
		ret = drv_uart_getchar_timeout(&huart0, &ch, 250000);
		if(ret == FALSE)
		{
			drv_uart_printf("Input %c...\r\n", ch);
			if(ch == 'Q')
			{
				drv_uart_printf("[TEST] Test ends...\r\n\r\n");
				return;
			}
			else 
			{
				for(i = 0; i < num; i ++)
				{
					if(ch == menu[i].ch)
					{
						drv_uart_printf("[TEST] Start:%s", menu[i].str);
						menu[i].pFun();
						drv_uart_printf("[TEST] End:%s", menu[i].str);
						break;
					}
				}
				drv_uart_printf("Input error...\r\n");
			}
		}	
	}
}

//===============================================
// return 1 when press 'Q'
//===============================================

uint8_t exit_current_test_detection(void)
{
//#ifdef SIM
//#else
	uint8_t ch, ret;
	ret = drv_uart_getchar_timeout(&huart0, &ch, 250000);
	if(ret == FALSE)
	{
		if(ch == 'Q')
			return 1;
	}
//#endif
	return 0;
}

//===============================================
// return 1 when press 'Q'
//===============================================

void exit_current_test_loop(void)
{
	uint8_t ch, ret;
	while(1)
	{
//#ifdef SIM
//#else
		ret = drv_uart_getchar_timeout(&huart0, &ch, 250000);
		if(ret == FALSE)
		{
			if(ch == 'Q')
				return;
		}
//#endif
	}
}


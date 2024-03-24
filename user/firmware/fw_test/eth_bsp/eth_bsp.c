//===============================================
//
//	File: eth_bsp.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 03202024
//	Version: v1.0
//
// 	This is ethernet bsp source file.
//
//===============================================

#include "eth_bsp.h"

ETH_HandleTypeDef heth;

uint32_t b50610_init_conifg[] = 
{
	(0x00 << 16) | (0xa100), // sw rst
	(0x00 << 16) | (0x2100), // no auto-negotiation, 100mhz, full duplex, power on
};

uint32_t b50610_reglist[] = 
{
	(0x00 << 16) | (0x0000), 
	(0x01 << 16) | (0x0000), 
	(0x02 << 16) | (0x0000), 
	(0x03 << 16) | (0x0000), 
	(0x04 << 16) | (0x0000), 
	(0x05 << 16) | (0x0000), 
	(0x06 << 16) | (0x0000), 
	(0x19 << 16) | (0x0000)
};

//===============================================
// eth init
//===============================================

void eth_sma_init(void)
{
	heth.regs = ETH;
	drv_eth_sma_default_config(&heth);
	drv_eth_sma_init(&heth);
}

//===============================================
// eth phy b50610 
//===============================================

void b50610_init(void)
{
	heth.sma_cfg.phy_address = B50610_PHY_ADDRESS;
	drv_eth_sma_set_config(&heth);
	drv_eth_sma_config_update(&heth);
	drv_eth_sma_master_write_reglist(&heth, b50610_init_conifg, 2);
}

void b50610_set_config(void)
{
	drv_eth_sma_master_write_reg(&heth, 0x0, 0x2100);
}

void b50610_set_swrst(void)
{
	drv_eth_sma_master_write_reg(&heth, 0x0, 0x9100);
}

void b50610_get_status(void)
{
	uint16_t value, status;
	status = drv_eth_sma_master_read_reg(&heth, 0x19, &value);
	if(status == 1)
	{
		test_printf_s("b50610 nack.\r\n");
		writereg32(0x40000000, 0xffff);
		return;
	}
	else
	{
		test_printf_ch("b50610 status %x.\r\n", value);
		writereg32(0x40000004, value);
	}
}


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
// eth sma init
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

//===============================================
// eth mac init
// ram1 allocate
// 0x20000~0x22000 data area for program
// 0x28000~0x30000 descriptor
// 0x30000~0x38000 tx frame for eth dma
// 0x38000~0x40000 rx frame for eth dma
//===============================================

ETH_MAC_HandleTypeDef hethmac;
//ETH_MAC_DmaCfg hethmac_dmacfg;
//ETH_MAC_FunctionCfg hethmac_pecfg;
ETH_MAC_DmaTxDescriptorCfg hethmac_desccfg;
//__attribute__((at(0x00028000))) ETH_MAC_DmaDescriptorHandleTypeDef EthDmaTxDesc[ETH_MAC_TX_DESCRIPTOR_NUM];
ETH_MAC_DmaDescriptorHandleTypeDef EthDmaTxDesc[ETH_MAC_TX_DESCRIPTOR_NUM];//using address ptr instead

void eth_mac_descriptor_sw_handle_prepare(uint32_t data_number)
{
	uint8_t i;
	
	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = data_number;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_SW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_SW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_SW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);

	}
}

void eth_mac_descriptor_hw_handle_prepare(uint32_t data_number)
{
	uint8_t i;

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = data_number;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_SW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
}

void eth_mac_descriptor_arp_frame_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0xf4, 0x8e, 0x38, 0x88, 0x75, 0xba};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 42;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_arp_frame_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0xf4, 0x8e, 0x38, 0x88, 0x75, 0xba};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 36;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_tcp_frame_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x8c, 0x14, 0xb4, 0x84, 0x4b, 0x48};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 66;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_tcp_frame_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x8c, 0x14, 0xb4, 0x84, 0x4b, 0x48};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 56;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_icmp_frame_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x34, 0xfc, 0xa1, 0x9c, 0xc7, 0xa4};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 98;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_icmp_frame_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x34, 0xfc, 0xa1, 0x9c, 0xc7, 0xa4};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 88;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_udp_frame_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x0c, 0x29, 0xd6, 0x22, 0x97};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 90;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_udp_frame_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x0c, 0x29, 0xd6, 0x22, 0x97};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 80;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x50, 0xba, 0x85, 0x84, 0xb3};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 50;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x50, 0xba, 0x85, 0x84, 0xb3};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 42;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x50, 0xba, 0x85, 0x84, 0xb3};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 64;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_ONLY_CRC_REPLACED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_igmp_frame_crc_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x50, 0xba, 0x85, 0x84, 0xb3};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 60;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_ONLY_CRC_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0x00, 0x50, 0xba, 0x85, 0x84, 0xb3};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 64;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_SW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0xe0, 0xcb, 0x4e, 0xc9, 0xdf, 0xce};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 109;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_REPLACED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_REPLACED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare(void)
{
	uint8_t i;
	uint8_t mac_address[6] = {0xe0, 0xcb, 0x4e, 0xc9, 0xdf, 0xce};

	hethmac.tx_descriptor_num = 1;
	drv_eth_mac_tx_descriptor_default_config(&hethmac_desccfg);
//	hethmac_desccfg.buffer1_address = 0x00030000;
	hethmac_desccfg.buffer1_length = 99;
	hethmac_desccfg.cic = ETH_MAC_TXDESC_CHECKSUM_INSERTED_BY_HW;
	hethmac_desccfg.cpc = ETH_MAC_TXDESC_CRC_AND_PAD_INSERTED_BY_HW;
	hethmac_desccfg.saic = ETH_MAC_TXDESC_SA_MACADDRESS_INSERTED_BY_HW;
	for(i = 0; i < hethmac.tx_descriptor_num; i++)
	{
		hethmac_desccfg.buffer1_address = 0x00030000+i*0x0800;
		drv_eth_mac_tx_descriptor_config(&hethmac_desccfg, &EthDmaTxDesc[i]);
	}
	drv_eth_mac_address_set(&hethmac, mac_address);
	drv_eth_mac_pe_config_update(&hethmac);
}

void eth_mac_init(void)
{
	hethmac.regs = ETH_MAC;
//	hethmac.dma_cfg. = ;
//	hethmac.pe_cfg = ;
	drv_eth_mac_dma_default_config(&hethmac);
	drv_eth_mac_pe_default_config(&hethmac);
	drv_eth_mac_init(&hethmac);
	drv_eth_mac_tx_descriptor_clear(&hethmac);
}



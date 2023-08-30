//===============================================
//
//	File: main.c
//	Author: afterGlow,4ever
//	Group: Fall For Laboratory
//	Date: 08182023
//	Version: v1.0
//
// 	This is bootloader for mcu in itcm.
//	Including:
//	1. system init
//
//===============================================

#include "main.h"

int main(void)
{
	uint32_t temp;
	uint32_t temp2;

	writereg32(DTCM_BASE_ADDR+0x04, 0x12345678);
	temp = readreg32(DTCM_BASE_ADDR+0x04);
	writereg32(DTCM_BASE_ADDR+0x08, (temp<<1));
	temp = readreg32(DTCM_BASE_ADDR+0x08);
	temp2 = readreg32(DTCM_BASE_ADDR+0x04);
	writereg32(DTCM_BASE_ADDR+0x0c, (temp+temp2));

	while(1);
}


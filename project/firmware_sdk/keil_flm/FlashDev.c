/**************************************************************************//**
 * @file     FlashDev.c
 * @brief    Flash Device Description for New Device Flash
 * @version  V1.0.0
 * @date     10. January 2018
 ******************************************************************************/
/*
 * Copyright (c) 2010-2018 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include "FlashOS.H"        // FlashOS Structures


struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
// modify 04062024: 128k sram support
#ifdef SRAM_128K
   "CM3_AHBMTX 128kB",   			 // Device Name 
#else
   "CM3_AHBMTX 32kB",   			 // Device Name 
#endif
   ONCHIP,                     // Device Type
   0x00000000,                 // Device Start Address
// modify 04062024: 128k sram support	
#ifdef SRAM_128K	
   0x00020000,                 // Device Size in Bytes (128kB)	
#else	
   0x00008000,                 // Device Size in Bytes (32kB)
#endif	
   1024,                       // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   500,                        // Program Page Timeout 500 mSec
   6000,                       // Erase Sector Timeout 6000 mSec

// Specify Size and Address of Sectors
// modify 04062024: 128k sram support
#ifdef SRAM_128K		
   0x00020000, 0x00000000,         // Sector Size  128kB (1 Sectors)
#else	
   0x00008000, 0x00000000,         // Sector Size  32kB (1 Sectors)
#endif
   SECTOR_END
};

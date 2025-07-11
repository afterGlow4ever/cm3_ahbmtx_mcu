/**************************************************************************//**
 * @file     startup_CM3DS_MPS2.s
 * @brief    CMSIS Cortex-M3 Core Device Startup File for
 *           Device CM3DS_MPS2_
 * @version  V3.01
 * @date     06. March 2012
 *
 * @note      Should use with GCC for ARM Embedded Processors
 * Copyright (C) 2012,2017 ARM Limited. All rights reserved.
 *
 * @par
 * ARM Limited (ARM) is supplying this software for use with Cortex-M
 * processor based microcontrollers.  This file can be freely distributed
 * within development tools that are supporting such ARM based processors.
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/
/*****************************************************************************/
/* startup_CM3DS_MPS2.s: Startup file for CM3DS_MPS2 device series               */
/*****************************************************************************/
/* Version: GNU Tools for ARM Embedded Processors                          */
/*****************************************************************************/


    .syntax unified
    .arch armv7-m

    .section .stack
    .align 3

/*
// <h> Stack Configuration
//   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

    .section .stack
    .align 3
#ifdef __STACK_SIZE
    .equ    Stack_Size, __STACK_SIZE
#else
    .equ    Stack_Size, 0x200
#endif
    .globl    __StackTop
    .globl    __StackLimit
__StackLimit:
    .space    Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop


/*
// <h> Heap Configuration
//   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

    .section .heap
    .align 3
#ifdef __HEAP_SIZE
    .equ    Heap_Size, __HEAP_SIZE
#else
    .equ    Heap_Size, 0
#endif
    .globl    __HeapBase
    .globl    __HeapLimit
__HeapBase:
    .if    Heap_Size
    .space    Heap_Size
    .endif
    .size __HeapBase, . - __HeapBase
__HeapLimit:
    .size __HeapLimit, . - __HeapLimit


/* Vector Table */

    .section .isr_vector
    .align 2
    .globl __isr_vector
__isr_vector:
    .long   __StackTop                  /* Top of Stack                  */
    .long   Reset_Handler               /* Reset Handler                 */
    .long   NMI_Handler                 /* NMI Handler                   */
    .long   HardFault_Handler           /* Hard Fault Handler            */
    .long   MemManage_Handler           /* MPU Fault Handler             */
    .long   BusFault_Handler            /* Bus Fault Handler             */
    .long   UsageFault_Handler          /* Usage Fault Handler           */
    .long   0                           /* Reserved                      */
    .long   0                           /* Reserved                      */
    .long   0                           /* Reserved                      */
    .long   0                           /* Reserved                      */
    .long   SVC_Handler                 /* SVCall Handler                */
    .long   DebugMon_Handler            /* Debug Monitor Handler         */
    .long   0                           /* Reserved                      */
    .long   PendSV_Handler              /* PendSV Handler                */
    .long   SysTick_Handler             /* SysTick Handler               */

    /* External Interrupts */
    .long   Uart0_Handler               /* 16+ 0: UART 0 RX and TX Handler	*/
    .long   Uart1_Handler               /* 16+ 1: UART 1 RX and TX Handler	*/
    .long   Resv2_Handler               /* 16+ 2: Reserved 2 Handler   		*/
    .long   Resv3_Handler               /* 16+ 3: Reserved 3 Handler		*/
    .long   EthDma_Handler              /* 16+ 4: ETH DMA Handler			*/
    .long   Gpioa_Handler               /* 16+ 5: GPIOA Handler   			*/		
    .long   Resv6_Handler               /* 16+ 6: Reserved 6 Handler		*/
    .long   Resv7_Handler               /* 16+ 7: Reserved 7 Handler		*/
    .long   Bastim_Ch0_Handler 	        /* 16+ 8: BASTIM CHANNEL0 Handler   */
    .long   Bastim_Ch1_Handler 	        /* 16+ 9: BASTIM CHANNEL1 Handler   */
    .long   Bastim_Ch2_Handler 	        /* 16+10: BASTIM CHANNEL2 Handler   */
    .long   Bastim_Ch3_Handler 	        /* 16+11: BASTIM CHANNEL3 Handler   */
    .long   EthSma_Handler              /* 16+12: ETH SMA Handler		   	*/
    .long   EthTx_Handler               /* 16+13: ETH TX Handler		   	*/
    .long   EthRx_Handler               /* 16+14: ETH RX Handler		   	*/
    .long   Resv15_Handler              /* 16+15: Reserved 15 Handler   	*/
    .long   AdvtimGen_Handler			/* 16+16: ADVTIM GEN Handler	   	*/
    .long   AdvtimCap_Handler			/* 16+17: ADVTIM CAP Handler	   	*/
    .long   AdvtimEnc_Handler			/* 16+18: ADVTIM ENC Handler	   	*/
    .size    __isr_vector, . - __isr_vector

/* Reset Handler */
    .text
    .thumb
    .thumb_func
    .align 2
    .globl    Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
/*     Loop to copy data from read only memory to RAM. The ranges
 *      of copy from/to are specified by following symbols evaluated in
 *      linker script.
 *      __etext: End of code section, i.e., begin of data sections to copy from.
 *      __data_start__/__data_end__: RAM address range that data should be
 *      copied to. Both must be aligned to 4 bytes boundary.  */

    ldr    r1, =__etext
    ldr    r2, =__data_start__
    ldr    r3, =__data_end__

    subs    r3, r2
    ble    .LC1
.LC0:
    subs    r3, #4
    ldr    r0, [r1, r3]
    str    r0, [r2, r3]
    bgt    .LC0
.LC1:

#ifdef __STARTUP_CLEAR_BSS
/*     This part of work usually is done in C library startup code. Otherwise,
 *     define this macro to enable it in this startup.
 *
 *     Loop to zero out BSS section, which uses following symbols
 *     in linker script:
 *      __bss_start__: start of BSS section. Must align to 4
 *      __bss_end__: end of BSS section. Must align to 4
 */
    ldr r1, =__bss_start__
    ldr r2, =__bss_end__

    movs    r0, 0
.LC2:
    cmp     r1, r2
    itt    lt
    strlt   r0, [r1], #4
    blt    .LC2
#endif /* __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
    /* bl    SystemInit */
#    ldr     r0,=SystemInit
#    blx     r0
#endif

    bl    main
    bl    exit


    .pool
    .size Reset_Handler, . - Reset_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro    def_default_handler    handler_name
    .align 1
    .thumb_func
    .weak    \handler_name
    .type    \handler_name, %function
\handler_name :
    b    .
    .size    \handler_name, . - \handler_name
    .endm

/* System Exception Handlers */

    def_default_handler    NMI_Handler
    def_default_handler    HardFault_Handler
    def_default_handler    MemManage_Handler
    def_default_handler    BusFault_Handler
    def_default_handler    UsageFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    DebugMon_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    SysTick_Handler

/* IRQ Handlers */

    def_default_handler    Uart0_Handler
    def_default_handler    Uart1_Handler
    def_default_handler    Resv2_Handler
    def_default_handler    Resv3_Handler
    def_default_handler    EthDma_Handler
    def_default_handler    Gpioa_Handler
    def_default_handler    Resv6_Handler
    def_default_handler    Resv7_Handler
    def_default_handler    Bastim_Ch0_Handler
    def_default_handler    Bastim_Ch1_Handler
    def_default_handler    Bastim_Ch2_Handler
    def_default_handler    Bastim_Ch3_Handler
    def_default_handler    EthSma_Handler
    def_default_handler    EthTx_Handler
    def_default_handler    EthRx_Handler
    def_default_handler    Resv15_Handler
    def_default_handler    AdvtimGen_Handler
    def_default_handler    AdvtimCap_Handler
    def_default_handler    AdvtimEnc_Handler

    /*
    def_default_handler    Default_Handler
    .weak    DEF_IRQHandler
    .set    DEF_IRQHandler, Default_Handler
    */
    .end


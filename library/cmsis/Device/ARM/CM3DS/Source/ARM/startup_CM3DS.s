;/**************************************************************************//**
; * @file     startup_CM3DS_MPS2.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File for
; *           Device CM3DS_MPS2
; * @version  V3.01
; * @date     06. March 2012
; *
; * @note
; * Copyright (C) 2012,2017 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M
; * processor based microcontrollers.  This file can be freely distributed
; * within development tools that are supporting such ARM based processors.
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000C00

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     Uart0_Handler             ; UART 0 RX and TX Handler
                DCD     Uart1_Handler             ; UART 1 RX and TX Handler
                DCD     Resv2_Handler             ; Reserved 2 Handler
                DCD     Resv3_Handler             ; Reserved 3 Handler
                DCD     Resv4_Handler             ; Reserved 4 Handler
                DCD     Gpioa_Handler             ; GPIOA Handler
				DCD     Resv6_Handler             ; Reserved 6 Handler	
				DCD     Resv7_Handler             ; Reserved 7 Handler	
                DCD     Bastim_Ch0_Handler        ; BASTIM CHANNEL0 Handler
                DCD     Bastim_Ch1_Handler        ; BASTIM CHANNEL1 Handler
                DCD     Bastim_Ch2_Handler        ; BASTIM CHANNEL2 Handler
                DCD     Bastim_Ch3_Handler        ; BASTIM CHANNEL3 Handler
				DCD     EthSma_Handler            ; ETH SMA Handler	
;				DCD     Resv13_Handler            ; Reserved 13 Handler	
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
;                IMPORT  SystemInit
                IMPORT  __main
;                LDR     R0, =SystemInit
;                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler\
                PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler\
                PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC
                EXPORT Uart0_Handler              [WEAK]
                EXPORT Uart1_Handler              [WEAK]
                EXPORT Resv2_Handler			  [WEAK]
                EXPORT Resv3_Handler			  [WEAK]
                EXPORT Resv4_Handler			  [WEAK]
                EXPORT Gpioa_Handler			  [WEAK]
				EXPORT Resv6_Handler			  [WEAK]	
				EXPORT Resv7_Handler			  [WEAK]	
				EXPORT Bastim_Ch0_Handler		  [WEAK]	
				EXPORT Bastim_Ch1_Handler		  [WEAK]	
				EXPORT Bastim_Ch2_Handler		  [WEAK]	
				EXPORT Bastim_Ch3_Handler		  [WEAK]	
				EXPORT EthSma_Handler		  	  [WEAK]	
;				EXPORT Resv13_Handler			  [WEAK]	
Uart0_Handler
Uart1_Handler
Resv2_Handler
Resv3_Handler
Resv4_Handler
Gpioa_Handler
Resv6_Handler
Resv7_Handler
Bastim_Ch0_Handler
Bastim_Ch1_Handler
Bastim_Ch2_Handler
Bastim_Ch3_Handler
EthSma_Handler
;Resv13_Handler
                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap

__user_initial_stackheap PROC
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
                ENDP

                ALIGN

                ENDIF


                END


bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00012000 	andeq	r2, r1, r0
   4:	000000ed 	andeq	r0, r0, sp, ror #1
   8:	00000081 	andeq	r0, r0, r1, lsl #1
   c:	00000083 	andeq	r0, r0, r3, lsl #1
  10:	00000085 	andeq	r0, r0, r5, lsl #1
  14:	00000087 	andeq	r0, r0, r7, lsl #1
  18:	00000089 	andeq	r0, r0, r9, lsl #1
	...
  2c:	0000008b 	andeq	r0, r0, fp, lsl #1
  30:	0000008d 	andeq	r0, r0, sp, lsl #1
  34:	00000000 	andeq	r0, r0, r0
  38:	0000008f 	andeq	r0, r0, pc, lsl #1
  3c:	00000091 	muleq	r0, r1, r0

00000040 <__do_global_dtors_aux>:
  40:	b510      	push	{r4, lr}
  42:	4c05      	ldr	r4, [pc, #20]	; (58 <__do_global_dtors_aux+0x18>)
  44:	7823      	ldrb	r3, [r4, #0]
  46:	b933      	cbnz	r3, 56 <__do_global_dtors_aux+0x16>
  48:	4b04      	ldr	r3, [pc, #16]	; (5c <__do_global_dtors_aux+0x1c>)
  4a:	b113      	cbz	r3, 52 <__do_global_dtors_aux+0x12>
  4c:	4804      	ldr	r0, [pc, #16]	; (60 <__do_global_dtors_aux+0x20>)
  4e:	f3af 8000 	nop.w
  52:	2301      	movs	r3, #1
  54:	7023      	strb	r3, [r4, #0]
  56:	bd10      	pop	{r4, pc}
  58:	00010068 	andeq	r0, r1, r8, rrx
  5c:	00000000 	andeq	r0, r0, r0
  60:	00000188 	andeq	r0, r0, r8, lsl #3

00000064 <frame_dummy>:
  64:	b508      	push	{r3, lr}
  66:	4b03      	ldr	r3, [pc, #12]	; (74 <frame_dummy+0x10>)
  68:	b11b      	cbz	r3, 72 <frame_dummy+0xe>
  6a:	4903      	ldr	r1, [pc, #12]	; (78 <frame_dummy+0x14>)
  6c:	4803      	ldr	r0, [pc, #12]	; (7c <frame_dummy+0x18>)
  6e:	f3af 8000 	nop.w
  72:	bd08      	pop	{r3, pc}
  74:	00000000 	andeq	r0, r0, r0
  78:	0001006c 	andeq	r0, r1, ip, rrx
  7c:	00000188 	andeq	r0, r0, r8, lsl #3

00000080 <NMI_Handler>:
  80:	4770      	bx	lr

00000082 <HardFault_Handler>:
  82:	e7fe      	b.n	82 <HardFault_Handler>

00000084 <MemManage_Handler>:
  84:	e7fe      	b.n	84 <MemManage_Handler>

00000086 <BusFault_Handler>:
  86:	e7fe      	b.n	86 <BusFault_Handler>

00000088 <UsageFault_Handler>:
  88:	e7fe      	b.n	88 <UsageFault_Handler>

0000008a <SVC_Handler>:
  8a:	4770      	bx	lr

0000008c <DebugMon_Handler>:
  8c:	4770      	bx	lr

0000008e <PendSV_Handler>:
  8e:	4770      	bx	lr

00000090 <SysTick_Handler>:
  90:	4770      	bx	lr
	...

00000094 <main>:
  94:	f44f 3380 	mov.w	r3, #65536	; 0x10000
  98:	4a13      	ldr	r2, [pc, #76]	; (e8 <main+0x54>)
  9a:	605a      	str	r2, [r3, #4]
  9c:	685a      	ldr	r2, [r3, #4]
  9e:	0052      	lsls	r2, r2, #1
  a0:	609a      	str	r2, [r3, #8]
  a2:	6899      	ldr	r1, [r3, #8]
  a4:	685a      	ldr	r2, [r3, #4]
  a6:	1888      	adds	r0, r1, r2
  a8:	60d8      	str	r0, [r3, #12]
  aa:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  ae:	6118      	str	r0, [r3, #16]
  b0:	2300      	movs	r3, #0
  b2:	e001      	b.n	b8 <main+0x24>
  b4:	3301      	adds	r3, #1
  b6:	b2db      	uxtb	r3, r3
  b8:	2b0f      	cmp	r3, #15
  ba:	d9fb      	bls.n	b4 <main+0x20>
  bc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  c0:	609a      	str	r2, [r3, #8]
  c2:	2300      	movs	r3, #0
  c4:	e001      	b.n	ca <main+0x36>
  c6:	3301      	adds	r3, #1
  c8:	b2db      	uxtb	r3, r3
  ca:	2b0f      	cmp	r3, #15
  cc:	d9fb      	bls.n	c6 <main+0x32>
  ce:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  d2:	6059      	str	r1, [r3, #4]
  d4:	2300      	movs	r3, #0
  d6:	e001      	b.n	dc <main+0x48>
  d8:	3301      	adds	r3, #1
  da:	b2db      	uxtb	r3, r3
  dc:	2b0f      	cmp	r3, #15
  de:	d9fb      	bls.n	d8 <main+0x44>
  e0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  e4:	601a      	str	r2, [r3, #0]
  e6:	e7fe      	b.n	e6 <main+0x52>
  e8:	12345678 	eorsne	r5, r4, #120, 12	; 0x7800000

000000ec <Reset_Handler>:
  ec:	490a      	ldr	r1, [pc, #40]	; (118 <Reset_Handler+0x2c>)
  ee:	4a0b      	ldr	r2, [pc, #44]	; (11c <Reset_Handler+0x30>)
  f0:	4b0b      	ldr	r3, [pc, #44]	; (120 <Reset_Handler+0x34>)
  f2:	1a9b      	subs	r3, r3, r2
  f4:	dd03      	ble.n	fe <Reset_Handler+0x12>
  f6:	3b04      	subs	r3, #4
  f8:	58c8      	ldr	r0, [r1, r3]
  fa:	50d0      	str	r0, [r2, r3]
  fc:	dcfb      	bgt.n	f6 <Reset_Handler+0xa>
  fe:	4909      	ldr	r1, [pc, #36]	; (124 <Reset_Handler+0x38>)
 100:	4a09      	ldr	r2, [pc, #36]	; (128 <Reset_Handler+0x3c>)
 102:	2000      	movs	r0, #0
 104:	4291      	cmp	r1, r2
 106:	bfbc      	itt	lt
 108:	f841 0b04 	strlt.w	r0, [r1], #4
 10c:	e7fa      	blt.n	104 <Reset_Handler+0x18>
 10e:	f7ff ffc1 	bl	94 <main>
 112:	f000 f815 	bl	140 <exit>
 116:	018c0000 	orreq	r0, ip, r0
 11a:	00000000 	andeq	r0, r0, r0
 11e:	00680001 	rsbeq	r0, r8, r1
 122:	00680001 	rsbeq	r0, r8, r1
 126:	00840001 	addeq	r0, r4, r1
 12a:	e7fe0001 	ldrb	r0, [lr, r1]!
 12e:	e7fe      	b.n	12e <Reset_Handler+0x42>
 130:	e7fe      	b.n	130 <Reset_Handler+0x44>
 132:	e7fe      	b.n	132 <Reset_Handler+0x46>
 134:	e7fe      	b.n	134 <Reset_Handler+0x48>
 136:	e7fe      	b.n	136 <Reset_Handler+0x4a>
 138:	e7fe      	b.n	138 <Reset_Handler+0x4c>
 13a:	e7fe      	b.n	13a <Reset_Handler+0x4e>
 13c:	e7fe      	b.n	13c <Reset_Handler+0x50>
 13e:	bf00      	nop

00000140 <exit>:
 140:	b508      	push	{r3, lr}
 142:	4b07      	ldr	r3, [pc, #28]	; (160 <exit+0x20>)
 144:	4604      	mov	r4, r0
 146:	b113      	cbz	r3, 14e <exit+0xe>
 148:	2100      	movs	r1, #0
 14a:	f3af 8000 	nop.w
 14e:	4b05      	ldr	r3, [pc, #20]	; (164 <exit+0x24>)
 150:	6818      	ldr	r0, [r3, #0]
 152:	6a83      	ldr	r3, [r0, #40]	; 0x28
 154:	b103      	cbz	r3, 158 <exit+0x18>
 156:	4798      	blx	r3
 158:	4620      	mov	r0, r4
 15a:	f000 f805 	bl	168 <_exit>
 15e:	bf00      	nop
 160:	00000000 	andeq	r0, r0, r0
 164:	00000184 	andeq	r0, r0, r4, lsl #3

00000168 <_exit>:
 168:	e7fe      	b.n	168 <_exit>
 16a:	bf00      	nop

0000016c <_init>:
 16c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 16e:	bf00      	nop
 170:	bcf8      	pop	{r3, r4, r5, r6, r7}
 172:	bc08      	pop	{r3}
 174:	469e      	mov	lr, r3
 176:	4770      	bx	lr

00000178 <_fini>:
 178:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 17a:	bf00      	nop
 17c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 17e:	bc08      	pop	{r3}
 180:	469e      	mov	lr, r3
 182:	4770      	bx	lr

00000184 <_global_impure_ptr>:
 184:	00010000 	andeq	r0, r1, r0

00000188 <__EH_FRAME_BEGIN__>:
 188:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <impure_data>:
	...

00010060 <__frame_dummy_init_array_entry>:
   10060:	00000065 	andeq	r0, r0, r5, rrx

00010064 <__do_global_dtors_aux_fini_array_entry>:
   10064:	00000041 	andeq	r0, r0, r1, asr #32

Disassembly of section .bss:

00010068 <__bss_start__>:
   10068:	00000000 	andeq	r0, r0, r0

0001006c <object.0>:
	...

Disassembly of section .stack_dummy:

00010088 <__HeapBase>:
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002841 	andeq	r2, r0, r1, asr #16
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000001e 	andeq	r0, r0, lr, lsl r0
  10:	4d2d3705 	stcmi	7, cr3, [sp, #-20]!	; 0xffffffec
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	1202094d 	andne	r0, r2, #1261568	; 0x134000
  1c:	15011404 	strne	r1, [r1, #-1028]	; 0xfffffbfc
  20:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  24:	22011a01 	andcs	r1, r1, #4096	; 0x1000
  28:	Address 0x0000000000000028 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__StackTop+0x10bed24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	72412055 	subvc	r2, r1, #85	; 0x55
   c:	6d45206d 	stclvs	0, cr2, [r5, #-436]	; 0xfffffe4c
  10:	64646562 	strbtvs	r6, [r4], #-1378	; 0xfffffa9e
  14:	54206465 	strtpl	r6, [r0], #-1125	; 0xfffffb9b
  18:	636c6f6f 	cmnvs	ip, #444	; 0x1bc
  1c:	6e696168 	powvsez	f6, f1, #0.0
  20:	2e303120 	rsfcssp	f3, f0, f0
  24:	30322d33 	eorscc	r2, r2, r3, lsr sp
  28:	312e3132 			; <UNDEFINED> instruction: 0x312e3132
  2c:	31202930 			; <UNDEFINED> instruction: 0x31202930
  30:	2e332e30 	mrccs	14, 1, r2, cr3, cr0, {1}
  34:	30322031 	eorscc	r2, r2, r1, lsr r0
  38:	38303132 	ldmdacc	r0!, {r1, r4, r5, r8, ip, sp}
  3c:	28203432 	stmdacs	r0!, {r1, r4, r5, sl, ip, sp}
  40:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0xfffffa8e
  44:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000014 	andeq	r0, r0, r4, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00000140 	andeq	r0, r0, r0, asr #2
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000168 	andeq	r0, r0, r8, ror #2
  44:	00000002 	andeq	r0, r0, r2

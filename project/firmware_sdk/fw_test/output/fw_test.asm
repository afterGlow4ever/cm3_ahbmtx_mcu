
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00012000 	andeq	r2, r1, r0
   4:	000007c1 	andeq	r0, r0, r1, asr #15
   8:	0000075d 	andeq	r0, r0, sp, asr r7
   c:	0000075f 	andeq	r0, r0, pc, asr r7
  10:	00000761 	andeq	r0, r0, r1, ror #14
  14:	00000763 	andeq	r0, r0, r3, ror #14
  18:	00000765 	andeq	r0, r0, r5, ror #14
	...
  2c:	00000767 	andeq	r0, r0, r7, ror #14
  30:	00000769 	andeq	r0, r0, r9, ror #14
  34:	00000000 	andeq	r0, r0, r0
  38:	0000076b 	andeq	r0, r0, fp, ror #14
  3c:	0000076d 	andeq	r0, r0, sp, ror #14
  40:	00000771 	andeq	r0, r0, r1, ror r7
  44:	00000815 	andeq	r0, r0, r5, lsl r8
  48:	00000817 	andeq	r0, r0, r7, lsl r8
  4c:	00000819 	andeq	r0, r0, r9, lsl r8
  50:	0000081b 	andeq	r0, r0, fp, lsl r8
  54:	0000078d 	andeq	r0, r0, sp, lsl #15

00000058 <__do_global_dtors_aux>:
  58:	b510      	push	{r4, lr}
  5a:	4c05      	ldr	r4, [pc, #20]	; (70 <__do_global_dtors_aux+0x18>)
  5c:	7823      	ldrb	r3, [r4, #0]
  5e:	b933      	cbnz	r3, 6e <__do_global_dtors_aux+0x16>
  60:	4b04      	ldr	r3, [pc, #16]	; (74 <__do_global_dtors_aux+0x1c>)
  62:	b113      	cbz	r3, 6a <__do_global_dtors_aux+0x12>
  64:	4804      	ldr	r0, [pc, #16]	; (78 <__do_global_dtors_aux+0x20>)
  66:	f3af 8000 	nop.w
  6a:	2301      	movs	r3, #1
  6c:	7023      	strb	r3, [r4, #0]
  6e:	bd10      	pop	{r4, pc}
  70:	00010068 	andeq	r0, r1, r8, rrx
  74:	00000000 	andeq	r0, r0, r0
  78:	000008a4 	andeq	r0, r0, r4, lsr #17

0000007c <frame_dummy>:
  7c:	b508      	push	{r3, lr}
  7e:	4b03      	ldr	r3, [pc, #12]	; (8c <frame_dummy+0x10>)
  80:	b11b      	cbz	r3, 8a <frame_dummy+0xe>
  82:	4903      	ldr	r1, [pc, #12]	; (90 <frame_dummy+0x14>)
  84:	4803      	ldr	r0, [pc, #12]	; (94 <frame_dummy+0x18>)
  86:	f3af 8000 	nop.w
  8a:	bd08      	pop	{r3, pc}
  8c:	00000000 	andeq	r0, r0, r0
  90:	0001006c 	andeq	r0, r1, ip, rrx
  94:	000008a4 	andeq	r0, r0, r4, lsr #17

00000098 <drv_check_rw_data>:
  98:	6001      	str	r1, [r0, #0]
  9a:	6803      	ldr	r3, [r0, #0]
  9c:	4293      	cmp	r3, r2
  9e:	d007      	beq.n	b0 <drv_check_rw_data+0x18>
  a0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  a4:	2001      	movs	r0, #1
  a6:	6018      	str	r0, [r3, #0]
  a8:	685a      	ldr	r2, [r3, #4]
  aa:	4402      	add	r2, r0
  ac:	601a      	str	r2, [r3, #0]
  ae:	4770      	bx	lr
  b0:	2000      	movs	r0, #0
  b2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  b6:	6018      	str	r0, [r3, #0]
  b8:	4770      	bx	lr

000000ba <drv_gpio_set_config>:
  ba:	b510      	push	{r4, lr}
  bc:	6802      	ldr	r2, [r0, #0]
  be:	880c      	ldrh	r4, [r1, #0]
  c0:	0064      	lsls	r4, r4, #1
  c2:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
  c6:	fa03 fc04 	lsl.w	ip, r3, r4
  ca:	f1c4 0e1e 	rsb	lr, r4, #30
  ce:	fa23 fe0e 	lsr.w	lr, r3, lr
  d2:	ea0c 0c0e 	and.w	ip, ip, lr
  d6:	ea22 020c 	bic.w	r2, r2, ip
  da:	f891 c002 	ldrb.w	ip, [r1, #2]
  de:	fa0c f404 	lsl.w	r4, ip, r4
  e2:	4322      	orrs	r2, r4
  e4:	6002      	str	r2, [r0, #0]
  e6:	6844      	ldr	r4, [r0, #4]
  e8:	f8b1 e000 	ldrh.w	lr, [r1]
  ec:	f04f 0c01 	mov.w	ip, #1
  f0:	fa0c f20e 	lsl.w	r2, ip, lr
  f4:	ea24 0402 	bic.w	r4, r4, r2
  f8:	78ca      	ldrb	r2, [r1, #3]
  fa:	fa02 f20e 	lsl.w	r2, r2, lr
  fe:	4314      	orrs	r4, r2
 100:	6044      	str	r4, [r0, #4]
 102:	68c2      	ldr	r2, [r0, #12]
 104:	f8b1 e000 	ldrh.w	lr, [r1]
 108:	fa0c fc0e 	lsl.w	ip, ip, lr
 10c:	ea22 020c 	bic.w	r2, r2, ip
 110:	790c      	ldrb	r4, [r1, #4]
 112:	fa04 f40e 	lsl.w	r4, r4, lr
 116:	4322      	orrs	r2, r4
 118:	60c2      	str	r2, [r0, #12]
 11a:	6982      	ldr	r2, [r0, #24]
 11c:	f8b1 c000 	ldrh.w	ip, [r1]
 120:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
 124:	fa03 f40c 	lsl.w	r4, r3, ip
 128:	f1cc 0e1e 	rsb	lr, ip, #30
 12c:	fa23 fe0e 	lsr.w	lr, r3, lr
 130:	ea04 040e 	and.w	r4, r4, lr
 134:	ea22 0204 	bic.w	r2, r2, r4
 138:	794c      	ldrb	r4, [r1, #5]
 13a:	fa04 fc0c 	lsl.w	ip, r4, ip
 13e:	ea42 020c 	orr.w	r2, r2, ip
 142:	6182      	str	r2, [r0, #24]
 144:	69c2      	ldr	r2, [r0, #28]
 146:	f8b1 c000 	ldrh.w	ip, [r1]
 14a:	ea4f 0c4c 	mov.w	ip, ip, lsl #1
 14e:	fa03 f40c 	lsl.w	r4, r3, ip
 152:	f1cc 0e1e 	rsb	lr, ip, #30
 156:	fa23 f30e 	lsr.w	r3, r3, lr
 15a:	4023      	ands	r3, r4
 15c:	ea22 0303 	bic.w	r3, r2, r3
 160:	798a      	ldrb	r2, [r1, #6]
 162:	fa02 fc0c 	lsl.w	ip, r2, ip
 166:	ea43 030c 	orr.w	r3, r3, ip
 16a:	61c3      	str	r3, [r0, #28]
 16c:	bd10      	pop	{r4, pc}

0000016e <drv_gpio_init>:
 16e:	b538      	push	{r3, r4, r5, lr}
 170:	4604      	mov	r4, r0
 172:	460d      	mov	r5, r1
 174:	f7ff ffa1 	bl	ba <drv_gpio_set_config>
 178:	8829      	ldrh	r1, [r5, #0]
 17a:	6a63      	ldr	r3, [r4, #36]	; 0x24
 17c:	2201      	movs	r2, #1
 17e:	408a      	lsls	r2, r1
 180:	4313      	orrs	r3, r2
 182:	6263      	str	r3, [r4, #36]	; 0x24
 184:	2300      	movs	r3, #0
 186:	6263      	str	r3, [r4, #36]	; 0x24
 188:	bd38      	pop	{r3, r4, r5, pc}

0000018a <gpio0_int_callback>:
 18a:	4770      	bx	lr

0000018c <gpio1_int_callback>:
 18c:	4770      	bx	lr

0000018e <gpio2_int_callback>:
 18e:	4770      	bx	lr

00000190 <gpio4_int_callback>:
 190:	4770      	bx	lr

00000192 <gpio5_int_callback>:
 192:	4770      	bx	lr

00000194 <gpio6_int_callback>:
 194:	4770      	bx	lr

00000196 <gpio7_int_callback>:
 196:	4770      	bx	lr

00000198 <gpio8_int_callback>:
 198:	4770      	bx	lr

0000019a <gpio9_int_callback>:
 19a:	4770      	bx	lr

0000019c <gpio10_int_callback>:
 19c:	4770      	bx	lr

0000019e <gpio11_int_callback>:
 19e:	4770      	bx	lr

000001a0 <gpio12_int_callback>:
 1a0:	4770      	bx	lr

000001a2 <gpio13_int_callback>:
 1a2:	4770      	bx	lr

000001a4 <gpio14_int_callback>:
 1a4:	4770      	bx	lr

000001a6 <gpio15_int_callback>:
 1a6:	4770      	bx	lr

000001a8 <drv_gpio_interrupt_handler>:
 1a8:	b538      	push	{r3, r4, r5, lr}
 1aa:	4604      	mov	r4, r0
 1ac:	6ac5      	ldr	r5, [r0, #44]	; 0x2c
 1ae:	6a03      	ldr	r3, [r0, #32]
 1b0:	b29b      	uxth	r3, r3
 1b2:	401d      	ands	r5, r3
 1b4:	f015 0f01 	tst.w	r5, #1
 1b8:	d131      	bne.n	21e <Stack_Size+0x1e>
 1ba:	f015 0f02 	tst.w	r5, #2
 1be:	d137      	bne.n	230 <Stack_Size+0x30>
 1c0:	f015 0f04 	tst.w	r5, #4
 1c4:	d13e      	bne.n	244 <Stack_Size+0x44>
 1c6:	f015 0f08 	tst.w	r5, #8
 1ca:	d145      	bne.n	258 <Stack_Size+0x58>
 1cc:	f015 0f10 	tst.w	r5, #16
 1d0:	d14c      	bne.n	26c <Stack_Size+0x6c>
 1d2:	f015 0f20 	tst.w	r5, #32
 1d6:	d153      	bne.n	280 <Stack_Size+0x80>
 1d8:	f015 0f40 	tst.w	r5, #64	; 0x40
 1dc:	d15a      	bne.n	294 <Stack_Size+0x94>
 1de:	f015 0f80 	tst.w	r5, #128	; 0x80
 1e2:	d161      	bne.n	2a8 <Stack_Size+0xa8>
 1e4:	f415 7f80 	tst.w	r5, #256	; 0x100
 1e8:	d168      	bne.n	2bc <Stack_Size+0xbc>
 1ea:	f415 7f00 	tst.w	r5, #512	; 0x200
 1ee:	d16f      	bne.n	2d0 <Stack_Size+0xd0>
 1f0:	f415 6f80 	tst.w	r5, #1024	; 0x400
 1f4:	d176      	bne.n	2e4 <Stack_Size+0xe4>
 1f6:	f415 6f00 	tst.w	r5, #2048	; 0x800
 1fa:	d17d      	bne.n	2f8 <Stack_Size+0xf8>
 1fc:	f415 5f80 	tst.w	r5, #4096	; 0x1000
 200:	f040 8084 	bne.w	30c <Stack_Size+0x10c>
 204:	f415 5f00 	tst.w	r5, #8192	; 0x2000
 208:	f040 808a 	bne.w	320 <Stack_Size+0x120>
 20c:	f415 4f80 	tst.w	r5, #16384	; 0x4000
 210:	f040 8090 	bne.w	334 <Stack_Size+0x134>
 214:	f415 4f00 	tst.w	r5, #32768	; 0x8000
 218:	f040 8096 	bne.w	348 <Stack_Size+0x148>
 21c:	bd38      	pop	{r3, r4, r5, pc}
 21e:	f7ff ffb4 	bl	18a <gpio0_int_callback>
 222:	6a63      	ldr	r3, [r4, #36]	; 0x24
 224:	f043 0301 	orr.w	r3, r3, #1
 228:	6263      	str	r3, [r4, #36]	; 0x24
 22a:	2300      	movs	r3, #0
 22c:	6263      	str	r3, [r4, #36]	; 0x24
 22e:	e7c4      	b.n	1ba <drv_gpio_interrupt_handler+0x12>
 230:	4620      	mov	r0, r4
 232:	f7ff ffab 	bl	18c <gpio1_int_callback>
 236:	6a63      	ldr	r3, [r4, #36]	; 0x24
 238:	f043 0302 	orr.w	r3, r3, #2
 23c:	6263      	str	r3, [r4, #36]	; 0x24
 23e:	2300      	movs	r3, #0
 240:	6263      	str	r3, [r4, #36]	; 0x24
 242:	e7bd      	b.n	1c0 <drv_gpio_interrupt_handler+0x18>
 244:	4620      	mov	r0, r4
 246:	f7ff ffa2 	bl	18e <gpio2_int_callback>
 24a:	6a63      	ldr	r3, [r4, #36]	; 0x24
 24c:	f043 0304 	orr.w	r3, r3, #4
 250:	6263      	str	r3, [r4, #36]	; 0x24
 252:	2300      	movs	r3, #0
 254:	6263      	str	r3, [r4, #36]	; 0x24
 256:	e7b6      	b.n	1c6 <drv_gpio_interrupt_handler+0x1e>
 258:	4620      	mov	r0, r4
 25a:	f000 fa79 	bl	750 <gpio3_int_callback>
 25e:	6a63      	ldr	r3, [r4, #36]	; 0x24
 260:	f043 0308 	orr.w	r3, r3, #8
 264:	6263      	str	r3, [r4, #36]	; 0x24
 266:	2300      	movs	r3, #0
 268:	6263      	str	r3, [r4, #36]	; 0x24
 26a:	e7af      	b.n	1cc <drv_gpio_interrupt_handler+0x24>
 26c:	4620      	mov	r0, r4
 26e:	f7ff ff8f 	bl	190 <gpio4_int_callback>
 272:	6a63      	ldr	r3, [r4, #36]	; 0x24
 274:	f043 0310 	orr.w	r3, r3, #16
 278:	6263      	str	r3, [r4, #36]	; 0x24
 27a:	2300      	movs	r3, #0
 27c:	6263      	str	r3, [r4, #36]	; 0x24
 27e:	e7a8      	b.n	1d2 <drv_gpio_interrupt_handler+0x2a>
 280:	4620      	mov	r0, r4
 282:	f7ff ff86 	bl	192 <gpio5_int_callback>
 286:	6a63      	ldr	r3, [r4, #36]	; 0x24
 288:	f043 0320 	orr.w	r3, r3, #32
 28c:	6263      	str	r3, [r4, #36]	; 0x24
 28e:	2300      	movs	r3, #0
 290:	6263      	str	r3, [r4, #36]	; 0x24
 292:	e7a1      	b.n	1d8 <drv_gpio_interrupt_handler+0x30>
 294:	4620      	mov	r0, r4
 296:	f7ff ff7d 	bl	194 <gpio6_int_callback>
 29a:	6a63      	ldr	r3, [r4, #36]	; 0x24
 29c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 2a0:	6263      	str	r3, [r4, #36]	; 0x24
 2a2:	2300      	movs	r3, #0
 2a4:	6263      	str	r3, [r4, #36]	; 0x24
 2a6:	e79a      	b.n	1de <drv_gpio_interrupt_handler+0x36>
 2a8:	4620      	mov	r0, r4
 2aa:	f7ff ff74 	bl	196 <gpio7_int_callback>
 2ae:	6a63      	ldr	r3, [r4, #36]	; 0x24
 2b0:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 2b4:	6263      	str	r3, [r4, #36]	; 0x24
 2b6:	2300      	movs	r3, #0
 2b8:	6263      	str	r3, [r4, #36]	; 0x24
 2ba:	e793      	b.n	1e4 <drv_gpio_interrupt_handler+0x3c>
 2bc:	4620      	mov	r0, r4
 2be:	f7ff ff6b 	bl	198 <gpio8_int_callback>
 2c2:	6a63      	ldr	r3, [r4, #36]	; 0x24
 2c4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 2c8:	6263      	str	r3, [r4, #36]	; 0x24
 2ca:	2300      	movs	r3, #0
 2cc:	6263      	str	r3, [r4, #36]	; 0x24
 2ce:	e78c      	b.n	1ea <drv_gpio_interrupt_handler+0x42>
 2d0:	4620      	mov	r0, r4
 2d2:	f7ff ff62 	bl	19a <gpio9_int_callback>
 2d6:	6a63      	ldr	r3, [r4, #36]	; 0x24
 2d8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 2dc:	6263      	str	r3, [r4, #36]	; 0x24
 2de:	2300      	movs	r3, #0
 2e0:	6263      	str	r3, [r4, #36]	; 0x24
 2e2:	e785      	b.n	1f0 <drv_gpio_interrupt_handler+0x48>
 2e4:	4620      	mov	r0, r4
 2e6:	f7ff ff59 	bl	19c <gpio10_int_callback>
 2ea:	6a63      	ldr	r3, [r4, #36]	; 0x24
 2ec:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 2f0:	6263      	str	r3, [r4, #36]	; 0x24
 2f2:	2300      	movs	r3, #0
 2f4:	6263      	str	r3, [r4, #36]	; 0x24
 2f6:	e77e      	b.n	1f6 <drv_gpio_interrupt_handler+0x4e>
 2f8:	4620      	mov	r0, r4
 2fa:	f7ff ff50 	bl	19e <gpio11_int_callback>
 2fe:	6a63      	ldr	r3, [r4, #36]	; 0x24
 300:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 304:	6263      	str	r3, [r4, #36]	; 0x24
 306:	2300      	movs	r3, #0
 308:	6263      	str	r3, [r4, #36]	; 0x24
 30a:	e777      	b.n	1fc <drv_gpio_interrupt_handler+0x54>
 30c:	4620      	mov	r0, r4
 30e:	f7ff ff47 	bl	1a0 <gpio12_int_callback>
 312:	6a63      	ldr	r3, [r4, #36]	; 0x24
 314:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
 318:	6263      	str	r3, [r4, #36]	; 0x24
 31a:	2300      	movs	r3, #0
 31c:	6263      	str	r3, [r4, #36]	; 0x24
 31e:	e771      	b.n	204 <Stack_Size+0x4>
 320:	4620      	mov	r0, r4
 322:	f7ff ff3e 	bl	1a2 <gpio13_int_callback>
 326:	6a63      	ldr	r3, [r4, #36]	; 0x24
 328:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 32c:	6263      	str	r3, [r4, #36]	; 0x24
 32e:	2300      	movs	r3, #0
 330:	6263      	str	r3, [r4, #36]	; 0x24
 332:	e76b      	b.n	20c <Stack_Size+0xc>
 334:	4620      	mov	r0, r4
 336:	f7ff ff35 	bl	1a4 <gpio14_int_callback>
 33a:	6a63      	ldr	r3, [r4, #36]	; 0x24
 33c:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
 340:	6263      	str	r3, [r4, #36]	; 0x24
 342:	2300      	movs	r3, #0
 344:	6263      	str	r3, [r4, #36]	; 0x24
 346:	e765      	b.n	214 <Stack_Size+0x14>
 348:	4620      	mov	r0, r4
 34a:	f7ff ff2c 	bl	1a6 <gpio15_int_callback>
 34e:	6a63      	ldr	r3, [r4, #36]	; 0x24
 350:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 354:	6263      	str	r3, [r4, #36]	; 0x24
 356:	2300      	movs	r3, #0
 358:	6263      	str	r3, [r4, #36]	; 0x24
 35a:	e75f      	b.n	21c <Stack_Size+0x1c>

0000035c <drv_uart_default_config>:
 35c:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 360:	6043      	str	r3, [r0, #4]
 362:	230f      	movs	r3, #15
 364:	7203      	strb	r3, [r0, #8]
 366:	2300      	movs	r3, #0
 368:	7243      	strb	r3, [r0, #9]
 36a:	7283      	strb	r3, [r0, #10]
 36c:	72c3      	strb	r3, [r0, #11]
 36e:	7303      	strb	r3, [r0, #12]
 370:	7343      	strb	r3, [r0, #13]
 372:	2301      	movs	r3, #1
 374:	7383      	strb	r3, [r0, #14]
 376:	4770      	bx	lr

00000378 <drv_uart_set_config>:
 378:	b508      	push	{r3, lr}
 37a:	6841      	ldr	r1, [r0, #4]
 37c:	7a03      	ldrb	r3, [r0, #8]
 37e:	fb03 f201 	mul.w	r2, r3, r1
 382:	490e      	ldr	r1, [pc, #56]	; (3bc <drv_uart_set_config+0x44>)
 384:	fbb1 f2f2 	udiv	r2, r1, r2
 388:	0419      	lsls	r1, r3, #16
 38a:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 38e:	7a43      	ldrb	r3, [r0, #9]
 390:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 394:	7a83      	ldrb	r3, [r0, #10]
 396:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 39a:	7ac3      	ldrb	r3, [r0, #11]
 39c:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 3a0:	7b03      	ldrb	r3, [r0, #12]
 3a2:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 3a6:	7b42      	ldrb	r2, [r0, #13]
 3a8:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 3ac:	7b82      	ldrb	r2, [r0, #14]
 3ae:	4311      	orrs	r1, r2
 3b0:	6800      	ldr	r0, [r0, #0]
 3b2:	460a      	mov	r2, r1
 3b4:	3008      	adds	r0, #8
 3b6:	f7ff fe6f 	bl	98 <drv_check_rw_data>
 3ba:	bd08      	pop	{r3, pc}
 3bc:	02625a00 	rsbeq	r5, r2, #0, 20

000003c0 <drv_uart_init>:
 3c0:	b538      	push	{r3, r4, r5, lr}
 3c2:	4604      	mov	r4, r0
 3c4:	2500      	movs	r5, #0
 3c6:	7485      	strb	r5, [r0, #18]
 3c8:	74c5      	strb	r5, [r0, #19]
 3ca:	f7ff ffd5 	bl	378 <drv_uart_set_config>
 3ce:	7425      	strb	r5, [r4, #16]
 3d0:	74a5      	strb	r5, [r4, #18]
 3d2:	74e5      	strb	r5, [r4, #19]
 3d4:	6822      	ldr	r2, [r4, #0]
 3d6:	6853      	ldr	r3, [r2, #4]
 3d8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 3dc:	6053      	str	r3, [r2, #4]
 3de:	6822      	ldr	r2, [r4, #0]
 3e0:	6853      	ldr	r3, [r2, #4]
 3e2:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 3e6:	6053      	str	r3, [r2, #4]
 3e8:	6822      	ldr	r2, [r4, #0]
 3ea:	6853      	ldr	r3, [r2, #4]
 3ec:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 3f0:	6053      	str	r3, [r2, #4]
 3f2:	6822      	ldr	r2, [r4, #0]
 3f4:	6853      	ldr	r3, [r2, #4]
 3f6:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 3fa:	6053      	str	r3, [r2, #4]
 3fc:	6822      	ldr	r2, [r4, #0]
 3fe:	6853      	ldr	r3, [r2, #4]
 400:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 404:	6053      	str	r3, [r2, #4]
 406:	6822      	ldr	r2, [r4, #0]
 408:	6853      	ldr	r3, [r2, #4]
 40a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 40e:	6053      	str	r3, [r2, #4]
 410:	6822      	ldr	r2, [r4, #0]
 412:	6853      	ldr	r3, [r2, #4]
 414:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 418:	6053      	str	r3, [r2, #4]
 41a:	6822      	ldr	r2, [r4, #0]
 41c:	6853      	ldr	r3, [r2, #4]
 41e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 422:	6053      	str	r3, [r2, #4]
 424:	6823      	ldr	r3, [r4, #0]
 426:	f240 12ff 	movw	r2, #511	; 0x1ff
 42a:	611a      	str	r2, [r3, #16]
 42c:	6823      	ldr	r3, [r4, #0]
 42e:	611d      	str	r5, [r3, #16]
 430:	6822      	ldr	r2, [r4, #0]
 432:	6853      	ldr	r3, [r2, #4]
 434:	f043 0301 	orr.w	r3, r3, #1
 438:	6053      	str	r3, [r2, #4]
 43a:	6822      	ldr	r2, [r4, #0]
 43c:	6853      	ldr	r3, [r2, #4]
 43e:	f023 0301 	bic.w	r3, r3, #1
 442:	6053      	str	r3, [r2, #4]
 444:	6822      	ldr	r2, [r4, #0]
 446:	6853      	ldr	r3, [r2, #4]
 448:	f043 0302 	orr.w	r3, r3, #2
 44c:	6053      	str	r3, [r2, #4]
 44e:	bd38      	pop	{r3, r4, r5, pc}

00000450 <uart_int_tx_done_callback>:
 450:	4770      	bx	lr

00000452 <uart_int_rx_stop_callback>:
 452:	4770      	bx	lr

00000454 <uart_int_rx_parity_error_callback>:
 454:	4770      	bx	lr

00000456 <uart_int_rx_noise_detect_callback>:
 456:	4770      	bx	lr

00000458 <uart_int_rx_stop_detect_callback>:
 458:	4770      	bx	lr

0000045a <uart_int_tx_fifo_empty_callback>:
 45a:	4770      	bx	lr

0000045c <uart_int_tx_fifo_thres_callback>:
 45c:	4770      	bx	lr

0000045e <uart_int_rx_fifo_noempty_callback>:
 45e:	4770      	bx	lr

00000460 <uart_int_rx_fifo_thres_callback>:
 460:	4770      	bx	lr

00000462 <drv_uart_interrupt_handler>:
 462:	b538      	push	{r3, r4, r5, lr}
 464:	4604      	mov	r4, r0
 466:	6803      	ldr	r3, [r0, #0]
 468:	699d      	ldr	r5, [r3, #24]
 46a:	68db      	ldr	r3, [r3, #12]
 46c:	b29b      	uxth	r3, r3
 46e:	401d      	ands	r5, r3
 470:	f415 7f80 	tst.w	r5, #256	; 0x100
 474:	d144      	bne.n	500 <drv_uart_interrupt_handler+0x9e>
 476:	f015 0f40 	tst.w	r5, #64	; 0x40
 47a:	d00f      	beq.n	49c <drv_uart_interrupt_handler+0x3a>
 47c:	2301      	movs	r3, #1
 47e:	7423      	strb	r3, [r4, #16]
 480:	7aa3      	ldrb	r3, [r4, #10]
 482:	2b01      	cmp	r3, #1
 484:	d147      	bne.n	516 <drv_uart_interrupt_handler+0xb4>
 486:	4620      	mov	r0, r4
 488:	f7ff ffe3 	bl	452 <uart_int_rx_stop_callback>
 48c:	6822      	ldr	r2, [r4, #0]
 48e:	6913      	ldr	r3, [r2, #16]
 490:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 494:	6113      	str	r3, [r2, #16]
 496:	6823      	ldr	r3, [r4, #0]
 498:	2200      	movs	r2, #0
 49a:	611a      	str	r2, [r3, #16]
 49c:	f015 0f80 	tst.w	r5, #128	; 0x80
 4a0:	d00f      	beq.n	4c2 <drv_uart_interrupt_handler+0x60>
 4a2:	2302      	movs	r3, #2
 4a4:	7423      	strb	r3, [r4, #16]
 4a6:	7aa3      	ldrb	r3, [r4, #10]
 4a8:	2b01      	cmp	r3, #1
 4aa:	d166      	bne.n	57a <drv_uart_interrupt_handler+0x118>
 4ac:	4620      	mov	r0, r4
 4ae:	f7ff ffd1 	bl	454 <uart_int_rx_parity_error_callback>
 4b2:	6822      	ldr	r2, [r4, #0]
 4b4:	6913      	ldr	r3, [r2, #16]
 4b6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 4ba:	6113      	str	r3, [r2, #16]
 4bc:	6823      	ldr	r3, [r4, #0]
 4be:	2200      	movs	r2, #0
 4c0:	611a      	str	r2, [r3, #16]
 4c2:	f015 0f20 	tst.w	r5, #32
 4c6:	f040 808a 	bne.w	5de <drv_uart_interrupt_handler+0x17c>
 4ca:	f015 0f10 	tst.w	r5, #16
 4ce:	f040 8092 	bne.w	5f6 <drv_uart_interrupt_handler+0x194>
 4d2:	f015 0f01 	tst.w	r5, #1
 4d6:	f040 809a 	bne.w	60e <drv_uart_interrupt_handler+0x1ac>
 4da:	f015 0f02 	tst.w	r5, #2
 4de:	f040 80a2 	bne.w	626 <drv_uart_interrupt_handler+0x1c4>
 4e2:	f015 0f04 	tst.w	r5, #4
 4e6:	f000 80c1 	beq.w	66c <drv_uart_interrupt_handler+0x20a>
 4ea:	7ce2      	ldrb	r2, [r4, #19]
 4ec:	7e23      	ldrb	r3, [r4, #24]
 4ee:	429a      	cmp	r2, r3
 4f0:	f0c0 80ac 	bcc.w	64c <drv_uart_interrupt_handler+0x1ea>
 4f4:	6822      	ldr	r2, [r4, #0]
 4f6:	68d3      	ldr	r3, [r2, #12]
 4f8:	f023 030c 	bic.w	r3, r3, #12
 4fc:	60d3      	str	r3, [r2, #12]
 4fe:	e0aa      	b.n	656 <drv_uart_interrupt_handler+0x1f4>
 500:	f7ff ffa6 	bl	450 <uart_int_tx_done_callback>
 504:	6822      	ldr	r2, [r4, #0]
 506:	6913      	ldr	r3, [r2, #16]
 508:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 50c:	6113      	str	r3, [r2, #16]
 50e:	6823      	ldr	r3, [r4, #0]
 510:	2200      	movs	r2, #0
 512:	611a      	str	r2, [r3, #16]
 514:	e7af      	b.n	476 <drv_uart_interrupt_handler+0x14>
 516:	6822      	ldr	r2, [r4, #0]
 518:	68d3      	ldr	r3, [r2, #12]
 51a:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 51e:	60d3      	str	r3, [r2, #12]
 520:	2300      	movs	r3, #0
 522:	7423      	strb	r3, [r4, #16]
 524:	74a3      	strb	r3, [r4, #18]
 526:	74e3      	strb	r3, [r4, #19]
 528:	6822      	ldr	r2, [r4, #0]
 52a:	6853      	ldr	r3, [r2, #4]
 52c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 530:	6053      	str	r3, [r2, #4]
 532:	6822      	ldr	r2, [r4, #0]
 534:	6853      	ldr	r3, [r2, #4]
 536:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 53a:	6053      	str	r3, [r2, #4]
 53c:	6822      	ldr	r2, [r4, #0]
 53e:	6853      	ldr	r3, [r2, #4]
 540:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 544:	6053      	str	r3, [r2, #4]
 546:	6822      	ldr	r2, [r4, #0]
 548:	6853      	ldr	r3, [r2, #4]
 54a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 54e:	6053      	str	r3, [r2, #4]
 550:	6822      	ldr	r2, [r4, #0]
 552:	6853      	ldr	r3, [r2, #4]
 554:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 558:	6053      	str	r3, [r2, #4]
 55a:	6822      	ldr	r2, [r4, #0]
 55c:	6853      	ldr	r3, [r2, #4]
 55e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 562:	6053      	str	r3, [r2, #4]
 564:	6822      	ldr	r2, [r4, #0]
 566:	6853      	ldr	r3, [r2, #4]
 568:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 56c:	6053      	str	r3, [r2, #4]
 56e:	6822      	ldr	r2, [r4, #0]
 570:	6853      	ldr	r3, [r2, #4]
 572:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 576:	6053      	str	r3, [r2, #4]
 578:	e785      	b.n	486 <drv_uart_interrupt_handler+0x24>
 57a:	6822      	ldr	r2, [r4, #0]
 57c:	68d3      	ldr	r3, [r2, #12]
 57e:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 582:	60d3      	str	r3, [r2, #12]
 584:	2300      	movs	r3, #0
 586:	7423      	strb	r3, [r4, #16]
 588:	74a3      	strb	r3, [r4, #18]
 58a:	74e3      	strb	r3, [r4, #19]
 58c:	6822      	ldr	r2, [r4, #0]
 58e:	6853      	ldr	r3, [r2, #4]
 590:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 594:	6053      	str	r3, [r2, #4]
 596:	6822      	ldr	r2, [r4, #0]
 598:	6853      	ldr	r3, [r2, #4]
 59a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 59e:	6053      	str	r3, [r2, #4]
 5a0:	6822      	ldr	r2, [r4, #0]
 5a2:	6853      	ldr	r3, [r2, #4]
 5a4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 5a8:	6053      	str	r3, [r2, #4]
 5aa:	6822      	ldr	r2, [r4, #0]
 5ac:	6853      	ldr	r3, [r2, #4]
 5ae:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 5b2:	6053      	str	r3, [r2, #4]
 5b4:	6822      	ldr	r2, [r4, #0]
 5b6:	6853      	ldr	r3, [r2, #4]
 5b8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 5bc:	6053      	str	r3, [r2, #4]
 5be:	6822      	ldr	r2, [r4, #0]
 5c0:	6853      	ldr	r3, [r2, #4]
 5c2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 5c6:	6053      	str	r3, [r2, #4]
 5c8:	6822      	ldr	r2, [r4, #0]
 5ca:	6853      	ldr	r3, [r2, #4]
 5cc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 5d0:	6053      	str	r3, [r2, #4]
 5d2:	6822      	ldr	r2, [r4, #0]
 5d4:	6853      	ldr	r3, [r2, #4]
 5d6:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 5da:	6053      	str	r3, [r2, #4]
 5dc:	e766      	b.n	4ac <drv_uart_interrupt_handler+0x4a>
 5de:	4620      	mov	r0, r4
 5e0:	f7ff ff39 	bl	456 <uart_int_rx_noise_detect_callback>
 5e4:	6822      	ldr	r2, [r4, #0]
 5e6:	6913      	ldr	r3, [r2, #16]
 5e8:	f043 0320 	orr.w	r3, r3, #32
 5ec:	6113      	str	r3, [r2, #16]
 5ee:	6823      	ldr	r3, [r4, #0]
 5f0:	2200      	movs	r2, #0
 5f2:	611a      	str	r2, [r3, #16]
 5f4:	e769      	b.n	4ca <drv_uart_interrupt_handler+0x68>
 5f6:	4620      	mov	r0, r4
 5f8:	f7ff ff2e 	bl	458 <uart_int_rx_stop_detect_callback>
 5fc:	6822      	ldr	r2, [r4, #0]
 5fe:	6913      	ldr	r3, [r2, #16]
 600:	f043 0310 	orr.w	r3, r3, #16
 604:	6113      	str	r3, [r2, #16]
 606:	6823      	ldr	r3, [r4, #0]
 608:	2200      	movs	r2, #0
 60a:	611a      	str	r2, [r3, #16]
 60c:	e761      	b.n	4d2 <drv_uart_interrupt_handler+0x70>
 60e:	4620      	mov	r0, r4
 610:	f7ff ff24 	bl	45c <uart_int_tx_fifo_thres_callback>
 614:	6822      	ldr	r2, [r4, #0]
 616:	6913      	ldr	r3, [r2, #16]
 618:	f043 0301 	orr.w	r3, r3, #1
 61c:	6113      	str	r3, [r2, #16]
 61e:	6823      	ldr	r3, [r4, #0]
 620:	2200      	movs	r2, #0
 622:	611a      	str	r2, [r3, #16]
 624:	e759      	b.n	4da <drv_uart_interrupt_handler+0x78>
 626:	4620      	mov	r0, r4
 628:	f7ff ff17 	bl	45a <uart_int_tx_fifo_empty_callback>
 62c:	6822      	ldr	r2, [r4, #0]
 62e:	6913      	ldr	r3, [r2, #16]
 630:	f043 0302 	orr.w	r3, r3, #2
 634:	6113      	str	r3, [r2, #16]
 636:	6823      	ldr	r3, [r4, #0]
 638:	2200      	movs	r2, #0
 63a:	611a      	str	r2, [r3, #16]
 63c:	e751      	b.n	4e2 <drv_uart_interrupt_handler+0x80>
 63e:	69d9      	ldr	r1, [r3, #28]
 640:	6962      	ldr	r2, [r4, #20]
 642:	7ce3      	ldrb	r3, [r4, #19]
 644:	1c58      	adds	r0, r3, #1
 646:	74e0      	strb	r0, [r4, #19]
 648:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 64c:	6823      	ldr	r3, [r4, #0]
 64e:	695a      	ldr	r2, [r3, #20]
 650:	f012 0f1f 	tst.w	r2, #31
 654:	d1f3      	bne.n	63e <drv_uart_interrupt_handler+0x1dc>
 656:	4620      	mov	r0, r4
 658:	f7ff ff02 	bl	460 <uart_int_rx_fifo_thres_callback>
 65c:	6822      	ldr	r2, [r4, #0]
 65e:	6913      	ldr	r3, [r2, #16]
 660:	f043 0304 	orr.w	r3, r3, #4
 664:	6113      	str	r3, [r2, #16]
 666:	6823      	ldr	r3, [r4, #0]
 668:	2200      	movs	r2, #0
 66a:	611a      	str	r2, [r3, #16]
 66c:	f015 0f08 	tst.w	r5, #8
 670:	d020      	beq.n	6b4 <drv_uart_interrupt_handler+0x252>
 672:	7ce2      	ldrb	r2, [r4, #19]
 674:	7e23      	ldrb	r3, [r4, #24]
 676:	429a      	cmp	r2, r3
 678:	d30c      	bcc.n	694 <drv_uart_interrupt_handler+0x232>
 67a:	6822      	ldr	r2, [r4, #0]
 67c:	68d3      	ldr	r3, [r2, #12]
 67e:	f023 030c 	bic.w	r3, r3, #12
 682:	60d3      	str	r3, [r2, #12]
 684:	e00b      	b.n	69e <drv_uart_interrupt_handler+0x23c>
 686:	69d9      	ldr	r1, [r3, #28]
 688:	6962      	ldr	r2, [r4, #20]
 68a:	7ce3      	ldrb	r3, [r4, #19]
 68c:	1c58      	adds	r0, r3, #1
 68e:	74e0      	strb	r0, [r4, #19]
 690:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 694:	6823      	ldr	r3, [r4, #0]
 696:	695a      	ldr	r2, [r3, #20]
 698:	f012 0f1f 	tst.w	r2, #31
 69c:	d1f3      	bne.n	686 <drv_uart_interrupt_handler+0x224>
 69e:	4620      	mov	r0, r4
 6a0:	f7ff fedd 	bl	45e <uart_int_rx_fifo_noempty_callback>
 6a4:	6822      	ldr	r2, [r4, #0]
 6a6:	6913      	ldr	r3, [r2, #16]
 6a8:	f043 0308 	orr.w	r3, r3, #8
 6ac:	6113      	str	r3, [r2, #16]
 6ae:	6823      	ldr	r3, [r4, #0]
 6b0:	2200      	movs	r2, #0
 6b2:	611a      	str	r2, [r3, #16]
 6b4:	bd38      	pop	{r3, r4, r5, pc}
	...

000006b8 <gpioa2_init>:
 6b8:	b508      	push	{r3, lr}
 6ba:	4904      	ldr	r1, [pc, #16]	; (6cc <gpioa2_init+0x14>)
 6bc:	2302      	movs	r3, #2
 6be:	800b      	strh	r3, [r1, #0]
 6c0:	2301      	movs	r3, #1
 6c2:	708b      	strb	r3, [r1, #2]
 6c4:	4802      	ldr	r0, [pc, #8]	; (6d0 <gpioa2_init+0x18>)
 6c6:	f7ff fd52 	bl	16e <drv_gpio_init>
 6ca:	bd08      	pop	{r3, pc}
 6cc:	00010084 	andeq	r0, r1, r4, lsl #1
 6d0:	4000a000 	andmi	sl, r0, r0

000006d4 <gpioa3_int_init>:
 6d4:	b510      	push	{r4, lr}
 6d6:	4907      	ldr	r1, [pc, #28]	; (6f4 <gpioa3_int_init+0x20>)
 6d8:	2303      	movs	r3, #3
 6da:	800b      	strh	r3, [r1, #0]
 6dc:	2300      	movs	r3, #0
 6de:	708b      	strb	r3, [r1, #2]
 6e0:	718b      	strb	r3, [r1, #6]
 6e2:	4c05      	ldr	r4, [pc, #20]	; (6f8 <gpioa3_int_init+0x24>)
 6e4:	4620      	mov	r0, r4
 6e6:	f7ff fd42 	bl	16e <drv_gpio_init>
 6ea:	6a23      	ldr	r3, [r4, #32]
 6ec:	f043 0308 	orr.w	r3, r3, #8
 6f0:	6223      	str	r3, [r4, #32]
 6f2:	bd10      	pop	{r4, pc}
 6f4:	0001008c 	andeq	r0, r1, ip, lsl #1
 6f8:	4000a000 	andmi	sl, r0, r0

000006fc <gpioa2_out_gpioa3_in_it_test>:
 6fc:	b508      	push	{r3, lr}
 6fe:	f7ff ffdb 	bl	6b8 <gpioa2_init>
 702:	f7ff ffe7 	bl	6d4 <gpioa3_int_init>
 706:	4a0e      	ldr	r2, [pc, #56]	; (740 <gpioa2_out_gpioa3_in_it_test+0x44>)
 708:	2300      	movs	r3, #0
 70a:	f882 3305 	strb.w	r3, [r2, #773]	; 0x305
 70e:	2120      	movs	r1, #32
 710:	6011      	str	r1, [r2, #0]
 712:	4a0c      	ldr	r2, [pc, #48]	; (744 <gpioa2_out_gpioa3_in_it_test+0x48>)
 714:	7013      	strb	r3, [r2, #0]
 716:	4a0c      	ldr	r2, [pc, #48]	; (748 <gpioa2_out_gpioa3_in_it_test+0x4c>)
 718:	6913      	ldr	r3, [r2, #16]
 71a:	f043 0304 	orr.w	r3, r3, #4
 71e:	6113      	str	r3, [r2, #16]
 720:	4b08      	ldr	r3, [pc, #32]	; (744 <gpioa2_out_gpioa3_in_it_test+0x48>)
 722:	781b      	ldrb	r3, [r3, #0]
 724:	2b00      	cmp	r3, #0
 726:	d0fb      	beq.n	720 <gpioa2_out_gpioa3_in_it_test+0x24>
 728:	4808      	ldr	r0, [pc, #32]	; (74c <gpioa2_out_gpioa3_in_it_test+0x50>)
 72a:	f000 f889 	bl	840 <test_printf_s>
 72e:	4b04      	ldr	r3, [pc, #16]	; (740 <gpioa2_out_gpioa3_in_it_test+0x44>)
 730:	2220      	movs	r2, #32
 732:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 736:	f3bf 8f4f 	dsb	sy
 73a:	f3bf 8f6f 	isb	sy
 73e:	bd08      	pop	{r3, pc}
 740:	e000e100 	and	lr, r0, r0, lsl #2
 744:	00010094 	muleq	r1, r4, r0
 748:	4000a000 	andmi	sl, r0, r0
 74c:	00000888 	andeq	r0, r0, r8, lsl #17

00000750 <gpio3_int_callback>:
 750:	4b01      	ldr	r3, [pc, #4]	; (758 <gpio3_int_callback+0x8>)
 752:	2201      	movs	r2, #1
 754:	701a      	strb	r2, [r3, #0]
 756:	4770      	bx	lr
 758:	00010094 	muleq	r1, r4, r0

0000075c <NMI_Handler>:
 75c:	4770      	bx	lr

0000075e <HardFault_Handler>:
 75e:	e7fe      	b.n	75e <HardFault_Handler>

00000760 <MemManage_Handler>:
 760:	e7fe      	b.n	760 <MemManage_Handler>

00000762 <BusFault_Handler>:
 762:	e7fe      	b.n	762 <BusFault_Handler>

00000764 <UsageFault_Handler>:
 764:	e7fe      	b.n	764 <UsageFault_Handler>

00000766 <SVC_Handler>:
 766:	4770      	bx	lr

00000768 <DebugMon_Handler>:
 768:	4770      	bx	lr

0000076a <PendSV_Handler>:
 76a:	4770      	bx	lr

0000076c <SysTick_Handler>:
 76c:	4770      	bx	lr
	...

00000770 <Uart0_Handler>:
 770:	b508      	push	{r3, lr}
 772:	4b04      	ldr	r3, [pc, #16]	; (784 <Uart0_Handler+0x14>)
 774:	2201      	movs	r2, #1
 776:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 77a:	4803      	ldr	r0, [pc, #12]	; (788 <Uart0_Handler+0x18>)
 77c:	f7ff fe71 	bl	462 <drv_uart_interrupt_handler>
 780:	bd08      	pop	{r3, pc}
 782:	bf00      	nop
 784:	e000e100 	and	lr, r0, r0, lsl #2
 788:	00010098 	muleq	r1, r8, r0

0000078c <Gpioa_Handler>:
 78c:	b508      	push	{r3, lr}
 78e:	4b04      	ldr	r3, [pc, #16]	; (7a0 <Gpioa_Handler+0x14>)
 790:	2220      	movs	r2, #32
 792:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 796:	4803      	ldr	r0, [pc, #12]	; (7a4 <Gpioa_Handler+0x18>)
 798:	f7ff fd06 	bl	1a8 <drv_gpio_interrupt_handler>
 79c:	bd08      	pop	{r3, pc}
 79e:	bf00      	nop
 7a0:	e000e100 	and	lr, r0, r0, lsl #2
 7a4:	4000a000 	andmi	sl, r0, r0

000007a8 <main>:
 7a8:	b508      	push	{r3, lr}
 7aa:	f000 f839 	bl	820 <uart0_init>
 7ae:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 7b2:	23bd      	movs	r3, #189	; 0xbd
 7b4:	60a3      	str	r3, [r4, #8]
 7b6:	f7ff ffa1 	bl	6fc <gpioa2_out_gpioa3_in_it_test>
 7ba:	23ed      	movs	r3, #237	; 0xed
 7bc:	60a3      	str	r3, [r4, #8]
 7be:	e7fe      	b.n	7be <main+0x16>

000007c0 <Reset_Handler>:
 7c0:	490a      	ldr	r1, [pc, #40]	; (7ec <Reset_Handler+0x2c>)
 7c2:	4a0b      	ldr	r2, [pc, #44]	; (7f0 <Reset_Handler+0x30>)
 7c4:	4b0b      	ldr	r3, [pc, #44]	; (7f4 <Reset_Handler+0x34>)
 7c6:	1a9b      	subs	r3, r3, r2
 7c8:	dd03      	ble.n	7d2 <Reset_Handler+0x12>
 7ca:	3b04      	subs	r3, #4
 7cc:	58c8      	ldr	r0, [r1, r3]
 7ce:	50d0      	str	r0, [r2, r3]
 7d0:	dcfb      	bgt.n	7ca <Reset_Handler+0xa>
 7d2:	4909      	ldr	r1, [pc, #36]	; (7f8 <Reset_Handler+0x38>)
 7d4:	4a09      	ldr	r2, [pc, #36]	; (7fc <Reset_Handler+0x3c>)
 7d6:	2000      	movs	r0, #0
 7d8:	4291      	cmp	r1, r2
 7da:	bfbc      	itt	lt
 7dc:	f841 0b04 	strlt.w	r0, [r1], #4
 7e0:	e7fa      	blt.n	7d8 <Reset_Handler+0x18>
 7e2:	f7ff ffe1 	bl	7a8 <main>
 7e6:	f000 f82d 	bl	844 <exit>
 7ea:	08a80000 	stmiaeq	r8!, {}	; <UNPREDICTABLE>
 7ee:	00000000 	andeq	r0, r0, r0
 7f2:	00680001 	rsbeq	r0, r8, r1
 7f6:	00680001 	rsbeq	r0, r8, r1
 7fa:	00b40001 	adcseq	r0, r4, r1
 7fe:	e7fe0001 	ldrb	r0, [lr, r1]!
 802:	e7fe      	b.n	802 <Reset_Handler+0x42>
 804:	e7fe      	b.n	804 <Reset_Handler+0x44>
 806:	e7fe      	b.n	806 <Reset_Handler+0x46>
 808:	e7fe      	b.n	808 <Reset_Handler+0x48>
 80a:	e7fe      	b.n	80a <Reset_Handler+0x4a>
 80c:	e7fe      	b.n	80c <Reset_Handler+0x4c>
 80e:	e7fe      	b.n	80e <Reset_Handler+0x4e>
 810:	e7fe      	b.n	810 <Reset_Handler+0x50>
 812:	e7fe      	b.n	812 <Reset_Handler+0x52>

00000814 <Uart1_Handler>:
 814:	e7fe      	b.n	814 <Uart1_Handler>

00000816 <Resv0_Handler>:
 816:	e7fe      	b.n	816 <Resv0_Handler>

00000818 <Resv1_Handler>:
 818:	e7fe      	b.n	818 <Resv1_Handler>

0000081a <Resv2_Handler>:
 81a:	e7fe      	b.n	81a <Resv2_Handler>
 81c:	e7fe      	b.n	81c <Resv2_Handler+0x2>
 81e:	bf00      	nop

00000820 <uart0_init>:
 820:	b510      	push	{r4, lr}
 822:	4c05      	ldr	r4, [pc, #20]	; (838 <uart0_init+0x18>)
 824:	4b05      	ldr	r3, [pc, #20]	; (83c <uart0_init+0x1c>)
 826:	6023      	str	r3, [r4, #0]
 828:	4620      	mov	r0, r4
 82a:	f7ff fd97 	bl	35c <drv_uart_default_config>
 82e:	4620      	mov	r0, r4
 830:	f7ff fdc6 	bl	3c0 <drv_uart_init>
 834:	bd10      	pop	{r4, pc}
 836:	bf00      	nop
 838:	00010098 	muleq	r1, r8, r0
 83c:	40001000 	andmi	r1, r0, r0

00000840 <test_printf_s>:
 840:	4770      	bx	lr
	...

00000844 <exit>:
 844:	b508      	push	{r3, lr}
 846:	4b07      	ldr	r3, [pc, #28]	; (864 <exit+0x20>)
 848:	4604      	mov	r4, r0
 84a:	b113      	cbz	r3, 852 <exit+0xe>
 84c:	2100      	movs	r1, #0
 84e:	f3af 8000 	nop.w
 852:	4b05      	ldr	r3, [pc, #20]	; (868 <exit+0x24>)
 854:	6818      	ldr	r0, [r3, #0]
 856:	6a83      	ldr	r3, [r0, #40]	; 0x28
 858:	b103      	cbz	r3, 85c <exit+0x18>
 85a:	4798      	blx	r3
 85c:	4620      	mov	r0, r4
 85e:	f000 f805 	bl	86c <_exit>
 862:	bf00      	nop
 864:	00000000 	andeq	r0, r0, r0
 868:	000008a0 	andeq	r0, r0, r0, lsr #17

0000086c <_exit>:
 86c:	e7fe      	b.n	86c <_exit>
 86e:	bf00      	nop

00000870 <_init>:
 870:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 872:	bf00      	nop
 874:	bcf8      	pop	{r3, r4, r5, r6, r7}
 876:	bc08      	pop	{r3}
 878:	469e      	mov	lr, r3
 87a:	4770      	bx	lr

0000087c <_fini>:
 87c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 87e:	bf00      	nop
 880:	bcf8      	pop	{r3, r4, r5, r6, r7}
 882:	bc08      	pop	{r3}
 884:	469e      	mov	lr, r3
 886:	4770      	bx	lr
 888:	6f697067 	svcvs	0x00697067
 88c:	69203361 	stmdbvs	r0!, {r0, r5, r6, r8, r9, ip, sp}
 890:	7475706e 	ldrbtvc	r7, [r5], #-110	; 0xffffff92
 894:	67696820 	strbvs	r6, [r9, -r0, lsr #16]!
 898:	0a0d2e68 	beq	34c240 <__StackTop+0x33a240>
 89c:	00000000 	andeq	r0, r0, r0

000008a0 <_global_impure_ptr>:
 8a0:	00010000 	andeq	r0, r1, r0

000008a4 <__EH_FRAME_BEGIN__>:
 8a4:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <impure_data>:
	...

00010060 <__frame_dummy_init_array_entry>:
   10060:	0000007d 	andeq	r0, r0, sp, ror r0

00010064 <__do_global_dtors_aux_fini_array_entry>:
   10064:	00000059 	andeq	r0, r0, r9, asr r0

Disassembly of section .bss:

00010068 <__bss_start__>:
   10068:	00000000 	andeq	r0, r0, r0

0001006c <object.0>:
	...

00010084 <gpioa2>:
	...

0001008c <gpioa3>:
	...

00010094 <gpio_int_flag>:
   10094:	00000000 	andeq	r0, r0, r0

00010098 <huart0>:
	...

Disassembly of section .stack_dummy:

000100b8 <__HeapBase>:
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
  18:	00000844 	andeq	r0, r0, r4, asr #16
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	0000086c 	andeq	r0, r0, ip, ror #16
  44:	00000002 	andeq	r0, r0, r2


fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00022000 	andeq	r2, r2, r0
   4:	00000c7d 	andeq	r0, r0, sp, ror ip
   8:	00000bb9 			; <UNDEFINED> instruction: 0x00000bb9
   c:	00000bbb 			; <UNDEFINED> instruction: 0x00000bbb
  10:	00000bbd 			; <UNDEFINED> instruction: 0x00000bbd
  14:	00000bbf 			; <UNDEFINED> instruction: 0x00000bbf
  18:	00000bc1 	andeq	r0, r0, r1, asr #23
	...
  2c:	00000bc3 	andeq	r0, r0, r3, asr #23
  30:	00000bc5 	andeq	r0, r0, r5, asr #23
  34:	00000000 	andeq	r0, r0, r0
  38:	00000bc7 	andeq	r0, r0, r7, asr #23
  3c:	00000bc9 	andeq	r0, r0, r9, asr #23
  40:	00000bcd 	andeq	r0, r0, sp, asr #23
  44:	00000cd1 	ldrdeq	r0, [r0], -r1
  48:	00000cd3 	ldrdeq	r0, [r0], -r3
  4c:	00000cd5 	ldrdeq	r0, [r0], -r5
  50:	00000c3d 	andeq	r0, r0, sp, lsr ip
  54:	00000cd9 	ldrdeq	r0, [r0], -r9
  58:	00000cdb 	ldrdeq	r0, [r0], -fp
  5c:	00000cdd 	ldrdeq	r0, [r0], -sp
  60:	00000cdf 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
  64:	00000ce1 	andeq	r0, r0, r1, ror #25
  68:	00000ce3 	andeq	r0, r0, r3, ror #25
  6c:	00000ce5 	andeq	r0, r0, r5, ror #25
  70:	00000be9 	andeq	r0, r0, r9, ror #23
  74:	00000c05 	andeq	r0, r0, r5, lsl #24
  78:	00000c21 	andeq	r0, r0, r1, lsr #24
  7c:	00000ced 	andeq	r0, r0, sp, ror #25

00000080 <__do_global_dtors_aux>:
  80:	b510      	push	{r4, lr}
  82:	4c05      	ldr	r4, [pc, #20]	; (98 <__do_global_dtors_aux+0x18>)
  84:	7823      	ldrb	r3, [r4, #0]
  86:	b933      	cbnz	r3, 96 <__do_global_dtors_aux+0x16>
  88:	4b04      	ldr	r3, [pc, #16]	; (9c <__do_global_dtors_aux+0x1c>)
  8a:	b113      	cbz	r3, 92 <__do_global_dtors_aux+0x12>
  8c:	4804      	ldr	r0, [pc, #16]	; (a0 <__do_global_dtors_aux+0x20>)
  8e:	f3af 8000 	nop.w
  92:	2301      	movs	r3, #1
  94:	7023      	strb	r3, [r4, #0]
  96:	bd10      	pop	{r4, pc}
  98:	00020068 	andeq	r0, r2, r8, rrx
  9c:	00000000 	andeq	r0, r0, r0
  a0:	00000dc8 	andeq	r0, r0, r8, asr #27

000000a4 <frame_dummy>:
  a4:	b508      	push	{r3, lr}
  a6:	4b03      	ldr	r3, [pc, #12]	; (b4 <frame_dummy+0x10>)
  a8:	b11b      	cbz	r3, b2 <frame_dummy+0xe>
  aa:	4903      	ldr	r1, [pc, #12]	; (b8 <frame_dummy+0x14>)
  ac:	4803      	ldr	r0, [pc, #12]	; (bc <frame_dummy+0x18>)
  ae:	f3af 8000 	nop.w
  b2:	bd08      	pop	{r3, pc}
  b4:	00000000 	andeq	r0, r0, r0
  b8:	0002006c 	andeq	r0, r2, ip, rrx
  bc:	00000dc8 	andeq	r0, r0, r8, asr #27

000000c0 <drv_check_rw_data>:
  c0:	6001      	str	r1, [r0, #0]
  c2:	6803      	ldr	r3, [r0, #0]
  c4:	4293      	cmp	r3, r2
  c6:	d007      	beq.n	d8 <drv_check_rw_data+0x18>
  c8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  cc:	2001      	movs	r0, #1
  ce:	6018      	str	r0, [r3, #0]
  d0:	685a      	ldr	r2, [r3, #4]
  d2:	4402      	add	r2, r0
  d4:	601a      	str	r2, [r3, #0]
  d6:	4770      	bx	lr
  d8:	2000      	movs	r0, #0
  da:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  de:	6018      	str	r0, [r3, #0]
  e0:	4770      	bx	lr

000000e2 <eth_sma_int_rx_turn_nack_callback>:
  e2:	4770      	bx	lr

000000e4 <eth_sma_int_master_frame_done_callback>:
  e4:	4770      	bx	lr

000000e6 <eth_sma_int_tx_fifo_empty_callback>:
  e6:	4770      	bx	lr

000000e8 <eth_sma_int_tx_fifo_thres_callback>:
  e8:	4770      	bx	lr

000000ea <eth_sma_int_rx_fifo_noempty_callback>:
  ea:	4770      	bx	lr

000000ec <eth_sma_int_rx_fifo_thres_callback>:
  ec:	4770      	bx	lr

000000ee <drv_eth_sma_interrupt_handler>:
  ee:	b538      	push	{r3, r4, r5, lr}
  f0:	4604      	mov	r4, r0
  f2:	6803      	ldr	r3, [r0, #0]
  f4:	699d      	ldr	r5, [r3, #24]
  f6:	68db      	ldr	r3, [r3, #12]
  f8:	b2db      	uxtb	r3, r3
  fa:	401d      	ands	r5, r3
  fc:	f015 0f20 	tst.w	r5, #32
 100:	d10f      	bne.n	122 <drv_eth_sma_interrupt_handler+0x34>
 102:	f015 0f10 	tst.w	r5, #16
 106:	d119      	bne.n	13c <drv_eth_sma_interrupt_handler+0x4e>
 108:	f015 0f01 	tst.w	r5, #1
 10c:	d122      	bne.n	154 <drv_eth_sma_interrupt_handler+0x66>
 10e:	f015 0f02 	tst.w	r5, #2
 112:	d12b      	bne.n	16c <drv_eth_sma_interrupt_handler+0x7e>
 114:	f015 0f04 	tst.w	r5, #4
 118:	d134      	bne.n	184 <drv_eth_sma_interrupt_handler+0x96>
 11a:	f015 0f08 	tst.w	r5, #8
 11e:	d13d      	bne.n	19c <drv_eth_sma_interrupt_handler+0xae>
 120:	bd38      	pop	{r3, r4, r5, pc}
 122:	2302      	movs	r3, #2
 124:	71c3      	strb	r3, [r0, #7]
 126:	f7ff ffdc 	bl	e2 <eth_sma_int_rx_turn_nack_callback>
 12a:	6822      	ldr	r2, [r4, #0]
 12c:	6913      	ldr	r3, [r2, #16]
 12e:	f043 0320 	orr.w	r3, r3, #32
 132:	6113      	str	r3, [r2, #16]
 134:	6823      	ldr	r3, [r4, #0]
 136:	2200      	movs	r2, #0
 138:	611a      	str	r2, [r3, #16]
 13a:	e7e2      	b.n	102 <drv_eth_sma_interrupt_handler+0x14>
 13c:	4620      	mov	r0, r4
 13e:	f7ff ffd1 	bl	e4 <eth_sma_int_master_frame_done_callback>
 142:	6822      	ldr	r2, [r4, #0]
 144:	6913      	ldr	r3, [r2, #16]
 146:	f043 0310 	orr.w	r3, r3, #16
 14a:	6113      	str	r3, [r2, #16]
 14c:	6823      	ldr	r3, [r4, #0]
 14e:	2200      	movs	r2, #0
 150:	611a      	str	r2, [r3, #16]
 152:	e7d9      	b.n	108 <drv_eth_sma_interrupt_handler+0x1a>
 154:	4620      	mov	r0, r4
 156:	f7ff ffc7 	bl	e8 <eth_sma_int_tx_fifo_thres_callback>
 15a:	6822      	ldr	r2, [r4, #0]
 15c:	6913      	ldr	r3, [r2, #16]
 15e:	f043 0301 	orr.w	r3, r3, #1
 162:	6113      	str	r3, [r2, #16]
 164:	6823      	ldr	r3, [r4, #0]
 166:	2200      	movs	r2, #0
 168:	611a      	str	r2, [r3, #16]
 16a:	e7d0      	b.n	10e <drv_eth_sma_interrupt_handler+0x20>
 16c:	4620      	mov	r0, r4
 16e:	f7ff ffba 	bl	e6 <eth_sma_int_tx_fifo_empty_callback>
 172:	6822      	ldr	r2, [r4, #0]
 174:	6913      	ldr	r3, [r2, #16]
 176:	f043 0302 	orr.w	r3, r3, #2
 17a:	6113      	str	r3, [r2, #16]
 17c:	6823      	ldr	r3, [r4, #0]
 17e:	2200      	movs	r2, #0
 180:	611a      	str	r2, [r3, #16]
 182:	e7c7      	b.n	114 <drv_eth_sma_interrupt_handler+0x26>
 184:	4620      	mov	r0, r4
 186:	f7ff ffb1 	bl	ec <eth_sma_int_rx_fifo_thres_callback>
 18a:	6822      	ldr	r2, [r4, #0]
 18c:	6913      	ldr	r3, [r2, #16]
 18e:	f043 0304 	orr.w	r3, r3, #4
 192:	6113      	str	r3, [r2, #16]
 194:	6823      	ldr	r3, [r4, #0]
 196:	2200      	movs	r2, #0
 198:	611a      	str	r2, [r3, #16]
 19a:	e7be      	b.n	11a <drv_eth_sma_interrupt_handler+0x2c>
 19c:	4620      	mov	r0, r4
 19e:	f7ff ffa4 	bl	ea <eth_sma_int_rx_fifo_noempty_callback>
 1a2:	6822      	ldr	r2, [r4, #0]
 1a4:	6913      	ldr	r3, [r2, #16]
 1a6:	f043 0308 	orr.w	r3, r3, #8
 1aa:	6113      	str	r3, [r2, #16]
 1ac:	6823      	ldr	r3, [r4, #0]
 1ae:	2200      	movs	r2, #0
 1b0:	611a      	str	r2, [r3, #16]
 1b2:	e7b5      	b.n	120 <drv_eth_sma_interrupt_handler+0x32>

000001b4 <drv_eth_mac_dma_default_config>:
 1b4:	2308      	movs	r3, #8
 1b6:	7103      	strb	r3, [r0, #4]
 1b8:	2300      	movs	r3, #0
 1ba:	7143      	strb	r3, [r0, #5]
 1bc:	7183      	strb	r3, [r0, #6]
 1be:	71c3      	strb	r3, [r0, #7]
 1c0:	4770      	bx	lr
	...

000001c4 <drv_eth_mac_pe_default_config>:
 1c4:	4b07      	ldr	r3, [pc, #28]	; (1e4 <drv_eth_mac_pe_default_config+0x20>)
 1c6:	60c3      	str	r3, [r0, #12]
 1c8:	f240 6305 	movw	r3, #1541	; 0x605
 1cc:	8203      	strh	r3, [r0, #16]
 1ce:	2300      	movs	r3, #0
 1d0:	7483      	strb	r3, [r0, #18]
 1d2:	74c3      	strb	r3, [r0, #19]
 1d4:	7503      	strb	r3, [r0, #20]
 1d6:	2201      	movs	r2, #1
 1d8:	7542      	strb	r2, [r0, #21]
 1da:	7582      	strb	r2, [r0, #22]
 1dc:	75c3      	strb	r3, [r0, #23]
 1de:	2360      	movs	r3, #96	; 0x60
 1e0:	7603      	strb	r3, [r0, #24]
 1e2:	4770      	bx	lr
 1e4:	04030201 	streq	r0, [r3], #-513	; 0xfffffdff

000001e8 <drv_eth_mac_set_dma_config>:
 1e8:	b508      	push	{r3, lr}
 1ea:	7903      	ldrb	r3, [r0, #4]
 1ec:	7941      	ldrb	r1, [r0, #5]
 1ee:	0089      	lsls	r1, r1, #2
 1f0:	ea41 7103 	orr.w	r1, r1, r3, lsl #28
 1f4:	7982      	ldrb	r2, [r0, #6]
 1f6:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
 1fa:	79c2      	ldrb	r2, [r0, #7]
 1fc:	4311      	orrs	r1, r2
 1fe:	6800      	ldr	r0, [r0, #0]
 200:	460a      	mov	r2, r1
 202:	3004      	adds	r0, #4
 204:	f7ff ff5c 	bl	c0 <drv_check_rw_data>
 208:	bd08      	pop	{r3, pc}

0000020a <drv_eth_mac_set_pe_config>:
 20a:	b510      	push	{r4, lr}
 20c:	4604      	mov	r4, r0
 20e:	68c1      	ldr	r1, [r0, #12]
 210:	6800      	ldr	r0, [r0, #0]
 212:	460a      	mov	r2, r1
 214:	30d0      	adds	r0, #208	; 0xd0
 216:	f7ff ff53 	bl	c0 <drv_check_rw_data>
 21a:	8a21      	ldrh	r1, [r4, #16]
 21c:	6820      	ldr	r0, [r4, #0]
 21e:	460a      	mov	r2, r1
 220:	30d4      	adds	r0, #212	; 0xd4
 222:	f7ff ff4d 	bl	c0 <drv_check_rw_data>
 226:	7ca3      	ldrb	r3, [r4, #18]
 228:	7ce1      	ldrb	r1, [r4, #19]
 22a:	0709      	lsls	r1, r1, #28
 22c:	ea41 71c3 	orr.w	r1, r1, r3, lsl #31
 230:	7d23      	ldrb	r3, [r4, #20]
 232:	ea41 6143 	orr.w	r1, r1, r3, lsl #25
 236:	7d63      	ldrb	r3, [r4, #21]
 238:	ea41 5183 	orr.w	r1, r1, r3, lsl #22
 23c:	7da2      	ldrb	r2, [r4, #22]
 23e:	ea41 3142 	orr.w	r1, r1, r2, lsl #13
 242:	7de2      	ldrb	r2, [r4, #23]
 244:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 248:	6820      	ldr	r0, [r4, #0]
 24a:	460a      	mov	r2, r1
 24c:	30d8      	adds	r0, #216	; 0xd8
 24e:	f7ff ff37 	bl	c0 <drv_check_rw_data>
 252:	7e21      	ldrb	r1, [r4, #24]
 254:	08c9      	lsrs	r1, r1, #3
 256:	3905      	subs	r1, #5
 258:	0609      	lsls	r1, r1, #24
 25a:	6820      	ldr	r0, [r4, #0]
 25c:	460a      	mov	r2, r1
 25e:	30dc      	adds	r0, #220	; 0xdc
 260:	f7ff ff2e 	bl	c0 <drv_check_rw_data>
 264:	bd10      	pop	{r4, pc}

00000266 <drv_eth_mac_init>:
 266:	b538      	push	{r3, r4, r5, lr}
 268:	4604      	mov	r4, r0
 26a:	f7ff ffbd 	bl	1e8 <drv_eth_mac_set_dma_config>
 26e:	4605      	mov	r5, r0
 270:	4620      	mov	r0, r4
 272:	f7ff ffca 	bl	20a <drv_eth_mac_set_pe_config>
 276:	4328      	orrs	r0, r5
 278:	2300      	movs	r3, #0
 27a:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
 27e:	61e3      	str	r3, [r4, #28]
 280:	6223      	str	r3, [r4, #32]
 282:	2204      	movs	r2, #4
 284:	f884 2024 	strb.w	r2, [r4, #36]	; 0x24
 288:	f884 2025 	strb.w	r2, [r4, #37]	; 0x25
 28c:	f884 3026 	strb.w	r3, [r4, #38]	; 0x26
 290:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
 294:	6821      	ldr	r1, [r4, #0]
 296:	680a      	ldr	r2, [r1, #0]
 298:	f442 7280 	orr.w	r2, r2, #256	; 0x100
 29c:	600a      	str	r2, [r1, #0]
 29e:	6821      	ldr	r1, [r4, #0]
 2a0:	680a      	ldr	r2, [r1, #0]
 2a2:	f422 7280 	bic.w	r2, r2, #256	; 0x100
 2a6:	600a      	str	r2, [r1, #0]
 2a8:	6821      	ldr	r1, [r4, #0]
 2aa:	680a      	ldr	r2, [r1, #0]
 2ac:	f442 7200 	orr.w	r2, r2, #512	; 0x200
 2b0:	600a      	str	r2, [r1, #0]
 2b2:	6821      	ldr	r1, [r4, #0]
 2b4:	680a      	ldr	r2, [r1, #0]
 2b6:	f422 7200 	bic.w	r2, r2, #512	; 0x200
 2ba:	600a      	str	r2, [r1, #0]
 2bc:	6821      	ldr	r1, [r4, #0]
 2be:	680a      	ldr	r2, [r1, #0]
 2c0:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 2c4:	600a      	str	r2, [r1, #0]
 2c6:	6821      	ldr	r1, [r4, #0]
 2c8:	680a      	ldr	r2, [r1, #0]
 2ca:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
 2ce:	600a      	str	r2, [r1, #0]
 2d0:	6821      	ldr	r1, [r4, #0]
 2d2:	680a      	ldr	r2, [r1, #0]
 2d4:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
 2d8:	600a      	str	r2, [r1, #0]
 2da:	6821      	ldr	r1, [r4, #0]
 2dc:	680a      	ldr	r2, [r1, #0]
 2de:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
 2e2:	600a      	str	r2, [r1, #0]
 2e4:	6821      	ldr	r1, [r4, #0]
 2e6:	680a      	ldr	r2, [r1, #0]
 2e8:	f442 5280 	orr.w	r2, r2, #4096	; 0x1000
 2ec:	600a      	str	r2, [r1, #0]
 2ee:	6821      	ldr	r1, [r4, #0]
 2f0:	680a      	ldr	r2, [r1, #0]
 2f2:	f422 5280 	bic.w	r2, r2, #4096	; 0x1000
 2f6:	600a      	str	r2, [r1, #0]
 2f8:	6821      	ldr	r1, [r4, #0]
 2fa:	2201      	movs	r2, #1
 2fc:	f8c1 2100 	str.w	r2, [r1, #256]	; 0x100
 300:	6821      	ldr	r1, [r4, #0]
 302:	f8c1 3100 	str.w	r3, [r1, #256]	; 0x100
 306:	6821      	ldr	r1, [r4, #0]
 308:	f8c1 2104 	str.w	r2, [r1, #260]	; 0x104
 30c:	6822      	ldr	r2, [r4, #0]
 30e:	f8c2 3104 	str.w	r3, [r2, #260]	; 0x104
 312:	6822      	ldr	r2, [r4, #0]
 314:	6813      	ldr	r3, [r2, #0]
 316:	f043 0301 	orr.w	r3, r3, #1
 31a:	6013      	str	r3, [r2, #0]
 31c:	6822      	ldr	r2, [r4, #0]
 31e:	6813      	ldr	r3, [r2, #0]
 320:	f023 0301 	bic.w	r3, r3, #1
 324:	6013      	str	r3, [r2, #0]
 326:	6822      	ldr	r2, [r4, #0]
 328:	6813      	ldr	r3, [r2, #0]
 32a:	f043 0302 	orr.w	r3, r3, #2
 32e:	6013      	str	r3, [r2, #0]
 330:	6822      	ldr	r2, [r4, #0]
 332:	6813      	ldr	r3, [r2, #0]
 334:	f023 0302 	bic.w	r3, r3, #2
 338:	6013      	str	r3, [r2, #0]
 33a:	b2c0      	uxtb	r0, r0
 33c:	bd38      	pop	{r3, r4, r5, pc}

0000033e <drv_eth_mac_address_set>:
 33e:	78ca      	ldrb	r2, [r1, #3]
 340:	788b      	ldrb	r3, [r1, #2]
 342:	041b      	lsls	r3, r3, #16
 344:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
 348:	784a      	ldrb	r2, [r1, #1]
 34a:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 34e:	780a      	ldrb	r2, [r1, #0]
 350:	4313      	orrs	r3, r2
 352:	60c3      	str	r3, [r0, #12]
 354:	f891 c005 	ldrb.w	ip, [r1, #5]
 358:	790a      	ldrb	r2, [r1, #4]
 35a:	ea42 220c 	orr.w	r2, r2, ip, lsl #8
 35e:	8202      	strh	r2, [r0, #16]
 360:	6802      	ldr	r2, [r0, #0]
 362:	f8d2 10d0 	ldr.w	r1, [r2, #208]	; 0xd0
 366:	f8c2 30d0 	str.w	r3, [r2, #208]	; 0xd0
 36a:	6802      	ldr	r2, [r0, #0]
 36c:	f8d2 30d4 	ldr.w	r3, [r2, #212]	; 0xd4
 370:	0c1b      	lsrs	r3, r3, #16
 372:	041b      	lsls	r3, r3, #16
 374:	8a01      	ldrh	r1, [r0, #16]
 376:	430b      	orrs	r3, r1
 378:	f8c2 30d4 	str.w	r3, [r2, #212]	; 0xd4
 37c:	4770      	bx	lr

0000037e <drv_eth_mac_tx_descriptor_default_config>:
 37e:	2300      	movs	r3, #0
 380:	6003      	str	r3, [r0, #0]
 382:	7103      	strb	r3, [r0, #4]
 384:	80c3      	strh	r3, [r0, #6]
 386:	7203      	strb	r3, [r0, #8]
 388:	7243      	strb	r3, [r0, #9]
 38a:	2301      	movs	r3, #1
 38c:	7283      	strb	r3, [r0, #10]
 38e:	4770      	bx	lr

00000390 <drv_eth_mac_tx_descriptor_config>:
 390:	6803      	ldr	r3, [r0, #0]
 392:	600b      	str	r3, [r1, #0]
 394:	2300      	movs	r3, #0
 396:	604b      	str	r3, [r1, #4]
 398:	7902      	ldrb	r2, [r0, #4]
 39a:	88c3      	ldrh	r3, [r0, #6]
 39c:	ea43 73c2 	orr.w	r3, r3, r2, lsl #31
 3a0:	608b      	str	r3, [r1, #8]
 3a2:	7a02      	ldrb	r2, [r0, #8]
 3a4:	7a43      	ldrb	r3, [r0, #9]
 3a6:	061b      	lsls	r3, r3, #24
 3a8:	ea43 6382 	orr.w	r3, r3, r2, lsl #26
 3ac:	7a82      	ldrb	r2, [r0, #10]
 3ae:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
 3b2:	60cb      	str	r3, [r1, #12]
 3b4:	4770      	bx	lr

000003b6 <drv_eth_mac_set_tx_descriptor_config>:
 3b6:	61c1      	str	r1, [r0, #28]
 3b8:	6801      	ldr	r1, [r0, #0]
 3ba:	690b      	ldr	r3, [r1, #16]
 3bc:	f023 0303 	bic.w	r3, r3, #3
 3c0:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
 3c4:	3a01      	subs	r2, #1
 3c6:	4313      	orrs	r3, r2
 3c8:	610b      	str	r3, [r1, #16]
 3ca:	2300      	movs	r3, #0
 3cc:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 3d0:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
 3d4:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
 3d8:	4293      	cmp	r3, r2
 3da:	d223      	bcs.n	424 <drv_eth_mac_set_tx_descriptor_config+0x6e>
 3dc:	b410      	push	{r4}
 3de:	6802      	ldr	r2, [r0, #0]
 3e0:	3250      	adds	r2, #80	; 0x50
 3e2:	ea4f 1c03 	mov.w	ip, r3, lsl #4
 3e6:	eb02 1103 	add.w	r1, r2, r3, lsl #4
 3ea:	69c4      	ldr	r4, [r0, #28]
 3ec:	eb04 1303 	add.w	r3, r4, r3, lsl #4
 3f0:	f854 400c 	ldr.w	r4, [r4, ip]
 3f4:	f842 400c 	str.w	r4, [r2, ip]
 3f8:	685a      	ldr	r2, [r3, #4]
 3fa:	604a      	str	r2, [r1, #4]
 3fc:	689a      	ldr	r2, [r3, #8]
 3fe:	608a      	str	r2, [r1, #8]
 400:	68db      	ldr	r3, [r3, #12]
 402:	60cb      	str	r3, [r1, #12]
 404:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
 408:	3301      	adds	r3, #1
 40a:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 40e:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
 412:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
 416:	4293      	cmp	r3, r2
 418:	d3e1      	bcc.n	3de <drv_eth_mac_set_tx_descriptor_config+0x28>
 41a:	2300      	movs	r3, #0
 41c:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 420:	bc10      	pop	{r4}
 422:	4770      	bx	lr
 424:	2300      	movs	r3, #0
 426:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 42a:	4770      	bx	lr

0000042c <drv_eth_mac_tx_descriptor_clear>:
 42c:	2300      	movs	r3, #0
 42e:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 432:	e00f      	b.n	454 <drv_eth_mac_tx_descriptor_clear+0x28>
 434:	69c1      	ldr	r1, [r0, #28]
 436:	ea4f 1c03 	mov.w	ip, r3, lsl #4
 43a:	eb01 1303 	add.w	r3, r1, r3, lsl #4
 43e:	2200      	movs	r2, #0
 440:	f841 200c 	str.w	r2, [r1, ip]
 444:	605a      	str	r2, [r3, #4]
 446:	609a      	str	r2, [r3, #8]
 448:	60da      	str	r2, [r3, #12]
 44a:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
 44e:	3301      	adds	r3, #1
 450:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 454:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
 458:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
 45c:	4293      	cmp	r3, r2
 45e:	d3e9      	bcc.n	434 <drv_eth_mac_tx_descriptor_clear+0x8>
 460:	2300      	movs	r3, #0
 462:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
 466:	4770      	bx	lr

00000468 <drv_eth_mac_set_tx_descriptor_and_tx_enable>:
 468:	b510      	push	{r4, lr}
 46a:	4604      	mov	r4, r0
 46c:	f7ff ffa3 	bl	3b6 <drv_eth_mac_set_tx_descriptor_config>
 470:	6822      	ldr	r2, [r4, #0]
 472:	6813      	ldr	r3, [r2, #0]
 474:	f023 0308 	bic.w	r3, r3, #8
 478:	6013      	str	r3, [r2, #0]
 47a:	6822      	ldr	r2, [r4, #0]
 47c:	6813      	ldr	r3, [r2, #0]
 47e:	f043 0308 	orr.w	r3, r3, #8
 482:	6013      	str	r3, [r2, #0]
 484:	6822      	ldr	r2, [r4, #0]
 486:	6813      	ldr	r3, [r2, #0]
 488:	f023 0308 	bic.w	r3, r3, #8
 48c:	6013      	str	r3, [r2, #0]
 48e:	bd10      	pop	{r4, pc}

00000490 <eth_mac_tx_int_tx_frame_done_callback>:
 490:	4770      	bx	lr

00000492 <eth_mac_rx_int_rx_frame_done_callback>:
 492:	4770      	bx	lr

00000494 <eth_mac_dma_int_once_process_done_callback>:
 494:	4770      	bx	lr

00000496 <eth_mac_dma_int_hready_to_callback>:
 496:	4770      	bx	lr

00000498 <eth_mac_dma_int_bus_error_callback>:
 498:	4770      	bx	lr

0000049a <drv_eth_mac_tx_interrupt_handler>:
 49a:	6802      	ldr	r2, [r0, #0]
 49c:	f8d2 3110 	ldr.w	r3, [r2, #272]	; 0x110
 4a0:	f8d2 20f0 	ldr.w	r2, [r2, #240]	; 0xf0
 4a4:	b2d2      	uxtb	r2, r2
 4a6:	4013      	ands	r3, r2
 4a8:	f013 0f01 	tst.w	r3, #1
 4ac:	d100      	bne.n	4b0 <drv_eth_mac_tx_interrupt_handler+0x16>
 4ae:	4770      	bx	lr
 4b0:	b510      	push	{r4, lr}
 4b2:	4604      	mov	r4, r0
 4b4:	2302      	movs	r3, #2
 4b6:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
 4ba:	f7ff ffe9 	bl	490 <eth_mac_tx_int_tx_frame_done_callback>
 4be:	6822      	ldr	r2, [r4, #0]
 4c0:	f8d2 3100 	ldr.w	r3, [r2, #256]	; 0x100
 4c4:	f043 0301 	orr.w	r3, r3, #1
 4c8:	f8c2 3100 	str.w	r3, [r2, #256]	; 0x100
 4cc:	6823      	ldr	r3, [r4, #0]
 4ce:	2200      	movs	r2, #0
 4d0:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
 4d4:	bd10      	pop	{r4, pc}

000004d6 <drv_eth_mac_rx_interrupt_handler>:
 4d6:	6802      	ldr	r2, [r0, #0]
 4d8:	f8d2 3114 	ldr.w	r3, [r2, #276]	; 0x114
 4dc:	f8d2 20f4 	ldr.w	r2, [r2, #244]	; 0xf4
 4e0:	b2d2      	uxtb	r2, r2
 4e2:	4013      	ands	r3, r2
 4e4:	f013 0f01 	tst.w	r3, #1
 4e8:	d100      	bne.n	4ec <drv_eth_mac_rx_interrupt_handler+0x16>
 4ea:	4770      	bx	lr
 4ec:	b510      	push	{r4, lr}
 4ee:	4604      	mov	r4, r0
 4f0:	2302      	movs	r3, #2
 4f2:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
 4f6:	f7ff ffcc 	bl	492 <eth_mac_rx_int_rx_frame_done_callback>
 4fa:	6822      	ldr	r2, [r4, #0]
 4fc:	f8d2 3104 	ldr.w	r3, [r2, #260]	; 0x104
 500:	f043 0301 	orr.w	r3, r3, #1
 504:	f8c2 3104 	str.w	r3, [r2, #260]	; 0x104
 508:	6823      	ldr	r3, [r4, #0]
 50a:	2200      	movs	r2, #0
 50c:	f8c3 2104 	str.w	r2, [r3, #260]	; 0x104
 510:	bd10      	pop	{r4, pc}

00000512 <drv_eth_mac_dma_interrupt_handler>:
 512:	b538      	push	{r3, r4, r5, lr}
 514:	4604      	mov	r4, r0
 516:	6803      	ldr	r3, [r0, #0]
 518:	f8d3 5118 	ldr.w	r5, [r3, #280]	; 0x118
 51c:	f8d3 30f8 	ldr.w	r3, [r3, #248]	; 0xf8
 520:	b2db      	uxtb	r3, r3
 522:	401d      	ands	r5, r3
 524:	f015 0f01 	tst.w	r5, #1
 528:	d106      	bne.n	538 <drv_eth_mac_dma_interrupt_handler+0x26>
 52a:	f015 0f02 	tst.w	r5, #2
 52e:	d114      	bne.n	55a <drv_eth_mac_dma_interrupt_handler+0x48>
 530:	f015 0f04 	tst.w	r5, #4
 534:	d123      	bne.n	57e <drv_eth_mac_dma_interrupt_handler+0x6c>
 536:	bd38      	pop	{r3, r4, r5, pc}
 538:	2302      	movs	r3, #2
 53a:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
 53e:	f7ff ffa9 	bl	494 <eth_mac_dma_int_once_process_done_callback>
 542:	6822      	ldr	r2, [r4, #0]
 544:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
 548:	f043 0301 	orr.w	r3, r3, #1
 54c:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
 550:	6823      	ldr	r3, [r4, #0]
 552:	2200      	movs	r2, #0
 554:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
 558:	e7e7      	b.n	52a <drv_eth_mac_dma_interrupt_handler+0x18>
 55a:	2304      	movs	r3, #4
 55c:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
 560:	4620      	mov	r0, r4
 562:	f7ff ff98 	bl	496 <eth_mac_dma_int_hready_to_callback>
 566:	6822      	ldr	r2, [r4, #0]
 568:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
 56c:	f043 0302 	orr.w	r3, r3, #2
 570:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
 574:	6823      	ldr	r3, [r4, #0]
 576:	2200      	movs	r2, #0
 578:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
 57c:	e7d8      	b.n	530 <drv_eth_mac_dma_interrupt_handler+0x1e>
 57e:	2310      	movs	r3, #16
 580:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
 584:	4620      	mov	r0, r4
 586:	f7ff ff87 	bl	498 <eth_mac_dma_int_bus_error_callback>
 58a:	6822      	ldr	r2, [r4, #0]
 58c:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
 590:	f043 0304 	orr.w	r3, r3, #4
 594:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
 598:	6823      	ldr	r3, [r4, #0]
 59a:	2200      	movs	r2, #0
 59c:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
 5a0:	e7c9      	b.n	536 <drv_eth_mac_dma_interrupt_handler+0x24>

000005a2 <drv_uart_default_config>:
 5a2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 5a6:	6043      	str	r3, [r0, #4]
 5a8:	230f      	movs	r3, #15
 5aa:	7203      	strb	r3, [r0, #8]
 5ac:	2300      	movs	r3, #0
 5ae:	7243      	strb	r3, [r0, #9]
 5b0:	7283      	strb	r3, [r0, #10]
 5b2:	72c3      	strb	r3, [r0, #11]
 5b4:	7303      	strb	r3, [r0, #12]
 5b6:	7343      	strb	r3, [r0, #13]
 5b8:	2301      	movs	r3, #1
 5ba:	7383      	strb	r3, [r0, #14]
 5bc:	4770      	bx	lr
	...

000005c0 <drv_uart_set_config>:
 5c0:	b508      	push	{r3, lr}
 5c2:	6841      	ldr	r1, [r0, #4]
 5c4:	7a03      	ldrb	r3, [r0, #8]
 5c6:	fb03 f201 	mul.w	r2, r3, r1
 5ca:	490e      	ldr	r1, [pc, #56]	; (604 <drv_uart_set_config+0x44>)
 5cc:	fbb1 f2f2 	udiv	r2, r1, r2
 5d0:	0419      	lsls	r1, r3, #16
 5d2:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 5d6:	7a43      	ldrb	r3, [r0, #9]
 5d8:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 5dc:	7a83      	ldrb	r3, [r0, #10]
 5de:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 5e2:	7ac3      	ldrb	r3, [r0, #11]
 5e4:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 5e8:	7b03      	ldrb	r3, [r0, #12]
 5ea:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 5ee:	7b42      	ldrb	r2, [r0, #13]
 5f0:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 5f4:	7b82      	ldrb	r2, [r0, #14]
 5f6:	4311      	orrs	r1, r2
 5f8:	6800      	ldr	r0, [r0, #0]
 5fa:	460a      	mov	r2, r1
 5fc:	3008      	adds	r0, #8
 5fe:	f7ff fd5f 	bl	c0 <drv_check_rw_data>
 602:	bd08      	pop	{r3, pc}
 604:	02625a00 	rsbeq	r5, r2, #0, 20

00000608 <drv_uart_init>:
 608:	b538      	push	{r3, r4, r5, lr}
 60a:	4604      	mov	r4, r0
 60c:	2500      	movs	r5, #0
 60e:	7485      	strb	r5, [r0, #18]
 610:	74c5      	strb	r5, [r0, #19]
 612:	f7ff ffd5 	bl	5c0 <drv_uart_set_config>
 616:	7425      	strb	r5, [r4, #16]
 618:	74a5      	strb	r5, [r4, #18]
 61a:	74e5      	strb	r5, [r4, #19]
 61c:	6822      	ldr	r2, [r4, #0]
 61e:	6853      	ldr	r3, [r2, #4]
 620:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 624:	6053      	str	r3, [r2, #4]
 626:	6822      	ldr	r2, [r4, #0]
 628:	6853      	ldr	r3, [r2, #4]
 62a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 62e:	6053      	str	r3, [r2, #4]
 630:	6822      	ldr	r2, [r4, #0]
 632:	6853      	ldr	r3, [r2, #4]
 634:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 638:	6053      	str	r3, [r2, #4]
 63a:	6822      	ldr	r2, [r4, #0]
 63c:	6853      	ldr	r3, [r2, #4]
 63e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 642:	6053      	str	r3, [r2, #4]
 644:	6822      	ldr	r2, [r4, #0]
 646:	6853      	ldr	r3, [r2, #4]
 648:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 64c:	6053      	str	r3, [r2, #4]
 64e:	6822      	ldr	r2, [r4, #0]
 650:	6853      	ldr	r3, [r2, #4]
 652:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 656:	6053      	str	r3, [r2, #4]
 658:	6822      	ldr	r2, [r4, #0]
 65a:	6853      	ldr	r3, [r2, #4]
 65c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 660:	6053      	str	r3, [r2, #4]
 662:	6822      	ldr	r2, [r4, #0]
 664:	6853      	ldr	r3, [r2, #4]
 666:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 66a:	6053      	str	r3, [r2, #4]
 66c:	6823      	ldr	r3, [r4, #0]
 66e:	f240 12ff 	movw	r2, #511	; 0x1ff
 672:	611a      	str	r2, [r3, #16]
 674:	6823      	ldr	r3, [r4, #0]
 676:	611d      	str	r5, [r3, #16]
 678:	6822      	ldr	r2, [r4, #0]
 67a:	6853      	ldr	r3, [r2, #4]
 67c:	f043 0301 	orr.w	r3, r3, #1
 680:	6053      	str	r3, [r2, #4]
 682:	6822      	ldr	r2, [r4, #0]
 684:	6853      	ldr	r3, [r2, #4]
 686:	f023 0301 	bic.w	r3, r3, #1
 68a:	6053      	str	r3, [r2, #4]
 68c:	6822      	ldr	r2, [r4, #0]
 68e:	6853      	ldr	r3, [r2, #4]
 690:	f043 0302 	orr.w	r3, r3, #2
 694:	6053      	str	r3, [r2, #4]
 696:	bd38      	pop	{r3, r4, r5, pc}

00000698 <uart_int_tx_done_callback>:
 698:	4770      	bx	lr

0000069a <uart_int_rx_stop_callback>:
 69a:	4770      	bx	lr

0000069c <uart_int_rx_parity_error_callback>:
 69c:	4770      	bx	lr

0000069e <uart_int_rx_noise_detect_callback>:
 69e:	4770      	bx	lr

000006a0 <uart_int_rx_stop_detect_callback>:
 6a0:	4770      	bx	lr

000006a2 <uart_int_tx_fifo_empty_callback>:
 6a2:	4770      	bx	lr

000006a4 <uart_int_tx_fifo_thres_callback>:
 6a4:	4770      	bx	lr

000006a6 <uart_int_rx_fifo_noempty_callback>:
 6a6:	4770      	bx	lr

000006a8 <uart_int_rx_fifo_thres_callback>:
 6a8:	4770      	bx	lr

000006aa <drv_uart_interrupt_handler>:
 6aa:	b538      	push	{r3, r4, r5, lr}
 6ac:	4604      	mov	r4, r0
 6ae:	6803      	ldr	r3, [r0, #0]
 6b0:	699d      	ldr	r5, [r3, #24]
 6b2:	68db      	ldr	r3, [r3, #12]
 6b4:	b29b      	uxth	r3, r3
 6b6:	401d      	ands	r5, r3
 6b8:	f415 7f80 	tst.w	r5, #256	; 0x100
 6bc:	d144      	bne.n	748 <drv_uart_interrupt_handler+0x9e>
 6be:	f015 0f40 	tst.w	r5, #64	; 0x40
 6c2:	d00f      	beq.n	6e4 <drv_uart_interrupt_handler+0x3a>
 6c4:	2301      	movs	r3, #1
 6c6:	7423      	strb	r3, [r4, #16]
 6c8:	7aa3      	ldrb	r3, [r4, #10]
 6ca:	2b01      	cmp	r3, #1
 6cc:	d147      	bne.n	75e <drv_uart_interrupt_handler+0xb4>
 6ce:	4620      	mov	r0, r4
 6d0:	f7ff ffe3 	bl	69a <uart_int_rx_stop_callback>
 6d4:	6822      	ldr	r2, [r4, #0]
 6d6:	6913      	ldr	r3, [r2, #16]
 6d8:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 6dc:	6113      	str	r3, [r2, #16]
 6de:	6823      	ldr	r3, [r4, #0]
 6e0:	2200      	movs	r2, #0
 6e2:	611a      	str	r2, [r3, #16]
 6e4:	f015 0f80 	tst.w	r5, #128	; 0x80
 6e8:	d00f      	beq.n	70a <drv_uart_interrupt_handler+0x60>
 6ea:	2302      	movs	r3, #2
 6ec:	7423      	strb	r3, [r4, #16]
 6ee:	7aa3      	ldrb	r3, [r4, #10]
 6f0:	2b01      	cmp	r3, #1
 6f2:	d166      	bne.n	7c2 <drv_uart_interrupt_handler+0x118>
 6f4:	4620      	mov	r0, r4
 6f6:	f7ff ffd1 	bl	69c <uart_int_rx_parity_error_callback>
 6fa:	6822      	ldr	r2, [r4, #0]
 6fc:	6913      	ldr	r3, [r2, #16]
 6fe:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 702:	6113      	str	r3, [r2, #16]
 704:	6823      	ldr	r3, [r4, #0]
 706:	2200      	movs	r2, #0
 708:	611a      	str	r2, [r3, #16]
 70a:	f015 0f20 	tst.w	r5, #32
 70e:	f040 808a 	bne.w	826 <drv_uart_interrupt_handler+0x17c>
 712:	f015 0f10 	tst.w	r5, #16
 716:	f040 8092 	bne.w	83e <drv_uart_interrupt_handler+0x194>
 71a:	f015 0f01 	tst.w	r5, #1
 71e:	f040 809a 	bne.w	856 <drv_uart_interrupt_handler+0x1ac>
 722:	f015 0f02 	tst.w	r5, #2
 726:	f040 80a2 	bne.w	86e <drv_uart_interrupt_handler+0x1c4>
 72a:	f015 0f04 	tst.w	r5, #4
 72e:	f000 80c1 	beq.w	8b4 <drv_uart_interrupt_handler+0x20a>
 732:	7ce2      	ldrb	r2, [r4, #19]
 734:	7e23      	ldrb	r3, [r4, #24]
 736:	429a      	cmp	r2, r3
 738:	f0c0 80ac 	bcc.w	894 <drv_uart_interrupt_handler+0x1ea>
 73c:	6822      	ldr	r2, [r4, #0]
 73e:	68d3      	ldr	r3, [r2, #12]
 740:	f023 030c 	bic.w	r3, r3, #12
 744:	60d3      	str	r3, [r2, #12]
 746:	e0aa      	b.n	89e <drv_uart_interrupt_handler+0x1f4>
 748:	f7ff ffa6 	bl	698 <uart_int_tx_done_callback>
 74c:	6822      	ldr	r2, [r4, #0]
 74e:	6913      	ldr	r3, [r2, #16]
 750:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 754:	6113      	str	r3, [r2, #16]
 756:	6823      	ldr	r3, [r4, #0]
 758:	2200      	movs	r2, #0
 75a:	611a      	str	r2, [r3, #16]
 75c:	e7af      	b.n	6be <drv_uart_interrupt_handler+0x14>
 75e:	6822      	ldr	r2, [r4, #0]
 760:	68d3      	ldr	r3, [r2, #12]
 762:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 766:	60d3      	str	r3, [r2, #12]
 768:	2300      	movs	r3, #0
 76a:	7423      	strb	r3, [r4, #16]
 76c:	74a3      	strb	r3, [r4, #18]
 76e:	74e3      	strb	r3, [r4, #19]
 770:	6822      	ldr	r2, [r4, #0]
 772:	6853      	ldr	r3, [r2, #4]
 774:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 778:	6053      	str	r3, [r2, #4]
 77a:	6822      	ldr	r2, [r4, #0]
 77c:	6853      	ldr	r3, [r2, #4]
 77e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 782:	6053      	str	r3, [r2, #4]
 784:	6822      	ldr	r2, [r4, #0]
 786:	6853      	ldr	r3, [r2, #4]
 788:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 78c:	6053      	str	r3, [r2, #4]
 78e:	6822      	ldr	r2, [r4, #0]
 790:	6853      	ldr	r3, [r2, #4]
 792:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 796:	6053      	str	r3, [r2, #4]
 798:	6822      	ldr	r2, [r4, #0]
 79a:	6853      	ldr	r3, [r2, #4]
 79c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 7a0:	6053      	str	r3, [r2, #4]
 7a2:	6822      	ldr	r2, [r4, #0]
 7a4:	6853      	ldr	r3, [r2, #4]
 7a6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 7aa:	6053      	str	r3, [r2, #4]
 7ac:	6822      	ldr	r2, [r4, #0]
 7ae:	6853      	ldr	r3, [r2, #4]
 7b0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 7b4:	6053      	str	r3, [r2, #4]
 7b6:	6822      	ldr	r2, [r4, #0]
 7b8:	6853      	ldr	r3, [r2, #4]
 7ba:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 7be:	6053      	str	r3, [r2, #4]
 7c0:	e785      	b.n	6ce <drv_uart_interrupt_handler+0x24>
 7c2:	6822      	ldr	r2, [r4, #0]
 7c4:	68d3      	ldr	r3, [r2, #12]
 7c6:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 7ca:	60d3      	str	r3, [r2, #12]
 7cc:	2300      	movs	r3, #0
 7ce:	7423      	strb	r3, [r4, #16]
 7d0:	74a3      	strb	r3, [r4, #18]
 7d2:	74e3      	strb	r3, [r4, #19]
 7d4:	6822      	ldr	r2, [r4, #0]
 7d6:	6853      	ldr	r3, [r2, #4]
 7d8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 7dc:	6053      	str	r3, [r2, #4]
 7de:	6822      	ldr	r2, [r4, #0]
 7e0:	6853      	ldr	r3, [r2, #4]
 7e2:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 7e6:	6053      	str	r3, [r2, #4]
 7e8:	6822      	ldr	r2, [r4, #0]
 7ea:	6853      	ldr	r3, [r2, #4]
 7ec:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 7f0:	6053      	str	r3, [r2, #4]
 7f2:	6822      	ldr	r2, [r4, #0]
 7f4:	6853      	ldr	r3, [r2, #4]
 7f6:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 7fa:	6053      	str	r3, [r2, #4]
 7fc:	6822      	ldr	r2, [r4, #0]
 7fe:	6853      	ldr	r3, [r2, #4]
 800:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 804:	6053      	str	r3, [r2, #4]
 806:	6822      	ldr	r2, [r4, #0]
 808:	6853      	ldr	r3, [r2, #4]
 80a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 80e:	6053      	str	r3, [r2, #4]
 810:	6822      	ldr	r2, [r4, #0]
 812:	6853      	ldr	r3, [r2, #4]
 814:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 818:	6053      	str	r3, [r2, #4]
 81a:	6822      	ldr	r2, [r4, #0]
 81c:	6853      	ldr	r3, [r2, #4]
 81e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 822:	6053      	str	r3, [r2, #4]
 824:	e766      	b.n	6f4 <drv_uart_interrupt_handler+0x4a>
 826:	4620      	mov	r0, r4
 828:	f7ff ff39 	bl	69e <uart_int_rx_noise_detect_callback>
 82c:	6822      	ldr	r2, [r4, #0]
 82e:	6913      	ldr	r3, [r2, #16]
 830:	f043 0320 	orr.w	r3, r3, #32
 834:	6113      	str	r3, [r2, #16]
 836:	6823      	ldr	r3, [r4, #0]
 838:	2200      	movs	r2, #0
 83a:	611a      	str	r2, [r3, #16]
 83c:	e769      	b.n	712 <drv_uart_interrupt_handler+0x68>
 83e:	4620      	mov	r0, r4
 840:	f7ff ff2e 	bl	6a0 <uart_int_rx_stop_detect_callback>
 844:	6822      	ldr	r2, [r4, #0]
 846:	6913      	ldr	r3, [r2, #16]
 848:	f043 0310 	orr.w	r3, r3, #16
 84c:	6113      	str	r3, [r2, #16]
 84e:	6823      	ldr	r3, [r4, #0]
 850:	2200      	movs	r2, #0
 852:	611a      	str	r2, [r3, #16]
 854:	e761      	b.n	71a <drv_uart_interrupt_handler+0x70>
 856:	4620      	mov	r0, r4
 858:	f7ff ff24 	bl	6a4 <uart_int_tx_fifo_thres_callback>
 85c:	6822      	ldr	r2, [r4, #0]
 85e:	6913      	ldr	r3, [r2, #16]
 860:	f043 0301 	orr.w	r3, r3, #1
 864:	6113      	str	r3, [r2, #16]
 866:	6823      	ldr	r3, [r4, #0]
 868:	2200      	movs	r2, #0
 86a:	611a      	str	r2, [r3, #16]
 86c:	e759      	b.n	722 <drv_uart_interrupt_handler+0x78>
 86e:	4620      	mov	r0, r4
 870:	f7ff ff17 	bl	6a2 <uart_int_tx_fifo_empty_callback>
 874:	6822      	ldr	r2, [r4, #0]
 876:	6913      	ldr	r3, [r2, #16]
 878:	f043 0302 	orr.w	r3, r3, #2
 87c:	6113      	str	r3, [r2, #16]
 87e:	6823      	ldr	r3, [r4, #0]
 880:	2200      	movs	r2, #0
 882:	611a      	str	r2, [r3, #16]
 884:	e751      	b.n	72a <drv_uart_interrupt_handler+0x80>
 886:	69d9      	ldr	r1, [r3, #28]
 888:	6962      	ldr	r2, [r4, #20]
 88a:	7ce3      	ldrb	r3, [r4, #19]
 88c:	1c58      	adds	r0, r3, #1
 88e:	74e0      	strb	r0, [r4, #19]
 890:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 894:	6823      	ldr	r3, [r4, #0]
 896:	695a      	ldr	r2, [r3, #20]
 898:	f012 0f1f 	tst.w	r2, #31
 89c:	d1f3      	bne.n	886 <drv_uart_interrupt_handler+0x1dc>
 89e:	4620      	mov	r0, r4
 8a0:	f7ff ff02 	bl	6a8 <uart_int_rx_fifo_thres_callback>
 8a4:	6822      	ldr	r2, [r4, #0]
 8a6:	6913      	ldr	r3, [r2, #16]
 8a8:	f043 0304 	orr.w	r3, r3, #4
 8ac:	6113      	str	r3, [r2, #16]
 8ae:	6823      	ldr	r3, [r4, #0]
 8b0:	2200      	movs	r2, #0
 8b2:	611a      	str	r2, [r3, #16]
 8b4:	f015 0f08 	tst.w	r5, #8
 8b8:	d020      	beq.n	8fc <drv_uart_interrupt_handler+0x252>
 8ba:	7ce2      	ldrb	r2, [r4, #19]
 8bc:	7e23      	ldrb	r3, [r4, #24]
 8be:	429a      	cmp	r2, r3
 8c0:	d30c      	bcc.n	8dc <drv_uart_interrupt_handler+0x232>
 8c2:	6822      	ldr	r2, [r4, #0]
 8c4:	68d3      	ldr	r3, [r2, #12]
 8c6:	f023 030c 	bic.w	r3, r3, #12
 8ca:	60d3      	str	r3, [r2, #12]
 8cc:	e00b      	b.n	8e6 <drv_uart_interrupt_handler+0x23c>
 8ce:	69d9      	ldr	r1, [r3, #28]
 8d0:	6962      	ldr	r2, [r4, #20]
 8d2:	7ce3      	ldrb	r3, [r4, #19]
 8d4:	1c58      	adds	r0, r3, #1
 8d6:	74e0      	strb	r0, [r4, #19]
 8d8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8dc:	6823      	ldr	r3, [r4, #0]
 8de:	695a      	ldr	r2, [r3, #20]
 8e0:	f012 0f1f 	tst.w	r2, #31
 8e4:	d1f3      	bne.n	8ce <drv_uart_interrupt_handler+0x224>
 8e6:	4620      	mov	r0, r4
 8e8:	f7ff fedd 	bl	6a6 <uart_int_rx_fifo_noempty_callback>
 8ec:	6822      	ldr	r2, [r4, #0]
 8ee:	6913      	ldr	r3, [r2, #16]
 8f0:	f043 0308 	orr.w	r3, r3, #8
 8f4:	6113      	str	r3, [r2, #16]
 8f6:	6823      	ldr	r3, [r4, #0]
 8f8:	2200      	movs	r2, #0
 8fa:	611a      	str	r2, [r3, #16]
 8fc:	bd38      	pop	{r3, r4, r5, pc}
	...

00000900 <eth_mac_descriptor_hw_handle_prepare>:
 900:	b570      	push	{r4, r5, r6, lr}
 902:	4604      	mov	r4, r0
 904:	2601      	movs	r6, #1
 906:	4b0f      	ldr	r3, [pc, #60]	; (944 <eth_mac_descriptor_hw_handle_prepare+0x44>)
 908:	f883 6024 	strb.w	r6, [r3, #36]	; 0x24
 90c:	4d0e      	ldr	r5, [pc, #56]	; (948 <eth_mac_descriptor_hw_handle_prepare+0x48>)
 90e:	4628      	mov	r0, r5
 910:	f7ff fd35 	bl	37e <drv_eth_mac_tx_descriptor_default_config>
 914:	80ec      	strh	r4, [r5, #6]
 916:	72ae      	strb	r6, [r5, #10]
 918:	2400      	movs	r4, #0
 91a:	722c      	strb	r4, [r5, #8]
 91c:	726c      	strb	r4, [r5, #9]
 91e:	e00b      	b.n	938 <eth_mac_descriptor_hw_handle_prepare+0x38>
 920:	f104 0360 	add.w	r3, r4, #96	; 0x60
 924:	02db      	lsls	r3, r3, #11
 926:	4808      	ldr	r0, [pc, #32]	; (948 <eth_mac_descriptor_hw_handle_prepare+0x48>)
 928:	6003      	str	r3, [r0, #0]
 92a:	4908      	ldr	r1, [pc, #32]	; (94c <eth_mac_descriptor_hw_handle_prepare+0x4c>)
 92c:	eb01 1104 	add.w	r1, r1, r4, lsl #4
 930:	f7ff fd2e 	bl	390 <drv_eth_mac_tx_descriptor_config>
 934:	3401      	adds	r4, #1
 936:	b2e4      	uxtb	r4, r4
 938:	4b02      	ldr	r3, [pc, #8]	; (944 <eth_mac_descriptor_hw_handle_prepare+0x44>)
 93a:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
 93e:	42a3      	cmp	r3, r4
 940:	d8ee      	bhi.n	920 <eth_mac_descriptor_hw_handle_prepare+0x20>
 942:	bd70      	pop	{r4, r5, r6, pc}
 944:	000200d8 	ldrdeq	r0, [r2], -r8
 948:	00020104 	andeq	r0, r2, r4, lsl #2
 94c:	00020084 	andeq	r0, r2, r4, lsl #1

00000950 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare>:
 950:	b530      	push	{r4, r5, lr}
 952:	b083      	sub	sp, #12
 954:	4b1b      	ldr	r3, [pc, #108]	; (9c4 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x74>)
 956:	e893 0003 	ldmia.w	r3, {r0, r1}
 95a:	9000      	str	r0, [sp, #0]
 95c:	f8ad 1004 	strh.w	r1, [sp, #4]
 960:	4b19      	ldr	r3, [pc, #100]	; (9c8 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x78>)
 962:	2201      	movs	r2, #1
 964:	f883 2024 	strb.w	r2, [r3, #36]	; 0x24
 968:	4d18      	ldr	r5, [pc, #96]	; (9cc <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x7c>)
 96a:	4628      	mov	r0, r5
 96c:	f7ff fd07 	bl	37e <drv_eth_mac_tx_descriptor_default_config>
 970:	2332      	movs	r3, #50	; 0x32
 972:	80eb      	strh	r3, [r5, #6]
 974:	2302      	movs	r3, #2
 976:	72ab      	strb	r3, [r5, #10]
 978:	2400      	movs	r4, #0
 97a:	722c      	strb	r4, [r5, #8]
 97c:	726b      	strb	r3, [r5, #9]
 97e:	e00b      	b.n	998 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x48>
 980:	f104 0360 	add.w	r3, r4, #96	; 0x60
 984:	02db      	lsls	r3, r3, #11
 986:	4811      	ldr	r0, [pc, #68]	; (9cc <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x7c>)
 988:	6003      	str	r3, [r0, #0]
 98a:	4911      	ldr	r1, [pc, #68]	; (9d0 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x80>)
 98c:	eb01 1104 	add.w	r1, r1, r4, lsl #4
 990:	f7ff fcfe 	bl	390 <drv_eth_mac_tx_descriptor_config>
 994:	3401      	adds	r4, #1
 996:	b2e4      	uxtb	r4, r4
 998:	4b0b      	ldr	r3, [pc, #44]	; (9c8 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x78>)
 99a:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
 99e:	42a3      	cmp	r3, r4
 9a0:	d8ee      	bhi.n	980 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x30>
 9a2:	4c09      	ldr	r4, [pc, #36]	; (9c8 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare+0x78>)
 9a4:	4669      	mov	r1, sp
 9a6:	4620      	mov	r0, r4
 9a8:	f7ff fcc9 	bl	33e <drv_eth_mac_address_set>
 9ac:	6822      	ldr	r2, [r4, #0]
 9ae:	6813      	ldr	r3, [r2, #0]
 9b0:	f043 0302 	orr.w	r3, r3, #2
 9b4:	6013      	str	r3, [r2, #0]
 9b6:	6822      	ldr	r2, [r4, #0]
 9b8:	6813      	ldr	r3, [r2, #0]
 9ba:	f023 0302 	bic.w	r3, r3, #2
 9be:	6013      	str	r3, [r2, #0]
 9c0:	b003      	add	sp, #12
 9c2:	bd30      	pop	{r4, r5, pc}
 9c4:	00000d5c 	andeq	r0, r0, ip, asr sp
 9c8:	000200d8 	ldrdeq	r0, [r2], -r8
 9cc:	00020104 	andeq	r0, r2, r4, lsl #2
 9d0:	00020084 	andeq	r0, r2, r4, lsl #1

000009d4 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare>:
 9d4:	b570      	push	{r4, r5, r6, lr}
 9d6:	b082      	sub	sp, #8
 9d8:	4b1b      	ldr	r3, [pc, #108]	; (a48 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x74>)
 9da:	e893 0003 	ldmia.w	r3, {r0, r1}
 9de:	9000      	str	r0, [sp, #0]
 9e0:	f8ad 1004 	strh.w	r1, [sp, #4]
 9e4:	2601      	movs	r6, #1
 9e6:	4b19      	ldr	r3, [pc, #100]	; (a4c <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x78>)
 9e8:	f883 6024 	strb.w	r6, [r3, #36]	; 0x24
 9ec:	4d18      	ldr	r5, [pc, #96]	; (a50 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x7c>)
 9ee:	4628      	mov	r0, r5
 9f0:	f7ff fcc5 	bl	37e <drv_eth_mac_tx_descriptor_default_config>
 9f4:	232a      	movs	r3, #42	; 0x2a
 9f6:	80eb      	strh	r3, [r5, #6]
 9f8:	72ae      	strb	r6, [r5, #10]
 9fa:	2400      	movs	r4, #0
 9fc:	722c      	strb	r4, [r5, #8]
 9fe:	726e      	strb	r6, [r5, #9]
 a00:	e00b      	b.n	a1a <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x46>
 a02:	f104 0360 	add.w	r3, r4, #96	; 0x60
 a06:	02db      	lsls	r3, r3, #11
 a08:	4811      	ldr	r0, [pc, #68]	; (a50 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x7c>)
 a0a:	6003      	str	r3, [r0, #0]
 a0c:	4911      	ldr	r1, [pc, #68]	; (a54 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x80>)
 a0e:	eb01 1104 	add.w	r1, r1, r4, lsl #4
 a12:	f7ff fcbd 	bl	390 <drv_eth_mac_tx_descriptor_config>
 a16:	3401      	adds	r4, #1
 a18:	b2e4      	uxtb	r4, r4
 a1a:	4b0c      	ldr	r3, [pc, #48]	; (a4c <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x78>)
 a1c:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
 a20:	42a3      	cmp	r3, r4
 a22:	d8ee      	bhi.n	a02 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x2e>
 a24:	4c09      	ldr	r4, [pc, #36]	; (a4c <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare+0x78>)
 a26:	4669      	mov	r1, sp
 a28:	4620      	mov	r0, r4
 a2a:	f7ff fc88 	bl	33e <drv_eth_mac_address_set>
 a2e:	6822      	ldr	r2, [r4, #0]
 a30:	6813      	ldr	r3, [r2, #0]
 a32:	f043 0302 	orr.w	r3, r3, #2
 a36:	6013      	str	r3, [r2, #0]
 a38:	6822      	ldr	r2, [r4, #0]
 a3a:	6813      	ldr	r3, [r2, #0]
 a3c:	f023 0302 	bic.w	r3, r3, #2
 a40:	6013      	str	r3, [r2, #0]
 a42:	b002      	add	sp, #8
 a44:	bd70      	pop	{r4, r5, r6, pc}
 a46:	bf00      	nop
 a48:	00000d5c 	andeq	r0, r0, ip, asr sp
 a4c:	000200d8 	ldrdeq	r0, [r2], -r8
 a50:	00020104 	andeq	r0, r2, r4, lsl #2
 a54:	00020084 	andeq	r0, r2, r4, lsl #1

00000a58 <eth_mac_init>:
 a58:	b510      	push	{r4, lr}
 a5a:	4c08      	ldr	r4, [pc, #32]	; (a7c <eth_mac_init+0x24>)
 a5c:	4b08      	ldr	r3, [pc, #32]	; (a80 <eth_mac_init+0x28>)
 a5e:	6023      	str	r3, [r4, #0]
 a60:	4620      	mov	r0, r4
 a62:	f7ff fba7 	bl	1b4 <drv_eth_mac_dma_default_config>
 a66:	4620      	mov	r0, r4
 a68:	f7ff fbac 	bl	1c4 <drv_eth_mac_pe_default_config>
 a6c:	4620      	mov	r0, r4
 a6e:	f7ff fbfa 	bl	266 <drv_eth_mac_init>
 a72:	4620      	mov	r0, r4
 a74:	f7ff fcda 	bl	42c <drv_eth_mac_tx_descriptor_clear>
 a78:	bd10      	pop	{r4, pc}
 a7a:	bf00      	nop
 a7c:	000200d8 	ldrdeq	r0, [r2], -r8
 a80:	40020030 	andmi	r0, r2, r0, lsr r0

00000a84 <eth_mac_tx_normal_frame_data_prepare>:
 a84:	f010 0303 	ands.w	r3, r0, #3
 a88:	d001      	beq.n	a8e <eth_mac_tx_normal_frame_data_prepare+0xa>
 a8a:	1ac0      	subs	r0, r0, r3
 a8c:	3004      	adds	r0, #4
 a8e:	2300      	movs	r3, #0
 a90:	e011      	b.n	ab6 <eth_mac_tx_normal_frame_data_prepare+0x32>
 a92:	f503 3240 	add.w	r2, r3, #196608	; 0x30000
 a96:	b2d9      	uxtb	r1, r3
 a98:	7011      	strb	r1, [r2, #0]
 a9a:	f503 3c42 	add.w	ip, r3, #198656	; 0x30800
 a9e:	004a      	lsls	r2, r1, #1
 aa0:	b2d2      	uxtb	r2, r2
 aa2:	f88c 2000 	strb.w	r2, [ip]
 aa6:	f503 3c44 	add.w	ip, r3, #200704	; 0x31000
 aaa:	f88c 1000 	strb.w	r1, [ip]
 aae:	f503 3146 	add.w	r1, r3, #202752	; 0x31800
 ab2:	700a      	strb	r2, [r1, #0]
 ab4:	3301      	adds	r3, #1
 ab6:	4298      	cmp	r0, r3
 ab8:	d8eb      	bhi.n	a92 <eth_mac_tx_normal_frame_data_prepare+0xe>
 aba:	4770      	bx	lr

00000abc <eth_mac_tx_frame_data_prepare>:
 abc:	b500      	push	{lr}
 abe:	f012 0e03 	ands.w	lr, r2, #3
 ac2:	d008      	beq.n	ad6 <eth_mac_tx_frame_data_prepare+0x1a>
 ac4:	b2d3      	uxtb	r3, r2
 ac6:	eba3 0e0e 	sub.w	lr, r3, lr
 aca:	fa5f fe8e 	uxtb.w	lr, lr
 ace:	f10e 0e04 	add.w	lr, lr, #4
 ad2:	fa5f fe8e 	uxtb.w	lr, lr
 ad6:	f04f 0c00 	mov.w	ip, #0
 ada:	e005      	b.n	ae8 <eth_mac_tx_frame_data_prepare+0x2c>
 adc:	f811 300c 	ldrb.w	r3, [r1, ip]
 ae0:	f80c 3000 	strb.w	r3, [ip, r0]
 ae4:	f10c 0c01 	add.w	ip, ip, #1
 ae8:	4613      	mov	r3, r2
 aea:	4562      	cmp	r2, ip
 aec:	d8f6      	bhi.n	adc <eth_mac_tx_frame_data_prepare+0x20>
 aee:	e002      	b.n	af6 <eth_mac_tx_frame_data_prepare+0x3a>
 af0:	2200      	movs	r2, #0
 af2:	541a      	strb	r2, [r3, r0]
 af4:	3301      	adds	r3, #1
 af6:	459e      	cmp	lr, r3
 af8:	d8fa      	bhi.n	af0 <eth_mac_tx_frame_data_prepare+0x34>
 afa:	f85d fb04 	ldr.w	pc, [sp], #4
	...

00000b00 <eth_mac_tx_data_by_hw>:
 b00:	b510      	push	{r4, lr}
 b02:	4604      	mov	r4, r0
 b04:	f7ff ffbe 	bl	a84 <eth_mac_tx_normal_frame_data_prepare>
 b08:	f7ff ffa6 	bl	a58 <eth_mac_init>
 b0c:	4620      	mov	r0, r4
 b0e:	f7ff fef7 	bl	900 <eth_mac_descriptor_hw_handle_prepare>
 b12:	4909      	ldr	r1, [pc, #36]	; (b38 <eth_mac_tx_data_by_hw+0x38>)
 b14:	4809      	ldr	r0, [pc, #36]	; (b3c <eth_mac_tx_data_by_hw+0x3c>)
 b16:	f7ff fca7 	bl	468 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
 b1a:	4b08      	ldr	r3, [pc, #32]	; (b3c <eth_mac_tx_data_by_hw+0x3c>)
 b1c:	681b      	ldr	r3, [r3, #0]
 b1e:	f8d3 2118 	ldr.w	r2, [r3, #280]	; 0x118
 b22:	f012 0f01 	tst.w	r2, #1
 b26:	d0f8      	beq.n	b1a <eth_mac_tx_data_by_hw+0x1a>
 b28:	2207      	movs	r2, #7
 b2a:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
 b2e:	2200      	movs	r2, #0
 b30:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
 b34:	bd10      	pop	{r4, pc}
 b36:	bf00      	nop
 b38:	00020084 	andeq	r0, r2, r4, lsl #1
 b3c:	000200d8 	ldrdeq	r0, [r2], -r8

00000b40 <eth_mac_tx_ip_igmp_frame_by_hw_replacement>:
 b40:	b510      	push	{r4, lr}
 b42:	2232      	movs	r2, #50	; 0x32
 b44:	490a      	ldr	r1, [pc, #40]	; (b70 <eth_mac_tx_ip_igmp_frame_by_hw_replacement+0x30>)
 b46:	f44f 3040 	mov.w	r0, #196608	; 0x30000
 b4a:	f7ff ffb7 	bl	abc <eth_mac_tx_frame_data_prepare>
 b4e:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 b52:	2301      	movs	r3, #1
 b54:	6023      	str	r3, [r4, #0]
 b56:	f7ff ff7f 	bl	a58 <eth_mac_init>
 b5a:	2302      	movs	r3, #2
 b5c:	6023      	str	r3, [r4, #0]
 b5e:	f7ff fef7 	bl	950 <eth_mac_descriptor_ip_igmp_frame_replacement_hw_handle_prepare>
 b62:	2303      	movs	r3, #3
 b64:	6023      	str	r3, [r4, #0]
 b66:	4903      	ldr	r1, [pc, #12]	; (b74 <eth_mac_tx_ip_igmp_frame_by_hw_replacement+0x34>)
 b68:	4803      	ldr	r0, [pc, #12]	; (b78 <eth_mac_tx_ip_igmp_frame_by_hw_replacement+0x38>)
 b6a:	f7ff fc7d 	bl	468 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
 b6e:	bd10      	pop	{r4, pc}
 b70:	00000d90 	muleq	r0, r0, sp
 b74:	00020084 	andeq	r0, r2, r4, lsl #1
 b78:	000200d8 	ldrdeq	r0, [r2], -r8

00000b7c <eth_mac_tx_ip_igmp_frame_by_hw_insertion>:
 b7c:	b510      	push	{r4, lr}
 b7e:	222a      	movs	r2, #42	; 0x2a
 b80:	490a      	ldr	r1, [pc, #40]	; (bac <eth_mac_tx_ip_igmp_frame_by_hw_insertion+0x30>)
 b82:	f44f 3040 	mov.w	r0, #196608	; 0x30000
 b86:	f7ff ff99 	bl	abc <eth_mac_tx_frame_data_prepare>
 b8a:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 b8e:	2301      	movs	r3, #1
 b90:	6023      	str	r3, [r4, #0]
 b92:	f7ff ff61 	bl	a58 <eth_mac_init>
 b96:	2302      	movs	r3, #2
 b98:	6023      	str	r3, [r4, #0]
 b9a:	f7ff ff1b 	bl	9d4 <eth_mac_descriptor_ip_igmp_frame_insertion_hw_handle_prepare>
 b9e:	2303      	movs	r3, #3
 ba0:	6023      	str	r3, [r4, #0]
 ba2:	4903      	ldr	r1, [pc, #12]	; (bb0 <eth_mac_tx_ip_igmp_frame_by_hw_insertion+0x34>)
 ba4:	4803      	ldr	r0, [pc, #12]	; (bb4 <eth_mac_tx_ip_igmp_frame_by_hw_insertion+0x38>)
 ba6:	f7ff fc5f 	bl	468 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
 baa:	bd10      	pop	{r4, pc}
 bac:	00000d64 	andeq	r0, r0, r4, ror #26
 bb0:	00020084 	andeq	r0, r2, r4, lsl #1
 bb4:	000200d8 	ldrdeq	r0, [r2], -r8

00000bb8 <NMI_Handler>:
 bb8:	4770      	bx	lr

00000bba <HardFault_Handler>:
 bba:	e7fe      	b.n	bba <HardFault_Handler>

00000bbc <MemManage_Handler>:
 bbc:	e7fe      	b.n	bbc <MemManage_Handler>

00000bbe <BusFault_Handler>:
 bbe:	e7fe      	b.n	bbe <BusFault_Handler>

00000bc0 <UsageFault_Handler>:
 bc0:	e7fe      	b.n	bc0 <UsageFault_Handler>

00000bc2 <SVC_Handler>:
 bc2:	4770      	bx	lr

00000bc4 <DebugMon_Handler>:
 bc4:	4770      	bx	lr

00000bc6 <PendSV_Handler>:
 bc6:	4770      	bx	lr

00000bc8 <SysTick_Handler>:
 bc8:	4770      	bx	lr
	...

00000bcc <Uart0_Handler>:
 bcc:	b508      	push	{r3, lr}
 bce:	4b04      	ldr	r3, [pc, #16]	; (be0 <Uart0_Handler+0x14>)
 bd0:	2201      	movs	r2, #1
 bd2:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 bd6:	4803      	ldr	r0, [pc, #12]	; (be4 <Uart0_Handler+0x18>)
 bd8:	f7ff fd67 	bl	6aa <drv_uart_interrupt_handler>
 bdc:	bd08      	pop	{r3, pc}
 bde:	bf00      	nop
 be0:	e000e100 	and	lr, r0, r0, lsl #2
 be4:	00020110 	andeq	r0, r2, r0, lsl r1

00000be8 <EthSma_Handler>:
 be8:	b508      	push	{r3, lr}
 bea:	4b04      	ldr	r3, [pc, #16]	; (bfc <EthSma_Handler+0x14>)
 bec:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 bf0:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 bf4:	4802      	ldr	r0, [pc, #8]	; (c00 <EthSma_Handler+0x18>)
 bf6:	f7ff fa7a 	bl	ee <drv_eth_sma_interrupt_handler>
 bfa:	bd08      	pop	{r3, pc}
 bfc:	e000e100 	and	lr, r0, r0, lsl #2
 c00:	000200c4 	andeq	r0, r2, r4, asr #1

00000c04 <EthTx_Handler>:
 c04:	b508      	push	{r3, lr}
 c06:	4b04      	ldr	r3, [pc, #16]	; (c18 <EthTx_Handler+0x14>)
 c08:	f44f 5200 	mov.w	r2, #8192	; 0x2000
 c0c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 c10:	4802      	ldr	r0, [pc, #8]	; (c1c <EthTx_Handler+0x18>)
 c12:	f7ff fc42 	bl	49a <drv_eth_mac_tx_interrupt_handler>
 c16:	bd08      	pop	{r3, pc}
 c18:	e000e100 	and	lr, r0, r0, lsl #2
 c1c:	000200d8 	ldrdeq	r0, [r2], -r8

00000c20 <EthRx_Handler>:
 c20:	b508      	push	{r3, lr}
 c22:	4b04      	ldr	r3, [pc, #16]	; (c34 <EthRx_Handler+0x14>)
 c24:	f44f 4280 	mov.w	r2, #16384	; 0x4000
 c28:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 c2c:	4802      	ldr	r0, [pc, #8]	; (c38 <EthRx_Handler+0x18>)
 c2e:	f7ff fc52 	bl	4d6 <drv_eth_mac_rx_interrupt_handler>
 c32:	bd08      	pop	{r3, pc}
 c34:	e000e100 	and	lr, r0, r0, lsl #2
 c38:	000200d8 	ldrdeq	r0, [r2], -r8

00000c3c <EthDma_Handler>:
 c3c:	b508      	push	{r3, lr}
 c3e:	4b04      	ldr	r3, [pc, #16]	; (c50 <EthDma_Handler+0x14>)
 c40:	2210      	movs	r2, #16
 c42:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 c46:	4803      	ldr	r0, [pc, #12]	; (c54 <EthDma_Handler+0x18>)
 c48:	f7ff fc63 	bl	512 <drv_eth_mac_dma_interrupt_handler>
 c4c:	bd08      	pop	{r3, pc}
 c4e:	bf00      	nop
 c50:	e000e100 	and	lr, r0, r0, lsl #2
 c54:	000200d8 	ldrdeq	r0, [r2], -r8

00000c58 <main>:
 c58:	b508      	push	{r3, lr}
 c5a:	f000 f849 	bl	cf0 <uart0_init>
 c5e:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 c62:	23bd      	movs	r3, #189	; 0xbd
 c64:	60a3      	str	r3, [r4, #8]
 c66:	2050      	movs	r0, #80	; 0x50
 c68:	f7ff ff4a 	bl	b00 <eth_mac_tx_data_by_hw>
 c6c:	f7ff ff68 	bl	b40 <eth_mac_tx_ip_igmp_frame_by_hw_replacement>
 c70:	f7ff ff84 	bl	b7c <eth_mac_tx_ip_igmp_frame_by_hw_insertion>
 c74:	23ed      	movs	r3, #237	; 0xed
 c76:	60a3      	str	r3, [r4, #8]
 c78:	e7fe      	b.n	c78 <main+0x20>
	...

00000c7c <Reset_Handler>:
 c7c:	490a      	ldr	r1, [pc, #40]	; (ca8 <Reset_Handler+0x2c>)
 c7e:	4a0b      	ldr	r2, [pc, #44]	; (cac <Reset_Handler+0x30>)
 c80:	4b0b      	ldr	r3, [pc, #44]	; (cb0 <Reset_Handler+0x34>)
 c82:	1a9b      	subs	r3, r3, r2
 c84:	dd03      	ble.n	c8e <Reset_Handler+0x12>
 c86:	3b04      	subs	r3, #4
 c88:	58c8      	ldr	r0, [r1, r3]
 c8a:	50d0      	str	r0, [r2, r3]
 c8c:	dcfb      	bgt.n	c86 <Reset_Handler+0xa>
 c8e:	4909      	ldr	r1, [pc, #36]	; (cb4 <Reset_Handler+0x38>)
 c90:	4a09      	ldr	r2, [pc, #36]	; (cb8 <Reset_Handler+0x3c>)
 c92:	2000      	movs	r0, #0
 c94:	4291      	cmp	r1, r2
 c96:	bfbc      	itt	lt
 c98:	f841 0b04 	strlt.w	r0, [r1], #4
 c9c:	e7fa      	blt.n	c94 <Reset_Handler+0x18>
 c9e:	f7ff ffdb 	bl	c58 <main>
 ca2:	f000 f835 	bl	d10 <exit>
 ca6:	0dcc0000 	stcleq	0, cr0, [ip]
 caa:	00000000 	andeq	r0, r0, r0
 cae:	00680002 	rsbeq	r0, r8, r2
 cb2:	00680002 	rsbeq	r0, r8, r2
 cb6:	012c0002 			; <UNDEFINED> instruction: 0x012c0002
 cba:	e7fe0002 	ldrb	r0, [lr, r2]!
 cbe:	e7fe      	b.n	cbe <Reset_Handler+0x42>
 cc0:	e7fe      	b.n	cc0 <Reset_Handler+0x44>
 cc2:	e7fe      	b.n	cc2 <Reset_Handler+0x46>
 cc4:	e7fe      	b.n	cc4 <Reset_Handler+0x48>
 cc6:	e7fe      	b.n	cc6 <Reset_Handler+0x4a>
 cc8:	e7fe      	b.n	cc8 <Reset_Handler+0x4c>
 cca:	e7fe      	b.n	cca <Reset_Handler+0x4e>
 ccc:	e7fe      	b.n	ccc <Reset_Handler+0x50>
 cce:	e7fe      	b.n	cce <Reset_Handler+0x52>

00000cd0 <Uart1_Handler>:
 cd0:	e7fe      	b.n	cd0 <Uart1_Handler>

00000cd2 <Resv2_Handler>:
 cd2:	e7fe      	b.n	cd2 <Resv2_Handler>

00000cd4 <Resv3_Handler>:
 cd4:	e7fe      	b.n	cd4 <Resv3_Handler>
 cd6:	e7fe      	b.n	cd6 <Resv3_Handler+0x2>

00000cd8 <Gpioa_Handler>:
 cd8:	e7fe      	b.n	cd8 <Gpioa_Handler>

00000cda <Resv6_Handler>:
 cda:	e7fe      	b.n	cda <Resv6_Handler>

00000cdc <Resv7_Handler>:
 cdc:	e7fe      	b.n	cdc <Resv7_Handler>

00000cde <Bastim_Ch0_Handler>:
 cde:	e7fe      	b.n	cde <Bastim_Ch0_Handler>

00000ce0 <Bastim_Ch1_Handler>:
 ce0:	e7fe      	b.n	ce0 <Bastim_Ch1_Handler>

00000ce2 <Bastim_Ch2_Handler>:
 ce2:	e7fe      	b.n	ce2 <Bastim_Ch2_Handler>

00000ce4 <Bastim_Ch3_Handler>:
 ce4:	e7fe      	b.n	ce4 <Bastim_Ch3_Handler>
 ce6:	e7fe      	b.n	ce6 <Bastim_Ch3_Handler+0x2>
 ce8:	e7fe      	b.n	ce8 <Bastim_Ch3_Handler+0x4>
 cea:	e7fe      	b.n	cea <Bastim_Ch3_Handler+0x6>

00000cec <Resv15_Handler>:
 cec:	e7fe      	b.n	cec <Resv15_Handler>
 cee:	bf00      	nop

00000cf0 <uart0_init>:
 cf0:	b510      	push	{r4, lr}
 cf2:	4c05      	ldr	r4, [pc, #20]	; (d08 <uart0_init+0x18>)
 cf4:	4b05      	ldr	r3, [pc, #20]	; (d0c <uart0_init+0x1c>)
 cf6:	6023      	str	r3, [r4, #0]
 cf8:	4620      	mov	r0, r4
 cfa:	f7ff fc52 	bl	5a2 <drv_uart_default_config>
 cfe:	4620      	mov	r0, r4
 d00:	f7ff fc82 	bl	608 <drv_uart_init>
 d04:	bd10      	pop	{r4, pc}
 d06:	bf00      	nop
 d08:	00020110 	andeq	r0, r2, r0, lsl r1
 d0c:	40001000 	andmi	r1, r0, r0

00000d10 <exit>:
 d10:	b508      	push	{r3, lr}
 d12:	4b07      	ldr	r3, [pc, #28]	; (d30 <exit+0x20>)
 d14:	4604      	mov	r4, r0
 d16:	b113      	cbz	r3, d1e <exit+0xe>
 d18:	2100      	movs	r1, #0
 d1a:	f3af 8000 	nop.w
 d1e:	4b05      	ldr	r3, [pc, #20]	; (d34 <exit+0x24>)
 d20:	6818      	ldr	r0, [r3, #0]
 d22:	6a83      	ldr	r3, [r0, #40]	; 0x28
 d24:	b103      	cbz	r3, d28 <exit+0x18>
 d26:	4798      	blx	r3
 d28:	4620      	mov	r0, r4
 d2a:	f000 f805 	bl	d38 <_exit>
 d2e:	bf00      	nop
 d30:	00000000 	andeq	r0, r0, r0
 d34:	00000dc4 	andeq	r0, r0, r4, asr #27

00000d38 <_exit>:
 d38:	e7fe      	b.n	d38 <_exit>
 d3a:	bf00      	nop

00000d3c <_init>:
 d3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 d3e:	bf00      	nop
 d40:	bcf8      	pop	{r3, r4, r5, r6, r7}
 d42:	bc08      	pop	{r3}
 d44:	469e      	mov	lr, r3
 d46:	4770      	bx	lr

00000d48 <_fini>:
 d48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 d4a:	bf00      	nop
 d4c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 d4e:	bc08      	pop	{r3}
 d50:	469e      	mov	lr, r3
 d52:	4770      	bx	lr
 d54:	d6290c00 	strtle	r0, [r9], -r0, lsl #24
 d58:	00009722 	andeq	r9, r0, r2, lsr #14
 d5c:	85ba5000 	ldrhi	r5, [sl, #0]!
 d60:	0000b384 	andeq	fp, r0, r4, lsl #7

00000d64 <eth_igmp_hw_insertion_frame>:
 d64:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 d68:	0008ffff 	strdeq	pc, [r8], -pc	; <UNPREDICTABLE>
 d6c:	24000045 	strcs	r0, [r0], #-69	; 0xffffffbb
 d70:	00000100 	andeq	r0, r0, r0, lsl #2
 d74:	a8c00201 	stmiage	r0, {r0, r9}^
 d78:	00e00202 	rsceq	r0, r0, r2, lsl #4
 d7c:	00221600 	eoreq	r1, r2, r0, lsl #12
 d80:	0000fdea 	andeq	pc, r0, sl, ror #27
 d84:	00040100 	andeq	r0, r4, r0, lsl #2
 d88:	00ef0000 	rsceq	r0, pc, r0
 d8c:	00000000 	andeq	r0, r0, r0

00000d90 <eth_igmp_hw_replacement_frame>:
 d90:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 d94:	0201ffff 	andeq	pc, r1, #1020	; 0x3fc
 d98:	06050403 	streq	r0, [r5], -r3, lsl #8
 d9c:	00450008 	subeq	r0, r5, r8
 da0:	01002400 	tsteq	r0, r0, lsl #8
 da4:	02010000 	andeq	r0, r1, #0
 da8:	a8c00000 	stmiage	r0, {}^	; <UNPREDICTABLE>
 dac:	00e00202 	rsceq	r0, r0, r2, lsl #4
 db0:	00221600 	eoreq	r1, r2, r0, lsl #12
 db4:	0000fdea 	andeq	pc, r0, sl, ror #27
 db8:	00040100 	andeq	r0, r4, r0, lsl #2
 dbc:	00ef0000 	rsceq	r0, pc, r0
 dc0:	00000000 	andeq	r0, r0, r0

00000dc4 <_global_impure_ptr>:
 dc4:	00020000 	andeq	r0, r2, r0

00000dc8 <__EH_FRAME_BEGIN__>:
 dc8:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <impure_data>:
	...

00020060 <__frame_dummy_init_array_entry>:
   20060:	000000a5 	andeq	r0, r0, r5, lsr #1

00020064 <__do_global_dtors_aux_fini_array_entry>:
   20064:	00000081 	andeq	r0, r0, r1, lsl #1

Disassembly of section .bss:

00020068 <__bss_start__>:
   20068:	00000000 	andeq	r0, r0, r0

0002006c <object.0>:
	...

00020084 <EthDmaTxDesc>:
	...

000200c4 <heth>:
	...

000200d8 <hethmac>:
	...

00020104 <hethmac_desccfg>:
	...

00020110 <huart0>:
	...

Disassembly of section .stack_dummy:

00020130 <__HeapBase>:
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
   0:	3a434347 	bcc	10d0d24 <__StackTop+0x10aed24>
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
  18:	00000d10 	andeq	r0, r0, r0, lsl sp
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000d38 	andeq	r0, r0, r8, lsr sp
  44:	00000002 	andeq	r0, r0, r2

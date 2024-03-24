
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00022000 	andeq	r2, r2, r0
   4:	000007e5 	andeq	r0, r0, r5, ror #15
   8:	00000775 	andeq	r0, r0, r5, ror r7
   c:	00000777 	andeq	r0, r0, r7, ror r7
  10:	00000779 	andeq	r0, r0, r9, ror r7
  14:	0000077b 	andeq	r0, r0, fp, ror r7
  18:	0000077d 	andeq	r0, r0, sp, ror r7
	...
  2c:	0000077f 	andeq	r0, r0, pc, ror r7
  30:	00000781 	andeq	r0, r0, r1, lsl #15
  34:	00000000 	andeq	r0, r0, r0
  38:	00000783 	andeq	r0, r0, r3, lsl #15
  3c:	00000785 	andeq	r0, r0, r5, lsl #15
  40:	00000789 	andeq	r0, r0, r9, lsl #15
  44:	00000839 	andeq	r0, r0, r9, lsr r8
  48:	0000083b 	andeq	r0, r0, fp, lsr r8
  4c:	0000083d 	andeq	r0, r0, sp, lsr r8
  50:	0000083f 	andeq	r0, r0, pc, lsr r8
  54:	00000841 	andeq	r0, r0, r1, asr #16
  58:	00000843 	andeq	r0, r0, r3, asr #16
  5c:	00000845 	andeq	r0, r0, r5, asr #16
  60:	00000847 	andeq	r0, r0, r7, asr #16
  64:	00000849 	andeq	r0, r0, r9, asr #16
  68:	0000084b 	andeq	r0, r0, fp, asr #16
  6c:	0000084d 	andeq	r0, r0, sp, asr #16
  70:	000007a5 	andeq	r0, r0, r5, lsr #15
  74:	00000851 	andeq	r0, r0, r1, asr r8

00000078 <__do_global_dtors_aux>:
  78:	b510      	push	{r4, lr}
  7a:	4c05      	ldr	r4, [pc, #20]	; (90 <__do_global_dtors_aux+0x18>)
  7c:	7823      	ldrb	r3, [r4, #0]
  7e:	b933      	cbnz	r3, 8e <__do_global_dtors_aux+0x16>
  80:	4b04      	ldr	r3, [pc, #16]	; (94 <__do_global_dtors_aux+0x1c>)
  82:	b113      	cbz	r3, 8a <__do_global_dtors_aux+0x12>
  84:	4804      	ldr	r0, [pc, #16]	; (98 <__do_global_dtors_aux+0x20>)
  86:	f3af 8000 	nop.w
  8a:	2301      	movs	r3, #1
  8c:	7023      	strb	r3, [r4, #0]
  8e:	bd10      	pop	{r4, pc}
  90:	00020090 	muleq	r2, r0, r0
  94:	00000000 	andeq	r0, r0, r0
  98:	000008e4 	andeq	r0, r0, r4, ror #17

0000009c <frame_dummy>:
  9c:	b508      	push	{r3, lr}
  9e:	4b03      	ldr	r3, [pc, #12]	; (ac <frame_dummy+0x10>)
  a0:	b11b      	cbz	r3, aa <frame_dummy+0xe>
  a2:	4903      	ldr	r1, [pc, #12]	; (b0 <frame_dummy+0x14>)
  a4:	4803      	ldr	r0, [pc, #12]	; (b4 <frame_dummy+0x18>)
  a6:	f3af 8000 	nop.w
  aa:	bd08      	pop	{r3, pc}
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00020094 	muleq	r2, r4, r0
  b4:	000008e4 	andeq	r0, r0, r4, ror #17

000000b8 <drv_check_rw_data>:
  b8:	6001      	str	r1, [r0, #0]
  ba:	6803      	ldr	r3, [r0, #0]
  bc:	4293      	cmp	r3, r2
  be:	d007      	beq.n	d0 <drv_check_rw_data+0x18>
  c0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  c4:	2001      	movs	r0, #1
  c6:	6018      	str	r0, [r3, #0]
  c8:	685a      	ldr	r2, [r3, #4]
  ca:	4402      	add	r2, r0
  cc:	601a      	str	r2, [r3, #0]
  ce:	4770      	bx	lr
  d0:	2000      	movs	r0, #0
  d2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  d6:	6018      	str	r0, [r3, #0]
  d8:	4770      	bx	lr

000000da <drv_eth_sma_default_config>:
  da:	2314      	movs	r3, #20
  dc:	7103      	strb	r3, [r0, #4]
  de:	2303      	movs	r3, #3
  e0:	7183      	strb	r3, [r0, #6]
  e2:	4770      	bx	lr

000000e4 <drv_eth_sma_set_config>:
  e4:	b508      	push	{r3, lr}
  e6:	7902      	ldrb	r2, [r0, #4]
  e8:	7941      	ldrb	r1, [r0, #5]
  ea:	0409      	lsls	r1, r1, #16
  ec:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
  f0:	7982      	ldrb	r2, [r0, #6]
  f2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
  f6:	6800      	ldr	r0, [r0, #0]
  f8:	460a      	mov	r2, r1
  fa:	3008      	adds	r0, #8
  fc:	f7ff ffdc 	bl	b8 <drv_check_rw_data>
 100:	bd08      	pop	{r3, pc}

00000102 <drv_eth_sma_init>:
 102:	b538      	push	{r3, r4, r5, lr}
 104:	4604      	mov	r4, r0
 106:	2500      	movs	r5, #0
 108:	7245      	strb	r5, [r0, #9]
 10a:	7285      	strb	r5, [r0, #10]
 10c:	f7ff ffea 	bl	e4 <drv_eth_sma_set_config>
 110:	71e5      	strb	r5, [r4, #7]
 112:	7265      	strb	r5, [r4, #9]
 114:	72a5      	strb	r5, [r4, #10]
 116:	6822      	ldr	r2, [r4, #0]
 118:	6853      	ldr	r3, [r2, #4]
 11a:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 11e:	6053      	str	r3, [r2, #4]
 120:	6822      	ldr	r2, [r4, #0]
 122:	6853      	ldr	r3, [r2, #4]
 124:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 128:	6053      	str	r3, [r2, #4]
 12a:	6822      	ldr	r2, [r4, #0]
 12c:	6853      	ldr	r3, [r2, #4]
 12e:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 132:	6053      	str	r3, [r2, #4]
 134:	6822      	ldr	r2, [r4, #0]
 136:	6853      	ldr	r3, [r2, #4]
 138:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 13c:	6053      	str	r3, [r2, #4]
 13e:	6822      	ldr	r2, [r4, #0]
 140:	6853      	ldr	r3, [r2, #4]
 142:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 146:	6053      	str	r3, [r2, #4]
 148:	6822      	ldr	r2, [r4, #0]
 14a:	6853      	ldr	r3, [r2, #4]
 14c:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 150:	6053      	str	r3, [r2, #4]
 152:	6823      	ldr	r3, [r4, #0]
 154:	221f      	movs	r2, #31
 156:	611a      	str	r2, [r3, #16]
 158:	6823      	ldr	r3, [r4, #0]
 15a:	611d      	str	r5, [r3, #16]
 15c:	6822      	ldr	r2, [r4, #0]
 15e:	6853      	ldr	r3, [r2, #4]
 160:	f043 0301 	orr.w	r3, r3, #1
 164:	6053      	str	r3, [r2, #4]
 166:	6822      	ldr	r2, [r4, #0]
 168:	6853      	ldr	r3, [r2, #4]
 16a:	f023 0301 	bic.w	r3, r3, #1
 16e:	6053      	str	r3, [r2, #4]
 170:	bd38      	pop	{r3, r4, r5, pc}

00000172 <drv_eth_sma_master_write_reglist>:
 172:	b410      	push	{r4}
 174:	2300      	movs	r3, #0
 176:	7243      	strb	r3, [r0, #9]
 178:	f890 c009 	ldrb.w	ip, [r0, #9]
 17c:	4594      	cmp	ip, r2
 17e:	d20e      	bcs.n	19e <drv_eth_sma_master_write_reglist+0x2c>
 180:	6804      	ldr	r4, [r0, #0]
 182:	6963      	ldr	r3, [r4, #20]
 184:	0a1b      	lsrs	r3, r3, #8
 186:	f013 0f06 	tst.w	r3, #6
 18a:	d1f5      	bne.n	178 <drv_eth_sma_master_write_reglist+0x6>
 18c:	f10c 0301 	add.w	r3, ip, #1
 190:	7243      	strb	r3, [r0, #9]
 192:	f851 302c 	ldr.w	r3, [r1, ip, lsl #2]
 196:	f443 1300 	orr.w	r3, r3, #2097152	; 0x200000
 19a:	6023      	str	r3, [r4, #0]
 19c:	e7ec      	b.n	178 <drv_eth_sma_master_write_reglist+0x6>
 19e:	6803      	ldr	r3, [r0, #0]
 1a0:	699a      	ldr	r2, [r3, #24]
 1a2:	f012 0f10 	tst.w	r2, #16
 1a6:	d0fa      	beq.n	19e <drv_eth_sma_master_write_reglist+0x2c>
 1a8:	691a      	ldr	r2, [r3, #16]
 1aa:	f042 0210 	orr.w	r2, r2, #16
 1ae:	611a      	str	r2, [r3, #16]
 1b0:	6803      	ldr	r3, [r0, #0]
 1b2:	2200      	movs	r2, #0
 1b4:	611a      	str	r2, [r3, #16]
 1b6:	bc10      	pop	{r4}
 1b8:	4770      	bx	lr

000001ba <drv_eth_sma_master_read_reglist>:
 1ba:	b510      	push	{r4, lr}
 1bc:	4694      	mov	ip, r2
 1be:	2300      	movs	r3, #0
 1c0:	7283      	strb	r3, [r0, #10]
 1c2:	f890 e00a 	ldrb.w	lr, [r0, #10]
 1c6:	45e6      	cmp	lr, ip
 1c8:	d24c      	bcs.n	264 <Stack_Size+0x64>
 1ca:	6803      	ldr	r3, [r0, #0]
 1cc:	695a      	ldr	r2, [r3, #20]
 1ce:	f412 6fe0 	tst.w	r2, #1792	; 0x700
 1d2:	d1fa      	bne.n	1ca <drv_eth_sma_master_read_reglist+0x10>
 1d4:	f851 202e 	ldr.w	r2, [r1, lr, lsl #2]
 1d8:	f442 0280 	orr.w	r2, r2, #4194304	; 0x400000
 1dc:	601a      	str	r2, [r3, #0]
 1de:	6803      	ldr	r3, [r0, #0]
 1e0:	695b      	ldr	r3, [r3, #20]
 1e2:	f013 0f07 	tst.w	r3, #7
 1e6:	d0fa      	beq.n	1de <drv_eth_sma_master_read_reglist+0x24>
 1e8:	7a82      	ldrb	r2, [r0, #10]
 1ea:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
 1ee:	0c1b      	lsrs	r3, r3, #16
 1f0:	041b      	lsls	r3, r3, #16
 1f2:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 1f6:	6803      	ldr	r3, [r0, #0]
 1f8:	69da      	ldr	r2, [r3, #28]
 1fa:	7a83      	ldrb	r3, [r0, #10]
 1fc:	f103 0e01 	add.w	lr, r3, #1
 200:	f880 e00a 	strb.w	lr, [r0, #10]
 204:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
 208:	4322      	orrs	r2, r4
 20a:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 20e:	6803      	ldr	r3, [r0, #0]
 210:	699b      	ldr	r3, [r3, #24]
 212:	f013 0f20 	tst.w	r3, #32
 216:	d0d4      	beq.n	1c2 <drv_eth_sma_master_read_reglist+0x8>
 218:	2300      	movs	r3, #0
 21a:	71c3      	strb	r3, [r0, #7]
 21c:	7243      	strb	r3, [r0, #9]
 21e:	7283      	strb	r3, [r0, #10]
 220:	6802      	ldr	r2, [r0, #0]
 222:	6853      	ldr	r3, [r2, #4]
 224:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 228:	6053      	str	r3, [r2, #4]
 22a:	6802      	ldr	r2, [r0, #0]
 22c:	6853      	ldr	r3, [r2, #4]
 22e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 232:	6053      	str	r3, [r2, #4]
 234:	6802      	ldr	r2, [r0, #0]
 236:	6853      	ldr	r3, [r2, #4]
 238:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 23c:	6053      	str	r3, [r2, #4]
 23e:	6802      	ldr	r2, [r0, #0]
 240:	6853      	ldr	r3, [r2, #4]
 242:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 246:	6053      	str	r3, [r2, #4]
 248:	6802      	ldr	r2, [r0, #0]
 24a:	6853      	ldr	r3, [r2, #4]
 24c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 250:	6053      	str	r3, [r2, #4]
 252:	6802      	ldr	r2, [r0, #0]
 254:	6853      	ldr	r3, [r2, #4]
 256:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 25a:	6053      	str	r3, [r2, #4]
 25c:	2302      	movs	r3, #2
 25e:	71c3      	strb	r3, [r0, #7]
 260:	2001      	movs	r0, #1
 262:	e00b      	b.n	27c <Stack_Size+0x7c>
 264:	6803      	ldr	r3, [r0, #0]
 266:	699a      	ldr	r2, [r3, #24]
 268:	f012 0f10 	tst.w	r2, #16
 26c:	d0fa      	beq.n	264 <Stack_Size+0x64>
 26e:	691a      	ldr	r2, [r3, #16]
 270:	f042 0210 	orr.w	r2, r2, #16
 274:	611a      	str	r2, [r3, #16]
 276:	6803      	ldr	r3, [r0, #0]
 278:	2000      	movs	r0, #0
 27a:	6118      	str	r0, [r3, #16]
 27c:	bd10      	pop	{r4, pc}

0000027e <eth_sma_int_rx_turn_nack_callback>:
 27e:	4770      	bx	lr

00000280 <eth_sma_int_master_frame_done_callback>:
 280:	4770      	bx	lr

00000282 <eth_sma_int_tx_fifo_empty_callback>:
 282:	4770      	bx	lr

00000284 <eth_sma_int_tx_fifo_thres_callback>:
 284:	4770      	bx	lr

00000286 <eth_sma_int_rx_fifo_noempty_callback>:
 286:	4770      	bx	lr

00000288 <eth_sma_int_rx_fifo_thres_callback>:
 288:	4770      	bx	lr

0000028a <drv_eth_sma_interrupt_handler>:
 28a:	b538      	push	{r3, r4, r5, lr}
 28c:	4604      	mov	r4, r0
 28e:	6803      	ldr	r3, [r0, #0]
 290:	699d      	ldr	r5, [r3, #24]
 292:	68db      	ldr	r3, [r3, #12]
 294:	b2db      	uxtb	r3, r3
 296:	401d      	ands	r5, r3
 298:	f015 0f20 	tst.w	r5, #32
 29c:	d10f      	bne.n	2be <drv_eth_sma_interrupt_handler+0x34>
 29e:	f015 0f10 	tst.w	r5, #16
 2a2:	d119      	bne.n	2d8 <drv_eth_sma_interrupt_handler+0x4e>
 2a4:	f015 0f01 	tst.w	r5, #1
 2a8:	d122      	bne.n	2f0 <drv_eth_sma_interrupt_handler+0x66>
 2aa:	f015 0f02 	tst.w	r5, #2
 2ae:	d12b      	bne.n	308 <drv_eth_sma_interrupt_handler+0x7e>
 2b0:	f015 0f04 	tst.w	r5, #4
 2b4:	d134      	bne.n	320 <drv_eth_sma_interrupt_handler+0x96>
 2b6:	f015 0f08 	tst.w	r5, #8
 2ba:	d13d      	bne.n	338 <drv_eth_sma_interrupt_handler+0xae>
 2bc:	bd38      	pop	{r3, r4, r5, pc}
 2be:	2302      	movs	r3, #2
 2c0:	71c3      	strb	r3, [r0, #7]
 2c2:	f7ff ffdc 	bl	27e <eth_sma_int_rx_turn_nack_callback>
 2c6:	6822      	ldr	r2, [r4, #0]
 2c8:	6913      	ldr	r3, [r2, #16]
 2ca:	f043 0320 	orr.w	r3, r3, #32
 2ce:	6113      	str	r3, [r2, #16]
 2d0:	6823      	ldr	r3, [r4, #0]
 2d2:	2200      	movs	r2, #0
 2d4:	611a      	str	r2, [r3, #16]
 2d6:	e7e2      	b.n	29e <drv_eth_sma_interrupt_handler+0x14>
 2d8:	4620      	mov	r0, r4
 2da:	f7ff ffd1 	bl	280 <eth_sma_int_master_frame_done_callback>
 2de:	6822      	ldr	r2, [r4, #0]
 2e0:	6913      	ldr	r3, [r2, #16]
 2e2:	f043 0310 	orr.w	r3, r3, #16
 2e6:	6113      	str	r3, [r2, #16]
 2e8:	6823      	ldr	r3, [r4, #0]
 2ea:	2200      	movs	r2, #0
 2ec:	611a      	str	r2, [r3, #16]
 2ee:	e7d9      	b.n	2a4 <drv_eth_sma_interrupt_handler+0x1a>
 2f0:	4620      	mov	r0, r4
 2f2:	f7ff ffc7 	bl	284 <eth_sma_int_tx_fifo_thres_callback>
 2f6:	6822      	ldr	r2, [r4, #0]
 2f8:	6913      	ldr	r3, [r2, #16]
 2fa:	f043 0301 	orr.w	r3, r3, #1
 2fe:	6113      	str	r3, [r2, #16]
 300:	6823      	ldr	r3, [r4, #0]
 302:	2200      	movs	r2, #0
 304:	611a      	str	r2, [r3, #16]
 306:	e7d0      	b.n	2aa <drv_eth_sma_interrupt_handler+0x20>
 308:	4620      	mov	r0, r4
 30a:	f7ff ffba 	bl	282 <eth_sma_int_tx_fifo_empty_callback>
 30e:	6822      	ldr	r2, [r4, #0]
 310:	6913      	ldr	r3, [r2, #16]
 312:	f043 0302 	orr.w	r3, r3, #2
 316:	6113      	str	r3, [r2, #16]
 318:	6823      	ldr	r3, [r4, #0]
 31a:	2200      	movs	r2, #0
 31c:	611a      	str	r2, [r3, #16]
 31e:	e7c7      	b.n	2b0 <drv_eth_sma_interrupt_handler+0x26>
 320:	4620      	mov	r0, r4
 322:	f7ff ffb1 	bl	288 <eth_sma_int_rx_fifo_thres_callback>
 326:	6822      	ldr	r2, [r4, #0]
 328:	6913      	ldr	r3, [r2, #16]
 32a:	f043 0304 	orr.w	r3, r3, #4
 32e:	6113      	str	r3, [r2, #16]
 330:	6823      	ldr	r3, [r4, #0]
 332:	2200      	movs	r2, #0
 334:	611a      	str	r2, [r3, #16]
 336:	e7be      	b.n	2b6 <drv_eth_sma_interrupt_handler+0x2c>
 338:	4620      	mov	r0, r4
 33a:	f7ff ffa4 	bl	286 <eth_sma_int_rx_fifo_noempty_callback>
 33e:	6822      	ldr	r2, [r4, #0]
 340:	6913      	ldr	r3, [r2, #16]
 342:	f043 0308 	orr.w	r3, r3, #8
 346:	6113      	str	r3, [r2, #16]
 348:	6823      	ldr	r3, [r4, #0]
 34a:	2200      	movs	r2, #0
 34c:	611a      	str	r2, [r3, #16]
 34e:	e7b5      	b.n	2bc <drv_eth_sma_interrupt_handler+0x32>

00000350 <drv_uart_default_config>:
 350:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 354:	6043      	str	r3, [r0, #4]
 356:	230f      	movs	r3, #15
 358:	7203      	strb	r3, [r0, #8]
 35a:	2300      	movs	r3, #0
 35c:	7243      	strb	r3, [r0, #9]
 35e:	7283      	strb	r3, [r0, #10]
 360:	72c3      	strb	r3, [r0, #11]
 362:	7303      	strb	r3, [r0, #12]
 364:	7343      	strb	r3, [r0, #13]
 366:	2301      	movs	r3, #1
 368:	7383      	strb	r3, [r0, #14]
 36a:	4770      	bx	lr

0000036c <drv_uart_set_config>:
 36c:	b508      	push	{r3, lr}
 36e:	6841      	ldr	r1, [r0, #4]
 370:	7a03      	ldrb	r3, [r0, #8]
 372:	fb03 f201 	mul.w	r2, r3, r1
 376:	490e      	ldr	r1, [pc, #56]	; (3b0 <drv_uart_set_config+0x44>)
 378:	fbb1 f2f2 	udiv	r2, r1, r2
 37c:	0419      	lsls	r1, r3, #16
 37e:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 382:	7a43      	ldrb	r3, [r0, #9]
 384:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 388:	7a83      	ldrb	r3, [r0, #10]
 38a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 38e:	7ac3      	ldrb	r3, [r0, #11]
 390:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 394:	7b03      	ldrb	r3, [r0, #12]
 396:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 39a:	7b42      	ldrb	r2, [r0, #13]
 39c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 3a0:	7b82      	ldrb	r2, [r0, #14]
 3a2:	4311      	orrs	r1, r2
 3a4:	6800      	ldr	r0, [r0, #0]
 3a6:	460a      	mov	r2, r1
 3a8:	3008      	adds	r0, #8
 3aa:	f7ff fe85 	bl	b8 <drv_check_rw_data>
 3ae:	bd08      	pop	{r3, pc}
 3b0:	02625a00 	rsbeq	r5, r2, #0, 20

000003b4 <drv_uart_init>:
 3b4:	b538      	push	{r3, r4, r5, lr}
 3b6:	4604      	mov	r4, r0
 3b8:	2500      	movs	r5, #0
 3ba:	7485      	strb	r5, [r0, #18]
 3bc:	74c5      	strb	r5, [r0, #19]
 3be:	f7ff ffd5 	bl	36c <drv_uart_set_config>
 3c2:	7425      	strb	r5, [r4, #16]
 3c4:	74a5      	strb	r5, [r4, #18]
 3c6:	74e5      	strb	r5, [r4, #19]
 3c8:	6822      	ldr	r2, [r4, #0]
 3ca:	6853      	ldr	r3, [r2, #4]
 3cc:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 3d0:	6053      	str	r3, [r2, #4]
 3d2:	6822      	ldr	r2, [r4, #0]
 3d4:	6853      	ldr	r3, [r2, #4]
 3d6:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 3da:	6053      	str	r3, [r2, #4]
 3dc:	6822      	ldr	r2, [r4, #0]
 3de:	6853      	ldr	r3, [r2, #4]
 3e0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 3e4:	6053      	str	r3, [r2, #4]
 3e6:	6822      	ldr	r2, [r4, #0]
 3e8:	6853      	ldr	r3, [r2, #4]
 3ea:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 3ee:	6053      	str	r3, [r2, #4]
 3f0:	6822      	ldr	r2, [r4, #0]
 3f2:	6853      	ldr	r3, [r2, #4]
 3f4:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 3f8:	6053      	str	r3, [r2, #4]
 3fa:	6822      	ldr	r2, [r4, #0]
 3fc:	6853      	ldr	r3, [r2, #4]
 3fe:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 402:	6053      	str	r3, [r2, #4]
 404:	6822      	ldr	r2, [r4, #0]
 406:	6853      	ldr	r3, [r2, #4]
 408:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 40c:	6053      	str	r3, [r2, #4]
 40e:	6822      	ldr	r2, [r4, #0]
 410:	6853      	ldr	r3, [r2, #4]
 412:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 416:	6053      	str	r3, [r2, #4]
 418:	6823      	ldr	r3, [r4, #0]
 41a:	f240 12ff 	movw	r2, #511	; 0x1ff
 41e:	611a      	str	r2, [r3, #16]
 420:	6823      	ldr	r3, [r4, #0]
 422:	611d      	str	r5, [r3, #16]
 424:	6822      	ldr	r2, [r4, #0]
 426:	6853      	ldr	r3, [r2, #4]
 428:	f043 0301 	orr.w	r3, r3, #1
 42c:	6053      	str	r3, [r2, #4]
 42e:	6822      	ldr	r2, [r4, #0]
 430:	6853      	ldr	r3, [r2, #4]
 432:	f023 0301 	bic.w	r3, r3, #1
 436:	6053      	str	r3, [r2, #4]
 438:	6822      	ldr	r2, [r4, #0]
 43a:	6853      	ldr	r3, [r2, #4]
 43c:	f043 0302 	orr.w	r3, r3, #2
 440:	6053      	str	r3, [r2, #4]
 442:	bd38      	pop	{r3, r4, r5, pc}

00000444 <uart_int_tx_done_callback>:
 444:	4770      	bx	lr

00000446 <uart_int_rx_stop_callback>:
 446:	4770      	bx	lr

00000448 <uart_int_rx_parity_error_callback>:
 448:	4770      	bx	lr

0000044a <uart_int_rx_noise_detect_callback>:
 44a:	4770      	bx	lr

0000044c <uart_int_rx_stop_detect_callback>:
 44c:	4770      	bx	lr

0000044e <uart_int_tx_fifo_empty_callback>:
 44e:	4770      	bx	lr

00000450 <uart_int_tx_fifo_thres_callback>:
 450:	4770      	bx	lr

00000452 <uart_int_rx_fifo_noempty_callback>:
 452:	4770      	bx	lr

00000454 <uart_int_rx_fifo_thres_callback>:
 454:	4770      	bx	lr

00000456 <drv_uart_interrupt_handler>:
 456:	b538      	push	{r3, r4, r5, lr}
 458:	4604      	mov	r4, r0
 45a:	6803      	ldr	r3, [r0, #0]
 45c:	699d      	ldr	r5, [r3, #24]
 45e:	68db      	ldr	r3, [r3, #12]
 460:	b29b      	uxth	r3, r3
 462:	401d      	ands	r5, r3
 464:	f415 7f80 	tst.w	r5, #256	; 0x100
 468:	d144      	bne.n	4f4 <drv_uart_interrupt_handler+0x9e>
 46a:	f015 0f40 	tst.w	r5, #64	; 0x40
 46e:	d00f      	beq.n	490 <drv_uart_interrupt_handler+0x3a>
 470:	2301      	movs	r3, #1
 472:	7423      	strb	r3, [r4, #16]
 474:	7aa3      	ldrb	r3, [r4, #10]
 476:	2b01      	cmp	r3, #1
 478:	d147      	bne.n	50a <drv_uart_interrupt_handler+0xb4>
 47a:	4620      	mov	r0, r4
 47c:	f7ff ffe3 	bl	446 <uart_int_rx_stop_callback>
 480:	6822      	ldr	r2, [r4, #0]
 482:	6913      	ldr	r3, [r2, #16]
 484:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 488:	6113      	str	r3, [r2, #16]
 48a:	6823      	ldr	r3, [r4, #0]
 48c:	2200      	movs	r2, #0
 48e:	611a      	str	r2, [r3, #16]
 490:	f015 0f80 	tst.w	r5, #128	; 0x80
 494:	d00f      	beq.n	4b6 <drv_uart_interrupt_handler+0x60>
 496:	2302      	movs	r3, #2
 498:	7423      	strb	r3, [r4, #16]
 49a:	7aa3      	ldrb	r3, [r4, #10]
 49c:	2b01      	cmp	r3, #1
 49e:	d166      	bne.n	56e <drv_uart_interrupt_handler+0x118>
 4a0:	4620      	mov	r0, r4
 4a2:	f7ff ffd1 	bl	448 <uart_int_rx_parity_error_callback>
 4a6:	6822      	ldr	r2, [r4, #0]
 4a8:	6913      	ldr	r3, [r2, #16]
 4aa:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 4ae:	6113      	str	r3, [r2, #16]
 4b0:	6823      	ldr	r3, [r4, #0]
 4b2:	2200      	movs	r2, #0
 4b4:	611a      	str	r2, [r3, #16]
 4b6:	f015 0f20 	tst.w	r5, #32
 4ba:	f040 808a 	bne.w	5d2 <drv_uart_interrupt_handler+0x17c>
 4be:	f015 0f10 	tst.w	r5, #16
 4c2:	f040 8092 	bne.w	5ea <drv_uart_interrupt_handler+0x194>
 4c6:	f015 0f01 	tst.w	r5, #1
 4ca:	f040 809a 	bne.w	602 <drv_uart_interrupt_handler+0x1ac>
 4ce:	f015 0f02 	tst.w	r5, #2
 4d2:	f040 80a2 	bne.w	61a <drv_uart_interrupt_handler+0x1c4>
 4d6:	f015 0f04 	tst.w	r5, #4
 4da:	f000 80c1 	beq.w	660 <drv_uart_interrupt_handler+0x20a>
 4de:	7ce2      	ldrb	r2, [r4, #19]
 4e0:	7e23      	ldrb	r3, [r4, #24]
 4e2:	429a      	cmp	r2, r3
 4e4:	f0c0 80ac 	bcc.w	640 <drv_uart_interrupt_handler+0x1ea>
 4e8:	6822      	ldr	r2, [r4, #0]
 4ea:	68d3      	ldr	r3, [r2, #12]
 4ec:	f023 030c 	bic.w	r3, r3, #12
 4f0:	60d3      	str	r3, [r2, #12]
 4f2:	e0aa      	b.n	64a <drv_uart_interrupt_handler+0x1f4>
 4f4:	f7ff ffa6 	bl	444 <uart_int_tx_done_callback>
 4f8:	6822      	ldr	r2, [r4, #0]
 4fa:	6913      	ldr	r3, [r2, #16]
 4fc:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 500:	6113      	str	r3, [r2, #16]
 502:	6823      	ldr	r3, [r4, #0]
 504:	2200      	movs	r2, #0
 506:	611a      	str	r2, [r3, #16]
 508:	e7af      	b.n	46a <drv_uart_interrupt_handler+0x14>
 50a:	6822      	ldr	r2, [r4, #0]
 50c:	68d3      	ldr	r3, [r2, #12]
 50e:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 512:	60d3      	str	r3, [r2, #12]
 514:	2300      	movs	r3, #0
 516:	7423      	strb	r3, [r4, #16]
 518:	74a3      	strb	r3, [r4, #18]
 51a:	74e3      	strb	r3, [r4, #19]
 51c:	6822      	ldr	r2, [r4, #0]
 51e:	6853      	ldr	r3, [r2, #4]
 520:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 524:	6053      	str	r3, [r2, #4]
 526:	6822      	ldr	r2, [r4, #0]
 528:	6853      	ldr	r3, [r2, #4]
 52a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 52e:	6053      	str	r3, [r2, #4]
 530:	6822      	ldr	r2, [r4, #0]
 532:	6853      	ldr	r3, [r2, #4]
 534:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 538:	6053      	str	r3, [r2, #4]
 53a:	6822      	ldr	r2, [r4, #0]
 53c:	6853      	ldr	r3, [r2, #4]
 53e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 542:	6053      	str	r3, [r2, #4]
 544:	6822      	ldr	r2, [r4, #0]
 546:	6853      	ldr	r3, [r2, #4]
 548:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 54c:	6053      	str	r3, [r2, #4]
 54e:	6822      	ldr	r2, [r4, #0]
 550:	6853      	ldr	r3, [r2, #4]
 552:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 556:	6053      	str	r3, [r2, #4]
 558:	6822      	ldr	r2, [r4, #0]
 55a:	6853      	ldr	r3, [r2, #4]
 55c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 560:	6053      	str	r3, [r2, #4]
 562:	6822      	ldr	r2, [r4, #0]
 564:	6853      	ldr	r3, [r2, #4]
 566:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 56a:	6053      	str	r3, [r2, #4]
 56c:	e785      	b.n	47a <drv_uart_interrupt_handler+0x24>
 56e:	6822      	ldr	r2, [r4, #0]
 570:	68d3      	ldr	r3, [r2, #12]
 572:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 576:	60d3      	str	r3, [r2, #12]
 578:	2300      	movs	r3, #0
 57a:	7423      	strb	r3, [r4, #16]
 57c:	74a3      	strb	r3, [r4, #18]
 57e:	74e3      	strb	r3, [r4, #19]
 580:	6822      	ldr	r2, [r4, #0]
 582:	6853      	ldr	r3, [r2, #4]
 584:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 588:	6053      	str	r3, [r2, #4]
 58a:	6822      	ldr	r2, [r4, #0]
 58c:	6853      	ldr	r3, [r2, #4]
 58e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 592:	6053      	str	r3, [r2, #4]
 594:	6822      	ldr	r2, [r4, #0]
 596:	6853      	ldr	r3, [r2, #4]
 598:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 59c:	6053      	str	r3, [r2, #4]
 59e:	6822      	ldr	r2, [r4, #0]
 5a0:	6853      	ldr	r3, [r2, #4]
 5a2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 5a6:	6053      	str	r3, [r2, #4]
 5a8:	6822      	ldr	r2, [r4, #0]
 5aa:	6853      	ldr	r3, [r2, #4]
 5ac:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 5b0:	6053      	str	r3, [r2, #4]
 5b2:	6822      	ldr	r2, [r4, #0]
 5b4:	6853      	ldr	r3, [r2, #4]
 5b6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 5ba:	6053      	str	r3, [r2, #4]
 5bc:	6822      	ldr	r2, [r4, #0]
 5be:	6853      	ldr	r3, [r2, #4]
 5c0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 5c4:	6053      	str	r3, [r2, #4]
 5c6:	6822      	ldr	r2, [r4, #0]
 5c8:	6853      	ldr	r3, [r2, #4]
 5ca:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 5ce:	6053      	str	r3, [r2, #4]
 5d0:	e766      	b.n	4a0 <drv_uart_interrupt_handler+0x4a>
 5d2:	4620      	mov	r0, r4
 5d4:	f7ff ff39 	bl	44a <uart_int_rx_noise_detect_callback>
 5d8:	6822      	ldr	r2, [r4, #0]
 5da:	6913      	ldr	r3, [r2, #16]
 5dc:	f043 0320 	orr.w	r3, r3, #32
 5e0:	6113      	str	r3, [r2, #16]
 5e2:	6823      	ldr	r3, [r4, #0]
 5e4:	2200      	movs	r2, #0
 5e6:	611a      	str	r2, [r3, #16]
 5e8:	e769      	b.n	4be <drv_uart_interrupt_handler+0x68>
 5ea:	4620      	mov	r0, r4
 5ec:	f7ff ff2e 	bl	44c <uart_int_rx_stop_detect_callback>
 5f0:	6822      	ldr	r2, [r4, #0]
 5f2:	6913      	ldr	r3, [r2, #16]
 5f4:	f043 0310 	orr.w	r3, r3, #16
 5f8:	6113      	str	r3, [r2, #16]
 5fa:	6823      	ldr	r3, [r4, #0]
 5fc:	2200      	movs	r2, #0
 5fe:	611a      	str	r2, [r3, #16]
 600:	e761      	b.n	4c6 <drv_uart_interrupt_handler+0x70>
 602:	4620      	mov	r0, r4
 604:	f7ff ff24 	bl	450 <uart_int_tx_fifo_thres_callback>
 608:	6822      	ldr	r2, [r4, #0]
 60a:	6913      	ldr	r3, [r2, #16]
 60c:	f043 0301 	orr.w	r3, r3, #1
 610:	6113      	str	r3, [r2, #16]
 612:	6823      	ldr	r3, [r4, #0]
 614:	2200      	movs	r2, #0
 616:	611a      	str	r2, [r3, #16]
 618:	e759      	b.n	4ce <drv_uart_interrupt_handler+0x78>
 61a:	4620      	mov	r0, r4
 61c:	f7ff ff17 	bl	44e <uart_int_tx_fifo_empty_callback>
 620:	6822      	ldr	r2, [r4, #0]
 622:	6913      	ldr	r3, [r2, #16]
 624:	f043 0302 	orr.w	r3, r3, #2
 628:	6113      	str	r3, [r2, #16]
 62a:	6823      	ldr	r3, [r4, #0]
 62c:	2200      	movs	r2, #0
 62e:	611a      	str	r2, [r3, #16]
 630:	e751      	b.n	4d6 <drv_uart_interrupt_handler+0x80>
 632:	69d9      	ldr	r1, [r3, #28]
 634:	6962      	ldr	r2, [r4, #20]
 636:	7ce3      	ldrb	r3, [r4, #19]
 638:	1c58      	adds	r0, r3, #1
 63a:	74e0      	strb	r0, [r4, #19]
 63c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 640:	6823      	ldr	r3, [r4, #0]
 642:	695a      	ldr	r2, [r3, #20]
 644:	f012 0f1f 	tst.w	r2, #31
 648:	d1f3      	bne.n	632 <drv_uart_interrupt_handler+0x1dc>
 64a:	4620      	mov	r0, r4
 64c:	f7ff ff02 	bl	454 <uart_int_rx_fifo_thres_callback>
 650:	6822      	ldr	r2, [r4, #0]
 652:	6913      	ldr	r3, [r2, #16]
 654:	f043 0304 	orr.w	r3, r3, #4
 658:	6113      	str	r3, [r2, #16]
 65a:	6823      	ldr	r3, [r4, #0]
 65c:	2200      	movs	r2, #0
 65e:	611a      	str	r2, [r3, #16]
 660:	f015 0f08 	tst.w	r5, #8
 664:	d020      	beq.n	6a8 <drv_uart_interrupt_handler+0x252>
 666:	7ce2      	ldrb	r2, [r4, #19]
 668:	7e23      	ldrb	r3, [r4, #24]
 66a:	429a      	cmp	r2, r3
 66c:	d30c      	bcc.n	688 <drv_uart_interrupt_handler+0x232>
 66e:	6822      	ldr	r2, [r4, #0]
 670:	68d3      	ldr	r3, [r2, #12]
 672:	f023 030c 	bic.w	r3, r3, #12
 676:	60d3      	str	r3, [r2, #12]
 678:	e00b      	b.n	692 <drv_uart_interrupt_handler+0x23c>
 67a:	69d9      	ldr	r1, [r3, #28]
 67c:	6962      	ldr	r2, [r4, #20]
 67e:	7ce3      	ldrb	r3, [r4, #19]
 680:	1c58      	adds	r0, r3, #1
 682:	74e0      	strb	r0, [r4, #19]
 684:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 688:	6823      	ldr	r3, [r4, #0]
 68a:	695a      	ldr	r2, [r3, #20]
 68c:	f012 0f1f 	tst.w	r2, #31
 690:	d1f3      	bne.n	67a <drv_uart_interrupt_handler+0x224>
 692:	4620      	mov	r0, r4
 694:	f7ff fedd 	bl	452 <uart_int_rx_fifo_noempty_callback>
 698:	6822      	ldr	r2, [r4, #0]
 69a:	6913      	ldr	r3, [r2, #16]
 69c:	f043 0308 	orr.w	r3, r3, #8
 6a0:	6113      	str	r3, [r2, #16]
 6a2:	6823      	ldr	r3, [r4, #0]
 6a4:	2200      	movs	r2, #0
 6a6:	611a      	str	r2, [r3, #16]
 6a8:	bd38      	pop	{r3, r4, r5, pc}
	...

000006ac <eth_sma_init>:
 6ac:	b510      	push	{r4, lr}
 6ae:	4c05      	ldr	r4, [pc, #20]	; (6c4 <eth_sma_init+0x18>)
 6b0:	4b05      	ldr	r3, [pc, #20]	; (6c8 <eth_sma_init+0x1c>)
 6b2:	6023      	str	r3, [r4, #0]
 6b4:	4620      	mov	r0, r4
 6b6:	f7ff fd10 	bl	da <drv_eth_sma_default_config>
 6ba:	4620      	mov	r0, r4
 6bc:	f7ff fd21 	bl	102 <drv_eth_sma_init>
 6c0:	bd10      	pop	{r4, pc}
 6c2:	bf00      	nop
 6c4:	000200ac 	andeq	r0, r2, ip, lsr #1
 6c8:	40020000 	andmi	r0, r2, r0

000006cc <b50610_init>:
 6cc:	b510      	push	{r4, lr}
 6ce:	4c0a      	ldr	r4, [pc, #40]	; (6f8 <b50610_init+0x2c>)
 6d0:	2319      	movs	r3, #25
 6d2:	7163      	strb	r3, [r4, #5]
 6d4:	4620      	mov	r0, r4
 6d6:	f7ff fd05 	bl	e4 <drv_eth_sma_set_config>
 6da:	6823      	ldr	r3, [r4, #0]
 6dc:	685a      	ldr	r2, [r3, #4]
 6de:	f042 0201 	orr.w	r2, r2, #1
 6e2:	605a      	str	r2, [r3, #4]
 6e4:	685a      	ldr	r2, [r3, #4]
 6e6:	f022 0201 	bic.w	r2, r2, #1
 6ea:	605a      	str	r2, [r3, #4]
 6ec:	2202      	movs	r2, #2
 6ee:	4903      	ldr	r1, [pc, #12]	; (6fc <b50610_init+0x30>)
 6f0:	4620      	mov	r0, r4
 6f2:	f7ff fd3e 	bl	172 <drv_eth_sma_master_write_reglist>
 6f6:	bd10      	pop	{r4, pc}
 6f8:	000200ac 	andeq	r0, r2, ip, lsr #1
 6fc:	00020000 	andeq	r0, r2, r0

00000700 <b50610_init_test>:
 700:	b508      	push	{r3, lr}
 702:	f7ff ffd3 	bl	6ac <eth_sma_init>
 706:	f7ff ffe1 	bl	6cc <b50610_init>
 70a:	bd08      	pop	{r3, pc}

0000070c <b50610_get_reglist_test>:
 70c:	b538      	push	{r3, r4, r5, lr}
 70e:	2208      	movs	r2, #8
 710:	4912      	ldr	r1, [pc, #72]	; (75c <b50610_get_reglist_test+0x50>)
 712:	4813      	ldr	r0, [pc, #76]	; (760 <b50610_get_reglist_test+0x54>)
 714:	f7ff fd51 	bl	1ba <drv_eth_sma_master_read_reglist>
 718:	b920      	cbnz	r0, 724 <b50610_get_reglist_test+0x18>
 71a:	4812      	ldr	r0, [pc, #72]	; (764 <b50610_get_reglist_test+0x58>)
 71c:	f000 f8aa 	bl	874 <test_printf_s>
 720:	2400      	movs	r4, #0
 722:	e015      	b.n	750 <b50610_get_reglist_test+0x44>
 724:	4810      	ldr	r0, [pc, #64]	; (768 <b50610_get_reglist_test+0x5c>)
 726:	f000 f8a5 	bl	874 <test_printf_s>
 72a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 72e:	f64f 72ff 	movw	r2, #65535	; 0xffff
 732:	601a      	str	r2, [r3, #0]
 734:	e011      	b.n	75a <b50610_get_reglist_test+0x4e>
 736:	4d09      	ldr	r5, [pc, #36]	; (75c <b50610_get_reglist_test+0x50>)
 738:	f855 1024 	ldr.w	r1, [r5, r4, lsl #2]
 73c:	480b      	ldr	r0, [pc, #44]	; (76c <b50610_get_reglist_test+0x60>)
 73e:	f000 f89a 	bl	876 <test_printf_ch>
 742:	f855 2024 	ldr.w	r2, [r5, r4, lsl #2]
 746:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 74a:	605a      	str	r2, [r3, #4]
 74c:	3401      	adds	r4, #1
 74e:	b2e4      	uxtb	r4, r4
 750:	2c07      	cmp	r4, #7
 752:	d9f0      	bls.n	736 <b50610_get_reglist_test+0x2a>
 754:	4806      	ldr	r0, [pc, #24]	; (770 <b50610_get_reglist_test+0x64>)
 756:	f000 f88d 	bl	874 <test_printf_s>
 75a:	bd38      	pop	{r3, r4, r5, pc}
 75c:	00020008 	andeq	r0, r2, r8
 760:	000200ac 	andeq	r0, r2, ip, lsr #1
 764:	000008cc 	andeq	r0, r0, ip, asr #17
 768:	000008bc 			; <UNDEFINED> instruction: 0x000008bc
 76c:	000008dc 	ldrdeq	r0, [r0], -ip
 770:	000008c8 	andeq	r0, r0, r8, asr #17

00000774 <NMI_Handler>:
 774:	4770      	bx	lr

00000776 <HardFault_Handler>:
 776:	e7fe      	b.n	776 <HardFault_Handler>

00000778 <MemManage_Handler>:
 778:	e7fe      	b.n	778 <MemManage_Handler>

0000077a <BusFault_Handler>:
 77a:	e7fe      	b.n	77a <BusFault_Handler>

0000077c <UsageFault_Handler>:
 77c:	e7fe      	b.n	77c <UsageFault_Handler>

0000077e <SVC_Handler>:
 77e:	4770      	bx	lr

00000780 <DebugMon_Handler>:
 780:	4770      	bx	lr

00000782 <PendSV_Handler>:
 782:	4770      	bx	lr

00000784 <SysTick_Handler>:
 784:	4770      	bx	lr
	...

00000788 <Uart0_Handler>:
 788:	b508      	push	{r3, lr}
 78a:	4b04      	ldr	r3, [pc, #16]	; (79c <Uart0_Handler+0x14>)
 78c:	2201      	movs	r2, #1
 78e:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 792:	4803      	ldr	r0, [pc, #12]	; (7a0 <Uart0_Handler+0x18>)
 794:	f7ff fe5f 	bl	456 <drv_uart_interrupt_handler>
 798:	bd08      	pop	{r3, pc}
 79a:	bf00      	nop
 79c:	e000e100 	and	lr, r0, r0, lsl #2
 7a0:	000200c0 	andeq	r0, r2, r0, asr #1

000007a4 <EthSma_Handler>:
 7a4:	b508      	push	{r3, lr}
 7a6:	4b04      	ldr	r3, [pc, #16]	; (7b8 <EthSma_Handler+0x14>)
 7a8:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 7ac:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 7b0:	4802      	ldr	r0, [pc, #8]	; (7bc <EthSma_Handler+0x18>)
 7b2:	f7ff fd6a 	bl	28a <drv_eth_sma_interrupt_handler>
 7b6:	bd08      	pop	{r3, pc}
 7b8:	e000e100 	and	lr, r0, r0, lsl #2
 7bc:	000200ac 	andeq	r0, r2, ip, lsr #1

000007c0 <main>:
 7c0:	b508      	push	{r3, lr}
 7c2:	f000 f847 	bl	854 <uart0_init>
 7c6:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 7ca:	23bd      	movs	r3, #189	; 0xbd
 7cc:	60a3      	str	r3, [r4, #8]
 7ce:	f7ff ff97 	bl	700 <b50610_init_test>
 7d2:	f640 33d1 	movw	r3, #3025	; 0xbd1
 7d6:	60a3      	str	r3, [r4, #8]
 7d8:	f7ff ff98 	bl	70c <b50610_get_reglist_test>
 7dc:	23ed      	movs	r3, #237	; 0xed
 7de:	60a3      	str	r3, [r4, #8]
 7e0:	e7fe      	b.n	7e0 <main+0x20>
	...

000007e4 <Reset_Handler>:
 7e4:	490a      	ldr	r1, [pc, #40]	; (810 <Reset_Handler+0x2c>)
 7e6:	4a0b      	ldr	r2, [pc, #44]	; (814 <Reset_Handler+0x30>)
 7e8:	4b0b      	ldr	r3, [pc, #44]	; (818 <Reset_Handler+0x34>)
 7ea:	1a9b      	subs	r3, r3, r2
 7ec:	dd03      	ble.n	7f6 <Reset_Handler+0x12>
 7ee:	3b04      	subs	r3, #4
 7f0:	58c8      	ldr	r0, [r1, r3]
 7f2:	50d0      	str	r0, [r2, r3]
 7f4:	dcfb      	bgt.n	7ee <Reset_Handler+0xa>
 7f6:	4909      	ldr	r1, [pc, #36]	; (81c <Reset_Handler+0x38>)
 7f8:	4a09      	ldr	r2, [pc, #36]	; (820 <Reset_Handler+0x3c>)
 7fa:	2000      	movs	r0, #0
 7fc:	4291      	cmp	r1, r2
 7fe:	bfbc      	itt	lt
 800:	f841 0b04 	strlt.w	r0, [r1], #4
 804:	e7fa      	blt.n	7fc <Reset_Handler+0x18>
 806:	f7ff ffdb 	bl	7c0 <main>
 80a:	f000 f835 	bl	878 <exit>
 80e:	08e80000 	stmiaeq	r8!, {}^	; <UNPREDICTABLE>
 812:	00000000 	andeq	r0, r0, r0
 816:	00900002 	addseq	r0, r0, r2
 81a:	00900002 	addseq	r0, r0, r2
 81e:	00dc0002 	sbcseq	r0, ip, r2
 822:	e7fe0002 	ldrb	r0, [lr, r2]!
 826:	e7fe      	b.n	826 <Reset_Handler+0x42>
 828:	e7fe      	b.n	828 <Reset_Handler+0x44>
 82a:	e7fe      	b.n	82a <Reset_Handler+0x46>
 82c:	e7fe      	b.n	82c <Reset_Handler+0x48>
 82e:	e7fe      	b.n	82e <Reset_Handler+0x4a>
 830:	e7fe      	b.n	830 <Reset_Handler+0x4c>
 832:	e7fe      	b.n	832 <Reset_Handler+0x4e>
 834:	e7fe      	b.n	834 <Reset_Handler+0x50>
 836:	e7fe      	b.n	836 <Reset_Handler+0x52>

00000838 <Uart1_Handler>:
 838:	e7fe      	b.n	838 <Uart1_Handler>

0000083a <Resv2_Handler>:
 83a:	e7fe      	b.n	83a <Resv2_Handler>

0000083c <Resv3_Handler>:
 83c:	e7fe      	b.n	83c <Resv3_Handler>

0000083e <Resv4_Handler>:
 83e:	e7fe      	b.n	83e <Resv4_Handler>

00000840 <Gpioa_Handler>:
 840:	e7fe      	b.n	840 <Gpioa_Handler>

00000842 <Resv6_Handler>:
 842:	e7fe      	b.n	842 <Resv6_Handler>

00000844 <Resv7_Handler>:
 844:	e7fe      	b.n	844 <Resv7_Handler>

00000846 <Bastim_Ch0_Handler>:
 846:	e7fe      	b.n	846 <Bastim_Ch0_Handler>

00000848 <Bastim_Ch1_Handler>:
 848:	e7fe      	b.n	848 <Bastim_Ch1_Handler>

0000084a <Bastim_Ch2_Handler>:
 84a:	e7fe      	b.n	84a <Bastim_Ch2_Handler>

0000084c <Bastim_Ch3_Handler>:
 84c:	e7fe      	b.n	84c <Bastim_Ch3_Handler>
 84e:	e7fe      	b.n	84e <Bastim_Ch3_Handler+0x2>

00000850 <Resv13_Handler>:
 850:	e7fe      	b.n	850 <Resv13_Handler>
 852:	bf00      	nop

00000854 <uart0_init>:
 854:	b510      	push	{r4, lr}
 856:	4c05      	ldr	r4, [pc, #20]	; (86c <uart0_init+0x18>)
 858:	4b05      	ldr	r3, [pc, #20]	; (870 <uart0_init+0x1c>)
 85a:	6023      	str	r3, [r4, #0]
 85c:	4620      	mov	r0, r4
 85e:	f7ff fd77 	bl	350 <drv_uart_default_config>
 862:	4620      	mov	r0, r4
 864:	f7ff fda6 	bl	3b4 <drv_uart_init>
 868:	bd10      	pop	{r4, pc}
 86a:	bf00      	nop
 86c:	000200c0 	andeq	r0, r2, r0, asr #1
 870:	40001000 	andmi	r1, r0, r0

00000874 <test_printf_s>:
 874:	4770      	bx	lr

00000876 <test_printf_ch>:
 876:	4770      	bx	lr

00000878 <exit>:
 878:	b508      	push	{r3, lr}
 87a:	4b07      	ldr	r3, [pc, #28]	; (898 <exit+0x20>)
 87c:	4604      	mov	r4, r0
 87e:	b113      	cbz	r3, 886 <exit+0xe>
 880:	2100      	movs	r1, #0
 882:	f3af 8000 	nop.w
 886:	4b05      	ldr	r3, [pc, #20]	; (89c <exit+0x24>)
 888:	6818      	ldr	r0, [r3, #0]
 88a:	6a83      	ldr	r3, [r0, #40]	; 0x28
 88c:	b103      	cbz	r3, 890 <exit+0x18>
 88e:	4798      	blx	r3
 890:	4620      	mov	r0, r4
 892:	f000 f805 	bl	8a0 <_exit>
 896:	bf00      	nop
 898:	00000000 	andeq	r0, r0, r0
 89c:	000008e0 	andeq	r0, r0, r0, ror #17

000008a0 <_exit>:
 8a0:	e7fe      	b.n	8a0 <_exit>
 8a2:	bf00      	nop

000008a4 <_init>:
 8a4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8a6:	bf00      	nop
 8a8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8aa:	bc08      	pop	{r3}
 8ac:	469e      	mov	lr, r3
 8ae:	4770      	bx	lr

000008b0 <_fini>:
 8b0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8b2:	bf00      	nop
 8b4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8b6:	bc08      	pop	{r3}
 8b8:	469e      	mov	lr, r3
 8ba:	4770      	bx	lr
 8bc:	36303562 	ldrtcc	r3, [r0], -r2, ror #10
 8c0:	6e203031 	mcrvs	0, 1, r3, cr0, cr1, {1}
 8c4:	2e6b6361 	cdpcs	3, 6, cr6, cr11, cr1, {3}
 8c8:	00000a0d 	andeq	r0, r0, sp, lsl #20
 8cc:	36303562 	ldrtcc	r3, [r0], -r2, ror #10
 8d0:	72203031 	eorvc	r3, r0, #49	; 0x31
 8d4:	3a646165 	bcc	1918e70 <__StackTop+0x18f6e70>
 8d8:	00000a0d 	andeq	r0, r0, sp, lsl #20
 8dc:	00207825 	eoreq	r7, r0, r5, lsr #16

000008e0 <_global_impure_ptr>:
 8e0:	00020028 	andeq	r0, r2, r8, lsr #32

000008e4 <__EH_FRAME_BEGIN__>:
 8e4:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <b50610_init_conifg>:
   20000:	0000a100 	andeq	sl, r0, r0, lsl #2
   20004:	00002100 	andeq	r2, r0, r0, lsl #2

00020008 <b50610_reglist>:
   20008:	00000000 	andeq	r0, r0, r0
   2000c:	00010000 	andeq	r0, r1, r0
   20010:	00020000 	andeq	r0, r2, r0
   20014:	00030000 	andeq	r0, r3, r0
   20018:	00040000 	andeq	r0, r4, r0
   2001c:	00050000 	andeq	r0, r5, r0
   20020:	00060000 	andeq	r0, r6, r0
   20024:	00190000 	andseq	r0, r9, r0

00020028 <impure_data>:
	...

00020088 <__frame_dummy_init_array_entry>:
   20088:	0000009d 	muleq	r0, sp, r0

0002008c <__do_global_dtors_aux_fini_array_entry>:
   2008c:	00000079 	andeq	r0, r0, r9, ror r0

Disassembly of section .bss:

00020090 <__bss_start__>:
   20090:	00000000 	andeq	r0, r0, r0

00020094 <object.0>:
	...

000200ac <heth>:
	...

000200c0 <huart0>:
	...

Disassembly of section .stack_dummy:

000200e0 <__HeapBase>:
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
  18:	00000878 	andeq	r0, r0, r8, ror r8
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000008a0 	andeq	r0, r0, r0, lsr #17
  44:	00000002 	andeq	r0, r0, r2

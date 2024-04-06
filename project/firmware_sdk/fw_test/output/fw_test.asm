
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00022000 	andeq	r2, r2, r0
   4:	00000809 	andeq	r0, r0, r9, lsl #16
   8:	00000799 	muleq	r0, r9, r7
   c:	0000079b 	muleq	r0, fp, r7
  10:	0000079d 	muleq	r0, sp, r7
  14:	0000079f 	muleq	r0, pc, r7	; <UNPREDICTABLE>
  18:	000007a1 	andeq	r0, r0, r1, lsr #15
	...
  2c:	000007a3 	andeq	r0, r0, r3, lsr #15
  30:	000007a5 	andeq	r0, r0, r5, lsr #15
  34:	00000000 	andeq	r0, r0, r0
  38:	000007a7 	andeq	r0, r0, r7, lsr #15
  3c:	000007a9 	andeq	r0, r0, r9, lsr #15
  40:	000007ad 	andeq	r0, r0, sp, lsr #15
  44:	0000085d 	andeq	r0, r0, sp, asr r8
  48:	0000085f 	andeq	r0, r0, pc, asr r8
  4c:	00000861 	andeq	r0, r0, r1, ror #16
  50:	00000863 	andeq	r0, r0, r3, ror #16
  54:	00000865 	andeq	r0, r0, r5, ror #16
  58:	00000867 	andeq	r0, r0, r7, ror #16
  5c:	00000869 	andeq	r0, r0, r9, ror #16
  60:	0000086b 	andeq	r0, r0, fp, ror #16
  64:	0000086d 	andeq	r0, r0, sp, ror #16
  68:	0000086f 	andeq	r0, r0, pc, ror #16
  6c:	00000871 	andeq	r0, r0, r1, ror r8
  70:	000007c9 	andeq	r0, r0, r9, asr #15
  74:	00000875 	andeq	r0, r0, r5, ror r8

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
  98:	00000908 	andeq	r0, r0, r8, lsl #18

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
  b4:	00000908 	andeq	r0, r0, r8, lsl #18

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
 178:	7a43      	ldrb	r3, [r0, #9]
 17a:	4293      	cmp	r3, r2
 17c:	d218      	bcs.n	1b0 <drv_eth_sma_master_write_reglist+0x3e>
 17e:	6804      	ldr	r4, [r0, #0]
 180:	6923      	ldr	r3, [r4, #16]
 182:	f043 0310 	orr.w	r3, r3, #16
 186:	6123      	str	r3, [r4, #16]
 188:	6803      	ldr	r3, [r0, #0]
 18a:	2400      	movs	r4, #0
 18c:	611c      	str	r4, [r3, #16]
 18e:	6804      	ldr	r4, [r0, #0]
 190:	6963      	ldr	r3, [r4, #20]
 192:	0a1b      	lsrs	r3, r3, #8
 194:	f013 0f06 	tst.w	r3, #6
 198:	d1ee      	bne.n	178 <drv_eth_sma_master_write_reglist+0x6>
 19a:	7a43      	ldrb	r3, [r0, #9]
 19c:	f103 0c01 	add.w	ip, r3, #1
 1a0:	f880 c009 	strb.w	ip, [r0, #9]
 1a4:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
 1a8:	f443 1300 	orr.w	r3, r3, #2097152	; 0x200000
 1ac:	6023      	str	r3, [r4, #0]
 1ae:	e7e3      	b.n	178 <drv_eth_sma_master_write_reglist+0x6>
 1b0:	6803      	ldr	r3, [r0, #0]
 1b2:	699a      	ldr	r2, [r3, #24]
 1b4:	f012 0f10 	tst.w	r2, #16
 1b8:	d0fa      	beq.n	1b0 <drv_eth_sma_master_write_reglist+0x3e>
 1ba:	691a      	ldr	r2, [r3, #16]
 1bc:	f042 0210 	orr.w	r2, r2, #16
 1c0:	611a      	str	r2, [r3, #16]
 1c2:	6803      	ldr	r3, [r0, #0]
 1c4:	2200      	movs	r2, #0
 1c6:	611a      	str	r2, [r3, #16]
 1c8:	bc10      	pop	{r4}
 1ca:	4770      	bx	lr

000001cc <drv_eth_sma_master_read_reglist>:
 1cc:	b510      	push	{r4, lr}
 1ce:	4694      	mov	ip, r2
 1d0:	2300      	movs	r3, #0
 1d2:	7283      	strb	r3, [r0, #10]
 1d4:	7a83      	ldrb	r3, [r0, #10]
 1d6:	4563      	cmp	r3, ip
 1d8:	d255      	bcs.n	286 <Stack_Size+0x86>
 1da:	6802      	ldr	r2, [r0, #0]
 1dc:	6913      	ldr	r3, [r2, #16]
 1de:	f043 0310 	orr.w	r3, r3, #16
 1e2:	6113      	str	r3, [r2, #16]
 1e4:	6803      	ldr	r3, [r0, #0]
 1e6:	2200      	movs	r2, #0
 1e8:	611a      	str	r2, [r3, #16]
 1ea:	6803      	ldr	r3, [r0, #0]
 1ec:	695a      	ldr	r2, [r3, #20]
 1ee:	f412 6fe0 	tst.w	r2, #1792	; 0x700
 1f2:	d1fa      	bne.n	1ea <drv_eth_sma_master_read_reglist+0x1e>
 1f4:	7a82      	ldrb	r2, [r0, #10]
 1f6:	f851 2022 	ldr.w	r2, [r1, r2, lsl #2]
 1fa:	f442 0280 	orr.w	r2, r2, #4194304	; 0x400000
 1fe:	601a      	str	r2, [r3, #0]
 200:	6803      	ldr	r3, [r0, #0]
 202:	695b      	ldr	r3, [r3, #20]
 204:	f013 0f07 	tst.w	r3, #7
 208:	d0fa      	beq.n	200 <Stack_Size>
 20a:	7a82      	ldrb	r2, [r0, #10]
 20c:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
 210:	0c1b      	lsrs	r3, r3, #16
 212:	041b      	lsls	r3, r3, #16
 214:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 218:	6803      	ldr	r3, [r0, #0]
 21a:	69da      	ldr	r2, [r3, #28]
 21c:	7a83      	ldrb	r3, [r0, #10]
 21e:	f103 0e01 	add.w	lr, r3, #1
 222:	f880 e00a 	strb.w	lr, [r0, #10]
 226:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
 22a:	4322      	orrs	r2, r4
 22c:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 230:	6803      	ldr	r3, [r0, #0]
 232:	699b      	ldr	r3, [r3, #24]
 234:	f013 0f20 	tst.w	r3, #32
 238:	d0cc      	beq.n	1d4 <drv_eth_sma_master_read_reglist+0x8>
 23a:	2300      	movs	r3, #0
 23c:	71c3      	strb	r3, [r0, #7]
 23e:	7243      	strb	r3, [r0, #9]
 240:	7283      	strb	r3, [r0, #10]
 242:	6802      	ldr	r2, [r0, #0]
 244:	6853      	ldr	r3, [r2, #4]
 246:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 24a:	6053      	str	r3, [r2, #4]
 24c:	6802      	ldr	r2, [r0, #0]
 24e:	6853      	ldr	r3, [r2, #4]
 250:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 254:	6053      	str	r3, [r2, #4]
 256:	6802      	ldr	r2, [r0, #0]
 258:	6853      	ldr	r3, [r2, #4]
 25a:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 25e:	6053      	str	r3, [r2, #4]
 260:	6802      	ldr	r2, [r0, #0]
 262:	6853      	ldr	r3, [r2, #4]
 264:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 268:	6053      	str	r3, [r2, #4]
 26a:	6802      	ldr	r2, [r0, #0]
 26c:	6853      	ldr	r3, [r2, #4]
 26e:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 272:	6053      	str	r3, [r2, #4]
 274:	6802      	ldr	r2, [r0, #0]
 276:	6853      	ldr	r3, [r2, #4]
 278:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 27c:	6053      	str	r3, [r2, #4]
 27e:	2302      	movs	r3, #2
 280:	71c3      	strb	r3, [r0, #7]
 282:	2001      	movs	r0, #1
 284:	e00b      	b.n	29e <Stack_Size+0x9e>
 286:	6803      	ldr	r3, [r0, #0]
 288:	699a      	ldr	r2, [r3, #24]
 28a:	f012 0f10 	tst.w	r2, #16
 28e:	d0fa      	beq.n	286 <Stack_Size+0x86>
 290:	691a      	ldr	r2, [r3, #16]
 292:	f042 0210 	orr.w	r2, r2, #16
 296:	611a      	str	r2, [r3, #16]
 298:	6803      	ldr	r3, [r0, #0]
 29a:	2000      	movs	r0, #0
 29c:	6118      	str	r0, [r3, #16]
 29e:	bd10      	pop	{r4, pc}

000002a0 <eth_sma_int_rx_turn_nack_callback>:
 2a0:	4770      	bx	lr

000002a2 <eth_sma_int_master_frame_done_callback>:
 2a2:	4770      	bx	lr

000002a4 <eth_sma_int_tx_fifo_empty_callback>:
 2a4:	4770      	bx	lr

000002a6 <eth_sma_int_tx_fifo_thres_callback>:
 2a6:	4770      	bx	lr

000002a8 <eth_sma_int_rx_fifo_noempty_callback>:
 2a8:	4770      	bx	lr

000002aa <eth_sma_int_rx_fifo_thres_callback>:
 2aa:	4770      	bx	lr

000002ac <drv_eth_sma_interrupt_handler>:
 2ac:	b538      	push	{r3, r4, r5, lr}
 2ae:	4604      	mov	r4, r0
 2b0:	6803      	ldr	r3, [r0, #0]
 2b2:	699d      	ldr	r5, [r3, #24]
 2b4:	68db      	ldr	r3, [r3, #12]
 2b6:	b2db      	uxtb	r3, r3
 2b8:	401d      	ands	r5, r3
 2ba:	f015 0f20 	tst.w	r5, #32
 2be:	d10f      	bne.n	2e0 <drv_eth_sma_interrupt_handler+0x34>
 2c0:	f015 0f10 	tst.w	r5, #16
 2c4:	d119      	bne.n	2fa <drv_eth_sma_interrupt_handler+0x4e>
 2c6:	f015 0f01 	tst.w	r5, #1
 2ca:	d122      	bne.n	312 <drv_eth_sma_interrupt_handler+0x66>
 2cc:	f015 0f02 	tst.w	r5, #2
 2d0:	d12b      	bne.n	32a <drv_eth_sma_interrupt_handler+0x7e>
 2d2:	f015 0f04 	tst.w	r5, #4
 2d6:	d134      	bne.n	342 <drv_eth_sma_interrupt_handler+0x96>
 2d8:	f015 0f08 	tst.w	r5, #8
 2dc:	d13d      	bne.n	35a <drv_eth_sma_interrupt_handler+0xae>
 2de:	bd38      	pop	{r3, r4, r5, pc}
 2e0:	2302      	movs	r3, #2
 2e2:	71c3      	strb	r3, [r0, #7]
 2e4:	f7ff ffdc 	bl	2a0 <eth_sma_int_rx_turn_nack_callback>
 2e8:	6822      	ldr	r2, [r4, #0]
 2ea:	6913      	ldr	r3, [r2, #16]
 2ec:	f043 0320 	orr.w	r3, r3, #32
 2f0:	6113      	str	r3, [r2, #16]
 2f2:	6823      	ldr	r3, [r4, #0]
 2f4:	2200      	movs	r2, #0
 2f6:	611a      	str	r2, [r3, #16]
 2f8:	e7e2      	b.n	2c0 <drv_eth_sma_interrupt_handler+0x14>
 2fa:	4620      	mov	r0, r4
 2fc:	f7ff ffd1 	bl	2a2 <eth_sma_int_master_frame_done_callback>
 300:	6822      	ldr	r2, [r4, #0]
 302:	6913      	ldr	r3, [r2, #16]
 304:	f043 0310 	orr.w	r3, r3, #16
 308:	6113      	str	r3, [r2, #16]
 30a:	6823      	ldr	r3, [r4, #0]
 30c:	2200      	movs	r2, #0
 30e:	611a      	str	r2, [r3, #16]
 310:	e7d9      	b.n	2c6 <drv_eth_sma_interrupt_handler+0x1a>
 312:	4620      	mov	r0, r4
 314:	f7ff ffc7 	bl	2a6 <eth_sma_int_tx_fifo_thres_callback>
 318:	6822      	ldr	r2, [r4, #0]
 31a:	6913      	ldr	r3, [r2, #16]
 31c:	f043 0301 	orr.w	r3, r3, #1
 320:	6113      	str	r3, [r2, #16]
 322:	6823      	ldr	r3, [r4, #0]
 324:	2200      	movs	r2, #0
 326:	611a      	str	r2, [r3, #16]
 328:	e7d0      	b.n	2cc <drv_eth_sma_interrupt_handler+0x20>
 32a:	4620      	mov	r0, r4
 32c:	f7ff ffba 	bl	2a4 <eth_sma_int_tx_fifo_empty_callback>
 330:	6822      	ldr	r2, [r4, #0]
 332:	6913      	ldr	r3, [r2, #16]
 334:	f043 0302 	orr.w	r3, r3, #2
 338:	6113      	str	r3, [r2, #16]
 33a:	6823      	ldr	r3, [r4, #0]
 33c:	2200      	movs	r2, #0
 33e:	611a      	str	r2, [r3, #16]
 340:	e7c7      	b.n	2d2 <drv_eth_sma_interrupt_handler+0x26>
 342:	4620      	mov	r0, r4
 344:	f7ff ffb1 	bl	2aa <eth_sma_int_rx_fifo_thres_callback>
 348:	6822      	ldr	r2, [r4, #0]
 34a:	6913      	ldr	r3, [r2, #16]
 34c:	f043 0304 	orr.w	r3, r3, #4
 350:	6113      	str	r3, [r2, #16]
 352:	6823      	ldr	r3, [r4, #0]
 354:	2200      	movs	r2, #0
 356:	611a      	str	r2, [r3, #16]
 358:	e7be      	b.n	2d8 <drv_eth_sma_interrupt_handler+0x2c>
 35a:	4620      	mov	r0, r4
 35c:	f7ff ffa4 	bl	2a8 <eth_sma_int_rx_fifo_noempty_callback>
 360:	6822      	ldr	r2, [r4, #0]
 362:	6913      	ldr	r3, [r2, #16]
 364:	f043 0308 	orr.w	r3, r3, #8
 368:	6113      	str	r3, [r2, #16]
 36a:	6823      	ldr	r3, [r4, #0]
 36c:	2200      	movs	r2, #0
 36e:	611a      	str	r2, [r3, #16]
 370:	e7b5      	b.n	2de <drv_eth_sma_interrupt_handler+0x32>

00000372 <drv_uart_default_config>:
 372:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 376:	6043      	str	r3, [r0, #4]
 378:	230f      	movs	r3, #15
 37a:	7203      	strb	r3, [r0, #8]
 37c:	2300      	movs	r3, #0
 37e:	7243      	strb	r3, [r0, #9]
 380:	7283      	strb	r3, [r0, #10]
 382:	72c3      	strb	r3, [r0, #11]
 384:	7303      	strb	r3, [r0, #12]
 386:	7343      	strb	r3, [r0, #13]
 388:	2301      	movs	r3, #1
 38a:	7383      	strb	r3, [r0, #14]
 38c:	4770      	bx	lr
	...

00000390 <drv_uart_set_config>:
 390:	b508      	push	{r3, lr}
 392:	6841      	ldr	r1, [r0, #4]
 394:	7a03      	ldrb	r3, [r0, #8]
 396:	fb03 f201 	mul.w	r2, r3, r1
 39a:	490e      	ldr	r1, [pc, #56]	; (3d4 <drv_uart_set_config+0x44>)
 39c:	fbb1 f2f2 	udiv	r2, r1, r2
 3a0:	0419      	lsls	r1, r3, #16
 3a2:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 3a6:	7a43      	ldrb	r3, [r0, #9]
 3a8:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 3ac:	7a83      	ldrb	r3, [r0, #10]
 3ae:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 3b2:	7ac3      	ldrb	r3, [r0, #11]
 3b4:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 3b8:	7b03      	ldrb	r3, [r0, #12]
 3ba:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 3be:	7b42      	ldrb	r2, [r0, #13]
 3c0:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 3c4:	7b82      	ldrb	r2, [r0, #14]
 3c6:	4311      	orrs	r1, r2
 3c8:	6800      	ldr	r0, [r0, #0]
 3ca:	460a      	mov	r2, r1
 3cc:	3008      	adds	r0, #8
 3ce:	f7ff fe73 	bl	b8 <drv_check_rw_data>
 3d2:	bd08      	pop	{r3, pc}
 3d4:	02625a00 	rsbeq	r5, r2, #0, 20

000003d8 <drv_uart_init>:
 3d8:	b538      	push	{r3, r4, r5, lr}
 3da:	4604      	mov	r4, r0
 3dc:	2500      	movs	r5, #0
 3de:	7485      	strb	r5, [r0, #18]
 3e0:	74c5      	strb	r5, [r0, #19]
 3e2:	f7ff ffd5 	bl	390 <drv_uart_set_config>
 3e6:	7425      	strb	r5, [r4, #16]
 3e8:	74a5      	strb	r5, [r4, #18]
 3ea:	74e5      	strb	r5, [r4, #19]
 3ec:	6822      	ldr	r2, [r4, #0]
 3ee:	6853      	ldr	r3, [r2, #4]
 3f0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 3f4:	6053      	str	r3, [r2, #4]
 3f6:	6822      	ldr	r2, [r4, #0]
 3f8:	6853      	ldr	r3, [r2, #4]
 3fa:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 3fe:	6053      	str	r3, [r2, #4]
 400:	6822      	ldr	r2, [r4, #0]
 402:	6853      	ldr	r3, [r2, #4]
 404:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 408:	6053      	str	r3, [r2, #4]
 40a:	6822      	ldr	r2, [r4, #0]
 40c:	6853      	ldr	r3, [r2, #4]
 40e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 412:	6053      	str	r3, [r2, #4]
 414:	6822      	ldr	r2, [r4, #0]
 416:	6853      	ldr	r3, [r2, #4]
 418:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 41c:	6053      	str	r3, [r2, #4]
 41e:	6822      	ldr	r2, [r4, #0]
 420:	6853      	ldr	r3, [r2, #4]
 422:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 426:	6053      	str	r3, [r2, #4]
 428:	6822      	ldr	r2, [r4, #0]
 42a:	6853      	ldr	r3, [r2, #4]
 42c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 430:	6053      	str	r3, [r2, #4]
 432:	6822      	ldr	r2, [r4, #0]
 434:	6853      	ldr	r3, [r2, #4]
 436:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 43a:	6053      	str	r3, [r2, #4]
 43c:	6823      	ldr	r3, [r4, #0]
 43e:	f240 12ff 	movw	r2, #511	; 0x1ff
 442:	611a      	str	r2, [r3, #16]
 444:	6823      	ldr	r3, [r4, #0]
 446:	611d      	str	r5, [r3, #16]
 448:	6822      	ldr	r2, [r4, #0]
 44a:	6853      	ldr	r3, [r2, #4]
 44c:	f043 0301 	orr.w	r3, r3, #1
 450:	6053      	str	r3, [r2, #4]
 452:	6822      	ldr	r2, [r4, #0]
 454:	6853      	ldr	r3, [r2, #4]
 456:	f023 0301 	bic.w	r3, r3, #1
 45a:	6053      	str	r3, [r2, #4]
 45c:	6822      	ldr	r2, [r4, #0]
 45e:	6853      	ldr	r3, [r2, #4]
 460:	f043 0302 	orr.w	r3, r3, #2
 464:	6053      	str	r3, [r2, #4]
 466:	bd38      	pop	{r3, r4, r5, pc}

00000468 <uart_int_tx_done_callback>:
 468:	4770      	bx	lr

0000046a <uart_int_rx_stop_callback>:
 46a:	4770      	bx	lr

0000046c <uart_int_rx_parity_error_callback>:
 46c:	4770      	bx	lr

0000046e <uart_int_rx_noise_detect_callback>:
 46e:	4770      	bx	lr

00000470 <uart_int_rx_stop_detect_callback>:
 470:	4770      	bx	lr

00000472 <uart_int_tx_fifo_empty_callback>:
 472:	4770      	bx	lr

00000474 <uart_int_tx_fifo_thres_callback>:
 474:	4770      	bx	lr

00000476 <uart_int_rx_fifo_noempty_callback>:
 476:	4770      	bx	lr

00000478 <uart_int_rx_fifo_thres_callback>:
 478:	4770      	bx	lr

0000047a <drv_uart_interrupt_handler>:
 47a:	b538      	push	{r3, r4, r5, lr}
 47c:	4604      	mov	r4, r0
 47e:	6803      	ldr	r3, [r0, #0]
 480:	699d      	ldr	r5, [r3, #24]
 482:	68db      	ldr	r3, [r3, #12]
 484:	b29b      	uxth	r3, r3
 486:	401d      	ands	r5, r3
 488:	f415 7f80 	tst.w	r5, #256	; 0x100
 48c:	d144      	bne.n	518 <drv_uart_interrupt_handler+0x9e>
 48e:	f015 0f40 	tst.w	r5, #64	; 0x40
 492:	d00f      	beq.n	4b4 <drv_uart_interrupt_handler+0x3a>
 494:	2301      	movs	r3, #1
 496:	7423      	strb	r3, [r4, #16]
 498:	7aa3      	ldrb	r3, [r4, #10]
 49a:	2b01      	cmp	r3, #1
 49c:	d147      	bne.n	52e <drv_uart_interrupt_handler+0xb4>
 49e:	4620      	mov	r0, r4
 4a0:	f7ff ffe3 	bl	46a <uart_int_rx_stop_callback>
 4a4:	6822      	ldr	r2, [r4, #0]
 4a6:	6913      	ldr	r3, [r2, #16]
 4a8:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 4ac:	6113      	str	r3, [r2, #16]
 4ae:	6823      	ldr	r3, [r4, #0]
 4b0:	2200      	movs	r2, #0
 4b2:	611a      	str	r2, [r3, #16]
 4b4:	f015 0f80 	tst.w	r5, #128	; 0x80
 4b8:	d00f      	beq.n	4da <drv_uart_interrupt_handler+0x60>
 4ba:	2302      	movs	r3, #2
 4bc:	7423      	strb	r3, [r4, #16]
 4be:	7aa3      	ldrb	r3, [r4, #10]
 4c0:	2b01      	cmp	r3, #1
 4c2:	d166      	bne.n	592 <drv_uart_interrupt_handler+0x118>
 4c4:	4620      	mov	r0, r4
 4c6:	f7ff ffd1 	bl	46c <uart_int_rx_parity_error_callback>
 4ca:	6822      	ldr	r2, [r4, #0]
 4cc:	6913      	ldr	r3, [r2, #16]
 4ce:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 4d2:	6113      	str	r3, [r2, #16]
 4d4:	6823      	ldr	r3, [r4, #0]
 4d6:	2200      	movs	r2, #0
 4d8:	611a      	str	r2, [r3, #16]
 4da:	f015 0f20 	tst.w	r5, #32
 4de:	f040 808a 	bne.w	5f6 <drv_uart_interrupt_handler+0x17c>
 4e2:	f015 0f10 	tst.w	r5, #16
 4e6:	f040 8092 	bne.w	60e <drv_uart_interrupt_handler+0x194>
 4ea:	f015 0f01 	tst.w	r5, #1
 4ee:	f040 809a 	bne.w	626 <drv_uart_interrupt_handler+0x1ac>
 4f2:	f015 0f02 	tst.w	r5, #2
 4f6:	f040 80a2 	bne.w	63e <drv_uart_interrupt_handler+0x1c4>
 4fa:	f015 0f04 	tst.w	r5, #4
 4fe:	f000 80c1 	beq.w	684 <drv_uart_interrupt_handler+0x20a>
 502:	7ce2      	ldrb	r2, [r4, #19]
 504:	7e23      	ldrb	r3, [r4, #24]
 506:	429a      	cmp	r2, r3
 508:	f0c0 80ac 	bcc.w	664 <drv_uart_interrupt_handler+0x1ea>
 50c:	6822      	ldr	r2, [r4, #0]
 50e:	68d3      	ldr	r3, [r2, #12]
 510:	f023 030c 	bic.w	r3, r3, #12
 514:	60d3      	str	r3, [r2, #12]
 516:	e0aa      	b.n	66e <drv_uart_interrupt_handler+0x1f4>
 518:	f7ff ffa6 	bl	468 <uart_int_tx_done_callback>
 51c:	6822      	ldr	r2, [r4, #0]
 51e:	6913      	ldr	r3, [r2, #16]
 520:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 524:	6113      	str	r3, [r2, #16]
 526:	6823      	ldr	r3, [r4, #0]
 528:	2200      	movs	r2, #0
 52a:	611a      	str	r2, [r3, #16]
 52c:	e7af      	b.n	48e <drv_uart_interrupt_handler+0x14>
 52e:	6822      	ldr	r2, [r4, #0]
 530:	68d3      	ldr	r3, [r2, #12]
 532:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 536:	60d3      	str	r3, [r2, #12]
 538:	2300      	movs	r3, #0
 53a:	7423      	strb	r3, [r4, #16]
 53c:	74a3      	strb	r3, [r4, #18]
 53e:	74e3      	strb	r3, [r4, #19]
 540:	6822      	ldr	r2, [r4, #0]
 542:	6853      	ldr	r3, [r2, #4]
 544:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 548:	6053      	str	r3, [r2, #4]
 54a:	6822      	ldr	r2, [r4, #0]
 54c:	6853      	ldr	r3, [r2, #4]
 54e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 552:	6053      	str	r3, [r2, #4]
 554:	6822      	ldr	r2, [r4, #0]
 556:	6853      	ldr	r3, [r2, #4]
 558:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 55c:	6053      	str	r3, [r2, #4]
 55e:	6822      	ldr	r2, [r4, #0]
 560:	6853      	ldr	r3, [r2, #4]
 562:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 566:	6053      	str	r3, [r2, #4]
 568:	6822      	ldr	r2, [r4, #0]
 56a:	6853      	ldr	r3, [r2, #4]
 56c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 570:	6053      	str	r3, [r2, #4]
 572:	6822      	ldr	r2, [r4, #0]
 574:	6853      	ldr	r3, [r2, #4]
 576:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 57a:	6053      	str	r3, [r2, #4]
 57c:	6822      	ldr	r2, [r4, #0]
 57e:	6853      	ldr	r3, [r2, #4]
 580:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 584:	6053      	str	r3, [r2, #4]
 586:	6822      	ldr	r2, [r4, #0]
 588:	6853      	ldr	r3, [r2, #4]
 58a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 58e:	6053      	str	r3, [r2, #4]
 590:	e785      	b.n	49e <drv_uart_interrupt_handler+0x24>
 592:	6822      	ldr	r2, [r4, #0]
 594:	68d3      	ldr	r3, [r2, #12]
 596:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 59a:	60d3      	str	r3, [r2, #12]
 59c:	2300      	movs	r3, #0
 59e:	7423      	strb	r3, [r4, #16]
 5a0:	74a3      	strb	r3, [r4, #18]
 5a2:	74e3      	strb	r3, [r4, #19]
 5a4:	6822      	ldr	r2, [r4, #0]
 5a6:	6853      	ldr	r3, [r2, #4]
 5a8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 5ac:	6053      	str	r3, [r2, #4]
 5ae:	6822      	ldr	r2, [r4, #0]
 5b0:	6853      	ldr	r3, [r2, #4]
 5b2:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 5b6:	6053      	str	r3, [r2, #4]
 5b8:	6822      	ldr	r2, [r4, #0]
 5ba:	6853      	ldr	r3, [r2, #4]
 5bc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 5c0:	6053      	str	r3, [r2, #4]
 5c2:	6822      	ldr	r2, [r4, #0]
 5c4:	6853      	ldr	r3, [r2, #4]
 5c6:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 5ca:	6053      	str	r3, [r2, #4]
 5cc:	6822      	ldr	r2, [r4, #0]
 5ce:	6853      	ldr	r3, [r2, #4]
 5d0:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 5d4:	6053      	str	r3, [r2, #4]
 5d6:	6822      	ldr	r2, [r4, #0]
 5d8:	6853      	ldr	r3, [r2, #4]
 5da:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 5de:	6053      	str	r3, [r2, #4]
 5e0:	6822      	ldr	r2, [r4, #0]
 5e2:	6853      	ldr	r3, [r2, #4]
 5e4:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 5e8:	6053      	str	r3, [r2, #4]
 5ea:	6822      	ldr	r2, [r4, #0]
 5ec:	6853      	ldr	r3, [r2, #4]
 5ee:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 5f2:	6053      	str	r3, [r2, #4]
 5f4:	e766      	b.n	4c4 <drv_uart_interrupt_handler+0x4a>
 5f6:	4620      	mov	r0, r4
 5f8:	f7ff ff39 	bl	46e <uart_int_rx_noise_detect_callback>
 5fc:	6822      	ldr	r2, [r4, #0]
 5fe:	6913      	ldr	r3, [r2, #16]
 600:	f043 0320 	orr.w	r3, r3, #32
 604:	6113      	str	r3, [r2, #16]
 606:	6823      	ldr	r3, [r4, #0]
 608:	2200      	movs	r2, #0
 60a:	611a      	str	r2, [r3, #16]
 60c:	e769      	b.n	4e2 <drv_uart_interrupt_handler+0x68>
 60e:	4620      	mov	r0, r4
 610:	f7ff ff2e 	bl	470 <uart_int_rx_stop_detect_callback>
 614:	6822      	ldr	r2, [r4, #0]
 616:	6913      	ldr	r3, [r2, #16]
 618:	f043 0310 	orr.w	r3, r3, #16
 61c:	6113      	str	r3, [r2, #16]
 61e:	6823      	ldr	r3, [r4, #0]
 620:	2200      	movs	r2, #0
 622:	611a      	str	r2, [r3, #16]
 624:	e761      	b.n	4ea <drv_uart_interrupt_handler+0x70>
 626:	4620      	mov	r0, r4
 628:	f7ff ff24 	bl	474 <uart_int_tx_fifo_thres_callback>
 62c:	6822      	ldr	r2, [r4, #0]
 62e:	6913      	ldr	r3, [r2, #16]
 630:	f043 0301 	orr.w	r3, r3, #1
 634:	6113      	str	r3, [r2, #16]
 636:	6823      	ldr	r3, [r4, #0]
 638:	2200      	movs	r2, #0
 63a:	611a      	str	r2, [r3, #16]
 63c:	e759      	b.n	4f2 <drv_uart_interrupt_handler+0x78>
 63e:	4620      	mov	r0, r4
 640:	f7ff ff17 	bl	472 <uart_int_tx_fifo_empty_callback>
 644:	6822      	ldr	r2, [r4, #0]
 646:	6913      	ldr	r3, [r2, #16]
 648:	f043 0302 	orr.w	r3, r3, #2
 64c:	6113      	str	r3, [r2, #16]
 64e:	6823      	ldr	r3, [r4, #0]
 650:	2200      	movs	r2, #0
 652:	611a      	str	r2, [r3, #16]
 654:	e751      	b.n	4fa <drv_uart_interrupt_handler+0x80>
 656:	69d9      	ldr	r1, [r3, #28]
 658:	6962      	ldr	r2, [r4, #20]
 65a:	7ce3      	ldrb	r3, [r4, #19]
 65c:	1c58      	adds	r0, r3, #1
 65e:	74e0      	strb	r0, [r4, #19]
 660:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 664:	6823      	ldr	r3, [r4, #0]
 666:	695a      	ldr	r2, [r3, #20]
 668:	f012 0f1f 	tst.w	r2, #31
 66c:	d1f3      	bne.n	656 <drv_uart_interrupt_handler+0x1dc>
 66e:	4620      	mov	r0, r4
 670:	f7ff ff02 	bl	478 <uart_int_rx_fifo_thres_callback>
 674:	6822      	ldr	r2, [r4, #0]
 676:	6913      	ldr	r3, [r2, #16]
 678:	f043 0304 	orr.w	r3, r3, #4
 67c:	6113      	str	r3, [r2, #16]
 67e:	6823      	ldr	r3, [r4, #0]
 680:	2200      	movs	r2, #0
 682:	611a      	str	r2, [r3, #16]
 684:	f015 0f08 	tst.w	r5, #8
 688:	d020      	beq.n	6cc <drv_uart_interrupt_handler+0x252>
 68a:	7ce2      	ldrb	r2, [r4, #19]
 68c:	7e23      	ldrb	r3, [r4, #24]
 68e:	429a      	cmp	r2, r3
 690:	d30c      	bcc.n	6ac <drv_uart_interrupt_handler+0x232>
 692:	6822      	ldr	r2, [r4, #0]
 694:	68d3      	ldr	r3, [r2, #12]
 696:	f023 030c 	bic.w	r3, r3, #12
 69a:	60d3      	str	r3, [r2, #12]
 69c:	e00b      	b.n	6b6 <drv_uart_interrupt_handler+0x23c>
 69e:	69d9      	ldr	r1, [r3, #28]
 6a0:	6962      	ldr	r2, [r4, #20]
 6a2:	7ce3      	ldrb	r3, [r4, #19]
 6a4:	1c58      	adds	r0, r3, #1
 6a6:	74e0      	strb	r0, [r4, #19]
 6a8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 6ac:	6823      	ldr	r3, [r4, #0]
 6ae:	695a      	ldr	r2, [r3, #20]
 6b0:	f012 0f1f 	tst.w	r2, #31
 6b4:	d1f3      	bne.n	69e <drv_uart_interrupt_handler+0x224>
 6b6:	4620      	mov	r0, r4
 6b8:	f7ff fedd 	bl	476 <uart_int_rx_fifo_noempty_callback>
 6bc:	6822      	ldr	r2, [r4, #0]
 6be:	6913      	ldr	r3, [r2, #16]
 6c0:	f043 0308 	orr.w	r3, r3, #8
 6c4:	6113      	str	r3, [r2, #16]
 6c6:	6823      	ldr	r3, [r4, #0]
 6c8:	2200      	movs	r2, #0
 6ca:	611a      	str	r2, [r3, #16]
 6cc:	bd38      	pop	{r3, r4, r5, pc}
	...

000006d0 <eth_sma_init>:
 6d0:	b510      	push	{r4, lr}
 6d2:	4c05      	ldr	r4, [pc, #20]	; (6e8 <eth_sma_init+0x18>)
 6d4:	4b05      	ldr	r3, [pc, #20]	; (6ec <eth_sma_init+0x1c>)
 6d6:	6023      	str	r3, [r4, #0]
 6d8:	4620      	mov	r0, r4
 6da:	f7ff fcfe 	bl	da <drv_eth_sma_default_config>
 6de:	4620      	mov	r0, r4
 6e0:	f7ff fd0f 	bl	102 <drv_eth_sma_init>
 6e4:	bd10      	pop	{r4, pc}
 6e6:	bf00      	nop
 6e8:	000200ac 	andeq	r0, r2, ip, lsr #1
 6ec:	40020000 	andmi	r0, r2, r0

000006f0 <b50610_init>:
 6f0:	b510      	push	{r4, lr}
 6f2:	4c0a      	ldr	r4, [pc, #40]	; (71c <b50610_init+0x2c>)
 6f4:	2319      	movs	r3, #25
 6f6:	7163      	strb	r3, [r4, #5]
 6f8:	4620      	mov	r0, r4
 6fa:	f7ff fcf3 	bl	e4 <drv_eth_sma_set_config>
 6fe:	6823      	ldr	r3, [r4, #0]
 700:	685a      	ldr	r2, [r3, #4]
 702:	f042 0201 	orr.w	r2, r2, #1
 706:	605a      	str	r2, [r3, #4]
 708:	685a      	ldr	r2, [r3, #4]
 70a:	f022 0201 	bic.w	r2, r2, #1
 70e:	605a      	str	r2, [r3, #4]
 710:	2202      	movs	r2, #2
 712:	4903      	ldr	r1, [pc, #12]	; (720 <b50610_init+0x30>)
 714:	4620      	mov	r0, r4
 716:	f7ff fd2c 	bl	172 <drv_eth_sma_master_write_reglist>
 71a:	bd10      	pop	{r4, pc}
 71c:	000200ac 	andeq	r0, r2, ip, lsr #1
 720:	00020000 	andeq	r0, r2, r0

00000724 <b50610_init_test>:
 724:	b508      	push	{r3, lr}
 726:	f7ff ffd3 	bl	6d0 <eth_sma_init>
 72a:	f7ff ffe1 	bl	6f0 <b50610_init>
 72e:	bd08      	pop	{r3, pc}

00000730 <b50610_get_reglist_test>:
 730:	b538      	push	{r3, r4, r5, lr}
 732:	2208      	movs	r2, #8
 734:	4912      	ldr	r1, [pc, #72]	; (780 <b50610_get_reglist_test+0x50>)
 736:	4813      	ldr	r0, [pc, #76]	; (784 <b50610_get_reglist_test+0x54>)
 738:	f7ff fd48 	bl	1cc <drv_eth_sma_master_read_reglist>
 73c:	b920      	cbnz	r0, 748 <b50610_get_reglist_test+0x18>
 73e:	4812      	ldr	r0, [pc, #72]	; (788 <b50610_get_reglist_test+0x58>)
 740:	f000 f8aa 	bl	898 <test_printf_s>
 744:	2400      	movs	r4, #0
 746:	e015      	b.n	774 <b50610_get_reglist_test+0x44>
 748:	4810      	ldr	r0, [pc, #64]	; (78c <b50610_get_reglist_test+0x5c>)
 74a:	f000 f8a5 	bl	898 <test_printf_s>
 74e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 752:	f64f 72ff 	movw	r2, #65535	; 0xffff
 756:	601a      	str	r2, [r3, #0]
 758:	e011      	b.n	77e <b50610_get_reglist_test+0x4e>
 75a:	4d09      	ldr	r5, [pc, #36]	; (780 <b50610_get_reglist_test+0x50>)
 75c:	f855 1024 	ldr.w	r1, [r5, r4, lsl #2]
 760:	480b      	ldr	r0, [pc, #44]	; (790 <b50610_get_reglist_test+0x60>)
 762:	f000 f89a 	bl	89a <test_printf_ch>
 766:	f855 2024 	ldr.w	r2, [r5, r4, lsl #2]
 76a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 76e:	605a      	str	r2, [r3, #4]
 770:	3401      	adds	r4, #1
 772:	b2e4      	uxtb	r4, r4
 774:	2c07      	cmp	r4, #7
 776:	d9f0      	bls.n	75a <b50610_get_reglist_test+0x2a>
 778:	4806      	ldr	r0, [pc, #24]	; (794 <b50610_get_reglist_test+0x64>)
 77a:	f000 f88d 	bl	898 <test_printf_s>
 77e:	bd38      	pop	{r3, r4, r5, pc}
 780:	00020008 	andeq	r0, r2, r8
 784:	000200ac 	andeq	r0, r2, ip, lsr #1
 788:	000008f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 78c:	000008e0 	andeq	r0, r0, r0, ror #17
 790:	00000900 	andeq	r0, r0, r0, lsl #18
 794:	000008ec 	andeq	r0, r0, ip, ror #17

00000798 <NMI_Handler>:
 798:	4770      	bx	lr

0000079a <HardFault_Handler>:
 79a:	e7fe      	b.n	79a <HardFault_Handler>

0000079c <MemManage_Handler>:
 79c:	e7fe      	b.n	79c <MemManage_Handler>

0000079e <BusFault_Handler>:
 79e:	e7fe      	b.n	79e <BusFault_Handler>

000007a0 <UsageFault_Handler>:
 7a0:	e7fe      	b.n	7a0 <UsageFault_Handler>

000007a2 <SVC_Handler>:
 7a2:	4770      	bx	lr

000007a4 <DebugMon_Handler>:
 7a4:	4770      	bx	lr

000007a6 <PendSV_Handler>:
 7a6:	4770      	bx	lr

000007a8 <SysTick_Handler>:
 7a8:	4770      	bx	lr
	...

000007ac <Uart0_Handler>:
 7ac:	b508      	push	{r3, lr}
 7ae:	4b04      	ldr	r3, [pc, #16]	; (7c0 <Uart0_Handler+0x14>)
 7b0:	2201      	movs	r2, #1
 7b2:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 7b6:	4803      	ldr	r0, [pc, #12]	; (7c4 <Uart0_Handler+0x18>)
 7b8:	f7ff fe5f 	bl	47a <drv_uart_interrupt_handler>
 7bc:	bd08      	pop	{r3, pc}
 7be:	bf00      	nop
 7c0:	e000e100 	and	lr, r0, r0, lsl #2
 7c4:	000200c0 	andeq	r0, r2, r0, asr #1

000007c8 <EthSma_Handler>:
 7c8:	b508      	push	{r3, lr}
 7ca:	4b04      	ldr	r3, [pc, #16]	; (7dc <EthSma_Handler+0x14>)
 7cc:	f44f 5280 	mov.w	r2, #4096	; 0x1000
 7d0:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 7d4:	4802      	ldr	r0, [pc, #8]	; (7e0 <EthSma_Handler+0x18>)
 7d6:	f7ff fd69 	bl	2ac <drv_eth_sma_interrupt_handler>
 7da:	bd08      	pop	{r3, pc}
 7dc:	e000e100 	and	lr, r0, r0, lsl #2
 7e0:	000200ac 	andeq	r0, r2, ip, lsr #1

000007e4 <main>:
 7e4:	b508      	push	{r3, lr}
 7e6:	f000 f847 	bl	878 <uart0_init>
 7ea:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 7ee:	23bd      	movs	r3, #189	; 0xbd
 7f0:	60a3      	str	r3, [r4, #8]
 7f2:	f7ff ff97 	bl	724 <b50610_init_test>
 7f6:	f640 33d1 	movw	r3, #3025	; 0xbd1
 7fa:	60a3      	str	r3, [r4, #8]
 7fc:	f7ff ff98 	bl	730 <b50610_get_reglist_test>
 800:	23ed      	movs	r3, #237	; 0xed
 802:	60a3      	str	r3, [r4, #8]
 804:	e7fe      	b.n	804 <main+0x20>
	...

00000808 <Reset_Handler>:
 808:	490a      	ldr	r1, [pc, #40]	; (834 <Reset_Handler+0x2c>)
 80a:	4a0b      	ldr	r2, [pc, #44]	; (838 <Reset_Handler+0x30>)
 80c:	4b0b      	ldr	r3, [pc, #44]	; (83c <Reset_Handler+0x34>)
 80e:	1a9b      	subs	r3, r3, r2
 810:	dd03      	ble.n	81a <Reset_Handler+0x12>
 812:	3b04      	subs	r3, #4
 814:	58c8      	ldr	r0, [r1, r3]
 816:	50d0      	str	r0, [r2, r3]
 818:	dcfb      	bgt.n	812 <Reset_Handler+0xa>
 81a:	4909      	ldr	r1, [pc, #36]	; (840 <Reset_Handler+0x38>)
 81c:	4a09      	ldr	r2, [pc, #36]	; (844 <Reset_Handler+0x3c>)
 81e:	2000      	movs	r0, #0
 820:	4291      	cmp	r1, r2
 822:	bfbc      	itt	lt
 824:	f841 0b04 	strlt.w	r0, [r1], #4
 828:	e7fa      	blt.n	820 <Reset_Handler+0x18>
 82a:	f7ff ffdb 	bl	7e4 <main>
 82e:	f000 f835 	bl	89c <exit>
 832:	090c0000 	stmdbeq	ip, {}	; <UNPREDICTABLE>
 836:	00000000 	andeq	r0, r0, r0
 83a:	00900002 	addseq	r0, r0, r2
 83e:	00900002 	addseq	r0, r0, r2
 842:	00dc0002 	sbcseq	r0, ip, r2
 846:	e7fe0002 	ldrb	r0, [lr, r2]!
 84a:	e7fe      	b.n	84a <Reset_Handler+0x42>
 84c:	e7fe      	b.n	84c <Reset_Handler+0x44>
 84e:	e7fe      	b.n	84e <Reset_Handler+0x46>
 850:	e7fe      	b.n	850 <Reset_Handler+0x48>
 852:	e7fe      	b.n	852 <Reset_Handler+0x4a>
 854:	e7fe      	b.n	854 <Reset_Handler+0x4c>
 856:	e7fe      	b.n	856 <Reset_Handler+0x4e>
 858:	e7fe      	b.n	858 <Reset_Handler+0x50>
 85a:	e7fe      	b.n	85a <Reset_Handler+0x52>

0000085c <Uart1_Handler>:
 85c:	e7fe      	b.n	85c <Uart1_Handler>

0000085e <Resv2_Handler>:
 85e:	e7fe      	b.n	85e <Resv2_Handler>

00000860 <Resv3_Handler>:
 860:	e7fe      	b.n	860 <Resv3_Handler>

00000862 <Resv4_Handler>:
 862:	e7fe      	b.n	862 <Resv4_Handler>

00000864 <Gpioa_Handler>:
 864:	e7fe      	b.n	864 <Gpioa_Handler>

00000866 <Resv6_Handler>:
 866:	e7fe      	b.n	866 <Resv6_Handler>

00000868 <Resv7_Handler>:
 868:	e7fe      	b.n	868 <Resv7_Handler>

0000086a <Bastim_Ch0_Handler>:
 86a:	e7fe      	b.n	86a <Bastim_Ch0_Handler>

0000086c <Bastim_Ch1_Handler>:
 86c:	e7fe      	b.n	86c <Bastim_Ch1_Handler>

0000086e <Bastim_Ch2_Handler>:
 86e:	e7fe      	b.n	86e <Bastim_Ch2_Handler>

00000870 <Bastim_Ch3_Handler>:
 870:	e7fe      	b.n	870 <Bastim_Ch3_Handler>
 872:	e7fe      	b.n	872 <Bastim_Ch3_Handler+0x2>

00000874 <Resv13_Handler>:
 874:	e7fe      	b.n	874 <Resv13_Handler>
 876:	bf00      	nop

00000878 <uart0_init>:
 878:	b510      	push	{r4, lr}
 87a:	4c05      	ldr	r4, [pc, #20]	; (890 <uart0_init+0x18>)
 87c:	4b05      	ldr	r3, [pc, #20]	; (894 <uart0_init+0x1c>)
 87e:	6023      	str	r3, [r4, #0]
 880:	4620      	mov	r0, r4
 882:	f7ff fd76 	bl	372 <drv_uart_default_config>
 886:	4620      	mov	r0, r4
 888:	f7ff fda6 	bl	3d8 <drv_uart_init>
 88c:	bd10      	pop	{r4, pc}
 88e:	bf00      	nop
 890:	000200c0 	andeq	r0, r2, r0, asr #1
 894:	40001000 	andmi	r1, r0, r0

00000898 <test_printf_s>:
 898:	4770      	bx	lr

0000089a <test_printf_ch>:
 89a:	4770      	bx	lr

0000089c <exit>:
 89c:	b508      	push	{r3, lr}
 89e:	4b07      	ldr	r3, [pc, #28]	; (8bc <exit+0x20>)
 8a0:	4604      	mov	r4, r0
 8a2:	b113      	cbz	r3, 8aa <exit+0xe>
 8a4:	2100      	movs	r1, #0
 8a6:	f3af 8000 	nop.w
 8aa:	4b05      	ldr	r3, [pc, #20]	; (8c0 <exit+0x24>)
 8ac:	6818      	ldr	r0, [r3, #0]
 8ae:	6a83      	ldr	r3, [r0, #40]	; 0x28
 8b0:	b103      	cbz	r3, 8b4 <exit+0x18>
 8b2:	4798      	blx	r3
 8b4:	4620      	mov	r0, r4
 8b6:	f000 f805 	bl	8c4 <_exit>
 8ba:	bf00      	nop
 8bc:	00000000 	andeq	r0, r0, r0
 8c0:	00000904 	andeq	r0, r0, r4, lsl #18

000008c4 <_exit>:
 8c4:	e7fe      	b.n	8c4 <_exit>
 8c6:	bf00      	nop

000008c8 <_init>:
 8c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8ca:	bf00      	nop
 8cc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8ce:	bc08      	pop	{r3}
 8d0:	469e      	mov	lr, r3
 8d2:	4770      	bx	lr

000008d4 <_fini>:
 8d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8d6:	bf00      	nop
 8d8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8da:	bc08      	pop	{r3}
 8dc:	469e      	mov	lr, r3
 8de:	4770      	bx	lr
 8e0:	36303562 	ldrtcc	r3, [r0], -r2, ror #10
 8e4:	6e203031 	mcrvs	0, 1, r3, cr0, cr1, {1}
 8e8:	2e6b6361 	cdpcs	3, 6, cr6, cr11, cr1, {3}
 8ec:	00000a0d 	andeq	r0, r0, sp, lsl #20
 8f0:	36303562 	ldrtcc	r3, [r0], -r2, ror #10
 8f4:	72203031 	eorvc	r3, r0, #49	; 0x31
 8f8:	3a646165 	bcc	1918e94 <__StackTop+0x18f6e94>
 8fc:	00000a0d 	andeq	r0, r0, sp, lsl #20
 900:	00207825 	eoreq	r7, r0, r5, lsr #16

00000904 <_global_impure_ptr>:
 904:	00020028 	andeq	r0, r2, r8, lsr #32

00000908 <__EH_FRAME_BEGIN__>:
 908:	00000000 	andeq	r0, r0, r0

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
  18:	0000089c 	muleq	r0, ip, r8
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000008c4 	andeq	r0, r0, r4, asr #17
  44:	00000002 	andeq	r0, r0, r2

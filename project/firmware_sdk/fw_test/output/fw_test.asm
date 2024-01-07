
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00012000 	andeq	r2, r1, r0
   4:	00000445 	andeq	r0, r0, r5, asr #8
   8:	000003e1 	andeq	r0, r0, r1, ror #7
   c:	000003e3 	andeq	r0, r0, r3, ror #7
  10:	000003e5 	andeq	r0, r0, r5, ror #7
  14:	000003e7 	andeq	r0, r0, r7, ror #7
  18:	000003e9 	andeq	r0, r0, r9, ror #7
	...
  2c:	000003eb 	andeq	r0, r0, fp, ror #7
  30:	000003ed 	andeq	r0, r0, sp, ror #7
  34:	00000000 	andeq	r0, r0, r0
  38:	000003ef 	andeq	r0, r0, pc, ror #7
  3c:	000003f1 	strdeq	r0, [r0], -r1
  40:	000003f5 	strdeq	r0, [r0], -r5
  44:	00000411 	andeq	r0, r0, r1, lsl r4

00000048 <__do_global_dtors_aux>:
  48:	b510      	push	{r4, lr}
  4a:	4c05      	ldr	r4, [pc, #20]	; (60 <__do_global_dtors_aux+0x18>)
  4c:	7823      	ldrb	r3, [r4, #0]
  4e:	b933      	cbnz	r3, 5e <__do_global_dtors_aux+0x16>
  50:	4b04      	ldr	r3, [pc, #16]	; (64 <__do_global_dtors_aux+0x1c>)
  52:	b113      	cbz	r3, 5a <__do_global_dtors_aux+0x12>
  54:	4804      	ldr	r0, [pc, #16]	; (68 <__do_global_dtors_aux+0x20>)
  56:	f3af 8000 	nop.w
  5a:	2301      	movs	r3, #1
  5c:	7023      	strb	r3, [r4, #0]
  5e:	bd10      	pop	{r4, pc}
  60:	00010068 	andeq	r0, r1, r8, rrx
  64:	00000000 	andeq	r0, r0, r0
  68:	000005c0 	andeq	r0, r0, r0, asr #11

0000006c <frame_dummy>:
  6c:	b508      	push	{r3, lr}
  6e:	4b03      	ldr	r3, [pc, #12]	; (7c <frame_dummy+0x10>)
  70:	b11b      	cbz	r3, 7a <frame_dummy+0xe>
  72:	4903      	ldr	r1, [pc, #12]	; (80 <frame_dummy+0x14>)
  74:	4803      	ldr	r0, [pc, #12]	; (84 <frame_dummy+0x18>)
  76:	f3af 8000 	nop.w
  7a:	bd08      	pop	{r3, pc}
  7c:	00000000 	andeq	r0, r0, r0
  80:	0001006c 	andeq	r0, r1, ip, rrx
  84:	000005c0 	andeq	r0, r0, r0, asr #11

00000088 <drv_check_rw_data>:
  88:	6001      	str	r1, [r0, #0]
  8a:	6803      	ldr	r3, [r0, #0]
  8c:	4293      	cmp	r3, r2
  8e:	d007      	beq.n	a0 <drv_check_rw_data+0x18>
  90:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  94:	2001      	movs	r0, #1
  96:	6018      	str	r0, [r3, #0]
  98:	685a      	ldr	r2, [r3, #4]
  9a:	4402      	add	r2, r0
  9c:	601a      	str	r2, [r3, #0]
  9e:	4770      	bx	lr
  a0:	2000      	movs	r0, #0
  a2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
  a6:	6018      	str	r0, [r3, #0]
  a8:	4770      	bx	lr

000000aa <drv_uart_default_config>:
  aa:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
  ae:	6043      	str	r3, [r0, #4]
  b0:	230f      	movs	r3, #15
  b2:	7203      	strb	r3, [r0, #8]
  b4:	2300      	movs	r3, #0
  b6:	7243      	strb	r3, [r0, #9]
  b8:	7283      	strb	r3, [r0, #10]
  ba:	72c3      	strb	r3, [r0, #11]
  bc:	7303      	strb	r3, [r0, #12]
  be:	7343      	strb	r3, [r0, #13]
  c0:	2301      	movs	r3, #1
  c2:	7383      	strb	r3, [r0, #14]
  c4:	4770      	bx	lr
	...

000000c8 <drv_uart_set_config>:
  c8:	b508      	push	{r3, lr}
  ca:	6841      	ldr	r1, [r0, #4]
  cc:	7a03      	ldrb	r3, [r0, #8]
  ce:	fb03 f201 	mul.w	r2, r3, r1
  d2:	490e      	ldr	r1, [pc, #56]	; (10c <drv_uart_set_config+0x44>)
  d4:	fbb1 f2f2 	udiv	r2, r1, r2
  d8:	0419      	lsls	r1, r3, #16
  da:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
  de:	7a43      	ldrb	r3, [r0, #9]
  e0:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
  e4:	7a83      	ldrb	r3, [r0, #10]
  e6:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
  ea:	7ac3      	ldrb	r3, [r0, #11]
  ec:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
  f0:	7b03      	ldrb	r3, [r0, #12]
  f2:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
  f6:	7b42      	ldrb	r2, [r0, #13]
  f8:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
  fc:	7b82      	ldrb	r2, [r0, #14]
  fe:	4311      	orrs	r1, r2
 100:	6800      	ldr	r0, [r0, #0]
 102:	460a      	mov	r2, r1
 104:	3008      	adds	r0, #8
 106:	f7ff ffbf 	bl	88 <drv_check_rw_data>
 10a:	bd08      	pop	{r3, pc}
 10c:	02625a00 	rsbeq	r5, r2, #0, 20

00000110 <drv_uart_init>:
 110:	b538      	push	{r3, r4, r5, lr}
 112:	4604      	mov	r4, r0
 114:	2500      	movs	r5, #0
 116:	7485      	strb	r5, [r0, #18]
 118:	74c5      	strb	r5, [r0, #19]
 11a:	f7ff ffd5 	bl	c8 <drv_uart_set_config>
 11e:	7425      	strb	r5, [r4, #16]
 120:	74a5      	strb	r5, [r4, #18]
 122:	74e5      	strb	r5, [r4, #19]
 124:	6822      	ldr	r2, [r4, #0]
 126:	6853      	ldr	r3, [r2, #4]
 128:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 12c:	6053      	str	r3, [r2, #4]
 12e:	6822      	ldr	r2, [r4, #0]
 130:	6853      	ldr	r3, [r2, #4]
 132:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 136:	6053      	str	r3, [r2, #4]
 138:	6822      	ldr	r2, [r4, #0]
 13a:	6853      	ldr	r3, [r2, #4]
 13c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 140:	6053      	str	r3, [r2, #4]
 142:	6822      	ldr	r2, [r4, #0]
 144:	6853      	ldr	r3, [r2, #4]
 146:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 14a:	6053      	str	r3, [r2, #4]
 14c:	6822      	ldr	r2, [r4, #0]
 14e:	6853      	ldr	r3, [r2, #4]
 150:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 154:	6053      	str	r3, [r2, #4]
 156:	6822      	ldr	r2, [r4, #0]
 158:	6853      	ldr	r3, [r2, #4]
 15a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 15e:	6053      	str	r3, [r2, #4]
 160:	6822      	ldr	r2, [r4, #0]
 162:	6853      	ldr	r3, [r2, #4]
 164:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 168:	6053      	str	r3, [r2, #4]
 16a:	6822      	ldr	r2, [r4, #0]
 16c:	6853      	ldr	r3, [r2, #4]
 16e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 172:	6053      	str	r3, [r2, #4]
 174:	6823      	ldr	r3, [r4, #0]
 176:	f240 12ff 	movw	r2, #511	; 0x1ff
 17a:	611a      	str	r2, [r3, #16]
 17c:	6823      	ldr	r3, [r4, #0]
 17e:	611d      	str	r5, [r3, #16]
 180:	6822      	ldr	r2, [r4, #0]
 182:	6853      	ldr	r3, [r2, #4]
 184:	f043 0301 	orr.w	r3, r3, #1
 188:	6053      	str	r3, [r2, #4]
 18a:	6822      	ldr	r2, [r4, #0]
 18c:	6853      	ldr	r3, [r2, #4]
 18e:	f023 0301 	bic.w	r3, r3, #1
 192:	6053      	str	r3, [r2, #4]
 194:	6822      	ldr	r2, [r4, #0]
 196:	6853      	ldr	r3, [r2, #4]
 198:	f043 0302 	orr.w	r3, r3, #2
 19c:	6053      	str	r3, [r2, #4]
 19e:	bd38      	pop	{r3, r4, r5, pc}

000001a0 <drv_uart_rx_data_it>:
 1a0:	6141      	str	r1, [r0, #20]
 1a2:	7602      	strb	r2, [r0, #24]
 1a4:	2300      	movs	r3, #0
 1a6:	74c3      	strb	r3, [r0, #19]
 1a8:	6802      	ldr	r2, [r0, #0]
 1aa:	68d3      	ldr	r3, [r2, #12]
 1ac:	f043 03cc 	orr.w	r3, r3, #204	; 0xcc
 1b0:	60d3      	str	r3, [r2, #12]
 1b2:	4770      	bx	lr

000001b4 <uart_int_tx_done_callback>:
 1b4:	4770      	bx	lr

000001b6 <uart_int_rx_stop_callback>:
 1b6:	4770      	bx	lr

000001b8 <uart_int_rx_parity_error_callback>:
 1b8:	4770      	bx	lr

000001ba <uart_int_rx_noise_detect_callback>:
 1ba:	4770      	bx	lr

000001bc <uart_int_rx_stop_detect_callback>:
 1bc:	4770      	bx	lr

000001be <uart_int_tx_fifo_empty_callback>:
 1be:	4770      	bx	lr

000001c0 <uart_int_tx_fifo_thres_callback>:
 1c0:	4770      	bx	lr

000001c2 <uart_int_rx_fifo_noempty_callback>:
 1c2:	4770      	bx	lr

000001c4 <uart_int_rx_fifo_thres_callback>:
 1c4:	4770      	bx	lr

000001c6 <drv_uart_interrupt_handler>:
 1c6:	b538      	push	{r3, r4, r5, lr}
 1c8:	4604      	mov	r4, r0
 1ca:	6803      	ldr	r3, [r0, #0]
 1cc:	699d      	ldr	r5, [r3, #24]
 1ce:	68db      	ldr	r3, [r3, #12]
 1d0:	b29b      	uxth	r3, r3
 1d2:	401d      	ands	r5, r3
 1d4:	f415 7f80 	tst.w	r5, #256	; 0x100
 1d8:	d142      	bne.n	260 <Stack_Size+0x60>
 1da:	f015 0f40 	tst.w	r5, #64	; 0x40
 1de:	d14a      	bne.n	276 <Stack_Size+0x76>
 1e0:	f015 0f80 	tst.w	r5, #128	; 0x80
 1e4:	d155      	bne.n	292 <Stack_Size+0x92>
 1e6:	f015 0f20 	tst.w	r5, #32
 1ea:	d160      	bne.n	2ae <Stack_Size+0xae>
 1ec:	f015 0f10 	tst.w	r5, #16
 1f0:	d169      	bne.n	2c6 <Stack_Size+0xc6>
 1f2:	f015 0f01 	tst.w	r5, #1
 1f6:	d172      	bne.n	2de <Stack_Size+0xde>
 1f8:	f015 0f02 	tst.w	r5, #2
 1fc:	d17b      	bne.n	2f6 <Stack_Size+0xf6>
 1fe:	f015 0f04 	tst.w	r5, #4
 202:	d014      	beq.n	22e <Stack_Size+0x2e>
 204:	7ce2      	ldrb	r2, [r4, #19]
 206:	7e23      	ldrb	r3, [r4, #24]
 208:	429a      	cmp	r2, r3
 20a:	f0c0 8087 	bcc.w	31c <Stack_Size+0x11c>
 20e:	7ce2      	ldrb	r2, [r4, #19]
 210:	7e23      	ldrb	r3, [r4, #24]
 212:	429a      	cmp	r2, r3
 214:	f000 8093 	beq.w	33e <Stack_Size+0x13e>
 218:	4620      	mov	r0, r4
 21a:	f7ff ffd3 	bl	1c4 <uart_int_rx_fifo_thres_callback>
 21e:	6822      	ldr	r2, [r4, #0]
 220:	6913      	ldr	r3, [r2, #16]
 222:	f043 0304 	orr.w	r3, r3, #4
 226:	6113      	str	r3, [r2, #16]
 228:	6823      	ldr	r3, [r4, #0]
 22a:	2200      	movs	r2, #0
 22c:	611a      	str	r2, [r3, #16]
 22e:	f015 0f08 	tst.w	r5, #8
 232:	d014      	beq.n	25e <Stack_Size+0x5e>
 234:	7ce2      	ldrb	r2, [r4, #19]
 236:	7e23      	ldrb	r3, [r4, #24]
 238:	429a      	cmp	r2, r3
 23a:	f0c0 808d 	bcc.w	358 <Stack_Size+0x158>
 23e:	7ce2      	ldrb	r2, [r4, #19]
 240:	7e23      	ldrb	r3, [r4, #24]
 242:	429a      	cmp	r2, r3
 244:	f000 80c6 	beq.w	3d4 <Stack_Size+0x1d4>
 248:	4620      	mov	r0, r4
 24a:	f7ff ffba 	bl	1c2 <uart_int_rx_fifo_noempty_callback>
 24e:	6822      	ldr	r2, [r4, #0]
 250:	6913      	ldr	r3, [r2, #16]
 252:	f043 0308 	orr.w	r3, r3, #8
 256:	6113      	str	r3, [r2, #16]
 258:	6823      	ldr	r3, [r4, #0]
 25a:	2200      	movs	r2, #0
 25c:	611a      	str	r2, [r3, #16]
 25e:	bd38      	pop	{r3, r4, r5, pc}
 260:	f7ff ffa8 	bl	1b4 <uart_int_tx_done_callback>
 264:	6822      	ldr	r2, [r4, #0]
 266:	6913      	ldr	r3, [r2, #16]
 268:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 26c:	6113      	str	r3, [r2, #16]
 26e:	6823      	ldr	r3, [r4, #0]
 270:	2200      	movs	r2, #0
 272:	611a      	str	r2, [r3, #16]
 274:	e7b1      	b.n	1da <drv_uart_interrupt_handler+0x14>
 276:	2301      	movs	r3, #1
 278:	7423      	strb	r3, [r4, #16]
 27a:	4620      	mov	r0, r4
 27c:	f7ff ff9b 	bl	1b6 <uart_int_rx_stop_callback>
 280:	6822      	ldr	r2, [r4, #0]
 282:	6913      	ldr	r3, [r2, #16]
 284:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 288:	6113      	str	r3, [r2, #16]
 28a:	6823      	ldr	r3, [r4, #0]
 28c:	2200      	movs	r2, #0
 28e:	611a      	str	r2, [r3, #16]
 290:	e7a6      	b.n	1e0 <drv_uart_interrupt_handler+0x1a>
 292:	2302      	movs	r3, #2
 294:	7423      	strb	r3, [r4, #16]
 296:	4620      	mov	r0, r4
 298:	f7ff ff8e 	bl	1b8 <uart_int_rx_parity_error_callback>
 29c:	6822      	ldr	r2, [r4, #0]
 29e:	6913      	ldr	r3, [r2, #16]
 2a0:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 2a4:	6113      	str	r3, [r2, #16]
 2a6:	6823      	ldr	r3, [r4, #0]
 2a8:	2200      	movs	r2, #0
 2aa:	611a      	str	r2, [r3, #16]
 2ac:	e79b      	b.n	1e6 <drv_uart_interrupt_handler+0x20>
 2ae:	4620      	mov	r0, r4
 2b0:	f7ff ff83 	bl	1ba <uart_int_rx_noise_detect_callback>
 2b4:	6822      	ldr	r2, [r4, #0]
 2b6:	6913      	ldr	r3, [r2, #16]
 2b8:	f043 0320 	orr.w	r3, r3, #32
 2bc:	6113      	str	r3, [r2, #16]
 2be:	6823      	ldr	r3, [r4, #0]
 2c0:	2200      	movs	r2, #0
 2c2:	611a      	str	r2, [r3, #16]
 2c4:	e792      	b.n	1ec <drv_uart_interrupt_handler+0x26>
 2c6:	4620      	mov	r0, r4
 2c8:	f7ff ff78 	bl	1bc <uart_int_rx_stop_detect_callback>
 2cc:	6822      	ldr	r2, [r4, #0]
 2ce:	6913      	ldr	r3, [r2, #16]
 2d0:	f043 0310 	orr.w	r3, r3, #16
 2d4:	6113      	str	r3, [r2, #16]
 2d6:	6823      	ldr	r3, [r4, #0]
 2d8:	2200      	movs	r2, #0
 2da:	611a      	str	r2, [r3, #16]
 2dc:	e789      	b.n	1f2 <drv_uart_interrupt_handler+0x2c>
 2de:	4620      	mov	r0, r4
 2e0:	f7ff ff6e 	bl	1c0 <uart_int_tx_fifo_thres_callback>
 2e4:	6822      	ldr	r2, [r4, #0]
 2e6:	6913      	ldr	r3, [r2, #16]
 2e8:	f043 0301 	orr.w	r3, r3, #1
 2ec:	6113      	str	r3, [r2, #16]
 2ee:	6823      	ldr	r3, [r4, #0]
 2f0:	2200      	movs	r2, #0
 2f2:	611a      	str	r2, [r3, #16]
 2f4:	e780      	b.n	1f8 <drv_uart_interrupt_handler+0x32>
 2f6:	4620      	mov	r0, r4
 2f8:	f7ff ff61 	bl	1be <uart_int_tx_fifo_empty_callback>
 2fc:	6822      	ldr	r2, [r4, #0]
 2fe:	6913      	ldr	r3, [r2, #16]
 300:	f043 0302 	orr.w	r3, r3, #2
 304:	6113      	str	r3, [r2, #16]
 306:	6823      	ldr	r3, [r4, #0]
 308:	2200      	movs	r2, #0
 30a:	611a      	str	r2, [r3, #16]
 30c:	e777      	b.n	1fe <drv_uart_interrupt_handler+0x38>
 30e:	69d9      	ldr	r1, [r3, #28]
 310:	6962      	ldr	r2, [r4, #20]
 312:	7ce3      	ldrb	r3, [r4, #19]
 314:	1c58      	adds	r0, r3, #1
 316:	74e0      	strb	r0, [r4, #19]
 318:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 31c:	6823      	ldr	r3, [r4, #0]
 31e:	695a      	ldr	r2, [r3, #20]
 320:	f012 0f1f 	tst.w	r2, #31
 324:	f43f af73 	beq.w	20e <Stack_Size+0xe>
 328:	7c22      	ldrb	r2, [r4, #16]
 32a:	2a00      	cmp	r2, #0
 32c:	d0ef      	beq.n	30e <Stack_Size+0x10e>
 32e:	7aa2      	ldrb	r2, [r4, #10]
 330:	2a01      	cmp	r2, #1
 332:	d0ec      	beq.n	30e <Stack_Size+0x10e>
 334:	68da      	ldr	r2, [r3, #12]
 336:	f022 02cc 	bic.w	r2, r2, #204	; 0xcc
 33a:	60da      	str	r2, [r3, #12]
 33c:	e767      	b.n	20e <Stack_Size+0xe>
 33e:	6822      	ldr	r2, [r4, #0]
 340:	68d3      	ldr	r3, [r2, #12]
 342:	f023 030c 	bic.w	r3, r3, #12
 346:	60d3      	str	r3, [r2, #12]
 348:	e766      	b.n	218 <Stack_Size+0x18>
 34a:	69d9      	ldr	r1, [r3, #28]
 34c:	6962      	ldr	r2, [r4, #20]
 34e:	7ce3      	ldrb	r3, [r4, #19]
 350:	1c58      	adds	r0, r3, #1
 352:	74e0      	strb	r0, [r4, #19]
 354:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 358:	6823      	ldr	r3, [r4, #0]
 35a:	695a      	ldr	r2, [r3, #20]
 35c:	f012 0f1f 	tst.w	r2, #31
 360:	f43f af6d 	beq.w	23e <Stack_Size+0x3e>
 364:	7c22      	ldrb	r2, [r4, #16]
 366:	2a00      	cmp	r2, #0
 368:	d0ef      	beq.n	34a <Stack_Size+0x14a>
 36a:	7aa2      	ldrb	r2, [r4, #10]
 36c:	2a01      	cmp	r2, #1
 36e:	d0ec      	beq.n	34a <Stack_Size+0x14a>
 370:	2300      	movs	r3, #0
 372:	7423      	strb	r3, [r4, #16]
 374:	74a3      	strb	r3, [r4, #18]
 376:	74e3      	strb	r3, [r4, #19]
 378:	6822      	ldr	r2, [r4, #0]
 37a:	6853      	ldr	r3, [r2, #4]
 37c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 380:	6053      	str	r3, [r2, #4]
 382:	6822      	ldr	r2, [r4, #0]
 384:	6853      	ldr	r3, [r2, #4]
 386:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 38a:	6053      	str	r3, [r2, #4]
 38c:	6822      	ldr	r2, [r4, #0]
 38e:	6853      	ldr	r3, [r2, #4]
 390:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 394:	6053      	str	r3, [r2, #4]
 396:	6822      	ldr	r2, [r4, #0]
 398:	6853      	ldr	r3, [r2, #4]
 39a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 39e:	6053      	str	r3, [r2, #4]
 3a0:	6822      	ldr	r2, [r4, #0]
 3a2:	6853      	ldr	r3, [r2, #4]
 3a4:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 3a8:	6053      	str	r3, [r2, #4]
 3aa:	6822      	ldr	r2, [r4, #0]
 3ac:	6853      	ldr	r3, [r2, #4]
 3ae:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 3b2:	6053      	str	r3, [r2, #4]
 3b4:	6822      	ldr	r2, [r4, #0]
 3b6:	6853      	ldr	r3, [r2, #4]
 3b8:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 3bc:	6053      	str	r3, [r2, #4]
 3be:	6822      	ldr	r2, [r4, #0]
 3c0:	6853      	ldr	r3, [r2, #4]
 3c2:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 3c6:	6053      	str	r3, [r2, #4]
 3c8:	6822      	ldr	r2, [r4, #0]
 3ca:	68d3      	ldr	r3, [r2, #12]
 3cc:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 3d0:	60d3      	str	r3, [r2, #12]
 3d2:	e734      	b.n	23e <Stack_Size+0x3e>
 3d4:	6822      	ldr	r2, [r4, #0]
 3d6:	68d3      	ldr	r3, [r2, #12]
 3d8:	f023 030c 	bic.w	r3, r3, #12
 3dc:	60d3      	str	r3, [r2, #12]
 3de:	e733      	b.n	248 <Stack_Size+0x48>

000003e0 <NMI_Handler>:
 3e0:	4770      	bx	lr

000003e2 <HardFault_Handler>:
 3e2:	e7fe      	b.n	3e2 <HardFault_Handler>

000003e4 <MemManage_Handler>:
 3e4:	e7fe      	b.n	3e4 <MemManage_Handler>

000003e6 <BusFault_Handler>:
 3e6:	e7fe      	b.n	3e6 <BusFault_Handler>

000003e8 <UsageFault_Handler>:
 3e8:	e7fe      	b.n	3e8 <UsageFault_Handler>

000003ea <SVC_Handler>:
 3ea:	4770      	bx	lr

000003ec <DebugMon_Handler>:
 3ec:	4770      	bx	lr

000003ee <PendSV_Handler>:
 3ee:	4770      	bx	lr

000003f0 <SysTick_Handler>:
 3f0:	4770      	bx	lr
	...

000003f4 <Uart0_Handler>:
 3f4:	b508      	push	{r3, lr}
 3f6:	4b04      	ldr	r3, [pc, #16]	; (408 <Uart0_Handler+0x14>)
 3f8:	2201      	movs	r2, #1
 3fa:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 3fe:	4803      	ldr	r0, [pc, #12]	; (40c <Uart0_Handler+0x18>)
 400:	f7ff fee1 	bl	1c6 <drv_uart_interrupt_handler>
 404:	bd08      	pop	{r3, pc}
 406:	bf00      	nop
 408:	e000e100 	and	lr, r0, r0, lsl #2
 40c:	00010084 	andeq	r0, r1, r4, lsl #1

00000410 <Uart1_Handler>:
 410:	b508      	push	{r3, lr}
 412:	4b04      	ldr	r3, [pc, #16]	; (424 <Uart1_Handler+0x14>)
 414:	2202      	movs	r2, #2
 416:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 41a:	4803      	ldr	r0, [pc, #12]	; (428 <Uart1_Handler+0x18>)
 41c:	f7ff fed3 	bl	1c6 <drv_uart_interrupt_handler>
 420:	bd08      	pop	{r3, pc}
 422:	bf00      	nop
 424:	e000e100 	and	lr, r0, r0, lsl #2
 428:	000100a0 	andeq	r0, r1, r0, lsr #1

0000042c <main>:
 42c:	b508      	push	{r3, lr}
 42e:	f000 f835 	bl	49c <uart0_init>
 432:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 436:	23bd      	movs	r3, #189	; 0xbd
 438:	60a3      	str	r3, [r4, #8]
 43a:	f000 f851 	bl	4e0 <uart1_rx_it_test>
 43e:	23ed      	movs	r3, #237	; 0xed
 440:	60a3      	str	r3, [r4, #8]
 442:	e7fe      	b.n	442 <main+0x16>

00000444 <Reset_Handler>:
 444:	490a      	ldr	r1, [pc, #40]	; (470 <Reset_Handler+0x2c>)
 446:	4a0b      	ldr	r2, [pc, #44]	; (474 <Reset_Handler+0x30>)
 448:	4b0b      	ldr	r3, [pc, #44]	; (478 <Reset_Handler+0x34>)
 44a:	1a9b      	subs	r3, r3, r2
 44c:	dd03      	ble.n	456 <Reset_Handler+0x12>
 44e:	3b04      	subs	r3, #4
 450:	58c8      	ldr	r0, [r1, r3]
 452:	50d0      	str	r0, [r2, r3]
 454:	dcfb      	bgt.n	44e <Reset_Handler+0xa>
 456:	4909      	ldr	r1, [pc, #36]	; (47c <Reset_Handler+0x38>)
 458:	4a09      	ldr	r2, [pc, #36]	; (480 <Reset_Handler+0x3c>)
 45a:	2000      	movs	r0, #0
 45c:	4291      	cmp	r1, r2
 45e:	bfbc      	itt	lt
 460:	f841 0b04 	strlt.w	r0, [r1], #4
 464:	e7fa      	blt.n	45c <Reset_Handler+0x18>
 466:	f7ff ffe1 	bl	42c <main>
 46a:	f000 f877 	bl	55c <exit>
 46e:	05c40000 	strbeq	r0, [r4]
 472:	00000000 	andeq	r0, r0, r0
 476:	00680001 	rsbeq	r0, r8, r1
 47a:	00680001 	rsbeq	r0, r8, r1
 47e:	00fc0001 	rscseq	r0, ip, r1
 482:	e7fe0001 	ldrb	r0, [lr, r1]!
 486:	e7fe      	b.n	486 <Reset_Handler+0x42>
 488:	e7fe      	b.n	488 <Reset_Handler+0x44>
 48a:	e7fe      	b.n	48a <Reset_Handler+0x46>
 48c:	e7fe      	b.n	48c <Reset_Handler+0x48>
 48e:	e7fe      	b.n	48e <Reset_Handler+0x4a>
 490:	e7fe      	b.n	490 <Reset_Handler+0x4c>
 492:	e7fe      	b.n	492 <Reset_Handler+0x4e>
 494:	e7fe      	b.n	494 <Reset_Handler+0x50>
 496:	e7fe      	b.n	496 <Reset_Handler+0x52>
 498:	e7fe      	b.n	498 <Reset_Handler+0x54>
 49a:	bf00      	nop

0000049c <uart0_init>:
 49c:	b510      	push	{r4, lr}
 49e:	4c05      	ldr	r4, [pc, #20]	; (4b4 <uart0_init+0x18>)
 4a0:	4b05      	ldr	r3, [pc, #20]	; (4b8 <uart0_init+0x1c>)
 4a2:	6023      	str	r3, [r4, #0]
 4a4:	4620      	mov	r0, r4
 4a6:	f7ff fe00 	bl	aa <drv_uart_default_config>
 4aa:	4620      	mov	r0, r4
 4ac:	f7ff fe30 	bl	110 <drv_uart_init>
 4b0:	bd10      	pop	{r4, pc}
 4b2:	bf00      	nop
 4b4:	00010084 	andeq	r0, r1, r4, lsl #1
 4b8:	40001000 	andmi	r1, r0, r0

000004bc <uart1_init>:
 4bc:	b510      	push	{r4, lr}
 4be:	4c05      	ldr	r4, [pc, #20]	; (4d4 <uart1_init+0x18>)
 4c0:	4b05      	ldr	r3, [pc, #20]	; (4d8 <uart1_init+0x1c>)
 4c2:	6023      	str	r3, [r4, #0]
 4c4:	4620      	mov	r0, r4
 4c6:	f7ff fdf0 	bl	aa <drv_uart_default_config>
 4ca:	4620      	mov	r0, r4
 4cc:	f7ff fe20 	bl	110 <drv_uart_init>
 4d0:	bd10      	pop	{r4, pc}
 4d2:	bf00      	nop
 4d4:	000100a0 	andeq	r0, r1, r0, lsr #1
 4d8:	40002000 	andmi	r2, r0, r0

000004dc <test_printf_s>:
 4dc:	4770      	bx	lr

000004de <test_printf_ch>:
 4de:	4770      	bx	lr

000004e0 <uart1_rx_it_test>:
 4e0:	b510      	push	{r4, lr}
 4e2:	f7ff ffeb 	bl	4bc <uart1_init>
 4e6:	4b17      	ldr	r3, [pc, #92]	; (544 <uart1_rx_it_test+0x64>)
 4e8:	2200      	movs	r2, #0
 4ea:	f883 2301 	strb.w	r2, [r3, #769]	; 0x301
 4ee:	2202      	movs	r2, #2
 4f0:	601a      	str	r2, [r3, #0]
 4f2:	2220      	movs	r2, #32
 4f4:	4914      	ldr	r1, [pc, #80]	; (548 <uart1_rx_it_test+0x68>)
 4f6:	4815      	ldr	r0, [pc, #84]	; (54c <uart1_rx_it_test+0x6c>)
 4f8:	f7ff fe52 	bl	1a0 <drv_uart_rx_data_it>
 4fc:	4b13      	ldr	r3, [pc, #76]	; (54c <uart1_rx_it_test+0x6c>)
 4fe:	7cdb      	ldrb	r3, [r3, #19]
 500:	2b20      	cmp	r3, #32
 502:	d1fb      	bne.n	4fc <uart1_rx_it_test+0x1c>
 504:	4b0f      	ldr	r3, [pc, #60]	; (544 <uart1_rx_it_test+0x64>)
 506:	2202      	movs	r2, #2
 508:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 50c:	f3bf 8f4f 	dsb	sy
 510:	f3bf 8f6f 	isb	sy
 514:	480e      	ldr	r0, [pc, #56]	; (550 <uart1_rx_it_test+0x70>)
 516:	f7ff ffe1 	bl	4dc <test_printf_s>
 51a:	2400      	movs	r4, #0
 51c:	e00c      	b.n	538 <uart1_rx_it_test+0x58>
 51e:	4b0a      	ldr	r3, [pc, #40]	; (548 <uart1_rx_it_test+0x68>)
 520:	f833 1014 	ldrh.w	r1, [r3, r4, lsl #1]
 524:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 528:	6011      	str	r1, [r2, #0]
 52a:	f833 1014 	ldrh.w	r1, [r3, r4, lsl #1]
 52e:	4809      	ldr	r0, [pc, #36]	; (554 <uart1_rx_it_test+0x74>)
 530:	f7ff ffd5 	bl	4de <test_printf_ch>
 534:	3401      	adds	r4, #1
 536:	b2e4      	uxtb	r4, r4
 538:	2c1f      	cmp	r4, #31
 53a:	d9f0      	bls.n	51e <uart1_rx_it_test+0x3e>
 53c:	4806      	ldr	r0, [pc, #24]	; (558 <uart1_rx_it_test+0x78>)
 53e:	f7ff ffcd 	bl	4dc <test_printf_s>
 542:	bd10      	pop	{r4, pc}
 544:	e000e100 	and	lr, r0, r0, lsl #2
 548:	000100bc 	strheq	r0, [r1], -ip
 54c:	000100a0 	andeq	r0, r1, r0, lsr #1
 550:	000005a0 	andeq	r0, r0, r0, lsr #11
 554:	000005b4 			; <UNDEFINED> instruction: 0x000005b4
 558:	000005b8 			; <UNDEFINED> instruction: 0x000005b8

0000055c <exit>:
 55c:	b508      	push	{r3, lr}
 55e:	4b07      	ldr	r3, [pc, #28]	; (57c <exit+0x20>)
 560:	4604      	mov	r4, r0
 562:	b113      	cbz	r3, 56a <exit+0xe>
 564:	2100      	movs	r1, #0
 566:	f3af 8000 	nop.w
 56a:	4b05      	ldr	r3, [pc, #20]	; (580 <exit+0x24>)
 56c:	6818      	ldr	r0, [r3, #0]
 56e:	6a83      	ldr	r3, [r0, #40]	; 0x28
 570:	b103      	cbz	r3, 574 <exit+0x18>
 572:	4798      	blx	r3
 574:	4620      	mov	r0, r4
 576:	f000 f805 	bl	584 <_exit>
 57a:	bf00      	nop
 57c:	00000000 	andeq	r0, r0, r0
 580:	000005bc 			; <UNDEFINED> instruction: 0x000005bc

00000584 <_exit>:
 584:	e7fe      	b.n	584 <_exit>
 586:	bf00      	nop

00000588 <_init>:
 588:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 58a:	bf00      	nop
 58c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 58e:	bc08      	pop	{r3}
 590:	469e      	mov	lr, r3
 592:	4770      	bx	lr

00000594 <_fini>:
 594:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 596:	bf00      	nop
 598:	bcf8      	pop	{r3, r4, r5, r6, r7}
 59a:	bc08      	pop	{r3}
 59c:	469e      	mov	lr, r3
 59e:	4770      	bx	lr
 5a0:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
 5a4:	78722031 	ldmdavc	r2!, {r0, r4, r5, sp}^
 5a8:	74616420 	strbtvc	r6, [r1], #-1056	; 0xfffffbe0
 5ac:	0a0d3a61 	beq	34ef38 <__StackTop+0x33cf38>
 5b0:	00000000 	andeq	r0, r0, r0
 5b4:	00207825 	eoreq	r7, r0, r5, lsr #16
 5b8:	00000a0d 	andeq	r0, r0, sp, lsl #20

000005bc <_global_impure_ptr>:
 5bc:	00010000 	andeq	r0, r1, r0

000005c0 <__EH_FRAME_BEGIN__>:
 5c0:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <impure_data>:
	...

00010060 <__frame_dummy_init_array_entry>:
   10060:	0000006d 	andeq	r0, r0, sp, rrx

00010064 <__do_global_dtors_aux_fini_array_entry>:
   10064:	00000049 	andeq	r0, r0, r9, asr #32

Disassembly of section .bss:

00010068 <__bss_start__>:
   10068:	00000000 	andeq	r0, r0, r0

0001006c <object.0>:
	...

00010084 <huart0>:
	...

000100a0 <huart1>:
	...

000100bc <rx_data>:
	...

Disassembly of section .stack_dummy:

00010100 <__HeapBase>:
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
  18:	0000055c 	andeq	r0, r0, ip, asr r5
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000584 	andeq	r0, r0, r4, lsl #11
  44:	00000002 	andeq	r0, r0, r2

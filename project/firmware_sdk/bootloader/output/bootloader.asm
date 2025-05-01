
bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	0000062d 	andeq	r0, r0, sp, lsr #12
       8:	000005b5 			; <UNDEFINED> instruction: 0x000005b5
       c:	000005b7 			; <UNDEFINED> instruction: 0x000005b7
      10:	000005b9 			; <UNDEFINED> instruction: 0x000005b9
      14:	000005bb 			; <UNDEFINED> instruction: 0x000005bb
      18:	000005bd 			; <UNDEFINED> instruction: 0x000005bd
	...
      2c:	000005bf 			; <UNDEFINED> instruction: 0x000005bf
      30:	000005c1 	andeq	r0, r0, r1, asr #11
      34:	00000000 	andeq	r0, r0, r0
      38:	000005c3 	andeq	r0, r0, r3, asr #11
      3c:	000005c5 	andeq	r0, r0, r5, asr #11
      40:	000005c9 	andeq	r0, r0, r9, asr #11
      44:	00000681 	andeq	r0, r0, r1, lsl #13
      48:	00000683 	andeq	r0, r0, r3, lsl #13
      4c:	00000685 	andeq	r0, r0, r5, lsl #13
      50:	00000687 	andeq	r0, r0, r7, lsl #13
      54:	00000689 	andeq	r0, r0, r9, lsl #13
      58:	0000068b 	andeq	r0, r0, fp, lsl #13
      5c:	0000068d 	andeq	r0, r0, sp, lsl #13
      60:	0000068f 	andeq	r0, r0, pc, lsl #13
      64:	00000691 	muleq	r0, r1, r6
      68:	00000693 	muleq	r0, r3, r6
      6c:	00000695 	muleq	r0, r5, r6
      70:	00000697 	muleq	r0, r7, r6
      74:	00000699 	muleq	r0, r9, r6
      78:	0000069b 	muleq	r0, fp, r6
      7c:	0000069d 	muleq	r0, sp, r6
      80:	0000069f 	muleq	r0, pc, r6	; <UNPREDICTABLE>
      84:	000006a1 	andeq	r0, r0, r1, lsr #13
      88:	000006a3 	andeq	r0, r0, r3, lsr #13

0000008c <__do_global_dtors_aux>:
      8c:	b510      	push	{r4, lr}
      8e:	4c05      	ldr	r4, [pc, #20]	; (a4 <__do_global_dtors_aux+0x18>)
      90:	7823      	ldrb	r3, [r4, #0]
      92:	b933      	cbnz	r3, a2 <__do_global_dtors_aux+0x16>
      94:	4b04      	ldr	r3, [pc, #16]	; (a8 <__do_global_dtors_aux+0x1c>)
      96:	b113      	cbz	r3, 9e <__do_global_dtors_aux+0x12>
      98:	4804      	ldr	r0, [pc, #16]	; (ac <__do_global_dtors_aux+0x20>)
      9a:	f3af 8000 	nop.w
      9e:	2301      	movs	r3, #1
      a0:	7023      	strb	r3, [r4, #0]
      a2:	bd10      	pop	{r4, pc}
      a4:	0002006c 	andeq	r0, r2, ip, rrx
      a8:	00000000 	andeq	r0, r0, r0
      ac:	0000106c 	andeq	r1, r0, ip, rrx

000000b0 <frame_dummy>:
      b0:	b508      	push	{r3, lr}
      b2:	4b03      	ldr	r3, [pc, #12]	; (c0 <frame_dummy+0x10>)
      b4:	b11b      	cbz	r3, be <frame_dummy+0xe>
      b6:	4903      	ldr	r1, [pc, #12]	; (c4 <frame_dummy+0x14>)
      b8:	4803      	ldr	r0, [pc, #12]	; (c8 <frame_dummy+0x18>)
      ba:	f3af 8000 	nop.w
      be:	bd08      	pop	{r3, pc}
      c0:	00000000 	andeq	r0, r0, r0
      c4:	00020070 	andeq	r0, r2, r0, ror r0
      c8:	0000106c 	andeq	r1, r0, ip, rrx

000000cc <drv_check_rw_data>:
      cc:	6001      	str	r1, [r0, #0]
      ce:	6803      	ldr	r3, [r0, #0]
      d0:	4293      	cmp	r3, r2
      d2:	d007      	beq.n	e4 <drv_check_rw_data+0x18>
      d4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      d8:	2001      	movs	r0, #1
      da:	6018      	str	r0, [r3, #0]
      dc:	685a      	ldr	r2, [r3, #4]
      de:	4402      	add	r2, r0
      e0:	601a      	str	r2, [r3, #0]
      e2:	4770      	bx	lr
      e4:	2000      	movs	r0, #0
      e6:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      ea:	6018      	str	r0, [r3, #0]
      ec:	4770      	bx	lr

000000ee <drv_uart_default_config>:
      ee:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      f2:	6043      	str	r3, [r0, #4]
      f4:	230f      	movs	r3, #15
      f6:	7203      	strb	r3, [r0, #8]
      f8:	2300      	movs	r3, #0
      fa:	7243      	strb	r3, [r0, #9]
      fc:	7283      	strb	r3, [r0, #10]
      fe:	72c3      	strb	r3, [r0, #11]
     100:	7303      	strb	r3, [r0, #12]
     102:	7343      	strb	r3, [r0, #13]
     104:	2301      	movs	r3, #1
     106:	7383      	strb	r3, [r0, #14]
     108:	4770      	bx	lr
	...

0000010c <drv_uart_set_config>:
     10c:	b508      	push	{r3, lr}
     10e:	6841      	ldr	r1, [r0, #4]
     110:	7a03      	ldrb	r3, [r0, #8]
     112:	fb03 f201 	mul.w	r2, r3, r1
     116:	490e      	ldr	r1, [pc, #56]	; (150 <drv_uart_set_config+0x44>)
     118:	fbb1 f2f2 	udiv	r2, r1, r2
     11c:	0419      	lsls	r1, r3, #16
     11e:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     122:	7a43      	ldrb	r3, [r0, #9]
     124:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     128:	7a83      	ldrb	r3, [r0, #10]
     12a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     12e:	7ac3      	ldrb	r3, [r0, #11]
     130:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     134:	7b03      	ldrb	r3, [r0, #12]
     136:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     13a:	7b42      	ldrb	r2, [r0, #13]
     13c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     140:	7b82      	ldrb	r2, [r0, #14]
     142:	4311      	orrs	r1, r2
     144:	6800      	ldr	r0, [r0, #0]
     146:	460a      	mov	r2, r1
     148:	3008      	adds	r0, #8
     14a:	f7ff ffbf 	bl	cc <drv_check_rw_data>
     14e:	bd08      	pop	{r3, pc}
     150:	02625a00 	rsbeq	r5, r2, #0, 20

00000154 <drv_uart_init>:
     154:	b538      	push	{r3, r4, r5, lr}
     156:	4604      	mov	r4, r0
     158:	2500      	movs	r5, #0
     15a:	7485      	strb	r5, [r0, #18]
     15c:	74c5      	strb	r5, [r0, #19]
     15e:	f7ff ffd5 	bl	10c <drv_uart_set_config>
     162:	7425      	strb	r5, [r4, #16]
     164:	74a5      	strb	r5, [r4, #18]
     166:	74e5      	strb	r5, [r4, #19]
     168:	6822      	ldr	r2, [r4, #0]
     16a:	6853      	ldr	r3, [r2, #4]
     16c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     170:	6053      	str	r3, [r2, #4]
     172:	6822      	ldr	r2, [r4, #0]
     174:	6853      	ldr	r3, [r2, #4]
     176:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     17a:	6053      	str	r3, [r2, #4]
     17c:	6822      	ldr	r2, [r4, #0]
     17e:	6853      	ldr	r3, [r2, #4]
     180:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     184:	6053      	str	r3, [r2, #4]
     186:	6822      	ldr	r2, [r4, #0]
     188:	6853      	ldr	r3, [r2, #4]
     18a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     18e:	6053      	str	r3, [r2, #4]
     190:	6822      	ldr	r2, [r4, #0]
     192:	6853      	ldr	r3, [r2, #4]
     194:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     198:	6053      	str	r3, [r2, #4]
     19a:	6822      	ldr	r2, [r4, #0]
     19c:	6853      	ldr	r3, [r2, #4]
     19e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     1a2:	6053      	str	r3, [r2, #4]
     1a4:	6822      	ldr	r2, [r4, #0]
     1a6:	6853      	ldr	r3, [r2, #4]
     1a8:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     1ac:	6053      	str	r3, [r2, #4]
     1ae:	6822      	ldr	r2, [r4, #0]
     1b0:	6853      	ldr	r3, [r2, #4]
     1b2:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     1b6:	6053      	str	r3, [r2, #4]
     1b8:	6823      	ldr	r3, [r4, #0]
     1ba:	f240 12ff 	movw	r2, #511	; 0x1ff
     1be:	611a      	str	r2, [r3, #16]
     1c0:	6823      	ldr	r3, [r4, #0]
     1c2:	611d      	str	r5, [r3, #16]
     1c4:	6822      	ldr	r2, [r4, #0]
     1c6:	6853      	ldr	r3, [r2, #4]
     1c8:	f043 0301 	orr.w	r3, r3, #1
     1cc:	6053      	str	r3, [r2, #4]
     1ce:	6822      	ldr	r2, [r4, #0]
     1d0:	6853      	ldr	r3, [r2, #4]
     1d2:	f023 0301 	bic.w	r3, r3, #1
     1d6:	6053      	str	r3, [r2, #4]
     1d8:	6822      	ldr	r2, [r4, #0]
     1da:	6853      	ldr	r3, [r2, #4]
     1dc:	f043 0302 	orr.w	r3, r3, #2
     1e0:	6053      	str	r3, [r2, #4]
     1e2:	bd38      	pop	{r3, r4, r5, pc}

000001e4 <drv_uart_putchars>:
     1e4:	b410      	push	{r4}
     1e6:	2300      	movs	r3, #0
     1e8:	7483      	strb	r3, [r0, #18]
     1ea:	f890 c012 	ldrb.w	ip, [r0, #18]
     1ee:	4594      	cmp	ip, r2
     1f0:	d20c      	bcs.n	20c <Stack_Size+0xc>
     1f2:	6804      	ldr	r4, [r0, #0]
     1f4:	6963      	ldr	r3, [r4, #20]
     1f6:	0a1b      	lsrs	r3, r3, #8
     1f8:	f013 0f18 	tst.w	r3, #24
     1fc:	d1f5      	bne.n	1ea <drv_uart_putchars+0x6>
     1fe:	f10c 0301 	add.w	r3, ip, #1
     202:	7483      	strb	r3, [r0, #18]
     204:	f811 300c 	ldrb.w	r3, [r1, ip]
     208:	6023      	str	r3, [r4, #0]
     20a:	e7ee      	b.n	1ea <drv_uart_putchars+0x6>
     20c:	6803      	ldr	r3, [r0, #0]
     20e:	699a      	ldr	r2, [r3, #24]
     210:	f412 7f80 	tst.w	r2, #256	; 0x100
     214:	d0fa      	beq.n	20c <Stack_Size+0xc>
     216:	691a      	ldr	r2, [r3, #16]
     218:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     21c:	611a      	str	r2, [r3, #16]
     21e:	6803      	ldr	r3, [r0, #0]
     220:	2200      	movs	r2, #0
     222:	611a      	str	r2, [r3, #16]
     224:	bc10      	pop	{r4}
     226:	4770      	bx	lr

00000228 <drv_uart_putchar>:
     228:	6802      	ldr	r2, [r0, #0]
     22a:	6953      	ldr	r3, [r2, #20]
     22c:	0a1b      	lsrs	r3, r3, #8
     22e:	f013 0f18 	tst.w	r3, #24
     232:	d101      	bne.n	238 <drv_uart_putchar+0x10>
     234:	780b      	ldrb	r3, [r1, #0]
     236:	6013      	str	r3, [r2, #0]
     238:	6803      	ldr	r3, [r0, #0]
     23a:	699a      	ldr	r2, [r3, #24]
     23c:	f412 7f80 	tst.w	r2, #256	; 0x100
     240:	d0fa      	beq.n	238 <drv_uart_putchar+0x10>
     242:	691a      	ldr	r2, [r3, #16]
     244:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     248:	611a      	str	r2, [r3, #16]
     24a:	6803      	ldr	r3, [r0, #0]
     24c:	2200      	movs	r2, #0
     24e:	611a      	str	r2, [r3, #16]
     250:	4770      	bx	lr

00000252 <drv_uart_getchar>:
     252:	b410      	push	{r4}
     254:	e009      	b.n	26a <drv_uart_getchar+0x18>
     256:	69db      	ldr	r3, [r3, #28]
     258:	700b      	strb	r3, [r1, #0]
     25a:	2000      	movs	r0, #0
     25c:	bc10      	pop	{r4}
     25e:	4770      	bx	lr
     260:	6803      	ldr	r3, [r0, #0]
     262:	695a      	ldr	r2, [r3, #20]
     264:	f012 0f1f 	tst.w	r2, #31
     268:	d1f5      	bne.n	256 <drv_uart_getchar+0x4>
     26a:	6803      	ldr	r3, [r0, #0]
     26c:	699c      	ldr	r4, [r3, #24]
     26e:	691a      	ldr	r2, [r3, #16]
     270:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     274:	611a      	str	r2, [r3, #16]
     276:	6803      	ldr	r3, [r0, #0]
     278:	2200      	movs	r2, #0
     27a:	611a      	str	r2, [r3, #16]
     27c:	b2a3      	uxth	r3, r4
     27e:	f014 0f40 	tst.w	r4, #64	; 0x40
     282:	d001      	beq.n	288 <drv_uart_getchar+0x36>
     284:	2201      	movs	r2, #1
     286:	7402      	strb	r2, [r0, #16]
     288:	f013 0f80 	tst.w	r3, #128	; 0x80
     28c:	d001      	beq.n	292 <drv_uart_getchar+0x40>
     28e:	2302      	movs	r3, #2
     290:	7403      	strb	r3, [r0, #16]
     292:	7c03      	ldrb	r3, [r0, #16]
     294:	2b00      	cmp	r3, #0
     296:	d0e3      	beq.n	260 <drv_uart_getchar+0xe>
     298:	7a83      	ldrb	r3, [r0, #10]
     29a:	2b01      	cmp	r3, #1
     29c:	d0e0      	beq.n	260 <drv_uart_getchar+0xe>
     29e:	2300      	movs	r3, #0
     2a0:	7403      	strb	r3, [r0, #16]
     2a2:	7483      	strb	r3, [r0, #18]
     2a4:	74c3      	strb	r3, [r0, #19]
     2a6:	6804      	ldr	r4, [r0, #0]
     2a8:	6862      	ldr	r2, [r4, #4]
     2aa:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     2ae:	6062      	str	r2, [r4, #4]
     2b0:	6804      	ldr	r4, [r0, #0]
     2b2:	6862      	ldr	r2, [r4, #4]
     2b4:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2b8:	6062      	str	r2, [r4, #4]
     2ba:	6804      	ldr	r4, [r0, #0]
     2bc:	6862      	ldr	r2, [r4, #4]
     2be:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2c2:	6062      	str	r2, [r4, #4]
     2c4:	6804      	ldr	r4, [r0, #0]
     2c6:	6862      	ldr	r2, [r4, #4]
     2c8:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2cc:	6062      	str	r2, [r4, #4]
     2ce:	6804      	ldr	r4, [r0, #0]
     2d0:	6862      	ldr	r2, [r4, #4]
     2d2:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2d6:	6062      	str	r2, [r4, #4]
     2d8:	6804      	ldr	r4, [r0, #0]
     2da:	6862      	ldr	r2, [r4, #4]
     2dc:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2e0:	6062      	str	r2, [r4, #4]
     2e2:	6804      	ldr	r4, [r0, #0]
     2e4:	6862      	ldr	r2, [r4, #4]
     2e6:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2ea:	6062      	str	r2, [r4, #4]
     2ec:	6800      	ldr	r0, [r0, #0]
     2ee:	6842      	ldr	r2, [r0, #4]
     2f0:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2f4:	6042      	str	r2, [r0, #4]
     2f6:	700b      	strb	r3, [r1, #0]
     2f8:	2001      	movs	r0, #1
     2fa:	e7af      	b.n	25c <drv_uart_getchar+0xa>

000002fc <uart_int_tx_done_callback>:
     2fc:	4770      	bx	lr

000002fe <uart_int_rx_stop_callback>:
     2fe:	4770      	bx	lr

00000300 <uart_int_rx_parity_error_callback>:
     300:	4770      	bx	lr

00000302 <uart_int_rx_noise_detect_callback>:
     302:	4770      	bx	lr

00000304 <uart_int_rx_stop_detect_callback>:
     304:	4770      	bx	lr

00000306 <uart_int_tx_fifo_empty_callback>:
     306:	4770      	bx	lr

00000308 <uart_int_tx_fifo_thres_callback>:
     308:	4770      	bx	lr

0000030a <uart_int_rx_fifo_noempty_callback>:
     30a:	4770      	bx	lr

0000030c <uart_int_rx_fifo_thres_callback>:
     30c:	4770      	bx	lr

0000030e <drv_uart_interrupt_handler>:
     30e:	b538      	push	{r3, r4, r5, lr}
     310:	4604      	mov	r4, r0
     312:	6803      	ldr	r3, [r0, #0]
     314:	699d      	ldr	r5, [r3, #24]
     316:	68db      	ldr	r3, [r3, #12]
     318:	b29b      	uxth	r3, r3
     31a:	401d      	ands	r5, r3
     31c:	f415 7f80 	tst.w	r5, #256	; 0x100
     320:	d144      	bne.n	3ac <drv_uart_interrupt_handler+0x9e>
     322:	f015 0f40 	tst.w	r5, #64	; 0x40
     326:	d00f      	beq.n	348 <drv_uart_interrupt_handler+0x3a>
     328:	2301      	movs	r3, #1
     32a:	7423      	strb	r3, [r4, #16]
     32c:	7aa3      	ldrb	r3, [r4, #10]
     32e:	2b01      	cmp	r3, #1
     330:	d147      	bne.n	3c2 <drv_uart_interrupt_handler+0xb4>
     332:	4620      	mov	r0, r4
     334:	f7ff ffe3 	bl	2fe <uart_int_rx_stop_callback>
     338:	6822      	ldr	r2, [r4, #0]
     33a:	6913      	ldr	r3, [r2, #16]
     33c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     340:	6113      	str	r3, [r2, #16]
     342:	6823      	ldr	r3, [r4, #0]
     344:	2200      	movs	r2, #0
     346:	611a      	str	r2, [r3, #16]
     348:	f015 0f80 	tst.w	r5, #128	; 0x80
     34c:	d00f      	beq.n	36e <drv_uart_interrupt_handler+0x60>
     34e:	2302      	movs	r3, #2
     350:	7423      	strb	r3, [r4, #16]
     352:	7aa3      	ldrb	r3, [r4, #10]
     354:	2b01      	cmp	r3, #1
     356:	d166      	bne.n	426 <drv_uart_interrupt_handler+0x118>
     358:	4620      	mov	r0, r4
     35a:	f7ff ffd1 	bl	300 <uart_int_rx_parity_error_callback>
     35e:	6822      	ldr	r2, [r4, #0]
     360:	6913      	ldr	r3, [r2, #16]
     362:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     366:	6113      	str	r3, [r2, #16]
     368:	6823      	ldr	r3, [r4, #0]
     36a:	2200      	movs	r2, #0
     36c:	611a      	str	r2, [r3, #16]
     36e:	f015 0f20 	tst.w	r5, #32
     372:	f040 808a 	bne.w	48a <drv_uart_interrupt_handler+0x17c>
     376:	f015 0f10 	tst.w	r5, #16
     37a:	f040 8092 	bne.w	4a2 <drv_uart_interrupt_handler+0x194>
     37e:	f015 0f01 	tst.w	r5, #1
     382:	f040 809a 	bne.w	4ba <drv_uart_interrupt_handler+0x1ac>
     386:	f015 0f02 	tst.w	r5, #2
     38a:	f040 80a2 	bne.w	4d2 <drv_uart_interrupt_handler+0x1c4>
     38e:	f015 0f04 	tst.w	r5, #4
     392:	f000 80c1 	beq.w	518 <drv_uart_interrupt_handler+0x20a>
     396:	7ce2      	ldrb	r2, [r4, #19]
     398:	7e23      	ldrb	r3, [r4, #24]
     39a:	429a      	cmp	r2, r3
     39c:	f0c0 80ac 	bcc.w	4f8 <drv_uart_interrupt_handler+0x1ea>
     3a0:	6822      	ldr	r2, [r4, #0]
     3a2:	68d3      	ldr	r3, [r2, #12]
     3a4:	f023 030c 	bic.w	r3, r3, #12
     3a8:	60d3      	str	r3, [r2, #12]
     3aa:	e0aa      	b.n	502 <drv_uart_interrupt_handler+0x1f4>
     3ac:	f7ff ffa6 	bl	2fc <uart_int_tx_done_callback>
     3b0:	6822      	ldr	r2, [r4, #0]
     3b2:	6913      	ldr	r3, [r2, #16]
     3b4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3b8:	6113      	str	r3, [r2, #16]
     3ba:	6823      	ldr	r3, [r4, #0]
     3bc:	2200      	movs	r2, #0
     3be:	611a      	str	r2, [r3, #16]
     3c0:	e7af      	b.n	322 <drv_uart_interrupt_handler+0x14>
     3c2:	6822      	ldr	r2, [r4, #0]
     3c4:	68d3      	ldr	r3, [r2, #12]
     3c6:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3ca:	60d3      	str	r3, [r2, #12]
     3cc:	2300      	movs	r3, #0
     3ce:	7423      	strb	r3, [r4, #16]
     3d0:	74a3      	strb	r3, [r4, #18]
     3d2:	74e3      	strb	r3, [r4, #19]
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
     424:	e785      	b.n	332 <drv_uart_interrupt_handler+0x24>
     426:	6822      	ldr	r2, [r4, #0]
     428:	68d3      	ldr	r3, [r2, #12]
     42a:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     42e:	60d3      	str	r3, [r2, #12]
     430:	2300      	movs	r3, #0
     432:	7423      	strb	r3, [r4, #16]
     434:	74a3      	strb	r3, [r4, #18]
     436:	74e3      	strb	r3, [r4, #19]
     438:	6822      	ldr	r2, [r4, #0]
     43a:	6853      	ldr	r3, [r2, #4]
     43c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     440:	6053      	str	r3, [r2, #4]
     442:	6822      	ldr	r2, [r4, #0]
     444:	6853      	ldr	r3, [r2, #4]
     446:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     44a:	6053      	str	r3, [r2, #4]
     44c:	6822      	ldr	r2, [r4, #0]
     44e:	6853      	ldr	r3, [r2, #4]
     450:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     454:	6053      	str	r3, [r2, #4]
     456:	6822      	ldr	r2, [r4, #0]
     458:	6853      	ldr	r3, [r2, #4]
     45a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     45e:	6053      	str	r3, [r2, #4]
     460:	6822      	ldr	r2, [r4, #0]
     462:	6853      	ldr	r3, [r2, #4]
     464:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     468:	6053      	str	r3, [r2, #4]
     46a:	6822      	ldr	r2, [r4, #0]
     46c:	6853      	ldr	r3, [r2, #4]
     46e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     472:	6053      	str	r3, [r2, #4]
     474:	6822      	ldr	r2, [r4, #0]
     476:	6853      	ldr	r3, [r2, #4]
     478:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     47c:	6053      	str	r3, [r2, #4]
     47e:	6822      	ldr	r2, [r4, #0]
     480:	6853      	ldr	r3, [r2, #4]
     482:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     486:	6053      	str	r3, [r2, #4]
     488:	e766      	b.n	358 <drv_uart_interrupt_handler+0x4a>
     48a:	4620      	mov	r0, r4
     48c:	f7ff ff39 	bl	302 <uart_int_rx_noise_detect_callback>
     490:	6822      	ldr	r2, [r4, #0]
     492:	6913      	ldr	r3, [r2, #16]
     494:	f043 0320 	orr.w	r3, r3, #32
     498:	6113      	str	r3, [r2, #16]
     49a:	6823      	ldr	r3, [r4, #0]
     49c:	2200      	movs	r2, #0
     49e:	611a      	str	r2, [r3, #16]
     4a0:	e769      	b.n	376 <drv_uart_interrupt_handler+0x68>
     4a2:	4620      	mov	r0, r4
     4a4:	f7ff ff2e 	bl	304 <uart_int_rx_stop_detect_callback>
     4a8:	6822      	ldr	r2, [r4, #0]
     4aa:	6913      	ldr	r3, [r2, #16]
     4ac:	f043 0310 	orr.w	r3, r3, #16
     4b0:	6113      	str	r3, [r2, #16]
     4b2:	6823      	ldr	r3, [r4, #0]
     4b4:	2200      	movs	r2, #0
     4b6:	611a      	str	r2, [r3, #16]
     4b8:	e761      	b.n	37e <drv_uart_interrupt_handler+0x70>
     4ba:	4620      	mov	r0, r4
     4bc:	f7ff ff24 	bl	308 <uart_int_tx_fifo_thres_callback>
     4c0:	6822      	ldr	r2, [r4, #0]
     4c2:	6913      	ldr	r3, [r2, #16]
     4c4:	f043 0301 	orr.w	r3, r3, #1
     4c8:	6113      	str	r3, [r2, #16]
     4ca:	6823      	ldr	r3, [r4, #0]
     4cc:	2200      	movs	r2, #0
     4ce:	611a      	str	r2, [r3, #16]
     4d0:	e759      	b.n	386 <drv_uart_interrupt_handler+0x78>
     4d2:	4620      	mov	r0, r4
     4d4:	f7ff ff17 	bl	306 <uart_int_tx_fifo_empty_callback>
     4d8:	6822      	ldr	r2, [r4, #0]
     4da:	6913      	ldr	r3, [r2, #16]
     4dc:	f043 0302 	orr.w	r3, r3, #2
     4e0:	6113      	str	r3, [r2, #16]
     4e2:	6823      	ldr	r3, [r4, #0]
     4e4:	2200      	movs	r2, #0
     4e6:	611a      	str	r2, [r3, #16]
     4e8:	e751      	b.n	38e <drv_uart_interrupt_handler+0x80>
     4ea:	69d9      	ldr	r1, [r3, #28]
     4ec:	6962      	ldr	r2, [r4, #20]
     4ee:	7ce3      	ldrb	r3, [r4, #19]
     4f0:	1c58      	adds	r0, r3, #1
     4f2:	74e0      	strb	r0, [r4, #19]
     4f4:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4f8:	6823      	ldr	r3, [r4, #0]
     4fa:	695a      	ldr	r2, [r3, #20]
     4fc:	f012 0f1f 	tst.w	r2, #31
     500:	d1f3      	bne.n	4ea <drv_uart_interrupt_handler+0x1dc>
     502:	4620      	mov	r0, r4
     504:	f7ff ff02 	bl	30c <uart_int_rx_fifo_thres_callback>
     508:	6822      	ldr	r2, [r4, #0]
     50a:	6913      	ldr	r3, [r2, #16]
     50c:	f043 0304 	orr.w	r3, r3, #4
     510:	6113      	str	r3, [r2, #16]
     512:	6823      	ldr	r3, [r4, #0]
     514:	2200      	movs	r2, #0
     516:	611a      	str	r2, [r3, #16]
     518:	f015 0f08 	tst.w	r5, #8
     51c:	d020      	beq.n	560 <drv_uart_interrupt_handler+0x252>
     51e:	7ce2      	ldrb	r2, [r4, #19]
     520:	7e23      	ldrb	r3, [r4, #24]
     522:	429a      	cmp	r2, r3
     524:	d30c      	bcc.n	540 <drv_uart_interrupt_handler+0x232>
     526:	6822      	ldr	r2, [r4, #0]
     528:	68d3      	ldr	r3, [r2, #12]
     52a:	f023 030c 	bic.w	r3, r3, #12
     52e:	60d3      	str	r3, [r2, #12]
     530:	e00b      	b.n	54a <drv_uart_interrupt_handler+0x23c>
     532:	69d9      	ldr	r1, [r3, #28]
     534:	6962      	ldr	r2, [r4, #20]
     536:	7ce3      	ldrb	r3, [r4, #19]
     538:	1c58      	adds	r0, r3, #1
     53a:	74e0      	strb	r0, [r4, #19]
     53c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     540:	6823      	ldr	r3, [r4, #0]
     542:	695a      	ldr	r2, [r3, #20]
     544:	f012 0f1f 	tst.w	r2, #31
     548:	d1f3      	bne.n	532 <drv_uart_interrupt_handler+0x224>
     54a:	4620      	mov	r0, r4
     54c:	f7ff fedd 	bl	30a <uart_int_rx_fifo_noempty_callback>
     550:	6822      	ldr	r2, [r4, #0]
     552:	6913      	ldr	r3, [r2, #16]
     554:	f043 0308 	orr.w	r3, r3, #8
     558:	6113      	str	r3, [r2, #16]
     55a:	6823      	ldr	r3, [r4, #0]
     55c:	2200      	movs	r2, #0
     55e:	611a      	str	r2, [r3, #16]
     560:	bd38      	pop	{r3, r4, r5, pc}
	...

00000564 <vprintf>:
     564:	b500      	push	{lr}
     566:	b0a1      	sub	sp, #132	; 0x84
     568:	460a      	mov	r2, r1
     56a:	4601      	mov	r1, r0
     56c:	4668      	mov	r0, sp
     56e:	f000 f8cb 	bl	708 <vsiprintf>
     572:	2800      	cmp	r0, #0
     574:	dc05      	bgt.n	582 <vprintf+0x1e>
     576:	4668      	mov	r0, sp
     578:	f000 f8a8 	bl	6cc <strlen>
     57c:	b021      	add	sp, #132	; 0x84
     57e:	f85d fb04 	ldr.w	pc, [sp], #4
     582:	4668      	mov	r0, sp
     584:	f000 f8a2 	bl	6cc <strlen>
     588:	b2c2      	uxtb	r2, r0
     58a:	4669      	mov	r1, sp
     58c:	4801      	ldr	r0, [pc, #4]	; (594 <vprintf+0x30>)
     58e:	f7ff fe29 	bl	1e4 <drv_uart_putchars>
     592:	e7f0      	b.n	576 <vprintf+0x12>
     594:	00020088 	andeq	r0, r2, r8, lsl #1

00000598 <drv_uart_printf>:
     598:	b40f      	push	{r0, r1, r2, r3}
     59a:	b500      	push	{lr}
     59c:	b083      	sub	sp, #12
     59e:	a904      	add	r1, sp, #16
     5a0:	f851 0b04 	ldr.w	r0, [r1], #4
     5a4:	9101      	str	r1, [sp, #4]
     5a6:	f7ff ffdd 	bl	564 <vprintf>
     5aa:	b003      	add	sp, #12
     5ac:	f85d eb04 	ldr.w	lr, [sp], #4
     5b0:	b004      	add	sp, #16
     5b2:	4770      	bx	lr

000005b4 <NMI_Handler>:
     5b4:	4770      	bx	lr

000005b6 <HardFault_Handler>:
     5b6:	e7fe      	b.n	5b6 <HardFault_Handler>

000005b8 <MemManage_Handler>:
     5b8:	e7fe      	b.n	5b8 <MemManage_Handler>

000005ba <BusFault_Handler>:
     5ba:	e7fe      	b.n	5ba <BusFault_Handler>

000005bc <UsageFault_Handler>:
     5bc:	e7fe      	b.n	5bc <UsageFault_Handler>

000005be <SVC_Handler>:
     5be:	4770      	bx	lr

000005c0 <DebugMon_Handler>:
     5c0:	4770      	bx	lr

000005c2 <PendSV_Handler>:
     5c2:	4770      	bx	lr

000005c4 <SysTick_Handler>:
     5c4:	4770      	bx	lr
	...

000005c8 <Uart0_Handler>:
     5c8:	b508      	push	{r3, lr}
     5ca:	4b04      	ldr	r3, [pc, #16]	; (5dc <Uart0_Handler+0x14>)
     5cc:	2201      	movs	r2, #1
     5ce:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     5d2:	4803      	ldr	r0, [pc, #12]	; (5e0 <Uart0_Handler+0x18>)
     5d4:	f7ff fe9b 	bl	30e <drv_uart_interrupt_handler>
     5d8:	bd08      	pop	{r3, pc}
     5da:	bf00      	nop
     5dc:	e000e100 	and	lr, r0, r0, lsl #2
     5e0:	00020088 	andeq	r0, r2, r8, lsl #1

000005e4 <main>:
     5e4:	b500      	push	{lr}
     5e6:	b083      	sub	sp, #12
     5e8:	4c0d      	ldr	r4, [pc, #52]	; (620 <main+0x3c>)
     5ea:	4b0e      	ldr	r3, [pc, #56]	; (624 <main+0x40>)
     5ec:	6023      	str	r3, [r4, #0]
     5ee:	4620      	mov	r0, r4
     5f0:	f7ff fd7d 	bl	ee <drv_uart_default_config>
     5f4:	4620      	mov	r0, r4
     5f6:	f7ff fdad 	bl	154 <drv_uart_init>
     5fa:	480b      	ldr	r0, [pc, #44]	; (628 <main+0x44>)
     5fc:	f7ff ffcc 	bl	598 <drv_uart_printf>
     600:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     604:	22ed      	movs	r2, #237	; 0xed
     606:	601a      	str	r2, [r3, #0]
     608:	4c05      	ldr	r4, [pc, #20]	; (620 <main+0x3c>)
     60a:	f10d 0107 	add.w	r1, sp, #7
     60e:	4620      	mov	r0, r4
     610:	f7ff fe1f 	bl	252 <drv_uart_getchar>
     614:	f10d 0107 	add.w	r1, sp, #7
     618:	4620      	mov	r0, r4
     61a:	f7ff fe05 	bl	228 <drv_uart_putchar>
     61e:	e7f3      	b.n	608 <main+0x24>
     620:	00020088 	andeq	r0, r2, r8, lsl #1
     624:	40001000 	andmi	r1, r0, r0
     628:	00001008 	andeq	r1, r0, r8

0000062c <Reset_Handler>:
     62c:	490a      	ldr	r1, [pc, #40]	; (658 <Reset_Handler+0x2c>)
     62e:	4a0b      	ldr	r2, [pc, #44]	; (65c <Reset_Handler+0x30>)
     630:	4b0b      	ldr	r3, [pc, #44]	; (660 <Reset_Handler+0x34>)
     632:	1a9b      	subs	r3, r3, r2
     634:	dd03      	ble.n	63e <Reset_Handler+0x12>
     636:	3b04      	subs	r3, #4
     638:	58c8      	ldr	r0, [r1, r3]
     63a:	50d0      	str	r0, [r2, r3]
     63c:	dcfb      	bgt.n	636 <Reset_Handler+0xa>
     63e:	4909      	ldr	r1, [pc, #36]	; (664 <Reset_Handler+0x38>)
     640:	4a09      	ldr	r2, [pc, #36]	; (668 <Reset_Handler+0x3c>)
     642:	2000      	movs	r0, #0
     644:	4291      	cmp	r1, r2
     646:	bfbc      	itt	lt
     648:	f841 0b04 	strlt.w	r0, [r1], #4
     64c:	e7fa      	blt.n	644 <Reset_Handler+0x18>
     64e:	f7ff ffc9 	bl	5e4 <main>
     652:	f000 f827 	bl	6a4 <exit>
     656:	10700000 	rsbsne	r0, r0, r0
     65a:	00000000 	andeq	r0, r0, r0
     65e:	006c0002 	rsbeq	r0, ip, r2
     662:	006c0002 	rsbeq	r0, ip, r2
     666:	00b80002 	adcseq	r0, r8, r2
     66a:	e7fe0002 	ldrb	r0, [lr, r2]!
     66e:	e7fe      	b.n	66e <Reset_Handler+0x42>
     670:	e7fe      	b.n	670 <Reset_Handler+0x44>
     672:	e7fe      	b.n	672 <Reset_Handler+0x46>
     674:	e7fe      	b.n	674 <Reset_Handler+0x48>
     676:	e7fe      	b.n	676 <Reset_Handler+0x4a>
     678:	e7fe      	b.n	678 <Reset_Handler+0x4c>
     67a:	e7fe      	b.n	67a <Reset_Handler+0x4e>
     67c:	e7fe      	b.n	67c <Reset_Handler+0x50>
     67e:	e7fe      	b.n	67e <Reset_Handler+0x52>

00000680 <Uart1_Handler>:
     680:	e7fe      	b.n	680 <Uart1_Handler>

00000682 <Resv2_Handler>:
     682:	e7fe      	b.n	682 <Resv2_Handler>

00000684 <Resv3_Handler>:
     684:	e7fe      	b.n	684 <Resv3_Handler>

00000686 <EthDma_Handler>:
     686:	e7fe      	b.n	686 <EthDma_Handler>

00000688 <Gpioa_Handler>:
     688:	e7fe      	b.n	688 <Gpioa_Handler>

0000068a <Resv6_Handler>:
     68a:	e7fe      	b.n	68a <Resv6_Handler>

0000068c <Resv7_Handler>:
     68c:	e7fe      	b.n	68c <Resv7_Handler>

0000068e <Bastim_Ch0_Handler>:
     68e:	e7fe      	b.n	68e <Bastim_Ch0_Handler>

00000690 <Bastim_Ch1_Handler>:
     690:	e7fe      	b.n	690 <Bastim_Ch1_Handler>

00000692 <Bastim_Ch2_Handler>:
     692:	e7fe      	b.n	692 <Bastim_Ch2_Handler>

00000694 <Bastim_Ch3_Handler>:
     694:	e7fe      	b.n	694 <Bastim_Ch3_Handler>

00000696 <EthSma_Handler>:
     696:	e7fe      	b.n	696 <EthSma_Handler>

00000698 <EthTx_Handler>:
     698:	e7fe      	b.n	698 <EthTx_Handler>

0000069a <EthRx_Handler>:
     69a:	e7fe      	b.n	69a <EthRx_Handler>

0000069c <Resv15_Handler>:
     69c:	e7fe      	b.n	69c <Resv15_Handler>

0000069e <AdvtimGen_Handler>:
     69e:	e7fe      	b.n	69e <AdvtimGen_Handler>

000006a0 <AdvtimCap_Handler>:
     6a0:	e7fe      	b.n	6a0 <AdvtimCap_Handler>

000006a2 <AdvtimEnc_Handler>:
     6a2:	e7fe      	b.n	6a2 <AdvtimEnc_Handler>

000006a4 <exit>:
     6a4:	b508      	push	{r3, lr}
     6a6:	4b07      	ldr	r3, [pc, #28]	; (6c4 <exit+0x20>)
     6a8:	4604      	mov	r4, r0
     6aa:	b113      	cbz	r3, 6b2 <exit+0xe>
     6ac:	2100      	movs	r1, #0
     6ae:	f3af 8000 	nop.w
     6b2:	4b05      	ldr	r3, [pc, #20]	; (6c8 <exit+0x24>)
     6b4:	6818      	ldr	r0, [r3, #0]
     6b6:	6a83      	ldr	r3, [r0, #40]	; 0x28
     6b8:	b103      	cbz	r3, 6bc <exit+0x18>
     6ba:	4798      	blx	r3
     6bc:	4620      	mov	r0, r4
     6be:	f000 fc95 	bl	fec <_exit>
     6c2:	bf00      	nop
     6c4:	00000000 	andeq	r0, r0, r0
     6c8:	00001034 	andeq	r1, r0, r4, lsr r0

000006cc <strlen>:
     6cc:	4603      	mov	r3, r0
     6ce:	f813 2b01 	ldrb.w	r2, [r3], #1
     6d2:	2a00      	cmp	r2, #0
     6d4:	d1fb      	bne.n	6ce <strlen+0x2>
     6d6:	1a18      	subs	r0, r3, r0
     6d8:	3801      	subs	r0, #1
     6da:	4770      	bx	lr

000006dc <_vsiprintf_r>:
     6dc:	b500      	push	{lr}
     6de:	b09b      	sub	sp, #108	; 0x6c
     6e0:	9100      	str	r1, [sp, #0]
     6e2:	9104      	str	r1, [sp, #16]
     6e4:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     6e8:	9105      	str	r1, [sp, #20]
     6ea:	9102      	str	r1, [sp, #8]
     6ec:	4905      	ldr	r1, [pc, #20]	; (704 <_vsiprintf_r+0x28>)
     6ee:	9103      	str	r1, [sp, #12]
     6f0:	4669      	mov	r1, sp
     6f2:	f000 f86f 	bl	7d4 <_svfiprintf_r>
     6f6:	2200      	movs	r2, #0
     6f8:	9b00      	ldr	r3, [sp, #0]
     6fa:	701a      	strb	r2, [r3, #0]
     6fc:	b01b      	add	sp, #108	; 0x6c
     6fe:	f85d fb04 	ldr.w	pc, [sp], #4
     702:	bf00      	nop
     704:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

00000708 <vsiprintf>:
     708:	4613      	mov	r3, r2
     70a:	460a      	mov	r2, r1
     70c:	4601      	mov	r1, r0
     70e:	4802      	ldr	r0, [pc, #8]	; (718 <vsiprintf+0x10>)
     710:	6800      	ldr	r0, [r0, #0]
     712:	f7ff bfe3 	b.w	6dc <_vsiprintf_r>
     716:	bf00      	nop
     718:	00020000 	andeq	r0, r2, r0

0000071c <__ssputs_r>:
     71c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     720:	688e      	ldr	r6, [r1, #8]
     722:	4682      	mov	sl, r0
     724:	429e      	cmp	r6, r3
     726:	460c      	mov	r4, r1
     728:	4690      	mov	r8, r2
     72a:	461f      	mov	r7, r3
     72c:	d838      	bhi.n	7a0 <__ssputs_r+0x84>
     72e:	898a      	ldrh	r2, [r1, #12]
     730:	f412 6f90 	tst.w	r2, #1152	; 0x480
     734:	d032      	beq.n	79c <__ssputs_r+0x80>
     736:	6825      	ldr	r5, [r4, #0]
     738:	6909      	ldr	r1, [r1, #16]
     73a:	3301      	adds	r3, #1
     73c:	eba5 0901 	sub.w	r9, r5, r1
     740:	6965      	ldr	r5, [r4, #20]
     742:	444b      	add	r3, r9
     744:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     748:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     74c:	106d      	asrs	r5, r5, #1
     74e:	429d      	cmp	r5, r3
     750:	bf38      	it	cc
     752:	461d      	movcc	r5, r3
     754:	0553      	lsls	r3, r2, #21
     756:	d531      	bpl.n	7bc <__ssputs_r+0xa0>
     758:	4629      	mov	r1, r5
     75a:	f000 fb6f 	bl	e3c <_malloc_r>
     75e:	4606      	mov	r6, r0
     760:	b950      	cbnz	r0, 778 <__ssputs_r+0x5c>
     762:	230c      	movs	r3, #12
     764:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     768:	f8ca 3000 	str.w	r3, [sl]
     76c:	89a3      	ldrh	r3, [r4, #12]
     76e:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     772:	81a3      	strh	r3, [r4, #12]
     774:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     778:	464a      	mov	r2, r9
     77a:	6921      	ldr	r1, [r4, #16]
     77c:	f000 face 	bl	d1c <memcpy>
     780:	89a3      	ldrh	r3, [r4, #12]
     782:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     786:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     78a:	81a3      	strh	r3, [r4, #12]
     78c:	6126      	str	r6, [r4, #16]
     78e:	444e      	add	r6, r9
     790:	6026      	str	r6, [r4, #0]
     792:	463e      	mov	r6, r7
     794:	6165      	str	r5, [r4, #20]
     796:	eba5 0509 	sub.w	r5, r5, r9
     79a:	60a5      	str	r5, [r4, #8]
     79c:	42be      	cmp	r6, r7
     79e:	d900      	bls.n	7a2 <__ssputs_r+0x86>
     7a0:	463e      	mov	r6, r7
     7a2:	4632      	mov	r2, r6
     7a4:	4641      	mov	r1, r8
     7a6:	6820      	ldr	r0, [r4, #0]
     7a8:	f000 fac6 	bl	d38 <memmove>
     7ac:	68a3      	ldr	r3, [r4, #8]
     7ae:	2000      	movs	r0, #0
     7b0:	1b9b      	subs	r3, r3, r6
     7b2:	60a3      	str	r3, [r4, #8]
     7b4:	6823      	ldr	r3, [r4, #0]
     7b6:	4433      	add	r3, r6
     7b8:	6023      	str	r3, [r4, #0]
     7ba:	e7db      	b.n	774 <__ssputs_r+0x58>
     7bc:	462a      	mov	r2, r5
     7be:	f000 fbb1 	bl	f24 <_realloc_r>
     7c2:	4606      	mov	r6, r0
     7c4:	2800      	cmp	r0, #0
     7c6:	d1e1      	bne.n	78c <__ssputs_r+0x70>
     7c8:	4650      	mov	r0, sl
     7ca:	6921      	ldr	r1, [r4, #16]
     7cc:	f000 face 	bl	d6c <_free_r>
     7d0:	e7c7      	b.n	762 <__ssputs_r+0x46>
	...

000007d4 <_svfiprintf_r>:
     7d4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7d8:	4698      	mov	r8, r3
     7da:	898b      	ldrh	r3, [r1, #12]
     7dc:	4607      	mov	r7, r0
     7de:	061b      	lsls	r3, r3, #24
     7e0:	460d      	mov	r5, r1
     7e2:	4614      	mov	r4, r2
     7e4:	b09d      	sub	sp, #116	; 0x74
     7e6:	d50e      	bpl.n	806 <_svfiprintf_r+0x32>
     7e8:	690b      	ldr	r3, [r1, #16]
     7ea:	b963      	cbnz	r3, 806 <_svfiprintf_r+0x32>
     7ec:	2140      	movs	r1, #64	; 0x40
     7ee:	f000 fb25 	bl	e3c <_malloc_r>
     7f2:	6028      	str	r0, [r5, #0]
     7f4:	6128      	str	r0, [r5, #16]
     7f6:	b920      	cbnz	r0, 802 <_svfiprintf_r+0x2e>
     7f8:	230c      	movs	r3, #12
     7fa:	603b      	str	r3, [r7, #0]
     7fc:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     800:	e0d1      	b.n	9a6 <_svfiprintf_r+0x1d2>
     802:	2340      	movs	r3, #64	; 0x40
     804:	616b      	str	r3, [r5, #20]
     806:	2300      	movs	r3, #0
     808:	9309      	str	r3, [sp, #36]	; 0x24
     80a:	2320      	movs	r3, #32
     80c:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     810:	2330      	movs	r3, #48	; 0x30
     812:	f04f 0901 	mov.w	r9, #1
     816:	f8cd 800c 	str.w	r8, [sp, #12]
     81a:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 9c0 <_svfiprintf_r+0x1ec>
     81e:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     822:	4623      	mov	r3, r4
     824:	469a      	mov	sl, r3
     826:	f813 2b01 	ldrb.w	r2, [r3], #1
     82a:	b10a      	cbz	r2, 830 <_svfiprintf_r+0x5c>
     82c:	2a25      	cmp	r2, #37	; 0x25
     82e:	d1f9      	bne.n	824 <_svfiprintf_r+0x50>
     830:	ebba 0b04 	subs.w	fp, sl, r4
     834:	d00b      	beq.n	84e <_svfiprintf_r+0x7a>
     836:	465b      	mov	r3, fp
     838:	4622      	mov	r2, r4
     83a:	4629      	mov	r1, r5
     83c:	4638      	mov	r0, r7
     83e:	f7ff ff6d 	bl	71c <__ssputs_r>
     842:	3001      	adds	r0, #1
     844:	f000 80aa 	beq.w	99c <_svfiprintf_r+0x1c8>
     848:	9a09      	ldr	r2, [sp, #36]	; 0x24
     84a:	445a      	add	r2, fp
     84c:	9209      	str	r2, [sp, #36]	; 0x24
     84e:	f89a 3000 	ldrb.w	r3, [sl]
     852:	2b00      	cmp	r3, #0
     854:	f000 80a2 	beq.w	99c <_svfiprintf_r+0x1c8>
     858:	2300      	movs	r3, #0
     85a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     85e:	e9cd 2305 	strd	r2, r3, [sp, #20]
     862:	f10a 0a01 	add.w	sl, sl, #1
     866:	9304      	str	r3, [sp, #16]
     868:	9307      	str	r3, [sp, #28]
     86a:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     86e:	931a      	str	r3, [sp, #104]	; 0x68
     870:	4654      	mov	r4, sl
     872:	2205      	movs	r2, #5
     874:	f814 1b01 	ldrb.w	r1, [r4], #1
     878:	4851      	ldr	r0, [pc, #324]	; (9c0 <_svfiprintf_r+0x1ec>)
     87a:	f000 fa41 	bl	d00 <memchr>
     87e:	9a04      	ldr	r2, [sp, #16]
     880:	b9d8      	cbnz	r0, 8ba <_svfiprintf_r+0xe6>
     882:	06d0      	lsls	r0, r2, #27
     884:	bf44      	itt	mi
     886:	2320      	movmi	r3, #32
     888:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     88c:	0711      	lsls	r1, r2, #28
     88e:	bf44      	itt	mi
     890:	232b      	movmi	r3, #43	; 0x2b
     892:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     896:	f89a 3000 	ldrb.w	r3, [sl]
     89a:	2b2a      	cmp	r3, #42	; 0x2a
     89c:	d015      	beq.n	8ca <_svfiprintf_r+0xf6>
     89e:	4654      	mov	r4, sl
     8a0:	2000      	movs	r0, #0
     8a2:	f04f 0c0a 	mov.w	ip, #10
     8a6:	9a07      	ldr	r2, [sp, #28]
     8a8:	4621      	mov	r1, r4
     8aa:	f811 3b01 	ldrb.w	r3, [r1], #1
     8ae:	3b30      	subs	r3, #48	; 0x30
     8b0:	2b09      	cmp	r3, #9
     8b2:	d94e      	bls.n	952 <_svfiprintf_r+0x17e>
     8b4:	b1b0      	cbz	r0, 8e4 <_svfiprintf_r+0x110>
     8b6:	9207      	str	r2, [sp, #28]
     8b8:	e014      	b.n	8e4 <_svfiprintf_r+0x110>
     8ba:	eba0 0308 	sub.w	r3, r0, r8
     8be:	fa09 f303 	lsl.w	r3, r9, r3
     8c2:	4313      	orrs	r3, r2
     8c4:	46a2      	mov	sl, r4
     8c6:	9304      	str	r3, [sp, #16]
     8c8:	e7d2      	b.n	870 <_svfiprintf_r+0x9c>
     8ca:	9b03      	ldr	r3, [sp, #12]
     8cc:	1d19      	adds	r1, r3, #4
     8ce:	681b      	ldr	r3, [r3, #0]
     8d0:	9103      	str	r1, [sp, #12]
     8d2:	2b00      	cmp	r3, #0
     8d4:	bfbb      	ittet	lt
     8d6:	425b      	neglt	r3, r3
     8d8:	f042 0202 	orrlt.w	r2, r2, #2
     8dc:	9307      	strge	r3, [sp, #28]
     8de:	9307      	strlt	r3, [sp, #28]
     8e0:	bfb8      	it	lt
     8e2:	9204      	strlt	r2, [sp, #16]
     8e4:	7823      	ldrb	r3, [r4, #0]
     8e6:	2b2e      	cmp	r3, #46	; 0x2e
     8e8:	d10c      	bne.n	904 <_svfiprintf_r+0x130>
     8ea:	7863      	ldrb	r3, [r4, #1]
     8ec:	2b2a      	cmp	r3, #42	; 0x2a
     8ee:	d135      	bne.n	95c <_svfiprintf_r+0x188>
     8f0:	9b03      	ldr	r3, [sp, #12]
     8f2:	3402      	adds	r4, #2
     8f4:	1d1a      	adds	r2, r3, #4
     8f6:	681b      	ldr	r3, [r3, #0]
     8f8:	9203      	str	r2, [sp, #12]
     8fa:	2b00      	cmp	r3, #0
     8fc:	bfb8      	it	lt
     8fe:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     902:	9305      	str	r3, [sp, #20]
     904:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 9c4 <_svfiprintf_r+0x1f0>
     908:	2203      	movs	r2, #3
     90a:	4650      	mov	r0, sl
     90c:	7821      	ldrb	r1, [r4, #0]
     90e:	f000 f9f7 	bl	d00 <memchr>
     912:	b140      	cbz	r0, 926 <_svfiprintf_r+0x152>
     914:	2340      	movs	r3, #64	; 0x40
     916:	eba0 000a 	sub.w	r0, r0, sl
     91a:	fa03 f000 	lsl.w	r0, r3, r0
     91e:	9b04      	ldr	r3, [sp, #16]
     920:	3401      	adds	r4, #1
     922:	4303      	orrs	r3, r0
     924:	9304      	str	r3, [sp, #16]
     926:	f814 1b01 	ldrb.w	r1, [r4], #1
     92a:	2206      	movs	r2, #6
     92c:	4826      	ldr	r0, [pc, #152]	; (9c8 <_svfiprintf_r+0x1f4>)
     92e:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     932:	f000 f9e5 	bl	d00 <memchr>
     936:	2800      	cmp	r0, #0
     938:	d038      	beq.n	9ac <_svfiprintf_r+0x1d8>
     93a:	4b24      	ldr	r3, [pc, #144]	; (9cc <_svfiprintf_r+0x1f8>)
     93c:	bb1b      	cbnz	r3, 986 <_svfiprintf_r+0x1b2>
     93e:	9b03      	ldr	r3, [sp, #12]
     940:	3307      	adds	r3, #7
     942:	f023 0307 	bic.w	r3, r3, #7
     946:	3308      	adds	r3, #8
     948:	9303      	str	r3, [sp, #12]
     94a:	9b09      	ldr	r3, [sp, #36]	; 0x24
     94c:	4433      	add	r3, r6
     94e:	9309      	str	r3, [sp, #36]	; 0x24
     950:	e767      	b.n	822 <_svfiprintf_r+0x4e>
     952:	460c      	mov	r4, r1
     954:	2001      	movs	r0, #1
     956:	fb0c 3202 	mla	r2, ip, r2, r3
     95a:	e7a5      	b.n	8a8 <_svfiprintf_r+0xd4>
     95c:	2300      	movs	r3, #0
     95e:	f04f 0c0a 	mov.w	ip, #10
     962:	4619      	mov	r1, r3
     964:	3401      	adds	r4, #1
     966:	9305      	str	r3, [sp, #20]
     968:	4620      	mov	r0, r4
     96a:	f810 2b01 	ldrb.w	r2, [r0], #1
     96e:	3a30      	subs	r2, #48	; 0x30
     970:	2a09      	cmp	r2, #9
     972:	d903      	bls.n	97c <_svfiprintf_r+0x1a8>
     974:	2b00      	cmp	r3, #0
     976:	d0c5      	beq.n	904 <_svfiprintf_r+0x130>
     978:	9105      	str	r1, [sp, #20]
     97a:	e7c3      	b.n	904 <_svfiprintf_r+0x130>
     97c:	4604      	mov	r4, r0
     97e:	2301      	movs	r3, #1
     980:	fb0c 2101 	mla	r1, ip, r1, r2
     984:	e7f0      	b.n	968 <_svfiprintf_r+0x194>
     986:	ab03      	add	r3, sp, #12
     988:	9300      	str	r3, [sp, #0]
     98a:	462a      	mov	r2, r5
     98c:	4638      	mov	r0, r7
     98e:	4b10      	ldr	r3, [pc, #64]	; (9d0 <_svfiprintf_r+0x1fc>)
     990:	a904      	add	r1, sp, #16
     992:	f3af 8000 	nop.w
     996:	1c42      	adds	r2, r0, #1
     998:	4606      	mov	r6, r0
     99a:	d1d6      	bne.n	94a <_svfiprintf_r+0x176>
     99c:	89ab      	ldrh	r3, [r5, #12]
     99e:	065b      	lsls	r3, r3, #25
     9a0:	f53f af2c 	bmi.w	7fc <_svfiprintf_r+0x28>
     9a4:	9809      	ldr	r0, [sp, #36]	; 0x24
     9a6:	b01d      	add	sp, #116	; 0x74
     9a8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     9ac:	ab03      	add	r3, sp, #12
     9ae:	9300      	str	r3, [sp, #0]
     9b0:	462a      	mov	r2, r5
     9b2:	4638      	mov	r0, r7
     9b4:	4b06      	ldr	r3, [pc, #24]	; (9d0 <_svfiprintf_r+0x1fc>)
     9b6:	a904      	add	r1, sp, #16
     9b8:	f000 f87c 	bl	ab4 <_printf_i>
     9bc:	e7eb      	b.n	996 <_svfiprintf_r+0x1c2>
     9be:	bf00      	nop
     9c0:	00001038 	andeq	r1, r0, r8, lsr r0
     9c4:	0000103e 	andeq	r1, r0, lr, lsr r0
     9c8:	00001042 	andeq	r1, r0, r2, asr #32
     9cc:	00000000 	andeq	r0, r0, r0
     9d0:	0000071d 	andeq	r0, r0, sp, lsl r7

000009d4 <_printf_common>:
     9d4:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     9d8:	4616      	mov	r6, r2
     9da:	4699      	mov	r9, r3
     9dc:	688a      	ldr	r2, [r1, #8]
     9de:	690b      	ldr	r3, [r1, #16]
     9e0:	4607      	mov	r7, r0
     9e2:	4293      	cmp	r3, r2
     9e4:	bfb8      	it	lt
     9e6:	4613      	movlt	r3, r2
     9e8:	6033      	str	r3, [r6, #0]
     9ea:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     9ee:	460c      	mov	r4, r1
     9f0:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9f4:	b10a      	cbz	r2, 9fa <_printf_common+0x26>
     9f6:	3301      	adds	r3, #1
     9f8:	6033      	str	r3, [r6, #0]
     9fa:	6823      	ldr	r3, [r4, #0]
     9fc:	0699      	lsls	r1, r3, #26
     9fe:	bf42      	ittt	mi
     a00:	6833      	ldrmi	r3, [r6, #0]
     a02:	3302      	addmi	r3, #2
     a04:	6033      	strmi	r3, [r6, #0]
     a06:	6825      	ldr	r5, [r4, #0]
     a08:	f015 0506 	ands.w	r5, r5, #6
     a0c:	d106      	bne.n	a1c <_printf_common+0x48>
     a0e:	f104 0a19 	add.w	sl, r4, #25
     a12:	68e3      	ldr	r3, [r4, #12]
     a14:	6832      	ldr	r2, [r6, #0]
     a16:	1a9b      	subs	r3, r3, r2
     a18:	42ab      	cmp	r3, r5
     a1a:	dc28      	bgt.n	a6e <_printf_common+0x9a>
     a1c:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     a20:	1e13      	subs	r3, r2, #0
     a22:	6822      	ldr	r2, [r4, #0]
     a24:	bf18      	it	ne
     a26:	2301      	movne	r3, #1
     a28:	0692      	lsls	r2, r2, #26
     a2a:	d42d      	bmi.n	a88 <_printf_common+0xb4>
     a2c:	4649      	mov	r1, r9
     a2e:	4638      	mov	r0, r7
     a30:	f104 0243 	add.w	r2, r4, #67	; 0x43
     a34:	47c0      	blx	r8
     a36:	3001      	adds	r0, #1
     a38:	d020      	beq.n	a7c <_printf_common+0xa8>
     a3a:	6823      	ldr	r3, [r4, #0]
     a3c:	68e5      	ldr	r5, [r4, #12]
     a3e:	f003 0306 	and.w	r3, r3, #6
     a42:	2b04      	cmp	r3, #4
     a44:	bf18      	it	ne
     a46:	2500      	movne	r5, #0
     a48:	6832      	ldr	r2, [r6, #0]
     a4a:	f04f 0600 	mov.w	r6, #0
     a4e:	68a3      	ldr	r3, [r4, #8]
     a50:	bf08      	it	eq
     a52:	1aad      	subeq	r5, r5, r2
     a54:	6922      	ldr	r2, [r4, #16]
     a56:	bf08      	it	eq
     a58:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a5c:	4293      	cmp	r3, r2
     a5e:	bfc4      	itt	gt
     a60:	1a9b      	subgt	r3, r3, r2
     a62:	18ed      	addgt	r5, r5, r3
     a64:	341a      	adds	r4, #26
     a66:	42b5      	cmp	r5, r6
     a68:	d11a      	bne.n	aa0 <_printf_common+0xcc>
     a6a:	2000      	movs	r0, #0
     a6c:	e008      	b.n	a80 <_printf_common+0xac>
     a6e:	2301      	movs	r3, #1
     a70:	4652      	mov	r2, sl
     a72:	4649      	mov	r1, r9
     a74:	4638      	mov	r0, r7
     a76:	47c0      	blx	r8
     a78:	3001      	adds	r0, #1
     a7a:	d103      	bne.n	a84 <_printf_common+0xb0>
     a7c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a80:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a84:	3501      	adds	r5, #1
     a86:	e7c4      	b.n	a12 <_printf_common+0x3e>
     a88:	2030      	movs	r0, #48	; 0x30
     a8a:	18e1      	adds	r1, r4, r3
     a8c:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a90:	1c5a      	adds	r2, r3, #1
     a92:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a96:	4422      	add	r2, r4
     a98:	3302      	adds	r3, #2
     a9a:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     a9e:	e7c5      	b.n	a2c <_printf_common+0x58>
     aa0:	2301      	movs	r3, #1
     aa2:	4622      	mov	r2, r4
     aa4:	4649      	mov	r1, r9
     aa6:	4638      	mov	r0, r7
     aa8:	47c0      	blx	r8
     aaa:	3001      	adds	r0, #1
     aac:	d0e6      	beq.n	a7c <_printf_common+0xa8>
     aae:	3601      	adds	r6, #1
     ab0:	e7d9      	b.n	a66 <_printf_common+0x92>
	...

00000ab4 <_printf_i>:
     ab4:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     ab8:	7e0f      	ldrb	r7, [r1, #24]
     aba:	4691      	mov	r9, r2
     abc:	2f78      	cmp	r7, #120	; 0x78
     abe:	4680      	mov	r8, r0
     ac0:	460c      	mov	r4, r1
     ac2:	469a      	mov	sl, r3
     ac4:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     ac6:	f101 0243 	add.w	r2, r1, #67	; 0x43
     aca:	d807      	bhi.n	adc <_printf_i+0x28>
     acc:	2f62      	cmp	r7, #98	; 0x62
     ace:	d80a      	bhi.n	ae6 <_printf_i+0x32>
     ad0:	2f00      	cmp	r7, #0
     ad2:	f000 80d9 	beq.w	c88 <_printf_i+0x1d4>
     ad6:	2f58      	cmp	r7, #88	; 0x58
     ad8:	f000 80a4 	beq.w	c24 <_printf_i+0x170>
     adc:	f104 0542 	add.w	r5, r4, #66	; 0x42
     ae0:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     ae4:	e03a      	b.n	b5c <_printf_i+0xa8>
     ae6:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     aea:	2b15      	cmp	r3, #21
     aec:	d8f6      	bhi.n	adc <_printf_i+0x28>
     aee:	a101      	add	r1, pc, #4	; (adr r1, af4 <_printf_i+0x40>)
     af0:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     af4:	00000b4d 	andeq	r0, r0, sp, asr #22
     af8:	00000b61 	andeq	r0, r0, r1, ror #22
     afc:	00000add 	ldrdeq	r0, [r0], -sp
     b00:	00000add 	ldrdeq	r0, [r0], -sp
     b04:	00000add 	ldrdeq	r0, [r0], -sp
     b08:	00000add 	ldrdeq	r0, [r0], -sp
     b0c:	00000b61 	andeq	r0, r0, r1, ror #22
     b10:	00000add 	ldrdeq	r0, [r0], -sp
     b14:	00000add 	ldrdeq	r0, [r0], -sp
     b18:	00000add 	ldrdeq	r0, [r0], -sp
     b1c:	00000add 	ldrdeq	r0, [r0], -sp
     b20:	00000c6f 	andeq	r0, r0, pc, ror #24
     b24:	00000b91 	muleq	r0, r1, fp
     b28:	00000c51 	andeq	r0, r0, r1, asr ip
     b2c:	00000add 	ldrdeq	r0, [r0], -sp
     b30:	00000add 	ldrdeq	r0, [r0], -sp
     b34:	00000c91 	muleq	r0, r1, ip
     b38:	00000add 	ldrdeq	r0, [r0], -sp
     b3c:	00000b91 	muleq	r0, r1, fp
     b40:	00000add 	ldrdeq	r0, [r0], -sp
     b44:	00000add 	ldrdeq	r0, [r0], -sp
     b48:	00000c59 	andeq	r0, r0, r9, asr ip
     b4c:	682b      	ldr	r3, [r5, #0]
     b4e:	1d1a      	adds	r2, r3, #4
     b50:	681b      	ldr	r3, [r3, #0]
     b52:	602a      	str	r2, [r5, #0]
     b54:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b58:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b5c:	2301      	movs	r3, #1
     b5e:	e0a4      	b.n	caa <_printf_i+0x1f6>
     b60:	6820      	ldr	r0, [r4, #0]
     b62:	6829      	ldr	r1, [r5, #0]
     b64:	0606      	lsls	r6, r0, #24
     b66:	f101 0304 	add.w	r3, r1, #4
     b6a:	d50a      	bpl.n	b82 <_printf_i+0xce>
     b6c:	680e      	ldr	r6, [r1, #0]
     b6e:	602b      	str	r3, [r5, #0]
     b70:	2e00      	cmp	r6, #0
     b72:	da03      	bge.n	b7c <_printf_i+0xc8>
     b74:	232d      	movs	r3, #45	; 0x2d
     b76:	4276      	negs	r6, r6
     b78:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b7c:	230a      	movs	r3, #10
     b7e:	485e      	ldr	r0, [pc, #376]	; (cf8 <_printf_i+0x244>)
     b80:	e019      	b.n	bb6 <_printf_i+0x102>
     b82:	680e      	ldr	r6, [r1, #0]
     b84:	f010 0f40 	tst.w	r0, #64	; 0x40
     b88:	602b      	str	r3, [r5, #0]
     b8a:	bf18      	it	ne
     b8c:	b236      	sxthne	r6, r6
     b8e:	e7ef      	b.n	b70 <_printf_i+0xbc>
     b90:	682b      	ldr	r3, [r5, #0]
     b92:	6820      	ldr	r0, [r4, #0]
     b94:	1d19      	adds	r1, r3, #4
     b96:	6029      	str	r1, [r5, #0]
     b98:	0601      	lsls	r1, r0, #24
     b9a:	d501      	bpl.n	ba0 <_printf_i+0xec>
     b9c:	681e      	ldr	r6, [r3, #0]
     b9e:	e002      	b.n	ba6 <_printf_i+0xf2>
     ba0:	0646      	lsls	r6, r0, #25
     ba2:	d5fb      	bpl.n	b9c <_printf_i+0xe8>
     ba4:	881e      	ldrh	r6, [r3, #0]
     ba6:	2f6f      	cmp	r7, #111	; 0x6f
     ba8:	bf0c      	ite	eq
     baa:	2308      	moveq	r3, #8
     bac:	230a      	movne	r3, #10
     bae:	4852      	ldr	r0, [pc, #328]	; (cf8 <_printf_i+0x244>)
     bb0:	2100      	movs	r1, #0
     bb2:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     bb6:	6865      	ldr	r5, [r4, #4]
     bb8:	2d00      	cmp	r5, #0
     bba:	bfa8      	it	ge
     bbc:	6821      	ldrge	r1, [r4, #0]
     bbe:	60a5      	str	r5, [r4, #8]
     bc0:	bfa4      	itt	ge
     bc2:	f021 0104 	bicge.w	r1, r1, #4
     bc6:	6021      	strge	r1, [r4, #0]
     bc8:	b90e      	cbnz	r6, bce <_printf_i+0x11a>
     bca:	2d00      	cmp	r5, #0
     bcc:	d04d      	beq.n	c6a <_printf_i+0x1b6>
     bce:	4615      	mov	r5, r2
     bd0:	fbb6 f1f3 	udiv	r1, r6, r3
     bd4:	fb03 6711 	mls	r7, r3, r1, r6
     bd8:	5dc7      	ldrb	r7, [r0, r7]
     bda:	f805 7d01 	strb.w	r7, [r5, #-1]!
     bde:	4637      	mov	r7, r6
     be0:	42bb      	cmp	r3, r7
     be2:	460e      	mov	r6, r1
     be4:	d9f4      	bls.n	bd0 <_printf_i+0x11c>
     be6:	2b08      	cmp	r3, #8
     be8:	d10b      	bne.n	c02 <_printf_i+0x14e>
     bea:	6823      	ldr	r3, [r4, #0]
     bec:	07de      	lsls	r6, r3, #31
     bee:	d508      	bpl.n	c02 <_printf_i+0x14e>
     bf0:	6923      	ldr	r3, [r4, #16]
     bf2:	6861      	ldr	r1, [r4, #4]
     bf4:	4299      	cmp	r1, r3
     bf6:	bfde      	ittt	le
     bf8:	2330      	movle	r3, #48	; 0x30
     bfa:	f805 3c01 	strble.w	r3, [r5, #-1]
     bfe:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     c02:	1b52      	subs	r2, r2, r5
     c04:	6122      	str	r2, [r4, #16]
     c06:	464b      	mov	r3, r9
     c08:	4621      	mov	r1, r4
     c0a:	4640      	mov	r0, r8
     c0c:	f8cd a000 	str.w	sl, [sp]
     c10:	aa03      	add	r2, sp, #12
     c12:	f7ff fedf 	bl	9d4 <_printf_common>
     c16:	3001      	adds	r0, #1
     c18:	d14c      	bne.n	cb4 <_printf_i+0x200>
     c1a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     c1e:	b004      	add	sp, #16
     c20:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     c24:	4834      	ldr	r0, [pc, #208]	; (cf8 <_printf_i+0x244>)
     c26:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     c2a:	6829      	ldr	r1, [r5, #0]
     c2c:	6823      	ldr	r3, [r4, #0]
     c2e:	f851 6b04 	ldr.w	r6, [r1], #4
     c32:	6029      	str	r1, [r5, #0]
     c34:	061d      	lsls	r5, r3, #24
     c36:	d514      	bpl.n	c62 <_printf_i+0x1ae>
     c38:	07df      	lsls	r7, r3, #31
     c3a:	bf44      	itt	mi
     c3c:	f043 0320 	orrmi.w	r3, r3, #32
     c40:	6023      	strmi	r3, [r4, #0]
     c42:	b91e      	cbnz	r6, c4c <_printf_i+0x198>
     c44:	6823      	ldr	r3, [r4, #0]
     c46:	f023 0320 	bic.w	r3, r3, #32
     c4a:	6023      	str	r3, [r4, #0]
     c4c:	2310      	movs	r3, #16
     c4e:	e7af      	b.n	bb0 <_printf_i+0xfc>
     c50:	6823      	ldr	r3, [r4, #0]
     c52:	f043 0320 	orr.w	r3, r3, #32
     c56:	6023      	str	r3, [r4, #0]
     c58:	2378      	movs	r3, #120	; 0x78
     c5a:	4828      	ldr	r0, [pc, #160]	; (cfc <_printf_i+0x248>)
     c5c:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c60:	e7e3      	b.n	c2a <_printf_i+0x176>
     c62:	0659      	lsls	r1, r3, #25
     c64:	bf48      	it	mi
     c66:	b2b6      	uxthmi	r6, r6
     c68:	e7e6      	b.n	c38 <_printf_i+0x184>
     c6a:	4615      	mov	r5, r2
     c6c:	e7bb      	b.n	be6 <_printf_i+0x132>
     c6e:	682b      	ldr	r3, [r5, #0]
     c70:	6826      	ldr	r6, [r4, #0]
     c72:	1d18      	adds	r0, r3, #4
     c74:	6961      	ldr	r1, [r4, #20]
     c76:	6028      	str	r0, [r5, #0]
     c78:	0635      	lsls	r5, r6, #24
     c7a:	681b      	ldr	r3, [r3, #0]
     c7c:	d501      	bpl.n	c82 <_printf_i+0x1ce>
     c7e:	6019      	str	r1, [r3, #0]
     c80:	e002      	b.n	c88 <_printf_i+0x1d4>
     c82:	0670      	lsls	r0, r6, #25
     c84:	d5fb      	bpl.n	c7e <_printf_i+0x1ca>
     c86:	8019      	strh	r1, [r3, #0]
     c88:	2300      	movs	r3, #0
     c8a:	4615      	mov	r5, r2
     c8c:	6123      	str	r3, [r4, #16]
     c8e:	e7ba      	b.n	c06 <_printf_i+0x152>
     c90:	682b      	ldr	r3, [r5, #0]
     c92:	2100      	movs	r1, #0
     c94:	1d1a      	adds	r2, r3, #4
     c96:	602a      	str	r2, [r5, #0]
     c98:	681d      	ldr	r5, [r3, #0]
     c9a:	6862      	ldr	r2, [r4, #4]
     c9c:	4628      	mov	r0, r5
     c9e:	f000 f82f 	bl	d00 <memchr>
     ca2:	b108      	cbz	r0, ca8 <_printf_i+0x1f4>
     ca4:	1b40      	subs	r0, r0, r5
     ca6:	6060      	str	r0, [r4, #4]
     ca8:	6863      	ldr	r3, [r4, #4]
     caa:	6123      	str	r3, [r4, #16]
     cac:	2300      	movs	r3, #0
     cae:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     cb2:	e7a8      	b.n	c06 <_printf_i+0x152>
     cb4:	462a      	mov	r2, r5
     cb6:	4649      	mov	r1, r9
     cb8:	4640      	mov	r0, r8
     cba:	6923      	ldr	r3, [r4, #16]
     cbc:	47d0      	blx	sl
     cbe:	3001      	adds	r0, #1
     cc0:	d0ab      	beq.n	c1a <_printf_i+0x166>
     cc2:	6823      	ldr	r3, [r4, #0]
     cc4:	079b      	lsls	r3, r3, #30
     cc6:	d413      	bmi.n	cf0 <_printf_i+0x23c>
     cc8:	68e0      	ldr	r0, [r4, #12]
     cca:	9b03      	ldr	r3, [sp, #12]
     ccc:	4298      	cmp	r0, r3
     cce:	bfb8      	it	lt
     cd0:	4618      	movlt	r0, r3
     cd2:	e7a4      	b.n	c1e <_printf_i+0x16a>
     cd4:	2301      	movs	r3, #1
     cd6:	4632      	mov	r2, r6
     cd8:	4649      	mov	r1, r9
     cda:	4640      	mov	r0, r8
     cdc:	47d0      	blx	sl
     cde:	3001      	adds	r0, #1
     ce0:	d09b      	beq.n	c1a <_printf_i+0x166>
     ce2:	3501      	adds	r5, #1
     ce4:	68e3      	ldr	r3, [r4, #12]
     ce6:	9903      	ldr	r1, [sp, #12]
     ce8:	1a5b      	subs	r3, r3, r1
     cea:	42ab      	cmp	r3, r5
     cec:	dcf2      	bgt.n	cd4 <_printf_i+0x220>
     cee:	e7eb      	b.n	cc8 <_printf_i+0x214>
     cf0:	2500      	movs	r5, #0
     cf2:	f104 0619 	add.w	r6, r4, #25
     cf6:	e7f5      	b.n	ce4 <_printf_i+0x230>
     cf8:	00001049 	andeq	r1, r0, r9, asr #32
     cfc:	0000105a 	andeq	r1, r0, sl, asr r0

00000d00 <memchr>:
     d00:	4603      	mov	r3, r0
     d02:	b510      	push	{r4, lr}
     d04:	b2c9      	uxtb	r1, r1
     d06:	4402      	add	r2, r0
     d08:	4293      	cmp	r3, r2
     d0a:	4618      	mov	r0, r3
     d0c:	d101      	bne.n	d12 <memchr+0x12>
     d0e:	2000      	movs	r0, #0
     d10:	e003      	b.n	d1a <memchr+0x1a>
     d12:	7804      	ldrb	r4, [r0, #0]
     d14:	3301      	adds	r3, #1
     d16:	428c      	cmp	r4, r1
     d18:	d1f6      	bne.n	d08 <memchr+0x8>
     d1a:	bd10      	pop	{r4, pc}

00000d1c <memcpy>:
     d1c:	440a      	add	r2, r1
     d1e:	4291      	cmp	r1, r2
     d20:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     d24:	d100      	bne.n	d28 <memcpy+0xc>
     d26:	4770      	bx	lr
     d28:	b510      	push	{r4, lr}
     d2a:	f811 4b01 	ldrb.w	r4, [r1], #1
     d2e:	4291      	cmp	r1, r2
     d30:	f803 4f01 	strb.w	r4, [r3, #1]!
     d34:	d1f9      	bne.n	d2a <memcpy+0xe>
     d36:	bd10      	pop	{r4, pc}

00000d38 <memmove>:
     d38:	4288      	cmp	r0, r1
     d3a:	b510      	push	{r4, lr}
     d3c:	eb01 0402 	add.w	r4, r1, r2
     d40:	d902      	bls.n	d48 <memmove+0x10>
     d42:	4284      	cmp	r4, r0
     d44:	4623      	mov	r3, r4
     d46:	d807      	bhi.n	d58 <memmove+0x20>
     d48:	1e43      	subs	r3, r0, #1
     d4a:	42a1      	cmp	r1, r4
     d4c:	d008      	beq.n	d60 <memmove+0x28>
     d4e:	f811 2b01 	ldrb.w	r2, [r1], #1
     d52:	f803 2f01 	strb.w	r2, [r3, #1]!
     d56:	e7f8      	b.n	d4a <memmove+0x12>
     d58:	4601      	mov	r1, r0
     d5a:	4402      	add	r2, r0
     d5c:	428a      	cmp	r2, r1
     d5e:	d100      	bne.n	d62 <memmove+0x2a>
     d60:	bd10      	pop	{r4, pc}
     d62:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d66:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d6a:	e7f7      	b.n	d5c <memmove+0x24>

00000d6c <_free_r>:
     d6c:	b538      	push	{r3, r4, r5, lr}
     d6e:	4605      	mov	r5, r0
     d70:	2900      	cmp	r1, #0
     d72:	d040      	beq.n	df6 <_free_r+0x8a>
     d74:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d78:	1f0c      	subs	r4, r1, #4
     d7a:	2b00      	cmp	r3, #0
     d7c:	bfb8      	it	lt
     d7e:	18e4      	addlt	r4, r4, r3
     d80:	f000 f910 	bl	fa4 <__malloc_lock>
     d84:	4a1c      	ldr	r2, [pc, #112]	; (df8 <_free_r+0x8c>)
     d86:	6813      	ldr	r3, [r2, #0]
     d88:	b933      	cbnz	r3, d98 <_free_r+0x2c>
     d8a:	6063      	str	r3, [r4, #4]
     d8c:	6014      	str	r4, [r2, #0]
     d8e:	4628      	mov	r0, r5
     d90:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d94:	f000 b90c 	b.w	fb0 <__malloc_unlock>
     d98:	42a3      	cmp	r3, r4
     d9a:	d908      	bls.n	dae <_free_r+0x42>
     d9c:	6820      	ldr	r0, [r4, #0]
     d9e:	1821      	adds	r1, r4, r0
     da0:	428b      	cmp	r3, r1
     da2:	bf01      	itttt	eq
     da4:	6819      	ldreq	r1, [r3, #0]
     da6:	685b      	ldreq	r3, [r3, #4]
     da8:	1809      	addeq	r1, r1, r0
     daa:	6021      	streq	r1, [r4, #0]
     dac:	e7ed      	b.n	d8a <_free_r+0x1e>
     dae:	461a      	mov	r2, r3
     db0:	685b      	ldr	r3, [r3, #4]
     db2:	b10b      	cbz	r3, db8 <_free_r+0x4c>
     db4:	42a3      	cmp	r3, r4
     db6:	d9fa      	bls.n	dae <_free_r+0x42>
     db8:	6811      	ldr	r1, [r2, #0]
     dba:	1850      	adds	r0, r2, r1
     dbc:	42a0      	cmp	r0, r4
     dbe:	d10b      	bne.n	dd8 <_free_r+0x6c>
     dc0:	6820      	ldr	r0, [r4, #0]
     dc2:	4401      	add	r1, r0
     dc4:	1850      	adds	r0, r2, r1
     dc6:	4283      	cmp	r3, r0
     dc8:	6011      	str	r1, [r2, #0]
     dca:	d1e0      	bne.n	d8e <_free_r+0x22>
     dcc:	6818      	ldr	r0, [r3, #0]
     dce:	685b      	ldr	r3, [r3, #4]
     dd0:	4401      	add	r1, r0
     dd2:	6011      	str	r1, [r2, #0]
     dd4:	6053      	str	r3, [r2, #4]
     dd6:	e7da      	b.n	d8e <_free_r+0x22>
     dd8:	d902      	bls.n	de0 <_free_r+0x74>
     dda:	230c      	movs	r3, #12
     ddc:	602b      	str	r3, [r5, #0]
     dde:	e7d6      	b.n	d8e <_free_r+0x22>
     de0:	6820      	ldr	r0, [r4, #0]
     de2:	1821      	adds	r1, r4, r0
     de4:	428b      	cmp	r3, r1
     de6:	bf01      	itttt	eq
     de8:	6819      	ldreq	r1, [r3, #0]
     dea:	685b      	ldreq	r3, [r3, #4]
     dec:	1809      	addeq	r1, r1, r0
     dee:	6021      	streq	r1, [r4, #0]
     df0:	6063      	str	r3, [r4, #4]
     df2:	6054      	str	r4, [r2, #4]
     df4:	e7cb      	b.n	d8e <_free_r+0x22>
     df6:	bd38      	pop	{r3, r4, r5, pc}
     df8:	000200a4 	andeq	r0, r2, r4, lsr #1

00000dfc <sbrk_aligned>:
     dfc:	b570      	push	{r4, r5, r6, lr}
     dfe:	4e0e      	ldr	r6, [pc, #56]	; (e38 <sbrk_aligned+0x3c>)
     e00:	460c      	mov	r4, r1
     e02:	6831      	ldr	r1, [r6, #0]
     e04:	4605      	mov	r5, r0
     e06:	b911      	cbnz	r1, e0e <sbrk_aligned+0x12>
     e08:	f000 f8bc 	bl	f84 <_sbrk_r>
     e0c:	6030      	str	r0, [r6, #0]
     e0e:	4621      	mov	r1, r4
     e10:	4628      	mov	r0, r5
     e12:	f000 f8b7 	bl	f84 <_sbrk_r>
     e16:	1c43      	adds	r3, r0, #1
     e18:	d00a      	beq.n	e30 <sbrk_aligned+0x34>
     e1a:	1cc4      	adds	r4, r0, #3
     e1c:	f024 0403 	bic.w	r4, r4, #3
     e20:	42a0      	cmp	r0, r4
     e22:	d007      	beq.n	e34 <sbrk_aligned+0x38>
     e24:	1a21      	subs	r1, r4, r0
     e26:	4628      	mov	r0, r5
     e28:	f000 f8ac 	bl	f84 <_sbrk_r>
     e2c:	3001      	adds	r0, #1
     e2e:	d101      	bne.n	e34 <sbrk_aligned+0x38>
     e30:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     e34:	4620      	mov	r0, r4
     e36:	bd70      	pop	{r4, r5, r6, pc}
     e38:	000200a8 	andeq	r0, r2, r8, lsr #1

00000e3c <_malloc_r>:
     e3c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     e40:	1ccd      	adds	r5, r1, #3
     e42:	f025 0503 	bic.w	r5, r5, #3
     e46:	3508      	adds	r5, #8
     e48:	2d0c      	cmp	r5, #12
     e4a:	bf38      	it	cc
     e4c:	250c      	movcc	r5, #12
     e4e:	2d00      	cmp	r5, #0
     e50:	4607      	mov	r7, r0
     e52:	db01      	blt.n	e58 <_malloc_r+0x1c>
     e54:	42a9      	cmp	r1, r5
     e56:	d905      	bls.n	e64 <_malloc_r+0x28>
     e58:	230c      	movs	r3, #12
     e5a:	2600      	movs	r6, #0
     e5c:	603b      	str	r3, [r7, #0]
     e5e:	4630      	mov	r0, r6
     e60:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e64:	4e2e      	ldr	r6, [pc, #184]	; (f20 <_malloc_r+0xe4>)
     e66:	f000 f89d 	bl	fa4 <__malloc_lock>
     e6a:	6833      	ldr	r3, [r6, #0]
     e6c:	461c      	mov	r4, r3
     e6e:	bb34      	cbnz	r4, ebe <_malloc_r+0x82>
     e70:	4629      	mov	r1, r5
     e72:	4638      	mov	r0, r7
     e74:	f7ff ffc2 	bl	dfc <sbrk_aligned>
     e78:	1c43      	adds	r3, r0, #1
     e7a:	4604      	mov	r4, r0
     e7c:	d14d      	bne.n	f1a <_malloc_r+0xde>
     e7e:	6834      	ldr	r4, [r6, #0]
     e80:	4626      	mov	r6, r4
     e82:	2e00      	cmp	r6, #0
     e84:	d140      	bne.n	f08 <_malloc_r+0xcc>
     e86:	6823      	ldr	r3, [r4, #0]
     e88:	4631      	mov	r1, r6
     e8a:	4638      	mov	r0, r7
     e8c:	eb04 0803 	add.w	r8, r4, r3
     e90:	f000 f878 	bl	f84 <_sbrk_r>
     e94:	4580      	cmp	r8, r0
     e96:	d13a      	bne.n	f0e <_malloc_r+0xd2>
     e98:	6821      	ldr	r1, [r4, #0]
     e9a:	3503      	adds	r5, #3
     e9c:	1a6d      	subs	r5, r5, r1
     e9e:	f025 0503 	bic.w	r5, r5, #3
     ea2:	3508      	adds	r5, #8
     ea4:	2d0c      	cmp	r5, #12
     ea6:	bf38      	it	cc
     ea8:	250c      	movcc	r5, #12
     eaa:	4638      	mov	r0, r7
     eac:	4629      	mov	r1, r5
     eae:	f7ff ffa5 	bl	dfc <sbrk_aligned>
     eb2:	3001      	adds	r0, #1
     eb4:	d02b      	beq.n	f0e <_malloc_r+0xd2>
     eb6:	6823      	ldr	r3, [r4, #0]
     eb8:	442b      	add	r3, r5
     eba:	6023      	str	r3, [r4, #0]
     ebc:	e00e      	b.n	edc <_malloc_r+0xa0>
     ebe:	6822      	ldr	r2, [r4, #0]
     ec0:	1b52      	subs	r2, r2, r5
     ec2:	d41e      	bmi.n	f02 <_malloc_r+0xc6>
     ec4:	2a0b      	cmp	r2, #11
     ec6:	d916      	bls.n	ef6 <_malloc_r+0xba>
     ec8:	1961      	adds	r1, r4, r5
     eca:	42a3      	cmp	r3, r4
     ecc:	6025      	str	r5, [r4, #0]
     ece:	bf18      	it	ne
     ed0:	6059      	strne	r1, [r3, #4]
     ed2:	6863      	ldr	r3, [r4, #4]
     ed4:	bf08      	it	eq
     ed6:	6031      	streq	r1, [r6, #0]
     ed8:	5162      	str	r2, [r4, r5]
     eda:	604b      	str	r3, [r1, #4]
     edc:	4638      	mov	r0, r7
     ede:	f104 060b 	add.w	r6, r4, #11
     ee2:	f000 f865 	bl	fb0 <__malloc_unlock>
     ee6:	f026 0607 	bic.w	r6, r6, #7
     eea:	1d23      	adds	r3, r4, #4
     eec:	1af2      	subs	r2, r6, r3
     eee:	d0b6      	beq.n	e5e <_malloc_r+0x22>
     ef0:	1b9b      	subs	r3, r3, r6
     ef2:	50a3      	str	r3, [r4, r2]
     ef4:	e7b3      	b.n	e5e <_malloc_r+0x22>
     ef6:	6862      	ldr	r2, [r4, #4]
     ef8:	42a3      	cmp	r3, r4
     efa:	bf0c      	ite	eq
     efc:	6032      	streq	r2, [r6, #0]
     efe:	605a      	strne	r2, [r3, #4]
     f00:	e7ec      	b.n	edc <_malloc_r+0xa0>
     f02:	4623      	mov	r3, r4
     f04:	6864      	ldr	r4, [r4, #4]
     f06:	e7b2      	b.n	e6e <_malloc_r+0x32>
     f08:	4634      	mov	r4, r6
     f0a:	6876      	ldr	r6, [r6, #4]
     f0c:	e7b9      	b.n	e82 <_malloc_r+0x46>
     f0e:	230c      	movs	r3, #12
     f10:	4638      	mov	r0, r7
     f12:	603b      	str	r3, [r7, #0]
     f14:	f000 f84c 	bl	fb0 <__malloc_unlock>
     f18:	e7a1      	b.n	e5e <_malloc_r+0x22>
     f1a:	6025      	str	r5, [r4, #0]
     f1c:	e7de      	b.n	edc <_malloc_r+0xa0>
     f1e:	bf00      	nop
     f20:	000200a4 	andeq	r0, r2, r4, lsr #1

00000f24 <_realloc_r>:
     f24:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     f28:	4680      	mov	r8, r0
     f2a:	4614      	mov	r4, r2
     f2c:	460e      	mov	r6, r1
     f2e:	b921      	cbnz	r1, f3a <_realloc_r+0x16>
     f30:	4611      	mov	r1, r2
     f32:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     f36:	f7ff bf81 	b.w	e3c <_malloc_r>
     f3a:	b92a      	cbnz	r2, f48 <_realloc_r+0x24>
     f3c:	f7ff ff16 	bl	d6c <_free_r>
     f40:	4625      	mov	r5, r4
     f42:	4628      	mov	r0, r5
     f44:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f48:	f000 f838 	bl	fbc <_malloc_usable_size_r>
     f4c:	4284      	cmp	r4, r0
     f4e:	4607      	mov	r7, r0
     f50:	d802      	bhi.n	f58 <_realloc_r+0x34>
     f52:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f56:	d812      	bhi.n	f7e <_realloc_r+0x5a>
     f58:	4621      	mov	r1, r4
     f5a:	4640      	mov	r0, r8
     f5c:	f7ff ff6e 	bl	e3c <_malloc_r>
     f60:	4605      	mov	r5, r0
     f62:	2800      	cmp	r0, #0
     f64:	d0ed      	beq.n	f42 <_realloc_r+0x1e>
     f66:	42bc      	cmp	r4, r7
     f68:	4622      	mov	r2, r4
     f6a:	4631      	mov	r1, r6
     f6c:	bf28      	it	cs
     f6e:	463a      	movcs	r2, r7
     f70:	f7ff fed4 	bl	d1c <memcpy>
     f74:	4631      	mov	r1, r6
     f76:	4640      	mov	r0, r8
     f78:	f7ff fef8 	bl	d6c <_free_r>
     f7c:	e7e1      	b.n	f42 <_realloc_r+0x1e>
     f7e:	4635      	mov	r5, r6
     f80:	e7df      	b.n	f42 <_realloc_r+0x1e>
	...

00000f84 <_sbrk_r>:
     f84:	b538      	push	{r3, r4, r5, lr}
     f86:	2300      	movs	r3, #0
     f88:	4d05      	ldr	r5, [pc, #20]	; (fa0 <_sbrk_r+0x1c>)
     f8a:	4604      	mov	r4, r0
     f8c:	4608      	mov	r0, r1
     f8e:	602b      	str	r3, [r5, #0]
     f90:	f000 f81e 	bl	fd0 <_sbrk>
     f94:	1c43      	adds	r3, r0, #1
     f96:	d102      	bne.n	f9e <_sbrk_r+0x1a>
     f98:	682b      	ldr	r3, [r5, #0]
     f9a:	b103      	cbz	r3, f9e <_sbrk_r+0x1a>
     f9c:	6023      	str	r3, [r4, #0]
     f9e:	bd38      	pop	{r3, r4, r5, pc}
     fa0:	000200ac 	andeq	r0, r2, ip, lsr #1

00000fa4 <__malloc_lock>:
     fa4:	4801      	ldr	r0, [pc, #4]	; (fac <__malloc_lock+0x8>)
     fa6:	f000 b811 	b.w	fcc <__retarget_lock_acquire_recursive>
     faa:	bf00      	nop
     fac:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fb0 <__malloc_unlock>:
     fb0:	4801      	ldr	r0, [pc, #4]	; (fb8 <__malloc_unlock+0x8>)
     fb2:	f000 b80c 	b.w	fce <__retarget_lock_release_recursive>
     fb6:	bf00      	nop
     fb8:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fbc <_malloc_usable_size_r>:
     fbc:	f851 3c04 	ldr.w	r3, [r1, #-4]
     fc0:	1f18      	subs	r0, r3, #4
     fc2:	2b00      	cmp	r3, #0
     fc4:	bfbc      	itt	lt
     fc6:	580b      	ldrlt	r3, [r1, r0]
     fc8:	18c0      	addlt	r0, r0, r3
     fca:	4770      	bx	lr

00000fcc <__retarget_lock_acquire_recursive>:
     fcc:	4770      	bx	lr

00000fce <__retarget_lock_release_recursive>:
     fce:	4770      	bx	lr

00000fd0 <_sbrk>:
     fd0:	4a04      	ldr	r2, [pc, #16]	; (fe4 <_sbrk+0x14>)
     fd2:	4905      	ldr	r1, [pc, #20]	; (fe8 <_sbrk+0x18>)
     fd4:	6813      	ldr	r3, [r2, #0]
     fd6:	2b00      	cmp	r3, #0
     fd8:	bf08      	it	eq
     fda:	460b      	moveq	r3, r1
     fdc:	4418      	add	r0, r3
     fde:	6010      	str	r0, [r2, #0]
     fe0:	4618      	mov	r0, r3
     fe2:	4770      	bx	lr
     fe4:	000200b4 	strheq	r0, [r2], -r4
     fe8:	000200b8 	strheq	r0, [r2], -r8

00000fec <_exit>:
     fec:	e7fe      	b.n	fec <_exit>
     fee:	bf00      	nop

00000ff0 <_init>:
     ff0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     ff2:	bf00      	nop
     ff4:	bcf8      	pop	{r3, r4, r5, r6, r7}
     ff6:	bc08      	pop	{r3}
     ff8:	469e      	mov	lr, r3
     ffa:	4770      	bx	lr

00000ffc <_fini>:
     ffc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     ffe:	bf00      	nop
    1000:	bcf8      	pop	{r3, r4, r5, r6, r7}
    1002:	bc08      	pop	{r3}
    1004:	469e      	mov	lr, r3
    1006:	4770      	bx	lr
    1008:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
    100c:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
    1010:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
    1014:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
    1018:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
    101c:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
    1020:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
    1024:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
    1028:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
    102c:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
    1030:	0000000a 	andeq	r0, r0, sl

00001034 <_global_impure_ptr>:
    1034:	00020004 	andeq	r0, r2, r4
    1038:	2b302d23 	blcs	c0c4cc <__StackTop+0xbea4cc>
    103c:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    1040:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    1044:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    1048:	32313000 	eorscc	r3, r1, #0
    104c:	36353433 			; <UNDEFINED> instruction: 0x36353433
    1050:	41393837 	teqmi	r9, r7, lsr r8
    1054:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    1058:	31300046 	teqcc	r0, r6, asr #32
    105c:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    1060:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1064:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    1068:	00006665 	andeq	r6, r0, r5, ror #12

0000106c <__EH_FRAME_BEGIN__>:
    106c:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <_impure_ptr>:
   20000:	00020004 	andeq	r0, r2, r4

00020004 <impure_data>:
	...

00020064 <__frame_dummy_init_array_entry>:
   20064:	000000b1 	strheq	r0, [r0], -r1

00020068 <__do_global_dtors_aux_fini_array_entry>:
   20068:	0000008d 	andeq	r0, r0, sp, lsl #1

Disassembly of section .bss:

0002006c <__bss_start__>:
   2006c:	00000000 	andeq	r0, r0, r0

00020070 <object.0>:
	...

00020088 <huart0>:
	...

000200a4 <__malloc_free_list>:
   200a4:	00000000 	andeq	r0, r0, r0

000200a8 <__malloc_sbrk_start>:
   200a8:	00000000 	andeq	r0, r0, r0

000200ac <errno>:
   200ac:	00000000 	andeq	r0, r0, r0

000200b0 <__lock___malloc_recursive_mutex>:
   200b0:	00000000 	andeq	r0, r0, r0

000200b4 <heap_end.0>:
   200b4:	00000000 	andeq	r0, r0, r0

Disassembly of section .stack_dummy:

000200b8 <__HeapBase>:
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
  18:	000006a4 	andeq	r0, r0, r4, lsr #13
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000006dc 	ldrdeq	r0, [r0], -ip
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	00000708 	andeq	r0, r0, r8, lsl #14
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	0000071c 	andeq	r0, r0, ip, lsl r7
  80:	000000b6 	strheq	r0, [r0], -r6
  84:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
  88:	86078508 	strhi	r8, [r7], -r8, lsl #10
  8c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  90:	8a038904 	bhi	e24a8 <__StackTop+0xc04a8>
  94:	00018e02 	andeq	r8, r1, r2, lsl #28
  98:	00000028 	andeq	r0, r0, r8, lsr #32
  9c:	00000064 	andeq	r0, r0, r4, rrx
  a0:	00000000 	andeq	r0, r0, r0
  a4:	000000f6 	strdeq	r0, [r0], -r6
  a8:	84300e43 	ldrthi	r0, [r0], #-3651	; 0xfffff1bd
  ac:	86088509 	strhi	r8, [r8], -r9, lsl #10
  b0:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
  b4:	8a048905 	bhi	1224d0 <__StackTop+0x1004d0>
  b8:	8e028b03 	vmlahi.f64	d8, d2, d3
  bc:	0a6a0201 	beq	1a808c8 <__StackTop+0x1a5e8c8>
  c0:	0b42240e 	bleq	1089100 <__StackTop+0x1067100>
  c4:	0000002c 	andeq	r0, r0, ip, lsr #32
  c8:	00000064 	andeq	r0, r0, r4, rrx
  cc:	000007d4 	ldrdeq	r0, [r0], -r4
  d0:	00000200 	andeq	r0, r0, r0, lsl #4
  d4:	84240e42 	strthi	r0, [r4], #-3650	; 0xfffff1be
  d8:	86088509 	strhi	r8, [r8], -r9, lsl #10
  dc:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
  e0:	8a048905 	bhi	1224fc <__StackTop+0x1004fc>
  e4:	8e028b03 	vmlahi.f64	d8, d2, d3
  e8:	980e4701 	stmdals	lr, {r0, r8, r9, sl, lr}
  ec:	0ae10201 	beq	ff8408f8 <__StackTop+0xff81e8f8>
  f0:	0b42240e 	bleq	1089130 <__StackTop+0x1067130>
  f4:	0000000c 	andeq	r0, r0, ip
  f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 100:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 104:	00000020 	andeq	r0, r0, r0, lsr #32
 108:	000000f4 	strdeq	r0, [r0], -r4
 10c:	000009d4 	ldrdeq	r0, [r0], -r4
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xc0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000ab4 			; <UNDEFINED> instruction: 0x00000ab4
 134:	0000024c 	andeq	r0, r0, ip, asr #4
 138:	84300e42 	ldrthi	r0, [r0], #-3650	; 0xfffff1be
 13c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 140:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 144:	8a038904 	bhi	e255c <__StackTop+0xc055c>
 148:	02018e02 	andeq	r8, r1, #2, 28
 14c:	200e0ab4 			; <UNDEFINED> instruction: 0x200e0ab4
 150:	00000b42 	andeq	r0, r0, r2, asr #22
 154:	0000000c 	andeq	r0, r0, ip
 158:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 15c:	7c020001 	stcvc	0, cr0, [r2], {1}
 160:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 164:	00000014 	andeq	r0, r0, r4, lsl r0
 168:	00000154 	andeq	r0, r0, r4, asr r1
 16c:	00000d00 	andeq	r0, r0, r0, lsl #26
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000d1c 	andeq	r0, r0, ip, lsl sp
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000d38 	andeq	r0, r0, r8, lsr sp
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d6c 	andeq	r0, r0, ip, ror #26
 1e8:	00000090 	muleq	r0, r0, r0
 1ec:	83100e41 	tsthi	r0, #1040	; 0x410
 1f0:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 1f4:	53018e02 	movwpl	r8, #7682	; 0x1e02
 1f8:	c4c5ce0a 	strbgt	ip, [r5], #3594	; 0xe0a
 1fc:	42000ec3 	andmi	r0, r0, #3120	; 0xc30
 200:	0000000b 	andeq	r0, r0, fp
 204:	0000000c 	andeq	r0, r0, ip
 208:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 20c:	7c020001 	stcvc	0, cr0, [r2], {1}
 210:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 214:	00000018 	andeq	r0, r0, r8, lsl r0
 218:	00000204 	andeq	r0, r0, r4, lsl #4
 21c:	00000dfc 	strdeq	r0, [r0], -ip
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000e3c 	andeq	r0, r0, ip, lsr lr
 23c:	000000e8 	andeq	r0, r0, r8, ror #1
 240:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xfffff1be
 244:	86058506 	strhi	r8, [r5], -r6, lsl #10
 248:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 24c:	00018e02 	andeq	r8, r1, r2, lsl #28
 250:	0000000c 	andeq	r0, r0, ip
 254:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 258:	7c020001 	stcvc	0, cr0, [r2], {1}
 25c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 260:	00000028 	andeq	r0, r0, r8, lsr #32
 264:	00000250 	andeq	r0, r0, r0, asr r2
 268:	00000f24 	andeq	r0, r0, r4, lsr #30
 26c:	0000005e 	andeq	r0, r0, lr, asr r0
 270:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xfffff1be
 274:	86058506 	strhi	r8, [r5], -r6, lsl #10
 278:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 27c:	47018e02 	strmi	r8, [r1, -r2, lsl #28]
 280:	c7c8ce0a 	strbgt	ip, [r8, sl, lsl #28]
 284:	0ec4c5c6 	cdpeq	5, 12, cr12, cr4, cr6, {6}
 288:	000b4200 	andeq	r4, fp, r0, lsl #4
 28c:	0000000c 	andeq	r0, r0, ip
 290:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 294:	7c020001 	stcvc	0, cr0, [r2], {1}
 298:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 29c:	00000018 	andeq	r0, r0, r8, lsl r0
 2a0:	0000028c 	andeq	r0, r0, ip, lsl #5
 2a4:	00000f84 	andeq	r0, r0, r4, lsl #31
 2a8:	00000020 	andeq	r0, r0, r0, lsr #32
 2ac:	83100e41 	tsthi	r0, #1040	; 0x410
 2b0:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 2b4:	00018e02 	andeq	r8, r1, r2, lsl #28
 2b8:	0000000c 	andeq	r0, r0, ip
 2bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2c8:	0000000c 	andeq	r0, r0, ip
 2cc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2d0:	00000fa4 	andeq	r0, r0, r4, lsr #31
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000fb0 			; <UNDEFINED> instruction: 0x00000fb0
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000fbc 			; <UNDEFINED> instruction: 0x00000fbc
 304:	00000010 	andeq	r0, r0, r0, lsl r0
 308:	0000000c 	andeq	r0, r0, ip
 30c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 310:	7c020001 	stcvc	0, cr0, [r2], {1}
 314:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 318:	00000020 	andeq	r0, r0, r0, lsr #32
 31c:	00000308 	andeq	r0, r0, r8, lsl #6
 320:	00000000 	andeq	r0, r0, r0
 324:	0000001a 	andeq	r0, r0, sl, lsl r0
 328:	83100e41 	tsthi	r0, #1040	; 0x410
 32c:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 330:	4a018e02 	bmi	63b40 <__StackTop+0x41b40>
 334:	c3c4c5ce 	bicgt	ip, r4, #864026624	; 0x33800000
 338:	0000000e 	andeq	r0, r0, lr
 33c:	00000024 	andeq	r0, r0, r4, lsr #32
 340:	00000308 	andeq	r0, r0, r8, lsl #6
 344:	00000000 	andeq	r0, r0, r0
 348:	000000b8 	strheq	r0, [r0], -r8
 34c:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xfffff1be
 350:	86038504 	strhi	r8, [r3], -r4, lsl #10
 354:	02018e02 	andeq	r8, r1, #2, 28
 358:	c6ce0a41 	strbgt	r0, [lr], r1, asr #20
 35c:	000ec4c5 	andeq	ip, lr, r5, asr #9
 360:	00000b42 	andeq	r0, r0, r2, asr #22
 364:	0000000c 	andeq	r0, r0, ip
 368:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 36c:	7c020001 	stcvc	0, cr0, [r2], {1}
 370:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 374:	0000000c 	andeq	r0, r0, ip
 378:	00000364 	andeq	r0, r0, r4, ror #6
 37c:	00000000 	andeq	r0, r0, r0
 380:	00000002 	andeq	r0, r0, r2
 384:	0000000c 	andeq	r0, r0, ip
 388:	00000364 	andeq	r0, r0, r4, ror #6
 38c:	00000000 	andeq	r0, r0, r0
 390:	00000002 	andeq	r0, r0, r2
 394:	0000000c 	andeq	r0, r0, ip
 398:	00000364 	andeq	r0, r0, r4, ror #6
 39c:	00000000 	andeq	r0, r0, r0
 3a0:	00000002 	andeq	r0, r0, r2
 3a4:	0000000c 	andeq	r0, r0, ip
 3a8:	00000364 	andeq	r0, r0, r4, ror #6
 3ac:	00000000 	andeq	r0, r0, r0
 3b0:	00000002 	andeq	r0, r0, r2
 3b4:	0000000c 	andeq	r0, r0, ip
 3b8:	00000364 	andeq	r0, r0, r4, ror #6
 3bc:	00000000 	andeq	r0, r0, r0
 3c0:	00000002 	andeq	r0, r0, r2
 3c4:	0000000c 	andeq	r0, r0, ip
 3c8:	00000364 	andeq	r0, r0, r4, ror #6
 3cc:	00000fcc 	andeq	r0, r0, ip, asr #31
 3d0:	00000002 	andeq	r0, r0, r2
 3d4:	0000000c 	andeq	r0, r0, ip
 3d8:	00000364 	andeq	r0, r0, r4, ror #6
 3dc:	00000000 	andeq	r0, r0, r0
 3e0:	00000004 	andeq	r0, r0, r4
 3e4:	0000000c 	andeq	r0, r0, ip
 3e8:	00000364 	andeq	r0, r0, r4, ror #6
 3ec:	00000000 	andeq	r0, r0, r0
 3f0:	00000004 	andeq	r0, r0, r4
 3f4:	0000000c 	andeq	r0, r0, ip
 3f8:	00000364 	andeq	r0, r0, r4, ror #6
 3fc:	00000000 	andeq	r0, r0, r0
 400:	00000002 	andeq	r0, r0, r2
 404:	0000000c 	andeq	r0, r0, ip
 408:	00000364 	andeq	r0, r0, r4, ror #6
 40c:	00000fce 	andeq	r0, r0, lr, asr #31
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000fec 	andeq	r0, r0, ip, ror #31
 450:	00000002 	andeq	r0, r0, r2


bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00000631 	andeq	r0, r0, r1, lsr r6
       8:	000005b9 			; <UNDEFINED> instruction: 0x000005b9
       c:	000005bb 			; <UNDEFINED> instruction: 0x000005bb
      10:	000005bd 			; <UNDEFINED> instruction: 0x000005bd
      14:	000005bf 			; <UNDEFINED> instruction: 0x000005bf
      18:	000005c1 	andeq	r0, r0, r1, asr #11
	...
      2c:	000005c3 	andeq	r0, r0, r3, asr #11
      30:	000005c5 	andeq	r0, r0, r5, asr #11
      34:	00000000 	andeq	r0, r0, r0
      38:	000005c7 	andeq	r0, r0, r7, asr #11
      3c:	000005c9 	andeq	r0, r0, r9, asr #11
      40:	000005cd 	andeq	r0, r0, sp, asr #11
      44:	00000685 	andeq	r0, r0, r5, lsl #13
      48:	00000687 	andeq	r0, r0, r7, lsl #13
      4c:	00000689 	andeq	r0, r0, r9, lsl #13
      50:	0000068b 	andeq	r0, r0, fp, lsl #13
      54:	0000068d 	andeq	r0, r0, sp, lsl #13
      58:	0000068f 	andeq	r0, r0, pc, lsl #13
      5c:	00000691 	muleq	r0, r1, r6
      60:	00000693 	muleq	r0, r3, r6
      64:	00000695 	muleq	r0, r5, r6
      68:	00000697 	muleq	r0, r7, r6
      6c:	00000699 	muleq	r0, r9, r6
      70:	0000069b 	muleq	r0, fp, r6
      74:	0000069d 	muleq	r0, sp, r6
      78:	0000069f 	muleq	r0, pc, r6	; <UNPREDICTABLE>
      7c:	000006a1 	andeq	r0, r0, r1, lsr #13
      80:	000006a3 	andeq	r0, r0, r3, lsr #13
      84:	000006a5 	andeq	r0, r0, r5, lsr #13
      88:	000006a7 	andeq	r0, r0, r7, lsr #13
      8c:	000006a9 	andeq	r0, r0, r9, lsr #13

00000090 <__do_global_dtors_aux>:
      90:	b510      	push	{r4, lr}
      92:	4c05      	ldr	r4, [pc, #20]	; (a8 <__do_global_dtors_aux+0x18>)
      94:	7823      	ldrb	r3, [r4, #0]
      96:	b933      	cbnz	r3, a6 <__do_global_dtors_aux+0x16>
      98:	4b04      	ldr	r3, [pc, #16]	; (ac <__do_global_dtors_aux+0x1c>)
      9a:	b113      	cbz	r3, a2 <__do_global_dtors_aux+0x12>
      9c:	4804      	ldr	r0, [pc, #16]	; (b0 <__do_global_dtors_aux+0x20>)
      9e:	f3af 8000 	nop.w
      a2:	2301      	movs	r3, #1
      a4:	7023      	strb	r3, [r4, #0]
      a6:	bd10      	pop	{r4, pc}
      a8:	0002006c 	andeq	r0, r2, ip, rrx
      ac:	00000000 	andeq	r0, r0, r0
      b0:	00001074 	andeq	r1, r0, r4, ror r0

000000b4 <frame_dummy>:
      b4:	b508      	push	{r3, lr}
      b6:	4b03      	ldr	r3, [pc, #12]	; (c4 <frame_dummy+0x10>)
      b8:	b11b      	cbz	r3, c2 <frame_dummy+0xe>
      ba:	4903      	ldr	r1, [pc, #12]	; (c8 <frame_dummy+0x14>)
      bc:	4803      	ldr	r0, [pc, #12]	; (cc <frame_dummy+0x18>)
      be:	f3af 8000 	nop.w
      c2:	bd08      	pop	{r3, pc}
      c4:	00000000 	andeq	r0, r0, r0
      c8:	00020070 	andeq	r0, r2, r0, ror r0
      cc:	00001074 	andeq	r1, r0, r4, ror r0

000000d0 <drv_check_rw_data>:
      d0:	6001      	str	r1, [r0, #0]
      d2:	6803      	ldr	r3, [r0, #0]
      d4:	4293      	cmp	r3, r2
      d6:	d007      	beq.n	e8 <drv_check_rw_data+0x18>
      d8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      dc:	2001      	movs	r0, #1
      de:	6018      	str	r0, [r3, #0]
      e0:	685a      	ldr	r2, [r3, #4]
      e2:	4402      	add	r2, r0
      e4:	601a      	str	r2, [r3, #0]
      e6:	4770      	bx	lr
      e8:	2000      	movs	r0, #0
      ea:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      ee:	6018      	str	r0, [r3, #0]
      f0:	4770      	bx	lr

000000f2 <drv_uart_default_config>:
      f2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      f6:	6043      	str	r3, [r0, #4]
      f8:	230f      	movs	r3, #15
      fa:	7203      	strb	r3, [r0, #8]
      fc:	2300      	movs	r3, #0
      fe:	7243      	strb	r3, [r0, #9]
     100:	7283      	strb	r3, [r0, #10]
     102:	72c3      	strb	r3, [r0, #11]
     104:	7303      	strb	r3, [r0, #12]
     106:	7343      	strb	r3, [r0, #13]
     108:	2301      	movs	r3, #1
     10a:	7383      	strb	r3, [r0, #14]
     10c:	4770      	bx	lr
	...

00000110 <drv_uart_set_config>:
     110:	b508      	push	{r3, lr}
     112:	6841      	ldr	r1, [r0, #4]
     114:	7a03      	ldrb	r3, [r0, #8]
     116:	fb03 f201 	mul.w	r2, r3, r1
     11a:	490e      	ldr	r1, [pc, #56]	; (154 <drv_uart_set_config+0x44>)
     11c:	fbb1 f2f2 	udiv	r2, r1, r2
     120:	0419      	lsls	r1, r3, #16
     122:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     126:	7a43      	ldrb	r3, [r0, #9]
     128:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     12c:	7a83      	ldrb	r3, [r0, #10]
     12e:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     132:	7ac3      	ldrb	r3, [r0, #11]
     134:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     138:	7b03      	ldrb	r3, [r0, #12]
     13a:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     13e:	7b42      	ldrb	r2, [r0, #13]
     140:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     144:	7b82      	ldrb	r2, [r0, #14]
     146:	4311      	orrs	r1, r2
     148:	6800      	ldr	r0, [r0, #0]
     14a:	460a      	mov	r2, r1
     14c:	3008      	adds	r0, #8
     14e:	f7ff ffbf 	bl	d0 <drv_check_rw_data>
     152:	bd08      	pop	{r3, pc}
     154:	02625a00 	rsbeq	r5, r2, #0, 20

00000158 <drv_uart_init>:
     158:	b538      	push	{r3, r4, r5, lr}
     15a:	4604      	mov	r4, r0
     15c:	2500      	movs	r5, #0
     15e:	7485      	strb	r5, [r0, #18]
     160:	74c5      	strb	r5, [r0, #19]
     162:	f7ff ffd5 	bl	110 <drv_uart_set_config>
     166:	7425      	strb	r5, [r4, #16]
     168:	74a5      	strb	r5, [r4, #18]
     16a:	74e5      	strb	r5, [r4, #19]
     16c:	6822      	ldr	r2, [r4, #0]
     16e:	6853      	ldr	r3, [r2, #4]
     170:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     174:	6053      	str	r3, [r2, #4]
     176:	6822      	ldr	r2, [r4, #0]
     178:	6853      	ldr	r3, [r2, #4]
     17a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     17e:	6053      	str	r3, [r2, #4]
     180:	6822      	ldr	r2, [r4, #0]
     182:	6853      	ldr	r3, [r2, #4]
     184:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     188:	6053      	str	r3, [r2, #4]
     18a:	6822      	ldr	r2, [r4, #0]
     18c:	6853      	ldr	r3, [r2, #4]
     18e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     192:	6053      	str	r3, [r2, #4]
     194:	6822      	ldr	r2, [r4, #0]
     196:	6853      	ldr	r3, [r2, #4]
     198:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     19c:	6053      	str	r3, [r2, #4]
     19e:	6822      	ldr	r2, [r4, #0]
     1a0:	6853      	ldr	r3, [r2, #4]
     1a2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     1a6:	6053      	str	r3, [r2, #4]
     1a8:	6822      	ldr	r2, [r4, #0]
     1aa:	6853      	ldr	r3, [r2, #4]
     1ac:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     1b0:	6053      	str	r3, [r2, #4]
     1b2:	6822      	ldr	r2, [r4, #0]
     1b4:	6853      	ldr	r3, [r2, #4]
     1b6:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     1ba:	6053      	str	r3, [r2, #4]
     1bc:	6823      	ldr	r3, [r4, #0]
     1be:	f240 12ff 	movw	r2, #511	; 0x1ff
     1c2:	611a      	str	r2, [r3, #16]
     1c4:	6823      	ldr	r3, [r4, #0]
     1c6:	611d      	str	r5, [r3, #16]
     1c8:	6822      	ldr	r2, [r4, #0]
     1ca:	6853      	ldr	r3, [r2, #4]
     1cc:	f043 0301 	orr.w	r3, r3, #1
     1d0:	6053      	str	r3, [r2, #4]
     1d2:	6822      	ldr	r2, [r4, #0]
     1d4:	6853      	ldr	r3, [r2, #4]
     1d6:	f023 0301 	bic.w	r3, r3, #1
     1da:	6053      	str	r3, [r2, #4]
     1dc:	6822      	ldr	r2, [r4, #0]
     1de:	6853      	ldr	r3, [r2, #4]
     1e0:	f043 0302 	orr.w	r3, r3, #2
     1e4:	6053      	str	r3, [r2, #4]
     1e6:	bd38      	pop	{r3, r4, r5, pc}

000001e8 <drv_uart_putchars>:
     1e8:	b410      	push	{r4}
     1ea:	2300      	movs	r3, #0
     1ec:	7483      	strb	r3, [r0, #18]
     1ee:	f890 c012 	ldrb.w	ip, [r0, #18]
     1f2:	4594      	cmp	ip, r2
     1f4:	d20c      	bcs.n	210 <Stack_Size+0x10>
     1f6:	6804      	ldr	r4, [r0, #0]
     1f8:	6963      	ldr	r3, [r4, #20]
     1fa:	0a1b      	lsrs	r3, r3, #8
     1fc:	f013 0f18 	tst.w	r3, #24
     200:	d1f5      	bne.n	1ee <drv_uart_putchars+0x6>
     202:	f10c 0301 	add.w	r3, ip, #1
     206:	7483      	strb	r3, [r0, #18]
     208:	f811 300c 	ldrb.w	r3, [r1, ip]
     20c:	6023      	str	r3, [r4, #0]
     20e:	e7ee      	b.n	1ee <drv_uart_putchars+0x6>
     210:	6803      	ldr	r3, [r0, #0]
     212:	699a      	ldr	r2, [r3, #24]
     214:	f412 7f80 	tst.w	r2, #256	; 0x100
     218:	d0fa      	beq.n	210 <Stack_Size+0x10>
     21a:	691a      	ldr	r2, [r3, #16]
     21c:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     220:	611a      	str	r2, [r3, #16]
     222:	6803      	ldr	r3, [r0, #0]
     224:	2200      	movs	r2, #0
     226:	611a      	str	r2, [r3, #16]
     228:	bc10      	pop	{r4}
     22a:	4770      	bx	lr

0000022c <drv_uart_putchar>:
     22c:	6802      	ldr	r2, [r0, #0]
     22e:	6953      	ldr	r3, [r2, #20]
     230:	0a1b      	lsrs	r3, r3, #8
     232:	f013 0f18 	tst.w	r3, #24
     236:	d101      	bne.n	23c <drv_uart_putchar+0x10>
     238:	780b      	ldrb	r3, [r1, #0]
     23a:	6013      	str	r3, [r2, #0]
     23c:	6803      	ldr	r3, [r0, #0]
     23e:	699a      	ldr	r2, [r3, #24]
     240:	f412 7f80 	tst.w	r2, #256	; 0x100
     244:	d0fa      	beq.n	23c <drv_uart_putchar+0x10>
     246:	691a      	ldr	r2, [r3, #16]
     248:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     24c:	611a      	str	r2, [r3, #16]
     24e:	6803      	ldr	r3, [r0, #0]
     250:	2200      	movs	r2, #0
     252:	611a      	str	r2, [r3, #16]
     254:	4770      	bx	lr

00000256 <drv_uart_getchar>:
     256:	b410      	push	{r4}
     258:	e009      	b.n	26e <drv_uart_getchar+0x18>
     25a:	69db      	ldr	r3, [r3, #28]
     25c:	700b      	strb	r3, [r1, #0]
     25e:	2000      	movs	r0, #0
     260:	bc10      	pop	{r4}
     262:	4770      	bx	lr
     264:	6803      	ldr	r3, [r0, #0]
     266:	695a      	ldr	r2, [r3, #20]
     268:	f012 0f1f 	tst.w	r2, #31
     26c:	d1f5      	bne.n	25a <drv_uart_getchar+0x4>
     26e:	6803      	ldr	r3, [r0, #0]
     270:	699c      	ldr	r4, [r3, #24]
     272:	691a      	ldr	r2, [r3, #16]
     274:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     278:	611a      	str	r2, [r3, #16]
     27a:	6803      	ldr	r3, [r0, #0]
     27c:	2200      	movs	r2, #0
     27e:	611a      	str	r2, [r3, #16]
     280:	b2a3      	uxth	r3, r4
     282:	f014 0f40 	tst.w	r4, #64	; 0x40
     286:	d001      	beq.n	28c <drv_uart_getchar+0x36>
     288:	2201      	movs	r2, #1
     28a:	7402      	strb	r2, [r0, #16]
     28c:	f013 0f80 	tst.w	r3, #128	; 0x80
     290:	d001      	beq.n	296 <drv_uart_getchar+0x40>
     292:	2302      	movs	r3, #2
     294:	7403      	strb	r3, [r0, #16]
     296:	7c03      	ldrb	r3, [r0, #16]
     298:	2b00      	cmp	r3, #0
     29a:	d0e3      	beq.n	264 <drv_uart_getchar+0xe>
     29c:	7a83      	ldrb	r3, [r0, #10]
     29e:	2b01      	cmp	r3, #1
     2a0:	d0e0      	beq.n	264 <drv_uart_getchar+0xe>
     2a2:	2300      	movs	r3, #0
     2a4:	7403      	strb	r3, [r0, #16]
     2a6:	7483      	strb	r3, [r0, #18]
     2a8:	74c3      	strb	r3, [r0, #19]
     2aa:	6804      	ldr	r4, [r0, #0]
     2ac:	6862      	ldr	r2, [r4, #4]
     2ae:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     2b2:	6062      	str	r2, [r4, #4]
     2b4:	6804      	ldr	r4, [r0, #0]
     2b6:	6862      	ldr	r2, [r4, #4]
     2b8:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2bc:	6062      	str	r2, [r4, #4]
     2be:	6804      	ldr	r4, [r0, #0]
     2c0:	6862      	ldr	r2, [r4, #4]
     2c2:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2c6:	6062      	str	r2, [r4, #4]
     2c8:	6804      	ldr	r4, [r0, #0]
     2ca:	6862      	ldr	r2, [r4, #4]
     2cc:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2d0:	6062      	str	r2, [r4, #4]
     2d2:	6804      	ldr	r4, [r0, #0]
     2d4:	6862      	ldr	r2, [r4, #4]
     2d6:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2da:	6062      	str	r2, [r4, #4]
     2dc:	6804      	ldr	r4, [r0, #0]
     2de:	6862      	ldr	r2, [r4, #4]
     2e0:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2e4:	6062      	str	r2, [r4, #4]
     2e6:	6804      	ldr	r4, [r0, #0]
     2e8:	6862      	ldr	r2, [r4, #4]
     2ea:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2ee:	6062      	str	r2, [r4, #4]
     2f0:	6800      	ldr	r0, [r0, #0]
     2f2:	6842      	ldr	r2, [r0, #4]
     2f4:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2f8:	6042      	str	r2, [r0, #4]
     2fa:	700b      	strb	r3, [r1, #0]
     2fc:	2001      	movs	r0, #1
     2fe:	e7af      	b.n	260 <drv_uart_getchar+0xa>

00000300 <uart_int_tx_done_callback>:
     300:	4770      	bx	lr

00000302 <uart_int_rx_stop_callback>:
     302:	4770      	bx	lr

00000304 <uart_int_rx_parity_error_callback>:
     304:	4770      	bx	lr

00000306 <uart_int_rx_noise_detect_callback>:
     306:	4770      	bx	lr

00000308 <uart_int_rx_stop_detect_callback>:
     308:	4770      	bx	lr

0000030a <uart_int_tx_fifo_empty_callback>:
     30a:	4770      	bx	lr

0000030c <uart_int_tx_fifo_thres_callback>:
     30c:	4770      	bx	lr

0000030e <uart_int_rx_fifo_noempty_callback>:
     30e:	4770      	bx	lr

00000310 <uart_int_rx_fifo_thres_callback>:
     310:	4770      	bx	lr

00000312 <drv_uart_interrupt_handler>:
     312:	b538      	push	{r3, r4, r5, lr}
     314:	4604      	mov	r4, r0
     316:	6803      	ldr	r3, [r0, #0]
     318:	699d      	ldr	r5, [r3, #24]
     31a:	68db      	ldr	r3, [r3, #12]
     31c:	b29b      	uxth	r3, r3
     31e:	401d      	ands	r5, r3
     320:	f415 7f80 	tst.w	r5, #256	; 0x100
     324:	d144      	bne.n	3b0 <drv_uart_interrupt_handler+0x9e>
     326:	f015 0f40 	tst.w	r5, #64	; 0x40
     32a:	d00f      	beq.n	34c <drv_uart_interrupt_handler+0x3a>
     32c:	2301      	movs	r3, #1
     32e:	7423      	strb	r3, [r4, #16]
     330:	7aa3      	ldrb	r3, [r4, #10]
     332:	2b01      	cmp	r3, #1
     334:	d147      	bne.n	3c6 <drv_uart_interrupt_handler+0xb4>
     336:	4620      	mov	r0, r4
     338:	f7ff ffe3 	bl	302 <uart_int_rx_stop_callback>
     33c:	6822      	ldr	r2, [r4, #0]
     33e:	6913      	ldr	r3, [r2, #16]
     340:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     344:	6113      	str	r3, [r2, #16]
     346:	6823      	ldr	r3, [r4, #0]
     348:	2200      	movs	r2, #0
     34a:	611a      	str	r2, [r3, #16]
     34c:	f015 0f80 	tst.w	r5, #128	; 0x80
     350:	d00f      	beq.n	372 <drv_uart_interrupt_handler+0x60>
     352:	2302      	movs	r3, #2
     354:	7423      	strb	r3, [r4, #16]
     356:	7aa3      	ldrb	r3, [r4, #10]
     358:	2b01      	cmp	r3, #1
     35a:	d166      	bne.n	42a <drv_uart_interrupt_handler+0x118>
     35c:	4620      	mov	r0, r4
     35e:	f7ff ffd1 	bl	304 <uart_int_rx_parity_error_callback>
     362:	6822      	ldr	r2, [r4, #0]
     364:	6913      	ldr	r3, [r2, #16]
     366:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     36a:	6113      	str	r3, [r2, #16]
     36c:	6823      	ldr	r3, [r4, #0]
     36e:	2200      	movs	r2, #0
     370:	611a      	str	r2, [r3, #16]
     372:	f015 0f20 	tst.w	r5, #32
     376:	f040 808a 	bne.w	48e <drv_uart_interrupt_handler+0x17c>
     37a:	f015 0f10 	tst.w	r5, #16
     37e:	f040 8092 	bne.w	4a6 <drv_uart_interrupt_handler+0x194>
     382:	f015 0f01 	tst.w	r5, #1
     386:	f040 809a 	bne.w	4be <drv_uart_interrupt_handler+0x1ac>
     38a:	f015 0f02 	tst.w	r5, #2
     38e:	f040 80a2 	bne.w	4d6 <drv_uart_interrupt_handler+0x1c4>
     392:	f015 0f04 	tst.w	r5, #4
     396:	f000 80c1 	beq.w	51c <drv_uart_interrupt_handler+0x20a>
     39a:	7ce2      	ldrb	r2, [r4, #19]
     39c:	7e23      	ldrb	r3, [r4, #24]
     39e:	429a      	cmp	r2, r3
     3a0:	f0c0 80ac 	bcc.w	4fc <drv_uart_interrupt_handler+0x1ea>
     3a4:	6822      	ldr	r2, [r4, #0]
     3a6:	68d3      	ldr	r3, [r2, #12]
     3a8:	f023 030c 	bic.w	r3, r3, #12
     3ac:	60d3      	str	r3, [r2, #12]
     3ae:	e0aa      	b.n	506 <drv_uart_interrupt_handler+0x1f4>
     3b0:	f7ff ffa6 	bl	300 <uart_int_tx_done_callback>
     3b4:	6822      	ldr	r2, [r4, #0]
     3b6:	6913      	ldr	r3, [r2, #16]
     3b8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3bc:	6113      	str	r3, [r2, #16]
     3be:	6823      	ldr	r3, [r4, #0]
     3c0:	2200      	movs	r2, #0
     3c2:	611a      	str	r2, [r3, #16]
     3c4:	e7af      	b.n	326 <drv_uart_interrupt_handler+0x14>
     3c6:	6822      	ldr	r2, [r4, #0]
     3c8:	68d3      	ldr	r3, [r2, #12]
     3ca:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3ce:	60d3      	str	r3, [r2, #12]
     3d0:	2300      	movs	r3, #0
     3d2:	7423      	strb	r3, [r4, #16]
     3d4:	74a3      	strb	r3, [r4, #18]
     3d6:	74e3      	strb	r3, [r4, #19]
     3d8:	6822      	ldr	r2, [r4, #0]
     3da:	6853      	ldr	r3, [r2, #4]
     3dc:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3e0:	6053      	str	r3, [r2, #4]
     3e2:	6822      	ldr	r2, [r4, #0]
     3e4:	6853      	ldr	r3, [r2, #4]
     3e6:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     3ea:	6053      	str	r3, [r2, #4]
     3ec:	6822      	ldr	r2, [r4, #0]
     3ee:	6853      	ldr	r3, [r2, #4]
     3f0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     3f4:	6053      	str	r3, [r2, #4]
     3f6:	6822      	ldr	r2, [r4, #0]
     3f8:	6853      	ldr	r3, [r2, #4]
     3fa:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     3fe:	6053      	str	r3, [r2, #4]
     400:	6822      	ldr	r2, [r4, #0]
     402:	6853      	ldr	r3, [r2, #4]
     404:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     408:	6053      	str	r3, [r2, #4]
     40a:	6822      	ldr	r2, [r4, #0]
     40c:	6853      	ldr	r3, [r2, #4]
     40e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     412:	6053      	str	r3, [r2, #4]
     414:	6822      	ldr	r2, [r4, #0]
     416:	6853      	ldr	r3, [r2, #4]
     418:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     41c:	6053      	str	r3, [r2, #4]
     41e:	6822      	ldr	r2, [r4, #0]
     420:	6853      	ldr	r3, [r2, #4]
     422:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     426:	6053      	str	r3, [r2, #4]
     428:	e785      	b.n	336 <drv_uart_interrupt_handler+0x24>
     42a:	6822      	ldr	r2, [r4, #0]
     42c:	68d3      	ldr	r3, [r2, #12]
     42e:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     432:	60d3      	str	r3, [r2, #12]
     434:	2300      	movs	r3, #0
     436:	7423      	strb	r3, [r4, #16]
     438:	74a3      	strb	r3, [r4, #18]
     43a:	74e3      	strb	r3, [r4, #19]
     43c:	6822      	ldr	r2, [r4, #0]
     43e:	6853      	ldr	r3, [r2, #4]
     440:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     444:	6053      	str	r3, [r2, #4]
     446:	6822      	ldr	r2, [r4, #0]
     448:	6853      	ldr	r3, [r2, #4]
     44a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     44e:	6053      	str	r3, [r2, #4]
     450:	6822      	ldr	r2, [r4, #0]
     452:	6853      	ldr	r3, [r2, #4]
     454:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     458:	6053      	str	r3, [r2, #4]
     45a:	6822      	ldr	r2, [r4, #0]
     45c:	6853      	ldr	r3, [r2, #4]
     45e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     462:	6053      	str	r3, [r2, #4]
     464:	6822      	ldr	r2, [r4, #0]
     466:	6853      	ldr	r3, [r2, #4]
     468:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     46c:	6053      	str	r3, [r2, #4]
     46e:	6822      	ldr	r2, [r4, #0]
     470:	6853      	ldr	r3, [r2, #4]
     472:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     476:	6053      	str	r3, [r2, #4]
     478:	6822      	ldr	r2, [r4, #0]
     47a:	6853      	ldr	r3, [r2, #4]
     47c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     480:	6053      	str	r3, [r2, #4]
     482:	6822      	ldr	r2, [r4, #0]
     484:	6853      	ldr	r3, [r2, #4]
     486:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     48a:	6053      	str	r3, [r2, #4]
     48c:	e766      	b.n	35c <drv_uart_interrupt_handler+0x4a>
     48e:	4620      	mov	r0, r4
     490:	f7ff ff39 	bl	306 <uart_int_rx_noise_detect_callback>
     494:	6822      	ldr	r2, [r4, #0]
     496:	6913      	ldr	r3, [r2, #16]
     498:	f043 0320 	orr.w	r3, r3, #32
     49c:	6113      	str	r3, [r2, #16]
     49e:	6823      	ldr	r3, [r4, #0]
     4a0:	2200      	movs	r2, #0
     4a2:	611a      	str	r2, [r3, #16]
     4a4:	e769      	b.n	37a <drv_uart_interrupt_handler+0x68>
     4a6:	4620      	mov	r0, r4
     4a8:	f7ff ff2e 	bl	308 <uart_int_rx_stop_detect_callback>
     4ac:	6822      	ldr	r2, [r4, #0]
     4ae:	6913      	ldr	r3, [r2, #16]
     4b0:	f043 0310 	orr.w	r3, r3, #16
     4b4:	6113      	str	r3, [r2, #16]
     4b6:	6823      	ldr	r3, [r4, #0]
     4b8:	2200      	movs	r2, #0
     4ba:	611a      	str	r2, [r3, #16]
     4bc:	e761      	b.n	382 <drv_uart_interrupt_handler+0x70>
     4be:	4620      	mov	r0, r4
     4c0:	f7ff ff24 	bl	30c <uart_int_tx_fifo_thres_callback>
     4c4:	6822      	ldr	r2, [r4, #0]
     4c6:	6913      	ldr	r3, [r2, #16]
     4c8:	f043 0301 	orr.w	r3, r3, #1
     4cc:	6113      	str	r3, [r2, #16]
     4ce:	6823      	ldr	r3, [r4, #0]
     4d0:	2200      	movs	r2, #0
     4d2:	611a      	str	r2, [r3, #16]
     4d4:	e759      	b.n	38a <drv_uart_interrupt_handler+0x78>
     4d6:	4620      	mov	r0, r4
     4d8:	f7ff ff17 	bl	30a <uart_int_tx_fifo_empty_callback>
     4dc:	6822      	ldr	r2, [r4, #0]
     4de:	6913      	ldr	r3, [r2, #16]
     4e0:	f043 0302 	orr.w	r3, r3, #2
     4e4:	6113      	str	r3, [r2, #16]
     4e6:	6823      	ldr	r3, [r4, #0]
     4e8:	2200      	movs	r2, #0
     4ea:	611a      	str	r2, [r3, #16]
     4ec:	e751      	b.n	392 <drv_uart_interrupt_handler+0x80>
     4ee:	69d9      	ldr	r1, [r3, #28]
     4f0:	6962      	ldr	r2, [r4, #20]
     4f2:	7ce3      	ldrb	r3, [r4, #19]
     4f4:	1c58      	adds	r0, r3, #1
     4f6:	74e0      	strb	r0, [r4, #19]
     4f8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4fc:	6823      	ldr	r3, [r4, #0]
     4fe:	695a      	ldr	r2, [r3, #20]
     500:	f012 0f1f 	tst.w	r2, #31
     504:	d1f3      	bne.n	4ee <drv_uart_interrupt_handler+0x1dc>
     506:	4620      	mov	r0, r4
     508:	f7ff ff02 	bl	310 <uart_int_rx_fifo_thres_callback>
     50c:	6822      	ldr	r2, [r4, #0]
     50e:	6913      	ldr	r3, [r2, #16]
     510:	f043 0304 	orr.w	r3, r3, #4
     514:	6113      	str	r3, [r2, #16]
     516:	6823      	ldr	r3, [r4, #0]
     518:	2200      	movs	r2, #0
     51a:	611a      	str	r2, [r3, #16]
     51c:	f015 0f08 	tst.w	r5, #8
     520:	d020      	beq.n	564 <drv_uart_interrupt_handler+0x252>
     522:	7ce2      	ldrb	r2, [r4, #19]
     524:	7e23      	ldrb	r3, [r4, #24]
     526:	429a      	cmp	r2, r3
     528:	d30c      	bcc.n	544 <drv_uart_interrupt_handler+0x232>
     52a:	6822      	ldr	r2, [r4, #0]
     52c:	68d3      	ldr	r3, [r2, #12]
     52e:	f023 030c 	bic.w	r3, r3, #12
     532:	60d3      	str	r3, [r2, #12]
     534:	e00b      	b.n	54e <drv_uart_interrupt_handler+0x23c>
     536:	69d9      	ldr	r1, [r3, #28]
     538:	6962      	ldr	r2, [r4, #20]
     53a:	7ce3      	ldrb	r3, [r4, #19]
     53c:	1c58      	adds	r0, r3, #1
     53e:	74e0      	strb	r0, [r4, #19]
     540:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     544:	6823      	ldr	r3, [r4, #0]
     546:	695a      	ldr	r2, [r3, #20]
     548:	f012 0f1f 	tst.w	r2, #31
     54c:	d1f3      	bne.n	536 <drv_uart_interrupt_handler+0x224>
     54e:	4620      	mov	r0, r4
     550:	f7ff fedd 	bl	30e <uart_int_rx_fifo_noempty_callback>
     554:	6822      	ldr	r2, [r4, #0]
     556:	6913      	ldr	r3, [r2, #16]
     558:	f043 0308 	orr.w	r3, r3, #8
     55c:	6113      	str	r3, [r2, #16]
     55e:	6823      	ldr	r3, [r4, #0]
     560:	2200      	movs	r2, #0
     562:	611a      	str	r2, [r3, #16]
     564:	bd38      	pop	{r3, r4, r5, pc}
	...

00000568 <vprintf>:
     568:	b500      	push	{lr}
     56a:	b0a1      	sub	sp, #132	; 0x84
     56c:	460a      	mov	r2, r1
     56e:	4601      	mov	r1, r0
     570:	4668      	mov	r0, sp
     572:	f000 f8cd 	bl	710 <vsiprintf>
     576:	2800      	cmp	r0, #0
     578:	dc05      	bgt.n	586 <vprintf+0x1e>
     57a:	4668      	mov	r0, sp
     57c:	f000 f8aa 	bl	6d4 <strlen>
     580:	b021      	add	sp, #132	; 0x84
     582:	f85d fb04 	ldr.w	pc, [sp], #4
     586:	4668      	mov	r0, sp
     588:	f000 f8a4 	bl	6d4 <strlen>
     58c:	b2c2      	uxtb	r2, r0
     58e:	4669      	mov	r1, sp
     590:	4801      	ldr	r0, [pc, #4]	; (598 <vprintf+0x30>)
     592:	f7ff fe29 	bl	1e8 <drv_uart_putchars>
     596:	e7f0      	b.n	57a <vprintf+0x12>
     598:	00020088 	andeq	r0, r2, r8, lsl #1

0000059c <drv_uart_printf>:
     59c:	b40f      	push	{r0, r1, r2, r3}
     59e:	b500      	push	{lr}
     5a0:	b083      	sub	sp, #12
     5a2:	a904      	add	r1, sp, #16
     5a4:	f851 0b04 	ldr.w	r0, [r1], #4
     5a8:	9101      	str	r1, [sp, #4]
     5aa:	f7ff ffdd 	bl	568 <vprintf>
     5ae:	b003      	add	sp, #12
     5b0:	f85d eb04 	ldr.w	lr, [sp], #4
     5b4:	b004      	add	sp, #16
     5b6:	4770      	bx	lr

000005b8 <NMI_Handler>:
     5b8:	4770      	bx	lr

000005ba <HardFault_Handler>:
     5ba:	e7fe      	b.n	5ba <HardFault_Handler>

000005bc <MemManage_Handler>:
     5bc:	e7fe      	b.n	5bc <MemManage_Handler>

000005be <BusFault_Handler>:
     5be:	e7fe      	b.n	5be <BusFault_Handler>

000005c0 <UsageFault_Handler>:
     5c0:	e7fe      	b.n	5c0 <UsageFault_Handler>

000005c2 <SVC_Handler>:
     5c2:	4770      	bx	lr

000005c4 <DebugMon_Handler>:
     5c4:	4770      	bx	lr

000005c6 <PendSV_Handler>:
     5c6:	4770      	bx	lr

000005c8 <SysTick_Handler>:
     5c8:	4770      	bx	lr
	...

000005cc <Uart0_Handler>:
     5cc:	b508      	push	{r3, lr}
     5ce:	4b04      	ldr	r3, [pc, #16]	; (5e0 <Uart0_Handler+0x14>)
     5d0:	2201      	movs	r2, #1
     5d2:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     5d6:	4803      	ldr	r0, [pc, #12]	; (5e4 <Uart0_Handler+0x18>)
     5d8:	f7ff fe9b 	bl	312 <drv_uart_interrupt_handler>
     5dc:	bd08      	pop	{r3, pc}
     5de:	bf00      	nop
     5e0:	e000e100 	and	lr, r0, r0, lsl #2
     5e4:	00020088 	andeq	r0, r2, r8, lsl #1

000005e8 <main>:
     5e8:	b500      	push	{lr}
     5ea:	b083      	sub	sp, #12
     5ec:	4c0d      	ldr	r4, [pc, #52]	; (624 <main+0x3c>)
     5ee:	4b0e      	ldr	r3, [pc, #56]	; (628 <main+0x40>)
     5f0:	6023      	str	r3, [r4, #0]
     5f2:	4620      	mov	r0, r4
     5f4:	f7ff fd7d 	bl	f2 <drv_uart_default_config>
     5f8:	4620      	mov	r0, r4
     5fa:	f7ff fdad 	bl	158 <drv_uart_init>
     5fe:	480b      	ldr	r0, [pc, #44]	; (62c <main+0x44>)
     600:	f7ff ffcc 	bl	59c <drv_uart_printf>
     604:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     608:	22ed      	movs	r2, #237	; 0xed
     60a:	601a      	str	r2, [r3, #0]
     60c:	4c05      	ldr	r4, [pc, #20]	; (624 <main+0x3c>)
     60e:	f10d 0107 	add.w	r1, sp, #7
     612:	4620      	mov	r0, r4
     614:	f7ff fe1f 	bl	256 <drv_uart_getchar>
     618:	f10d 0107 	add.w	r1, sp, #7
     61c:	4620      	mov	r0, r4
     61e:	f7ff fe05 	bl	22c <drv_uart_putchar>
     622:	e7f3      	b.n	60c <main+0x24>
     624:	00020088 	andeq	r0, r2, r8, lsl #1
     628:	40001000 	andmi	r1, r0, r0
     62c:	00001010 	andeq	r1, r0, r0, lsl r0

00000630 <Reset_Handler>:
     630:	490a      	ldr	r1, [pc, #40]	; (65c <Reset_Handler+0x2c>)
     632:	4a0b      	ldr	r2, [pc, #44]	; (660 <Reset_Handler+0x30>)
     634:	4b0b      	ldr	r3, [pc, #44]	; (664 <Reset_Handler+0x34>)
     636:	1a9b      	subs	r3, r3, r2
     638:	dd03      	ble.n	642 <Reset_Handler+0x12>
     63a:	3b04      	subs	r3, #4
     63c:	58c8      	ldr	r0, [r1, r3]
     63e:	50d0      	str	r0, [r2, r3]
     640:	dcfb      	bgt.n	63a <Reset_Handler+0xa>
     642:	4909      	ldr	r1, [pc, #36]	; (668 <Reset_Handler+0x38>)
     644:	4a09      	ldr	r2, [pc, #36]	; (66c <Reset_Handler+0x3c>)
     646:	2000      	movs	r0, #0
     648:	4291      	cmp	r1, r2
     64a:	bfbc      	itt	lt
     64c:	f841 0b04 	strlt.w	r0, [r1], #4
     650:	e7fa      	blt.n	648 <Reset_Handler+0x18>
     652:	f7ff ffc9 	bl	5e8 <main>
     656:	f000 f829 	bl	6ac <exit>
     65a:	10780000 	rsbsne	r0, r8, r0
     65e:	00000000 	andeq	r0, r0, r0
     662:	006c0002 	rsbeq	r0, ip, r2
     666:	006c0002 	rsbeq	r0, ip, r2
     66a:	00b80002 	adcseq	r0, r8, r2
     66e:	e7fe0002 	ldrb	r0, [lr, r2]!
     672:	e7fe      	b.n	672 <Reset_Handler+0x42>
     674:	e7fe      	b.n	674 <Reset_Handler+0x44>
     676:	e7fe      	b.n	676 <Reset_Handler+0x46>
     678:	e7fe      	b.n	678 <Reset_Handler+0x48>
     67a:	e7fe      	b.n	67a <Reset_Handler+0x4a>
     67c:	e7fe      	b.n	67c <Reset_Handler+0x4c>
     67e:	e7fe      	b.n	67e <Reset_Handler+0x4e>
     680:	e7fe      	b.n	680 <Reset_Handler+0x50>
     682:	e7fe      	b.n	682 <Reset_Handler+0x52>

00000684 <Uart1_Handler>:
     684:	e7fe      	b.n	684 <Uart1_Handler>

00000686 <Resv2_Handler>:
     686:	e7fe      	b.n	686 <Resv2_Handler>

00000688 <Resv3_Handler>:
     688:	e7fe      	b.n	688 <Resv3_Handler>

0000068a <EthDma_Handler>:
     68a:	e7fe      	b.n	68a <EthDma_Handler>

0000068c <Gpioa_Handler>:
     68c:	e7fe      	b.n	68c <Gpioa_Handler>

0000068e <Resv6_Handler>:
     68e:	e7fe      	b.n	68e <Resv6_Handler>

00000690 <Resv7_Handler>:
     690:	e7fe      	b.n	690 <Resv7_Handler>

00000692 <Bastim_Ch0_Handler>:
     692:	e7fe      	b.n	692 <Bastim_Ch0_Handler>

00000694 <Bastim_Ch1_Handler>:
     694:	e7fe      	b.n	694 <Bastim_Ch1_Handler>

00000696 <Bastim_Ch2_Handler>:
     696:	e7fe      	b.n	696 <Bastim_Ch2_Handler>

00000698 <Bastim_Ch3_Handler>:
     698:	e7fe      	b.n	698 <Bastim_Ch3_Handler>

0000069a <EthSma_Handler>:
     69a:	e7fe      	b.n	69a <EthSma_Handler>

0000069c <EthTx_Handler>:
     69c:	e7fe      	b.n	69c <EthTx_Handler>

0000069e <EthRx_Handler>:
     69e:	e7fe      	b.n	69e <EthRx_Handler>

000006a0 <Resv15_Handler>:
     6a0:	e7fe      	b.n	6a0 <Resv15_Handler>

000006a2 <AdvtimGen_Handler>:
     6a2:	e7fe      	b.n	6a2 <AdvtimGen_Handler>

000006a4 <AdvtimCap_Handler>:
     6a4:	e7fe      	b.n	6a4 <AdvtimCap_Handler>

000006a6 <AdvtimEnc_Handler>:
     6a6:	e7fe      	b.n	6a6 <AdvtimEnc_Handler>

000006a8 <Spim_Handler>:
     6a8:	e7fe      	b.n	6a8 <Spim_Handler>
     6aa:	bf00      	nop

000006ac <exit>:
     6ac:	b508      	push	{r3, lr}
     6ae:	4b07      	ldr	r3, [pc, #28]	; (6cc <exit+0x20>)
     6b0:	4604      	mov	r4, r0
     6b2:	b113      	cbz	r3, 6ba <exit+0xe>
     6b4:	2100      	movs	r1, #0
     6b6:	f3af 8000 	nop.w
     6ba:	4b05      	ldr	r3, [pc, #20]	; (6d0 <exit+0x24>)
     6bc:	6818      	ldr	r0, [r3, #0]
     6be:	6a83      	ldr	r3, [r0, #40]	; 0x28
     6c0:	b103      	cbz	r3, 6c4 <exit+0x18>
     6c2:	4798      	blx	r3
     6c4:	4620      	mov	r0, r4
     6c6:	f000 fc95 	bl	ff4 <_exit>
     6ca:	bf00      	nop
     6cc:	00000000 	andeq	r0, r0, r0
     6d0:	0000103c 	andeq	r1, r0, ip, lsr r0

000006d4 <strlen>:
     6d4:	4603      	mov	r3, r0
     6d6:	f813 2b01 	ldrb.w	r2, [r3], #1
     6da:	2a00      	cmp	r2, #0
     6dc:	d1fb      	bne.n	6d6 <strlen+0x2>
     6de:	1a18      	subs	r0, r3, r0
     6e0:	3801      	subs	r0, #1
     6e2:	4770      	bx	lr

000006e4 <_vsiprintf_r>:
     6e4:	b500      	push	{lr}
     6e6:	b09b      	sub	sp, #108	; 0x6c
     6e8:	9100      	str	r1, [sp, #0]
     6ea:	9104      	str	r1, [sp, #16]
     6ec:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     6f0:	9105      	str	r1, [sp, #20]
     6f2:	9102      	str	r1, [sp, #8]
     6f4:	4905      	ldr	r1, [pc, #20]	; (70c <_vsiprintf_r+0x28>)
     6f6:	9103      	str	r1, [sp, #12]
     6f8:	4669      	mov	r1, sp
     6fa:	f000 f86f 	bl	7dc <_svfiprintf_r>
     6fe:	2200      	movs	r2, #0
     700:	9b00      	ldr	r3, [sp, #0]
     702:	701a      	strb	r2, [r3, #0]
     704:	b01b      	add	sp, #108	; 0x6c
     706:	f85d fb04 	ldr.w	pc, [sp], #4
     70a:	bf00      	nop
     70c:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

00000710 <vsiprintf>:
     710:	4613      	mov	r3, r2
     712:	460a      	mov	r2, r1
     714:	4601      	mov	r1, r0
     716:	4802      	ldr	r0, [pc, #8]	; (720 <vsiprintf+0x10>)
     718:	6800      	ldr	r0, [r0, #0]
     71a:	f7ff bfe3 	b.w	6e4 <_vsiprintf_r>
     71e:	bf00      	nop
     720:	00020000 	andeq	r0, r2, r0

00000724 <__ssputs_r>:
     724:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     728:	688e      	ldr	r6, [r1, #8]
     72a:	4682      	mov	sl, r0
     72c:	429e      	cmp	r6, r3
     72e:	460c      	mov	r4, r1
     730:	4690      	mov	r8, r2
     732:	461f      	mov	r7, r3
     734:	d838      	bhi.n	7a8 <__ssputs_r+0x84>
     736:	898a      	ldrh	r2, [r1, #12]
     738:	f412 6f90 	tst.w	r2, #1152	; 0x480
     73c:	d032      	beq.n	7a4 <__ssputs_r+0x80>
     73e:	6825      	ldr	r5, [r4, #0]
     740:	6909      	ldr	r1, [r1, #16]
     742:	3301      	adds	r3, #1
     744:	eba5 0901 	sub.w	r9, r5, r1
     748:	6965      	ldr	r5, [r4, #20]
     74a:	444b      	add	r3, r9
     74c:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     750:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     754:	106d      	asrs	r5, r5, #1
     756:	429d      	cmp	r5, r3
     758:	bf38      	it	cc
     75a:	461d      	movcc	r5, r3
     75c:	0553      	lsls	r3, r2, #21
     75e:	d531      	bpl.n	7c4 <__ssputs_r+0xa0>
     760:	4629      	mov	r1, r5
     762:	f000 fb6f 	bl	e44 <_malloc_r>
     766:	4606      	mov	r6, r0
     768:	b950      	cbnz	r0, 780 <__ssputs_r+0x5c>
     76a:	230c      	movs	r3, #12
     76c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     770:	f8ca 3000 	str.w	r3, [sl]
     774:	89a3      	ldrh	r3, [r4, #12]
     776:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     77a:	81a3      	strh	r3, [r4, #12]
     77c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     780:	464a      	mov	r2, r9
     782:	6921      	ldr	r1, [r4, #16]
     784:	f000 face 	bl	d24 <memcpy>
     788:	89a3      	ldrh	r3, [r4, #12]
     78a:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     78e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     792:	81a3      	strh	r3, [r4, #12]
     794:	6126      	str	r6, [r4, #16]
     796:	444e      	add	r6, r9
     798:	6026      	str	r6, [r4, #0]
     79a:	463e      	mov	r6, r7
     79c:	6165      	str	r5, [r4, #20]
     79e:	eba5 0509 	sub.w	r5, r5, r9
     7a2:	60a5      	str	r5, [r4, #8]
     7a4:	42be      	cmp	r6, r7
     7a6:	d900      	bls.n	7aa <__ssputs_r+0x86>
     7a8:	463e      	mov	r6, r7
     7aa:	4632      	mov	r2, r6
     7ac:	4641      	mov	r1, r8
     7ae:	6820      	ldr	r0, [r4, #0]
     7b0:	f000 fac6 	bl	d40 <memmove>
     7b4:	68a3      	ldr	r3, [r4, #8]
     7b6:	2000      	movs	r0, #0
     7b8:	1b9b      	subs	r3, r3, r6
     7ba:	60a3      	str	r3, [r4, #8]
     7bc:	6823      	ldr	r3, [r4, #0]
     7be:	4433      	add	r3, r6
     7c0:	6023      	str	r3, [r4, #0]
     7c2:	e7db      	b.n	77c <__ssputs_r+0x58>
     7c4:	462a      	mov	r2, r5
     7c6:	f000 fbb1 	bl	f2c <_realloc_r>
     7ca:	4606      	mov	r6, r0
     7cc:	2800      	cmp	r0, #0
     7ce:	d1e1      	bne.n	794 <__ssputs_r+0x70>
     7d0:	4650      	mov	r0, sl
     7d2:	6921      	ldr	r1, [r4, #16]
     7d4:	f000 face 	bl	d74 <_free_r>
     7d8:	e7c7      	b.n	76a <__ssputs_r+0x46>
	...

000007dc <_svfiprintf_r>:
     7dc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7e0:	4698      	mov	r8, r3
     7e2:	898b      	ldrh	r3, [r1, #12]
     7e4:	4607      	mov	r7, r0
     7e6:	061b      	lsls	r3, r3, #24
     7e8:	460d      	mov	r5, r1
     7ea:	4614      	mov	r4, r2
     7ec:	b09d      	sub	sp, #116	; 0x74
     7ee:	d50e      	bpl.n	80e <_svfiprintf_r+0x32>
     7f0:	690b      	ldr	r3, [r1, #16]
     7f2:	b963      	cbnz	r3, 80e <_svfiprintf_r+0x32>
     7f4:	2140      	movs	r1, #64	; 0x40
     7f6:	f000 fb25 	bl	e44 <_malloc_r>
     7fa:	6028      	str	r0, [r5, #0]
     7fc:	6128      	str	r0, [r5, #16]
     7fe:	b920      	cbnz	r0, 80a <_svfiprintf_r+0x2e>
     800:	230c      	movs	r3, #12
     802:	603b      	str	r3, [r7, #0]
     804:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     808:	e0d1      	b.n	9ae <_svfiprintf_r+0x1d2>
     80a:	2340      	movs	r3, #64	; 0x40
     80c:	616b      	str	r3, [r5, #20]
     80e:	2300      	movs	r3, #0
     810:	9309      	str	r3, [sp, #36]	; 0x24
     812:	2320      	movs	r3, #32
     814:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     818:	2330      	movs	r3, #48	; 0x30
     81a:	f04f 0901 	mov.w	r9, #1
     81e:	f8cd 800c 	str.w	r8, [sp, #12]
     822:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 9c8 <_svfiprintf_r+0x1ec>
     826:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     82a:	4623      	mov	r3, r4
     82c:	469a      	mov	sl, r3
     82e:	f813 2b01 	ldrb.w	r2, [r3], #1
     832:	b10a      	cbz	r2, 838 <_svfiprintf_r+0x5c>
     834:	2a25      	cmp	r2, #37	; 0x25
     836:	d1f9      	bne.n	82c <_svfiprintf_r+0x50>
     838:	ebba 0b04 	subs.w	fp, sl, r4
     83c:	d00b      	beq.n	856 <_svfiprintf_r+0x7a>
     83e:	465b      	mov	r3, fp
     840:	4622      	mov	r2, r4
     842:	4629      	mov	r1, r5
     844:	4638      	mov	r0, r7
     846:	f7ff ff6d 	bl	724 <__ssputs_r>
     84a:	3001      	adds	r0, #1
     84c:	f000 80aa 	beq.w	9a4 <_svfiprintf_r+0x1c8>
     850:	9a09      	ldr	r2, [sp, #36]	; 0x24
     852:	445a      	add	r2, fp
     854:	9209      	str	r2, [sp, #36]	; 0x24
     856:	f89a 3000 	ldrb.w	r3, [sl]
     85a:	2b00      	cmp	r3, #0
     85c:	f000 80a2 	beq.w	9a4 <_svfiprintf_r+0x1c8>
     860:	2300      	movs	r3, #0
     862:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     866:	e9cd 2305 	strd	r2, r3, [sp, #20]
     86a:	f10a 0a01 	add.w	sl, sl, #1
     86e:	9304      	str	r3, [sp, #16]
     870:	9307      	str	r3, [sp, #28]
     872:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     876:	931a      	str	r3, [sp, #104]	; 0x68
     878:	4654      	mov	r4, sl
     87a:	2205      	movs	r2, #5
     87c:	f814 1b01 	ldrb.w	r1, [r4], #1
     880:	4851      	ldr	r0, [pc, #324]	; (9c8 <_svfiprintf_r+0x1ec>)
     882:	f000 fa41 	bl	d08 <memchr>
     886:	9a04      	ldr	r2, [sp, #16]
     888:	b9d8      	cbnz	r0, 8c2 <_svfiprintf_r+0xe6>
     88a:	06d0      	lsls	r0, r2, #27
     88c:	bf44      	itt	mi
     88e:	2320      	movmi	r3, #32
     890:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     894:	0711      	lsls	r1, r2, #28
     896:	bf44      	itt	mi
     898:	232b      	movmi	r3, #43	; 0x2b
     89a:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     89e:	f89a 3000 	ldrb.w	r3, [sl]
     8a2:	2b2a      	cmp	r3, #42	; 0x2a
     8a4:	d015      	beq.n	8d2 <_svfiprintf_r+0xf6>
     8a6:	4654      	mov	r4, sl
     8a8:	2000      	movs	r0, #0
     8aa:	f04f 0c0a 	mov.w	ip, #10
     8ae:	9a07      	ldr	r2, [sp, #28]
     8b0:	4621      	mov	r1, r4
     8b2:	f811 3b01 	ldrb.w	r3, [r1], #1
     8b6:	3b30      	subs	r3, #48	; 0x30
     8b8:	2b09      	cmp	r3, #9
     8ba:	d94e      	bls.n	95a <_svfiprintf_r+0x17e>
     8bc:	b1b0      	cbz	r0, 8ec <_svfiprintf_r+0x110>
     8be:	9207      	str	r2, [sp, #28]
     8c0:	e014      	b.n	8ec <_svfiprintf_r+0x110>
     8c2:	eba0 0308 	sub.w	r3, r0, r8
     8c6:	fa09 f303 	lsl.w	r3, r9, r3
     8ca:	4313      	orrs	r3, r2
     8cc:	46a2      	mov	sl, r4
     8ce:	9304      	str	r3, [sp, #16]
     8d0:	e7d2      	b.n	878 <_svfiprintf_r+0x9c>
     8d2:	9b03      	ldr	r3, [sp, #12]
     8d4:	1d19      	adds	r1, r3, #4
     8d6:	681b      	ldr	r3, [r3, #0]
     8d8:	9103      	str	r1, [sp, #12]
     8da:	2b00      	cmp	r3, #0
     8dc:	bfbb      	ittet	lt
     8de:	425b      	neglt	r3, r3
     8e0:	f042 0202 	orrlt.w	r2, r2, #2
     8e4:	9307      	strge	r3, [sp, #28]
     8e6:	9307      	strlt	r3, [sp, #28]
     8e8:	bfb8      	it	lt
     8ea:	9204      	strlt	r2, [sp, #16]
     8ec:	7823      	ldrb	r3, [r4, #0]
     8ee:	2b2e      	cmp	r3, #46	; 0x2e
     8f0:	d10c      	bne.n	90c <_svfiprintf_r+0x130>
     8f2:	7863      	ldrb	r3, [r4, #1]
     8f4:	2b2a      	cmp	r3, #42	; 0x2a
     8f6:	d135      	bne.n	964 <_svfiprintf_r+0x188>
     8f8:	9b03      	ldr	r3, [sp, #12]
     8fa:	3402      	adds	r4, #2
     8fc:	1d1a      	adds	r2, r3, #4
     8fe:	681b      	ldr	r3, [r3, #0]
     900:	9203      	str	r2, [sp, #12]
     902:	2b00      	cmp	r3, #0
     904:	bfb8      	it	lt
     906:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     90a:	9305      	str	r3, [sp, #20]
     90c:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 9cc <_svfiprintf_r+0x1f0>
     910:	2203      	movs	r2, #3
     912:	4650      	mov	r0, sl
     914:	7821      	ldrb	r1, [r4, #0]
     916:	f000 f9f7 	bl	d08 <memchr>
     91a:	b140      	cbz	r0, 92e <_svfiprintf_r+0x152>
     91c:	2340      	movs	r3, #64	; 0x40
     91e:	eba0 000a 	sub.w	r0, r0, sl
     922:	fa03 f000 	lsl.w	r0, r3, r0
     926:	9b04      	ldr	r3, [sp, #16]
     928:	3401      	adds	r4, #1
     92a:	4303      	orrs	r3, r0
     92c:	9304      	str	r3, [sp, #16]
     92e:	f814 1b01 	ldrb.w	r1, [r4], #1
     932:	2206      	movs	r2, #6
     934:	4826      	ldr	r0, [pc, #152]	; (9d0 <_svfiprintf_r+0x1f4>)
     936:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     93a:	f000 f9e5 	bl	d08 <memchr>
     93e:	2800      	cmp	r0, #0
     940:	d038      	beq.n	9b4 <_svfiprintf_r+0x1d8>
     942:	4b24      	ldr	r3, [pc, #144]	; (9d4 <_svfiprintf_r+0x1f8>)
     944:	bb1b      	cbnz	r3, 98e <_svfiprintf_r+0x1b2>
     946:	9b03      	ldr	r3, [sp, #12]
     948:	3307      	adds	r3, #7
     94a:	f023 0307 	bic.w	r3, r3, #7
     94e:	3308      	adds	r3, #8
     950:	9303      	str	r3, [sp, #12]
     952:	9b09      	ldr	r3, [sp, #36]	; 0x24
     954:	4433      	add	r3, r6
     956:	9309      	str	r3, [sp, #36]	; 0x24
     958:	e767      	b.n	82a <_svfiprintf_r+0x4e>
     95a:	460c      	mov	r4, r1
     95c:	2001      	movs	r0, #1
     95e:	fb0c 3202 	mla	r2, ip, r2, r3
     962:	e7a5      	b.n	8b0 <_svfiprintf_r+0xd4>
     964:	2300      	movs	r3, #0
     966:	f04f 0c0a 	mov.w	ip, #10
     96a:	4619      	mov	r1, r3
     96c:	3401      	adds	r4, #1
     96e:	9305      	str	r3, [sp, #20]
     970:	4620      	mov	r0, r4
     972:	f810 2b01 	ldrb.w	r2, [r0], #1
     976:	3a30      	subs	r2, #48	; 0x30
     978:	2a09      	cmp	r2, #9
     97a:	d903      	bls.n	984 <_svfiprintf_r+0x1a8>
     97c:	2b00      	cmp	r3, #0
     97e:	d0c5      	beq.n	90c <_svfiprintf_r+0x130>
     980:	9105      	str	r1, [sp, #20]
     982:	e7c3      	b.n	90c <_svfiprintf_r+0x130>
     984:	4604      	mov	r4, r0
     986:	2301      	movs	r3, #1
     988:	fb0c 2101 	mla	r1, ip, r1, r2
     98c:	e7f0      	b.n	970 <_svfiprintf_r+0x194>
     98e:	ab03      	add	r3, sp, #12
     990:	9300      	str	r3, [sp, #0]
     992:	462a      	mov	r2, r5
     994:	4638      	mov	r0, r7
     996:	4b10      	ldr	r3, [pc, #64]	; (9d8 <_svfiprintf_r+0x1fc>)
     998:	a904      	add	r1, sp, #16
     99a:	f3af 8000 	nop.w
     99e:	1c42      	adds	r2, r0, #1
     9a0:	4606      	mov	r6, r0
     9a2:	d1d6      	bne.n	952 <_svfiprintf_r+0x176>
     9a4:	89ab      	ldrh	r3, [r5, #12]
     9a6:	065b      	lsls	r3, r3, #25
     9a8:	f53f af2c 	bmi.w	804 <_svfiprintf_r+0x28>
     9ac:	9809      	ldr	r0, [sp, #36]	; 0x24
     9ae:	b01d      	add	sp, #116	; 0x74
     9b0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     9b4:	ab03      	add	r3, sp, #12
     9b6:	9300      	str	r3, [sp, #0]
     9b8:	462a      	mov	r2, r5
     9ba:	4638      	mov	r0, r7
     9bc:	4b06      	ldr	r3, [pc, #24]	; (9d8 <_svfiprintf_r+0x1fc>)
     9be:	a904      	add	r1, sp, #16
     9c0:	f000 f87c 	bl	abc <_printf_i>
     9c4:	e7eb      	b.n	99e <_svfiprintf_r+0x1c2>
     9c6:	bf00      	nop
     9c8:	00001040 	andeq	r1, r0, r0, asr #32
     9cc:	00001046 	andeq	r1, r0, r6, asr #32
     9d0:	0000104a 	andeq	r1, r0, sl, asr #32
     9d4:	00000000 	andeq	r0, r0, r0
     9d8:	00000725 	andeq	r0, r0, r5, lsr #14

000009dc <_printf_common>:
     9dc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     9e0:	4616      	mov	r6, r2
     9e2:	4699      	mov	r9, r3
     9e4:	688a      	ldr	r2, [r1, #8]
     9e6:	690b      	ldr	r3, [r1, #16]
     9e8:	4607      	mov	r7, r0
     9ea:	4293      	cmp	r3, r2
     9ec:	bfb8      	it	lt
     9ee:	4613      	movlt	r3, r2
     9f0:	6033      	str	r3, [r6, #0]
     9f2:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     9f6:	460c      	mov	r4, r1
     9f8:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9fc:	b10a      	cbz	r2, a02 <_printf_common+0x26>
     9fe:	3301      	adds	r3, #1
     a00:	6033      	str	r3, [r6, #0]
     a02:	6823      	ldr	r3, [r4, #0]
     a04:	0699      	lsls	r1, r3, #26
     a06:	bf42      	ittt	mi
     a08:	6833      	ldrmi	r3, [r6, #0]
     a0a:	3302      	addmi	r3, #2
     a0c:	6033      	strmi	r3, [r6, #0]
     a0e:	6825      	ldr	r5, [r4, #0]
     a10:	f015 0506 	ands.w	r5, r5, #6
     a14:	d106      	bne.n	a24 <_printf_common+0x48>
     a16:	f104 0a19 	add.w	sl, r4, #25
     a1a:	68e3      	ldr	r3, [r4, #12]
     a1c:	6832      	ldr	r2, [r6, #0]
     a1e:	1a9b      	subs	r3, r3, r2
     a20:	42ab      	cmp	r3, r5
     a22:	dc28      	bgt.n	a76 <_printf_common+0x9a>
     a24:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     a28:	1e13      	subs	r3, r2, #0
     a2a:	6822      	ldr	r2, [r4, #0]
     a2c:	bf18      	it	ne
     a2e:	2301      	movne	r3, #1
     a30:	0692      	lsls	r2, r2, #26
     a32:	d42d      	bmi.n	a90 <_printf_common+0xb4>
     a34:	4649      	mov	r1, r9
     a36:	4638      	mov	r0, r7
     a38:	f104 0243 	add.w	r2, r4, #67	; 0x43
     a3c:	47c0      	blx	r8
     a3e:	3001      	adds	r0, #1
     a40:	d020      	beq.n	a84 <_printf_common+0xa8>
     a42:	6823      	ldr	r3, [r4, #0]
     a44:	68e5      	ldr	r5, [r4, #12]
     a46:	f003 0306 	and.w	r3, r3, #6
     a4a:	2b04      	cmp	r3, #4
     a4c:	bf18      	it	ne
     a4e:	2500      	movne	r5, #0
     a50:	6832      	ldr	r2, [r6, #0]
     a52:	f04f 0600 	mov.w	r6, #0
     a56:	68a3      	ldr	r3, [r4, #8]
     a58:	bf08      	it	eq
     a5a:	1aad      	subeq	r5, r5, r2
     a5c:	6922      	ldr	r2, [r4, #16]
     a5e:	bf08      	it	eq
     a60:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a64:	4293      	cmp	r3, r2
     a66:	bfc4      	itt	gt
     a68:	1a9b      	subgt	r3, r3, r2
     a6a:	18ed      	addgt	r5, r5, r3
     a6c:	341a      	adds	r4, #26
     a6e:	42b5      	cmp	r5, r6
     a70:	d11a      	bne.n	aa8 <_printf_common+0xcc>
     a72:	2000      	movs	r0, #0
     a74:	e008      	b.n	a88 <_printf_common+0xac>
     a76:	2301      	movs	r3, #1
     a78:	4652      	mov	r2, sl
     a7a:	4649      	mov	r1, r9
     a7c:	4638      	mov	r0, r7
     a7e:	47c0      	blx	r8
     a80:	3001      	adds	r0, #1
     a82:	d103      	bne.n	a8c <_printf_common+0xb0>
     a84:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a88:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a8c:	3501      	adds	r5, #1
     a8e:	e7c4      	b.n	a1a <_printf_common+0x3e>
     a90:	2030      	movs	r0, #48	; 0x30
     a92:	18e1      	adds	r1, r4, r3
     a94:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a98:	1c5a      	adds	r2, r3, #1
     a9a:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a9e:	4422      	add	r2, r4
     aa0:	3302      	adds	r3, #2
     aa2:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     aa6:	e7c5      	b.n	a34 <_printf_common+0x58>
     aa8:	2301      	movs	r3, #1
     aaa:	4622      	mov	r2, r4
     aac:	4649      	mov	r1, r9
     aae:	4638      	mov	r0, r7
     ab0:	47c0      	blx	r8
     ab2:	3001      	adds	r0, #1
     ab4:	d0e6      	beq.n	a84 <_printf_common+0xa8>
     ab6:	3601      	adds	r6, #1
     ab8:	e7d9      	b.n	a6e <_printf_common+0x92>
	...

00000abc <_printf_i>:
     abc:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     ac0:	7e0f      	ldrb	r7, [r1, #24]
     ac2:	4691      	mov	r9, r2
     ac4:	2f78      	cmp	r7, #120	; 0x78
     ac6:	4680      	mov	r8, r0
     ac8:	460c      	mov	r4, r1
     aca:	469a      	mov	sl, r3
     acc:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     ace:	f101 0243 	add.w	r2, r1, #67	; 0x43
     ad2:	d807      	bhi.n	ae4 <_printf_i+0x28>
     ad4:	2f62      	cmp	r7, #98	; 0x62
     ad6:	d80a      	bhi.n	aee <_printf_i+0x32>
     ad8:	2f00      	cmp	r7, #0
     ada:	f000 80d9 	beq.w	c90 <_printf_i+0x1d4>
     ade:	2f58      	cmp	r7, #88	; 0x58
     ae0:	f000 80a4 	beq.w	c2c <_printf_i+0x170>
     ae4:	f104 0542 	add.w	r5, r4, #66	; 0x42
     ae8:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     aec:	e03a      	b.n	b64 <_printf_i+0xa8>
     aee:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     af2:	2b15      	cmp	r3, #21
     af4:	d8f6      	bhi.n	ae4 <_printf_i+0x28>
     af6:	a101      	add	r1, pc, #4	; (adr r1, afc <_printf_i+0x40>)
     af8:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     afc:	00000b55 	andeq	r0, r0, r5, asr fp
     b00:	00000b69 	andeq	r0, r0, r9, ror #22
     b04:	00000ae5 	andeq	r0, r0, r5, ror #21
     b08:	00000ae5 	andeq	r0, r0, r5, ror #21
     b0c:	00000ae5 	andeq	r0, r0, r5, ror #21
     b10:	00000ae5 	andeq	r0, r0, r5, ror #21
     b14:	00000b69 	andeq	r0, r0, r9, ror #22
     b18:	00000ae5 	andeq	r0, r0, r5, ror #21
     b1c:	00000ae5 	andeq	r0, r0, r5, ror #21
     b20:	00000ae5 	andeq	r0, r0, r5, ror #21
     b24:	00000ae5 	andeq	r0, r0, r5, ror #21
     b28:	00000c77 	andeq	r0, r0, r7, ror ip
     b2c:	00000b99 	muleq	r0, r9, fp
     b30:	00000c59 	andeq	r0, r0, r9, asr ip
     b34:	00000ae5 	andeq	r0, r0, r5, ror #21
     b38:	00000ae5 	andeq	r0, r0, r5, ror #21
     b3c:	00000c99 	muleq	r0, r9, ip
     b40:	00000ae5 	andeq	r0, r0, r5, ror #21
     b44:	00000b99 	muleq	r0, r9, fp
     b48:	00000ae5 	andeq	r0, r0, r5, ror #21
     b4c:	00000ae5 	andeq	r0, r0, r5, ror #21
     b50:	00000c61 	andeq	r0, r0, r1, ror #24
     b54:	682b      	ldr	r3, [r5, #0]
     b56:	1d1a      	adds	r2, r3, #4
     b58:	681b      	ldr	r3, [r3, #0]
     b5a:	602a      	str	r2, [r5, #0]
     b5c:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b60:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b64:	2301      	movs	r3, #1
     b66:	e0a4      	b.n	cb2 <_printf_i+0x1f6>
     b68:	6820      	ldr	r0, [r4, #0]
     b6a:	6829      	ldr	r1, [r5, #0]
     b6c:	0606      	lsls	r6, r0, #24
     b6e:	f101 0304 	add.w	r3, r1, #4
     b72:	d50a      	bpl.n	b8a <_printf_i+0xce>
     b74:	680e      	ldr	r6, [r1, #0]
     b76:	602b      	str	r3, [r5, #0]
     b78:	2e00      	cmp	r6, #0
     b7a:	da03      	bge.n	b84 <_printf_i+0xc8>
     b7c:	232d      	movs	r3, #45	; 0x2d
     b7e:	4276      	negs	r6, r6
     b80:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b84:	230a      	movs	r3, #10
     b86:	485e      	ldr	r0, [pc, #376]	; (d00 <_printf_i+0x244>)
     b88:	e019      	b.n	bbe <_printf_i+0x102>
     b8a:	680e      	ldr	r6, [r1, #0]
     b8c:	f010 0f40 	tst.w	r0, #64	; 0x40
     b90:	602b      	str	r3, [r5, #0]
     b92:	bf18      	it	ne
     b94:	b236      	sxthne	r6, r6
     b96:	e7ef      	b.n	b78 <_printf_i+0xbc>
     b98:	682b      	ldr	r3, [r5, #0]
     b9a:	6820      	ldr	r0, [r4, #0]
     b9c:	1d19      	adds	r1, r3, #4
     b9e:	6029      	str	r1, [r5, #0]
     ba0:	0601      	lsls	r1, r0, #24
     ba2:	d501      	bpl.n	ba8 <_printf_i+0xec>
     ba4:	681e      	ldr	r6, [r3, #0]
     ba6:	e002      	b.n	bae <_printf_i+0xf2>
     ba8:	0646      	lsls	r6, r0, #25
     baa:	d5fb      	bpl.n	ba4 <_printf_i+0xe8>
     bac:	881e      	ldrh	r6, [r3, #0]
     bae:	2f6f      	cmp	r7, #111	; 0x6f
     bb0:	bf0c      	ite	eq
     bb2:	2308      	moveq	r3, #8
     bb4:	230a      	movne	r3, #10
     bb6:	4852      	ldr	r0, [pc, #328]	; (d00 <_printf_i+0x244>)
     bb8:	2100      	movs	r1, #0
     bba:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     bbe:	6865      	ldr	r5, [r4, #4]
     bc0:	2d00      	cmp	r5, #0
     bc2:	bfa8      	it	ge
     bc4:	6821      	ldrge	r1, [r4, #0]
     bc6:	60a5      	str	r5, [r4, #8]
     bc8:	bfa4      	itt	ge
     bca:	f021 0104 	bicge.w	r1, r1, #4
     bce:	6021      	strge	r1, [r4, #0]
     bd0:	b90e      	cbnz	r6, bd6 <_printf_i+0x11a>
     bd2:	2d00      	cmp	r5, #0
     bd4:	d04d      	beq.n	c72 <_printf_i+0x1b6>
     bd6:	4615      	mov	r5, r2
     bd8:	fbb6 f1f3 	udiv	r1, r6, r3
     bdc:	fb03 6711 	mls	r7, r3, r1, r6
     be0:	5dc7      	ldrb	r7, [r0, r7]
     be2:	f805 7d01 	strb.w	r7, [r5, #-1]!
     be6:	4637      	mov	r7, r6
     be8:	42bb      	cmp	r3, r7
     bea:	460e      	mov	r6, r1
     bec:	d9f4      	bls.n	bd8 <_printf_i+0x11c>
     bee:	2b08      	cmp	r3, #8
     bf0:	d10b      	bne.n	c0a <_printf_i+0x14e>
     bf2:	6823      	ldr	r3, [r4, #0]
     bf4:	07de      	lsls	r6, r3, #31
     bf6:	d508      	bpl.n	c0a <_printf_i+0x14e>
     bf8:	6923      	ldr	r3, [r4, #16]
     bfa:	6861      	ldr	r1, [r4, #4]
     bfc:	4299      	cmp	r1, r3
     bfe:	bfde      	ittt	le
     c00:	2330      	movle	r3, #48	; 0x30
     c02:	f805 3c01 	strble.w	r3, [r5, #-1]
     c06:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     c0a:	1b52      	subs	r2, r2, r5
     c0c:	6122      	str	r2, [r4, #16]
     c0e:	464b      	mov	r3, r9
     c10:	4621      	mov	r1, r4
     c12:	4640      	mov	r0, r8
     c14:	f8cd a000 	str.w	sl, [sp]
     c18:	aa03      	add	r2, sp, #12
     c1a:	f7ff fedf 	bl	9dc <_printf_common>
     c1e:	3001      	adds	r0, #1
     c20:	d14c      	bne.n	cbc <_printf_i+0x200>
     c22:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     c26:	b004      	add	sp, #16
     c28:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     c2c:	4834      	ldr	r0, [pc, #208]	; (d00 <_printf_i+0x244>)
     c2e:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     c32:	6829      	ldr	r1, [r5, #0]
     c34:	6823      	ldr	r3, [r4, #0]
     c36:	f851 6b04 	ldr.w	r6, [r1], #4
     c3a:	6029      	str	r1, [r5, #0]
     c3c:	061d      	lsls	r5, r3, #24
     c3e:	d514      	bpl.n	c6a <_printf_i+0x1ae>
     c40:	07df      	lsls	r7, r3, #31
     c42:	bf44      	itt	mi
     c44:	f043 0320 	orrmi.w	r3, r3, #32
     c48:	6023      	strmi	r3, [r4, #0]
     c4a:	b91e      	cbnz	r6, c54 <_printf_i+0x198>
     c4c:	6823      	ldr	r3, [r4, #0]
     c4e:	f023 0320 	bic.w	r3, r3, #32
     c52:	6023      	str	r3, [r4, #0]
     c54:	2310      	movs	r3, #16
     c56:	e7af      	b.n	bb8 <_printf_i+0xfc>
     c58:	6823      	ldr	r3, [r4, #0]
     c5a:	f043 0320 	orr.w	r3, r3, #32
     c5e:	6023      	str	r3, [r4, #0]
     c60:	2378      	movs	r3, #120	; 0x78
     c62:	4828      	ldr	r0, [pc, #160]	; (d04 <_printf_i+0x248>)
     c64:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c68:	e7e3      	b.n	c32 <_printf_i+0x176>
     c6a:	0659      	lsls	r1, r3, #25
     c6c:	bf48      	it	mi
     c6e:	b2b6      	uxthmi	r6, r6
     c70:	e7e6      	b.n	c40 <_printf_i+0x184>
     c72:	4615      	mov	r5, r2
     c74:	e7bb      	b.n	bee <_printf_i+0x132>
     c76:	682b      	ldr	r3, [r5, #0]
     c78:	6826      	ldr	r6, [r4, #0]
     c7a:	1d18      	adds	r0, r3, #4
     c7c:	6961      	ldr	r1, [r4, #20]
     c7e:	6028      	str	r0, [r5, #0]
     c80:	0635      	lsls	r5, r6, #24
     c82:	681b      	ldr	r3, [r3, #0]
     c84:	d501      	bpl.n	c8a <_printf_i+0x1ce>
     c86:	6019      	str	r1, [r3, #0]
     c88:	e002      	b.n	c90 <_printf_i+0x1d4>
     c8a:	0670      	lsls	r0, r6, #25
     c8c:	d5fb      	bpl.n	c86 <_printf_i+0x1ca>
     c8e:	8019      	strh	r1, [r3, #0]
     c90:	2300      	movs	r3, #0
     c92:	4615      	mov	r5, r2
     c94:	6123      	str	r3, [r4, #16]
     c96:	e7ba      	b.n	c0e <_printf_i+0x152>
     c98:	682b      	ldr	r3, [r5, #0]
     c9a:	2100      	movs	r1, #0
     c9c:	1d1a      	adds	r2, r3, #4
     c9e:	602a      	str	r2, [r5, #0]
     ca0:	681d      	ldr	r5, [r3, #0]
     ca2:	6862      	ldr	r2, [r4, #4]
     ca4:	4628      	mov	r0, r5
     ca6:	f000 f82f 	bl	d08 <memchr>
     caa:	b108      	cbz	r0, cb0 <_printf_i+0x1f4>
     cac:	1b40      	subs	r0, r0, r5
     cae:	6060      	str	r0, [r4, #4]
     cb0:	6863      	ldr	r3, [r4, #4]
     cb2:	6123      	str	r3, [r4, #16]
     cb4:	2300      	movs	r3, #0
     cb6:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     cba:	e7a8      	b.n	c0e <_printf_i+0x152>
     cbc:	462a      	mov	r2, r5
     cbe:	4649      	mov	r1, r9
     cc0:	4640      	mov	r0, r8
     cc2:	6923      	ldr	r3, [r4, #16]
     cc4:	47d0      	blx	sl
     cc6:	3001      	adds	r0, #1
     cc8:	d0ab      	beq.n	c22 <_printf_i+0x166>
     cca:	6823      	ldr	r3, [r4, #0]
     ccc:	079b      	lsls	r3, r3, #30
     cce:	d413      	bmi.n	cf8 <_printf_i+0x23c>
     cd0:	68e0      	ldr	r0, [r4, #12]
     cd2:	9b03      	ldr	r3, [sp, #12]
     cd4:	4298      	cmp	r0, r3
     cd6:	bfb8      	it	lt
     cd8:	4618      	movlt	r0, r3
     cda:	e7a4      	b.n	c26 <_printf_i+0x16a>
     cdc:	2301      	movs	r3, #1
     cde:	4632      	mov	r2, r6
     ce0:	4649      	mov	r1, r9
     ce2:	4640      	mov	r0, r8
     ce4:	47d0      	blx	sl
     ce6:	3001      	adds	r0, #1
     ce8:	d09b      	beq.n	c22 <_printf_i+0x166>
     cea:	3501      	adds	r5, #1
     cec:	68e3      	ldr	r3, [r4, #12]
     cee:	9903      	ldr	r1, [sp, #12]
     cf0:	1a5b      	subs	r3, r3, r1
     cf2:	42ab      	cmp	r3, r5
     cf4:	dcf2      	bgt.n	cdc <_printf_i+0x220>
     cf6:	e7eb      	b.n	cd0 <_printf_i+0x214>
     cf8:	2500      	movs	r5, #0
     cfa:	f104 0619 	add.w	r6, r4, #25
     cfe:	e7f5      	b.n	cec <_printf_i+0x230>
     d00:	00001051 	andeq	r1, r0, r1, asr r0
     d04:	00001062 	andeq	r1, r0, r2, rrx

00000d08 <memchr>:
     d08:	4603      	mov	r3, r0
     d0a:	b510      	push	{r4, lr}
     d0c:	b2c9      	uxtb	r1, r1
     d0e:	4402      	add	r2, r0
     d10:	4293      	cmp	r3, r2
     d12:	4618      	mov	r0, r3
     d14:	d101      	bne.n	d1a <memchr+0x12>
     d16:	2000      	movs	r0, #0
     d18:	e003      	b.n	d22 <memchr+0x1a>
     d1a:	7804      	ldrb	r4, [r0, #0]
     d1c:	3301      	adds	r3, #1
     d1e:	428c      	cmp	r4, r1
     d20:	d1f6      	bne.n	d10 <memchr+0x8>
     d22:	bd10      	pop	{r4, pc}

00000d24 <memcpy>:
     d24:	440a      	add	r2, r1
     d26:	4291      	cmp	r1, r2
     d28:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     d2c:	d100      	bne.n	d30 <memcpy+0xc>
     d2e:	4770      	bx	lr
     d30:	b510      	push	{r4, lr}
     d32:	f811 4b01 	ldrb.w	r4, [r1], #1
     d36:	4291      	cmp	r1, r2
     d38:	f803 4f01 	strb.w	r4, [r3, #1]!
     d3c:	d1f9      	bne.n	d32 <memcpy+0xe>
     d3e:	bd10      	pop	{r4, pc}

00000d40 <memmove>:
     d40:	4288      	cmp	r0, r1
     d42:	b510      	push	{r4, lr}
     d44:	eb01 0402 	add.w	r4, r1, r2
     d48:	d902      	bls.n	d50 <memmove+0x10>
     d4a:	4284      	cmp	r4, r0
     d4c:	4623      	mov	r3, r4
     d4e:	d807      	bhi.n	d60 <memmove+0x20>
     d50:	1e43      	subs	r3, r0, #1
     d52:	42a1      	cmp	r1, r4
     d54:	d008      	beq.n	d68 <memmove+0x28>
     d56:	f811 2b01 	ldrb.w	r2, [r1], #1
     d5a:	f803 2f01 	strb.w	r2, [r3, #1]!
     d5e:	e7f8      	b.n	d52 <memmove+0x12>
     d60:	4601      	mov	r1, r0
     d62:	4402      	add	r2, r0
     d64:	428a      	cmp	r2, r1
     d66:	d100      	bne.n	d6a <memmove+0x2a>
     d68:	bd10      	pop	{r4, pc}
     d6a:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d6e:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d72:	e7f7      	b.n	d64 <memmove+0x24>

00000d74 <_free_r>:
     d74:	b538      	push	{r3, r4, r5, lr}
     d76:	4605      	mov	r5, r0
     d78:	2900      	cmp	r1, #0
     d7a:	d040      	beq.n	dfe <_free_r+0x8a>
     d7c:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d80:	1f0c      	subs	r4, r1, #4
     d82:	2b00      	cmp	r3, #0
     d84:	bfb8      	it	lt
     d86:	18e4      	addlt	r4, r4, r3
     d88:	f000 f910 	bl	fac <__malloc_lock>
     d8c:	4a1c      	ldr	r2, [pc, #112]	; (e00 <_free_r+0x8c>)
     d8e:	6813      	ldr	r3, [r2, #0]
     d90:	b933      	cbnz	r3, da0 <_free_r+0x2c>
     d92:	6063      	str	r3, [r4, #4]
     d94:	6014      	str	r4, [r2, #0]
     d96:	4628      	mov	r0, r5
     d98:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d9c:	f000 b90c 	b.w	fb8 <__malloc_unlock>
     da0:	42a3      	cmp	r3, r4
     da2:	d908      	bls.n	db6 <_free_r+0x42>
     da4:	6820      	ldr	r0, [r4, #0]
     da6:	1821      	adds	r1, r4, r0
     da8:	428b      	cmp	r3, r1
     daa:	bf01      	itttt	eq
     dac:	6819      	ldreq	r1, [r3, #0]
     dae:	685b      	ldreq	r3, [r3, #4]
     db0:	1809      	addeq	r1, r1, r0
     db2:	6021      	streq	r1, [r4, #0]
     db4:	e7ed      	b.n	d92 <_free_r+0x1e>
     db6:	461a      	mov	r2, r3
     db8:	685b      	ldr	r3, [r3, #4]
     dba:	b10b      	cbz	r3, dc0 <_free_r+0x4c>
     dbc:	42a3      	cmp	r3, r4
     dbe:	d9fa      	bls.n	db6 <_free_r+0x42>
     dc0:	6811      	ldr	r1, [r2, #0]
     dc2:	1850      	adds	r0, r2, r1
     dc4:	42a0      	cmp	r0, r4
     dc6:	d10b      	bne.n	de0 <_free_r+0x6c>
     dc8:	6820      	ldr	r0, [r4, #0]
     dca:	4401      	add	r1, r0
     dcc:	1850      	adds	r0, r2, r1
     dce:	4283      	cmp	r3, r0
     dd0:	6011      	str	r1, [r2, #0]
     dd2:	d1e0      	bne.n	d96 <_free_r+0x22>
     dd4:	6818      	ldr	r0, [r3, #0]
     dd6:	685b      	ldr	r3, [r3, #4]
     dd8:	4401      	add	r1, r0
     dda:	6011      	str	r1, [r2, #0]
     ddc:	6053      	str	r3, [r2, #4]
     dde:	e7da      	b.n	d96 <_free_r+0x22>
     de0:	d902      	bls.n	de8 <_free_r+0x74>
     de2:	230c      	movs	r3, #12
     de4:	602b      	str	r3, [r5, #0]
     de6:	e7d6      	b.n	d96 <_free_r+0x22>
     de8:	6820      	ldr	r0, [r4, #0]
     dea:	1821      	adds	r1, r4, r0
     dec:	428b      	cmp	r3, r1
     dee:	bf01      	itttt	eq
     df0:	6819      	ldreq	r1, [r3, #0]
     df2:	685b      	ldreq	r3, [r3, #4]
     df4:	1809      	addeq	r1, r1, r0
     df6:	6021      	streq	r1, [r4, #0]
     df8:	6063      	str	r3, [r4, #4]
     dfa:	6054      	str	r4, [r2, #4]
     dfc:	e7cb      	b.n	d96 <_free_r+0x22>
     dfe:	bd38      	pop	{r3, r4, r5, pc}
     e00:	000200a4 	andeq	r0, r2, r4, lsr #1

00000e04 <sbrk_aligned>:
     e04:	b570      	push	{r4, r5, r6, lr}
     e06:	4e0e      	ldr	r6, [pc, #56]	; (e40 <sbrk_aligned+0x3c>)
     e08:	460c      	mov	r4, r1
     e0a:	6831      	ldr	r1, [r6, #0]
     e0c:	4605      	mov	r5, r0
     e0e:	b911      	cbnz	r1, e16 <sbrk_aligned+0x12>
     e10:	f000 f8bc 	bl	f8c <_sbrk_r>
     e14:	6030      	str	r0, [r6, #0]
     e16:	4621      	mov	r1, r4
     e18:	4628      	mov	r0, r5
     e1a:	f000 f8b7 	bl	f8c <_sbrk_r>
     e1e:	1c43      	adds	r3, r0, #1
     e20:	d00a      	beq.n	e38 <sbrk_aligned+0x34>
     e22:	1cc4      	adds	r4, r0, #3
     e24:	f024 0403 	bic.w	r4, r4, #3
     e28:	42a0      	cmp	r0, r4
     e2a:	d007      	beq.n	e3c <sbrk_aligned+0x38>
     e2c:	1a21      	subs	r1, r4, r0
     e2e:	4628      	mov	r0, r5
     e30:	f000 f8ac 	bl	f8c <_sbrk_r>
     e34:	3001      	adds	r0, #1
     e36:	d101      	bne.n	e3c <sbrk_aligned+0x38>
     e38:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     e3c:	4620      	mov	r0, r4
     e3e:	bd70      	pop	{r4, r5, r6, pc}
     e40:	000200a8 	andeq	r0, r2, r8, lsr #1

00000e44 <_malloc_r>:
     e44:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     e48:	1ccd      	adds	r5, r1, #3
     e4a:	f025 0503 	bic.w	r5, r5, #3
     e4e:	3508      	adds	r5, #8
     e50:	2d0c      	cmp	r5, #12
     e52:	bf38      	it	cc
     e54:	250c      	movcc	r5, #12
     e56:	2d00      	cmp	r5, #0
     e58:	4607      	mov	r7, r0
     e5a:	db01      	blt.n	e60 <_malloc_r+0x1c>
     e5c:	42a9      	cmp	r1, r5
     e5e:	d905      	bls.n	e6c <_malloc_r+0x28>
     e60:	230c      	movs	r3, #12
     e62:	2600      	movs	r6, #0
     e64:	603b      	str	r3, [r7, #0]
     e66:	4630      	mov	r0, r6
     e68:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e6c:	4e2e      	ldr	r6, [pc, #184]	; (f28 <_malloc_r+0xe4>)
     e6e:	f000 f89d 	bl	fac <__malloc_lock>
     e72:	6833      	ldr	r3, [r6, #0]
     e74:	461c      	mov	r4, r3
     e76:	bb34      	cbnz	r4, ec6 <_malloc_r+0x82>
     e78:	4629      	mov	r1, r5
     e7a:	4638      	mov	r0, r7
     e7c:	f7ff ffc2 	bl	e04 <sbrk_aligned>
     e80:	1c43      	adds	r3, r0, #1
     e82:	4604      	mov	r4, r0
     e84:	d14d      	bne.n	f22 <_malloc_r+0xde>
     e86:	6834      	ldr	r4, [r6, #0]
     e88:	4626      	mov	r6, r4
     e8a:	2e00      	cmp	r6, #0
     e8c:	d140      	bne.n	f10 <_malloc_r+0xcc>
     e8e:	6823      	ldr	r3, [r4, #0]
     e90:	4631      	mov	r1, r6
     e92:	4638      	mov	r0, r7
     e94:	eb04 0803 	add.w	r8, r4, r3
     e98:	f000 f878 	bl	f8c <_sbrk_r>
     e9c:	4580      	cmp	r8, r0
     e9e:	d13a      	bne.n	f16 <_malloc_r+0xd2>
     ea0:	6821      	ldr	r1, [r4, #0]
     ea2:	3503      	adds	r5, #3
     ea4:	1a6d      	subs	r5, r5, r1
     ea6:	f025 0503 	bic.w	r5, r5, #3
     eaa:	3508      	adds	r5, #8
     eac:	2d0c      	cmp	r5, #12
     eae:	bf38      	it	cc
     eb0:	250c      	movcc	r5, #12
     eb2:	4638      	mov	r0, r7
     eb4:	4629      	mov	r1, r5
     eb6:	f7ff ffa5 	bl	e04 <sbrk_aligned>
     eba:	3001      	adds	r0, #1
     ebc:	d02b      	beq.n	f16 <_malloc_r+0xd2>
     ebe:	6823      	ldr	r3, [r4, #0]
     ec0:	442b      	add	r3, r5
     ec2:	6023      	str	r3, [r4, #0]
     ec4:	e00e      	b.n	ee4 <_malloc_r+0xa0>
     ec6:	6822      	ldr	r2, [r4, #0]
     ec8:	1b52      	subs	r2, r2, r5
     eca:	d41e      	bmi.n	f0a <_malloc_r+0xc6>
     ecc:	2a0b      	cmp	r2, #11
     ece:	d916      	bls.n	efe <_malloc_r+0xba>
     ed0:	1961      	adds	r1, r4, r5
     ed2:	42a3      	cmp	r3, r4
     ed4:	6025      	str	r5, [r4, #0]
     ed6:	bf18      	it	ne
     ed8:	6059      	strne	r1, [r3, #4]
     eda:	6863      	ldr	r3, [r4, #4]
     edc:	bf08      	it	eq
     ede:	6031      	streq	r1, [r6, #0]
     ee0:	5162      	str	r2, [r4, r5]
     ee2:	604b      	str	r3, [r1, #4]
     ee4:	4638      	mov	r0, r7
     ee6:	f104 060b 	add.w	r6, r4, #11
     eea:	f000 f865 	bl	fb8 <__malloc_unlock>
     eee:	f026 0607 	bic.w	r6, r6, #7
     ef2:	1d23      	adds	r3, r4, #4
     ef4:	1af2      	subs	r2, r6, r3
     ef6:	d0b6      	beq.n	e66 <_malloc_r+0x22>
     ef8:	1b9b      	subs	r3, r3, r6
     efa:	50a3      	str	r3, [r4, r2]
     efc:	e7b3      	b.n	e66 <_malloc_r+0x22>
     efe:	6862      	ldr	r2, [r4, #4]
     f00:	42a3      	cmp	r3, r4
     f02:	bf0c      	ite	eq
     f04:	6032      	streq	r2, [r6, #0]
     f06:	605a      	strne	r2, [r3, #4]
     f08:	e7ec      	b.n	ee4 <_malloc_r+0xa0>
     f0a:	4623      	mov	r3, r4
     f0c:	6864      	ldr	r4, [r4, #4]
     f0e:	e7b2      	b.n	e76 <_malloc_r+0x32>
     f10:	4634      	mov	r4, r6
     f12:	6876      	ldr	r6, [r6, #4]
     f14:	e7b9      	b.n	e8a <_malloc_r+0x46>
     f16:	230c      	movs	r3, #12
     f18:	4638      	mov	r0, r7
     f1a:	603b      	str	r3, [r7, #0]
     f1c:	f000 f84c 	bl	fb8 <__malloc_unlock>
     f20:	e7a1      	b.n	e66 <_malloc_r+0x22>
     f22:	6025      	str	r5, [r4, #0]
     f24:	e7de      	b.n	ee4 <_malloc_r+0xa0>
     f26:	bf00      	nop
     f28:	000200a4 	andeq	r0, r2, r4, lsr #1

00000f2c <_realloc_r>:
     f2c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     f30:	4680      	mov	r8, r0
     f32:	4614      	mov	r4, r2
     f34:	460e      	mov	r6, r1
     f36:	b921      	cbnz	r1, f42 <_realloc_r+0x16>
     f38:	4611      	mov	r1, r2
     f3a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     f3e:	f7ff bf81 	b.w	e44 <_malloc_r>
     f42:	b92a      	cbnz	r2, f50 <_realloc_r+0x24>
     f44:	f7ff ff16 	bl	d74 <_free_r>
     f48:	4625      	mov	r5, r4
     f4a:	4628      	mov	r0, r5
     f4c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f50:	f000 f838 	bl	fc4 <_malloc_usable_size_r>
     f54:	4284      	cmp	r4, r0
     f56:	4607      	mov	r7, r0
     f58:	d802      	bhi.n	f60 <_realloc_r+0x34>
     f5a:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f5e:	d812      	bhi.n	f86 <_realloc_r+0x5a>
     f60:	4621      	mov	r1, r4
     f62:	4640      	mov	r0, r8
     f64:	f7ff ff6e 	bl	e44 <_malloc_r>
     f68:	4605      	mov	r5, r0
     f6a:	2800      	cmp	r0, #0
     f6c:	d0ed      	beq.n	f4a <_realloc_r+0x1e>
     f6e:	42bc      	cmp	r4, r7
     f70:	4622      	mov	r2, r4
     f72:	4631      	mov	r1, r6
     f74:	bf28      	it	cs
     f76:	463a      	movcs	r2, r7
     f78:	f7ff fed4 	bl	d24 <memcpy>
     f7c:	4631      	mov	r1, r6
     f7e:	4640      	mov	r0, r8
     f80:	f7ff fef8 	bl	d74 <_free_r>
     f84:	e7e1      	b.n	f4a <_realloc_r+0x1e>
     f86:	4635      	mov	r5, r6
     f88:	e7df      	b.n	f4a <_realloc_r+0x1e>
	...

00000f8c <_sbrk_r>:
     f8c:	b538      	push	{r3, r4, r5, lr}
     f8e:	2300      	movs	r3, #0
     f90:	4d05      	ldr	r5, [pc, #20]	; (fa8 <_sbrk_r+0x1c>)
     f92:	4604      	mov	r4, r0
     f94:	4608      	mov	r0, r1
     f96:	602b      	str	r3, [r5, #0]
     f98:	f000 f81e 	bl	fd8 <_sbrk>
     f9c:	1c43      	adds	r3, r0, #1
     f9e:	d102      	bne.n	fa6 <_sbrk_r+0x1a>
     fa0:	682b      	ldr	r3, [r5, #0]
     fa2:	b103      	cbz	r3, fa6 <_sbrk_r+0x1a>
     fa4:	6023      	str	r3, [r4, #0]
     fa6:	bd38      	pop	{r3, r4, r5, pc}
     fa8:	000200ac 	andeq	r0, r2, ip, lsr #1

00000fac <__malloc_lock>:
     fac:	4801      	ldr	r0, [pc, #4]	; (fb4 <__malloc_lock+0x8>)
     fae:	f000 b811 	b.w	fd4 <__retarget_lock_acquire_recursive>
     fb2:	bf00      	nop
     fb4:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fb8 <__malloc_unlock>:
     fb8:	4801      	ldr	r0, [pc, #4]	; (fc0 <__malloc_unlock+0x8>)
     fba:	f000 b80c 	b.w	fd6 <__retarget_lock_release_recursive>
     fbe:	bf00      	nop
     fc0:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fc4 <_malloc_usable_size_r>:
     fc4:	f851 3c04 	ldr.w	r3, [r1, #-4]
     fc8:	1f18      	subs	r0, r3, #4
     fca:	2b00      	cmp	r3, #0
     fcc:	bfbc      	itt	lt
     fce:	580b      	ldrlt	r3, [r1, r0]
     fd0:	18c0      	addlt	r0, r0, r3
     fd2:	4770      	bx	lr

00000fd4 <__retarget_lock_acquire_recursive>:
     fd4:	4770      	bx	lr

00000fd6 <__retarget_lock_release_recursive>:
     fd6:	4770      	bx	lr

00000fd8 <_sbrk>:
     fd8:	4a04      	ldr	r2, [pc, #16]	; (fec <_sbrk+0x14>)
     fda:	4905      	ldr	r1, [pc, #20]	; (ff0 <_sbrk+0x18>)
     fdc:	6813      	ldr	r3, [r2, #0]
     fde:	2b00      	cmp	r3, #0
     fe0:	bf08      	it	eq
     fe2:	460b      	moveq	r3, r1
     fe4:	4418      	add	r0, r3
     fe6:	6010      	str	r0, [r2, #0]
     fe8:	4618      	mov	r0, r3
     fea:	4770      	bx	lr
     fec:	000200b4 	strheq	r0, [r2], -r4
     ff0:	000200b8 	strheq	r0, [r2], -r8

00000ff4 <_exit>:
     ff4:	e7fe      	b.n	ff4 <_exit>
     ff6:	bf00      	nop

00000ff8 <_init>:
     ff8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     ffa:	bf00      	nop
     ffc:	bcf8      	pop	{r3, r4, r5, r6, r7}
     ffe:	bc08      	pop	{r3}
    1000:	469e      	mov	lr, r3
    1002:	4770      	bx	lr

00001004 <_fini>:
    1004:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    1006:	bf00      	nop
    1008:	bcf8      	pop	{r3, r4, r5, r6, r7}
    100a:	bc08      	pop	{r3}
    100c:	469e      	mov	lr, r3
    100e:	4770      	bx	lr
    1010:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
    1014:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
    1018:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
    101c:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
    1020:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
    1024:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
    1028:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
    102c:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
    1030:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
    1034:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
    1038:	0000000a 	andeq	r0, r0, sl

0000103c <_global_impure_ptr>:
    103c:	00020004 	andeq	r0, r2, r4
    1040:	2b302d23 	blcs	c0c4d4 <__StackTop+0xbea4d4>
    1044:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    1048:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    104c:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    1050:	32313000 	eorscc	r3, r1, #0
    1054:	36353433 			; <UNDEFINED> instruction: 0x36353433
    1058:	41393837 	teqmi	r9, r7, lsr r8
    105c:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    1060:	31300046 	teqcc	r0, r6, asr #32
    1064:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    1068:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    106c:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    1070:	00006665 	andeq	r6, r0, r5, ror #12

00001074 <__EH_FRAME_BEGIN__>:
    1074:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <_impure_ptr>:
   20000:	00020004 	andeq	r0, r2, r4

00020004 <impure_data>:
	...

00020064 <__frame_dummy_init_array_entry>:
   20064:	000000b5 	strheq	r0, [r0], -r5

00020068 <__do_global_dtors_aux_fini_array_entry>:
   20068:	00000091 	muleq	r0, r1, r0

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
  18:	000006ac 	andeq	r0, r0, ip, lsr #13
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000006e4 	andeq	r0, r0, r4, ror #13
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	00000710 	andeq	r0, r0, r0, lsl r7
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	00000724 	andeq	r0, r0, r4, lsr #14
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
  cc:	000007dc 	ldrdeq	r0, [r0], -ip
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
 10c:	000009dc 	ldrdeq	r0, [r0], -ip
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xc0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000abc 			; <UNDEFINED> instruction: 0x00000abc
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
 16c:	00000d08 	andeq	r0, r0, r8, lsl #26
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000d24 	andeq	r0, r0, r4, lsr #26
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000d40 	andeq	r0, r0, r0, asr #26
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d74 	andeq	r0, r0, r4, ror sp
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
 21c:	00000e04 	andeq	r0, r0, r4, lsl #28
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000e44 	andeq	r0, r0, r4, asr #28
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
 268:	00000f2c 	andeq	r0, r0, ip, lsr #30
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
 2a4:	00000f8c 	andeq	r0, r0, ip, lsl #31
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
 2d0:	00000fac 	andeq	r0, r0, ip, lsr #31
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000fb8 			; <UNDEFINED> instruction: 0x00000fb8
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000fc4 	andeq	r0, r0, r4, asr #31
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
 3cc:	00000fd4 	ldrdeq	r0, [r0], -r4
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
 40c:	00000fd6 	ldrdeq	r0, [r0], -r6
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000fd8 	ldrdeq	r0, [r0], -r8
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000ff4 	strdeq	r0, [r0], -r4
 450:	00000002 	andeq	r0, r0, r2


bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00000629 	andeq	r0, r0, r9, lsr #12
       8:	000005b1 			; <UNDEFINED> instruction: 0x000005b1
       c:	000005b3 			; <UNDEFINED> instruction: 0x000005b3
      10:	000005b5 			; <UNDEFINED> instruction: 0x000005b5
      14:	000005b7 			; <UNDEFINED> instruction: 0x000005b7
      18:	000005b9 			; <UNDEFINED> instruction: 0x000005b9
	...
      2c:	000005bb 			; <UNDEFINED> instruction: 0x000005bb
      30:	000005bd 			; <UNDEFINED> instruction: 0x000005bd
      34:	00000000 	andeq	r0, r0, r0
      38:	000005bf 			; <UNDEFINED> instruction: 0x000005bf
      3c:	000005c1 	andeq	r0, r0, r1, asr #11
      40:	000005c5 	andeq	r0, r0, r5, asr #11
      44:	0000067d 	andeq	r0, r0, sp, ror r6
      48:	0000067f 	andeq	r0, r0, pc, ror r6
      4c:	00000681 	andeq	r0, r0, r1, lsl #13
      50:	00000683 	andeq	r0, r0, r3, lsl #13
      54:	00000685 	andeq	r0, r0, r5, lsl #13
      58:	00000687 	andeq	r0, r0, r7, lsl #13
      5c:	00000689 	andeq	r0, r0, r9, lsl #13
      60:	0000068b 	andeq	r0, r0, fp, lsl #13
      64:	0000068d 	andeq	r0, r0, sp, lsl #13
      68:	0000068f 	andeq	r0, r0, pc, lsl #13
      6c:	00000691 	muleq	r0, r1, r6
      70:	00000693 	muleq	r0, r3, r6
      74:	00000695 	muleq	r0, r5, r6
      78:	00000697 	muleq	r0, r7, r6
      7c:	00000699 	muleq	r0, r9, r6
      80:	0000069b 	muleq	r0, fp, r6
      84:	0000069d 	muleq	r0, sp, r6

00000088 <__do_global_dtors_aux>:
      88:	b510      	push	{r4, lr}
      8a:	4c05      	ldr	r4, [pc, #20]	; (a0 <__do_global_dtors_aux+0x18>)
      8c:	7823      	ldrb	r3, [r4, #0]
      8e:	b933      	cbnz	r3, 9e <__do_global_dtors_aux+0x16>
      90:	4b04      	ldr	r3, [pc, #16]	; (a4 <__do_global_dtors_aux+0x1c>)
      92:	b113      	cbz	r3, 9a <__do_global_dtors_aux+0x12>
      94:	4804      	ldr	r0, [pc, #16]	; (a8 <__do_global_dtors_aux+0x20>)
      96:	f3af 8000 	nop.w
      9a:	2301      	movs	r3, #1
      9c:	7023      	strb	r3, [r4, #0]
      9e:	bd10      	pop	{r4, pc}
      a0:	0002006c 	andeq	r0, r2, ip, rrx
      a4:	00000000 	andeq	r0, r0, r0
      a8:	00001068 	andeq	r1, r0, r8, rrx

000000ac <frame_dummy>:
      ac:	b508      	push	{r3, lr}
      ae:	4b03      	ldr	r3, [pc, #12]	; (bc <frame_dummy+0x10>)
      b0:	b11b      	cbz	r3, ba <frame_dummy+0xe>
      b2:	4903      	ldr	r1, [pc, #12]	; (c0 <frame_dummy+0x14>)
      b4:	4803      	ldr	r0, [pc, #12]	; (c4 <frame_dummy+0x18>)
      b6:	f3af 8000 	nop.w
      ba:	bd08      	pop	{r3, pc}
      bc:	00000000 	andeq	r0, r0, r0
      c0:	00020070 	andeq	r0, r2, r0, ror r0
      c4:	00001068 	andeq	r1, r0, r8, rrx

000000c8 <drv_check_rw_data>:
      c8:	6001      	str	r1, [r0, #0]
      ca:	6803      	ldr	r3, [r0, #0]
      cc:	4293      	cmp	r3, r2
      ce:	d007      	beq.n	e0 <drv_check_rw_data+0x18>
      d0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      d4:	2001      	movs	r0, #1
      d6:	6018      	str	r0, [r3, #0]
      d8:	685a      	ldr	r2, [r3, #4]
      da:	4402      	add	r2, r0
      dc:	601a      	str	r2, [r3, #0]
      de:	4770      	bx	lr
      e0:	2000      	movs	r0, #0
      e2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      e6:	6018      	str	r0, [r3, #0]
      e8:	4770      	bx	lr

000000ea <drv_uart_default_config>:
      ea:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      ee:	6043      	str	r3, [r0, #4]
      f0:	230f      	movs	r3, #15
      f2:	7203      	strb	r3, [r0, #8]
      f4:	2300      	movs	r3, #0
      f6:	7243      	strb	r3, [r0, #9]
      f8:	7283      	strb	r3, [r0, #10]
      fa:	72c3      	strb	r3, [r0, #11]
      fc:	7303      	strb	r3, [r0, #12]
      fe:	7343      	strb	r3, [r0, #13]
     100:	2301      	movs	r3, #1
     102:	7383      	strb	r3, [r0, #14]
     104:	4770      	bx	lr
	...

00000108 <drv_uart_set_config>:
     108:	b508      	push	{r3, lr}
     10a:	6841      	ldr	r1, [r0, #4]
     10c:	7a03      	ldrb	r3, [r0, #8]
     10e:	fb03 f201 	mul.w	r2, r3, r1
     112:	490e      	ldr	r1, [pc, #56]	; (14c <drv_uart_set_config+0x44>)
     114:	fbb1 f2f2 	udiv	r2, r1, r2
     118:	0419      	lsls	r1, r3, #16
     11a:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     11e:	7a43      	ldrb	r3, [r0, #9]
     120:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     124:	7a83      	ldrb	r3, [r0, #10]
     126:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     12a:	7ac3      	ldrb	r3, [r0, #11]
     12c:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     130:	7b03      	ldrb	r3, [r0, #12]
     132:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     136:	7b42      	ldrb	r2, [r0, #13]
     138:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     13c:	7b82      	ldrb	r2, [r0, #14]
     13e:	4311      	orrs	r1, r2
     140:	6800      	ldr	r0, [r0, #0]
     142:	460a      	mov	r2, r1
     144:	3008      	adds	r0, #8
     146:	f7ff ffbf 	bl	c8 <drv_check_rw_data>
     14a:	bd08      	pop	{r3, pc}
     14c:	02625a00 	rsbeq	r5, r2, #0, 20

00000150 <drv_uart_init>:
     150:	b538      	push	{r3, r4, r5, lr}
     152:	4604      	mov	r4, r0
     154:	2500      	movs	r5, #0
     156:	7485      	strb	r5, [r0, #18]
     158:	74c5      	strb	r5, [r0, #19]
     15a:	f7ff ffd5 	bl	108 <drv_uart_set_config>
     15e:	7425      	strb	r5, [r4, #16]
     160:	74a5      	strb	r5, [r4, #18]
     162:	74e5      	strb	r5, [r4, #19]
     164:	6822      	ldr	r2, [r4, #0]
     166:	6853      	ldr	r3, [r2, #4]
     168:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     16c:	6053      	str	r3, [r2, #4]
     16e:	6822      	ldr	r2, [r4, #0]
     170:	6853      	ldr	r3, [r2, #4]
     172:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     176:	6053      	str	r3, [r2, #4]
     178:	6822      	ldr	r2, [r4, #0]
     17a:	6853      	ldr	r3, [r2, #4]
     17c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     180:	6053      	str	r3, [r2, #4]
     182:	6822      	ldr	r2, [r4, #0]
     184:	6853      	ldr	r3, [r2, #4]
     186:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     18a:	6053      	str	r3, [r2, #4]
     18c:	6822      	ldr	r2, [r4, #0]
     18e:	6853      	ldr	r3, [r2, #4]
     190:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     194:	6053      	str	r3, [r2, #4]
     196:	6822      	ldr	r2, [r4, #0]
     198:	6853      	ldr	r3, [r2, #4]
     19a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     19e:	6053      	str	r3, [r2, #4]
     1a0:	6822      	ldr	r2, [r4, #0]
     1a2:	6853      	ldr	r3, [r2, #4]
     1a4:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     1a8:	6053      	str	r3, [r2, #4]
     1aa:	6822      	ldr	r2, [r4, #0]
     1ac:	6853      	ldr	r3, [r2, #4]
     1ae:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     1b2:	6053      	str	r3, [r2, #4]
     1b4:	6823      	ldr	r3, [r4, #0]
     1b6:	f240 12ff 	movw	r2, #511	; 0x1ff
     1ba:	611a      	str	r2, [r3, #16]
     1bc:	6823      	ldr	r3, [r4, #0]
     1be:	611d      	str	r5, [r3, #16]
     1c0:	6822      	ldr	r2, [r4, #0]
     1c2:	6853      	ldr	r3, [r2, #4]
     1c4:	f043 0301 	orr.w	r3, r3, #1
     1c8:	6053      	str	r3, [r2, #4]
     1ca:	6822      	ldr	r2, [r4, #0]
     1cc:	6853      	ldr	r3, [r2, #4]
     1ce:	f023 0301 	bic.w	r3, r3, #1
     1d2:	6053      	str	r3, [r2, #4]
     1d4:	6822      	ldr	r2, [r4, #0]
     1d6:	6853      	ldr	r3, [r2, #4]
     1d8:	f043 0302 	orr.w	r3, r3, #2
     1dc:	6053      	str	r3, [r2, #4]
     1de:	bd38      	pop	{r3, r4, r5, pc}

000001e0 <drv_uart_putchars>:
     1e0:	b410      	push	{r4}
     1e2:	2300      	movs	r3, #0
     1e4:	7483      	strb	r3, [r0, #18]
     1e6:	f890 c012 	ldrb.w	ip, [r0, #18]
     1ea:	4594      	cmp	ip, r2
     1ec:	d20c      	bcs.n	208 <Stack_Size+0x8>
     1ee:	6804      	ldr	r4, [r0, #0]
     1f0:	6963      	ldr	r3, [r4, #20]
     1f2:	0a1b      	lsrs	r3, r3, #8
     1f4:	f013 0f18 	tst.w	r3, #24
     1f8:	d1f5      	bne.n	1e6 <drv_uart_putchars+0x6>
     1fa:	f10c 0301 	add.w	r3, ip, #1
     1fe:	7483      	strb	r3, [r0, #18]
     200:	f811 300c 	ldrb.w	r3, [r1, ip]
     204:	6023      	str	r3, [r4, #0]
     206:	e7ee      	b.n	1e6 <drv_uart_putchars+0x6>
     208:	6803      	ldr	r3, [r0, #0]
     20a:	699a      	ldr	r2, [r3, #24]
     20c:	f412 7f80 	tst.w	r2, #256	; 0x100
     210:	d0fa      	beq.n	208 <Stack_Size+0x8>
     212:	691a      	ldr	r2, [r3, #16]
     214:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     218:	611a      	str	r2, [r3, #16]
     21a:	6803      	ldr	r3, [r0, #0]
     21c:	2200      	movs	r2, #0
     21e:	611a      	str	r2, [r3, #16]
     220:	bc10      	pop	{r4}
     222:	4770      	bx	lr

00000224 <drv_uart_putchar>:
     224:	6802      	ldr	r2, [r0, #0]
     226:	6953      	ldr	r3, [r2, #20]
     228:	0a1b      	lsrs	r3, r3, #8
     22a:	f013 0f18 	tst.w	r3, #24
     22e:	d101      	bne.n	234 <drv_uart_putchar+0x10>
     230:	780b      	ldrb	r3, [r1, #0]
     232:	6013      	str	r3, [r2, #0]
     234:	6803      	ldr	r3, [r0, #0]
     236:	699a      	ldr	r2, [r3, #24]
     238:	f412 7f80 	tst.w	r2, #256	; 0x100
     23c:	d0fa      	beq.n	234 <drv_uart_putchar+0x10>
     23e:	691a      	ldr	r2, [r3, #16]
     240:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     244:	611a      	str	r2, [r3, #16]
     246:	6803      	ldr	r3, [r0, #0]
     248:	2200      	movs	r2, #0
     24a:	611a      	str	r2, [r3, #16]
     24c:	4770      	bx	lr

0000024e <drv_uart_getchar>:
     24e:	b410      	push	{r4}
     250:	e009      	b.n	266 <drv_uart_getchar+0x18>
     252:	69db      	ldr	r3, [r3, #28]
     254:	700b      	strb	r3, [r1, #0]
     256:	2000      	movs	r0, #0
     258:	bc10      	pop	{r4}
     25a:	4770      	bx	lr
     25c:	6803      	ldr	r3, [r0, #0]
     25e:	695a      	ldr	r2, [r3, #20]
     260:	f012 0f1f 	tst.w	r2, #31
     264:	d1f5      	bne.n	252 <drv_uart_getchar+0x4>
     266:	6803      	ldr	r3, [r0, #0]
     268:	699c      	ldr	r4, [r3, #24]
     26a:	691a      	ldr	r2, [r3, #16]
     26c:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     270:	611a      	str	r2, [r3, #16]
     272:	6803      	ldr	r3, [r0, #0]
     274:	2200      	movs	r2, #0
     276:	611a      	str	r2, [r3, #16]
     278:	b2a3      	uxth	r3, r4
     27a:	f014 0f40 	tst.w	r4, #64	; 0x40
     27e:	d001      	beq.n	284 <drv_uart_getchar+0x36>
     280:	2201      	movs	r2, #1
     282:	7402      	strb	r2, [r0, #16]
     284:	f013 0f80 	tst.w	r3, #128	; 0x80
     288:	d001      	beq.n	28e <drv_uart_getchar+0x40>
     28a:	2302      	movs	r3, #2
     28c:	7403      	strb	r3, [r0, #16]
     28e:	7c03      	ldrb	r3, [r0, #16]
     290:	2b00      	cmp	r3, #0
     292:	d0e3      	beq.n	25c <drv_uart_getchar+0xe>
     294:	7a83      	ldrb	r3, [r0, #10]
     296:	2b01      	cmp	r3, #1
     298:	d0e0      	beq.n	25c <drv_uart_getchar+0xe>
     29a:	2300      	movs	r3, #0
     29c:	7403      	strb	r3, [r0, #16]
     29e:	7483      	strb	r3, [r0, #18]
     2a0:	74c3      	strb	r3, [r0, #19]
     2a2:	6804      	ldr	r4, [r0, #0]
     2a4:	6862      	ldr	r2, [r4, #4]
     2a6:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     2aa:	6062      	str	r2, [r4, #4]
     2ac:	6804      	ldr	r4, [r0, #0]
     2ae:	6862      	ldr	r2, [r4, #4]
     2b0:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2b4:	6062      	str	r2, [r4, #4]
     2b6:	6804      	ldr	r4, [r0, #0]
     2b8:	6862      	ldr	r2, [r4, #4]
     2ba:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2be:	6062      	str	r2, [r4, #4]
     2c0:	6804      	ldr	r4, [r0, #0]
     2c2:	6862      	ldr	r2, [r4, #4]
     2c4:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2c8:	6062      	str	r2, [r4, #4]
     2ca:	6804      	ldr	r4, [r0, #0]
     2cc:	6862      	ldr	r2, [r4, #4]
     2ce:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2d2:	6062      	str	r2, [r4, #4]
     2d4:	6804      	ldr	r4, [r0, #0]
     2d6:	6862      	ldr	r2, [r4, #4]
     2d8:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2dc:	6062      	str	r2, [r4, #4]
     2de:	6804      	ldr	r4, [r0, #0]
     2e0:	6862      	ldr	r2, [r4, #4]
     2e2:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2e6:	6062      	str	r2, [r4, #4]
     2e8:	6800      	ldr	r0, [r0, #0]
     2ea:	6842      	ldr	r2, [r0, #4]
     2ec:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2f0:	6042      	str	r2, [r0, #4]
     2f2:	700b      	strb	r3, [r1, #0]
     2f4:	2001      	movs	r0, #1
     2f6:	e7af      	b.n	258 <drv_uart_getchar+0xa>

000002f8 <uart_int_tx_done_callback>:
     2f8:	4770      	bx	lr

000002fa <uart_int_rx_stop_callback>:
     2fa:	4770      	bx	lr

000002fc <uart_int_rx_parity_error_callback>:
     2fc:	4770      	bx	lr

000002fe <uart_int_rx_noise_detect_callback>:
     2fe:	4770      	bx	lr

00000300 <uart_int_rx_stop_detect_callback>:
     300:	4770      	bx	lr

00000302 <uart_int_tx_fifo_empty_callback>:
     302:	4770      	bx	lr

00000304 <uart_int_tx_fifo_thres_callback>:
     304:	4770      	bx	lr

00000306 <uart_int_rx_fifo_noempty_callback>:
     306:	4770      	bx	lr

00000308 <uart_int_rx_fifo_thres_callback>:
     308:	4770      	bx	lr

0000030a <drv_uart_interrupt_handler>:
     30a:	b538      	push	{r3, r4, r5, lr}
     30c:	4604      	mov	r4, r0
     30e:	6803      	ldr	r3, [r0, #0]
     310:	699d      	ldr	r5, [r3, #24]
     312:	68db      	ldr	r3, [r3, #12]
     314:	b29b      	uxth	r3, r3
     316:	401d      	ands	r5, r3
     318:	f415 7f80 	tst.w	r5, #256	; 0x100
     31c:	d144      	bne.n	3a8 <drv_uart_interrupt_handler+0x9e>
     31e:	f015 0f40 	tst.w	r5, #64	; 0x40
     322:	d00f      	beq.n	344 <drv_uart_interrupt_handler+0x3a>
     324:	2301      	movs	r3, #1
     326:	7423      	strb	r3, [r4, #16]
     328:	7aa3      	ldrb	r3, [r4, #10]
     32a:	2b01      	cmp	r3, #1
     32c:	d147      	bne.n	3be <drv_uart_interrupt_handler+0xb4>
     32e:	4620      	mov	r0, r4
     330:	f7ff ffe3 	bl	2fa <uart_int_rx_stop_callback>
     334:	6822      	ldr	r2, [r4, #0]
     336:	6913      	ldr	r3, [r2, #16]
     338:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     33c:	6113      	str	r3, [r2, #16]
     33e:	6823      	ldr	r3, [r4, #0]
     340:	2200      	movs	r2, #0
     342:	611a      	str	r2, [r3, #16]
     344:	f015 0f80 	tst.w	r5, #128	; 0x80
     348:	d00f      	beq.n	36a <drv_uart_interrupt_handler+0x60>
     34a:	2302      	movs	r3, #2
     34c:	7423      	strb	r3, [r4, #16]
     34e:	7aa3      	ldrb	r3, [r4, #10]
     350:	2b01      	cmp	r3, #1
     352:	d166      	bne.n	422 <drv_uart_interrupt_handler+0x118>
     354:	4620      	mov	r0, r4
     356:	f7ff ffd1 	bl	2fc <uart_int_rx_parity_error_callback>
     35a:	6822      	ldr	r2, [r4, #0]
     35c:	6913      	ldr	r3, [r2, #16]
     35e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     362:	6113      	str	r3, [r2, #16]
     364:	6823      	ldr	r3, [r4, #0]
     366:	2200      	movs	r2, #0
     368:	611a      	str	r2, [r3, #16]
     36a:	f015 0f20 	tst.w	r5, #32
     36e:	f040 808a 	bne.w	486 <drv_uart_interrupt_handler+0x17c>
     372:	f015 0f10 	tst.w	r5, #16
     376:	f040 8092 	bne.w	49e <drv_uart_interrupt_handler+0x194>
     37a:	f015 0f01 	tst.w	r5, #1
     37e:	f040 809a 	bne.w	4b6 <drv_uart_interrupt_handler+0x1ac>
     382:	f015 0f02 	tst.w	r5, #2
     386:	f040 80a2 	bne.w	4ce <drv_uart_interrupt_handler+0x1c4>
     38a:	f015 0f04 	tst.w	r5, #4
     38e:	f000 80c1 	beq.w	514 <drv_uart_interrupt_handler+0x20a>
     392:	7ce2      	ldrb	r2, [r4, #19]
     394:	7e23      	ldrb	r3, [r4, #24]
     396:	429a      	cmp	r2, r3
     398:	f0c0 80ac 	bcc.w	4f4 <drv_uart_interrupt_handler+0x1ea>
     39c:	6822      	ldr	r2, [r4, #0]
     39e:	68d3      	ldr	r3, [r2, #12]
     3a0:	f023 030c 	bic.w	r3, r3, #12
     3a4:	60d3      	str	r3, [r2, #12]
     3a6:	e0aa      	b.n	4fe <drv_uart_interrupt_handler+0x1f4>
     3a8:	f7ff ffa6 	bl	2f8 <uart_int_tx_done_callback>
     3ac:	6822      	ldr	r2, [r4, #0]
     3ae:	6913      	ldr	r3, [r2, #16]
     3b0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3b4:	6113      	str	r3, [r2, #16]
     3b6:	6823      	ldr	r3, [r4, #0]
     3b8:	2200      	movs	r2, #0
     3ba:	611a      	str	r2, [r3, #16]
     3bc:	e7af      	b.n	31e <drv_uart_interrupt_handler+0x14>
     3be:	6822      	ldr	r2, [r4, #0]
     3c0:	68d3      	ldr	r3, [r2, #12]
     3c2:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3c6:	60d3      	str	r3, [r2, #12]
     3c8:	2300      	movs	r3, #0
     3ca:	7423      	strb	r3, [r4, #16]
     3cc:	74a3      	strb	r3, [r4, #18]
     3ce:	74e3      	strb	r3, [r4, #19]
     3d0:	6822      	ldr	r2, [r4, #0]
     3d2:	6853      	ldr	r3, [r2, #4]
     3d4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3d8:	6053      	str	r3, [r2, #4]
     3da:	6822      	ldr	r2, [r4, #0]
     3dc:	6853      	ldr	r3, [r2, #4]
     3de:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     3e2:	6053      	str	r3, [r2, #4]
     3e4:	6822      	ldr	r2, [r4, #0]
     3e6:	6853      	ldr	r3, [r2, #4]
     3e8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     3ec:	6053      	str	r3, [r2, #4]
     3ee:	6822      	ldr	r2, [r4, #0]
     3f0:	6853      	ldr	r3, [r2, #4]
     3f2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     3f6:	6053      	str	r3, [r2, #4]
     3f8:	6822      	ldr	r2, [r4, #0]
     3fa:	6853      	ldr	r3, [r2, #4]
     3fc:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     400:	6053      	str	r3, [r2, #4]
     402:	6822      	ldr	r2, [r4, #0]
     404:	6853      	ldr	r3, [r2, #4]
     406:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     40a:	6053      	str	r3, [r2, #4]
     40c:	6822      	ldr	r2, [r4, #0]
     40e:	6853      	ldr	r3, [r2, #4]
     410:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     414:	6053      	str	r3, [r2, #4]
     416:	6822      	ldr	r2, [r4, #0]
     418:	6853      	ldr	r3, [r2, #4]
     41a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     41e:	6053      	str	r3, [r2, #4]
     420:	e785      	b.n	32e <drv_uart_interrupt_handler+0x24>
     422:	6822      	ldr	r2, [r4, #0]
     424:	68d3      	ldr	r3, [r2, #12]
     426:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     42a:	60d3      	str	r3, [r2, #12]
     42c:	2300      	movs	r3, #0
     42e:	7423      	strb	r3, [r4, #16]
     430:	74a3      	strb	r3, [r4, #18]
     432:	74e3      	strb	r3, [r4, #19]
     434:	6822      	ldr	r2, [r4, #0]
     436:	6853      	ldr	r3, [r2, #4]
     438:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     43c:	6053      	str	r3, [r2, #4]
     43e:	6822      	ldr	r2, [r4, #0]
     440:	6853      	ldr	r3, [r2, #4]
     442:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     446:	6053      	str	r3, [r2, #4]
     448:	6822      	ldr	r2, [r4, #0]
     44a:	6853      	ldr	r3, [r2, #4]
     44c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     450:	6053      	str	r3, [r2, #4]
     452:	6822      	ldr	r2, [r4, #0]
     454:	6853      	ldr	r3, [r2, #4]
     456:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     45a:	6053      	str	r3, [r2, #4]
     45c:	6822      	ldr	r2, [r4, #0]
     45e:	6853      	ldr	r3, [r2, #4]
     460:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     464:	6053      	str	r3, [r2, #4]
     466:	6822      	ldr	r2, [r4, #0]
     468:	6853      	ldr	r3, [r2, #4]
     46a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     46e:	6053      	str	r3, [r2, #4]
     470:	6822      	ldr	r2, [r4, #0]
     472:	6853      	ldr	r3, [r2, #4]
     474:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     478:	6053      	str	r3, [r2, #4]
     47a:	6822      	ldr	r2, [r4, #0]
     47c:	6853      	ldr	r3, [r2, #4]
     47e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     482:	6053      	str	r3, [r2, #4]
     484:	e766      	b.n	354 <drv_uart_interrupt_handler+0x4a>
     486:	4620      	mov	r0, r4
     488:	f7ff ff39 	bl	2fe <uart_int_rx_noise_detect_callback>
     48c:	6822      	ldr	r2, [r4, #0]
     48e:	6913      	ldr	r3, [r2, #16]
     490:	f043 0320 	orr.w	r3, r3, #32
     494:	6113      	str	r3, [r2, #16]
     496:	6823      	ldr	r3, [r4, #0]
     498:	2200      	movs	r2, #0
     49a:	611a      	str	r2, [r3, #16]
     49c:	e769      	b.n	372 <drv_uart_interrupt_handler+0x68>
     49e:	4620      	mov	r0, r4
     4a0:	f7ff ff2e 	bl	300 <uart_int_rx_stop_detect_callback>
     4a4:	6822      	ldr	r2, [r4, #0]
     4a6:	6913      	ldr	r3, [r2, #16]
     4a8:	f043 0310 	orr.w	r3, r3, #16
     4ac:	6113      	str	r3, [r2, #16]
     4ae:	6823      	ldr	r3, [r4, #0]
     4b0:	2200      	movs	r2, #0
     4b2:	611a      	str	r2, [r3, #16]
     4b4:	e761      	b.n	37a <drv_uart_interrupt_handler+0x70>
     4b6:	4620      	mov	r0, r4
     4b8:	f7ff ff24 	bl	304 <uart_int_tx_fifo_thres_callback>
     4bc:	6822      	ldr	r2, [r4, #0]
     4be:	6913      	ldr	r3, [r2, #16]
     4c0:	f043 0301 	orr.w	r3, r3, #1
     4c4:	6113      	str	r3, [r2, #16]
     4c6:	6823      	ldr	r3, [r4, #0]
     4c8:	2200      	movs	r2, #0
     4ca:	611a      	str	r2, [r3, #16]
     4cc:	e759      	b.n	382 <drv_uart_interrupt_handler+0x78>
     4ce:	4620      	mov	r0, r4
     4d0:	f7ff ff17 	bl	302 <uart_int_tx_fifo_empty_callback>
     4d4:	6822      	ldr	r2, [r4, #0]
     4d6:	6913      	ldr	r3, [r2, #16]
     4d8:	f043 0302 	orr.w	r3, r3, #2
     4dc:	6113      	str	r3, [r2, #16]
     4de:	6823      	ldr	r3, [r4, #0]
     4e0:	2200      	movs	r2, #0
     4e2:	611a      	str	r2, [r3, #16]
     4e4:	e751      	b.n	38a <drv_uart_interrupt_handler+0x80>
     4e6:	69d9      	ldr	r1, [r3, #28]
     4e8:	6962      	ldr	r2, [r4, #20]
     4ea:	7ce3      	ldrb	r3, [r4, #19]
     4ec:	1c58      	adds	r0, r3, #1
     4ee:	74e0      	strb	r0, [r4, #19]
     4f0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4f4:	6823      	ldr	r3, [r4, #0]
     4f6:	695a      	ldr	r2, [r3, #20]
     4f8:	f012 0f1f 	tst.w	r2, #31
     4fc:	d1f3      	bne.n	4e6 <drv_uart_interrupt_handler+0x1dc>
     4fe:	4620      	mov	r0, r4
     500:	f7ff ff02 	bl	308 <uart_int_rx_fifo_thres_callback>
     504:	6822      	ldr	r2, [r4, #0]
     506:	6913      	ldr	r3, [r2, #16]
     508:	f043 0304 	orr.w	r3, r3, #4
     50c:	6113      	str	r3, [r2, #16]
     50e:	6823      	ldr	r3, [r4, #0]
     510:	2200      	movs	r2, #0
     512:	611a      	str	r2, [r3, #16]
     514:	f015 0f08 	tst.w	r5, #8
     518:	d020      	beq.n	55c <drv_uart_interrupt_handler+0x252>
     51a:	7ce2      	ldrb	r2, [r4, #19]
     51c:	7e23      	ldrb	r3, [r4, #24]
     51e:	429a      	cmp	r2, r3
     520:	d30c      	bcc.n	53c <drv_uart_interrupt_handler+0x232>
     522:	6822      	ldr	r2, [r4, #0]
     524:	68d3      	ldr	r3, [r2, #12]
     526:	f023 030c 	bic.w	r3, r3, #12
     52a:	60d3      	str	r3, [r2, #12]
     52c:	e00b      	b.n	546 <drv_uart_interrupt_handler+0x23c>
     52e:	69d9      	ldr	r1, [r3, #28]
     530:	6962      	ldr	r2, [r4, #20]
     532:	7ce3      	ldrb	r3, [r4, #19]
     534:	1c58      	adds	r0, r3, #1
     536:	74e0      	strb	r0, [r4, #19]
     538:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     53c:	6823      	ldr	r3, [r4, #0]
     53e:	695a      	ldr	r2, [r3, #20]
     540:	f012 0f1f 	tst.w	r2, #31
     544:	d1f3      	bne.n	52e <drv_uart_interrupt_handler+0x224>
     546:	4620      	mov	r0, r4
     548:	f7ff fedd 	bl	306 <uart_int_rx_fifo_noempty_callback>
     54c:	6822      	ldr	r2, [r4, #0]
     54e:	6913      	ldr	r3, [r2, #16]
     550:	f043 0308 	orr.w	r3, r3, #8
     554:	6113      	str	r3, [r2, #16]
     556:	6823      	ldr	r3, [r4, #0]
     558:	2200      	movs	r2, #0
     55a:	611a      	str	r2, [r3, #16]
     55c:	bd38      	pop	{r3, r4, r5, pc}
	...

00000560 <vprintf>:
     560:	b500      	push	{lr}
     562:	b091      	sub	sp, #68	; 0x44
     564:	460a      	mov	r2, r1
     566:	4601      	mov	r1, r0
     568:	4668      	mov	r0, sp
     56a:	f000 f8cb 	bl	704 <vsiprintf>
     56e:	2800      	cmp	r0, #0
     570:	dc05      	bgt.n	57e <vprintf+0x1e>
     572:	4668      	mov	r0, sp
     574:	f000 f8a8 	bl	6c8 <strlen>
     578:	b011      	add	sp, #68	; 0x44
     57a:	f85d fb04 	ldr.w	pc, [sp], #4
     57e:	4668      	mov	r0, sp
     580:	f000 f8a2 	bl	6c8 <strlen>
     584:	b2c2      	uxtb	r2, r0
     586:	4669      	mov	r1, sp
     588:	4801      	ldr	r0, [pc, #4]	; (590 <vprintf+0x30>)
     58a:	f7ff fe29 	bl	1e0 <drv_uart_putchars>
     58e:	e7f0      	b.n	572 <vprintf+0x12>
     590:	00020088 	andeq	r0, r2, r8, lsl #1

00000594 <drv_uart_printf>:
     594:	b40f      	push	{r0, r1, r2, r3}
     596:	b500      	push	{lr}
     598:	b083      	sub	sp, #12
     59a:	a904      	add	r1, sp, #16
     59c:	f851 0b04 	ldr.w	r0, [r1], #4
     5a0:	9101      	str	r1, [sp, #4]
     5a2:	f7ff ffdd 	bl	560 <vprintf>
     5a6:	b003      	add	sp, #12
     5a8:	f85d eb04 	ldr.w	lr, [sp], #4
     5ac:	b004      	add	sp, #16
     5ae:	4770      	bx	lr

000005b0 <NMI_Handler>:
     5b0:	4770      	bx	lr

000005b2 <HardFault_Handler>:
     5b2:	e7fe      	b.n	5b2 <HardFault_Handler>

000005b4 <MemManage_Handler>:
     5b4:	e7fe      	b.n	5b4 <MemManage_Handler>

000005b6 <BusFault_Handler>:
     5b6:	e7fe      	b.n	5b6 <BusFault_Handler>

000005b8 <UsageFault_Handler>:
     5b8:	e7fe      	b.n	5b8 <UsageFault_Handler>

000005ba <SVC_Handler>:
     5ba:	4770      	bx	lr

000005bc <DebugMon_Handler>:
     5bc:	4770      	bx	lr

000005be <PendSV_Handler>:
     5be:	4770      	bx	lr

000005c0 <SysTick_Handler>:
     5c0:	4770      	bx	lr
	...

000005c4 <Uart0_Handler>:
     5c4:	b508      	push	{r3, lr}
     5c6:	4b04      	ldr	r3, [pc, #16]	; (5d8 <Uart0_Handler+0x14>)
     5c8:	2201      	movs	r2, #1
     5ca:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     5ce:	4803      	ldr	r0, [pc, #12]	; (5dc <Uart0_Handler+0x18>)
     5d0:	f7ff fe9b 	bl	30a <drv_uart_interrupt_handler>
     5d4:	bd08      	pop	{r3, pc}
     5d6:	bf00      	nop
     5d8:	e000e100 	and	lr, r0, r0, lsl #2
     5dc:	00020088 	andeq	r0, r2, r8, lsl #1

000005e0 <main>:
     5e0:	b500      	push	{lr}
     5e2:	b083      	sub	sp, #12
     5e4:	4c0d      	ldr	r4, [pc, #52]	; (61c <main+0x3c>)
     5e6:	4b0e      	ldr	r3, [pc, #56]	; (620 <main+0x40>)
     5e8:	6023      	str	r3, [r4, #0]
     5ea:	4620      	mov	r0, r4
     5ec:	f7ff fd7d 	bl	ea <drv_uart_default_config>
     5f0:	4620      	mov	r0, r4
     5f2:	f7ff fdad 	bl	150 <drv_uart_init>
     5f6:	480b      	ldr	r0, [pc, #44]	; (624 <main+0x44>)
     5f8:	f7ff ffcc 	bl	594 <drv_uart_printf>
     5fc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     600:	22ed      	movs	r2, #237	; 0xed
     602:	601a      	str	r2, [r3, #0]
     604:	4c05      	ldr	r4, [pc, #20]	; (61c <main+0x3c>)
     606:	f10d 0107 	add.w	r1, sp, #7
     60a:	4620      	mov	r0, r4
     60c:	f7ff fe1f 	bl	24e <drv_uart_getchar>
     610:	f10d 0107 	add.w	r1, sp, #7
     614:	4620      	mov	r0, r4
     616:	f7ff fe05 	bl	224 <drv_uart_putchar>
     61a:	e7f3      	b.n	604 <main+0x24>
     61c:	00020088 	andeq	r0, r2, r8, lsl #1
     620:	40001000 	andmi	r1, r0, r0
     624:	00001004 	andeq	r1, r0, r4

00000628 <Reset_Handler>:
     628:	490a      	ldr	r1, [pc, #40]	; (654 <Reset_Handler+0x2c>)
     62a:	4a0b      	ldr	r2, [pc, #44]	; (658 <Reset_Handler+0x30>)
     62c:	4b0b      	ldr	r3, [pc, #44]	; (65c <Reset_Handler+0x34>)
     62e:	1a9b      	subs	r3, r3, r2
     630:	dd03      	ble.n	63a <Reset_Handler+0x12>
     632:	3b04      	subs	r3, #4
     634:	58c8      	ldr	r0, [r1, r3]
     636:	50d0      	str	r0, [r2, r3]
     638:	dcfb      	bgt.n	632 <Reset_Handler+0xa>
     63a:	4909      	ldr	r1, [pc, #36]	; (660 <Reset_Handler+0x38>)
     63c:	4a09      	ldr	r2, [pc, #36]	; (664 <Reset_Handler+0x3c>)
     63e:	2000      	movs	r0, #0
     640:	4291      	cmp	r1, r2
     642:	bfbc      	itt	lt
     644:	f841 0b04 	strlt.w	r0, [r1], #4
     648:	e7fa      	blt.n	640 <Reset_Handler+0x18>
     64a:	f7ff ffc9 	bl	5e0 <main>
     64e:	f000 f827 	bl	6a0 <exit>
     652:	106c0000 	rsbne	r0, ip, r0
     656:	00000000 	andeq	r0, r0, r0
     65a:	006c0002 	rsbeq	r0, ip, r2
     65e:	006c0002 	rsbeq	r0, ip, r2
     662:	00b80002 	adcseq	r0, r8, r2
     666:	e7fe0002 	ldrb	r0, [lr, r2]!
     66a:	e7fe      	b.n	66a <Reset_Handler+0x42>
     66c:	e7fe      	b.n	66c <Reset_Handler+0x44>
     66e:	e7fe      	b.n	66e <Reset_Handler+0x46>
     670:	e7fe      	b.n	670 <Reset_Handler+0x48>
     672:	e7fe      	b.n	672 <Reset_Handler+0x4a>
     674:	e7fe      	b.n	674 <Reset_Handler+0x4c>
     676:	e7fe      	b.n	676 <Reset_Handler+0x4e>
     678:	e7fe      	b.n	678 <Reset_Handler+0x50>
     67a:	e7fe      	b.n	67a <Reset_Handler+0x52>

0000067c <Uart1_Handler>:
     67c:	e7fe      	b.n	67c <Uart1_Handler>

0000067e <Resv2_Handler>:
     67e:	e7fe      	b.n	67e <Resv2_Handler>

00000680 <Resv3_Handler>:
     680:	e7fe      	b.n	680 <Resv3_Handler>

00000682 <EthDma_Handler>:
     682:	e7fe      	b.n	682 <EthDma_Handler>

00000684 <Gpioa_Handler>:
     684:	e7fe      	b.n	684 <Gpioa_Handler>

00000686 <Resv6_Handler>:
     686:	e7fe      	b.n	686 <Resv6_Handler>

00000688 <Resv7_Handler>:
     688:	e7fe      	b.n	688 <Resv7_Handler>

0000068a <Bastim_Ch0_Handler>:
     68a:	e7fe      	b.n	68a <Bastim_Ch0_Handler>

0000068c <Bastim_Ch1_Handler>:
     68c:	e7fe      	b.n	68c <Bastim_Ch1_Handler>

0000068e <Bastim_Ch2_Handler>:
     68e:	e7fe      	b.n	68e <Bastim_Ch2_Handler>

00000690 <Bastim_Ch3_Handler>:
     690:	e7fe      	b.n	690 <Bastim_Ch3_Handler>

00000692 <EthSma_Handler>:
     692:	e7fe      	b.n	692 <EthSma_Handler>

00000694 <EthTx_Handler>:
     694:	e7fe      	b.n	694 <EthTx_Handler>

00000696 <EthRx_Handler>:
     696:	e7fe      	b.n	696 <EthRx_Handler>

00000698 <Resv15_Handler>:
     698:	e7fe      	b.n	698 <Resv15_Handler>

0000069a <AdvtimGen_Handler>:
     69a:	e7fe      	b.n	69a <AdvtimGen_Handler>

0000069c <AdvtimCap_Handler>:
     69c:	e7fe      	b.n	69c <AdvtimCap_Handler>
     69e:	bf00      	nop

000006a0 <exit>:
     6a0:	b508      	push	{r3, lr}
     6a2:	4b07      	ldr	r3, [pc, #28]	; (6c0 <exit+0x20>)
     6a4:	4604      	mov	r4, r0
     6a6:	b113      	cbz	r3, 6ae <exit+0xe>
     6a8:	2100      	movs	r1, #0
     6aa:	f3af 8000 	nop.w
     6ae:	4b05      	ldr	r3, [pc, #20]	; (6c4 <exit+0x24>)
     6b0:	6818      	ldr	r0, [r3, #0]
     6b2:	6a83      	ldr	r3, [r0, #40]	; 0x28
     6b4:	b103      	cbz	r3, 6b8 <exit+0x18>
     6b6:	4798      	blx	r3
     6b8:	4620      	mov	r0, r4
     6ba:	f000 fc95 	bl	fe8 <_exit>
     6be:	bf00      	nop
     6c0:	00000000 	andeq	r0, r0, r0
     6c4:	00001030 	andeq	r1, r0, r0, lsr r0

000006c8 <strlen>:
     6c8:	4603      	mov	r3, r0
     6ca:	f813 2b01 	ldrb.w	r2, [r3], #1
     6ce:	2a00      	cmp	r2, #0
     6d0:	d1fb      	bne.n	6ca <strlen+0x2>
     6d2:	1a18      	subs	r0, r3, r0
     6d4:	3801      	subs	r0, #1
     6d6:	4770      	bx	lr

000006d8 <_vsiprintf_r>:
     6d8:	b500      	push	{lr}
     6da:	b09b      	sub	sp, #108	; 0x6c
     6dc:	9100      	str	r1, [sp, #0]
     6de:	9104      	str	r1, [sp, #16]
     6e0:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     6e4:	9105      	str	r1, [sp, #20]
     6e6:	9102      	str	r1, [sp, #8]
     6e8:	4905      	ldr	r1, [pc, #20]	; (700 <_vsiprintf_r+0x28>)
     6ea:	9103      	str	r1, [sp, #12]
     6ec:	4669      	mov	r1, sp
     6ee:	f000 f86f 	bl	7d0 <_svfiprintf_r>
     6f2:	2200      	movs	r2, #0
     6f4:	9b00      	ldr	r3, [sp, #0]
     6f6:	701a      	strb	r2, [r3, #0]
     6f8:	b01b      	add	sp, #108	; 0x6c
     6fa:	f85d fb04 	ldr.w	pc, [sp], #4
     6fe:	bf00      	nop
     700:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

00000704 <vsiprintf>:
     704:	4613      	mov	r3, r2
     706:	460a      	mov	r2, r1
     708:	4601      	mov	r1, r0
     70a:	4802      	ldr	r0, [pc, #8]	; (714 <vsiprintf+0x10>)
     70c:	6800      	ldr	r0, [r0, #0]
     70e:	f7ff bfe3 	b.w	6d8 <_vsiprintf_r>
     712:	bf00      	nop
     714:	00020000 	andeq	r0, r2, r0

00000718 <__ssputs_r>:
     718:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     71c:	688e      	ldr	r6, [r1, #8]
     71e:	4682      	mov	sl, r0
     720:	429e      	cmp	r6, r3
     722:	460c      	mov	r4, r1
     724:	4690      	mov	r8, r2
     726:	461f      	mov	r7, r3
     728:	d838      	bhi.n	79c <__ssputs_r+0x84>
     72a:	898a      	ldrh	r2, [r1, #12]
     72c:	f412 6f90 	tst.w	r2, #1152	; 0x480
     730:	d032      	beq.n	798 <__ssputs_r+0x80>
     732:	6825      	ldr	r5, [r4, #0]
     734:	6909      	ldr	r1, [r1, #16]
     736:	3301      	adds	r3, #1
     738:	eba5 0901 	sub.w	r9, r5, r1
     73c:	6965      	ldr	r5, [r4, #20]
     73e:	444b      	add	r3, r9
     740:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     744:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     748:	106d      	asrs	r5, r5, #1
     74a:	429d      	cmp	r5, r3
     74c:	bf38      	it	cc
     74e:	461d      	movcc	r5, r3
     750:	0553      	lsls	r3, r2, #21
     752:	d531      	bpl.n	7b8 <__ssputs_r+0xa0>
     754:	4629      	mov	r1, r5
     756:	f000 fb6f 	bl	e38 <_malloc_r>
     75a:	4606      	mov	r6, r0
     75c:	b950      	cbnz	r0, 774 <__ssputs_r+0x5c>
     75e:	230c      	movs	r3, #12
     760:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     764:	f8ca 3000 	str.w	r3, [sl]
     768:	89a3      	ldrh	r3, [r4, #12]
     76a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     76e:	81a3      	strh	r3, [r4, #12]
     770:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     774:	464a      	mov	r2, r9
     776:	6921      	ldr	r1, [r4, #16]
     778:	f000 face 	bl	d18 <memcpy>
     77c:	89a3      	ldrh	r3, [r4, #12]
     77e:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     782:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     786:	81a3      	strh	r3, [r4, #12]
     788:	6126      	str	r6, [r4, #16]
     78a:	444e      	add	r6, r9
     78c:	6026      	str	r6, [r4, #0]
     78e:	463e      	mov	r6, r7
     790:	6165      	str	r5, [r4, #20]
     792:	eba5 0509 	sub.w	r5, r5, r9
     796:	60a5      	str	r5, [r4, #8]
     798:	42be      	cmp	r6, r7
     79a:	d900      	bls.n	79e <__ssputs_r+0x86>
     79c:	463e      	mov	r6, r7
     79e:	4632      	mov	r2, r6
     7a0:	4641      	mov	r1, r8
     7a2:	6820      	ldr	r0, [r4, #0]
     7a4:	f000 fac6 	bl	d34 <memmove>
     7a8:	68a3      	ldr	r3, [r4, #8]
     7aa:	2000      	movs	r0, #0
     7ac:	1b9b      	subs	r3, r3, r6
     7ae:	60a3      	str	r3, [r4, #8]
     7b0:	6823      	ldr	r3, [r4, #0]
     7b2:	4433      	add	r3, r6
     7b4:	6023      	str	r3, [r4, #0]
     7b6:	e7db      	b.n	770 <__ssputs_r+0x58>
     7b8:	462a      	mov	r2, r5
     7ba:	f000 fbb1 	bl	f20 <_realloc_r>
     7be:	4606      	mov	r6, r0
     7c0:	2800      	cmp	r0, #0
     7c2:	d1e1      	bne.n	788 <__ssputs_r+0x70>
     7c4:	4650      	mov	r0, sl
     7c6:	6921      	ldr	r1, [r4, #16]
     7c8:	f000 face 	bl	d68 <_free_r>
     7cc:	e7c7      	b.n	75e <__ssputs_r+0x46>
	...

000007d0 <_svfiprintf_r>:
     7d0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7d4:	4698      	mov	r8, r3
     7d6:	898b      	ldrh	r3, [r1, #12]
     7d8:	4607      	mov	r7, r0
     7da:	061b      	lsls	r3, r3, #24
     7dc:	460d      	mov	r5, r1
     7de:	4614      	mov	r4, r2
     7e0:	b09d      	sub	sp, #116	; 0x74
     7e2:	d50e      	bpl.n	802 <_svfiprintf_r+0x32>
     7e4:	690b      	ldr	r3, [r1, #16]
     7e6:	b963      	cbnz	r3, 802 <_svfiprintf_r+0x32>
     7e8:	2140      	movs	r1, #64	; 0x40
     7ea:	f000 fb25 	bl	e38 <_malloc_r>
     7ee:	6028      	str	r0, [r5, #0]
     7f0:	6128      	str	r0, [r5, #16]
     7f2:	b920      	cbnz	r0, 7fe <_svfiprintf_r+0x2e>
     7f4:	230c      	movs	r3, #12
     7f6:	603b      	str	r3, [r7, #0]
     7f8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     7fc:	e0d1      	b.n	9a2 <_svfiprintf_r+0x1d2>
     7fe:	2340      	movs	r3, #64	; 0x40
     800:	616b      	str	r3, [r5, #20]
     802:	2300      	movs	r3, #0
     804:	9309      	str	r3, [sp, #36]	; 0x24
     806:	2320      	movs	r3, #32
     808:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     80c:	2330      	movs	r3, #48	; 0x30
     80e:	f04f 0901 	mov.w	r9, #1
     812:	f8cd 800c 	str.w	r8, [sp, #12]
     816:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 9bc <_svfiprintf_r+0x1ec>
     81a:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     81e:	4623      	mov	r3, r4
     820:	469a      	mov	sl, r3
     822:	f813 2b01 	ldrb.w	r2, [r3], #1
     826:	b10a      	cbz	r2, 82c <_svfiprintf_r+0x5c>
     828:	2a25      	cmp	r2, #37	; 0x25
     82a:	d1f9      	bne.n	820 <_svfiprintf_r+0x50>
     82c:	ebba 0b04 	subs.w	fp, sl, r4
     830:	d00b      	beq.n	84a <_svfiprintf_r+0x7a>
     832:	465b      	mov	r3, fp
     834:	4622      	mov	r2, r4
     836:	4629      	mov	r1, r5
     838:	4638      	mov	r0, r7
     83a:	f7ff ff6d 	bl	718 <__ssputs_r>
     83e:	3001      	adds	r0, #1
     840:	f000 80aa 	beq.w	998 <_svfiprintf_r+0x1c8>
     844:	9a09      	ldr	r2, [sp, #36]	; 0x24
     846:	445a      	add	r2, fp
     848:	9209      	str	r2, [sp, #36]	; 0x24
     84a:	f89a 3000 	ldrb.w	r3, [sl]
     84e:	2b00      	cmp	r3, #0
     850:	f000 80a2 	beq.w	998 <_svfiprintf_r+0x1c8>
     854:	2300      	movs	r3, #0
     856:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     85a:	e9cd 2305 	strd	r2, r3, [sp, #20]
     85e:	f10a 0a01 	add.w	sl, sl, #1
     862:	9304      	str	r3, [sp, #16]
     864:	9307      	str	r3, [sp, #28]
     866:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     86a:	931a      	str	r3, [sp, #104]	; 0x68
     86c:	4654      	mov	r4, sl
     86e:	2205      	movs	r2, #5
     870:	f814 1b01 	ldrb.w	r1, [r4], #1
     874:	4851      	ldr	r0, [pc, #324]	; (9bc <_svfiprintf_r+0x1ec>)
     876:	f000 fa41 	bl	cfc <memchr>
     87a:	9a04      	ldr	r2, [sp, #16]
     87c:	b9d8      	cbnz	r0, 8b6 <_svfiprintf_r+0xe6>
     87e:	06d0      	lsls	r0, r2, #27
     880:	bf44      	itt	mi
     882:	2320      	movmi	r3, #32
     884:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     888:	0711      	lsls	r1, r2, #28
     88a:	bf44      	itt	mi
     88c:	232b      	movmi	r3, #43	; 0x2b
     88e:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     892:	f89a 3000 	ldrb.w	r3, [sl]
     896:	2b2a      	cmp	r3, #42	; 0x2a
     898:	d015      	beq.n	8c6 <_svfiprintf_r+0xf6>
     89a:	4654      	mov	r4, sl
     89c:	2000      	movs	r0, #0
     89e:	f04f 0c0a 	mov.w	ip, #10
     8a2:	9a07      	ldr	r2, [sp, #28]
     8a4:	4621      	mov	r1, r4
     8a6:	f811 3b01 	ldrb.w	r3, [r1], #1
     8aa:	3b30      	subs	r3, #48	; 0x30
     8ac:	2b09      	cmp	r3, #9
     8ae:	d94e      	bls.n	94e <_svfiprintf_r+0x17e>
     8b0:	b1b0      	cbz	r0, 8e0 <_svfiprintf_r+0x110>
     8b2:	9207      	str	r2, [sp, #28]
     8b4:	e014      	b.n	8e0 <_svfiprintf_r+0x110>
     8b6:	eba0 0308 	sub.w	r3, r0, r8
     8ba:	fa09 f303 	lsl.w	r3, r9, r3
     8be:	4313      	orrs	r3, r2
     8c0:	46a2      	mov	sl, r4
     8c2:	9304      	str	r3, [sp, #16]
     8c4:	e7d2      	b.n	86c <_svfiprintf_r+0x9c>
     8c6:	9b03      	ldr	r3, [sp, #12]
     8c8:	1d19      	adds	r1, r3, #4
     8ca:	681b      	ldr	r3, [r3, #0]
     8cc:	9103      	str	r1, [sp, #12]
     8ce:	2b00      	cmp	r3, #0
     8d0:	bfbb      	ittet	lt
     8d2:	425b      	neglt	r3, r3
     8d4:	f042 0202 	orrlt.w	r2, r2, #2
     8d8:	9307      	strge	r3, [sp, #28]
     8da:	9307      	strlt	r3, [sp, #28]
     8dc:	bfb8      	it	lt
     8de:	9204      	strlt	r2, [sp, #16]
     8e0:	7823      	ldrb	r3, [r4, #0]
     8e2:	2b2e      	cmp	r3, #46	; 0x2e
     8e4:	d10c      	bne.n	900 <_svfiprintf_r+0x130>
     8e6:	7863      	ldrb	r3, [r4, #1]
     8e8:	2b2a      	cmp	r3, #42	; 0x2a
     8ea:	d135      	bne.n	958 <_svfiprintf_r+0x188>
     8ec:	9b03      	ldr	r3, [sp, #12]
     8ee:	3402      	adds	r4, #2
     8f0:	1d1a      	adds	r2, r3, #4
     8f2:	681b      	ldr	r3, [r3, #0]
     8f4:	9203      	str	r2, [sp, #12]
     8f6:	2b00      	cmp	r3, #0
     8f8:	bfb8      	it	lt
     8fa:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     8fe:	9305      	str	r3, [sp, #20]
     900:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 9c0 <_svfiprintf_r+0x1f0>
     904:	2203      	movs	r2, #3
     906:	4650      	mov	r0, sl
     908:	7821      	ldrb	r1, [r4, #0]
     90a:	f000 f9f7 	bl	cfc <memchr>
     90e:	b140      	cbz	r0, 922 <_svfiprintf_r+0x152>
     910:	2340      	movs	r3, #64	; 0x40
     912:	eba0 000a 	sub.w	r0, r0, sl
     916:	fa03 f000 	lsl.w	r0, r3, r0
     91a:	9b04      	ldr	r3, [sp, #16]
     91c:	3401      	adds	r4, #1
     91e:	4303      	orrs	r3, r0
     920:	9304      	str	r3, [sp, #16]
     922:	f814 1b01 	ldrb.w	r1, [r4], #1
     926:	2206      	movs	r2, #6
     928:	4826      	ldr	r0, [pc, #152]	; (9c4 <_svfiprintf_r+0x1f4>)
     92a:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     92e:	f000 f9e5 	bl	cfc <memchr>
     932:	2800      	cmp	r0, #0
     934:	d038      	beq.n	9a8 <_svfiprintf_r+0x1d8>
     936:	4b24      	ldr	r3, [pc, #144]	; (9c8 <_svfiprintf_r+0x1f8>)
     938:	bb1b      	cbnz	r3, 982 <_svfiprintf_r+0x1b2>
     93a:	9b03      	ldr	r3, [sp, #12]
     93c:	3307      	adds	r3, #7
     93e:	f023 0307 	bic.w	r3, r3, #7
     942:	3308      	adds	r3, #8
     944:	9303      	str	r3, [sp, #12]
     946:	9b09      	ldr	r3, [sp, #36]	; 0x24
     948:	4433      	add	r3, r6
     94a:	9309      	str	r3, [sp, #36]	; 0x24
     94c:	e767      	b.n	81e <_svfiprintf_r+0x4e>
     94e:	460c      	mov	r4, r1
     950:	2001      	movs	r0, #1
     952:	fb0c 3202 	mla	r2, ip, r2, r3
     956:	e7a5      	b.n	8a4 <_svfiprintf_r+0xd4>
     958:	2300      	movs	r3, #0
     95a:	f04f 0c0a 	mov.w	ip, #10
     95e:	4619      	mov	r1, r3
     960:	3401      	adds	r4, #1
     962:	9305      	str	r3, [sp, #20]
     964:	4620      	mov	r0, r4
     966:	f810 2b01 	ldrb.w	r2, [r0], #1
     96a:	3a30      	subs	r2, #48	; 0x30
     96c:	2a09      	cmp	r2, #9
     96e:	d903      	bls.n	978 <_svfiprintf_r+0x1a8>
     970:	2b00      	cmp	r3, #0
     972:	d0c5      	beq.n	900 <_svfiprintf_r+0x130>
     974:	9105      	str	r1, [sp, #20]
     976:	e7c3      	b.n	900 <_svfiprintf_r+0x130>
     978:	4604      	mov	r4, r0
     97a:	2301      	movs	r3, #1
     97c:	fb0c 2101 	mla	r1, ip, r1, r2
     980:	e7f0      	b.n	964 <_svfiprintf_r+0x194>
     982:	ab03      	add	r3, sp, #12
     984:	9300      	str	r3, [sp, #0]
     986:	462a      	mov	r2, r5
     988:	4638      	mov	r0, r7
     98a:	4b10      	ldr	r3, [pc, #64]	; (9cc <_svfiprintf_r+0x1fc>)
     98c:	a904      	add	r1, sp, #16
     98e:	f3af 8000 	nop.w
     992:	1c42      	adds	r2, r0, #1
     994:	4606      	mov	r6, r0
     996:	d1d6      	bne.n	946 <_svfiprintf_r+0x176>
     998:	89ab      	ldrh	r3, [r5, #12]
     99a:	065b      	lsls	r3, r3, #25
     99c:	f53f af2c 	bmi.w	7f8 <_svfiprintf_r+0x28>
     9a0:	9809      	ldr	r0, [sp, #36]	; 0x24
     9a2:	b01d      	add	sp, #116	; 0x74
     9a4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     9a8:	ab03      	add	r3, sp, #12
     9aa:	9300      	str	r3, [sp, #0]
     9ac:	462a      	mov	r2, r5
     9ae:	4638      	mov	r0, r7
     9b0:	4b06      	ldr	r3, [pc, #24]	; (9cc <_svfiprintf_r+0x1fc>)
     9b2:	a904      	add	r1, sp, #16
     9b4:	f000 f87c 	bl	ab0 <_printf_i>
     9b8:	e7eb      	b.n	992 <_svfiprintf_r+0x1c2>
     9ba:	bf00      	nop
     9bc:	00001034 	andeq	r1, r0, r4, lsr r0
     9c0:	0000103a 	andeq	r1, r0, sl, lsr r0
     9c4:	0000103e 	andeq	r1, r0, lr, lsr r0
     9c8:	00000000 	andeq	r0, r0, r0
     9cc:	00000719 	andeq	r0, r0, r9, lsl r7

000009d0 <_printf_common>:
     9d0:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     9d4:	4616      	mov	r6, r2
     9d6:	4699      	mov	r9, r3
     9d8:	688a      	ldr	r2, [r1, #8]
     9da:	690b      	ldr	r3, [r1, #16]
     9dc:	4607      	mov	r7, r0
     9de:	4293      	cmp	r3, r2
     9e0:	bfb8      	it	lt
     9e2:	4613      	movlt	r3, r2
     9e4:	6033      	str	r3, [r6, #0]
     9e6:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     9ea:	460c      	mov	r4, r1
     9ec:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9f0:	b10a      	cbz	r2, 9f6 <_printf_common+0x26>
     9f2:	3301      	adds	r3, #1
     9f4:	6033      	str	r3, [r6, #0]
     9f6:	6823      	ldr	r3, [r4, #0]
     9f8:	0699      	lsls	r1, r3, #26
     9fa:	bf42      	ittt	mi
     9fc:	6833      	ldrmi	r3, [r6, #0]
     9fe:	3302      	addmi	r3, #2
     a00:	6033      	strmi	r3, [r6, #0]
     a02:	6825      	ldr	r5, [r4, #0]
     a04:	f015 0506 	ands.w	r5, r5, #6
     a08:	d106      	bne.n	a18 <_printf_common+0x48>
     a0a:	f104 0a19 	add.w	sl, r4, #25
     a0e:	68e3      	ldr	r3, [r4, #12]
     a10:	6832      	ldr	r2, [r6, #0]
     a12:	1a9b      	subs	r3, r3, r2
     a14:	42ab      	cmp	r3, r5
     a16:	dc28      	bgt.n	a6a <_printf_common+0x9a>
     a18:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     a1c:	1e13      	subs	r3, r2, #0
     a1e:	6822      	ldr	r2, [r4, #0]
     a20:	bf18      	it	ne
     a22:	2301      	movne	r3, #1
     a24:	0692      	lsls	r2, r2, #26
     a26:	d42d      	bmi.n	a84 <_printf_common+0xb4>
     a28:	4649      	mov	r1, r9
     a2a:	4638      	mov	r0, r7
     a2c:	f104 0243 	add.w	r2, r4, #67	; 0x43
     a30:	47c0      	blx	r8
     a32:	3001      	adds	r0, #1
     a34:	d020      	beq.n	a78 <_printf_common+0xa8>
     a36:	6823      	ldr	r3, [r4, #0]
     a38:	68e5      	ldr	r5, [r4, #12]
     a3a:	f003 0306 	and.w	r3, r3, #6
     a3e:	2b04      	cmp	r3, #4
     a40:	bf18      	it	ne
     a42:	2500      	movne	r5, #0
     a44:	6832      	ldr	r2, [r6, #0]
     a46:	f04f 0600 	mov.w	r6, #0
     a4a:	68a3      	ldr	r3, [r4, #8]
     a4c:	bf08      	it	eq
     a4e:	1aad      	subeq	r5, r5, r2
     a50:	6922      	ldr	r2, [r4, #16]
     a52:	bf08      	it	eq
     a54:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a58:	4293      	cmp	r3, r2
     a5a:	bfc4      	itt	gt
     a5c:	1a9b      	subgt	r3, r3, r2
     a5e:	18ed      	addgt	r5, r5, r3
     a60:	341a      	adds	r4, #26
     a62:	42b5      	cmp	r5, r6
     a64:	d11a      	bne.n	a9c <_printf_common+0xcc>
     a66:	2000      	movs	r0, #0
     a68:	e008      	b.n	a7c <_printf_common+0xac>
     a6a:	2301      	movs	r3, #1
     a6c:	4652      	mov	r2, sl
     a6e:	4649      	mov	r1, r9
     a70:	4638      	mov	r0, r7
     a72:	47c0      	blx	r8
     a74:	3001      	adds	r0, #1
     a76:	d103      	bne.n	a80 <_printf_common+0xb0>
     a78:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a7c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a80:	3501      	adds	r5, #1
     a82:	e7c4      	b.n	a0e <_printf_common+0x3e>
     a84:	2030      	movs	r0, #48	; 0x30
     a86:	18e1      	adds	r1, r4, r3
     a88:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a8c:	1c5a      	adds	r2, r3, #1
     a8e:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a92:	4422      	add	r2, r4
     a94:	3302      	adds	r3, #2
     a96:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     a9a:	e7c5      	b.n	a28 <_printf_common+0x58>
     a9c:	2301      	movs	r3, #1
     a9e:	4622      	mov	r2, r4
     aa0:	4649      	mov	r1, r9
     aa2:	4638      	mov	r0, r7
     aa4:	47c0      	blx	r8
     aa6:	3001      	adds	r0, #1
     aa8:	d0e6      	beq.n	a78 <_printf_common+0xa8>
     aaa:	3601      	adds	r6, #1
     aac:	e7d9      	b.n	a62 <_printf_common+0x92>
	...

00000ab0 <_printf_i>:
     ab0:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     ab4:	7e0f      	ldrb	r7, [r1, #24]
     ab6:	4691      	mov	r9, r2
     ab8:	2f78      	cmp	r7, #120	; 0x78
     aba:	4680      	mov	r8, r0
     abc:	460c      	mov	r4, r1
     abe:	469a      	mov	sl, r3
     ac0:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     ac2:	f101 0243 	add.w	r2, r1, #67	; 0x43
     ac6:	d807      	bhi.n	ad8 <_printf_i+0x28>
     ac8:	2f62      	cmp	r7, #98	; 0x62
     aca:	d80a      	bhi.n	ae2 <_printf_i+0x32>
     acc:	2f00      	cmp	r7, #0
     ace:	f000 80d9 	beq.w	c84 <_printf_i+0x1d4>
     ad2:	2f58      	cmp	r7, #88	; 0x58
     ad4:	f000 80a4 	beq.w	c20 <_printf_i+0x170>
     ad8:	f104 0542 	add.w	r5, r4, #66	; 0x42
     adc:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     ae0:	e03a      	b.n	b58 <_printf_i+0xa8>
     ae2:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     ae6:	2b15      	cmp	r3, #21
     ae8:	d8f6      	bhi.n	ad8 <_printf_i+0x28>
     aea:	a101      	add	r1, pc, #4	; (adr r1, af0 <_printf_i+0x40>)
     aec:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     af0:	00000b49 	andeq	r0, r0, r9, asr #22
     af4:	00000b5d 	andeq	r0, r0, sp, asr fp
     af8:	00000ad9 	ldrdeq	r0, [r0], -r9
     afc:	00000ad9 	ldrdeq	r0, [r0], -r9
     b00:	00000ad9 	ldrdeq	r0, [r0], -r9
     b04:	00000ad9 	ldrdeq	r0, [r0], -r9
     b08:	00000b5d 	andeq	r0, r0, sp, asr fp
     b0c:	00000ad9 	ldrdeq	r0, [r0], -r9
     b10:	00000ad9 	ldrdeq	r0, [r0], -r9
     b14:	00000ad9 	ldrdeq	r0, [r0], -r9
     b18:	00000ad9 	ldrdeq	r0, [r0], -r9
     b1c:	00000c6b 	andeq	r0, r0, fp, ror #24
     b20:	00000b8d 	andeq	r0, r0, sp, lsl #23
     b24:	00000c4d 	andeq	r0, r0, sp, asr #24
     b28:	00000ad9 	ldrdeq	r0, [r0], -r9
     b2c:	00000ad9 	ldrdeq	r0, [r0], -r9
     b30:	00000c8d 	andeq	r0, r0, sp, lsl #25
     b34:	00000ad9 	ldrdeq	r0, [r0], -r9
     b38:	00000b8d 	andeq	r0, r0, sp, lsl #23
     b3c:	00000ad9 	ldrdeq	r0, [r0], -r9
     b40:	00000ad9 	ldrdeq	r0, [r0], -r9
     b44:	00000c55 	andeq	r0, r0, r5, asr ip
     b48:	682b      	ldr	r3, [r5, #0]
     b4a:	1d1a      	adds	r2, r3, #4
     b4c:	681b      	ldr	r3, [r3, #0]
     b4e:	602a      	str	r2, [r5, #0]
     b50:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b54:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b58:	2301      	movs	r3, #1
     b5a:	e0a4      	b.n	ca6 <_printf_i+0x1f6>
     b5c:	6820      	ldr	r0, [r4, #0]
     b5e:	6829      	ldr	r1, [r5, #0]
     b60:	0606      	lsls	r6, r0, #24
     b62:	f101 0304 	add.w	r3, r1, #4
     b66:	d50a      	bpl.n	b7e <_printf_i+0xce>
     b68:	680e      	ldr	r6, [r1, #0]
     b6a:	602b      	str	r3, [r5, #0]
     b6c:	2e00      	cmp	r6, #0
     b6e:	da03      	bge.n	b78 <_printf_i+0xc8>
     b70:	232d      	movs	r3, #45	; 0x2d
     b72:	4276      	negs	r6, r6
     b74:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b78:	230a      	movs	r3, #10
     b7a:	485e      	ldr	r0, [pc, #376]	; (cf4 <_printf_i+0x244>)
     b7c:	e019      	b.n	bb2 <_printf_i+0x102>
     b7e:	680e      	ldr	r6, [r1, #0]
     b80:	f010 0f40 	tst.w	r0, #64	; 0x40
     b84:	602b      	str	r3, [r5, #0]
     b86:	bf18      	it	ne
     b88:	b236      	sxthne	r6, r6
     b8a:	e7ef      	b.n	b6c <_printf_i+0xbc>
     b8c:	682b      	ldr	r3, [r5, #0]
     b8e:	6820      	ldr	r0, [r4, #0]
     b90:	1d19      	adds	r1, r3, #4
     b92:	6029      	str	r1, [r5, #0]
     b94:	0601      	lsls	r1, r0, #24
     b96:	d501      	bpl.n	b9c <_printf_i+0xec>
     b98:	681e      	ldr	r6, [r3, #0]
     b9a:	e002      	b.n	ba2 <_printf_i+0xf2>
     b9c:	0646      	lsls	r6, r0, #25
     b9e:	d5fb      	bpl.n	b98 <_printf_i+0xe8>
     ba0:	881e      	ldrh	r6, [r3, #0]
     ba2:	2f6f      	cmp	r7, #111	; 0x6f
     ba4:	bf0c      	ite	eq
     ba6:	2308      	moveq	r3, #8
     ba8:	230a      	movne	r3, #10
     baa:	4852      	ldr	r0, [pc, #328]	; (cf4 <_printf_i+0x244>)
     bac:	2100      	movs	r1, #0
     bae:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     bb2:	6865      	ldr	r5, [r4, #4]
     bb4:	2d00      	cmp	r5, #0
     bb6:	bfa8      	it	ge
     bb8:	6821      	ldrge	r1, [r4, #0]
     bba:	60a5      	str	r5, [r4, #8]
     bbc:	bfa4      	itt	ge
     bbe:	f021 0104 	bicge.w	r1, r1, #4
     bc2:	6021      	strge	r1, [r4, #0]
     bc4:	b90e      	cbnz	r6, bca <_printf_i+0x11a>
     bc6:	2d00      	cmp	r5, #0
     bc8:	d04d      	beq.n	c66 <_printf_i+0x1b6>
     bca:	4615      	mov	r5, r2
     bcc:	fbb6 f1f3 	udiv	r1, r6, r3
     bd0:	fb03 6711 	mls	r7, r3, r1, r6
     bd4:	5dc7      	ldrb	r7, [r0, r7]
     bd6:	f805 7d01 	strb.w	r7, [r5, #-1]!
     bda:	4637      	mov	r7, r6
     bdc:	42bb      	cmp	r3, r7
     bde:	460e      	mov	r6, r1
     be0:	d9f4      	bls.n	bcc <_printf_i+0x11c>
     be2:	2b08      	cmp	r3, #8
     be4:	d10b      	bne.n	bfe <_printf_i+0x14e>
     be6:	6823      	ldr	r3, [r4, #0]
     be8:	07de      	lsls	r6, r3, #31
     bea:	d508      	bpl.n	bfe <_printf_i+0x14e>
     bec:	6923      	ldr	r3, [r4, #16]
     bee:	6861      	ldr	r1, [r4, #4]
     bf0:	4299      	cmp	r1, r3
     bf2:	bfde      	ittt	le
     bf4:	2330      	movle	r3, #48	; 0x30
     bf6:	f805 3c01 	strble.w	r3, [r5, #-1]
     bfa:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     bfe:	1b52      	subs	r2, r2, r5
     c00:	6122      	str	r2, [r4, #16]
     c02:	464b      	mov	r3, r9
     c04:	4621      	mov	r1, r4
     c06:	4640      	mov	r0, r8
     c08:	f8cd a000 	str.w	sl, [sp]
     c0c:	aa03      	add	r2, sp, #12
     c0e:	f7ff fedf 	bl	9d0 <_printf_common>
     c12:	3001      	adds	r0, #1
     c14:	d14c      	bne.n	cb0 <_printf_i+0x200>
     c16:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     c1a:	b004      	add	sp, #16
     c1c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     c20:	4834      	ldr	r0, [pc, #208]	; (cf4 <_printf_i+0x244>)
     c22:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     c26:	6829      	ldr	r1, [r5, #0]
     c28:	6823      	ldr	r3, [r4, #0]
     c2a:	f851 6b04 	ldr.w	r6, [r1], #4
     c2e:	6029      	str	r1, [r5, #0]
     c30:	061d      	lsls	r5, r3, #24
     c32:	d514      	bpl.n	c5e <_printf_i+0x1ae>
     c34:	07df      	lsls	r7, r3, #31
     c36:	bf44      	itt	mi
     c38:	f043 0320 	orrmi.w	r3, r3, #32
     c3c:	6023      	strmi	r3, [r4, #0]
     c3e:	b91e      	cbnz	r6, c48 <_printf_i+0x198>
     c40:	6823      	ldr	r3, [r4, #0]
     c42:	f023 0320 	bic.w	r3, r3, #32
     c46:	6023      	str	r3, [r4, #0]
     c48:	2310      	movs	r3, #16
     c4a:	e7af      	b.n	bac <_printf_i+0xfc>
     c4c:	6823      	ldr	r3, [r4, #0]
     c4e:	f043 0320 	orr.w	r3, r3, #32
     c52:	6023      	str	r3, [r4, #0]
     c54:	2378      	movs	r3, #120	; 0x78
     c56:	4828      	ldr	r0, [pc, #160]	; (cf8 <_printf_i+0x248>)
     c58:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c5c:	e7e3      	b.n	c26 <_printf_i+0x176>
     c5e:	0659      	lsls	r1, r3, #25
     c60:	bf48      	it	mi
     c62:	b2b6      	uxthmi	r6, r6
     c64:	e7e6      	b.n	c34 <_printf_i+0x184>
     c66:	4615      	mov	r5, r2
     c68:	e7bb      	b.n	be2 <_printf_i+0x132>
     c6a:	682b      	ldr	r3, [r5, #0]
     c6c:	6826      	ldr	r6, [r4, #0]
     c6e:	1d18      	adds	r0, r3, #4
     c70:	6961      	ldr	r1, [r4, #20]
     c72:	6028      	str	r0, [r5, #0]
     c74:	0635      	lsls	r5, r6, #24
     c76:	681b      	ldr	r3, [r3, #0]
     c78:	d501      	bpl.n	c7e <_printf_i+0x1ce>
     c7a:	6019      	str	r1, [r3, #0]
     c7c:	e002      	b.n	c84 <_printf_i+0x1d4>
     c7e:	0670      	lsls	r0, r6, #25
     c80:	d5fb      	bpl.n	c7a <_printf_i+0x1ca>
     c82:	8019      	strh	r1, [r3, #0]
     c84:	2300      	movs	r3, #0
     c86:	4615      	mov	r5, r2
     c88:	6123      	str	r3, [r4, #16]
     c8a:	e7ba      	b.n	c02 <_printf_i+0x152>
     c8c:	682b      	ldr	r3, [r5, #0]
     c8e:	2100      	movs	r1, #0
     c90:	1d1a      	adds	r2, r3, #4
     c92:	602a      	str	r2, [r5, #0]
     c94:	681d      	ldr	r5, [r3, #0]
     c96:	6862      	ldr	r2, [r4, #4]
     c98:	4628      	mov	r0, r5
     c9a:	f000 f82f 	bl	cfc <memchr>
     c9e:	b108      	cbz	r0, ca4 <_printf_i+0x1f4>
     ca0:	1b40      	subs	r0, r0, r5
     ca2:	6060      	str	r0, [r4, #4]
     ca4:	6863      	ldr	r3, [r4, #4]
     ca6:	6123      	str	r3, [r4, #16]
     ca8:	2300      	movs	r3, #0
     caa:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     cae:	e7a8      	b.n	c02 <_printf_i+0x152>
     cb0:	462a      	mov	r2, r5
     cb2:	4649      	mov	r1, r9
     cb4:	4640      	mov	r0, r8
     cb6:	6923      	ldr	r3, [r4, #16]
     cb8:	47d0      	blx	sl
     cba:	3001      	adds	r0, #1
     cbc:	d0ab      	beq.n	c16 <_printf_i+0x166>
     cbe:	6823      	ldr	r3, [r4, #0]
     cc0:	079b      	lsls	r3, r3, #30
     cc2:	d413      	bmi.n	cec <_printf_i+0x23c>
     cc4:	68e0      	ldr	r0, [r4, #12]
     cc6:	9b03      	ldr	r3, [sp, #12]
     cc8:	4298      	cmp	r0, r3
     cca:	bfb8      	it	lt
     ccc:	4618      	movlt	r0, r3
     cce:	e7a4      	b.n	c1a <_printf_i+0x16a>
     cd0:	2301      	movs	r3, #1
     cd2:	4632      	mov	r2, r6
     cd4:	4649      	mov	r1, r9
     cd6:	4640      	mov	r0, r8
     cd8:	47d0      	blx	sl
     cda:	3001      	adds	r0, #1
     cdc:	d09b      	beq.n	c16 <_printf_i+0x166>
     cde:	3501      	adds	r5, #1
     ce0:	68e3      	ldr	r3, [r4, #12]
     ce2:	9903      	ldr	r1, [sp, #12]
     ce4:	1a5b      	subs	r3, r3, r1
     ce6:	42ab      	cmp	r3, r5
     ce8:	dcf2      	bgt.n	cd0 <_printf_i+0x220>
     cea:	e7eb      	b.n	cc4 <_printf_i+0x214>
     cec:	2500      	movs	r5, #0
     cee:	f104 0619 	add.w	r6, r4, #25
     cf2:	e7f5      	b.n	ce0 <_printf_i+0x230>
     cf4:	00001045 	andeq	r1, r0, r5, asr #32
     cf8:	00001056 	andeq	r1, r0, r6, asr r0

00000cfc <memchr>:
     cfc:	4603      	mov	r3, r0
     cfe:	b510      	push	{r4, lr}
     d00:	b2c9      	uxtb	r1, r1
     d02:	4402      	add	r2, r0
     d04:	4293      	cmp	r3, r2
     d06:	4618      	mov	r0, r3
     d08:	d101      	bne.n	d0e <memchr+0x12>
     d0a:	2000      	movs	r0, #0
     d0c:	e003      	b.n	d16 <memchr+0x1a>
     d0e:	7804      	ldrb	r4, [r0, #0]
     d10:	3301      	adds	r3, #1
     d12:	428c      	cmp	r4, r1
     d14:	d1f6      	bne.n	d04 <memchr+0x8>
     d16:	bd10      	pop	{r4, pc}

00000d18 <memcpy>:
     d18:	440a      	add	r2, r1
     d1a:	4291      	cmp	r1, r2
     d1c:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     d20:	d100      	bne.n	d24 <memcpy+0xc>
     d22:	4770      	bx	lr
     d24:	b510      	push	{r4, lr}
     d26:	f811 4b01 	ldrb.w	r4, [r1], #1
     d2a:	4291      	cmp	r1, r2
     d2c:	f803 4f01 	strb.w	r4, [r3, #1]!
     d30:	d1f9      	bne.n	d26 <memcpy+0xe>
     d32:	bd10      	pop	{r4, pc}

00000d34 <memmove>:
     d34:	4288      	cmp	r0, r1
     d36:	b510      	push	{r4, lr}
     d38:	eb01 0402 	add.w	r4, r1, r2
     d3c:	d902      	bls.n	d44 <memmove+0x10>
     d3e:	4284      	cmp	r4, r0
     d40:	4623      	mov	r3, r4
     d42:	d807      	bhi.n	d54 <memmove+0x20>
     d44:	1e43      	subs	r3, r0, #1
     d46:	42a1      	cmp	r1, r4
     d48:	d008      	beq.n	d5c <memmove+0x28>
     d4a:	f811 2b01 	ldrb.w	r2, [r1], #1
     d4e:	f803 2f01 	strb.w	r2, [r3, #1]!
     d52:	e7f8      	b.n	d46 <memmove+0x12>
     d54:	4601      	mov	r1, r0
     d56:	4402      	add	r2, r0
     d58:	428a      	cmp	r2, r1
     d5a:	d100      	bne.n	d5e <memmove+0x2a>
     d5c:	bd10      	pop	{r4, pc}
     d5e:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d62:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d66:	e7f7      	b.n	d58 <memmove+0x24>

00000d68 <_free_r>:
     d68:	b538      	push	{r3, r4, r5, lr}
     d6a:	4605      	mov	r5, r0
     d6c:	2900      	cmp	r1, #0
     d6e:	d040      	beq.n	df2 <_free_r+0x8a>
     d70:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d74:	1f0c      	subs	r4, r1, #4
     d76:	2b00      	cmp	r3, #0
     d78:	bfb8      	it	lt
     d7a:	18e4      	addlt	r4, r4, r3
     d7c:	f000 f910 	bl	fa0 <__malloc_lock>
     d80:	4a1c      	ldr	r2, [pc, #112]	; (df4 <_free_r+0x8c>)
     d82:	6813      	ldr	r3, [r2, #0]
     d84:	b933      	cbnz	r3, d94 <_free_r+0x2c>
     d86:	6063      	str	r3, [r4, #4]
     d88:	6014      	str	r4, [r2, #0]
     d8a:	4628      	mov	r0, r5
     d8c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d90:	f000 b90c 	b.w	fac <__malloc_unlock>
     d94:	42a3      	cmp	r3, r4
     d96:	d908      	bls.n	daa <_free_r+0x42>
     d98:	6820      	ldr	r0, [r4, #0]
     d9a:	1821      	adds	r1, r4, r0
     d9c:	428b      	cmp	r3, r1
     d9e:	bf01      	itttt	eq
     da0:	6819      	ldreq	r1, [r3, #0]
     da2:	685b      	ldreq	r3, [r3, #4]
     da4:	1809      	addeq	r1, r1, r0
     da6:	6021      	streq	r1, [r4, #0]
     da8:	e7ed      	b.n	d86 <_free_r+0x1e>
     daa:	461a      	mov	r2, r3
     dac:	685b      	ldr	r3, [r3, #4]
     dae:	b10b      	cbz	r3, db4 <_free_r+0x4c>
     db0:	42a3      	cmp	r3, r4
     db2:	d9fa      	bls.n	daa <_free_r+0x42>
     db4:	6811      	ldr	r1, [r2, #0]
     db6:	1850      	adds	r0, r2, r1
     db8:	42a0      	cmp	r0, r4
     dba:	d10b      	bne.n	dd4 <_free_r+0x6c>
     dbc:	6820      	ldr	r0, [r4, #0]
     dbe:	4401      	add	r1, r0
     dc0:	1850      	adds	r0, r2, r1
     dc2:	4283      	cmp	r3, r0
     dc4:	6011      	str	r1, [r2, #0]
     dc6:	d1e0      	bne.n	d8a <_free_r+0x22>
     dc8:	6818      	ldr	r0, [r3, #0]
     dca:	685b      	ldr	r3, [r3, #4]
     dcc:	4401      	add	r1, r0
     dce:	6011      	str	r1, [r2, #0]
     dd0:	6053      	str	r3, [r2, #4]
     dd2:	e7da      	b.n	d8a <_free_r+0x22>
     dd4:	d902      	bls.n	ddc <_free_r+0x74>
     dd6:	230c      	movs	r3, #12
     dd8:	602b      	str	r3, [r5, #0]
     dda:	e7d6      	b.n	d8a <_free_r+0x22>
     ddc:	6820      	ldr	r0, [r4, #0]
     dde:	1821      	adds	r1, r4, r0
     de0:	428b      	cmp	r3, r1
     de2:	bf01      	itttt	eq
     de4:	6819      	ldreq	r1, [r3, #0]
     de6:	685b      	ldreq	r3, [r3, #4]
     de8:	1809      	addeq	r1, r1, r0
     dea:	6021      	streq	r1, [r4, #0]
     dec:	6063      	str	r3, [r4, #4]
     dee:	6054      	str	r4, [r2, #4]
     df0:	e7cb      	b.n	d8a <_free_r+0x22>
     df2:	bd38      	pop	{r3, r4, r5, pc}
     df4:	000200a4 	andeq	r0, r2, r4, lsr #1

00000df8 <sbrk_aligned>:
     df8:	b570      	push	{r4, r5, r6, lr}
     dfa:	4e0e      	ldr	r6, [pc, #56]	; (e34 <sbrk_aligned+0x3c>)
     dfc:	460c      	mov	r4, r1
     dfe:	6831      	ldr	r1, [r6, #0]
     e00:	4605      	mov	r5, r0
     e02:	b911      	cbnz	r1, e0a <sbrk_aligned+0x12>
     e04:	f000 f8bc 	bl	f80 <_sbrk_r>
     e08:	6030      	str	r0, [r6, #0]
     e0a:	4621      	mov	r1, r4
     e0c:	4628      	mov	r0, r5
     e0e:	f000 f8b7 	bl	f80 <_sbrk_r>
     e12:	1c43      	adds	r3, r0, #1
     e14:	d00a      	beq.n	e2c <sbrk_aligned+0x34>
     e16:	1cc4      	adds	r4, r0, #3
     e18:	f024 0403 	bic.w	r4, r4, #3
     e1c:	42a0      	cmp	r0, r4
     e1e:	d007      	beq.n	e30 <sbrk_aligned+0x38>
     e20:	1a21      	subs	r1, r4, r0
     e22:	4628      	mov	r0, r5
     e24:	f000 f8ac 	bl	f80 <_sbrk_r>
     e28:	3001      	adds	r0, #1
     e2a:	d101      	bne.n	e30 <sbrk_aligned+0x38>
     e2c:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     e30:	4620      	mov	r0, r4
     e32:	bd70      	pop	{r4, r5, r6, pc}
     e34:	000200a8 	andeq	r0, r2, r8, lsr #1

00000e38 <_malloc_r>:
     e38:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     e3c:	1ccd      	adds	r5, r1, #3
     e3e:	f025 0503 	bic.w	r5, r5, #3
     e42:	3508      	adds	r5, #8
     e44:	2d0c      	cmp	r5, #12
     e46:	bf38      	it	cc
     e48:	250c      	movcc	r5, #12
     e4a:	2d00      	cmp	r5, #0
     e4c:	4607      	mov	r7, r0
     e4e:	db01      	blt.n	e54 <_malloc_r+0x1c>
     e50:	42a9      	cmp	r1, r5
     e52:	d905      	bls.n	e60 <_malloc_r+0x28>
     e54:	230c      	movs	r3, #12
     e56:	2600      	movs	r6, #0
     e58:	603b      	str	r3, [r7, #0]
     e5a:	4630      	mov	r0, r6
     e5c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e60:	4e2e      	ldr	r6, [pc, #184]	; (f1c <_malloc_r+0xe4>)
     e62:	f000 f89d 	bl	fa0 <__malloc_lock>
     e66:	6833      	ldr	r3, [r6, #0]
     e68:	461c      	mov	r4, r3
     e6a:	bb34      	cbnz	r4, eba <_malloc_r+0x82>
     e6c:	4629      	mov	r1, r5
     e6e:	4638      	mov	r0, r7
     e70:	f7ff ffc2 	bl	df8 <sbrk_aligned>
     e74:	1c43      	adds	r3, r0, #1
     e76:	4604      	mov	r4, r0
     e78:	d14d      	bne.n	f16 <_malloc_r+0xde>
     e7a:	6834      	ldr	r4, [r6, #0]
     e7c:	4626      	mov	r6, r4
     e7e:	2e00      	cmp	r6, #0
     e80:	d140      	bne.n	f04 <_malloc_r+0xcc>
     e82:	6823      	ldr	r3, [r4, #0]
     e84:	4631      	mov	r1, r6
     e86:	4638      	mov	r0, r7
     e88:	eb04 0803 	add.w	r8, r4, r3
     e8c:	f000 f878 	bl	f80 <_sbrk_r>
     e90:	4580      	cmp	r8, r0
     e92:	d13a      	bne.n	f0a <_malloc_r+0xd2>
     e94:	6821      	ldr	r1, [r4, #0]
     e96:	3503      	adds	r5, #3
     e98:	1a6d      	subs	r5, r5, r1
     e9a:	f025 0503 	bic.w	r5, r5, #3
     e9e:	3508      	adds	r5, #8
     ea0:	2d0c      	cmp	r5, #12
     ea2:	bf38      	it	cc
     ea4:	250c      	movcc	r5, #12
     ea6:	4638      	mov	r0, r7
     ea8:	4629      	mov	r1, r5
     eaa:	f7ff ffa5 	bl	df8 <sbrk_aligned>
     eae:	3001      	adds	r0, #1
     eb0:	d02b      	beq.n	f0a <_malloc_r+0xd2>
     eb2:	6823      	ldr	r3, [r4, #0]
     eb4:	442b      	add	r3, r5
     eb6:	6023      	str	r3, [r4, #0]
     eb8:	e00e      	b.n	ed8 <_malloc_r+0xa0>
     eba:	6822      	ldr	r2, [r4, #0]
     ebc:	1b52      	subs	r2, r2, r5
     ebe:	d41e      	bmi.n	efe <_malloc_r+0xc6>
     ec0:	2a0b      	cmp	r2, #11
     ec2:	d916      	bls.n	ef2 <_malloc_r+0xba>
     ec4:	1961      	adds	r1, r4, r5
     ec6:	42a3      	cmp	r3, r4
     ec8:	6025      	str	r5, [r4, #0]
     eca:	bf18      	it	ne
     ecc:	6059      	strne	r1, [r3, #4]
     ece:	6863      	ldr	r3, [r4, #4]
     ed0:	bf08      	it	eq
     ed2:	6031      	streq	r1, [r6, #0]
     ed4:	5162      	str	r2, [r4, r5]
     ed6:	604b      	str	r3, [r1, #4]
     ed8:	4638      	mov	r0, r7
     eda:	f104 060b 	add.w	r6, r4, #11
     ede:	f000 f865 	bl	fac <__malloc_unlock>
     ee2:	f026 0607 	bic.w	r6, r6, #7
     ee6:	1d23      	adds	r3, r4, #4
     ee8:	1af2      	subs	r2, r6, r3
     eea:	d0b6      	beq.n	e5a <_malloc_r+0x22>
     eec:	1b9b      	subs	r3, r3, r6
     eee:	50a3      	str	r3, [r4, r2]
     ef0:	e7b3      	b.n	e5a <_malloc_r+0x22>
     ef2:	6862      	ldr	r2, [r4, #4]
     ef4:	42a3      	cmp	r3, r4
     ef6:	bf0c      	ite	eq
     ef8:	6032      	streq	r2, [r6, #0]
     efa:	605a      	strne	r2, [r3, #4]
     efc:	e7ec      	b.n	ed8 <_malloc_r+0xa0>
     efe:	4623      	mov	r3, r4
     f00:	6864      	ldr	r4, [r4, #4]
     f02:	e7b2      	b.n	e6a <_malloc_r+0x32>
     f04:	4634      	mov	r4, r6
     f06:	6876      	ldr	r6, [r6, #4]
     f08:	e7b9      	b.n	e7e <_malloc_r+0x46>
     f0a:	230c      	movs	r3, #12
     f0c:	4638      	mov	r0, r7
     f0e:	603b      	str	r3, [r7, #0]
     f10:	f000 f84c 	bl	fac <__malloc_unlock>
     f14:	e7a1      	b.n	e5a <_malloc_r+0x22>
     f16:	6025      	str	r5, [r4, #0]
     f18:	e7de      	b.n	ed8 <_malloc_r+0xa0>
     f1a:	bf00      	nop
     f1c:	000200a4 	andeq	r0, r2, r4, lsr #1

00000f20 <_realloc_r>:
     f20:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     f24:	4680      	mov	r8, r0
     f26:	4614      	mov	r4, r2
     f28:	460e      	mov	r6, r1
     f2a:	b921      	cbnz	r1, f36 <_realloc_r+0x16>
     f2c:	4611      	mov	r1, r2
     f2e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     f32:	f7ff bf81 	b.w	e38 <_malloc_r>
     f36:	b92a      	cbnz	r2, f44 <_realloc_r+0x24>
     f38:	f7ff ff16 	bl	d68 <_free_r>
     f3c:	4625      	mov	r5, r4
     f3e:	4628      	mov	r0, r5
     f40:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f44:	f000 f838 	bl	fb8 <_malloc_usable_size_r>
     f48:	4284      	cmp	r4, r0
     f4a:	4607      	mov	r7, r0
     f4c:	d802      	bhi.n	f54 <_realloc_r+0x34>
     f4e:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f52:	d812      	bhi.n	f7a <_realloc_r+0x5a>
     f54:	4621      	mov	r1, r4
     f56:	4640      	mov	r0, r8
     f58:	f7ff ff6e 	bl	e38 <_malloc_r>
     f5c:	4605      	mov	r5, r0
     f5e:	2800      	cmp	r0, #0
     f60:	d0ed      	beq.n	f3e <_realloc_r+0x1e>
     f62:	42bc      	cmp	r4, r7
     f64:	4622      	mov	r2, r4
     f66:	4631      	mov	r1, r6
     f68:	bf28      	it	cs
     f6a:	463a      	movcs	r2, r7
     f6c:	f7ff fed4 	bl	d18 <memcpy>
     f70:	4631      	mov	r1, r6
     f72:	4640      	mov	r0, r8
     f74:	f7ff fef8 	bl	d68 <_free_r>
     f78:	e7e1      	b.n	f3e <_realloc_r+0x1e>
     f7a:	4635      	mov	r5, r6
     f7c:	e7df      	b.n	f3e <_realloc_r+0x1e>
	...

00000f80 <_sbrk_r>:
     f80:	b538      	push	{r3, r4, r5, lr}
     f82:	2300      	movs	r3, #0
     f84:	4d05      	ldr	r5, [pc, #20]	; (f9c <_sbrk_r+0x1c>)
     f86:	4604      	mov	r4, r0
     f88:	4608      	mov	r0, r1
     f8a:	602b      	str	r3, [r5, #0]
     f8c:	f000 f81e 	bl	fcc <_sbrk>
     f90:	1c43      	adds	r3, r0, #1
     f92:	d102      	bne.n	f9a <_sbrk_r+0x1a>
     f94:	682b      	ldr	r3, [r5, #0]
     f96:	b103      	cbz	r3, f9a <_sbrk_r+0x1a>
     f98:	6023      	str	r3, [r4, #0]
     f9a:	bd38      	pop	{r3, r4, r5, pc}
     f9c:	000200ac 	andeq	r0, r2, ip, lsr #1

00000fa0 <__malloc_lock>:
     fa0:	4801      	ldr	r0, [pc, #4]	; (fa8 <__malloc_lock+0x8>)
     fa2:	f000 b811 	b.w	fc8 <__retarget_lock_acquire_recursive>
     fa6:	bf00      	nop
     fa8:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fac <__malloc_unlock>:
     fac:	4801      	ldr	r0, [pc, #4]	; (fb4 <__malloc_unlock+0x8>)
     fae:	f000 b80c 	b.w	fca <__retarget_lock_release_recursive>
     fb2:	bf00      	nop
     fb4:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fb8 <_malloc_usable_size_r>:
     fb8:	f851 3c04 	ldr.w	r3, [r1, #-4]
     fbc:	1f18      	subs	r0, r3, #4
     fbe:	2b00      	cmp	r3, #0
     fc0:	bfbc      	itt	lt
     fc2:	580b      	ldrlt	r3, [r1, r0]
     fc4:	18c0      	addlt	r0, r0, r3
     fc6:	4770      	bx	lr

00000fc8 <__retarget_lock_acquire_recursive>:
     fc8:	4770      	bx	lr

00000fca <__retarget_lock_release_recursive>:
     fca:	4770      	bx	lr

00000fcc <_sbrk>:
     fcc:	4a04      	ldr	r2, [pc, #16]	; (fe0 <_sbrk+0x14>)
     fce:	4905      	ldr	r1, [pc, #20]	; (fe4 <_sbrk+0x18>)
     fd0:	6813      	ldr	r3, [r2, #0]
     fd2:	2b00      	cmp	r3, #0
     fd4:	bf08      	it	eq
     fd6:	460b      	moveq	r3, r1
     fd8:	4418      	add	r0, r3
     fda:	6010      	str	r0, [r2, #0]
     fdc:	4618      	mov	r0, r3
     fde:	4770      	bx	lr
     fe0:	000200b4 	strheq	r0, [r2], -r4
     fe4:	000200b8 	strheq	r0, [r2], -r8

00000fe8 <_exit>:
     fe8:	e7fe      	b.n	fe8 <_exit>
     fea:	bf00      	nop

00000fec <_init>:
     fec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     fee:	bf00      	nop
     ff0:	bcf8      	pop	{r3, r4, r5, r6, r7}
     ff2:	bc08      	pop	{r3}
     ff4:	469e      	mov	lr, r3
     ff6:	4770      	bx	lr

00000ff8 <_fini>:
     ff8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     ffa:	bf00      	nop
     ffc:	bcf8      	pop	{r3, r4, r5, r6, r7}
     ffe:	bc08      	pop	{r3}
    1000:	469e      	mov	lr, r3
    1002:	4770      	bx	lr
    1004:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
    1008:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
    100c:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
    1010:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
    1014:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
    1018:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
    101c:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
    1020:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
    1024:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
    1028:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
    102c:	0000000a 	andeq	r0, r0, sl

00001030 <_global_impure_ptr>:
    1030:	00020004 	andeq	r0, r2, r4
    1034:	2b302d23 	blcs	c0c4c8 <__StackTop+0xbea4c8>
    1038:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    103c:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    1040:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    1044:	32313000 	eorscc	r3, r1, #0
    1048:	36353433 			; <UNDEFINED> instruction: 0x36353433
    104c:	41393837 	teqmi	r9, r7, lsr r8
    1050:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    1054:	31300046 	teqcc	r0, r6, asr #32
    1058:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    105c:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1060:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    1064:	00006665 	andeq	r6, r0, r5, ror #12

00001068 <__EH_FRAME_BEGIN__>:
    1068:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <_impure_ptr>:
   20000:	00020004 	andeq	r0, r2, r4

00020004 <impure_data>:
	...

00020064 <__frame_dummy_init_array_entry>:
   20064:	000000ad 	andeq	r0, r0, sp, lsr #1

00020068 <__do_global_dtors_aux_fini_array_entry>:
   20068:	00000089 	andeq	r0, r0, r9, lsl #1

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
  18:	000006a0 	andeq	r0, r0, r0, lsr #13
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000006d8 	ldrdeq	r0, [r0], -r8
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	00000704 	andeq	r0, r0, r4, lsl #14
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	00000718 	andeq	r0, r0, r8, lsl r7
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
  cc:	000007d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
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
 10c:	000009d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xc0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000ab0 			; <UNDEFINED> instruction: 0x00000ab0
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
 16c:	00000cfc 	strdeq	r0, [r0], -ip
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000d18 	andeq	r0, r0, r8, lsl sp
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000d34 	andeq	r0, r0, r4, lsr sp
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d68 	andeq	r0, r0, r8, ror #26
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
 21c:	00000df8 	strdeq	r0, [r0], -r8
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000e38 	andeq	r0, r0, r8, lsr lr
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
 268:	00000f20 	andeq	r0, r0, r0, lsr #30
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
 2a4:	00000f80 	andeq	r0, r0, r0, lsl #31
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
 2d0:	00000fa0 	andeq	r0, r0, r0, lsr #31
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000fac 	andeq	r0, r0, ip, lsr #31
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000fb8 			; <UNDEFINED> instruction: 0x00000fb8
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
 3cc:	00000fc8 	andeq	r0, r0, r8, asr #31
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
 40c:	00000fca 	andeq	r0, r0, sl, asr #31
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000fcc 	andeq	r0, r0, ip, asr #31
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000fe8 	andeq	r0, r0, r8, ror #31
 450:	00000002 	andeq	r0, r0, r2

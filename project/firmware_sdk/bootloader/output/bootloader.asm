
bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00012000 	andeq	r2, r1, r0
       4:	0000060d 	andeq	r0, r0, sp, lsl #12
       8:	0000059d 	muleq	r0, sp, r5
       c:	0000059f 	muleq	r0, pc, r5	; <UNPREDICTABLE>
      10:	000005a1 	andeq	r0, r0, r1, lsr #11
      14:	000005a3 	andeq	r0, r0, r3, lsr #11
      18:	000005a5 	andeq	r0, r0, r5, lsr #11
	...
      2c:	000005a7 	andeq	r0, r0, r7, lsr #11
      30:	000005a9 	andeq	r0, r0, r9, lsr #11
      34:	00000000 	andeq	r0, r0, r0
      38:	000005ab 	andeq	r0, r0, fp, lsr #11
      3c:	000005ad 	andeq	r0, r0, sp, lsr #11
      40:	000005b1 			; <UNDEFINED> instruction: 0x000005b1
      44:	00000661 	andeq	r0, r0, r1, ror #12
      48:	00000663 	andeq	r0, r0, r3, ror #12
      4c:	00000665 	andeq	r0, r0, r5, ror #12
      50:	00000667 	andeq	r0, r0, r7, ror #12
      54:	00000669 	andeq	r0, r0, r9, ror #12
      58:	0000066b 	andeq	r0, r0, fp, ror #12
      5c:	0000066d 	andeq	r0, r0, sp, ror #12
      60:	0000066f 	andeq	r0, r0, pc, ror #12
      64:	00000671 	andeq	r0, r0, r1, ror r6
      68:	00000673 	andeq	r0, r0, r3, ror r6
      6c:	00000675 	andeq	r0, r0, r5, ror r6
      70:	00000677 	andeq	r0, r0, r7, ror r6

00000074 <__do_global_dtors_aux>:
      74:	b510      	push	{r4, lr}
      76:	4c05      	ldr	r4, [pc, #20]	; (8c <__do_global_dtors_aux+0x18>)
      78:	7823      	ldrb	r3, [r4, #0]
      7a:	b933      	cbnz	r3, 8a <__do_global_dtors_aux+0x16>
      7c:	4b04      	ldr	r3, [pc, #16]	; (90 <__do_global_dtors_aux+0x1c>)
      7e:	b113      	cbz	r3, 86 <__do_global_dtors_aux+0x12>
      80:	4804      	ldr	r0, [pc, #16]	; (94 <__do_global_dtors_aux+0x20>)
      82:	f3af 8000 	nop.w
      86:	2301      	movs	r3, #1
      88:	7023      	strb	r3, [r4, #0]
      8a:	bd10      	pop	{r4, pc}
      8c:	0001006c 	andeq	r0, r1, ip, rrx
      90:	00000000 	andeq	r0, r0, r0
      94:	00001040 	andeq	r1, r0, r0, asr #32

00000098 <frame_dummy>:
      98:	b508      	push	{r3, lr}
      9a:	4b03      	ldr	r3, [pc, #12]	; (a8 <frame_dummy+0x10>)
      9c:	b11b      	cbz	r3, a6 <frame_dummy+0xe>
      9e:	4903      	ldr	r1, [pc, #12]	; (ac <frame_dummy+0x14>)
      a0:	4803      	ldr	r0, [pc, #12]	; (b0 <frame_dummy+0x18>)
      a2:	f3af 8000 	nop.w
      a6:	bd08      	pop	{r3, pc}
      a8:	00000000 	andeq	r0, r0, r0
      ac:	00010070 	andeq	r0, r1, r0, ror r0
      b0:	00001040 	andeq	r1, r0, r0, asr #32

000000b4 <drv_check_rw_data>:
      b4:	6001      	str	r1, [r0, #0]
      b6:	6803      	ldr	r3, [r0, #0]
      b8:	4293      	cmp	r3, r2
      ba:	d007      	beq.n	cc <drv_check_rw_data+0x18>
      bc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      c0:	2001      	movs	r0, #1
      c2:	6018      	str	r0, [r3, #0]
      c4:	685a      	ldr	r2, [r3, #4]
      c6:	4402      	add	r2, r0
      c8:	601a      	str	r2, [r3, #0]
      ca:	4770      	bx	lr
      cc:	2000      	movs	r0, #0
      ce:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
      d2:	6018      	str	r0, [r3, #0]
      d4:	4770      	bx	lr

000000d6 <drv_uart_default_config>:
      d6:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      da:	6043      	str	r3, [r0, #4]
      dc:	230f      	movs	r3, #15
      de:	7203      	strb	r3, [r0, #8]
      e0:	2300      	movs	r3, #0
      e2:	7243      	strb	r3, [r0, #9]
      e4:	7283      	strb	r3, [r0, #10]
      e6:	72c3      	strb	r3, [r0, #11]
      e8:	7303      	strb	r3, [r0, #12]
      ea:	7343      	strb	r3, [r0, #13]
      ec:	2301      	movs	r3, #1
      ee:	7383      	strb	r3, [r0, #14]
      f0:	4770      	bx	lr
	...

000000f4 <drv_uart_set_config>:
      f4:	b508      	push	{r3, lr}
      f6:	6841      	ldr	r1, [r0, #4]
      f8:	7a03      	ldrb	r3, [r0, #8]
      fa:	fb03 f201 	mul.w	r2, r3, r1
      fe:	490e      	ldr	r1, [pc, #56]	; (138 <drv_uart_set_config+0x44>)
     100:	fbb1 f2f2 	udiv	r2, r1, r2
     104:	0419      	lsls	r1, r3, #16
     106:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     10a:	7a43      	ldrb	r3, [r0, #9]
     10c:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     110:	7a83      	ldrb	r3, [r0, #10]
     112:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     116:	7ac3      	ldrb	r3, [r0, #11]
     118:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     11c:	7b03      	ldrb	r3, [r0, #12]
     11e:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     122:	7b42      	ldrb	r2, [r0, #13]
     124:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     128:	7b82      	ldrb	r2, [r0, #14]
     12a:	4311      	orrs	r1, r2
     12c:	6800      	ldr	r0, [r0, #0]
     12e:	460a      	mov	r2, r1
     130:	3008      	adds	r0, #8
     132:	f7ff ffbf 	bl	b4 <drv_check_rw_data>
     136:	bd08      	pop	{r3, pc}
     138:	02625a00 	rsbeq	r5, r2, #0, 20

0000013c <drv_uart_init>:
     13c:	b538      	push	{r3, r4, r5, lr}
     13e:	4604      	mov	r4, r0
     140:	2500      	movs	r5, #0
     142:	7485      	strb	r5, [r0, #18]
     144:	74c5      	strb	r5, [r0, #19]
     146:	f7ff ffd5 	bl	f4 <drv_uart_set_config>
     14a:	7425      	strb	r5, [r4, #16]
     14c:	74a5      	strb	r5, [r4, #18]
     14e:	74e5      	strb	r5, [r4, #19]
     150:	6822      	ldr	r2, [r4, #0]
     152:	6853      	ldr	r3, [r2, #4]
     154:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     158:	6053      	str	r3, [r2, #4]
     15a:	6822      	ldr	r2, [r4, #0]
     15c:	6853      	ldr	r3, [r2, #4]
     15e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     162:	6053      	str	r3, [r2, #4]
     164:	6822      	ldr	r2, [r4, #0]
     166:	6853      	ldr	r3, [r2, #4]
     168:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     16c:	6053      	str	r3, [r2, #4]
     16e:	6822      	ldr	r2, [r4, #0]
     170:	6853      	ldr	r3, [r2, #4]
     172:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     176:	6053      	str	r3, [r2, #4]
     178:	6822      	ldr	r2, [r4, #0]
     17a:	6853      	ldr	r3, [r2, #4]
     17c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     180:	6053      	str	r3, [r2, #4]
     182:	6822      	ldr	r2, [r4, #0]
     184:	6853      	ldr	r3, [r2, #4]
     186:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     18a:	6053      	str	r3, [r2, #4]
     18c:	6822      	ldr	r2, [r4, #0]
     18e:	6853      	ldr	r3, [r2, #4]
     190:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     194:	6053      	str	r3, [r2, #4]
     196:	6822      	ldr	r2, [r4, #0]
     198:	6853      	ldr	r3, [r2, #4]
     19a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     19e:	6053      	str	r3, [r2, #4]
     1a0:	6823      	ldr	r3, [r4, #0]
     1a2:	f240 12ff 	movw	r2, #511	; 0x1ff
     1a6:	611a      	str	r2, [r3, #16]
     1a8:	6823      	ldr	r3, [r4, #0]
     1aa:	611d      	str	r5, [r3, #16]
     1ac:	6822      	ldr	r2, [r4, #0]
     1ae:	6853      	ldr	r3, [r2, #4]
     1b0:	f043 0301 	orr.w	r3, r3, #1
     1b4:	6053      	str	r3, [r2, #4]
     1b6:	6822      	ldr	r2, [r4, #0]
     1b8:	6853      	ldr	r3, [r2, #4]
     1ba:	f023 0301 	bic.w	r3, r3, #1
     1be:	6053      	str	r3, [r2, #4]
     1c0:	6822      	ldr	r2, [r4, #0]
     1c2:	6853      	ldr	r3, [r2, #4]
     1c4:	f043 0302 	orr.w	r3, r3, #2
     1c8:	6053      	str	r3, [r2, #4]
     1ca:	bd38      	pop	{r3, r4, r5, pc}

000001cc <drv_uart_putchars>:
     1cc:	b410      	push	{r4}
     1ce:	2300      	movs	r3, #0
     1d0:	7483      	strb	r3, [r0, #18]
     1d2:	f890 c012 	ldrb.w	ip, [r0, #18]
     1d6:	4594      	cmp	ip, r2
     1d8:	d20c      	bcs.n	1f4 <drv_uart_putchars+0x28>
     1da:	6804      	ldr	r4, [r0, #0]
     1dc:	6963      	ldr	r3, [r4, #20]
     1de:	0a1b      	lsrs	r3, r3, #8
     1e0:	f013 0f18 	tst.w	r3, #24
     1e4:	d1f5      	bne.n	1d2 <drv_uart_putchars+0x6>
     1e6:	f10c 0301 	add.w	r3, ip, #1
     1ea:	7483      	strb	r3, [r0, #18]
     1ec:	f811 300c 	ldrb.w	r3, [r1, ip]
     1f0:	6023      	str	r3, [r4, #0]
     1f2:	e7ee      	b.n	1d2 <drv_uart_putchars+0x6>
     1f4:	6803      	ldr	r3, [r0, #0]
     1f6:	699a      	ldr	r2, [r3, #24]
     1f8:	f412 7f80 	tst.w	r2, #256	; 0x100
     1fc:	d0fa      	beq.n	1f4 <drv_uart_putchars+0x28>
     1fe:	691a      	ldr	r2, [r3, #16]
     200:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     204:	611a      	str	r2, [r3, #16]
     206:	6803      	ldr	r3, [r0, #0]
     208:	2200      	movs	r2, #0
     20a:	611a      	str	r2, [r3, #16]
     20c:	bc10      	pop	{r4}
     20e:	4770      	bx	lr

00000210 <drv_uart_putchar>:
     210:	6802      	ldr	r2, [r0, #0]
     212:	6953      	ldr	r3, [r2, #20]
     214:	0a1b      	lsrs	r3, r3, #8
     216:	f013 0f18 	tst.w	r3, #24
     21a:	d101      	bne.n	220 <drv_uart_putchar+0x10>
     21c:	780b      	ldrb	r3, [r1, #0]
     21e:	6013      	str	r3, [r2, #0]
     220:	6803      	ldr	r3, [r0, #0]
     222:	699a      	ldr	r2, [r3, #24]
     224:	f412 7f80 	tst.w	r2, #256	; 0x100
     228:	d0fa      	beq.n	220 <drv_uart_putchar+0x10>
     22a:	691a      	ldr	r2, [r3, #16]
     22c:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     230:	611a      	str	r2, [r3, #16]
     232:	6803      	ldr	r3, [r0, #0]
     234:	2200      	movs	r2, #0
     236:	611a      	str	r2, [r3, #16]
     238:	4770      	bx	lr

0000023a <drv_uart_getchar>:
     23a:	b410      	push	{r4}
     23c:	e009      	b.n	252 <drv_uart_getchar+0x18>
     23e:	69db      	ldr	r3, [r3, #28]
     240:	700b      	strb	r3, [r1, #0]
     242:	2000      	movs	r0, #0
     244:	bc10      	pop	{r4}
     246:	4770      	bx	lr
     248:	6803      	ldr	r3, [r0, #0]
     24a:	695a      	ldr	r2, [r3, #20]
     24c:	f012 0f1f 	tst.w	r2, #31
     250:	d1f5      	bne.n	23e <drv_uart_getchar+0x4>
     252:	6803      	ldr	r3, [r0, #0]
     254:	699c      	ldr	r4, [r3, #24]
     256:	691a      	ldr	r2, [r3, #16]
     258:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     25c:	611a      	str	r2, [r3, #16]
     25e:	6803      	ldr	r3, [r0, #0]
     260:	2200      	movs	r2, #0
     262:	611a      	str	r2, [r3, #16]
     264:	b2a3      	uxth	r3, r4
     266:	f014 0f40 	tst.w	r4, #64	; 0x40
     26a:	d001      	beq.n	270 <drv_uart_getchar+0x36>
     26c:	2201      	movs	r2, #1
     26e:	7402      	strb	r2, [r0, #16]
     270:	f013 0f80 	tst.w	r3, #128	; 0x80
     274:	d001      	beq.n	27a <drv_uart_getchar+0x40>
     276:	2302      	movs	r3, #2
     278:	7403      	strb	r3, [r0, #16]
     27a:	7c03      	ldrb	r3, [r0, #16]
     27c:	2b00      	cmp	r3, #0
     27e:	d0e3      	beq.n	248 <drv_uart_getchar+0xe>
     280:	7a83      	ldrb	r3, [r0, #10]
     282:	2b01      	cmp	r3, #1
     284:	d0e0      	beq.n	248 <drv_uart_getchar+0xe>
     286:	2300      	movs	r3, #0
     288:	7403      	strb	r3, [r0, #16]
     28a:	7483      	strb	r3, [r0, #18]
     28c:	74c3      	strb	r3, [r0, #19]
     28e:	6804      	ldr	r4, [r0, #0]
     290:	6862      	ldr	r2, [r4, #4]
     292:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     296:	6062      	str	r2, [r4, #4]
     298:	6804      	ldr	r4, [r0, #0]
     29a:	6862      	ldr	r2, [r4, #4]
     29c:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2a0:	6062      	str	r2, [r4, #4]
     2a2:	6804      	ldr	r4, [r0, #0]
     2a4:	6862      	ldr	r2, [r4, #4]
     2a6:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2aa:	6062      	str	r2, [r4, #4]
     2ac:	6804      	ldr	r4, [r0, #0]
     2ae:	6862      	ldr	r2, [r4, #4]
     2b0:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2b4:	6062      	str	r2, [r4, #4]
     2b6:	6804      	ldr	r4, [r0, #0]
     2b8:	6862      	ldr	r2, [r4, #4]
     2ba:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2be:	6062      	str	r2, [r4, #4]
     2c0:	6804      	ldr	r4, [r0, #0]
     2c2:	6862      	ldr	r2, [r4, #4]
     2c4:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2c8:	6062      	str	r2, [r4, #4]
     2ca:	6804      	ldr	r4, [r0, #0]
     2cc:	6862      	ldr	r2, [r4, #4]
     2ce:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2d2:	6062      	str	r2, [r4, #4]
     2d4:	6800      	ldr	r0, [r0, #0]
     2d6:	6842      	ldr	r2, [r0, #4]
     2d8:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2dc:	6042      	str	r2, [r0, #4]
     2de:	700b      	strb	r3, [r1, #0]
     2e0:	2001      	movs	r0, #1
     2e2:	e7af      	b.n	244 <drv_uart_getchar+0xa>

000002e4 <uart_int_tx_done_callback>:
     2e4:	4770      	bx	lr

000002e6 <uart_int_rx_stop_callback>:
     2e6:	4770      	bx	lr

000002e8 <uart_int_rx_parity_error_callback>:
     2e8:	4770      	bx	lr

000002ea <uart_int_rx_noise_detect_callback>:
     2ea:	4770      	bx	lr

000002ec <uart_int_rx_stop_detect_callback>:
     2ec:	4770      	bx	lr

000002ee <uart_int_tx_fifo_empty_callback>:
     2ee:	4770      	bx	lr

000002f0 <uart_int_tx_fifo_thres_callback>:
     2f0:	4770      	bx	lr

000002f2 <uart_int_rx_fifo_noempty_callback>:
     2f2:	4770      	bx	lr

000002f4 <uart_int_rx_fifo_thres_callback>:
     2f4:	4770      	bx	lr

000002f6 <drv_uart_interrupt_handler>:
     2f6:	b538      	push	{r3, r4, r5, lr}
     2f8:	4604      	mov	r4, r0
     2fa:	6803      	ldr	r3, [r0, #0]
     2fc:	699d      	ldr	r5, [r3, #24]
     2fe:	68db      	ldr	r3, [r3, #12]
     300:	b29b      	uxth	r3, r3
     302:	401d      	ands	r5, r3
     304:	f415 7f80 	tst.w	r5, #256	; 0x100
     308:	d144      	bne.n	394 <drv_uart_interrupt_handler+0x9e>
     30a:	f015 0f40 	tst.w	r5, #64	; 0x40
     30e:	d00f      	beq.n	330 <drv_uart_interrupt_handler+0x3a>
     310:	2301      	movs	r3, #1
     312:	7423      	strb	r3, [r4, #16]
     314:	7aa3      	ldrb	r3, [r4, #10]
     316:	2b01      	cmp	r3, #1
     318:	d147      	bne.n	3aa <drv_uart_interrupt_handler+0xb4>
     31a:	4620      	mov	r0, r4
     31c:	f7ff ffe3 	bl	2e6 <uart_int_rx_stop_callback>
     320:	6822      	ldr	r2, [r4, #0]
     322:	6913      	ldr	r3, [r2, #16]
     324:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     328:	6113      	str	r3, [r2, #16]
     32a:	6823      	ldr	r3, [r4, #0]
     32c:	2200      	movs	r2, #0
     32e:	611a      	str	r2, [r3, #16]
     330:	f015 0f80 	tst.w	r5, #128	; 0x80
     334:	d00f      	beq.n	356 <drv_uart_interrupt_handler+0x60>
     336:	2302      	movs	r3, #2
     338:	7423      	strb	r3, [r4, #16]
     33a:	7aa3      	ldrb	r3, [r4, #10]
     33c:	2b01      	cmp	r3, #1
     33e:	d166      	bne.n	40e <drv_uart_interrupt_handler+0x118>
     340:	4620      	mov	r0, r4
     342:	f7ff ffd1 	bl	2e8 <uart_int_rx_parity_error_callback>
     346:	6822      	ldr	r2, [r4, #0]
     348:	6913      	ldr	r3, [r2, #16]
     34a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     34e:	6113      	str	r3, [r2, #16]
     350:	6823      	ldr	r3, [r4, #0]
     352:	2200      	movs	r2, #0
     354:	611a      	str	r2, [r3, #16]
     356:	f015 0f20 	tst.w	r5, #32
     35a:	f040 808a 	bne.w	472 <drv_uart_interrupt_handler+0x17c>
     35e:	f015 0f10 	tst.w	r5, #16
     362:	f040 8092 	bne.w	48a <drv_uart_interrupt_handler+0x194>
     366:	f015 0f01 	tst.w	r5, #1
     36a:	f040 809a 	bne.w	4a2 <drv_uart_interrupt_handler+0x1ac>
     36e:	f015 0f02 	tst.w	r5, #2
     372:	f040 80a2 	bne.w	4ba <drv_uart_interrupt_handler+0x1c4>
     376:	f015 0f04 	tst.w	r5, #4
     37a:	f000 80c1 	beq.w	500 <drv_uart_interrupt_handler+0x20a>
     37e:	7ce2      	ldrb	r2, [r4, #19]
     380:	7e23      	ldrb	r3, [r4, #24]
     382:	429a      	cmp	r2, r3
     384:	f0c0 80ac 	bcc.w	4e0 <drv_uart_interrupt_handler+0x1ea>
     388:	6822      	ldr	r2, [r4, #0]
     38a:	68d3      	ldr	r3, [r2, #12]
     38c:	f023 030c 	bic.w	r3, r3, #12
     390:	60d3      	str	r3, [r2, #12]
     392:	e0aa      	b.n	4ea <drv_uart_interrupt_handler+0x1f4>
     394:	f7ff ffa6 	bl	2e4 <uart_int_tx_done_callback>
     398:	6822      	ldr	r2, [r4, #0]
     39a:	6913      	ldr	r3, [r2, #16]
     39c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3a0:	6113      	str	r3, [r2, #16]
     3a2:	6823      	ldr	r3, [r4, #0]
     3a4:	2200      	movs	r2, #0
     3a6:	611a      	str	r2, [r3, #16]
     3a8:	e7af      	b.n	30a <drv_uart_interrupt_handler+0x14>
     3aa:	6822      	ldr	r2, [r4, #0]
     3ac:	68d3      	ldr	r3, [r2, #12]
     3ae:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3b2:	60d3      	str	r3, [r2, #12]
     3b4:	2300      	movs	r3, #0
     3b6:	7423      	strb	r3, [r4, #16]
     3b8:	74a3      	strb	r3, [r4, #18]
     3ba:	74e3      	strb	r3, [r4, #19]
     3bc:	6822      	ldr	r2, [r4, #0]
     3be:	6853      	ldr	r3, [r2, #4]
     3c0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3c4:	6053      	str	r3, [r2, #4]
     3c6:	6822      	ldr	r2, [r4, #0]
     3c8:	6853      	ldr	r3, [r2, #4]
     3ca:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     3ce:	6053      	str	r3, [r2, #4]
     3d0:	6822      	ldr	r2, [r4, #0]
     3d2:	6853      	ldr	r3, [r2, #4]
     3d4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     3d8:	6053      	str	r3, [r2, #4]
     3da:	6822      	ldr	r2, [r4, #0]
     3dc:	6853      	ldr	r3, [r2, #4]
     3de:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     3e2:	6053      	str	r3, [r2, #4]
     3e4:	6822      	ldr	r2, [r4, #0]
     3e6:	6853      	ldr	r3, [r2, #4]
     3e8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     3ec:	6053      	str	r3, [r2, #4]
     3ee:	6822      	ldr	r2, [r4, #0]
     3f0:	6853      	ldr	r3, [r2, #4]
     3f2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     3f6:	6053      	str	r3, [r2, #4]
     3f8:	6822      	ldr	r2, [r4, #0]
     3fa:	6853      	ldr	r3, [r2, #4]
     3fc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     400:	6053      	str	r3, [r2, #4]
     402:	6822      	ldr	r2, [r4, #0]
     404:	6853      	ldr	r3, [r2, #4]
     406:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     40a:	6053      	str	r3, [r2, #4]
     40c:	e785      	b.n	31a <drv_uart_interrupt_handler+0x24>
     40e:	6822      	ldr	r2, [r4, #0]
     410:	68d3      	ldr	r3, [r2, #12]
     412:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     416:	60d3      	str	r3, [r2, #12]
     418:	2300      	movs	r3, #0
     41a:	7423      	strb	r3, [r4, #16]
     41c:	74a3      	strb	r3, [r4, #18]
     41e:	74e3      	strb	r3, [r4, #19]
     420:	6822      	ldr	r2, [r4, #0]
     422:	6853      	ldr	r3, [r2, #4]
     424:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     428:	6053      	str	r3, [r2, #4]
     42a:	6822      	ldr	r2, [r4, #0]
     42c:	6853      	ldr	r3, [r2, #4]
     42e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     432:	6053      	str	r3, [r2, #4]
     434:	6822      	ldr	r2, [r4, #0]
     436:	6853      	ldr	r3, [r2, #4]
     438:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     43c:	6053      	str	r3, [r2, #4]
     43e:	6822      	ldr	r2, [r4, #0]
     440:	6853      	ldr	r3, [r2, #4]
     442:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     446:	6053      	str	r3, [r2, #4]
     448:	6822      	ldr	r2, [r4, #0]
     44a:	6853      	ldr	r3, [r2, #4]
     44c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     450:	6053      	str	r3, [r2, #4]
     452:	6822      	ldr	r2, [r4, #0]
     454:	6853      	ldr	r3, [r2, #4]
     456:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     45a:	6053      	str	r3, [r2, #4]
     45c:	6822      	ldr	r2, [r4, #0]
     45e:	6853      	ldr	r3, [r2, #4]
     460:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     464:	6053      	str	r3, [r2, #4]
     466:	6822      	ldr	r2, [r4, #0]
     468:	6853      	ldr	r3, [r2, #4]
     46a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     46e:	6053      	str	r3, [r2, #4]
     470:	e766      	b.n	340 <drv_uart_interrupt_handler+0x4a>
     472:	4620      	mov	r0, r4
     474:	f7ff ff39 	bl	2ea <uart_int_rx_noise_detect_callback>
     478:	6822      	ldr	r2, [r4, #0]
     47a:	6913      	ldr	r3, [r2, #16]
     47c:	f043 0320 	orr.w	r3, r3, #32
     480:	6113      	str	r3, [r2, #16]
     482:	6823      	ldr	r3, [r4, #0]
     484:	2200      	movs	r2, #0
     486:	611a      	str	r2, [r3, #16]
     488:	e769      	b.n	35e <drv_uart_interrupt_handler+0x68>
     48a:	4620      	mov	r0, r4
     48c:	f7ff ff2e 	bl	2ec <uart_int_rx_stop_detect_callback>
     490:	6822      	ldr	r2, [r4, #0]
     492:	6913      	ldr	r3, [r2, #16]
     494:	f043 0310 	orr.w	r3, r3, #16
     498:	6113      	str	r3, [r2, #16]
     49a:	6823      	ldr	r3, [r4, #0]
     49c:	2200      	movs	r2, #0
     49e:	611a      	str	r2, [r3, #16]
     4a0:	e761      	b.n	366 <drv_uart_interrupt_handler+0x70>
     4a2:	4620      	mov	r0, r4
     4a4:	f7ff ff24 	bl	2f0 <uart_int_tx_fifo_thres_callback>
     4a8:	6822      	ldr	r2, [r4, #0]
     4aa:	6913      	ldr	r3, [r2, #16]
     4ac:	f043 0301 	orr.w	r3, r3, #1
     4b0:	6113      	str	r3, [r2, #16]
     4b2:	6823      	ldr	r3, [r4, #0]
     4b4:	2200      	movs	r2, #0
     4b6:	611a      	str	r2, [r3, #16]
     4b8:	e759      	b.n	36e <drv_uart_interrupt_handler+0x78>
     4ba:	4620      	mov	r0, r4
     4bc:	f7ff ff17 	bl	2ee <uart_int_tx_fifo_empty_callback>
     4c0:	6822      	ldr	r2, [r4, #0]
     4c2:	6913      	ldr	r3, [r2, #16]
     4c4:	f043 0302 	orr.w	r3, r3, #2
     4c8:	6113      	str	r3, [r2, #16]
     4ca:	6823      	ldr	r3, [r4, #0]
     4cc:	2200      	movs	r2, #0
     4ce:	611a      	str	r2, [r3, #16]
     4d0:	e751      	b.n	376 <drv_uart_interrupt_handler+0x80>
     4d2:	69d9      	ldr	r1, [r3, #28]
     4d4:	6962      	ldr	r2, [r4, #20]
     4d6:	7ce3      	ldrb	r3, [r4, #19]
     4d8:	1c58      	adds	r0, r3, #1
     4da:	74e0      	strb	r0, [r4, #19]
     4dc:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4e0:	6823      	ldr	r3, [r4, #0]
     4e2:	695a      	ldr	r2, [r3, #20]
     4e4:	f012 0f1f 	tst.w	r2, #31
     4e8:	d1f3      	bne.n	4d2 <drv_uart_interrupt_handler+0x1dc>
     4ea:	4620      	mov	r0, r4
     4ec:	f7ff ff02 	bl	2f4 <uart_int_rx_fifo_thres_callback>
     4f0:	6822      	ldr	r2, [r4, #0]
     4f2:	6913      	ldr	r3, [r2, #16]
     4f4:	f043 0304 	orr.w	r3, r3, #4
     4f8:	6113      	str	r3, [r2, #16]
     4fa:	6823      	ldr	r3, [r4, #0]
     4fc:	2200      	movs	r2, #0
     4fe:	611a      	str	r2, [r3, #16]
     500:	f015 0f08 	tst.w	r5, #8
     504:	d020      	beq.n	548 <drv_uart_interrupt_handler+0x252>
     506:	7ce2      	ldrb	r2, [r4, #19]
     508:	7e23      	ldrb	r3, [r4, #24]
     50a:	429a      	cmp	r2, r3
     50c:	d30c      	bcc.n	528 <drv_uart_interrupt_handler+0x232>
     50e:	6822      	ldr	r2, [r4, #0]
     510:	68d3      	ldr	r3, [r2, #12]
     512:	f023 030c 	bic.w	r3, r3, #12
     516:	60d3      	str	r3, [r2, #12]
     518:	e00b      	b.n	532 <drv_uart_interrupt_handler+0x23c>
     51a:	69d9      	ldr	r1, [r3, #28]
     51c:	6962      	ldr	r2, [r4, #20]
     51e:	7ce3      	ldrb	r3, [r4, #19]
     520:	1c58      	adds	r0, r3, #1
     522:	74e0      	strb	r0, [r4, #19]
     524:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     528:	6823      	ldr	r3, [r4, #0]
     52a:	695a      	ldr	r2, [r3, #20]
     52c:	f012 0f1f 	tst.w	r2, #31
     530:	d1f3      	bne.n	51a <drv_uart_interrupt_handler+0x224>
     532:	4620      	mov	r0, r4
     534:	f7ff fedd 	bl	2f2 <uart_int_rx_fifo_noempty_callback>
     538:	6822      	ldr	r2, [r4, #0]
     53a:	6913      	ldr	r3, [r2, #16]
     53c:	f043 0308 	orr.w	r3, r3, #8
     540:	6113      	str	r3, [r2, #16]
     542:	6823      	ldr	r3, [r4, #0]
     544:	2200      	movs	r2, #0
     546:	611a      	str	r2, [r3, #16]
     548:	bd38      	pop	{r3, r4, r5, pc}
	...

0000054c <vprintf>:
     54c:	b500      	push	{lr}
     54e:	b091      	sub	sp, #68	; 0x44
     550:	460a      	mov	r2, r1
     552:	4601      	mov	r1, r0
     554:	4668      	mov	r0, sp
     556:	f000 f8c1 	bl	6dc <vsiprintf>
     55a:	2800      	cmp	r0, #0
     55c:	dc05      	bgt.n	56a <vprintf+0x1e>
     55e:	4668      	mov	r0, sp
     560:	f000 f89e 	bl	6a0 <strlen>
     564:	b011      	add	sp, #68	; 0x44
     566:	f85d fb04 	ldr.w	pc, [sp], #4
     56a:	4668      	mov	r0, sp
     56c:	f000 f898 	bl	6a0 <strlen>
     570:	b2c2      	uxtb	r2, r0
     572:	4669      	mov	r1, sp
     574:	4801      	ldr	r0, [pc, #4]	; (57c <vprintf+0x30>)
     576:	f7ff fe29 	bl	1cc <drv_uart_putchars>
     57a:	e7f0      	b.n	55e <vprintf+0x12>
     57c:	00010088 	andeq	r0, r1, r8, lsl #1

00000580 <drv_uart_printf>:
     580:	b40f      	push	{r0, r1, r2, r3}
     582:	b500      	push	{lr}
     584:	b083      	sub	sp, #12
     586:	a904      	add	r1, sp, #16
     588:	f851 0b04 	ldr.w	r0, [r1], #4
     58c:	9101      	str	r1, [sp, #4]
     58e:	f7ff ffdd 	bl	54c <vprintf>
     592:	b003      	add	sp, #12
     594:	f85d eb04 	ldr.w	lr, [sp], #4
     598:	b004      	add	sp, #16
     59a:	4770      	bx	lr

0000059c <NMI_Handler>:
     59c:	4770      	bx	lr

0000059e <HardFault_Handler>:
     59e:	e7fe      	b.n	59e <HardFault_Handler>

000005a0 <MemManage_Handler>:
     5a0:	e7fe      	b.n	5a0 <MemManage_Handler>

000005a2 <BusFault_Handler>:
     5a2:	e7fe      	b.n	5a2 <BusFault_Handler>

000005a4 <UsageFault_Handler>:
     5a4:	e7fe      	b.n	5a4 <UsageFault_Handler>

000005a6 <SVC_Handler>:
     5a6:	4770      	bx	lr

000005a8 <DebugMon_Handler>:
     5a8:	4770      	bx	lr

000005aa <PendSV_Handler>:
     5aa:	4770      	bx	lr

000005ac <SysTick_Handler>:
     5ac:	4770      	bx	lr
	...

000005b0 <Uart0_Handler>:
     5b0:	b508      	push	{r3, lr}
     5b2:	4b04      	ldr	r3, [pc, #16]	; (5c4 <Uart0_Handler+0x14>)
     5b4:	2201      	movs	r2, #1
     5b6:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     5ba:	4803      	ldr	r0, [pc, #12]	; (5c8 <Uart0_Handler+0x18>)
     5bc:	f7ff fe9b 	bl	2f6 <drv_uart_interrupt_handler>
     5c0:	bd08      	pop	{r3, pc}
     5c2:	bf00      	nop
     5c4:	e000e100 	and	lr, r0, r0, lsl #2
     5c8:	00010088 	andeq	r0, r1, r8, lsl #1

000005cc <main>:
     5cc:	b500      	push	{lr}
     5ce:	b083      	sub	sp, #12
     5d0:	4c0b      	ldr	r4, [pc, #44]	; (600 <main+0x34>)
     5d2:	4b0c      	ldr	r3, [pc, #48]	; (604 <main+0x38>)
     5d4:	6023      	str	r3, [r4, #0]
     5d6:	4620      	mov	r0, r4
     5d8:	f7ff fd7d 	bl	d6 <drv_uart_default_config>
     5dc:	4620      	mov	r0, r4
     5de:	f7ff fdad 	bl	13c <drv_uart_init>
     5e2:	4809      	ldr	r0, [pc, #36]	; (608 <main+0x3c>)
     5e4:	f7ff ffcc 	bl	580 <drv_uart_printf>
     5e8:	4c05      	ldr	r4, [pc, #20]	; (600 <main+0x34>)
     5ea:	f10d 0107 	add.w	r1, sp, #7
     5ee:	4620      	mov	r0, r4
     5f0:	f7ff fe23 	bl	23a <drv_uart_getchar>
     5f4:	f10d 0107 	add.w	r1, sp, #7
     5f8:	4620      	mov	r0, r4
     5fa:	f7ff fe09 	bl	210 <drv_uart_putchar>
     5fe:	e7f3      	b.n	5e8 <main+0x1c>
     600:	00010088 	andeq	r0, r1, r8, lsl #1
     604:	40001000 	andmi	r1, r0, r0
     608:	00000fdc 	ldrdeq	r0, [r0], -ip

0000060c <Reset_Handler>:
     60c:	490a      	ldr	r1, [pc, #40]	; (638 <Reset_Handler+0x2c>)
     60e:	4a0b      	ldr	r2, [pc, #44]	; (63c <Reset_Handler+0x30>)
     610:	4b0b      	ldr	r3, [pc, #44]	; (640 <Reset_Handler+0x34>)
     612:	1a9b      	subs	r3, r3, r2
     614:	dd03      	ble.n	61e <Reset_Handler+0x12>
     616:	3b04      	subs	r3, #4
     618:	58c8      	ldr	r0, [r1, r3]
     61a:	50d0      	str	r0, [r2, r3]
     61c:	dcfb      	bgt.n	616 <Reset_Handler+0xa>
     61e:	4909      	ldr	r1, [pc, #36]	; (644 <Reset_Handler+0x38>)
     620:	4a09      	ldr	r2, [pc, #36]	; (648 <Reset_Handler+0x3c>)
     622:	2000      	movs	r0, #0
     624:	4291      	cmp	r1, r2
     626:	bfbc      	itt	lt
     628:	f841 0b04 	strlt.w	r0, [r1], #4
     62c:	e7fa      	blt.n	624 <Reset_Handler+0x18>
     62e:	f7ff ffcd 	bl	5cc <main>
     632:	f000 f821 	bl	678 <exit>
     636:	10440000 	subne	r0, r4, r0
     63a:	00000000 	andeq	r0, r0, r0
     63e:	006c0001 	rsbeq	r0, ip, r1
     642:	006c0001 	rsbeq	r0, ip, r1
     646:	00b80001 	adcseq	r0, r8, r1
     64a:	e7fe0001 	ldrb	r0, [lr, r1]!
     64e:	e7fe      	b.n	64e <Reset_Handler+0x42>
     650:	e7fe      	b.n	650 <Reset_Handler+0x44>
     652:	e7fe      	b.n	652 <Reset_Handler+0x46>
     654:	e7fe      	b.n	654 <Reset_Handler+0x48>
     656:	e7fe      	b.n	656 <Reset_Handler+0x4a>
     658:	e7fe      	b.n	658 <Reset_Handler+0x4c>
     65a:	e7fe      	b.n	65a <Reset_Handler+0x4e>
     65c:	e7fe      	b.n	65c <Reset_Handler+0x50>
     65e:	e7fe      	b.n	65e <Reset_Handler+0x52>

00000660 <Uart1_Handler>:
     660:	e7fe      	b.n	660 <Uart1_Handler>

00000662 <Resv2_Handler>:
     662:	e7fe      	b.n	662 <Resv2_Handler>

00000664 <Resv3_Handler>:
     664:	e7fe      	b.n	664 <Resv3_Handler>

00000666 <Resv4_Handler>:
     666:	e7fe      	b.n	666 <Resv4_Handler>

00000668 <Gpioa_Handler>:
     668:	e7fe      	b.n	668 <Gpioa_Handler>

0000066a <Resv6_Handler>:
     66a:	e7fe      	b.n	66a <Resv6_Handler>

0000066c <Resv7_Handler>:
     66c:	e7fe      	b.n	66c <Resv7_Handler>

0000066e <Bastim_Ch0_Handler>:
     66e:	e7fe      	b.n	66e <Bastim_Ch0_Handler>

00000670 <Bastim_Ch1_Handler>:
     670:	e7fe      	b.n	670 <Bastim_Ch1_Handler>

00000672 <Bastim_Ch2_Handler>:
     672:	e7fe      	b.n	672 <Bastim_Ch2_Handler>

00000674 <Bastim_Ch3_Handler>:
     674:	e7fe      	b.n	674 <Bastim_Ch3_Handler>

00000676 <Resv12_Handler>:
     676:	e7fe      	b.n	676 <Resv12_Handler>

00000678 <exit>:
     678:	b508      	push	{r3, lr}
     67a:	4b07      	ldr	r3, [pc, #28]	; (698 <exit+0x20>)
     67c:	4604      	mov	r4, r0
     67e:	b113      	cbz	r3, 686 <exit+0xe>
     680:	2100      	movs	r1, #0
     682:	f3af 8000 	nop.w
     686:	4b05      	ldr	r3, [pc, #20]	; (69c <exit+0x24>)
     688:	6818      	ldr	r0, [r3, #0]
     68a:	6a83      	ldr	r3, [r0, #40]	; 0x28
     68c:	b103      	cbz	r3, 690 <exit+0x18>
     68e:	4798      	blx	r3
     690:	4620      	mov	r0, r4
     692:	f000 fc95 	bl	fc0 <_exit>
     696:	bf00      	nop
     698:	00000000 	andeq	r0, r0, r0
     69c:	00001008 	andeq	r1, r0, r8

000006a0 <strlen>:
     6a0:	4603      	mov	r3, r0
     6a2:	f813 2b01 	ldrb.w	r2, [r3], #1
     6a6:	2a00      	cmp	r2, #0
     6a8:	d1fb      	bne.n	6a2 <strlen+0x2>
     6aa:	1a18      	subs	r0, r3, r0
     6ac:	3801      	subs	r0, #1
     6ae:	4770      	bx	lr

000006b0 <_vsiprintf_r>:
     6b0:	b500      	push	{lr}
     6b2:	b09b      	sub	sp, #108	; 0x6c
     6b4:	9100      	str	r1, [sp, #0]
     6b6:	9104      	str	r1, [sp, #16]
     6b8:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     6bc:	9105      	str	r1, [sp, #20]
     6be:	9102      	str	r1, [sp, #8]
     6c0:	4905      	ldr	r1, [pc, #20]	; (6d8 <_vsiprintf_r+0x28>)
     6c2:	9103      	str	r1, [sp, #12]
     6c4:	4669      	mov	r1, sp
     6c6:	f000 f86f 	bl	7a8 <_svfiprintf_r>
     6ca:	2200      	movs	r2, #0
     6cc:	9b00      	ldr	r3, [sp, #0]
     6ce:	701a      	strb	r2, [r3, #0]
     6d0:	b01b      	add	sp, #108	; 0x6c
     6d2:	f85d fb04 	ldr.w	pc, [sp], #4
     6d6:	bf00      	nop
     6d8:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

000006dc <vsiprintf>:
     6dc:	4613      	mov	r3, r2
     6de:	460a      	mov	r2, r1
     6e0:	4601      	mov	r1, r0
     6e2:	4802      	ldr	r0, [pc, #8]	; (6ec <vsiprintf+0x10>)
     6e4:	6800      	ldr	r0, [r0, #0]
     6e6:	f7ff bfe3 	b.w	6b0 <_vsiprintf_r>
     6ea:	bf00      	nop
     6ec:	00010000 	andeq	r0, r1, r0

000006f0 <__ssputs_r>:
     6f0:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     6f4:	688e      	ldr	r6, [r1, #8]
     6f6:	4682      	mov	sl, r0
     6f8:	429e      	cmp	r6, r3
     6fa:	460c      	mov	r4, r1
     6fc:	4690      	mov	r8, r2
     6fe:	461f      	mov	r7, r3
     700:	d838      	bhi.n	774 <__ssputs_r+0x84>
     702:	898a      	ldrh	r2, [r1, #12]
     704:	f412 6f90 	tst.w	r2, #1152	; 0x480
     708:	d032      	beq.n	770 <__ssputs_r+0x80>
     70a:	6825      	ldr	r5, [r4, #0]
     70c:	6909      	ldr	r1, [r1, #16]
     70e:	3301      	adds	r3, #1
     710:	eba5 0901 	sub.w	r9, r5, r1
     714:	6965      	ldr	r5, [r4, #20]
     716:	444b      	add	r3, r9
     718:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     71c:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     720:	106d      	asrs	r5, r5, #1
     722:	429d      	cmp	r5, r3
     724:	bf38      	it	cc
     726:	461d      	movcc	r5, r3
     728:	0553      	lsls	r3, r2, #21
     72a:	d531      	bpl.n	790 <__ssputs_r+0xa0>
     72c:	4629      	mov	r1, r5
     72e:	f000 fb6f 	bl	e10 <_malloc_r>
     732:	4606      	mov	r6, r0
     734:	b950      	cbnz	r0, 74c <__ssputs_r+0x5c>
     736:	230c      	movs	r3, #12
     738:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     73c:	f8ca 3000 	str.w	r3, [sl]
     740:	89a3      	ldrh	r3, [r4, #12]
     742:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     746:	81a3      	strh	r3, [r4, #12]
     748:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     74c:	464a      	mov	r2, r9
     74e:	6921      	ldr	r1, [r4, #16]
     750:	f000 face 	bl	cf0 <memcpy>
     754:	89a3      	ldrh	r3, [r4, #12]
     756:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     75a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     75e:	81a3      	strh	r3, [r4, #12]
     760:	6126      	str	r6, [r4, #16]
     762:	444e      	add	r6, r9
     764:	6026      	str	r6, [r4, #0]
     766:	463e      	mov	r6, r7
     768:	6165      	str	r5, [r4, #20]
     76a:	eba5 0509 	sub.w	r5, r5, r9
     76e:	60a5      	str	r5, [r4, #8]
     770:	42be      	cmp	r6, r7
     772:	d900      	bls.n	776 <__ssputs_r+0x86>
     774:	463e      	mov	r6, r7
     776:	4632      	mov	r2, r6
     778:	4641      	mov	r1, r8
     77a:	6820      	ldr	r0, [r4, #0]
     77c:	f000 fac6 	bl	d0c <memmove>
     780:	68a3      	ldr	r3, [r4, #8]
     782:	2000      	movs	r0, #0
     784:	1b9b      	subs	r3, r3, r6
     786:	60a3      	str	r3, [r4, #8]
     788:	6823      	ldr	r3, [r4, #0]
     78a:	4433      	add	r3, r6
     78c:	6023      	str	r3, [r4, #0]
     78e:	e7db      	b.n	748 <__ssputs_r+0x58>
     790:	462a      	mov	r2, r5
     792:	f000 fbb1 	bl	ef8 <_realloc_r>
     796:	4606      	mov	r6, r0
     798:	2800      	cmp	r0, #0
     79a:	d1e1      	bne.n	760 <__ssputs_r+0x70>
     79c:	4650      	mov	r0, sl
     79e:	6921      	ldr	r1, [r4, #16]
     7a0:	f000 face 	bl	d40 <_free_r>
     7a4:	e7c7      	b.n	736 <__ssputs_r+0x46>
	...

000007a8 <_svfiprintf_r>:
     7a8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7ac:	4698      	mov	r8, r3
     7ae:	898b      	ldrh	r3, [r1, #12]
     7b0:	4607      	mov	r7, r0
     7b2:	061b      	lsls	r3, r3, #24
     7b4:	460d      	mov	r5, r1
     7b6:	4614      	mov	r4, r2
     7b8:	b09d      	sub	sp, #116	; 0x74
     7ba:	d50e      	bpl.n	7da <_svfiprintf_r+0x32>
     7bc:	690b      	ldr	r3, [r1, #16]
     7be:	b963      	cbnz	r3, 7da <_svfiprintf_r+0x32>
     7c0:	2140      	movs	r1, #64	; 0x40
     7c2:	f000 fb25 	bl	e10 <_malloc_r>
     7c6:	6028      	str	r0, [r5, #0]
     7c8:	6128      	str	r0, [r5, #16]
     7ca:	b920      	cbnz	r0, 7d6 <_svfiprintf_r+0x2e>
     7cc:	230c      	movs	r3, #12
     7ce:	603b      	str	r3, [r7, #0]
     7d0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     7d4:	e0d1      	b.n	97a <_svfiprintf_r+0x1d2>
     7d6:	2340      	movs	r3, #64	; 0x40
     7d8:	616b      	str	r3, [r5, #20]
     7da:	2300      	movs	r3, #0
     7dc:	9309      	str	r3, [sp, #36]	; 0x24
     7de:	2320      	movs	r3, #32
     7e0:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     7e4:	2330      	movs	r3, #48	; 0x30
     7e6:	f04f 0901 	mov.w	r9, #1
     7ea:	f8cd 800c 	str.w	r8, [sp, #12]
     7ee:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 994 <_svfiprintf_r+0x1ec>
     7f2:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     7f6:	4623      	mov	r3, r4
     7f8:	469a      	mov	sl, r3
     7fa:	f813 2b01 	ldrb.w	r2, [r3], #1
     7fe:	b10a      	cbz	r2, 804 <_svfiprintf_r+0x5c>
     800:	2a25      	cmp	r2, #37	; 0x25
     802:	d1f9      	bne.n	7f8 <_svfiprintf_r+0x50>
     804:	ebba 0b04 	subs.w	fp, sl, r4
     808:	d00b      	beq.n	822 <_svfiprintf_r+0x7a>
     80a:	465b      	mov	r3, fp
     80c:	4622      	mov	r2, r4
     80e:	4629      	mov	r1, r5
     810:	4638      	mov	r0, r7
     812:	f7ff ff6d 	bl	6f0 <__ssputs_r>
     816:	3001      	adds	r0, #1
     818:	f000 80aa 	beq.w	970 <_svfiprintf_r+0x1c8>
     81c:	9a09      	ldr	r2, [sp, #36]	; 0x24
     81e:	445a      	add	r2, fp
     820:	9209      	str	r2, [sp, #36]	; 0x24
     822:	f89a 3000 	ldrb.w	r3, [sl]
     826:	2b00      	cmp	r3, #0
     828:	f000 80a2 	beq.w	970 <_svfiprintf_r+0x1c8>
     82c:	2300      	movs	r3, #0
     82e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     832:	e9cd 2305 	strd	r2, r3, [sp, #20]
     836:	f10a 0a01 	add.w	sl, sl, #1
     83a:	9304      	str	r3, [sp, #16]
     83c:	9307      	str	r3, [sp, #28]
     83e:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     842:	931a      	str	r3, [sp, #104]	; 0x68
     844:	4654      	mov	r4, sl
     846:	2205      	movs	r2, #5
     848:	f814 1b01 	ldrb.w	r1, [r4], #1
     84c:	4851      	ldr	r0, [pc, #324]	; (994 <_svfiprintf_r+0x1ec>)
     84e:	f000 fa41 	bl	cd4 <memchr>
     852:	9a04      	ldr	r2, [sp, #16]
     854:	b9d8      	cbnz	r0, 88e <_svfiprintf_r+0xe6>
     856:	06d0      	lsls	r0, r2, #27
     858:	bf44      	itt	mi
     85a:	2320      	movmi	r3, #32
     85c:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     860:	0711      	lsls	r1, r2, #28
     862:	bf44      	itt	mi
     864:	232b      	movmi	r3, #43	; 0x2b
     866:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     86a:	f89a 3000 	ldrb.w	r3, [sl]
     86e:	2b2a      	cmp	r3, #42	; 0x2a
     870:	d015      	beq.n	89e <_svfiprintf_r+0xf6>
     872:	4654      	mov	r4, sl
     874:	2000      	movs	r0, #0
     876:	f04f 0c0a 	mov.w	ip, #10
     87a:	9a07      	ldr	r2, [sp, #28]
     87c:	4621      	mov	r1, r4
     87e:	f811 3b01 	ldrb.w	r3, [r1], #1
     882:	3b30      	subs	r3, #48	; 0x30
     884:	2b09      	cmp	r3, #9
     886:	d94e      	bls.n	926 <_svfiprintf_r+0x17e>
     888:	b1b0      	cbz	r0, 8b8 <_svfiprintf_r+0x110>
     88a:	9207      	str	r2, [sp, #28]
     88c:	e014      	b.n	8b8 <_svfiprintf_r+0x110>
     88e:	eba0 0308 	sub.w	r3, r0, r8
     892:	fa09 f303 	lsl.w	r3, r9, r3
     896:	4313      	orrs	r3, r2
     898:	46a2      	mov	sl, r4
     89a:	9304      	str	r3, [sp, #16]
     89c:	e7d2      	b.n	844 <_svfiprintf_r+0x9c>
     89e:	9b03      	ldr	r3, [sp, #12]
     8a0:	1d19      	adds	r1, r3, #4
     8a2:	681b      	ldr	r3, [r3, #0]
     8a4:	9103      	str	r1, [sp, #12]
     8a6:	2b00      	cmp	r3, #0
     8a8:	bfbb      	ittet	lt
     8aa:	425b      	neglt	r3, r3
     8ac:	f042 0202 	orrlt.w	r2, r2, #2
     8b0:	9307      	strge	r3, [sp, #28]
     8b2:	9307      	strlt	r3, [sp, #28]
     8b4:	bfb8      	it	lt
     8b6:	9204      	strlt	r2, [sp, #16]
     8b8:	7823      	ldrb	r3, [r4, #0]
     8ba:	2b2e      	cmp	r3, #46	; 0x2e
     8bc:	d10c      	bne.n	8d8 <_svfiprintf_r+0x130>
     8be:	7863      	ldrb	r3, [r4, #1]
     8c0:	2b2a      	cmp	r3, #42	; 0x2a
     8c2:	d135      	bne.n	930 <_svfiprintf_r+0x188>
     8c4:	9b03      	ldr	r3, [sp, #12]
     8c6:	3402      	adds	r4, #2
     8c8:	1d1a      	adds	r2, r3, #4
     8ca:	681b      	ldr	r3, [r3, #0]
     8cc:	9203      	str	r2, [sp, #12]
     8ce:	2b00      	cmp	r3, #0
     8d0:	bfb8      	it	lt
     8d2:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     8d6:	9305      	str	r3, [sp, #20]
     8d8:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 998 <_svfiprintf_r+0x1f0>
     8dc:	2203      	movs	r2, #3
     8de:	4650      	mov	r0, sl
     8e0:	7821      	ldrb	r1, [r4, #0]
     8e2:	f000 f9f7 	bl	cd4 <memchr>
     8e6:	b140      	cbz	r0, 8fa <_svfiprintf_r+0x152>
     8e8:	2340      	movs	r3, #64	; 0x40
     8ea:	eba0 000a 	sub.w	r0, r0, sl
     8ee:	fa03 f000 	lsl.w	r0, r3, r0
     8f2:	9b04      	ldr	r3, [sp, #16]
     8f4:	3401      	adds	r4, #1
     8f6:	4303      	orrs	r3, r0
     8f8:	9304      	str	r3, [sp, #16]
     8fa:	f814 1b01 	ldrb.w	r1, [r4], #1
     8fe:	2206      	movs	r2, #6
     900:	4826      	ldr	r0, [pc, #152]	; (99c <_svfiprintf_r+0x1f4>)
     902:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     906:	f000 f9e5 	bl	cd4 <memchr>
     90a:	2800      	cmp	r0, #0
     90c:	d038      	beq.n	980 <_svfiprintf_r+0x1d8>
     90e:	4b24      	ldr	r3, [pc, #144]	; (9a0 <_svfiprintf_r+0x1f8>)
     910:	bb1b      	cbnz	r3, 95a <_svfiprintf_r+0x1b2>
     912:	9b03      	ldr	r3, [sp, #12]
     914:	3307      	adds	r3, #7
     916:	f023 0307 	bic.w	r3, r3, #7
     91a:	3308      	adds	r3, #8
     91c:	9303      	str	r3, [sp, #12]
     91e:	9b09      	ldr	r3, [sp, #36]	; 0x24
     920:	4433      	add	r3, r6
     922:	9309      	str	r3, [sp, #36]	; 0x24
     924:	e767      	b.n	7f6 <_svfiprintf_r+0x4e>
     926:	460c      	mov	r4, r1
     928:	2001      	movs	r0, #1
     92a:	fb0c 3202 	mla	r2, ip, r2, r3
     92e:	e7a5      	b.n	87c <_svfiprintf_r+0xd4>
     930:	2300      	movs	r3, #0
     932:	f04f 0c0a 	mov.w	ip, #10
     936:	4619      	mov	r1, r3
     938:	3401      	adds	r4, #1
     93a:	9305      	str	r3, [sp, #20]
     93c:	4620      	mov	r0, r4
     93e:	f810 2b01 	ldrb.w	r2, [r0], #1
     942:	3a30      	subs	r2, #48	; 0x30
     944:	2a09      	cmp	r2, #9
     946:	d903      	bls.n	950 <_svfiprintf_r+0x1a8>
     948:	2b00      	cmp	r3, #0
     94a:	d0c5      	beq.n	8d8 <_svfiprintf_r+0x130>
     94c:	9105      	str	r1, [sp, #20]
     94e:	e7c3      	b.n	8d8 <_svfiprintf_r+0x130>
     950:	4604      	mov	r4, r0
     952:	2301      	movs	r3, #1
     954:	fb0c 2101 	mla	r1, ip, r1, r2
     958:	e7f0      	b.n	93c <_svfiprintf_r+0x194>
     95a:	ab03      	add	r3, sp, #12
     95c:	9300      	str	r3, [sp, #0]
     95e:	462a      	mov	r2, r5
     960:	4638      	mov	r0, r7
     962:	4b10      	ldr	r3, [pc, #64]	; (9a4 <_svfiprintf_r+0x1fc>)
     964:	a904      	add	r1, sp, #16
     966:	f3af 8000 	nop.w
     96a:	1c42      	adds	r2, r0, #1
     96c:	4606      	mov	r6, r0
     96e:	d1d6      	bne.n	91e <_svfiprintf_r+0x176>
     970:	89ab      	ldrh	r3, [r5, #12]
     972:	065b      	lsls	r3, r3, #25
     974:	f53f af2c 	bmi.w	7d0 <_svfiprintf_r+0x28>
     978:	9809      	ldr	r0, [sp, #36]	; 0x24
     97a:	b01d      	add	sp, #116	; 0x74
     97c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     980:	ab03      	add	r3, sp, #12
     982:	9300      	str	r3, [sp, #0]
     984:	462a      	mov	r2, r5
     986:	4638      	mov	r0, r7
     988:	4b06      	ldr	r3, [pc, #24]	; (9a4 <_svfiprintf_r+0x1fc>)
     98a:	a904      	add	r1, sp, #16
     98c:	f000 f87c 	bl	a88 <_printf_i>
     990:	e7eb      	b.n	96a <_svfiprintf_r+0x1c2>
     992:	bf00      	nop
     994:	0000100c 	andeq	r1, r0, ip
     998:	00001012 	andeq	r1, r0, r2, lsl r0
     99c:	00001016 	andeq	r1, r0, r6, lsl r0
     9a0:	00000000 	andeq	r0, r0, r0
     9a4:	000006f1 	strdeq	r0, [r0], -r1

000009a8 <_printf_common>:
     9a8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     9ac:	4616      	mov	r6, r2
     9ae:	4699      	mov	r9, r3
     9b0:	688a      	ldr	r2, [r1, #8]
     9b2:	690b      	ldr	r3, [r1, #16]
     9b4:	4607      	mov	r7, r0
     9b6:	4293      	cmp	r3, r2
     9b8:	bfb8      	it	lt
     9ba:	4613      	movlt	r3, r2
     9bc:	6033      	str	r3, [r6, #0]
     9be:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     9c2:	460c      	mov	r4, r1
     9c4:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9c8:	b10a      	cbz	r2, 9ce <_printf_common+0x26>
     9ca:	3301      	adds	r3, #1
     9cc:	6033      	str	r3, [r6, #0]
     9ce:	6823      	ldr	r3, [r4, #0]
     9d0:	0699      	lsls	r1, r3, #26
     9d2:	bf42      	ittt	mi
     9d4:	6833      	ldrmi	r3, [r6, #0]
     9d6:	3302      	addmi	r3, #2
     9d8:	6033      	strmi	r3, [r6, #0]
     9da:	6825      	ldr	r5, [r4, #0]
     9dc:	f015 0506 	ands.w	r5, r5, #6
     9e0:	d106      	bne.n	9f0 <_printf_common+0x48>
     9e2:	f104 0a19 	add.w	sl, r4, #25
     9e6:	68e3      	ldr	r3, [r4, #12]
     9e8:	6832      	ldr	r2, [r6, #0]
     9ea:	1a9b      	subs	r3, r3, r2
     9ec:	42ab      	cmp	r3, r5
     9ee:	dc28      	bgt.n	a42 <_printf_common+0x9a>
     9f0:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     9f4:	1e13      	subs	r3, r2, #0
     9f6:	6822      	ldr	r2, [r4, #0]
     9f8:	bf18      	it	ne
     9fa:	2301      	movne	r3, #1
     9fc:	0692      	lsls	r2, r2, #26
     9fe:	d42d      	bmi.n	a5c <_printf_common+0xb4>
     a00:	4649      	mov	r1, r9
     a02:	4638      	mov	r0, r7
     a04:	f104 0243 	add.w	r2, r4, #67	; 0x43
     a08:	47c0      	blx	r8
     a0a:	3001      	adds	r0, #1
     a0c:	d020      	beq.n	a50 <_printf_common+0xa8>
     a0e:	6823      	ldr	r3, [r4, #0]
     a10:	68e5      	ldr	r5, [r4, #12]
     a12:	f003 0306 	and.w	r3, r3, #6
     a16:	2b04      	cmp	r3, #4
     a18:	bf18      	it	ne
     a1a:	2500      	movne	r5, #0
     a1c:	6832      	ldr	r2, [r6, #0]
     a1e:	f04f 0600 	mov.w	r6, #0
     a22:	68a3      	ldr	r3, [r4, #8]
     a24:	bf08      	it	eq
     a26:	1aad      	subeq	r5, r5, r2
     a28:	6922      	ldr	r2, [r4, #16]
     a2a:	bf08      	it	eq
     a2c:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a30:	4293      	cmp	r3, r2
     a32:	bfc4      	itt	gt
     a34:	1a9b      	subgt	r3, r3, r2
     a36:	18ed      	addgt	r5, r5, r3
     a38:	341a      	adds	r4, #26
     a3a:	42b5      	cmp	r5, r6
     a3c:	d11a      	bne.n	a74 <_printf_common+0xcc>
     a3e:	2000      	movs	r0, #0
     a40:	e008      	b.n	a54 <_printf_common+0xac>
     a42:	2301      	movs	r3, #1
     a44:	4652      	mov	r2, sl
     a46:	4649      	mov	r1, r9
     a48:	4638      	mov	r0, r7
     a4a:	47c0      	blx	r8
     a4c:	3001      	adds	r0, #1
     a4e:	d103      	bne.n	a58 <_printf_common+0xb0>
     a50:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a54:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a58:	3501      	adds	r5, #1
     a5a:	e7c4      	b.n	9e6 <_printf_common+0x3e>
     a5c:	2030      	movs	r0, #48	; 0x30
     a5e:	18e1      	adds	r1, r4, r3
     a60:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a64:	1c5a      	adds	r2, r3, #1
     a66:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a6a:	4422      	add	r2, r4
     a6c:	3302      	adds	r3, #2
     a6e:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     a72:	e7c5      	b.n	a00 <_printf_common+0x58>
     a74:	2301      	movs	r3, #1
     a76:	4622      	mov	r2, r4
     a78:	4649      	mov	r1, r9
     a7a:	4638      	mov	r0, r7
     a7c:	47c0      	blx	r8
     a7e:	3001      	adds	r0, #1
     a80:	d0e6      	beq.n	a50 <_printf_common+0xa8>
     a82:	3601      	adds	r6, #1
     a84:	e7d9      	b.n	a3a <_printf_common+0x92>
	...

00000a88 <_printf_i>:
     a88:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     a8c:	7e0f      	ldrb	r7, [r1, #24]
     a8e:	4691      	mov	r9, r2
     a90:	2f78      	cmp	r7, #120	; 0x78
     a92:	4680      	mov	r8, r0
     a94:	460c      	mov	r4, r1
     a96:	469a      	mov	sl, r3
     a98:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     a9a:	f101 0243 	add.w	r2, r1, #67	; 0x43
     a9e:	d807      	bhi.n	ab0 <_printf_i+0x28>
     aa0:	2f62      	cmp	r7, #98	; 0x62
     aa2:	d80a      	bhi.n	aba <_printf_i+0x32>
     aa4:	2f00      	cmp	r7, #0
     aa6:	f000 80d9 	beq.w	c5c <_printf_i+0x1d4>
     aaa:	2f58      	cmp	r7, #88	; 0x58
     aac:	f000 80a4 	beq.w	bf8 <_printf_i+0x170>
     ab0:	f104 0542 	add.w	r5, r4, #66	; 0x42
     ab4:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     ab8:	e03a      	b.n	b30 <_printf_i+0xa8>
     aba:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     abe:	2b15      	cmp	r3, #21
     ac0:	d8f6      	bhi.n	ab0 <_printf_i+0x28>
     ac2:	a101      	add	r1, pc, #4	; (adr r1, ac8 <_printf_i+0x40>)
     ac4:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     ac8:	00000b21 	andeq	r0, r0, r1, lsr #22
     acc:	00000b35 	andeq	r0, r0, r5, lsr fp
     ad0:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     ad4:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     ad8:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     adc:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     ae0:	00000b35 	andeq	r0, r0, r5, lsr fp
     ae4:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     ae8:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     aec:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     af0:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     af4:	00000c43 	andeq	r0, r0, r3, asr #24
     af8:	00000b65 	andeq	r0, r0, r5, ror #22
     afc:	00000c25 	andeq	r0, r0, r5, lsr #24
     b00:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     b04:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     b08:	00000c65 	andeq	r0, r0, r5, ror #24
     b0c:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     b10:	00000b65 	andeq	r0, r0, r5, ror #22
     b14:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     b18:	00000ab1 			; <UNDEFINED> instruction: 0x00000ab1
     b1c:	00000c2d 	andeq	r0, r0, sp, lsr #24
     b20:	682b      	ldr	r3, [r5, #0]
     b22:	1d1a      	adds	r2, r3, #4
     b24:	681b      	ldr	r3, [r3, #0]
     b26:	602a      	str	r2, [r5, #0]
     b28:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b2c:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b30:	2301      	movs	r3, #1
     b32:	e0a4      	b.n	c7e <_printf_i+0x1f6>
     b34:	6820      	ldr	r0, [r4, #0]
     b36:	6829      	ldr	r1, [r5, #0]
     b38:	0606      	lsls	r6, r0, #24
     b3a:	f101 0304 	add.w	r3, r1, #4
     b3e:	d50a      	bpl.n	b56 <_printf_i+0xce>
     b40:	680e      	ldr	r6, [r1, #0]
     b42:	602b      	str	r3, [r5, #0]
     b44:	2e00      	cmp	r6, #0
     b46:	da03      	bge.n	b50 <_printf_i+0xc8>
     b48:	232d      	movs	r3, #45	; 0x2d
     b4a:	4276      	negs	r6, r6
     b4c:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b50:	230a      	movs	r3, #10
     b52:	485e      	ldr	r0, [pc, #376]	; (ccc <_printf_i+0x244>)
     b54:	e019      	b.n	b8a <_printf_i+0x102>
     b56:	680e      	ldr	r6, [r1, #0]
     b58:	f010 0f40 	tst.w	r0, #64	; 0x40
     b5c:	602b      	str	r3, [r5, #0]
     b5e:	bf18      	it	ne
     b60:	b236      	sxthne	r6, r6
     b62:	e7ef      	b.n	b44 <_printf_i+0xbc>
     b64:	682b      	ldr	r3, [r5, #0]
     b66:	6820      	ldr	r0, [r4, #0]
     b68:	1d19      	adds	r1, r3, #4
     b6a:	6029      	str	r1, [r5, #0]
     b6c:	0601      	lsls	r1, r0, #24
     b6e:	d501      	bpl.n	b74 <_printf_i+0xec>
     b70:	681e      	ldr	r6, [r3, #0]
     b72:	e002      	b.n	b7a <_printf_i+0xf2>
     b74:	0646      	lsls	r6, r0, #25
     b76:	d5fb      	bpl.n	b70 <_printf_i+0xe8>
     b78:	881e      	ldrh	r6, [r3, #0]
     b7a:	2f6f      	cmp	r7, #111	; 0x6f
     b7c:	bf0c      	ite	eq
     b7e:	2308      	moveq	r3, #8
     b80:	230a      	movne	r3, #10
     b82:	4852      	ldr	r0, [pc, #328]	; (ccc <_printf_i+0x244>)
     b84:	2100      	movs	r1, #0
     b86:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     b8a:	6865      	ldr	r5, [r4, #4]
     b8c:	2d00      	cmp	r5, #0
     b8e:	bfa8      	it	ge
     b90:	6821      	ldrge	r1, [r4, #0]
     b92:	60a5      	str	r5, [r4, #8]
     b94:	bfa4      	itt	ge
     b96:	f021 0104 	bicge.w	r1, r1, #4
     b9a:	6021      	strge	r1, [r4, #0]
     b9c:	b90e      	cbnz	r6, ba2 <_printf_i+0x11a>
     b9e:	2d00      	cmp	r5, #0
     ba0:	d04d      	beq.n	c3e <_printf_i+0x1b6>
     ba2:	4615      	mov	r5, r2
     ba4:	fbb6 f1f3 	udiv	r1, r6, r3
     ba8:	fb03 6711 	mls	r7, r3, r1, r6
     bac:	5dc7      	ldrb	r7, [r0, r7]
     bae:	f805 7d01 	strb.w	r7, [r5, #-1]!
     bb2:	4637      	mov	r7, r6
     bb4:	42bb      	cmp	r3, r7
     bb6:	460e      	mov	r6, r1
     bb8:	d9f4      	bls.n	ba4 <_printf_i+0x11c>
     bba:	2b08      	cmp	r3, #8
     bbc:	d10b      	bne.n	bd6 <_printf_i+0x14e>
     bbe:	6823      	ldr	r3, [r4, #0]
     bc0:	07de      	lsls	r6, r3, #31
     bc2:	d508      	bpl.n	bd6 <_printf_i+0x14e>
     bc4:	6923      	ldr	r3, [r4, #16]
     bc6:	6861      	ldr	r1, [r4, #4]
     bc8:	4299      	cmp	r1, r3
     bca:	bfde      	ittt	le
     bcc:	2330      	movle	r3, #48	; 0x30
     bce:	f805 3c01 	strble.w	r3, [r5, #-1]
     bd2:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     bd6:	1b52      	subs	r2, r2, r5
     bd8:	6122      	str	r2, [r4, #16]
     bda:	464b      	mov	r3, r9
     bdc:	4621      	mov	r1, r4
     bde:	4640      	mov	r0, r8
     be0:	f8cd a000 	str.w	sl, [sp]
     be4:	aa03      	add	r2, sp, #12
     be6:	f7ff fedf 	bl	9a8 <_printf_common>
     bea:	3001      	adds	r0, #1
     bec:	d14c      	bne.n	c88 <_printf_i+0x200>
     bee:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     bf2:	b004      	add	sp, #16
     bf4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     bf8:	4834      	ldr	r0, [pc, #208]	; (ccc <_printf_i+0x244>)
     bfa:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     bfe:	6829      	ldr	r1, [r5, #0]
     c00:	6823      	ldr	r3, [r4, #0]
     c02:	f851 6b04 	ldr.w	r6, [r1], #4
     c06:	6029      	str	r1, [r5, #0]
     c08:	061d      	lsls	r5, r3, #24
     c0a:	d514      	bpl.n	c36 <_printf_i+0x1ae>
     c0c:	07df      	lsls	r7, r3, #31
     c0e:	bf44      	itt	mi
     c10:	f043 0320 	orrmi.w	r3, r3, #32
     c14:	6023      	strmi	r3, [r4, #0]
     c16:	b91e      	cbnz	r6, c20 <_printf_i+0x198>
     c18:	6823      	ldr	r3, [r4, #0]
     c1a:	f023 0320 	bic.w	r3, r3, #32
     c1e:	6023      	str	r3, [r4, #0]
     c20:	2310      	movs	r3, #16
     c22:	e7af      	b.n	b84 <_printf_i+0xfc>
     c24:	6823      	ldr	r3, [r4, #0]
     c26:	f043 0320 	orr.w	r3, r3, #32
     c2a:	6023      	str	r3, [r4, #0]
     c2c:	2378      	movs	r3, #120	; 0x78
     c2e:	4828      	ldr	r0, [pc, #160]	; (cd0 <_printf_i+0x248>)
     c30:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c34:	e7e3      	b.n	bfe <_printf_i+0x176>
     c36:	0659      	lsls	r1, r3, #25
     c38:	bf48      	it	mi
     c3a:	b2b6      	uxthmi	r6, r6
     c3c:	e7e6      	b.n	c0c <_printf_i+0x184>
     c3e:	4615      	mov	r5, r2
     c40:	e7bb      	b.n	bba <_printf_i+0x132>
     c42:	682b      	ldr	r3, [r5, #0]
     c44:	6826      	ldr	r6, [r4, #0]
     c46:	1d18      	adds	r0, r3, #4
     c48:	6961      	ldr	r1, [r4, #20]
     c4a:	6028      	str	r0, [r5, #0]
     c4c:	0635      	lsls	r5, r6, #24
     c4e:	681b      	ldr	r3, [r3, #0]
     c50:	d501      	bpl.n	c56 <_printf_i+0x1ce>
     c52:	6019      	str	r1, [r3, #0]
     c54:	e002      	b.n	c5c <_printf_i+0x1d4>
     c56:	0670      	lsls	r0, r6, #25
     c58:	d5fb      	bpl.n	c52 <_printf_i+0x1ca>
     c5a:	8019      	strh	r1, [r3, #0]
     c5c:	2300      	movs	r3, #0
     c5e:	4615      	mov	r5, r2
     c60:	6123      	str	r3, [r4, #16]
     c62:	e7ba      	b.n	bda <_printf_i+0x152>
     c64:	682b      	ldr	r3, [r5, #0]
     c66:	2100      	movs	r1, #0
     c68:	1d1a      	adds	r2, r3, #4
     c6a:	602a      	str	r2, [r5, #0]
     c6c:	681d      	ldr	r5, [r3, #0]
     c6e:	6862      	ldr	r2, [r4, #4]
     c70:	4628      	mov	r0, r5
     c72:	f000 f82f 	bl	cd4 <memchr>
     c76:	b108      	cbz	r0, c7c <_printf_i+0x1f4>
     c78:	1b40      	subs	r0, r0, r5
     c7a:	6060      	str	r0, [r4, #4]
     c7c:	6863      	ldr	r3, [r4, #4]
     c7e:	6123      	str	r3, [r4, #16]
     c80:	2300      	movs	r3, #0
     c82:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     c86:	e7a8      	b.n	bda <_printf_i+0x152>
     c88:	462a      	mov	r2, r5
     c8a:	4649      	mov	r1, r9
     c8c:	4640      	mov	r0, r8
     c8e:	6923      	ldr	r3, [r4, #16]
     c90:	47d0      	blx	sl
     c92:	3001      	adds	r0, #1
     c94:	d0ab      	beq.n	bee <_printf_i+0x166>
     c96:	6823      	ldr	r3, [r4, #0]
     c98:	079b      	lsls	r3, r3, #30
     c9a:	d413      	bmi.n	cc4 <_printf_i+0x23c>
     c9c:	68e0      	ldr	r0, [r4, #12]
     c9e:	9b03      	ldr	r3, [sp, #12]
     ca0:	4298      	cmp	r0, r3
     ca2:	bfb8      	it	lt
     ca4:	4618      	movlt	r0, r3
     ca6:	e7a4      	b.n	bf2 <_printf_i+0x16a>
     ca8:	2301      	movs	r3, #1
     caa:	4632      	mov	r2, r6
     cac:	4649      	mov	r1, r9
     cae:	4640      	mov	r0, r8
     cb0:	47d0      	blx	sl
     cb2:	3001      	adds	r0, #1
     cb4:	d09b      	beq.n	bee <_printf_i+0x166>
     cb6:	3501      	adds	r5, #1
     cb8:	68e3      	ldr	r3, [r4, #12]
     cba:	9903      	ldr	r1, [sp, #12]
     cbc:	1a5b      	subs	r3, r3, r1
     cbe:	42ab      	cmp	r3, r5
     cc0:	dcf2      	bgt.n	ca8 <_printf_i+0x220>
     cc2:	e7eb      	b.n	c9c <_printf_i+0x214>
     cc4:	2500      	movs	r5, #0
     cc6:	f104 0619 	add.w	r6, r4, #25
     cca:	e7f5      	b.n	cb8 <_printf_i+0x230>
     ccc:	0000101d 	andeq	r1, r0, sp, lsl r0
     cd0:	0000102e 	andeq	r1, r0, lr, lsr #32

00000cd4 <memchr>:
     cd4:	4603      	mov	r3, r0
     cd6:	b510      	push	{r4, lr}
     cd8:	b2c9      	uxtb	r1, r1
     cda:	4402      	add	r2, r0
     cdc:	4293      	cmp	r3, r2
     cde:	4618      	mov	r0, r3
     ce0:	d101      	bne.n	ce6 <memchr+0x12>
     ce2:	2000      	movs	r0, #0
     ce4:	e003      	b.n	cee <memchr+0x1a>
     ce6:	7804      	ldrb	r4, [r0, #0]
     ce8:	3301      	adds	r3, #1
     cea:	428c      	cmp	r4, r1
     cec:	d1f6      	bne.n	cdc <memchr+0x8>
     cee:	bd10      	pop	{r4, pc}

00000cf0 <memcpy>:
     cf0:	440a      	add	r2, r1
     cf2:	4291      	cmp	r1, r2
     cf4:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     cf8:	d100      	bne.n	cfc <memcpy+0xc>
     cfa:	4770      	bx	lr
     cfc:	b510      	push	{r4, lr}
     cfe:	f811 4b01 	ldrb.w	r4, [r1], #1
     d02:	4291      	cmp	r1, r2
     d04:	f803 4f01 	strb.w	r4, [r3, #1]!
     d08:	d1f9      	bne.n	cfe <memcpy+0xe>
     d0a:	bd10      	pop	{r4, pc}

00000d0c <memmove>:
     d0c:	4288      	cmp	r0, r1
     d0e:	b510      	push	{r4, lr}
     d10:	eb01 0402 	add.w	r4, r1, r2
     d14:	d902      	bls.n	d1c <memmove+0x10>
     d16:	4284      	cmp	r4, r0
     d18:	4623      	mov	r3, r4
     d1a:	d807      	bhi.n	d2c <memmove+0x20>
     d1c:	1e43      	subs	r3, r0, #1
     d1e:	42a1      	cmp	r1, r4
     d20:	d008      	beq.n	d34 <memmove+0x28>
     d22:	f811 2b01 	ldrb.w	r2, [r1], #1
     d26:	f803 2f01 	strb.w	r2, [r3, #1]!
     d2a:	e7f8      	b.n	d1e <memmove+0x12>
     d2c:	4601      	mov	r1, r0
     d2e:	4402      	add	r2, r0
     d30:	428a      	cmp	r2, r1
     d32:	d100      	bne.n	d36 <memmove+0x2a>
     d34:	bd10      	pop	{r4, pc}
     d36:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d3a:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d3e:	e7f7      	b.n	d30 <memmove+0x24>

00000d40 <_free_r>:
     d40:	b538      	push	{r3, r4, r5, lr}
     d42:	4605      	mov	r5, r0
     d44:	2900      	cmp	r1, #0
     d46:	d040      	beq.n	dca <_free_r+0x8a>
     d48:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d4c:	1f0c      	subs	r4, r1, #4
     d4e:	2b00      	cmp	r3, #0
     d50:	bfb8      	it	lt
     d52:	18e4      	addlt	r4, r4, r3
     d54:	f000 f910 	bl	f78 <__malloc_lock>
     d58:	4a1c      	ldr	r2, [pc, #112]	; (dcc <_free_r+0x8c>)
     d5a:	6813      	ldr	r3, [r2, #0]
     d5c:	b933      	cbnz	r3, d6c <_free_r+0x2c>
     d5e:	6063      	str	r3, [r4, #4]
     d60:	6014      	str	r4, [r2, #0]
     d62:	4628      	mov	r0, r5
     d64:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d68:	f000 b90c 	b.w	f84 <__malloc_unlock>
     d6c:	42a3      	cmp	r3, r4
     d6e:	d908      	bls.n	d82 <_free_r+0x42>
     d70:	6820      	ldr	r0, [r4, #0]
     d72:	1821      	adds	r1, r4, r0
     d74:	428b      	cmp	r3, r1
     d76:	bf01      	itttt	eq
     d78:	6819      	ldreq	r1, [r3, #0]
     d7a:	685b      	ldreq	r3, [r3, #4]
     d7c:	1809      	addeq	r1, r1, r0
     d7e:	6021      	streq	r1, [r4, #0]
     d80:	e7ed      	b.n	d5e <_free_r+0x1e>
     d82:	461a      	mov	r2, r3
     d84:	685b      	ldr	r3, [r3, #4]
     d86:	b10b      	cbz	r3, d8c <_free_r+0x4c>
     d88:	42a3      	cmp	r3, r4
     d8a:	d9fa      	bls.n	d82 <_free_r+0x42>
     d8c:	6811      	ldr	r1, [r2, #0]
     d8e:	1850      	adds	r0, r2, r1
     d90:	42a0      	cmp	r0, r4
     d92:	d10b      	bne.n	dac <_free_r+0x6c>
     d94:	6820      	ldr	r0, [r4, #0]
     d96:	4401      	add	r1, r0
     d98:	1850      	adds	r0, r2, r1
     d9a:	4283      	cmp	r3, r0
     d9c:	6011      	str	r1, [r2, #0]
     d9e:	d1e0      	bne.n	d62 <_free_r+0x22>
     da0:	6818      	ldr	r0, [r3, #0]
     da2:	685b      	ldr	r3, [r3, #4]
     da4:	4401      	add	r1, r0
     da6:	6011      	str	r1, [r2, #0]
     da8:	6053      	str	r3, [r2, #4]
     daa:	e7da      	b.n	d62 <_free_r+0x22>
     dac:	d902      	bls.n	db4 <_free_r+0x74>
     dae:	230c      	movs	r3, #12
     db0:	602b      	str	r3, [r5, #0]
     db2:	e7d6      	b.n	d62 <_free_r+0x22>
     db4:	6820      	ldr	r0, [r4, #0]
     db6:	1821      	adds	r1, r4, r0
     db8:	428b      	cmp	r3, r1
     dba:	bf01      	itttt	eq
     dbc:	6819      	ldreq	r1, [r3, #0]
     dbe:	685b      	ldreq	r3, [r3, #4]
     dc0:	1809      	addeq	r1, r1, r0
     dc2:	6021      	streq	r1, [r4, #0]
     dc4:	6063      	str	r3, [r4, #4]
     dc6:	6054      	str	r4, [r2, #4]
     dc8:	e7cb      	b.n	d62 <_free_r+0x22>
     dca:	bd38      	pop	{r3, r4, r5, pc}
     dcc:	000100a4 	andeq	r0, r1, r4, lsr #1

00000dd0 <sbrk_aligned>:
     dd0:	b570      	push	{r4, r5, r6, lr}
     dd2:	4e0e      	ldr	r6, [pc, #56]	; (e0c <sbrk_aligned+0x3c>)
     dd4:	460c      	mov	r4, r1
     dd6:	6831      	ldr	r1, [r6, #0]
     dd8:	4605      	mov	r5, r0
     dda:	b911      	cbnz	r1, de2 <sbrk_aligned+0x12>
     ddc:	f000 f8bc 	bl	f58 <_sbrk_r>
     de0:	6030      	str	r0, [r6, #0]
     de2:	4621      	mov	r1, r4
     de4:	4628      	mov	r0, r5
     de6:	f000 f8b7 	bl	f58 <_sbrk_r>
     dea:	1c43      	adds	r3, r0, #1
     dec:	d00a      	beq.n	e04 <sbrk_aligned+0x34>
     dee:	1cc4      	adds	r4, r0, #3
     df0:	f024 0403 	bic.w	r4, r4, #3
     df4:	42a0      	cmp	r0, r4
     df6:	d007      	beq.n	e08 <sbrk_aligned+0x38>
     df8:	1a21      	subs	r1, r4, r0
     dfa:	4628      	mov	r0, r5
     dfc:	f000 f8ac 	bl	f58 <_sbrk_r>
     e00:	3001      	adds	r0, #1
     e02:	d101      	bne.n	e08 <sbrk_aligned+0x38>
     e04:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     e08:	4620      	mov	r0, r4
     e0a:	bd70      	pop	{r4, r5, r6, pc}
     e0c:	000100a8 	andeq	r0, r1, r8, lsr #1

00000e10 <_malloc_r>:
     e10:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     e14:	1ccd      	adds	r5, r1, #3
     e16:	f025 0503 	bic.w	r5, r5, #3
     e1a:	3508      	adds	r5, #8
     e1c:	2d0c      	cmp	r5, #12
     e1e:	bf38      	it	cc
     e20:	250c      	movcc	r5, #12
     e22:	2d00      	cmp	r5, #0
     e24:	4607      	mov	r7, r0
     e26:	db01      	blt.n	e2c <_malloc_r+0x1c>
     e28:	42a9      	cmp	r1, r5
     e2a:	d905      	bls.n	e38 <_malloc_r+0x28>
     e2c:	230c      	movs	r3, #12
     e2e:	2600      	movs	r6, #0
     e30:	603b      	str	r3, [r7, #0]
     e32:	4630      	mov	r0, r6
     e34:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e38:	4e2e      	ldr	r6, [pc, #184]	; (ef4 <_malloc_r+0xe4>)
     e3a:	f000 f89d 	bl	f78 <__malloc_lock>
     e3e:	6833      	ldr	r3, [r6, #0]
     e40:	461c      	mov	r4, r3
     e42:	bb34      	cbnz	r4, e92 <_malloc_r+0x82>
     e44:	4629      	mov	r1, r5
     e46:	4638      	mov	r0, r7
     e48:	f7ff ffc2 	bl	dd0 <sbrk_aligned>
     e4c:	1c43      	adds	r3, r0, #1
     e4e:	4604      	mov	r4, r0
     e50:	d14d      	bne.n	eee <_malloc_r+0xde>
     e52:	6834      	ldr	r4, [r6, #0]
     e54:	4626      	mov	r6, r4
     e56:	2e00      	cmp	r6, #0
     e58:	d140      	bne.n	edc <_malloc_r+0xcc>
     e5a:	6823      	ldr	r3, [r4, #0]
     e5c:	4631      	mov	r1, r6
     e5e:	4638      	mov	r0, r7
     e60:	eb04 0803 	add.w	r8, r4, r3
     e64:	f000 f878 	bl	f58 <_sbrk_r>
     e68:	4580      	cmp	r8, r0
     e6a:	d13a      	bne.n	ee2 <_malloc_r+0xd2>
     e6c:	6821      	ldr	r1, [r4, #0]
     e6e:	3503      	adds	r5, #3
     e70:	1a6d      	subs	r5, r5, r1
     e72:	f025 0503 	bic.w	r5, r5, #3
     e76:	3508      	adds	r5, #8
     e78:	2d0c      	cmp	r5, #12
     e7a:	bf38      	it	cc
     e7c:	250c      	movcc	r5, #12
     e7e:	4638      	mov	r0, r7
     e80:	4629      	mov	r1, r5
     e82:	f7ff ffa5 	bl	dd0 <sbrk_aligned>
     e86:	3001      	adds	r0, #1
     e88:	d02b      	beq.n	ee2 <_malloc_r+0xd2>
     e8a:	6823      	ldr	r3, [r4, #0]
     e8c:	442b      	add	r3, r5
     e8e:	6023      	str	r3, [r4, #0]
     e90:	e00e      	b.n	eb0 <_malloc_r+0xa0>
     e92:	6822      	ldr	r2, [r4, #0]
     e94:	1b52      	subs	r2, r2, r5
     e96:	d41e      	bmi.n	ed6 <_malloc_r+0xc6>
     e98:	2a0b      	cmp	r2, #11
     e9a:	d916      	bls.n	eca <_malloc_r+0xba>
     e9c:	1961      	adds	r1, r4, r5
     e9e:	42a3      	cmp	r3, r4
     ea0:	6025      	str	r5, [r4, #0]
     ea2:	bf18      	it	ne
     ea4:	6059      	strne	r1, [r3, #4]
     ea6:	6863      	ldr	r3, [r4, #4]
     ea8:	bf08      	it	eq
     eaa:	6031      	streq	r1, [r6, #0]
     eac:	5162      	str	r2, [r4, r5]
     eae:	604b      	str	r3, [r1, #4]
     eb0:	4638      	mov	r0, r7
     eb2:	f104 060b 	add.w	r6, r4, #11
     eb6:	f000 f865 	bl	f84 <__malloc_unlock>
     eba:	f026 0607 	bic.w	r6, r6, #7
     ebe:	1d23      	adds	r3, r4, #4
     ec0:	1af2      	subs	r2, r6, r3
     ec2:	d0b6      	beq.n	e32 <_malloc_r+0x22>
     ec4:	1b9b      	subs	r3, r3, r6
     ec6:	50a3      	str	r3, [r4, r2]
     ec8:	e7b3      	b.n	e32 <_malloc_r+0x22>
     eca:	6862      	ldr	r2, [r4, #4]
     ecc:	42a3      	cmp	r3, r4
     ece:	bf0c      	ite	eq
     ed0:	6032      	streq	r2, [r6, #0]
     ed2:	605a      	strne	r2, [r3, #4]
     ed4:	e7ec      	b.n	eb0 <_malloc_r+0xa0>
     ed6:	4623      	mov	r3, r4
     ed8:	6864      	ldr	r4, [r4, #4]
     eda:	e7b2      	b.n	e42 <_malloc_r+0x32>
     edc:	4634      	mov	r4, r6
     ede:	6876      	ldr	r6, [r6, #4]
     ee0:	e7b9      	b.n	e56 <_malloc_r+0x46>
     ee2:	230c      	movs	r3, #12
     ee4:	4638      	mov	r0, r7
     ee6:	603b      	str	r3, [r7, #0]
     ee8:	f000 f84c 	bl	f84 <__malloc_unlock>
     eec:	e7a1      	b.n	e32 <_malloc_r+0x22>
     eee:	6025      	str	r5, [r4, #0]
     ef0:	e7de      	b.n	eb0 <_malloc_r+0xa0>
     ef2:	bf00      	nop
     ef4:	000100a4 	andeq	r0, r1, r4, lsr #1

00000ef8 <_realloc_r>:
     ef8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     efc:	4680      	mov	r8, r0
     efe:	4614      	mov	r4, r2
     f00:	460e      	mov	r6, r1
     f02:	b921      	cbnz	r1, f0e <_realloc_r+0x16>
     f04:	4611      	mov	r1, r2
     f06:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     f0a:	f7ff bf81 	b.w	e10 <_malloc_r>
     f0e:	b92a      	cbnz	r2, f1c <_realloc_r+0x24>
     f10:	f7ff ff16 	bl	d40 <_free_r>
     f14:	4625      	mov	r5, r4
     f16:	4628      	mov	r0, r5
     f18:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f1c:	f000 f838 	bl	f90 <_malloc_usable_size_r>
     f20:	4284      	cmp	r4, r0
     f22:	4607      	mov	r7, r0
     f24:	d802      	bhi.n	f2c <_realloc_r+0x34>
     f26:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f2a:	d812      	bhi.n	f52 <_realloc_r+0x5a>
     f2c:	4621      	mov	r1, r4
     f2e:	4640      	mov	r0, r8
     f30:	f7ff ff6e 	bl	e10 <_malloc_r>
     f34:	4605      	mov	r5, r0
     f36:	2800      	cmp	r0, #0
     f38:	d0ed      	beq.n	f16 <_realloc_r+0x1e>
     f3a:	42bc      	cmp	r4, r7
     f3c:	4622      	mov	r2, r4
     f3e:	4631      	mov	r1, r6
     f40:	bf28      	it	cs
     f42:	463a      	movcs	r2, r7
     f44:	f7ff fed4 	bl	cf0 <memcpy>
     f48:	4631      	mov	r1, r6
     f4a:	4640      	mov	r0, r8
     f4c:	f7ff fef8 	bl	d40 <_free_r>
     f50:	e7e1      	b.n	f16 <_realloc_r+0x1e>
     f52:	4635      	mov	r5, r6
     f54:	e7df      	b.n	f16 <_realloc_r+0x1e>
	...

00000f58 <_sbrk_r>:
     f58:	b538      	push	{r3, r4, r5, lr}
     f5a:	2300      	movs	r3, #0
     f5c:	4d05      	ldr	r5, [pc, #20]	; (f74 <_sbrk_r+0x1c>)
     f5e:	4604      	mov	r4, r0
     f60:	4608      	mov	r0, r1
     f62:	602b      	str	r3, [r5, #0]
     f64:	f000 f81e 	bl	fa4 <_sbrk>
     f68:	1c43      	adds	r3, r0, #1
     f6a:	d102      	bne.n	f72 <_sbrk_r+0x1a>
     f6c:	682b      	ldr	r3, [r5, #0]
     f6e:	b103      	cbz	r3, f72 <_sbrk_r+0x1a>
     f70:	6023      	str	r3, [r4, #0]
     f72:	bd38      	pop	{r3, r4, r5, pc}
     f74:	000100ac 	andeq	r0, r1, ip, lsr #1

00000f78 <__malloc_lock>:
     f78:	4801      	ldr	r0, [pc, #4]	; (f80 <__malloc_lock+0x8>)
     f7a:	f000 b811 	b.w	fa0 <__retarget_lock_acquire_recursive>
     f7e:	bf00      	nop
     f80:	000100b0 	strheq	r0, [r1], -r0	; <UNPREDICTABLE>

00000f84 <__malloc_unlock>:
     f84:	4801      	ldr	r0, [pc, #4]	; (f8c <__malloc_unlock+0x8>)
     f86:	f000 b80c 	b.w	fa2 <__retarget_lock_release_recursive>
     f8a:	bf00      	nop
     f8c:	000100b0 	strheq	r0, [r1], -r0	; <UNPREDICTABLE>

00000f90 <_malloc_usable_size_r>:
     f90:	f851 3c04 	ldr.w	r3, [r1, #-4]
     f94:	1f18      	subs	r0, r3, #4
     f96:	2b00      	cmp	r3, #0
     f98:	bfbc      	itt	lt
     f9a:	580b      	ldrlt	r3, [r1, r0]
     f9c:	18c0      	addlt	r0, r0, r3
     f9e:	4770      	bx	lr

00000fa0 <__retarget_lock_acquire_recursive>:
     fa0:	4770      	bx	lr

00000fa2 <__retarget_lock_release_recursive>:
     fa2:	4770      	bx	lr

00000fa4 <_sbrk>:
     fa4:	4a04      	ldr	r2, [pc, #16]	; (fb8 <_sbrk+0x14>)
     fa6:	4905      	ldr	r1, [pc, #20]	; (fbc <_sbrk+0x18>)
     fa8:	6813      	ldr	r3, [r2, #0]
     faa:	2b00      	cmp	r3, #0
     fac:	bf08      	it	eq
     fae:	460b      	moveq	r3, r1
     fb0:	4418      	add	r0, r3
     fb2:	6010      	str	r0, [r2, #0]
     fb4:	4618      	mov	r0, r3
     fb6:	4770      	bx	lr
     fb8:	000100b4 	strheq	r0, [r1], -r4
     fbc:	000100b8 	strheq	r0, [r1], -r8

00000fc0 <_exit>:
     fc0:	e7fe      	b.n	fc0 <_exit>
     fc2:	bf00      	nop

00000fc4 <_init>:
     fc4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     fc6:	bf00      	nop
     fc8:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fca:	bc08      	pop	{r3}
     fcc:	469e      	mov	lr, r3
     fce:	4770      	bx	lr

00000fd0 <_fini>:
     fd0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     fd2:	bf00      	nop
     fd4:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fd6:	bc08      	pop	{r3}
     fd8:	469e      	mov	lr, r3
     fda:	4770      	bx	lr
     fdc:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
     fe0:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
     fe4:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
     fe8:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
     fec:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
     ff0:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
     ff4:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
     ff8:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
     ffc:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
    1000:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
    1004:	0000000a 	andeq	r0, r0, sl

00001008 <_global_impure_ptr>:
    1008:	00010004 	andeq	r0, r1, r4
    100c:	2b302d23 	blcs	c0c4a0 <__StackTop+0xbfa4a0>
    1010:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    1014:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    1018:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    101c:	32313000 	eorscc	r3, r1, #0
    1020:	36353433 			; <UNDEFINED> instruction: 0x36353433
    1024:	41393837 	teqmi	r9, r7, lsr r8
    1028:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    102c:	31300046 	teqcc	r0, r6, asr #32
    1030:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    1034:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1038:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    103c:	00006665 	andeq	r6, r0, r5, ror #12

00001040 <__EH_FRAME_BEGIN__>:
    1040:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <_impure_ptr>:
   10000:	00010004 	andeq	r0, r1, r4

00010004 <impure_data>:
	...

00010064 <__frame_dummy_init_array_entry>:
   10064:	00000099 	muleq	r0, r9, r0

00010068 <__do_global_dtors_aux_fini_array_entry>:
   10068:	00000075 	andeq	r0, r0, r5, ror r0

Disassembly of section .bss:

0001006c <__bss_start__>:
   1006c:	00000000 	andeq	r0, r0, r0

00010070 <object.0>:
	...

00010088 <huart0>:
	...

000100a4 <__malloc_free_list>:
   100a4:	00000000 	andeq	r0, r0, r0

000100a8 <__malloc_sbrk_start>:
   100a8:	00000000 	andeq	r0, r0, r0

000100ac <errno>:
   100ac:	00000000 	andeq	r0, r0, r0

000100b0 <__lock___malloc_recursive_mutex>:
   100b0:	00000000 	andeq	r0, r0, r0

000100b4 <heap_end.0>:
   100b4:	00000000 	andeq	r0, r0, r0

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
  18:	00000678 	andeq	r0, r0, r8, ror r6
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000006b0 			; <UNDEFINED> instruction: 0x000006b0
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	000006dc 	ldrdeq	r0, [r0], -ip
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	000006f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  80:	000000b6 	strheq	r0, [r0], -r6
  84:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
  88:	86078508 	strhi	r8, [r7], -r8, lsl #10
  8c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  90:	8a038904 	bhi	e24a8 <__StackTop+0xd04a8>
  94:	00018e02 	andeq	r8, r1, r2, lsl #28
  98:	00000028 	andeq	r0, r0, r8, lsr #32
  9c:	00000064 	andeq	r0, r0, r4, rrx
  a0:	00000000 	andeq	r0, r0, r0
  a4:	000000f6 	strdeq	r0, [r0], -r6
  a8:	84300e43 	ldrthi	r0, [r0], #-3651	; 0xfffff1bd
  ac:	86088509 	strhi	r8, [r8], -r9, lsl #10
  b0:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
  b4:	8a048905 	bhi	1224d0 <__StackTop+0x1104d0>
  b8:	8e028b03 	vmlahi.f64	d8, d2, d3
  bc:	0a6a0201 	beq	1a808c8 <__StackTop+0x1a6e8c8>
  c0:	0b42240e 	bleq	1089100 <__StackTop+0x1077100>
  c4:	0000002c 	andeq	r0, r0, ip, lsr #32
  c8:	00000064 	andeq	r0, r0, r4, rrx
  cc:	000007a8 	andeq	r0, r0, r8, lsr #15
  d0:	00000200 	andeq	r0, r0, r0, lsl #4
  d4:	84240e42 	strthi	r0, [r4], #-3650	; 0xfffff1be
  d8:	86088509 	strhi	r8, [r8], -r9, lsl #10
  dc:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
  e0:	8a048905 	bhi	1224fc <__StackTop+0x1104fc>
  e4:	8e028b03 	vmlahi.f64	d8, d2, d3
  e8:	980e4701 	stmdals	lr, {r0, r8, r9, sl, lr}
  ec:	0ae10201 	beq	ff8408f8 <__StackTop+0xff82e8f8>
  f0:	0b42240e 	bleq	1089130 <__StackTop+0x1077130>
  f4:	0000000c 	andeq	r0, r0, ip
  f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 100:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 104:	00000020 	andeq	r0, r0, r0, lsr #32
 108:	000000f4 	strdeq	r0, [r0], -r4
 10c:	000009a8 	andeq	r0, r0, r8, lsr #19
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xd0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000a88 	andeq	r0, r0, r8, lsl #21
 134:	0000024c 	andeq	r0, r0, ip, asr #4
 138:	84300e42 	ldrthi	r0, [r0], #-3650	; 0xfffff1be
 13c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 140:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 144:	8a038904 	bhi	e255c <__StackTop+0xd055c>
 148:	02018e02 	andeq	r8, r1, #2, 28
 14c:	200e0ab4 			; <UNDEFINED> instruction: 0x200e0ab4
 150:	00000b42 	andeq	r0, r0, r2, asr #22
 154:	0000000c 	andeq	r0, r0, ip
 158:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 15c:	7c020001 	stcvc	0, cr0, [r2], {1}
 160:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 164:	00000014 	andeq	r0, r0, r4, lsl r0
 168:	00000154 	andeq	r0, r0, r4, asr r1
 16c:	00000cd4 	ldrdeq	r0, [r0], -r4
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000cf0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000d0c 	andeq	r0, r0, ip, lsl #26
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d40 	andeq	r0, r0, r0, asr #26
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
 21c:	00000dd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000e10 	andeq	r0, r0, r0, lsl lr
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
 268:	00000ef8 	strdeq	r0, [r0], -r8
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
 2a4:	00000f58 	andeq	r0, r0, r8, asr pc
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
 2d0:	00000f78 	andeq	r0, r0, r8, ror pc
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000f84 	andeq	r0, r0, r4, lsl #31
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000f90 	muleq	r0, r0, pc	; <UNPREDICTABLE>
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
 330:	4a018e02 	bmi	63b40 <__StackTop+0x51b40>
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
 3cc:	00000fa0 	andeq	r0, r0, r0, lsr #31
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
 40c:	00000fa2 	andeq	r0, r0, r2, lsr #31
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000fa4 	andeq	r0, r0, r4, lsr #31
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000fc0 	andeq	r0, r0, r0, asr #31
 450:	00000002 	andeq	r0, r0, r2

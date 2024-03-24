
bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00000619 	andeq	r0, r0, r9, lsl r6
       8:	000005a1 	andeq	r0, r0, r1, lsr #11
       c:	000005a3 	andeq	r0, r0, r3, lsr #11
      10:	000005a5 	andeq	r0, r0, r5, lsr #11
      14:	000005a7 	andeq	r0, r0, r7, lsr #11
      18:	000005a9 	andeq	r0, r0, r9, lsr #11
	...
      2c:	000005ab 	andeq	r0, r0, fp, lsr #11
      30:	000005ad 	andeq	r0, r0, sp, lsr #11
      34:	00000000 	andeq	r0, r0, r0
      38:	000005af 	andeq	r0, r0, pc, lsr #11
      3c:	000005b1 			; <UNDEFINED> instruction: 0x000005b1
      40:	000005b5 			; <UNDEFINED> instruction: 0x000005b5
      44:	0000066d 	andeq	r0, r0, sp, ror #12
      48:	0000066f 	andeq	r0, r0, pc, ror #12
      4c:	00000671 	andeq	r0, r0, r1, ror r6
      50:	00000673 	andeq	r0, r0, r3, ror r6
      54:	00000675 	andeq	r0, r0, r5, ror r6
      58:	00000677 	andeq	r0, r0, r7, ror r6
      5c:	00000679 	andeq	r0, r0, r9, ror r6
      60:	0000067b 	andeq	r0, r0, fp, ror r6
      64:	0000067d 	andeq	r0, r0, sp, ror r6
      68:	0000067f 	andeq	r0, r0, pc, ror r6
      6c:	00000681 	andeq	r0, r0, r1, lsl #13
      70:	00000683 	andeq	r0, r0, r3, lsl #13
      74:	00000685 	andeq	r0, r0, r5, lsl #13

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
      90:	0002006c 	andeq	r0, r2, ip, rrx
      94:	00000000 	andeq	r0, r0, r0
      98:	00001050 	andeq	r1, r0, r0, asr r0

0000009c <frame_dummy>:
      9c:	b508      	push	{r3, lr}
      9e:	4b03      	ldr	r3, [pc, #12]	; (ac <frame_dummy+0x10>)
      a0:	b11b      	cbz	r3, aa <frame_dummy+0xe>
      a2:	4903      	ldr	r1, [pc, #12]	; (b0 <frame_dummy+0x14>)
      a4:	4803      	ldr	r0, [pc, #12]	; (b4 <frame_dummy+0x18>)
      a6:	f3af 8000 	nop.w
      aa:	bd08      	pop	{r3, pc}
      ac:	00000000 	andeq	r0, r0, r0
      b0:	00020070 	andeq	r0, r2, r0, ror r0
      b4:	00001050 	andeq	r1, r0, r0, asr r0

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

000000da <drv_uart_default_config>:
      da:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      de:	6043      	str	r3, [r0, #4]
      e0:	230f      	movs	r3, #15
      e2:	7203      	strb	r3, [r0, #8]
      e4:	2300      	movs	r3, #0
      e6:	7243      	strb	r3, [r0, #9]
      e8:	7283      	strb	r3, [r0, #10]
      ea:	72c3      	strb	r3, [r0, #11]
      ec:	7303      	strb	r3, [r0, #12]
      ee:	7343      	strb	r3, [r0, #13]
      f0:	2301      	movs	r3, #1
      f2:	7383      	strb	r3, [r0, #14]
      f4:	4770      	bx	lr
	...

000000f8 <drv_uart_set_config>:
      f8:	b508      	push	{r3, lr}
      fa:	6841      	ldr	r1, [r0, #4]
      fc:	7a03      	ldrb	r3, [r0, #8]
      fe:	fb03 f201 	mul.w	r2, r3, r1
     102:	490e      	ldr	r1, [pc, #56]	; (13c <drv_uart_set_config+0x44>)
     104:	fbb1 f2f2 	udiv	r2, r1, r2
     108:	0419      	lsls	r1, r3, #16
     10a:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     10e:	7a43      	ldrb	r3, [r0, #9]
     110:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     114:	7a83      	ldrb	r3, [r0, #10]
     116:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     11a:	7ac3      	ldrb	r3, [r0, #11]
     11c:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     120:	7b03      	ldrb	r3, [r0, #12]
     122:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     126:	7b42      	ldrb	r2, [r0, #13]
     128:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     12c:	7b82      	ldrb	r2, [r0, #14]
     12e:	4311      	orrs	r1, r2
     130:	6800      	ldr	r0, [r0, #0]
     132:	460a      	mov	r2, r1
     134:	3008      	adds	r0, #8
     136:	f7ff ffbf 	bl	b8 <drv_check_rw_data>
     13a:	bd08      	pop	{r3, pc}
     13c:	02625a00 	rsbeq	r5, r2, #0, 20

00000140 <drv_uart_init>:
     140:	b538      	push	{r3, r4, r5, lr}
     142:	4604      	mov	r4, r0
     144:	2500      	movs	r5, #0
     146:	7485      	strb	r5, [r0, #18]
     148:	74c5      	strb	r5, [r0, #19]
     14a:	f7ff ffd5 	bl	f8 <drv_uart_set_config>
     14e:	7425      	strb	r5, [r4, #16]
     150:	74a5      	strb	r5, [r4, #18]
     152:	74e5      	strb	r5, [r4, #19]
     154:	6822      	ldr	r2, [r4, #0]
     156:	6853      	ldr	r3, [r2, #4]
     158:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     15c:	6053      	str	r3, [r2, #4]
     15e:	6822      	ldr	r2, [r4, #0]
     160:	6853      	ldr	r3, [r2, #4]
     162:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     166:	6053      	str	r3, [r2, #4]
     168:	6822      	ldr	r2, [r4, #0]
     16a:	6853      	ldr	r3, [r2, #4]
     16c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     170:	6053      	str	r3, [r2, #4]
     172:	6822      	ldr	r2, [r4, #0]
     174:	6853      	ldr	r3, [r2, #4]
     176:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     17a:	6053      	str	r3, [r2, #4]
     17c:	6822      	ldr	r2, [r4, #0]
     17e:	6853      	ldr	r3, [r2, #4]
     180:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     184:	6053      	str	r3, [r2, #4]
     186:	6822      	ldr	r2, [r4, #0]
     188:	6853      	ldr	r3, [r2, #4]
     18a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     18e:	6053      	str	r3, [r2, #4]
     190:	6822      	ldr	r2, [r4, #0]
     192:	6853      	ldr	r3, [r2, #4]
     194:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     198:	6053      	str	r3, [r2, #4]
     19a:	6822      	ldr	r2, [r4, #0]
     19c:	6853      	ldr	r3, [r2, #4]
     19e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     1a2:	6053      	str	r3, [r2, #4]
     1a4:	6823      	ldr	r3, [r4, #0]
     1a6:	f240 12ff 	movw	r2, #511	; 0x1ff
     1aa:	611a      	str	r2, [r3, #16]
     1ac:	6823      	ldr	r3, [r4, #0]
     1ae:	611d      	str	r5, [r3, #16]
     1b0:	6822      	ldr	r2, [r4, #0]
     1b2:	6853      	ldr	r3, [r2, #4]
     1b4:	f043 0301 	orr.w	r3, r3, #1
     1b8:	6053      	str	r3, [r2, #4]
     1ba:	6822      	ldr	r2, [r4, #0]
     1bc:	6853      	ldr	r3, [r2, #4]
     1be:	f023 0301 	bic.w	r3, r3, #1
     1c2:	6053      	str	r3, [r2, #4]
     1c4:	6822      	ldr	r2, [r4, #0]
     1c6:	6853      	ldr	r3, [r2, #4]
     1c8:	f043 0302 	orr.w	r3, r3, #2
     1cc:	6053      	str	r3, [r2, #4]
     1ce:	bd38      	pop	{r3, r4, r5, pc}

000001d0 <drv_uart_putchars>:
     1d0:	b410      	push	{r4}
     1d2:	2300      	movs	r3, #0
     1d4:	7483      	strb	r3, [r0, #18]
     1d6:	f890 c012 	ldrb.w	ip, [r0, #18]
     1da:	4594      	cmp	ip, r2
     1dc:	d20c      	bcs.n	1f8 <drv_uart_putchars+0x28>
     1de:	6804      	ldr	r4, [r0, #0]
     1e0:	6963      	ldr	r3, [r4, #20]
     1e2:	0a1b      	lsrs	r3, r3, #8
     1e4:	f013 0f18 	tst.w	r3, #24
     1e8:	d1f5      	bne.n	1d6 <drv_uart_putchars+0x6>
     1ea:	f10c 0301 	add.w	r3, ip, #1
     1ee:	7483      	strb	r3, [r0, #18]
     1f0:	f811 300c 	ldrb.w	r3, [r1, ip]
     1f4:	6023      	str	r3, [r4, #0]
     1f6:	e7ee      	b.n	1d6 <drv_uart_putchars+0x6>
     1f8:	6803      	ldr	r3, [r0, #0]
     1fa:	699a      	ldr	r2, [r3, #24]
     1fc:	f412 7f80 	tst.w	r2, #256	; 0x100
     200:	d0fa      	beq.n	1f8 <drv_uart_putchars+0x28>
     202:	691a      	ldr	r2, [r3, #16]
     204:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     208:	611a      	str	r2, [r3, #16]
     20a:	6803      	ldr	r3, [r0, #0]
     20c:	2200      	movs	r2, #0
     20e:	611a      	str	r2, [r3, #16]
     210:	bc10      	pop	{r4}
     212:	4770      	bx	lr

00000214 <drv_uart_putchar>:
     214:	6802      	ldr	r2, [r0, #0]
     216:	6953      	ldr	r3, [r2, #20]
     218:	0a1b      	lsrs	r3, r3, #8
     21a:	f013 0f18 	tst.w	r3, #24
     21e:	d101      	bne.n	224 <drv_uart_putchar+0x10>
     220:	780b      	ldrb	r3, [r1, #0]
     222:	6013      	str	r3, [r2, #0]
     224:	6803      	ldr	r3, [r0, #0]
     226:	699a      	ldr	r2, [r3, #24]
     228:	f412 7f80 	tst.w	r2, #256	; 0x100
     22c:	d0fa      	beq.n	224 <drv_uart_putchar+0x10>
     22e:	691a      	ldr	r2, [r3, #16]
     230:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     234:	611a      	str	r2, [r3, #16]
     236:	6803      	ldr	r3, [r0, #0]
     238:	2200      	movs	r2, #0
     23a:	611a      	str	r2, [r3, #16]
     23c:	4770      	bx	lr

0000023e <drv_uart_getchar>:
     23e:	b410      	push	{r4}
     240:	e009      	b.n	256 <drv_uart_getchar+0x18>
     242:	69db      	ldr	r3, [r3, #28]
     244:	700b      	strb	r3, [r1, #0]
     246:	2000      	movs	r0, #0
     248:	bc10      	pop	{r4}
     24a:	4770      	bx	lr
     24c:	6803      	ldr	r3, [r0, #0]
     24e:	695a      	ldr	r2, [r3, #20]
     250:	f012 0f1f 	tst.w	r2, #31
     254:	d1f5      	bne.n	242 <drv_uart_getchar+0x4>
     256:	6803      	ldr	r3, [r0, #0]
     258:	699c      	ldr	r4, [r3, #24]
     25a:	691a      	ldr	r2, [r3, #16]
     25c:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     260:	611a      	str	r2, [r3, #16]
     262:	6803      	ldr	r3, [r0, #0]
     264:	2200      	movs	r2, #0
     266:	611a      	str	r2, [r3, #16]
     268:	b2a3      	uxth	r3, r4
     26a:	f014 0f40 	tst.w	r4, #64	; 0x40
     26e:	d001      	beq.n	274 <drv_uart_getchar+0x36>
     270:	2201      	movs	r2, #1
     272:	7402      	strb	r2, [r0, #16]
     274:	f013 0f80 	tst.w	r3, #128	; 0x80
     278:	d001      	beq.n	27e <drv_uart_getchar+0x40>
     27a:	2302      	movs	r3, #2
     27c:	7403      	strb	r3, [r0, #16]
     27e:	7c03      	ldrb	r3, [r0, #16]
     280:	2b00      	cmp	r3, #0
     282:	d0e3      	beq.n	24c <drv_uart_getchar+0xe>
     284:	7a83      	ldrb	r3, [r0, #10]
     286:	2b01      	cmp	r3, #1
     288:	d0e0      	beq.n	24c <drv_uart_getchar+0xe>
     28a:	2300      	movs	r3, #0
     28c:	7403      	strb	r3, [r0, #16]
     28e:	7483      	strb	r3, [r0, #18]
     290:	74c3      	strb	r3, [r0, #19]
     292:	6804      	ldr	r4, [r0, #0]
     294:	6862      	ldr	r2, [r4, #4]
     296:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     29a:	6062      	str	r2, [r4, #4]
     29c:	6804      	ldr	r4, [r0, #0]
     29e:	6862      	ldr	r2, [r4, #4]
     2a0:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2a4:	6062      	str	r2, [r4, #4]
     2a6:	6804      	ldr	r4, [r0, #0]
     2a8:	6862      	ldr	r2, [r4, #4]
     2aa:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2ae:	6062      	str	r2, [r4, #4]
     2b0:	6804      	ldr	r4, [r0, #0]
     2b2:	6862      	ldr	r2, [r4, #4]
     2b4:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2b8:	6062      	str	r2, [r4, #4]
     2ba:	6804      	ldr	r4, [r0, #0]
     2bc:	6862      	ldr	r2, [r4, #4]
     2be:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2c2:	6062      	str	r2, [r4, #4]
     2c4:	6804      	ldr	r4, [r0, #0]
     2c6:	6862      	ldr	r2, [r4, #4]
     2c8:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2cc:	6062      	str	r2, [r4, #4]
     2ce:	6804      	ldr	r4, [r0, #0]
     2d0:	6862      	ldr	r2, [r4, #4]
     2d2:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2d6:	6062      	str	r2, [r4, #4]
     2d8:	6800      	ldr	r0, [r0, #0]
     2da:	6842      	ldr	r2, [r0, #4]
     2dc:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2e0:	6042      	str	r2, [r0, #4]
     2e2:	700b      	strb	r3, [r1, #0]
     2e4:	2001      	movs	r0, #1
     2e6:	e7af      	b.n	248 <drv_uart_getchar+0xa>

000002e8 <uart_int_tx_done_callback>:
     2e8:	4770      	bx	lr

000002ea <uart_int_rx_stop_callback>:
     2ea:	4770      	bx	lr

000002ec <uart_int_rx_parity_error_callback>:
     2ec:	4770      	bx	lr

000002ee <uart_int_rx_noise_detect_callback>:
     2ee:	4770      	bx	lr

000002f0 <uart_int_rx_stop_detect_callback>:
     2f0:	4770      	bx	lr

000002f2 <uart_int_tx_fifo_empty_callback>:
     2f2:	4770      	bx	lr

000002f4 <uart_int_tx_fifo_thres_callback>:
     2f4:	4770      	bx	lr

000002f6 <uart_int_rx_fifo_noempty_callback>:
     2f6:	4770      	bx	lr

000002f8 <uart_int_rx_fifo_thres_callback>:
     2f8:	4770      	bx	lr

000002fa <drv_uart_interrupt_handler>:
     2fa:	b538      	push	{r3, r4, r5, lr}
     2fc:	4604      	mov	r4, r0
     2fe:	6803      	ldr	r3, [r0, #0]
     300:	699d      	ldr	r5, [r3, #24]
     302:	68db      	ldr	r3, [r3, #12]
     304:	b29b      	uxth	r3, r3
     306:	401d      	ands	r5, r3
     308:	f415 7f80 	tst.w	r5, #256	; 0x100
     30c:	d144      	bne.n	398 <drv_uart_interrupt_handler+0x9e>
     30e:	f015 0f40 	tst.w	r5, #64	; 0x40
     312:	d00f      	beq.n	334 <drv_uart_interrupt_handler+0x3a>
     314:	2301      	movs	r3, #1
     316:	7423      	strb	r3, [r4, #16]
     318:	7aa3      	ldrb	r3, [r4, #10]
     31a:	2b01      	cmp	r3, #1
     31c:	d147      	bne.n	3ae <drv_uart_interrupt_handler+0xb4>
     31e:	4620      	mov	r0, r4
     320:	f7ff ffe3 	bl	2ea <uart_int_rx_stop_callback>
     324:	6822      	ldr	r2, [r4, #0]
     326:	6913      	ldr	r3, [r2, #16]
     328:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     32c:	6113      	str	r3, [r2, #16]
     32e:	6823      	ldr	r3, [r4, #0]
     330:	2200      	movs	r2, #0
     332:	611a      	str	r2, [r3, #16]
     334:	f015 0f80 	tst.w	r5, #128	; 0x80
     338:	d00f      	beq.n	35a <drv_uart_interrupt_handler+0x60>
     33a:	2302      	movs	r3, #2
     33c:	7423      	strb	r3, [r4, #16]
     33e:	7aa3      	ldrb	r3, [r4, #10]
     340:	2b01      	cmp	r3, #1
     342:	d166      	bne.n	412 <drv_uart_interrupt_handler+0x118>
     344:	4620      	mov	r0, r4
     346:	f7ff ffd1 	bl	2ec <uart_int_rx_parity_error_callback>
     34a:	6822      	ldr	r2, [r4, #0]
     34c:	6913      	ldr	r3, [r2, #16]
     34e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     352:	6113      	str	r3, [r2, #16]
     354:	6823      	ldr	r3, [r4, #0]
     356:	2200      	movs	r2, #0
     358:	611a      	str	r2, [r3, #16]
     35a:	f015 0f20 	tst.w	r5, #32
     35e:	f040 808a 	bne.w	476 <drv_uart_interrupt_handler+0x17c>
     362:	f015 0f10 	tst.w	r5, #16
     366:	f040 8092 	bne.w	48e <drv_uart_interrupt_handler+0x194>
     36a:	f015 0f01 	tst.w	r5, #1
     36e:	f040 809a 	bne.w	4a6 <drv_uart_interrupt_handler+0x1ac>
     372:	f015 0f02 	tst.w	r5, #2
     376:	f040 80a2 	bne.w	4be <drv_uart_interrupt_handler+0x1c4>
     37a:	f015 0f04 	tst.w	r5, #4
     37e:	f000 80c1 	beq.w	504 <drv_uart_interrupt_handler+0x20a>
     382:	7ce2      	ldrb	r2, [r4, #19]
     384:	7e23      	ldrb	r3, [r4, #24]
     386:	429a      	cmp	r2, r3
     388:	f0c0 80ac 	bcc.w	4e4 <drv_uart_interrupt_handler+0x1ea>
     38c:	6822      	ldr	r2, [r4, #0]
     38e:	68d3      	ldr	r3, [r2, #12]
     390:	f023 030c 	bic.w	r3, r3, #12
     394:	60d3      	str	r3, [r2, #12]
     396:	e0aa      	b.n	4ee <drv_uart_interrupt_handler+0x1f4>
     398:	f7ff ffa6 	bl	2e8 <uart_int_tx_done_callback>
     39c:	6822      	ldr	r2, [r4, #0]
     39e:	6913      	ldr	r3, [r2, #16]
     3a0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3a4:	6113      	str	r3, [r2, #16]
     3a6:	6823      	ldr	r3, [r4, #0]
     3a8:	2200      	movs	r2, #0
     3aa:	611a      	str	r2, [r3, #16]
     3ac:	e7af      	b.n	30e <drv_uart_interrupt_handler+0x14>
     3ae:	6822      	ldr	r2, [r4, #0]
     3b0:	68d3      	ldr	r3, [r2, #12]
     3b2:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3b6:	60d3      	str	r3, [r2, #12]
     3b8:	2300      	movs	r3, #0
     3ba:	7423      	strb	r3, [r4, #16]
     3bc:	74a3      	strb	r3, [r4, #18]
     3be:	74e3      	strb	r3, [r4, #19]
     3c0:	6822      	ldr	r2, [r4, #0]
     3c2:	6853      	ldr	r3, [r2, #4]
     3c4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3c8:	6053      	str	r3, [r2, #4]
     3ca:	6822      	ldr	r2, [r4, #0]
     3cc:	6853      	ldr	r3, [r2, #4]
     3ce:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     3d2:	6053      	str	r3, [r2, #4]
     3d4:	6822      	ldr	r2, [r4, #0]
     3d6:	6853      	ldr	r3, [r2, #4]
     3d8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     3dc:	6053      	str	r3, [r2, #4]
     3de:	6822      	ldr	r2, [r4, #0]
     3e0:	6853      	ldr	r3, [r2, #4]
     3e2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     3e6:	6053      	str	r3, [r2, #4]
     3e8:	6822      	ldr	r2, [r4, #0]
     3ea:	6853      	ldr	r3, [r2, #4]
     3ec:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     3f0:	6053      	str	r3, [r2, #4]
     3f2:	6822      	ldr	r2, [r4, #0]
     3f4:	6853      	ldr	r3, [r2, #4]
     3f6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     3fa:	6053      	str	r3, [r2, #4]
     3fc:	6822      	ldr	r2, [r4, #0]
     3fe:	6853      	ldr	r3, [r2, #4]
     400:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     404:	6053      	str	r3, [r2, #4]
     406:	6822      	ldr	r2, [r4, #0]
     408:	6853      	ldr	r3, [r2, #4]
     40a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     40e:	6053      	str	r3, [r2, #4]
     410:	e785      	b.n	31e <drv_uart_interrupt_handler+0x24>
     412:	6822      	ldr	r2, [r4, #0]
     414:	68d3      	ldr	r3, [r2, #12]
     416:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     41a:	60d3      	str	r3, [r2, #12]
     41c:	2300      	movs	r3, #0
     41e:	7423      	strb	r3, [r4, #16]
     420:	74a3      	strb	r3, [r4, #18]
     422:	74e3      	strb	r3, [r4, #19]
     424:	6822      	ldr	r2, [r4, #0]
     426:	6853      	ldr	r3, [r2, #4]
     428:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     42c:	6053      	str	r3, [r2, #4]
     42e:	6822      	ldr	r2, [r4, #0]
     430:	6853      	ldr	r3, [r2, #4]
     432:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     436:	6053      	str	r3, [r2, #4]
     438:	6822      	ldr	r2, [r4, #0]
     43a:	6853      	ldr	r3, [r2, #4]
     43c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     440:	6053      	str	r3, [r2, #4]
     442:	6822      	ldr	r2, [r4, #0]
     444:	6853      	ldr	r3, [r2, #4]
     446:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     44a:	6053      	str	r3, [r2, #4]
     44c:	6822      	ldr	r2, [r4, #0]
     44e:	6853      	ldr	r3, [r2, #4]
     450:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     454:	6053      	str	r3, [r2, #4]
     456:	6822      	ldr	r2, [r4, #0]
     458:	6853      	ldr	r3, [r2, #4]
     45a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     45e:	6053      	str	r3, [r2, #4]
     460:	6822      	ldr	r2, [r4, #0]
     462:	6853      	ldr	r3, [r2, #4]
     464:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     468:	6053      	str	r3, [r2, #4]
     46a:	6822      	ldr	r2, [r4, #0]
     46c:	6853      	ldr	r3, [r2, #4]
     46e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     472:	6053      	str	r3, [r2, #4]
     474:	e766      	b.n	344 <drv_uart_interrupt_handler+0x4a>
     476:	4620      	mov	r0, r4
     478:	f7ff ff39 	bl	2ee <uart_int_rx_noise_detect_callback>
     47c:	6822      	ldr	r2, [r4, #0]
     47e:	6913      	ldr	r3, [r2, #16]
     480:	f043 0320 	orr.w	r3, r3, #32
     484:	6113      	str	r3, [r2, #16]
     486:	6823      	ldr	r3, [r4, #0]
     488:	2200      	movs	r2, #0
     48a:	611a      	str	r2, [r3, #16]
     48c:	e769      	b.n	362 <drv_uart_interrupt_handler+0x68>
     48e:	4620      	mov	r0, r4
     490:	f7ff ff2e 	bl	2f0 <uart_int_rx_stop_detect_callback>
     494:	6822      	ldr	r2, [r4, #0]
     496:	6913      	ldr	r3, [r2, #16]
     498:	f043 0310 	orr.w	r3, r3, #16
     49c:	6113      	str	r3, [r2, #16]
     49e:	6823      	ldr	r3, [r4, #0]
     4a0:	2200      	movs	r2, #0
     4a2:	611a      	str	r2, [r3, #16]
     4a4:	e761      	b.n	36a <drv_uart_interrupt_handler+0x70>
     4a6:	4620      	mov	r0, r4
     4a8:	f7ff ff24 	bl	2f4 <uart_int_tx_fifo_thres_callback>
     4ac:	6822      	ldr	r2, [r4, #0]
     4ae:	6913      	ldr	r3, [r2, #16]
     4b0:	f043 0301 	orr.w	r3, r3, #1
     4b4:	6113      	str	r3, [r2, #16]
     4b6:	6823      	ldr	r3, [r4, #0]
     4b8:	2200      	movs	r2, #0
     4ba:	611a      	str	r2, [r3, #16]
     4bc:	e759      	b.n	372 <drv_uart_interrupt_handler+0x78>
     4be:	4620      	mov	r0, r4
     4c0:	f7ff ff17 	bl	2f2 <uart_int_tx_fifo_empty_callback>
     4c4:	6822      	ldr	r2, [r4, #0]
     4c6:	6913      	ldr	r3, [r2, #16]
     4c8:	f043 0302 	orr.w	r3, r3, #2
     4cc:	6113      	str	r3, [r2, #16]
     4ce:	6823      	ldr	r3, [r4, #0]
     4d0:	2200      	movs	r2, #0
     4d2:	611a      	str	r2, [r3, #16]
     4d4:	e751      	b.n	37a <drv_uart_interrupt_handler+0x80>
     4d6:	69d9      	ldr	r1, [r3, #28]
     4d8:	6962      	ldr	r2, [r4, #20]
     4da:	7ce3      	ldrb	r3, [r4, #19]
     4dc:	1c58      	adds	r0, r3, #1
     4de:	74e0      	strb	r0, [r4, #19]
     4e0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4e4:	6823      	ldr	r3, [r4, #0]
     4e6:	695a      	ldr	r2, [r3, #20]
     4e8:	f012 0f1f 	tst.w	r2, #31
     4ec:	d1f3      	bne.n	4d6 <drv_uart_interrupt_handler+0x1dc>
     4ee:	4620      	mov	r0, r4
     4f0:	f7ff ff02 	bl	2f8 <uart_int_rx_fifo_thres_callback>
     4f4:	6822      	ldr	r2, [r4, #0]
     4f6:	6913      	ldr	r3, [r2, #16]
     4f8:	f043 0304 	orr.w	r3, r3, #4
     4fc:	6113      	str	r3, [r2, #16]
     4fe:	6823      	ldr	r3, [r4, #0]
     500:	2200      	movs	r2, #0
     502:	611a      	str	r2, [r3, #16]
     504:	f015 0f08 	tst.w	r5, #8
     508:	d020      	beq.n	54c <drv_uart_interrupt_handler+0x252>
     50a:	7ce2      	ldrb	r2, [r4, #19]
     50c:	7e23      	ldrb	r3, [r4, #24]
     50e:	429a      	cmp	r2, r3
     510:	d30c      	bcc.n	52c <drv_uart_interrupt_handler+0x232>
     512:	6822      	ldr	r2, [r4, #0]
     514:	68d3      	ldr	r3, [r2, #12]
     516:	f023 030c 	bic.w	r3, r3, #12
     51a:	60d3      	str	r3, [r2, #12]
     51c:	e00b      	b.n	536 <drv_uart_interrupt_handler+0x23c>
     51e:	69d9      	ldr	r1, [r3, #28]
     520:	6962      	ldr	r2, [r4, #20]
     522:	7ce3      	ldrb	r3, [r4, #19]
     524:	1c58      	adds	r0, r3, #1
     526:	74e0      	strb	r0, [r4, #19]
     528:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     52c:	6823      	ldr	r3, [r4, #0]
     52e:	695a      	ldr	r2, [r3, #20]
     530:	f012 0f1f 	tst.w	r2, #31
     534:	d1f3      	bne.n	51e <drv_uart_interrupt_handler+0x224>
     536:	4620      	mov	r0, r4
     538:	f7ff fedd 	bl	2f6 <uart_int_rx_fifo_noempty_callback>
     53c:	6822      	ldr	r2, [r4, #0]
     53e:	6913      	ldr	r3, [r2, #16]
     540:	f043 0308 	orr.w	r3, r3, #8
     544:	6113      	str	r3, [r2, #16]
     546:	6823      	ldr	r3, [r4, #0]
     548:	2200      	movs	r2, #0
     54a:	611a      	str	r2, [r3, #16]
     54c:	bd38      	pop	{r3, r4, r5, pc}
	...

00000550 <vprintf>:
     550:	b500      	push	{lr}
     552:	b091      	sub	sp, #68	; 0x44
     554:	460a      	mov	r2, r1
     556:	4601      	mov	r1, r0
     558:	4668      	mov	r0, sp
     55a:	f000 f8c7 	bl	6ec <vsiprintf>
     55e:	2800      	cmp	r0, #0
     560:	dc05      	bgt.n	56e <vprintf+0x1e>
     562:	4668      	mov	r0, sp
     564:	f000 f8a4 	bl	6b0 <strlen>
     568:	b011      	add	sp, #68	; 0x44
     56a:	f85d fb04 	ldr.w	pc, [sp], #4
     56e:	4668      	mov	r0, sp
     570:	f000 f89e 	bl	6b0 <strlen>
     574:	b2c2      	uxtb	r2, r0
     576:	4669      	mov	r1, sp
     578:	4801      	ldr	r0, [pc, #4]	; (580 <vprintf+0x30>)
     57a:	f7ff fe29 	bl	1d0 <drv_uart_putchars>
     57e:	e7f0      	b.n	562 <vprintf+0x12>
     580:	00020088 	andeq	r0, r2, r8, lsl #1

00000584 <drv_uart_printf>:
     584:	b40f      	push	{r0, r1, r2, r3}
     586:	b500      	push	{lr}
     588:	b083      	sub	sp, #12
     58a:	a904      	add	r1, sp, #16
     58c:	f851 0b04 	ldr.w	r0, [r1], #4
     590:	9101      	str	r1, [sp, #4]
     592:	f7ff ffdd 	bl	550 <vprintf>
     596:	b003      	add	sp, #12
     598:	f85d eb04 	ldr.w	lr, [sp], #4
     59c:	b004      	add	sp, #16
     59e:	4770      	bx	lr

000005a0 <NMI_Handler>:
     5a0:	4770      	bx	lr

000005a2 <HardFault_Handler>:
     5a2:	e7fe      	b.n	5a2 <HardFault_Handler>

000005a4 <MemManage_Handler>:
     5a4:	e7fe      	b.n	5a4 <MemManage_Handler>

000005a6 <BusFault_Handler>:
     5a6:	e7fe      	b.n	5a6 <BusFault_Handler>

000005a8 <UsageFault_Handler>:
     5a8:	e7fe      	b.n	5a8 <UsageFault_Handler>

000005aa <SVC_Handler>:
     5aa:	4770      	bx	lr

000005ac <DebugMon_Handler>:
     5ac:	4770      	bx	lr

000005ae <PendSV_Handler>:
     5ae:	4770      	bx	lr

000005b0 <SysTick_Handler>:
     5b0:	4770      	bx	lr
	...

000005b4 <Uart0_Handler>:
     5b4:	b508      	push	{r3, lr}
     5b6:	4b04      	ldr	r3, [pc, #16]	; (5c8 <Uart0_Handler+0x14>)
     5b8:	2201      	movs	r2, #1
     5ba:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     5be:	4803      	ldr	r0, [pc, #12]	; (5cc <Uart0_Handler+0x18>)
     5c0:	f7ff fe9b 	bl	2fa <drv_uart_interrupt_handler>
     5c4:	bd08      	pop	{r3, pc}
     5c6:	bf00      	nop
     5c8:	e000e100 	and	lr, r0, r0, lsl #2
     5cc:	00020088 	andeq	r0, r2, r8, lsl #1

000005d0 <main>:
     5d0:	b500      	push	{lr}
     5d2:	b083      	sub	sp, #12
     5d4:	4c0d      	ldr	r4, [pc, #52]	; (60c <main+0x3c>)
     5d6:	4b0e      	ldr	r3, [pc, #56]	; (610 <main+0x40>)
     5d8:	6023      	str	r3, [r4, #0]
     5da:	4620      	mov	r0, r4
     5dc:	f7ff fd7d 	bl	da <drv_uart_default_config>
     5e0:	4620      	mov	r0, r4
     5e2:	f7ff fdad 	bl	140 <drv_uart_init>
     5e6:	480b      	ldr	r0, [pc, #44]	; (614 <main+0x44>)
     5e8:	f7ff ffcc 	bl	584 <drv_uart_printf>
     5ec:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     5f0:	22ed      	movs	r2, #237	; 0xed
     5f2:	601a      	str	r2, [r3, #0]
     5f4:	4c05      	ldr	r4, [pc, #20]	; (60c <main+0x3c>)
     5f6:	f10d 0107 	add.w	r1, sp, #7
     5fa:	4620      	mov	r0, r4
     5fc:	f7ff fe1f 	bl	23e <drv_uart_getchar>
     600:	f10d 0107 	add.w	r1, sp, #7
     604:	4620      	mov	r0, r4
     606:	f7ff fe05 	bl	214 <drv_uart_putchar>
     60a:	e7f3      	b.n	5f4 <main+0x24>
     60c:	00020088 	andeq	r0, r2, r8, lsl #1
     610:	40001000 	andmi	r1, r0, r0
     614:	00000fec 	andeq	r0, r0, ip, ror #31

00000618 <Reset_Handler>:
     618:	490a      	ldr	r1, [pc, #40]	; (644 <Reset_Handler+0x2c>)
     61a:	4a0b      	ldr	r2, [pc, #44]	; (648 <Reset_Handler+0x30>)
     61c:	4b0b      	ldr	r3, [pc, #44]	; (64c <Reset_Handler+0x34>)
     61e:	1a9b      	subs	r3, r3, r2
     620:	dd03      	ble.n	62a <Reset_Handler+0x12>
     622:	3b04      	subs	r3, #4
     624:	58c8      	ldr	r0, [r1, r3]
     626:	50d0      	str	r0, [r2, r3]
     628:	dcfb      	bgt.n	622 <Reset_Handler+0xa>
     62a:	4909      	ldr	r1, [pc, #36]	; (650 <Reset_Handler+0x38>)
     62c:	4a09      	ldr	r2, [pc, #36]	; (654 <Reset_Handler+0x3c>)
     62e:	2000      	movs	r0, #0
     630:	4291      	cmp	r1, r2
     632:	bfbc      	itt	lt
     634:	f841 0b04 	strlt.w	r0, [r1], #4
     638:	e7fa      	blt.n	630 <Reset_Handler+0x18>
     63a:	f7ff ffc9 	bl	5d0 <main>
     63e:	f000 f823 	bl	688 <exit>
     642:	10540000 	subsne	r0, r4, r0
     646:	00000000 	andeq	r0, r0, r0
     64a:	006c0002 	rsbeq	r0, ip, r2
     64e:	006c0002 	rsbeq	r0, ip, r2
     652:	00b80002 	adcseq	r0, r8, r2
     656:	e7fe0002 	ldrb	r0, [lr, r2]!
     65a:	e7fe      	b.n	65a <Reset_Handler+0x42>
     65c:	e7fe      	b.n	65c <Reset_Handler+0x44>
     65e:	e7fe      	b.n	65e <Reset_Handler+0x46>
     660:	e7fe      	b.n	660 <Reset_Handler+0x48>
     662:	e7fe      	b.n	662 <Reset_Handler+0x4a>
     664:	e7fe      	b.n	664 <Reset_Handler+0x4c>
     666:	e7fe      	b.n	666 <Reset_Handler+0x4e>
     668:	e7fe      	b.n	668 <Reset_Handler+0x50>
     66a:	e7fe      	b.n	66a <Reset_Handler+0x52>

0000066c <Uart1_Handler>:
     66c:	e7fe      	b.n	66c <Uart1_Handler>

0000066e <Resv2_Handler>:
     66e:	e7fe      	b.n	66e <Resv2_Handler>

00000670 <Resv3_Handler>:
     670:	e7fe      	b.n	670 <Resv3_Handler>

00000672 <Resv4_Handler>:
     672:	e7fe      	b.n	672 <Resv4_Handler>

00000674 <Gpioa_Handler>:
     674:	e7fe      	b.n	674 <Gpioa_Handler>

00000676 <Resv6_Handler>:
     676:	e7fe      	b.n	676 <Resv6_Handler>

00000678 <Resv7_Handler>:
     678:	e7fe      	b.n	678 <Resv7_Handler>

0000067a <Bastim_Ch0_Handler>:
     67a:	e7fe      	b.n	67a <Bastim_Ch0_Handler>

0000067c <Bastim_Ch1_Handler>:
     67c:	e7fe      	b.n	67c <Bastim_Ch1_Handler>

0000067e <Bastim_Ch2_Handler>:
     67e:	e7fe      	b.n	67e <Bastim_Ch2_Handler>

00000680 <Bastim_Ch3_Handler>:
     680:	e7fe      	b.n	680 <Bastim_Ch3_Handler>

00000682 <EthSma_Handler>:
     682:	e7fe      	b.n	682 <EthSma_Handler>

00000684 <Resv13_Handler>:
     684:	e7fe      	b.n	684 <Resv13_Handler>
     686:	bf00      	nop

00000688 <exit>:
     688:	b508      	push	{r3, lr}
     68a:	4b07      	ldr	r3, [pc, #28]	; (6a8 <exit+0x20>)
     68c:	4604      	mov	r4, r0
     68e:	b113      	cbz	r3, 696 <exit+0xe>
     690:	2100      	movs	r1, #0
     692:	f3af 8000 	nop.w
     696:	4b05      	ldr	r3, [pc, #20]	; (6ac <exit+0x24>)
     698:	6818      	ldr	r0, [r3, #0]
     69a:	6a83      	ldr	r3, [r0, #40]	; 0x28
     69c:	b103      	cbz	r3, 6a0 <exit+0x18>
     69e:	4798      	blx	r3
     6a0:	4620      	mov	r0, r4
     6a2:	f000 fc95 	bl	fd0 <_exit>
     6a6:	bf00      	nop
     6a8:	00000000 	andeq	r0, r0, r0
     6ac:	00001018 	andeq	r1, r0, r8, lsl r0

000006b0 <strlen>:
     6b0:	4603      	mov	r3, r0
     6b2:	f813 2b01 	ldrb.w	r2, [r3], #1
     6b6:	2a00      	cmp	r2, #0
     6b8:	d1fb      	bne.n	6b2 <strlen+0x2>
     6ba:	1a18      	subs	r0, r3, r0
     6bc:	3801      	subs	r0, #1
     6be:	4770      	bx	lr

000006c0 <_vsiprintf_r>:
     6c0:	b500      	push	{lr}
     6c2:	b09b      	sub	sp, #108	; 0x6c
     6c4:	9100      	str	r1, [sp, #0]
     6c6:	9104      	str	r1, [sp, #16]
     6c8:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     6cc:	9105      	str	r1, [sp, #20]
     6ce:	9102      	str	r1, [sp, #8]
     6d0:	4905      	ldr	r1, [pc, #20]	; (6e8 <_vsiprintf_r+0x28>)
     6d2:	9103      	str	r1, [sp, #12]
     6d4:	4669      	mov	r1, sp
     6d6:	f000 f86f 	bl	7b8 <_svfiprintf_r>
     6da:	2200      	movs	r2, #0
     6dc:	9b00      	ldr	r3, [sp, #0]
     6de:	701a      	strb	r2, [r3, #0]
     6e0:	b01b      	add	sp, #108	; 0x6c
     6e2:	f85d fb04 	ldr.w	pc, [sp], #4
     6e6:	bf00      	nop
     6e8:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

000006ec <vsiprintf>:
     6ec:	4613      	mov	r3, r2
     6ee:	460a      	mov	r2, r1
     6f0:	4601      	mov	r1, r0
     6f2:	4802      	ldr	r0, [pc, #8]	; (6fc <vsiprintf+0x10>)
     6f4:	6800      	ldr	r0, [r0, #0]
     6f6:	f7ff bfe3 	b.w	6c0 <_vsiprintf_r>
     6fa:	bf00      	nop
     6fc:	00020000 	andeq	r0, r2, r0

00000700 <__ssputs_r>:
     700:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     704:	688e      	ldr	r6, [r1, #8]
     706:	4682      	mov	sl, r0
     708:	429e      	cmp	r6, r3
     70a:	460c      	mov	r4, r1
     70c:	4690      	mov	r8, r2
     70e:	461f      	mov	r7, r3
     710:	d838      	bhi.n	784 <__ssputs_r+0x84>
     712:	898a      	ldrh	r2, [r1, #12]
     714:	f412 6f90 	tst.w	r2, #1152	; 0x480
     718:	d032      	beq.n	780 <__ssputs_r+0x80>
     71a:	6825      	ldr	r5, [r4, #0]
     71c:	6909      	ldr	r1, [r1, #16]
     71e:	3301      	adds	r3, #1
     720:	eba5 0901 	sub.w	r9, r5, r1
     724:	6965      	ldr	r5, [r4, #20]
     726:	444b      	add	r3, r9
     728:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     72c:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     730:	106d      	asrs	r5, r5, #1
     732:	429d      	cmp	r5, r3
     734:	bf38      	it	cc
     736:	461d      	movcc	r5, r3
     738:	0553      	lsls	r3, r2, #21
     73a:	d531      	bpl.n	7a0 <__ssputs_r+0xa0>
     73c:	4629      	mov	r1, r5
     73e:	f000 fb6f 	bl	e20 <_malloc_r>
     742:	4606      	mov	r6, r0
     744:	b950      	cbnz	r0, 75c <__ssputs_r+0x5c>
     746:	230c      	movs	r3, #12
     748:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     74c:	f8ca 3000 	str.w	r3, [sl]
     750:	89a3      	ldrh	r3, [r4, #12]
     752:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     756:	81a3      	strh	r3, [r4, #12]
     758:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     75c:	464a      	mov	r2, r9
     75e:	6921      	ldr	r1, [r4, #16]
     760:	f000 face 	bl	d00 <memcpy>
     764:	89a3      	ldrh	r3, [r4, #12]
     766:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     76a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     76e:	81a3      	strh	r3, [r4, #12]
     770:	6126      	str	r6, [r4, #16]
     772:	444e      	add	r6, r9
     774:	6026      	str	r6, [r4, #0]
     776:	463e      	mov	r6, r7
     778:	6165      	str	r5, [r4, #20]
     77a:	eba5 0509 	sub.w	r5, r5, r9
     77e:	60a5      	str	r5, [r4, #8]
     780:	42be      	cmp	r6, r7
     782:	d900      	bls.n	786 <__ssputs_r+0x86>
     784:	463e      	mov	r6, r7
     786:	4632      	mov	r2, r6
     788:	4641      	mov	r1, r8
     78a:	6820      	ldr	r0, [r4, #0]
     78c:	f000 fac6 	bl	d1c <memmove>
     790:	68a3      	ldr	r3, [r4, #8]
     792:	2000      	movs	r0, #0
     794:	1b9b      	subs	r3, r3, r6
     796:	60a3      	str	r3, [r4, #8]
     798:	6823      	ldr	r3, [r4, #0]
     79a:	4433      	add	r3, r6
     79c:	6023      	str	r3, [r4, #0]
     79e:	e7db      	b.n	758 <__ssputs_r+0x58>
     7a0:	462a      	mov	r2, r5
     7a2:	f000 fbb1 	bl	f08 <_realloc_r>
     7a6:	4606      	mov	r6, r0
     7a8:	2800      	cmp	r0, #0
     7aa:	d1e1      	bne.n	770 <__ssputs_r+0x70>
     7ac:	4650      	mov	r0, sl
     7ae:	6921      	ldr	r1, [r4, #16]
     7b0:	f000 face 	bl	d50 <_free_r>
     7b4:	e7c7      	b.n	746 <__ssputs_r+0x46>
	...

000007b8 <_svfiprintf_r>:
     7b8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7bc:	4698      	mov	r8, r3
     7be:	898b      	ldrh	r3, [r1, #12]
     7c0:	4607      	mov	r7, r0
     7c2:	061b      	lsls	r3, r3, #24
     7c4:	460d      	mov	r5, r1
     7c6:	4614      	mov	r4, r2
     7c8:	b09d      	sub	sp, #116	; 0x74
     7ca:	d50e      	bpl.n	7ea <_svfiprintf_r+0x32>
     7cc:	690b      	ldr	r3, [r1, #16]
     7ce:	b963      	cbnz	r3, 7ea <_svfiprintf_r+0x32>
     7d0:	2140      	movs	r1, #64	; 0x40
     7d2:	f000 fb25 	bl	e20 <_malloc_r>
     7d6:	6028      	str	r0, [r5, #0]
     7d8:	6128      	str	r0, [r5, #16]
     7da:	b920      	cbnz	r0, 7e6 <_svfiprintf_r+0x2e>
     7dc:	230c      	movs	r3, #12
     7de:	603b      	str	r3, [r7, #0]
     7e0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     7e4:	e0d1      	b.n	98a <_svfiprintf_r+0x1d2>
     7e6:	2340      	movs	r3, #64	; 0x40
     7e8:	616b      	str	r3, [r5, #20]
     7ea:	2300      	movs	r3, #0
     7ec:	9309      	str	r3, [sp, #36]	; 0x24
     7ee:	2320      	movs	r3, #32
     7f0:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     7f4:	2330      	movs	r3, #48	; 0x30
     7f6:	f04f 0901 	mov.w	r9, #1
     7fa:	f8cd 800c 	str.w	r8, [sp, #12]
     7fe:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 9a4 <_svfiprintf_r+0x1ec>
     802:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     806:	4623      	mov	r3, r4
     808:	469a      	mov	sl, r3
     80a:	f813 2b01 	ldrb.w	r2, [r3], #1
     80e:	b10a      	cbz	r2, 814 <_svfiprintf_r+0x5c>
     810:	2a25      	cmp	r2, #37	; 0x25
     812:	d1f9      	bne.n	808 <_svfiprintf_r+0x50>
     814:	ebba 0b04 	subs.w	fp, sl, r4
     818:	d00b      	beq.n	832 <_svfiprintf_r+0x7a>
     81a:	465b      	mov	r3, fp
     81c:	4622      	mov	r2, r4
     81e:	4629      	mov	r1, r5
     820:	4638      	mov	r0, r7
     822:	f7ff ff6d 	bl	700 <__ssputs_r>
     826:	3001      	adds	r0, #1
     828:	f000 80aa 	beq.w	980 <_svfiprintf_r+0x1c8>
     82c:	9a09      	ldr	r2, [sp, #36]	; 0x24
     82e:	445a      	add	r2, fp
     830:	9209      	str	r2, [sp, #36]	; 0x24
     832:	f89a 3000 	ldrb.w	r3, [sl]
     836:	2b00      	cmp	r3, #0
     838:	f000 80a2 	beq.w	980 <_svfiprintf_r+0x1c8>
     83c:	2300      	movs	r3, #0
     83e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     842:	e9cd 2305 	strd	r2, r3, [sp, #20]
     846:	f10a 0a01 	add.w	sl, sl, #1
     84a:	9304      	str	r3, [sp, #16]
     84c:	9307      	str	r3, [sp, #28]
     84e:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     852:	931a      	str	r3, [sp, #104]	; 0x68
     854:	4654      	mov	r4, sl
     856:	2205      	movs	r2, #5
     858:	f814 1b01 	ldrb.w	r1, [r4], #1
     85c:	4851      	ldr	r0, [pc, #324]	; (9a4 <_svfiprintf_r+0x1ec>)
     85e:	f000 fa41 	bl	ce4 <memchr>
     862:	9a04      	ldr	r2, [sp, #16]
     864:	b9d8      	cbnz	r0, 89e <_svfiprintf_r+0xe6>
     866:	06d0      	lsls	r0, r2, #27
     868:	bf44      	itt	mi
     86a:	2320      	movmi	r3, #32
     86c:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     870:	0711      	lsls	r1, r2, #28
     872:	bf44      	itt	mi
     874:	232b      	movmi	r3, #43	; 0x2b
     876:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     87a:	f89a 3000 	ldrb.w	r3, [sl]
     87e:	2b2a      	cmp	r3, #42	; 0x2a
     880:	d015      	beq.n	8ae <_svfiprintf_r+0xf6>
     882:	4654      	mov	r4, sl
     884:	2000      	movs	r0, #0
     886:	f04f 0c0a 	mov.w	ip, #10
     88a:	9a07      	ldr	r2, [sp, #28]
     88c:	4621      	mov	r1, r4
     88e:	f811 3b01 	ldrb.w	r3, [r1], #1
     892:	3b30      	subs	r3, #48	; 0x30
     894:	2b09      	cmp	r3, #9
     896:	d94e      	bls.n	936 <_svfiprintf_r+0x17e>
     898:	b1b0      	cbz	r0, 8c8 <_svfiprintf_r+0x110>
     89a:	9207      	str	r2, [sp, #28]
     89c:	e014      	b.n	8c8 <_svfiprintf_r+0x110>
     89e:	eba0 0308 	sub.w	r3, r0, r8
     8a2:	fa09 f303 	lsl.w	r3, r9, r3
     8a6:	4313      	orrs	r3, r2
     8a8:	46a2      	mov	sl, r4
     8aa:	9304      	str	r3, [sp, #16]
     8ac:	e7d2      	b.n	854 <_svfiprintf_r+0x9c>
     8ae:	9b03      	ldr	r3, [sp, #12]
     8b0:	1d19      	adds	r1, r3, #4
     8b2:	681b      	ldr	r3, [r3, #0]
     8b4:	9103      	str	r1, [sp, #12]
     8b6:	2b00      	cmp	r3, #0
     8b8:	bfbb      	ittet	lt
     8ba:	425b      	neglt	r3, r3
     8bc:	f042 0202 	orrlt.w	r2, r2, #2
     8c0:	9307      	strge	r3, [sp, #28]
     8c2:	9307      	strlt	r3, [sp, #28]
     8c4:	bfb8      	it	lt
     8c6:	9204      	strlt	r2, [sp, #16]
     8c8:	7823      	ldrb	r3, [r4, #0]
     8ca:	2b2e      	cmp	r3, #46	; 0x2e
     8cc:	d10c      	bne.n	8e8 <_svfiprintf_r+0x130>
     8ce:	7863      	ldrb	r3, [r4, #1]
     8d0:	2b2a      	cmp	r3, #42	; 0x2a
     8d2:	d135      	bne.n	940 <_svfiprintf_r+0x188>
     8d4:	9b03      	ldr	r3, [sp, #12]
     8d6:	3402      	adds	r4, #2
     8d8:	1d1a      	adds	r2, r3, #4
     8da:	681b      	ldr	r3, [r3, #0]
     8dc:	9203      	str	r2, [sp, #12]
     8de:	2b00      	cmp	r3, #0
     8e0:	bfb8      	it	lt
     8e2:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     8e6:	9305      	str	r3, [sp, #20]
     8e8:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 9a8 <_svfiprintf_r+0x1f0>
     8ec:	2203      	movs	r2, #3
     8ee:	4650      	mov	r0, sl
     8f0:	7821      	ldrb	r1, [r4, #0]
     8f2:	f000 f9f7 	bl	ce4 <memchr>
     8f6:	b140      	cbz	r0, 90a <_svfiprintf_r+0x152>
     8f8:	2340      	movs	r3, #64	; 0x40
     8fa:	eba0 000a 	sub.w	r0, r0, sl
     8fe:	fa03 f000 	lsl.w	r0, r3, r0
     902:	9b04      	ldr	r3, [sp, #16]
     904:	3401      	adds	r4, #1
     906:	4303      	orrs	r3, r0
     908:	9304      	str	r3, [sp, #16]
     90a:	f814 1b01 	ldrb.w	r1, [r4], #1
     90e:	2206      	movs	r2, #6
     910:	4826      	ldr	r0, [pc, #152]	; (9ac <_svfiprintf_r+0x1f4>)
     912:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     916:	f000 f9e5 	bl	ce4 <memchr>
     91a:	2800      	cmp	r0, #0
     91c:	d038      	beq.n	990 <_svfiprintf_r+0x1d8>
     91e:	4b24      	ldr	r3, [pc, #144]	; (9b0 <_svfiprintf_r+0x1f8>)
     920:	bb1b      	cbnz	r3, 96a <_svfiprintf_r+0x1b2>
     922:	9b03      	ldr	r3, [sp, #12]
     924:	3307      	adds	r3, #7
     926:	f023 0307 	bic.w	r3, r3, #7
     92a:	3308      	adds	r3, #8
     92c:	9303      	str	r3, [sp, #12]
     92e:	9b09      	ldr	r3, [sp, #36]	; 0x24
     930:	4433      	add	r3, r6
     932:	9309      	str	r3, [sp, #36]	; 0x24
     934:	e767      	b.n	806 <_svfiprintf_r+0x4e>
     936:	460c      	mov	r4, r1
     938:	2001      	movs	r0, #1
     93a:	fb0c 3202 	mla	r2, ip, r2, r3
     93e:	e7a5      	b.n	88c <_svfiprintf_r+0xd4>
     940:	2300      	movs	r3, #0
     942:	f04f 0c0a 	mov.w	ip, #10
     946:	4619      	mov	r1, r3
     948:	3401      	adds	r4, #1
     94a:	9305      	str	r3, [sp, #20]
     94c:	4620      	mov	r0, r4
     94e:	f810 2b01 	ldrb.w	r2, [r0], #1
     952:	3a30      	subs	r2, #48	; 0x30
     954:	2a09      	cmp	r2, #9
     956:	d903      	bls.n	960 <_svfiprintf_r+0x1a8>
     958:	2b00      	cmp	r3, #0
     95a:	d0c5      	beq.n	8e8 <_svfiprintf_r+0x130>
     95c:	9105      	str	r1, [sp, #20]
     95e:	e7c3      	b.n	8e8 <_svfiprintf_r+0x130>
     960:	4604      	mov	r4, r0
     962:	2301      	movs	r3, #1
     964:	fb0c 2101 	mla	r1, ip, r1, r2
     968:	e7f0      	b.n	94c <_svfiprintf_r+0x194>
     96a:	ab03      	add	r3, sp, #12
     96c:	9300      	str	r3, [sp, #0]
     96e:	462a      	mov	r2, r5
     970:	4638      	mov	r0, r7
     972:	4b10      	ldr	r3, [pc, #64]	; (9b4 <_svfiprintf_r+0x1fc>)
     974:	a904      	add	r1, sp, #16
     976:	f3af 8000 	nop.w
     97a:	1c42      	adds	r2, r0, #1
     97c:	4606      	mov	r6, r0
     97e:	d1d6      	bne.n	92e <_svfiprintf_r+0x176>
     980:	89ab      	ldrh	r3, [r5, #12]
     982:	065b      	lsls	r3, r3, #25
     984:	f53f af2c 	bmi.w	7e0 <_svfiprintf_r+0x28>
     988:	9809      	ldr	r0, [sp, #36]	; 0x24
     98a:	b01d      	add	sp, #116	; 0x74
     98c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     990:	ab03      	add	r3, sp, #12
     992:	9300      	str	r3, [sp, #0]
     994:	462a      	mov	r2, r5
     996:	4638      	mov	r0, r7
     998:	4b06      	ldr	r3, [pc, #24]	; (9b4 <_svfiprintf_r+0x1fc>)
     99a:	a904      	add	r1, sp, #16
     99c:	f000 f87c 	bl	a98 <_printf_i>
     9a0:	e7eb      	b.n	97a <_svfiprintf_r+0x1c2>
     9a2:	bf00      	nop
     9a4:	0000101c 	andeq	r1, r0, ip, lsl r0
     9a8:	00001022 	andeq	r1, r0, r2, lsr #32
     9ac:	00001026 	andeq	r1, r0, r6, lsr #32
     9b0:	00000000 	andeq	r0, r0, r0
     9b4:	00000701 	andeq	r0, r0, r1, lsl #14

000009b8 <_printf_common>:
     9b8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     9bc:	4616      	mov	r6, r2
     9be:	4699      	mov	r9, r3
     9c0:	688a      	ldr	r2, [r1, #8]
     9c2:	690b      	ldr	r3, [r1, #16]
     9c4:	4607      	mov	r7, r0
     9c6:	4293      	cmp	r3, r2
     9c8:	bfb8      	it	lt
     9ca:	4613      	movlt	r3, r2
     9cc:	6033      	str	r3, [r6, #0]
     9ce:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     9d2:	460c      	mov	r4, r1
     9d4:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9d8:	b10a      	cbz	r2, 9de <_printf_common+0x26>
     9da:	3301      	adds	r3, #1
     9dc:	6033      	str	r3, [r6, #0]
     9de:	6823      	ldr	r3, [r4, #0]
     9e0:	0699      	lsls	r1, r3, #26
     9e2:	bf42      	ittt	mi
     9e4:	6833      	ldrmi	r3, [r6, #0]
     9e6:	3302      	addmi	r3, #2
     9e8:	6033      	strmi	r3, [r6, #0]
     9ea:	6825      	ldr	r5, [r4, #0]
     9ec:	f015 0506 	ands.w	r5, r5, #6
     9f0:	d106      	bne.n	a00 <_printf_common+0x48>
     9f2:	f104 0a19 	add.w	sl, r4, #25
     9f6:	68e3      	ldr	r3, [r4, #12]
     9f8:	6832      	ldr	r2, [r6, #0]
     9fa:	1a9b      	subs	r3, r3, r2
     9fc:	42ab      	cmp	r3, r5
     9fe:	dc28      	bgt.n	a52 <_printf_common+0x9a>
     a00:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     a04:	1e13      	subs	r3, r2, #0
     a06:	6822      	ldr	r2, [r4, #0]
     a08:	bf18      	it	ne
     a0a:	2301      	movne	r3, #1
     a0c:	0692      	lsls	r2, r2, #26
     a0e:	d42d      	bmi.n	a6c <_printf_common+0xb4>
     a10:	4649      	mov	r1, r9
     a12:	4638      	mov	r0, r7
     a14:	f104 0243 	add.w	r2, r4, #67	; 0x43
     a18:	47c0      	blx	r8
     a1a:	3001      	adds	r0, #1
     a1c:	d020      	beq.n	a60 <_printf_common+0xa8>
     a1e:	6823      	ldr	r3, [r4, #0]
     a20:	68e5      	ldr	r5, [r4, #12]
     a22:	f003 0306 	and.w	r3, r3, #6
     a26:	2b04      	cmp	r3, #4
     a28:	bf18      	it	ne
     a2a:	2500      	movne	r5, #0
     a2c:	6832      	ldr	r2, [r6, #0]
     a2e:	f04f 0600 	mov.w	r6, #0
     a32:	68a3      	ldr	r3, [r4, #8]
     a34:	bf08      	it	eq
     a36:	1aad      	subeq	r5, r5, r2
     a38:	6922      	ldr	r2, [r4, #16]
     a3a:	bf08      	it	eq
     a3c:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a40:	4293      	cmp	r3, r2
     a42:	bfc4      	itt	gt
     a44:	1a9b      	subgt	r3, r3, r2
     a46:	18ed      	addgt	r5, r5, r3
     a48:	341a      	adds	r4, #26
     a4a:	42b5      	cmp	r5, r6
     a4c:	d11a      	bne.n	a84 <_printf_common+0xcc>
     a4e:	2000      	movs	r0, #0
     a50:	e008      	b.n	a64 <_printf_common+0xac>
     a52:	2301      	movs	r3, #1
     a54:	4652      	mov	r2, sl
     a56:	4649      	mov	r1, r9
     a58:	4638      	mov	r0, r7
     a5a:	47c0      	blx	r8
     a5c:	3001      	adds	r0, #1
     a5e:	d103      	bne.n	a68 <_printf_common+0xb0>
     a60:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a64:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a68:	3501      	adds	r5, #1
     a6a:	e7c4      	b.n	9f6 <_printf_common+0x3e>
     a6c:	2030      	movs	r0, #48	; 0x30
     a6e:	18e1      	adds	r1, r4, r3
     a70:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a74:	1c5a      	adds	r2, r3, #1
     a76:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a7a:	4422      	add	r2, r4
     a7c:	3302      	adds	r3, #2
     a7e:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     a82:	e7c5      	b.n	a10 <_printf_common+0x58>
     a84:	2301      	movs	r3, #1
     a86:	4622      	mov	r2, r4
     a88:	4649      	mov	r1, r9
     a8a:	4638      	mov	r0, r7
     a8c:	47c0      	blx	r8
     a8e:	3001      	adds	r0, #1
     a90:	d0e6      	beq.n	a60 <_printf_common+0xa8>
     a92:	3601      	adds	r6, #1
     a94:	e7d9      	b.n	a4a <_printf_common+0x92>
	...

00000a98 <_printf_i>:
     a98:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     a9c:	7e0f      	ldrb	r7, [r1, #24]
     a9e:	4691      	mov	r9, r2
     aa0:	2f78      	cmp	r7, #120	; 0x78
     aa2:	4680      	mov	r8, r0
     aa4:	460c      	mov	r4, r1
     aa6:	469a      	mov	sl, r3
     aa8:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     aaa:	f101 0243 	add.w	r2, r1, #67	; 0x43
     aae:	d807      	bhi.n	ac0 <_printf_i+0x28>
     ab0:	2f62      	cmp	r7, #98	; 0x62
     ab2:	d80a      	bhi.n	aca <_printf_i+0x32>
     ab4:	2f00      	cmp	r7, #0
     ab6:	f000 80d9 	beq.w	c6c <_printf_i+0x1d4>
     aba:	2f58      	cmp	r7, #88	; 0x58
     abc:	f000 80a4 	beq.w	c08 <_printf_i+0x170>
     ac0:	f104 0542 	add.w	r5, r4, #66	; 0x42
     ac4:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     ac8:	e03a      	b.n	b40 <_printf_i+0xa8>
     aca:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     ace:	2b15      	cmp	r3, #21
     ad0:	d8f6      	bhi.n	ac0 <_printf_i+0x28>
     ad2:	a101      	add	r1, pc, #4	; (adr r1, ad8 <_printf_i+0x40>)
     ad4:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     ad8:	00000b31 	andeq	r0, r0, r1, lsr fp
     adc:	00000b45 	andeq	r0, r0, r5, asr #22
     ae0:	00000ac1 	andeq	r0, r0, r1, asr #21
     ae4:	00000ac1 	andeq	r0, r0, r1, asr #21
     ae8:	00000ac1 	andeq	r0, r0, r1, asr #21
     aec:	00000ac1 	andeq	r0, r0, r1, asr #21
     af0:	00000b45 	andeq	r0, r0, r5, asr #22
     af4:	00000ac1 	andeq	r0, r0, r1, asr #21
     af8:	00000ac1 	andeq	r0, r0, r1, asr #21
     afc:	00000ac1 	andeq	r0, r0, r1, asr #21
     b00:	00000ac1 	andeq	r0, r0, r1, asr #21
     b04:	00000c53 	andeq	r0, r0, r3, asr ip
     b08:	00000b75 	andeq	r0, r0, r5, ror fp
     b0c:	00000c35 	andeq	r0, r0, r5, lsr ip
     b10:	00000ac1 	andeq	r0, r0, r1, asr #21
     b14:	00000ac1 	andeq	r0, r0, r1, asr #21
     b18:	00000c75 	andeq	r0, r0, r5, ror ip
     b1c:	00000ac1 	andeq	r0, r0, r1, asr #21
     b20:	00000b75 	andeq	r0, r0, r5, ror fp
     b24:	00000ac1 	andeq	r0, r0, r1, asr #21
     b28:	00000ac1 	andeq	r0, r0, r1, asr #21
     b2c:	00000c3d 	andeq	r0, r0, sp, lsr ip
     b30:	682b      	ldr	r3, [r5, #0]
     b32:	1d1a      	adds	r2, r3, #4
     b34:	681b      	ldr	r3, [r3, #0]
     b36:	602a      	str	r2, [r5, #0]
     b38:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b3c:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b40:	2301      	movs	r3, #1
     b42:	e0a4      	b.n	c8e <_printf_i+0x1f6>
     b44:	6820      	ldr	r0, [r4, #0]
     b46:	6829      	ldr	r1, [r5, #0]
     b48:	0606      	lsls	r6, r0, #24
     b4a:	f101 0304 	add.w	r3, r1, #4
     b4e:	d50a      	bpl.n	b66 <_printf_i+0xce>
     b50:	680e      	ldr	r6, [r1, #0]
     b52:	602b      	str	r3, [r5, #0]
     b54:	2e00      	cmp	r6, #0
     b56:	da03      	bge.n	b60 <_printf_i+0xc8>
     b58:	232d      	movs	r3, #45	; 0x2d
     b5a:	4276      	negs	r6, r6
     b5c:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b60:	230a      	movs	r3, #10
     b62:	485e      	ldr	r0, [pc, #376]	; (cdc <_printf_i+0x244>)
     b64:	e019      	b.n	b9a <_printf_i+0x102>
     b66:	680e      	ldr	r6, [r1, #0]
     b68:	f010 0f40 	tst.w	r0, #64	; 0x40
     b6c:	602b      	str	r3, [r5, #0]
     b6e:	bf18      	it	ne
     b70:	b236      	sxthne	r6, r6
     b72:	e7ef      	b.n	b54 <_printf_i+0xbc>
     b74:	682b      	ldr	r3, [r5, #0]
     b76:	6820      	ldr	r0, [r4, #0]
     b78:	1d19      	adds	r1, r3, #4
     b7a:	6029      	str	r1, [r5, #0]
     b7c:	0601      	lsls	r1, r0, #24
     b7e:	d501      	bpl.n	b84 <_printf_i+0xec>
     b80:	681e      	ldr	r6, [r3, #0]
     b82:	e002      	b.n	b8a <_printf_i+0xf2>
     b84:	0646      	lsls	r6, r0, #25
     b86:	d5fb      	bpl.n	b80 <_printf_i+0xe8>
     b88:	881e      	ldrh	r6, [r3, #0]
     b8a:	2f6f      	cmp	r7, #111	; 0x6f
     b8c:	bf0c      	ite	eq
     b8e:	2308      	moveq	r3, #8
     b90:	230a      	movne	r3, #10
     b92:	4852      	ldr	r0, [pc, #328]	; (cdc <_printf_i+0x244>)
     b94:	2100      	movs	r1, #0
     b96:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     b9a:	6865      	ldr	r5, [r4, #4]
     b9c:	2d00      	cmp	r5, #0
     b9e:	bfa8      	it	ge
     ba0:	6821      	ldrge	r1, [r4, #0]
     ba2:	60a5      	str	r5, [r4, #8]
     ba4:	bfa4      	itt	ge
     ba6:	f021 0104 	bicge.w	r1, r1, #4
     baa:	6021      	strge	r1, [r4, #0]
     bac:	b90e      	cbnz	r6, bb2 <_printf_i+0x11a>
     bae:	2d00      	cmp	r5, #0
     bb0:	d04d      	beq.n	c4e <_printf_i+0x1b6>
     bb2:	4615      	mov	r5, r2
     bb4:	fbb6 f1f3 	udiv	r1, r6, r3
     bb8:	fb03 6711 	mls	r7, r3, r1, r6
     bbc:	5dc7      	ldrb	r7, [r0, r7]
     bbe:	f805 7d01 	strb.w	r7, [r5, #-1]!
     bc2:	4637      	mov	r7, r6
     bc4:	42bb      	cmp	r3, r7
     bc6:	460e      	mov	r6, r1
     bc8:	d9f4      	bls.n	bb4 <_printf_i+0x11c>
     bca:	2b08      	cmp	r3, #8
     bcc:	d10b      	bne.n	be6 <_printf_i+0x14e>
     bce:	6823      	ldr	r3, [r4, #0]
     bd0:	07de      	lsls	r6, r3, #31
     bd2:	d508      	bpl.n	be6 <_printf_i+0x14e>
     bd4:	6923      	ldr	r3, [r4, #16]
     bd6:	6861      	ldr	r1, [r4, #4]
     bd8:	4299      	cmp	r1, r3
     bda:	bfde      	ittt	le
     bdc:	2330      	movle	r3, #48	; 0x30
     bde:	f805 3c01 	strble.w	r3, [r5, #-1]
     be2:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     be6:	1b52      	subs	r2, r2, r5
     be8:	6122      	str	r2, [r4, #16]
     bea:	464b      	mov	r3, r9
     bec:	4621      	mov	r1, r4
     bee:	4640      	mov	r0, r8
     bf0:	f8cd a000 	str.w	sl, [sp]
     bf4:	aa03      	add	r2, sp, #12
     bf6:	f7ff fedf 	bl	9b8 <_printf_common>
     bfa:	3001      	adds	r0, #1
     bfc:	d14c      	bne.n	c98 <_printf_i+0x200>
     bfe:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     c02:	b004      	add	sp, #16
     c04:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     c08:	4834      	ldr	r0, [pc, #208]	; (cdc <_printf_i+0x244>)
     c0a:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     c0e:	6829      	ldr	r1, [r5, #0]
     c10:	6823      	ldr	r3, [r4, #0]
     c12:	f851 6b04 	ldr.w	r6, [r1], #4
     c16:	6029      	str	r1, [r5, #0]
     c18:	061d      	lsls	r5, r3, #24
     c1a:	d514      	bpl.n	c46 <_printf_i+0x1ae>
     c1c:	07df      	lsls	r7, r3, #31
     c1e:	bf44      	itt	mi
     c20:	f043 0320 	orrmi.w	r3, r3, #32
     c24:	6023      	strmi	r3, [r4, #0]
     c26:	b91e      	cbnz	r6, c30 <_printf_i+0x198>
     c28:	6823      	ldr	r3, [r4, #0]
     c2a:	f023 0320 	bic.w	r3, r3, #32
     c2e:	6023      	str	r3, [r4, #0]
     c30:	2310      	movs	r3, #16
     c32:	e7af      	b.n	b94 <_printf_i+0xfc>
     c34:	6823      	ldr	r3, [r4, #0]
     c36:	f043 0320 	orr.w	r3, r3, #32
     c3a:	6023      	str	r3, [r4, #0]
     c3c:	2378      	movs	r3, #120	; 0x78
     c3e:	4828      	ldr	r0, [pc, #160]	; (ce0 <_printf_i+0x248>)
     c40:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c44:	e7e3      	b.n	c0e <_printf_i+0x176>
     c46:	0659      	lsls	r1, r3, #25
     c48:	bf48      	it	mi
     c4a:	b2b6      	uxthmi	r6, r6
     c4c:	e7e6      	b.n	c1c <_printf_i+0x184>
     c4e:	4615      	mov	r5, r2
     c50:	e7bb      	b.n	bca <_printf_i+0x132>
     c52:	682b      	ldr	r3, [r5, #0]
     c54:	6826      	ldr	r6, [r4, #0]
     c56:	1d18      	adds	r0, r3, #4
     c58:	6961      	ldr	r1, [r4, #20]
     c5a:	6028      	str	r0, [r5, #0]
     c5c:	0635      	lsls	r5, r6, #24
     c5e:	681b      	ldr	r3, [r3, #0]
     c60:	d501      	bpl.n	c66 <_printf_i+0x1ce>
     c62:	6019      	str	r1, [r3, #0]
     c64:	e002      	b.n	c6c <_printf_i+0x1d4>
     c66:	0670      	lsls	r0, r6, #25
     c68:	d5fb      	bpl.n	c62 <_printf_i+0x1ca>
     c6a:	8019      	strh	r1, [r3, #0]
     c6c:	2300      	movs	r3, #0
     c6e:	4615      	mov	r5, r2
     c70:	6123      	str	r3, [r4, #16]
     c72:	e7ba      	b.n	bea <_printf_i+0x152>
     c74:	682b      	ldr	r3, [r5, #0]
     c76:	2100      	movs	r1, #0
     c78:	1d1a      	adds	r2, r3, #4
     c7a:	602a      	str	r2, [r5, #0]
     c7c:	681d      	ldr	r5, [r3, #0]
     c7e:	6862      	ldr	r2, [r4, #4]
     c80:	4628      	mov	r0, r5
     c82:	f000 f82f 	bl	ce4 <memchr>
     c86:	b108      	cbz	r0, c8c <_printf_i+0x1f4>
     c88:	1b40      	subs	r0, r0, r5
     c8a:	6060      	str	r0, [r4, #4]
     c8c:	6863      	ldr	r3, [r4, #4]
     c8e:	6123      	str	r3, [r4, #16]
     c90:	2300      	movs	r3, #0
     c92:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     c96:	e7a8      	b.n	bea <_printf_i+0x152>
     c98:	462a      	mov	r2, r5
     c9a:	4649      	mov	r1, r9
     c9c:	4640      	mov	r0, r8
     c9e:	6923      	ldr	r3, [r4, #16]
     ca0:	47d0      	blx	sl
     ca2:	3001      	adds	r0, #1
     ca4:	d0ab      	beq.n	bfe <_printf_i+0x166>
     ca6:	6823      	ldr	r3, [r4, #0]
     ca8:	079b      	lsls	r3, r3, #30
     caa:	d413      	bmi.n	cd4 <_printf_i+0x23c>
     cac:	68e0      	ldr	r0, [r4, #12]
     cae:	9b03      	ldr	r3, [sp, #12]
     cb0:	4298      	cmp	r0, r3
     cb2:	bfb8      	it	lt
     cb4:	4618      	movlt	r0, r3
     cb6:	e7a4      	b.n	c02 <_printf_i+0x16a>
     cb8:	2301      	movs	r3, #1
     cba:	4632      	mov	r2, r6
     cbc:	4649      	mov	r1, r9
     cbe:	4640      	mov	r0, r8
     cc0:	47d0      	blx	sl
     cc2:	3001      	adds	r0, #1
     cc4:	d09b      	beq.n	bfe <_printf_i+0x166>
     cc6:	3501      	adds	r5, #1
     cc8:	68e3      	ldr	r3, [r4, #12]
     cca:	9903      	ldr	r1, [sp, #12]
     ccc:	1a5b      	subs	r3, r3, r1
     cce:	42ab      	cmp	r3, r5
     cd0:	dcf2      	bgt.n	cb8 <_printf_i+0x220>
     cd2:	e7eb      	b.n	cac <_printf_i+0x214>
     cd4:	2500      	movs	r5, #0
     cd6:	f104 0619 	add.w	r6, r4, #25
     cda:	e7f5      	b.n	cc8 <_printf_i+0x230>
     cdc:	0000102d 	andeq	r1, r0, sp, lsr #32
     ce0:	0000103e 	andeq	r1, r0, lr, lsr r0

00000ce4 <memchr>:
     ce4:	4603      	mov	r3, r0
     ce6:	b510      	push	{r4, lr}
     ce8:	b2c9      	uxtb	r1, r1
     cea:	4402      	add	r2, r0
     cec:	4293      	cmp	r3, r2
     cee:	4618      	mov	r0, r3
     cf0:	d101      	bne.n	cf6 <memchr+0x12>
     cf2:	2000      	movs	r0, #0
     cf4:	e003      	b.n	cfe <memchr+0x1a>
     cf6:	7804      	ldrb	r4, [r0, #0]
     cf8:	3301      	adds	r3, #1
     cfa:	428c      	cmp	r4, r1
     cfc:	d1f6      	bne.n	cec <memchr+0x8>
     cfe:	bd10      	pop	{r4, pc}

00000d00 <memcpy>:
     d00:	440a      	add	r2, r1
     d02:	4291      	cmp	r1, r2
     d04:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     d08:	d100      	bne.n	d0c <memcpy+0xc>
     d0a:	4770      	bx	lr
     d0c:	b510      	push	{r4, lr}
     d0e:	f811 4b01 	ldrb.w	r4, [r1], #1
     d12:	4291      	cmp	r1, r2
     d14:	f803 4f01 	strb.w	r4, [r3, #1]!
     d18:	d1f9      	bne.n	d0e <memcpy+0xe>
     d1a:	bd10      	pop	{r4, pc}

00000d1c <memmove>:
     d1c:	4288      	cmp	r0, r1
     d1e:	b510      	push	{r4, lr}
     d20:	eb01 0402 	add.w	r4, r1, r2
     d24:	d902      	bls.n	d2c <memmove+0x10>
     d26:	4284      	cmp	r4, r0
     d28:	4623      	mov	r3, r4
     d2a:	d807      	bhi.n	d3c <memmove+0x20>
     d2c:	1e43      	subs	r3, r0, #1
     d2e:	42a1      	cmp	r1, r4
     d30:	d008      	beq.n	d44 <memmove+0x28>
     d32:	f811 2b01 	ldrb.w	r2, [r1], #1
     d36:	f803 2f01 	strb.w	r2, [r3, #1]!
     d3a:	e7f8      	b.n	d2e <memmove+0x12>
     d3c:	4601      	mov	r1, r0
     d3e:	4402      	add	r2, r0
     d40:	428a      	cmp	r2, r1
     d42:	d100      	bne.n	d46 <memmove+0x2a>
     d44:	bd10      	pop	{r4, pc}
     d46:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d4a:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d4e:	e7f7      	b.n	d40 <memmove+0x24>

00000d50 <_free_r>:
     d50:	b538      	push	{r3, r4, r5, lr}
     d52:	4605      	mov	r5, r0
     d54:	2900      	cmp	r1, #0
     d56:	d040      	beq.n	dda <_free_r+0x8a>
     d58:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d5c:	1f0c      	subs	r4, r1, #4
     d5e:	2b00      	cmp	r3, #0
     d60:	bfb8      	it	lt
     d62:	18e4      	addlt	r4, r4, r3
     d64:	f000 f910 	bl	f88 <__malloc_lock>
     d68:	4a1c      	ldr	r2, [pc, #112]	; (ddc <_free_r+0x8c>)
     d6a:	6813      	ldr	r3, [r2, #0]
     d6c:	b933      	cbnz	r3, d7c <_free_r+0x2c>
     d6e:	6063      	str	r3, [r4, #4]
     d70:	6014      	str	r4, [r2, #0]
     d72:	4628      	mov	r0, r5
     d74:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d78:	f000 b90c 	b.w	f94 <__malloc_unlock>
     d7c:	42a3      	cmp	r3, r4
     d7e:	d908      	bls.n	d92 <_free_r+0x42>
     d80:	6820      	ldr	r0, [r4, #0]
     d82:	1821      	adds	r1, r4, r0
     d84:	428b      	cmp	r3, r1
     d86:	bf01      	itttt	eq
     d88:	6819      	ldreq	r1, [r3, #0]
     d8a:	685b      	ldreq	r3, [r3, #4]
     d8c:	1809      	addeq	r1, r1, r0
     d8e:	6021      	streq	r1, [r4, #0]
     d90:	e7ed      	b.n	d6e <_free_r+0x1e>
     d92:	461a      	mov	r2, r3
     d94:	685b      	ldr	r3, [r3, #4]
     d96:	b10b      	cbz	r3, d9c <_free_r+0x4c>
     d98:	42a3      	cmp	r3, r4
     d9a:	d9fa      	bls.n	d92 <_free_r+0x42>
     d9c:	6811      	ldr	r1, [r2, #0]
     d9e:	1850      	adds	r0, r2, r1
     da0:	42a0      	cmp	r0, r4
     da2:	d10b      	bne.n	dbc <_free_r+0x6c>
     da4:	6820      	ldr	r0, [r4, #0]
     da6:	4401      	add	r1, r0
     da8:	1850      	adds	r0, r2, r1
     daa:	4283      	cmp	r3, r0
     dac:	6011      	str	r1, [r2, #0]
     dae:	d1e0      	bne.n	d72 <_free_r+0x22>
     db0:	6818      	ldr	r0, [r3, #0]
     db2:	685b      	ldr	r3, [r3, #4]
     db4:	4401      	add	r1, r0
     db6:	6011      	str	r1, [r2, #0]
     db8:	6053      	str	r3, [r2, #4]
     dba:	e7da      	b.n	d72 <_free_r+0x22>
     dbc:	d902      	bls.n	dc4 <_free_r+0x74>
     dbe:	230c      	movs	r3, #12
     dc0:	602b      	str	r3, [r5, #0]
     dc2:	e7d6      	b.n	d72 <_free_r+0x22>
     dc4:	6820      	ldr	r0, [r4, #0]
     dc6:	1821      	adds	r1, r4, r0
     dc8:	428b      	cmp	r3, r1
     dca:	bf01      	itttt	eq
     dcc:	6819      	ldreq	r1, [r3, #0]
     dce:	685b      	ldreq	r3, [r3, #4]
     dd0:	1809      	addeq	r1, r1, r0
     dd2:	6021      	streq	r1, [r4, #0]
     dd4:	6063      	str	r3, [r4, #4]
     dd6:	6054      	str	r4, [r2, #4]
     dd8:	e7cb      	b.n	d72 <_free_r+0x22>
     dda:	bd38      	pop	{r3, r4, r5, pc}
     ddc:	000200a4 	andeq	r0, r2, r4, lsr #1

00000de0 <sbrk_aligned>:
     de0:	b570      	push	{r4, r5, r6, lr}
     de2:	4e0e      	ldr	r6, [pc, #56]	; (e1c <sbrk_aligned+0x3c>)
     de4:	460c      	mov	r4, r1
     de6:	6831      	ldr	r1, [r6, #0]
     de8:	4605      	mov	r5, r0
     dea:	b911      	cbnz	r1, df2 <sbrk_aligned+0x12>
     dec:	f000 f8bc 	bl	f68 <_sbrk_r>
     df0:	6030      	str	r0, [r6, #0]
     df2:	4621      	mov	r1, r4
     df4:	4628      	mov	r0, r5
     df6:	f000 f8b7 	bl	f68 <_sbrk_r>
     dfa:	1c43      	adds	r3, r0, #1
     dfc:	d00a      	beq.n	e14 <sbrk_aligned+0x34>
     dfe:	1cc4      	adds	r4, r0, #3
     e00:	f024 0403 	bic.w	r4, r4, #3
     e04:	42a0      	cmp	r0, r4
     e06:	d007      	beq.n	e18 <sbrk_aligned+0x38>
     e08:	1a21      	subs	r1, r4, r0
     e0a:	4628      	mov	r0, r5
     e0c:	f000 f8ac 	bl	f68 <_sbrk_r>
     e10:	3001      	adds	r0, #1
     e12:	d101      	bne.n	e18 <sbrk_aligned+0x38>
     e14:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     e18:	4620      	mov	r0, r4
     e1a:	bd70      	pop	{r4, r5, r6, pc}
     e1c:	000200a8 	andeq	r0, r2, r8, lsr #1

00000e20 <_malloc_r>:
     e20:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     e24:	1ccd      	adds	r5, r1, #3
     e26:	f025 0503 	bic.w	r5, r5, #3
     e2a:	3508      	adds	r5, #8
     e2c:	2d0c      	cmp	r5, #12
     e2e:	bf38      	it	cc
     e30:	250c      	movcc	r5, #12
     e32:	2d00      	cmp	r5, #0
     e34:	4607      	mov	r7, r0
     e36:	db01      	blt.n	e3c <_malloc_r+0x1c>
     e38:	42a9      	cmp	r1, r5
     e3a:	d905      	bls.n	e48 <_malloc_r+0x28>
     e3c:	230c      	movs	r3, #12
     e3e:	2600      	movs	r6, #0
     e40:	603b      	str	r3, [r7, #0]
     e42:	4630      	mov	r0, r6
     e44:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e48:	4e2e      	ldr	r6, [pc, #184]	; (f04 <_malloc_r+0xe4>)
     e4a:	f000 f89d 	bl	f88 <__malloc_lock>
     e4e:	6833      	ldr	r3, [r6, #0]
     e50:	461c      	mov	r4, r3
     e52:	bb34      	cbnz	r4, ea2 <_malloc_r+0x82>
     e54:	4629      	mov	r1, r5
     e56:	4638      	mov	r0, r7
     e58:	f7ff ffc2 	bl	de0 <sbrk_aligned>
     e5c:	1c43      	adds	r3, r0, #1
     e5e:	4604      	mov	r4, r0
     e60:	d14d      	bne.n	efe <_malloc_r+0xde>
     e62:	6834      	ldr	r4, [r6, #0]
     e64:	4626      	mov	r6, r4
     e66:	2e00      	cmp	r6, #0
     e68:	d140      	bne.n	eec <_malloc_r+0xcc>
     e6a:	6823      	ldr	r3, [r4, #0]
     e6c:	4631      	mov	r1, r6
     e6e:	4638      	mov	r0, r7
     e70:	eb04 0803 	add.w	r8, r4, r3
     e74:	f000 f878 	bl	f68 <_sbrk_r>
     e78:	4580      	cmp	r8, r0
     e7a:	d13a      	bne.n	ef2 <_malloc_r+0xd2>
     e7c:	6821      	ldr	r1, [r4, #0]
     e7e:	3503      	adds	r5, #3
     e80:	1a6d      	subs	r5, r5, r1
     e82:	f025 0503 	bic.w	r5, r5, #3
     e86:	3508      	adds	r5, #8
     e88:	2d0c      	cmp	r5, #12
     e8a:	bf38      	it	cc
     e8c:	250c      	movcc	r5, #12
     e8e:	4638      	mov	r0, r7
     e90:	4629      	mov	r1, r5
     e92:	f7ff ffa5 	bl	de0 <sbrk_aligned>
     e96:	3001      	adds	r0, #1
     e98:	d02b      	beq.n	ef2 <_malloc_r+0xd2>
     e9a:	6823      	ldr	r3, [r4, #0]
     e9c:	442b      	add	r3, r5
     e9e:	6023      	str	r3, [r4, #0]
     ea0:	e00e      	b.n	ec0 <_malloc_r+0xa0>
     ea2:	6822      	ldr	r2, [r4, #0]
     ea4:	1b52      	subs	r2, r2, r5
     ea6:	d41e      	bmi.n	ee6 <_malloc_r+0xc6>
     ea8:	2a0b      	cmp	r2, #11
     eaa:	d916      	bls.n	eda <_malloc_r+0xba>
     eac:	1961      	adds	r1, r4, r5
     eae:	42a3      	cmp	r3, r4
     eb0:	6025      	str	r5, [r4, #0]
     eb2:	bf18      	it	ne
     eb4:	6059      	strne	r1, [r3, #4]
     eb6:	6863      	ldr	r3, [r4, #4]
     eb8:	bf08      	it	eq
     eba:	6031      	streq	r1, [r6, #0]
     ebc:	5162      	str	r2, [r4, r5]
     ebe:	604b      	str	r3, [r1, #4]
     ec0:	4638      	mov	r0, r7
     ec2:	f104 060b 	add.w	r6, r4, #11
     ec6:	f000 f865 	bl	f94 <__malloc_unlock>
     eca:	f026 0607 	bic.w	r6, r6, #7
     ece:	1d23      	adds	r3, r4, #4
     ed0:	1af2      	subs	r2, r6, r3
     ed2:	d0b6      	beq.n	e42 <_malloc_r+0x22>
     ed4:	1b9b      	subs	r3, r3, r6
     ed6:	50a3      	str	r3, [r4, r2]
     ed8:	e7b3      	b.n	e42 <_malloc_r+0x22>
     eda:	6862      	ldr	r2, [r4, #4]
     edc:	42a3      	cmp	r3, r4
     ede:	bf0c      	ite	eq
     ee0:	6032      	streq	r2, [r6, #0]
     ee2:	605a      	strne	r2, [r3, #4]
     ee4:	e7ec      	b.n	ec0 <_malloc_r+0xa0>
     ee6:	4623      	mov	r3, r4
     ee8:	6864      	ldr	r4, [r4, #4]
     eea:	e7b2      	b.n	e52 <_malloc_r+0x32>
     eec:	4634      	mov	r4, r6
     eee:	6876      	ldr	r6, [r6, #4]
     ef0:	e7b9      	b.n	e66 <_malloc_r+0x46>
     ef2:	230c      	movs	r3, #12
     ef4:	4638      	mov	r0, r7
     ef6:	603b      	str	r3, [r7, #0]
     ef8:	f000 f84c 	bl	f94 <__malloc_unlock>
     efc:	e7a1      	b.n	e42 <_malloc_r+0x22>
     efe:	6025      	str	r5, [r4, #0]
     f00:	e7de      	b.n	ec0 <_malloc_r+0xa0>
     f02:	bf00      	nop
     f04:	000200a4 	andeq	r0, r2, r4, lsr #1

00000f08 <_realloc_r>:
     f08:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     f0c:	4680      	mov	r8, r0
     f0e:	4614      	mov	r4, r2
     f10:	460e      	mov	r6, r1
     f12:	b921      	cbnz	r1, f1e <_realloc_r+0x16>
     f14:	4611      	mov	r1, r2
     f16:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     f1a:	f7ff bf81 	b.w	e20 <_malloc_r>
     f1e:	b92a      	cbnz	r2, f2c <_realloc_r+0x24>
     f20:	f7ff ff16 	bl	d50 <_free_r>
     f24:	4625      	mov	r5, r4
     f26:	4628      	mov	r0, r5
     f28:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f2c:	f000 f838 	bl	fa0 <_malloc_usable_size_r>
     f30:	4284      	cmp	r4, r0
     f32:	4607      	mov	r7, r0
     f34:	d802      	bhi.n	f3c <_realloc_r+0x34>
     f36:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f3a:	d812      	bhi.n	f62 <_realloc_r+0x5a>
     f3c:	4621      	mov	r1, r4
     f3e:	4640      	mov	r0, r8
     f40:	f7ff ff6e 	bl	e20 <_malloc_r>
     f44:	4605      	mov	r5, r0
     f46:	2800      	cmp	r0, #0
     f48:	d0ed      	beq.n	f26 <_realloc_r+0x1e>
     f4a:	42bc      	cmp	r4, r7
     f4c:	4622      	mov	r2, r4
     f4e:	4631      	mov	r1, r6
     f50:	bf28      	it	cs
     f52:	463a      	movcs	r2, r7
     f54:	f7ff fed4 	bl	d00 <memcpy>
     f58:	4631      	mov	r1, r6
     f5a:	4640      	mov	r0, r8
     f5c:	f7ff fef8 	bl	d50 <_free_r>
     f60:	e7e1      	b.n	f26 <_realloc_r+0x1e>
     f62:	4635      	mov	r5, r6
     f64:	e7df      	b.n	f26 <_realloc_r+0x1e>
	...

00000f68 <_sbrk_r>:
     f68:	b538      	push	{r3, r4, r5, lr}
     f6a:	2300      	movs	r3, #0
     f6c:	4d05      	ldr	r5, [pc, #20]	; (f84 <_sbrk_r+0x1c>)
     f6e:	4604      	mov	r4, r0
     f70:	4608      	mov	r0, r1
     f72:	602b      	str	r3, [r5, #0]
     f74:	f000 f81e 	bl	fb4 <_sbrk>
     f78:	1c43      	adds	r3, r0, #1
     f7a:	d102      	bne.n	f82 <_sbrk_r+0x1a>
     f7c:	682b      	ldr	r3, [r5, #0]
     f7e:	b103      	cbz	r3, f82 <_sbrk_r+0x1a>
     f80:	6023      	str	r3, [r4, #0]
     f82:	bd38      	pop	{r3, r4, r5, pc}
     f84:	000200ac 	andeq	r0, r2, ip, lsr #1

00000f88 <__malloc_lock>:
     f88:	4801      	ldr	r0, [pc, #4]	; (f90 <__malloc_lock+0x8>)
     f8a:	f000 b811 	b.w	fb0 <__retarget_lock_acquire_recursive>
     f8e:	bf00      	nop
     f90:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000f94 <__malloc_unlock>:
     f94:	4801      	ldr	r0, [pc, #4]	; (f9c <__malloc_unlock+0x8>)
     f96:	f000 b80c 	b.w	fb2 <__retarget_lock_release_recursive>
     f9a:	bf00      	nop
     f9c:	000200b0 	strheq	r0, [r2], -r0	; <UNPREDICTABLE>

00000fa0 <_malloc_usable_size_r>:
     fa0:	f851 3c04 	ldr.w	r3, [r1, #-4]
     fa4:	1f18      	subs	r0, r3, #4
     fa6:	2b00      	cmp	r3, #0
     fa8:	bfbc      	itt	lt
     faa:	580b      	ldrlt	r3, [r1, r0]
     fac:	18c0      	addlt	r0, r0, r3
     fae:	4770      	bx	lr

00000fb0 <__retarget_lock_acquire_recursive>:
     fb0:	4770      	bx	lr

00000fb2 <__retarget_lock_release_recursive>:
     fb2:	4770      	bx	lr

00000fb4 <_sbrk>:
     fb4:	4a04      	ldr	r2, [pc, #16]	; (fc8 <_sbrk+0x14>)
     fb6:	4905      	ldr	r1, [pc, #20]	; (fcc <_sbrk+0x18>)
     fb8:	6813      	ldr	r3, [r2, #0]
     fba:	2b00      	cmp	r3, #0
     fbc:	bf08      	it	eq
     fbe:	460b      	moveq	r3, r1
     fc0:	4418      	add	r0, r3
     fc2:	6010      	str	r0, [r2, #0]
     fc4:	4618      	mov	r0, r3
     fc6:	4770      	bx	lr
     fc8:	000200b4 	strheq	r0, [r2], -r4
     fcc:	000200b8 	strheq	r0, [r2], -r8

00000fd0 <_exit>:
     fd0:	e7fe      	b.n	fd0 <_exit>
     fd2:	bf00      	nop

00000fd4 <_init>:
     fd4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     fd6:	bf00      	nop
     fd8:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fda:	bc08      	pop	{r3}
     fdc:	469e      	mov	lr, r3
     fde:	4770      	bx	lr

00000fe0 <_fini>:
     fe0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     fe2:	bf00      	nop
     fe4:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fe6:	bc08      	pop	{r3}
     fe8:	469e      	mov	lr, r3
     fea:	4770      	bx	lr
     fec:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
     ff0:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
     ff4:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
     ff8:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
     ffc:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
    1000:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
    1004:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
    1008:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
    100c:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
    1010:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
    1014:	0000000a 	andeq	r0, r0, sl

00001018 <_global_impure_ptr>:
    1018:	00020004 	andeq	r0, r2, r4
    101c:	2b302d23 	blcs	c0c4b0 <__StackTop+0xbea4b0>
    1020:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    1024:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    1028:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    102c:	32313000 	eorscc	r3, r1, #0
    1030:	36353433 			; <UNDEFINED> instruction: 0x36353433
    1034:	41393837 	teqmi	r9, r7, lsr r8
    1038:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    103c:	31300046 	teqcc	r0, r6, asr #32
    1040:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    1044:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1048:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    104c:	00006665 	andeq	r6, r0, r5, ror #12

00001050 <__EH_FRAME_BEGIN__>:
    1050:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <_impure_ptr>:
   20000:	00020004 	andeq	r0, r2, r4

00020004 <impure_data>:
	...

00020064 <__frame_dummy_init_array_entry>:
   20064:	0000009d 	muleq	r0, sp, r0

00020068 <__do_global_dtors_aux_fini_array_entry>:
   20068:	00000079 	andeq	r0, r0, r9, ror r0

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
  18:	00000688 	andeq	r0, r0, r8, lsl #13
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000006c0 	andeq	r0, r0, r0, asr #13
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	000006ec 	andeq	r0, r0, ip, ror #13
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	00000700 	andeq	r0, r0, r0, lsl #14
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
  cc:	000007b8 			; <UNDEFINED> instruction: 0x000007b8
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
 10c:	000009b8 			; <UNDEFINED> instruction: 0x000009b8
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xc0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000a98 	muleq	r0, r8, sl
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
 16c:	00000ce4 	andeq	r0, r0, r4, ror #25
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000d00 	andeq	r0, r0, r0, lsl #26
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000d1c 	andeq	r0, r0, ip, lsl sp
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d50 	andeq	r0, r0, r0, asr sp
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
 21c:	00000de0 	andeq	r0, r0, r0, ror #27
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000e20 	andeq	r0, r0, r0, lsr #28
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
 268:	00000f08 	andeq	r0, r0, r8, lsl #30
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
 2a4:	00000f68 	andeq	r0, r0, r8, ror #30
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
 2d0:	00000f88 	andeq	r0, r0, r8, lsl #31
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000f94 	muleq	r0, r4, pc	; <UNPREDICTABLE>
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000fa0 	andeq	r0, r0, r0, lsr #31
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
 3cc:	00000fb0 			; <UNDEFINED> instruction: 0x00000fb0
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
 40c:	00000fb2 			; <UNDEFINED> instruction: 0x00000fb2
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000fb4 			; <UNDEFINED> instruction: 0x00000fb4
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 450:	00000002 	andeq	r0, r0, r2

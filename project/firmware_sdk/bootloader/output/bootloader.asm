
bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00012000 	andeq	r2, r1, r0
       4:	000005f1 	strdeq	r0, [r0], -r1
       8:	00000581 	andeq	r0, r0, r1, lsl #11
       c:	00000583 	andeq	r0, r0, r3, lsl #11
      10:	00000585 	andeq	r0, r0, r5, lsl #11
      14:	00000587 	andeq	r0, r0, r7, lsl #11
      18:	00000589 	andeq	r0, r0, r9, lsl #11
	...
      2c:	0000058b 	andeq	r0, r0, fp, lsl #11
      30:	0000058d 	andeq	r0, r0, sp, lsl #11
      34:	00000000 	andeq	r0, r0, r0
      38:	0000058f 	andeq	r0, r0, pc, lsl #11
      3c:	00000591 	muleq	r0, r1, r5
      40:	00000595 	muleq	r0, r5, r5
      44:	00000645 	andeq	r0, r0, r5, asr #12
      48:	00000647 	andeq	r0, r0, r7, asr #12
      4c:	00000649 	andeq	r0, r0, r9, asr #12
      50:	0000064b 	andeq	r0, r0, fp, asr #12
      54:	0000064d 	andeq	r0, r0, sp, asr #12

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
      70:	0001006c 	andeq	r0, r1, ip, rrx
      74:	00000000 	andeq	r0, r0, r0
      78:	00001018 	andeq	r1, r0, r8, lsl r0

0000007c <frame_dummy>:
      7c:	b508      	push	{r3, lr}
      7e:	4b03      	ldr	r3, [pc, #12]	; (8c <frame_dummy+0x10>)
      80:	b11b      	cbz	r3, 8a <frame_dummy+0xe>
      82:	4903      	ldr	r1, [pc, #12]	; (90 <frame_dummy+0x14>)
      84:	4803      	ldr	r0, [pc, #12]	; (94 <frame_dummy+0x18>)
      86:	f3af 8000 	nop.w
      8a:	bd08      	pop	{r3, pc}
      8c:	00000000 	andeq	r0, r0, r0
      90:	00010070 	andeq	r0, r1, r0, ror r0
      94:	00001018 	andeq	r1, r0, r8, lsl r0

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

000000ba <drv_uart_default_config>:
      ba:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
      be:	6043      	str	r3, [r0, #4]
      c0:	230f      	movs	r3, #15
      c2:	7203      	strb	r3, [r0, #8]
      c4:	2300      	movs	r3, #0
      c6:	7243      	strb	r3, [r0, #9]
      c8:	7283      	strb	r3, [r0, #10]
      ca:	72c3      	strb	r3, [r0, #11]
      cc:	7303      	strb	r3, [r0, #12]
      ce:	7343      	strb	r3, [r0, #13]
      d0:	2301      	movs	r3, #1
      d2:	7383      	strb	r3, [r0, #14]
      d4:	4770      	bx	lr
	...

000000d8 <drv_uart_set_config>:
      d8:	b508      	push	{r3, lr}
      da:	6841      	ldr	r1, [r0, #4]
      dc:	7a03      	ldrb	r3, [r0, #8]
      de:	fb03 f201 	mul.w	r2, r3, r1
      e2:	490e      	ldr	r1, [pc, #56]	; (11c <drv_uart_set_config+0x44>)
      e4:	fbb1 f2f2 	udiv	r2, r1, r2
      e8:	0419      	lsls	r1, r3, #16
      ea:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
      ee:	7a43      	ldrb	r3, [r0, #9]
      f0:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
      f4:	7a83      	ldrb	r3, [r0, #10]
      f6:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
      fa:	7ac3      	ldrb	r3, [r0, #11]
      fc:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     100:	7b03      	ldrb	r3, [r0, #12]
     102:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     106:	7b42      	ldrb	r2, [r0, #13]
     108:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     10c:	7b82      	ldrb	r2, [r0, #14]
     10e:	4311      	orrs	r1, r2
     110:	6800      	ldr	r0, [r0, #0]
     112:	460a      	mov	r2, r1
     114:	3008      	adds	r0, #8
     116:	f7ff ffbf 	bl	98 <drv_check_rw_data>
     11a:	bd08      	pop	{r3, pc}
     11c:	02625a00 	rsbeq	r5, r2, #0, 20

00000120 <drv_uart_init>:
     120:	b538      	push	{r3, r4, r5, lr}
     122:	4604      	mov	r4, r0
     124:	2500      	movs	r5, #0
     126:	7485      	strb	r5, [r0, #18]
     128:	74c5      	strb	r5, [r0, #19]
     12a:	f7ff ffd5 	bl	d8 <drv_uart_set_config>
     12e:	7425      	strb	r5, [r4, #16]
     130:	74a5      	strb	r5, [r4, #18]
     132:	74e5      	strb	r5, [r4, #19]
     134:	6822      	ldr	r2, [r4, #0]
     136:	6853      	ldr	r3, [r2, #4]
     138:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     13c:	6053      	str	r3, [r2, #4]
     13e:	6822      	ldr	r2, [r4, #0]
     140:	6853      	ldr	r3, [r2, #4]
     142:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     146:	6053      	str	r3, [r2, #4]
     148:	6822      	ldr	r2, [r4, #0]
     14a:	6853      	ldr	r3, [r2, #4]
     14c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     150:	6053      	str	r3, [r2, #4]
     152:	6822      	ldr	r2, [r4, #0]
     154:	6853      	ldr	r3, [r2, #4]
     156:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     15a:	6053      	str	r3, [r2, #4]
     15c:	6822      	ldr	r2, [r4, #0]
     15e:	6853      	ldr	r3, [r2, #4]
     160:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     164:	6053      	str	r3, [r2, #4]
     166:	6822      	ldr	r2, [r4, #0]
     168:	6853      	ldr	r3, [r2, #4]
     16a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     16e:	6053      	str	r3, [r2, #4]
     170:	6822      	ldr	r2, [r4, #0]
     172:	6853      	ldr	r3, [r2, #4]
     174:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     178:	6053      	str	r3, [r2, #4]
     17a:	6822      	ldr	r2, [r4, #0]
     17c:	6853      	ldr	r3, [r2, #4]
     17e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     182:	6053      	str	r3, [r2, #4]
     184:	6823      	ldr	r3, [r4, #0]
     186:	f240 12ff 	movw	r2, #511	; 0x1ff
     18a:	611a      	str	r2, [r3, #16]
     18c:	6823      	ldr	r3, [r4, #0]
     18e:	611d      	str	r5, [r3, #16]
     190:	6822      	ldr	r2, [r4, #0]
     192:	6853      	ldr	r3, [r2, #4]
     194:	f043 0301 	orr.w	r3, r3, #1
     198:	6053      	str	r3, [r2, #4]
     19a:	6822      	ldr	r2, [r4, #0]
     19c:	6853      	ldr	r3, [r2, #4]
     19e:	f023 0301 	bic.w	r3, r3, #1
     1a2:	6053      	str	r3, [r2, #4]
     1a4:	6822      	ldr	r2, [r4, #0]
     1a6:	6853      	ldr	r3, [r2, #4]
     1a8:	f043 0302 	orr.w	r3, r3, #2
     1ac:	6053      	str	r3, [r2, #4]
     1ae:	bd38      	pop	{r3, r4, r5, pc}

000001b0 <drv_uart_putchars>:
     1b0:	b410      	push	{r4}
     1b2:	2300      	movs	r3, #0
     1b4:	7483      	strb	r3, [r0, #18]
     1b6:	f890 c012 	ldrb.w	ip, [r0, #18]
     1ba:	4594      	cmp	ip, r2
     1bc:	d20c      	bcs.n	1d8 <drv_uart_putchars+0x28>
     1be:	6804      	ldr	r4, [r0, #0]
     1c0:	6963      	ldr	r3, [r4, #20]
     1c2:	0a1b      	lsrs	r3, r3, #8
     1c4:	f013 0f18 	tst.w	r3, #24
     1c8:	d1f5      	bne.n	1b6 <drv_uart_putchars+0x6>
     1ca:	f10c 0301 	add.w	r3, ip, #1
     1ce:	7483      	strb	r3, [r0, #18]
     1d0:	f811 300c 	ldrb.w	r3, [r1, ip]
     1d4:	6023      	str	r3, [r4, #0]
     1d6:	e7ee      	b.n	1b6 <drv_uart_putchars+0x6>
     1d8:	6803      	ldr	r3, [r0, #0]
     1da:	699a      	ldr	r2, [r3, #24]
     1dc:	f412 7f80 	tst.w	r2, #256	; 0x100
     1e0:	d0fa      	beq.n	1d8 <drv_uart_putchars+0x28>
     1e2:	691a      	ldr	r2, [r3, #16]
     1e4:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     1e8:	611a      	str	r2, [r3, #16]
     1ea:	6803      	ldr	r3, [r0, #0]
     1ec:	2200      	movs	r2, #0
     1ee:	611a      	str	r2, [r3, #16]
     1f0:	bc10      	pop	{r4}
     1f2:	4770      	bx	lr

000001f4 <drv_uart_putchar>:
     1f4:	6802      	ldr	r2, [r0, #0]
     1f6:	6953      	ldr	r3, [r2, #20]
     1f8:	0a1b      	lsrs	r3, r3, #8
     1fa:	f013 0f18 	tst.w	r3, #24
     1fe:	d101      	bne.n	204 <Stack_Size+0x4>
     200:	780b      	ldrb	r3, [r1, #0]
     202:	6013      	str	r3, [r2, #0]
     204:	6803      	ldr	r3, [r0, #0]
     206:	699a      	ldr	r2, [r3, #24]
     208:	f412 7f80 	tst.w	r2, #256	; 0x100
     20c:	d0fa      	beq.n	204 <Stack_Size+0x4>
     20e:	691a      	ldr	r2, [r3, #16]
     210:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     214:	611a      	str	r2, [r3, #16]
     216:	6803      	ldr	r3, [r0, #0]
     218:	2200      	movs	r2, #0
     21a:	611a      	str	r2, [r3, #16]
     21c:	4770      	bx	lr

0000021e <drv_uart_getchar>:
     21e:	b410      	push	{r4}
     220:	e009      	b.n	236 <drv_uart_getchar+0x18>
     222:	69db      	ldr	r3, [r3, #28]
     224:	700b      	strb	r3, [r1, #0]
     226:	2000      	movs	r0, #0
     228:	bc10      	pop	{r4}
     22a:	4770      	bx	lr
     22c:	6803      	ldr	r3, [r0, #0]
     22e:	695a      	ldr	r2, [r3, #20]
     230:	f012 0f1f 	tst.w	r2, #31
     234:	d1f5      	bne.n	222 <drv_uart_getchar+0x4>
     236:	6803      	ldr	r3, [r0, #0]
     238:	699c      	ldr	r4, [r3, #24]
     23a:	691a      	ldr	r2, [r3, #16]
     23c:	f042 02c0 	orr.w	r2, r2, #192	; 0xc0
     240:	611a      	str	r2, [r3, #16]
     242:	6803      	ldr	r3, [r0, #0]
     244:	2200      	movs	r2, #0
     246:	611a      	str	r2, [r3, #16]
     248:	b2a3      	uxth	r3, r4
     24a:	f014 0f40 	tst.w	r4, #64	; 0x40
     24e:	d001      	beq.n	254 <drv_uart_getchar+0x36>
     250:	2201      	movs	r2, #1
     252:	7402      	strb	r2, [r0, #16]
     254:	f013 0f80 	tst.w	r3, #128	; 0x80
     258:	d001      	beq.n	25e <drv_uart_getchar+0x40>
     25a:	2302      	movs	r3, #2
     25c:	7403      	strb	r3, [r0, #16]
     25e:	7c03      	ldrb	r3, [r0, #16]
     260:	2b00      	cmp	r3, #0
     262:	d0e3      	beq.n	22c <drv_uart_getchar+0xe>
     264:	7a83      	ldrb	r3, [r0, #10]
     266:	2b01      	cmp	r3, #1
     268:	d0e0      	beq.n	22c <drv_uart_getchar+0xe>
     26a:	2300      	movs	r3, #0
     26c:	7403      	strb	r3, [r0, #16]
     26e:	7483      	strb	r3, [r0, #18]
     270:	74c3      	strb	r3, [r0, #19]
     272:	6804      	ldr	r4, [r0, #0]
     274:	6862      	ldr	r2, [r4, #4]
     276:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     27a:	6062      	str	r2, [r4, #4]
     27c:	6804      	ldr	r4, [r0, #0]
     27e:	6862      	ldr	r2, [r4, #4]
     280:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     284:	6062      	str	r2, [r4, #4]
     286:	6804      	ldr	r4, [r0, #0]
     288:	6862      	ldr	r2, [r4, #4]
     28a:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     28e:	6062      	str	r2, [r4, #4]
     290:	6804      	ldr	r4, [r0, #0]
     292:	6862      	ldr	r2, [r4, #4]
     294:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     298:	6062      	str	r2, [r4, #4]
     29a:	6804      	ldr	r4, [r0, #0]
     29c:	6862      	ldr	r2, [r4, #4]
     29e:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2a2:	6062      	str	r2, [r4, #4]
     2a4:	6804      	ldr	r4, [r0, #0]
     2a6:	6862      	ldr	r2, [r4, #4]
     2a8:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2ac:	6062      	str	r2, [r4, #4]
     2ae:	6804      	ldr	r4, [r0, #0]
     2b0:	6862      	ldr	r2, [r4, #4]
     2b2:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2b6:	6062      	str	r2, [r4, #4]
     2b8:	6800      	ldr	r0, [r0, #0]
     2ba:	6842      	ldr	r2, [r0, #4]
     2bc:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2c0:	6042      	str	r2, [r0, #4]
     2c2:	700b      	strb	r3, [r1, #0]
     2c4:	2001      	movs	r0, #1
     2c6:	e7af      	b.n	228 <drv_uart_getchar+0xa>

000002c8 <uart_int_tx_done_callback>:
     2c8:	4770      	bx	lr

000002ca <uart_int_rx_stop_callback>:
     2ca:	4770      	bx	lr

000002cc <uart_int_rx_parity_error_callback>:
     2cc:	4770      	bx	lr

000002ce <uart_int_rx_noise_detect_callback>:
     2ce:	4770      	bx	lr

000002d0 <uart_int_rx_stop_detect_callback>:
     2d0:	4770      	bx	lr

000002d2 <uart_int_tx_fifo_empty_callback>:
     2d2:	4770      	bx	lr

000002d4 <uart_int_tx_fifo_thres_callback>:
     2d4:	4770      	bx	lr

000002d6 <uart_int_rx_fifo_noempty_callback>:
     2d6:	4770      	bx	lr

000002d8 <uart_int_rx_fifo_thres_callback>:
     2d8:	4770      	bx	lr

000002da <drv_uart_interrupt_handler>:
     2da:	b538      	push	{r3, r4, r5, lr}
     2dc:	4604      	mov	r4, r0
     2de:	6803      	ldr	r3, [r0, #0]
     2e0:	699d      	ldr	r5, [r3, #24]
     2e2:	68db      	ldr	r3, [r3, #12]
     2e4:	b29b      	uxth	r3, r3
     2e6:	401d      	ands	r5, r3
     2e8:	f415 7f80 	tst.w	r5, #256	; 0x100
     2ec:	d144      	bne.n	378 <drv_uart_interrupt_handler+0x9e>
     2ee:	f015 0f40 	tst.w	r5, #64	; 0x40
     2f2:	d00f      	beq.n	314 <drv_uart_interrupt_handler+0x3a>
     2f4:	2301      	movs	r3, #1
     2f6:	7423      	strb	r3, [r4, #16]
     2f8:	7aa3      	ldrb	r3, [r4, #10]
     2fa:	2b01      	cmp	r3, #1
     2fc:	d147      	bne.n	38e <drv_uart_interrupt_handler+0xb4>
     2fe:	4620      	mov	r0, r4
     300:	f7ff ffe3 	bl	2ca <uart_int_rx_stop_callback>
     304:	6822      	ldr	r2, [r4, #0]
     306:	6913      	ldr	r3, [r2, #16]
     308:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     30c:	6113      	str	r3, [r2, #16]
     30e:	6823      	ldr	r3, [r4, #0]
     310:	2200      	movs	r2, #0
     312:	611a      	str	r2, [r3, #16]
     314:	f015 0f80 	tst.w	r5, #128	; 0x80
     318:	d00f      	beq.n	33a <drv_uart_interrupt_handler+0x60>
     31a:	2302      	movs	r3, #2
     31c:	7423      	strb	r3, [r4, #16]
     31e:	7aa3      	ldrb	r3, [r4, #10]
     320:	2b01      	cmp	r3, #1
     322:	d166      	bne.n	3f2 <drv_uart_interrupt_handler+0x118>
     324:	4620      	mov	r0, r4
     326:	f7ff ffd1 	bl	2cc <uart_int_rx_parity_error_callback>
     32a:	6822      	ldr	r2, [r4, #0]
     32c:	6913      	ldr	r3, [r2, #16]
     32e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     332:	6113      	str	r3, [r2, #16]
     334:	6823      	ldr	r3, [r4, #0]
     336:	2200      	movs	r2, #0
     338:	611a      	str	r2, [r3, #16]
     33a:	f015 0f20 	tst.w	r5, #32
     33e:	f040 808a 	bne.w	456 <drv_uart_interrupt_handler+0x17c>
     342:	f015 0f10 	tst.w	r5, #16
     346:	f040 8092 	bne.w	46e <drv_uart_interrupt_handler+0x194>
     34a:	f015 0f01 	tst.w	r5, #1
     34e:	f040 809a 	bne.w	486 <drv_uart_interrupt_handler+0x1ac>
     352:	f015 0f02 	tst.w	r5, #2
     356:	f040 80a2 	bne.w	49e <drv_uart_interrupt_handler+0x1c4>
     35a:	f015 0f04 	tst.w	r5, #4
     35e:	f000 80c1 	beq.w	4e4 <drv_uart_interrupt_handler+0x20a>
     362:	7ce2      	ldrb	r2, [r4, #19]
     364:	7e23      	ldrb	r3, [r4, #24]
     366:	429a      	cmp	r2, r3
     368:	f0c0 80ac 	bcc.w	4c4 <drv_uart_interrupt_handler+0x1ea>
     36c:	6822      	ldr	r2, [r4, #0]
     36e:	68d3      	ldr	r3, [r2, #12]
     370:	f023 030c 	bic.w	r3, r3, #12
     374:	60d3      	str	r3, [r2, #12]
     376:	e0aa      	b.n	4ce <drv_uart_interrupt_handler+0x1f4>
     378:	f7ff ffa6 	bl	2c8 <uart_int_tx_done_callback>
     37c:	6822      	ldr	r2, [r4, #0]
     37e:	6913      	ldr	r3, [r2, #16]
     380:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     384:	6113      	str	r3, [r2, #16]
     386:	6823      	ldr	r3, [r4, #0]
     388:	2200      	movs	r2, #0
     38a:	611a      	str	r2, [r3, #16]
     38c:	e7af      	b.n	2ee <drv_uart_interrupt_handler+0x14>
     38e:	6822      	ldr	r2, [r4, #0]
     390:	68d3      	ldr	r3, [r2, #12]
     392:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     396:	60d3      	str	r3, [r2, #12]
     398:	2300      	movs	r3, #0
     39a:	7423      	strb	r3, [r4, #16]
     39c:	74a3      	strb	r3, [r4, #18]
     39e:	74e3      	strb	r3, [r4, #19]
     3a0:	6822      	ldr	r2, [r4, #0]
     3a2:	6853      	ldr	r3, [r2, #4]
     3a4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     3a8:	6053      	str	r3, [r2, #4]
     3aa:	6822      	ldr	r2, [r4, #0]
     3ac:	6853      	ldr	r3, [r2, #4]
     3ae:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     3b2:	6053      	str	r3, [r2, #4]
     3b4:	6822      	ldr	r2, [r4, #0]
     3b6:	6853      	ldr	r3, [r2, #4]
     3b8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     3bc:	6053      	str	r3, [r2, #4]
     3be:	6822      	ldr	r2, [r4, #0]
     3c0:	6853      	ldr	r3, [r2, #4]
     3c2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     3c6:	6053      	str	r3, [r2, #4]
     3c8:	6822      	ldr	r2, [r4, #0]
     3ca:	6853      	ldr	r3, [r2, #4]
     3cc:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     3d0:	6053      	str	r3, [r2, #4]
     3d2:	6822      	ldr	r2, [r4, #0]
     3d4:	6853      	ldr	r3, [r2, #4]
     3d6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     3da:	6053      	str	r3, [r2, #4]
     3dc:	6822      	ldr	r2, [r4, #0]
     3de:	6853      	ldr	r3, [r2, #4]
     3e0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     3e4:	6053      	str	r3, [r2, #4]
     3e6:	6822      	ldr	r2, [r4, #0]
     3e8:	6853      	ldr	r3, [r2, #4]
     3ea:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     3ee:	6053      	str	r3, [r2, #4]
     3f0:	e785      	b.n	2fe <drv_uart_interrupt_handler+0x24>
     3f2:	6822      	ldr	r2, [r4, #0]
     3f4:	68d3      	ldr	r3, [r2, #12]
     3f6:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     3fa:	60d3      	str	r3, [r2, #12]
     3fc:	2300      	movs	r3, #0
     3fe:	7423      	strb	r3, [r4, #16]
     400:	74a3      	strb	r3, [r4, #18]
     402:	74e3      	strb	r3, [r4, #19]
     404:	6822      	ldr	r2, [r4, #0]
     406:	6853      	ldr	r3, [r2, #4]
     408:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     40c:	6053      	str	r3, [r2, #4]
     40e:	6822      	ldr	r2, [r4, #0]
     410:	6853      	ldr	r3, [r2, #4]
     412:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     416:	6053      	str	r3, [r2, #4]
     418:	6822      	ldr	r2, [r4, #0]
     41a:	6853      	ldr	r3, [r2, #4]
     41c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     420:	6053      	str	r3, [r2, #4]
     422:	6822      	ldr	r2, [r4, #0]
     424:	6853      	ldr	r3, [r2, #4]
     426:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     42a:	6053      	str	r3, [r2, #4]
     42c:	6822      	ldr	r2, [r4, #0]
     42e:	6853      	ldr	r3, [r2, #4]
     430:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     434:	6053      	str	r3, [r2, #4]
     436:	6822      	ldr	r2, [r4, #0]
     438:	6853      	ldr	r3, [r2, #4]
     43a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     43e:	6053      	str	r3, [r2, #4]
     440:	6822      	ldr	r2, [r4, #0]
     442:	6853      	ldr	r3, [r2, #4]
     444:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     448:	6053      	str	r3, [r2, #4]
     44a:	6822      	ldr	r2, [r4, #0]
     44c:	6853      	ldr	r3, [r2, #4]
     44e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     452:	6053      	str	r3, [r2, #4]
     454:	e766      	b.n	324 <drv_uart_interrupt_handler+0x4a>
     456:	4620      	mov	r0, r4
     458:	f7ff ff39 	bl	2ce <uart_int_rx_noise_detect_callback>
     45c:	6822      	ldr	r2, [r4, #0]
     45e:	6913      	ldr	r3, [r2, #16]
     460:	f043 0320 	orr.w	r3, r3, #32
     464:	6113      	str	r3, [r2, #16]
     466:	6823      	ldr	r3, [r4, #0]
     468:	2200      	movs	r2, #0
     46a:	611a      	str	r2, [r3, #16]
     46c:	e769      	b.n	342 <drv_uart_interrupt_handler+0x68>
     46e:	4620      	mov	r0, r4
     470:	f7ff ff2e 	bl	2d0 <uart_int_rx_stop_detect_callback>
     474:	6822      	ldr	r2, [r4, #0]
     476:	6913      	ldr	r3, [r2, #16]
     478:	f043 0310 	orr.w	r3, r3, #16
     47c:	6113      	str	r3, [r2, #16]
     47e:	6823      	ldr	r3, [r4, #0]
     480:	2200      	movs	r2, #0
     482:	611a      	str	r2, [r3, #16]
     484:	e761      	b.n	34a <drv_uart_interrupt_handler+0x70>
     486:	4620      	mov	r0, r4
     488:	f7ff ff24 	bl	2d4 <uart_int_tx_fifo_thres_callback>
     48c:	6822      	ldr	r2, [r4, #0]
     48e:	6913      	ldr	r3, [r2, #16]
     490:	f043 0301 	orr.w	r3, r3, #1
     494:	6113      	str	r3, [r2, #16]
     496:	6823      	ldr	r3, [r4, #0]
     498:	2200      	movs	r2, #0
     49a:	611a      	str	r2, [r3, #16]
     49c:	e759      	b.n	352 <drv_uart_interrupt_handler+0x78>
     49e:	4620      	mov	r0, r4
     4a0:	f7ff ff17 	bl	2d2 <uart_int_tx_fifo_empty_callback>
     4a4:	6822      	ldr	r2, [r4, #0]
     4a6:	6913      	ldr	r3, [r2, #16]
     4a8:	f043 0302 	orr.w	r3, r3, #2
     4ac:	6113      	str	r3, [r2, #16]
     4ae:	6823      	ldr	r3, [r4, #0]
     4b0:	2200      	movs	r2, #0
     4b2:	611a      	str	r2, [r3, #16]
     4b4:	e751      	b.n	35a <drv_uart_interrupt_handler+0x80>
     4b6:	69d9      	ldr	r1, [r3, #28]
     4b8:	6962      	ldr	r2, [r4, #20]
     4ba:	7ce3      	ldrb	r3, [r4, #19]
     4bc:	1c58      	adds	r0, r3, #1
     4be:	74e0      	strb	r0, [r4, #19]
     4c0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     4c4:	6823      	ldr	r3, [r4, #0]
     4c6:	695a      	ldr	r2, [r3, #20]
     4c8:	f012 0f1f 	tst.w	r2, #31
     4cc:	d1f3      	bne.n	4b6 <drv_uart_interrupt_handler+0x1dc>
     4ce:	4620      	mov	r0, r4
     4d0:	f7ff ff02 	bl	2d8 <uart_int_rx_fifo_thres_callback>
     4d4:	6822      	ldr	r2, [r4, #0]
     4d6:	6913      	ldr	r3, [r2, #16]
     4d8:	f043 0304 	orr.w	r3, r3, #4
     4dc:	6113      	str	r3, [r2, #16]
     4de:	6823      	ldr	r3, [r4, #0]
     4e0:	2200      	movs	r2, #0
     4e2:	611a      	str	r2, [r3, #16]
     4e4:	f015 0f08 	tst.w	r5, #8
     4e8:	d020      	beq.n	52c <drv_uart_interrupt_handler+0x252>
     4ea:	7ce2      	ldrb	r2, [r4, #19]
     4ec:	7e23      	ldrb	r3, [r4, #24]
     4ee:	429a      	cmp	r2, r3
     4f0:	d30c      	bcc.n	50c <drv_uart_interrupt_handler+0x232>
     4f2:	6822      	ldr	r2, [r4, #0]
     4f4:	68d3      	ldr	r3, [r2, #12]
     4f6:	f023 030c 	bic.w	r3, r3, #12
     4fa:	60d3      	str	r3, [r2, #12]
     4fc:	e00b      	b.n	516 <drv_uart_interrupt_handler+0x23c>
     4fe:	69d9      	ldr	r1, [r3, #28]
     500:	6962      	ldr	r2, [r4, #20]
     502:	7ce3      	ldrb	r3, [r4, #19]
     504:	1c58      	adds	r0, r3, #1
     506:	74e0      	strb	r0, [r4, #19]
     508:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     50c:	6823      	ldr	r3, [r4, #0]
     50e:	695a      	ldr	r2, [r3, #20]
     510:	f012 0f1f 	tst.w	r2, #31
     514:	d1f3      	bne.n	4fe <drv_uart_interrupt_handler+0x224>
     516:	4620      	mov	r0, r4
     518:	f7ff fedd 	bl	2d6 <uart_int_rx_fifo_noempty_callback>
     51c:	6822      	ldr	r2, [r4, #0]
     51e:	6913      	ldr	r3, [r2, #16]
     520:	f043 0308 	orr.w	r3, r3, #8
     524:	6113      	str	r3, [r2, #16]
     526:	6823      	ldr	r3, [r4, #0]
     528:	2200      	movs	r2, #0
     52a:	611a      	str	r2, [r3, #16]
     52c:	bd38      	pop	{r3, r4, r5, pc}
	...

00000530 <vprintf>:
     530:	b500      	push	{lr}
     532:	b091      	sub	sp, #68	; 0x44
     534:	460a      	mov	r2, r1
     536:	4601      	mov	r1, r0
     538:	4668      	mov	r0, sp
     53a:	f000 f8bb 	bl	6b4 <vsiprintf>
     53e:	2800      	cmp	r0, #0
     540:	dc05      	bgt.n	54e <vprintf+0x1e>
     542:	4668      	mov	r0, sp
     544:	f000 f898 	bl	678 <strlen>
     548:	b011      	add	sp, #68	; 0x44
     54a:	f85d fb04 	ldr.w	pc, [sp], #4
     54e:	4668      	mov	r0, sp
     550:	f000 f892 	bl	678 <strlen>
     554:	b2c2      	uxtb	r2, r0
     556:	4669      	mov	r1, sp
     558:	4801      	ldr	r0, [pc, #4]	; (560 <vprintf+0x30>)
     55a:	f7ff fe29 	bl	1b0 <drv_uart_putchars>
     55e:	e7f0      	b.n	542 <vprintf+0x12>
     560:	00010088 	andeq	r0, r1, r8, lsl #1

00000564 <drv_uart_printf>:
     564:	b40f      	push	{r0, r1, r2, r3}
     566:	b500      	push	{lr}
     568:	b083      	sub	sp, #12
     56a:	a904      	add	r1, sp, #16
     56c:	f851 0b04 	ldr.w	r0, [r1], #4
     570:	9101      	str	r1, [sp, #4]
     572:	f7ff ffdd 	bl	530 <vprintf>
     576:	b003      	add	sp, #12
     578:	f85d eb04 	ldr.w	lr, [sp], #4
     57c:	b004      	add	sp, #16
     57e:	4770      	bx	lr

00000580 <NMI_Handler>:
     580:	4770      	bx	lr

00000582 <HardFault_Handler>:
     582:	e7fe      	b.n	582 <HardFault_Handler>

00000584 <MemManage_Handler>:
     584:	e7fe      	b.n	584 <MemManage_Handler>

00000586 <BusFault_Handler>:
     586:	e7fe      	b.n	586 <BusFault_Handler>

00000588 <UsageFault_Handler>:
     588:	e7fe      	b.n	588 <UsageFault_Handler>

0000058a <SVC_Handler>:
     58a:	4770      	bx	lr

0000058c <DebugMon_Handler>:
     58c:	4770      	bx	lr

0000058e <PendSV_Handler>:
     58e:	4770      	bx	lr

00000590 <SysTick_Handler>:
     590:	4770      	bx	lr
	...

00000594 <Uart0_Handler>:
     594:	b508      	push	{r3, lr}
     596:	4b04      	ldr	r3, [pc, #16]	; (5a8 <Uart0_Handler+0x14>)
     598:	2201      	movs	r2, #1
     59a:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     59e:	4803      	ldr	r0, [pc, #12]	; (5ac <Uart0_Handler+0x18>)
     5a0:	f7ff fe9b 	bl	2da <drv_uart_interrupt_handler>
     5a4:	bd08      	pop	{r3, pc}
     5a6:	bf00      	nop
     5a8:	e000e100 	and	lr, r0, r0, lsl #2
     5ac:	00010088 	andeq	r0, r1, r8, lsl #1

000005b0 <main>:
     5b0:	b500      	push	{lr}
     5b2:	b083      	sub	sp, #12
     5b4:	4c0b      	ldr	r4, [pc, #44]	; (5e4 <main+0x34>)
     5b6:	4b0c      	ldr	r3, [pc, #48]	; (5e8 <main+0x38>)
     5b8:	6023      	str	r3, [r4, #0]
     5ba:	4620      	mov	r0, r4
     5bc:	f7ff fd7d 	bl	ba <drv_uart_default_config>
     5c0:	4620      	mov	r0, r4
     5c2:	f7ff fdad 	bl	120 <drv_uart_init>
     5c6:	4809      	ldr	r0, [pc, #36]	; (5ec <main+0x3c>)
     5c8:	f7ff ffcc 	bl	564 <drv_uart_printf>
     5cc:	4c05      	ldr	r4, [pc, #20]	; (5e4 <main+0x34>)
     5ce:	f10d 0107 	add.w	r1, sp, #7
     5d2:	4620      	mov	r0, r4
     5d4:	f7ff fe23 	bl	21e <drv_uart_getchar>
     5d8:	f10d 0107 	add.w	r1, sp, #7
     5dc:	4620      	mov	r0, r4
     5de:	f7ff fe09 	bl	1f4 <drv_uart_putchar>
     5e2:	e7f3      	b.n	5cc <main+0x1c>
     5e4:	00010088 	andeq	r0, r1, r8, lsl #1
     5e8:	40001000 	andmi	r1, r0, r0
     5ec:	00000fb4 			; <UNDEFINED> instruction: 0x00000fb4

000005f0 <Reset_Handler>:
     5f0:	490a      	ldr	r1, [pc, #40]	; (61c <Reset_Handler+0x2c>)
     5f2:	4a0b      	ldr	r2, [pc, #44]	; (620 <Reset_Handler+0x30>)
     5f4:	4b0b      	ldr	r3, [pc, #44]	; (624 <Reset_Handler+0x34>)
     5f6:	1a9b      	subs	r3, r3, r2
     5f8:	dd03      	ble.n	602 <Reset_Handler+0x12>
     5fa:	3b04      	subs	r3, #4
     5fc:	58c8      	ldr	r0, [r1, r3]
     5fe:	50d0      	str	r0, [r2, r3]
     600:	dcfb      	bgt.n	5fa <Reset_Handler+0xa>
     602:	4909      	ldr	r1, [pc, #36]	; (628 <Reset_Handler+0x38>)
     604:	4a09      	ldr	r2, [pc, #36]	; (62c <Reset_Handler+0x3c>)
     606:	2000      	movs	r0, #0
     608:	4291      	cmp	r1, r2
     60a:	bfbc      	itt	lt
     60c:	f841 0b04 	strlt.w	r0, [r1], #4
     610:	e7fa      	blt.n	608 <Reset_Handler+0x18>
     612:	f7ff ffcd 	bl	5b0 <main>
     616:	f000 f81b 	bl	650 <exit>
     61a:	101c0000 	andsne	r0, ip, r0
     61e:	00000000 	andeq	r0, r0, r0
     622:	006c0001 	rsbeq	r0, ip, r1
     626:	006c0001 	rsbeq	r0, ip, r1
     62a:	00b80001 	adcseq	r0, r8, r1
     62e:	e7fe0001 	ldrb	r0, [lr, r1]!
     632:	e7fe      	b.n	632 <Reset_Handler+0x42>
     634:	e7fe      	b.n	634 <Reset_Handler+0x44>
     636:	e7fe      	b.n	636 <Reset_Handler+0x46>
     638:	e7fe      	b.n	638 <Reset_Handler+0x48>
     63a:	e7fe      	b.n	63a <Reset_Handler+0x4a>
     63c:	e7fe      	b.n	63c <Reset_Handler+0x4c>
     63e:	e7fe      	b.n	63e <Reset_Handler+0x4e>
     640:	e7fe      	b.n	640 <Reset_Handler+0x50>
     642:	e7fe      	b.n	642 <Reset_Handler+0x52>

00000644 <Uart1_Handler>:
     644:	e7fe      	b.n	644 <Uart1_Handler>

00000646 <Resv0_Handler>:
     646:	e7fe      	b.n	646 <Resv0_Handler>

00000648 <Resv1_Handler>:
     648:	e7fe      	b.n	648 <Resv1_Handler>

0000064a <Resv2_Handler>:
     64a:	e7fe      	b.n	64a <Resv2_Handler>

0000064c <Gpioa_Handler>:
     64c:	e7fe      	b.n	64c <Gpioa_Handler>
     64e:	bf00      	nop

00000650 <exit>:
     650:	b508      	push	{r3, lr}
     652:	4b07      	ldr	r3, [pc, #28]	; (670 <exit+0x20>)
     654:	4604      	mov	r4, r0
     656:	b113      	cbz	r3, 65e <exit+0xe>
     658:	2100      	movs	r1, #0
     65a:	f3af 8000 	nop.w
     65e:	4b05      	ldr	r3, [pc, #20]	; (674 <exit+0x24>)
     660:	6818      	ldr	r0, [r3, #0]
     662:	6a83      	ldr	r3, [r0, #40]	; 0x28
     664:	b103      	cbz	r3, 668 <exit+0x18>
     666:	4798      	blx	r3
     668:	4620      	mov	r0, r4
     66a:	f000 fc95 	bl	f98 <_exit>
     66e:	bf00      	nop
     670:	00000000 	andeq	r0, r0, r0
     674:	00000fe0 	andeq	r0, r0, r0, ror #31

00000678 <strlen>:
     678:	4603      	mov	r3, r0
     67a:	f813 2b01 	ldrb.w	r2, [r3], #1
     67e:	2a00      	cmp	r2, #0
     680:	d1fb      	bne.n	67a <strlen+0x2>
     682:	1a18      	subs	r0, r3, r0
     684:	3801      	subs	r0, #1
     686:	4770      	bx	lr

00000688 <_vsiprintf_r>:
     688:	b500      	push	{lr}
     68a:	b09b      	sub	sp, #108	; 0x6c
     68c:	9100      	str	r1, [sp, #0]
     68e:	9104      	str	r1, [sp, #16]
     690:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
     694:	9105      	str	r1, [sp, #20]
     696:	9102      	str	r1, [sp, #8]
     698:	4905      	ldr	r1, [pc, #20]	; (6b0 <_vsiprintf_r+0x28>)
     69a:	9103      	str	r1, [sp, #12]
     69c:	4669      	mov	r1, sp
     69e:	f000 f86f 	bl	780 <_svfiprintf_r>
     6a2:	2200      	movs	r2, #0
     6a4:	9b00      	ldr	r3, [sp, #0]
     6a6:	701a      	strb	r2, [r3, #0]
     6a8:	b01b      	add	sp, #108	; 0x6c
     6aa:	f85d fb04 	ldr.w	pc, [sp], #4
     6ae:	bf00      	nop
     6b0:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

000006b4 <vsiprintf>:
     6b4:	4613      	mov	r3, r2
     6b6:	460a      	mov	r2, r1
     6b8:	4601      	mov	r1, r0
     6ba:	4802      	ldr	r0, [pc, #8]	; (6c4 <vsiprintf+0x10>)
     6bc:	6800      	ldr	r0, [r0, #0]
     6be:	f7ff bfe3 	b.w	688 <_vsiprintf_r>
     6c2:	bf00      	nop
     6c4:	00010000 	andeq	r0, r1, r0

000006c8 <__ssputs_r>:
     6c8:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     6cc:	688e      	ldr	r6, [r1, #8]
     6ce:	4682      	mov	sl, r0
     6d0:	429e      	cmp	r6, r3
     6d2:	460c      	mov	r4, r1
     6d4:	4690      	mov	r8, r2
     6d6:	461f      	mov	r7, r3
     6d8:	d838      	bhi.n	74c <__ssputs_r+0x84>
     6da:	898a      	ldrh	r2, [r1, #12]
     6dc:	f412 6f90 	tst.w	r2, #1152	; 0x480
     6e0:	d032      	beq.n	748 <__ssputs_r+0x80>
     6e2:	6825      	ldr	r5, [r4, #0]
     6e4:	6909      	ldr	r1, [r1, #16]
     6e6:	3301      	adds	r3, #1
     6e8:	eba5 0901 	sub.w	r9, r5, r1
     6ec:	6965      	ldr	r5, [r4, #20]
     6ee:	444b      	add	r3, r9
     6f0:	eb05 0545 	add.w	r5, r5, r5, lsl #1
     6f4:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
     6f8:	106d      	asrs	r5, r5, #1
     6fa:	429d      	cmp	r5, r3
     6fc:	bf38      	it	cc
     6fe:	461d      	movcc	r5, r3
     700:	0553      	lsls	r3, r2, #21
     702:	d531      	bpl.n	768 <__ssputs_r+0xa0>
     704:	4629      	mov	r1, r5
     706:	f000 fb6f 	bl	de8 <_malloc_r>
     70a:	4606      	mov	r6, r0
     70c:	b950      	cbnz	r0, 724 <__ssputs_r+0x5c>
     70e:	230c      	movs	r3, #12
     710:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     714:	f8ca 3000 	str.w	r3, [sl]
     718:	89a3      	ldrh	r3, [r4, #12]
     71a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     71e:	81a3      	strh	r3, [r4, #12]
     720:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     724:	464a      	mov	r2, r9
     726:	6921      	ldr	r1, [r4, #16]
     728:	f000 face 	bl	cc8 <memcpy>
     72c:	89a3      	ldrh	r3, [r4, #12]
     72e:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
     732:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     736:	81a3      	strh	r3, [r4, #12]
     738:	6126      	str	r6, [r4, #16]
     73a:	444e      	add	r6, r9
     73c:	6026      	str	r6, [r4, #0]
     73e:	463e      	mov	r6, r7
     740:	6165      	str	r5, [r4, #20]
     742:	eba5 0509 	sub.w	r5, r5, r9
     746:	60a5      	str	r5, [r4, #8]
     748:	42be      	cmp	r6, r7
     74a:	d900      	bls.n	74e <__ssputs_r+0x86>
     74c:	463e      	mov	r6, r7
     74e:	4632      	mov	r2, r6
     750:	4641      	mov	r1, r8
     752:	6820      	ldr	r0, [r4, #0]
     754:	f000 fac6 	bl	ce4 <memmove>
     758:	68a3      	ldr	r3, [r4, #8]
     75a:	2000      	movs	r0, #0
     75c:	1b9b      	subs	r3, r3, r6
     75e:	60a3      	str	r3, [r4, #8]
     760:	6823      	ldr	r3, [r4, #0]
     762:	4433      	add	r3, r6
     764:	6023      	str	r3, [r4, #0]
     766:	e7db      	b.n	720 <__ssputs_r+0x58>
     768:	462a      	mov	r2, r5
     76a:	f000 fbb1 	bl	ed0 <_realloc_r>
     76e:	4606      	mov	r6, r0
     770:	2800      	cmp	r0, #0
     772:	d1e1      	bne.n	738 <__ssputs_r+0x70>
     774:	4650      	mov	r0, sl
     776:	6921      	ldr	r1, [r4, #16]
     778:	f000 face 	bl	d18 <_free_r>
     77c:	e7c7      	b.n	70e <__ssputs_r+0x46>
	...

00000780 <_svfiprintf_r>:
     780:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     784:	4698      	mov	r8, r3
     786:	898b      	ldrh	r3, [r1, #12]
     788:	4607      	mov	r7, r0
     78a:	061b      	lsls	r3, r3, #24
     78c:	460d      	mov	r5, r1
     78e:	4614      	mov	r4, r2
     790:	b09d      	sub	sp, #116	; 0x74
     792:	d50e      	bpl.n	7b2 <_svfiprintf_r+0x32>
     794:	690b      	ldr	r3, [r1, #16]
     796:	b963      	cbnz	r3, 7b2 <_svfiprintf_r+0x32>
     798:	2140      	movs	r1, #64	; 0x40
     79a:	f000 fb25 	bl	de8 <_malloc_r>
     79e:	6028      	str	r0, [r5, #0]
     7a0:	6128      	str	r0, [r5, #16]
     7a2:	b920      	cbnz	r0, 7ae <_svfiprintf_r+0x2e>
     7a4:	230c      	movs	r3, #12
     7a6:	603b      	str	r3, [r7, #0]
     7a8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     7ac:	e0d1      	b.n	952 <_svfiprintf_r+0x1d2>
     7ae:	2340      	movs	r3, #64	; 0x40
     7b0:	616b      	str	r3, [r5, #20]
     7b2:	2300      	movs	r3, #0
     7b4:	9309      	str	r3, [sp, #36]	; 0x24
     7b6:	2320      	movs	r3, #32
     7b8:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
     7bc:	2330      	movs	r3, #48	; 0x30
     7be:	f04f 0901 	mov.w	r9, #1
     7c2:	f8cd 800c 	str.w	r8, [sp, #12]
     7c6:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 96c <_svfiprintf_r+0x1ec>
     7ca:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
     7ce:	4623      	mov	r3, r4
     7d0:	469a      	mov	sl, r3
     7d2:	f813 2b01 	ldrb.w	r2, [r3], #1
     7d6:	b10a      	cbz	r2, 7dc <_svfiprintf_r+0x5c>
     7d8:	2a25      	cmp	r2, #37	; 0x25
     7da:	d1f9      	bne.n	7d0 <_svfiprintf_r+0x50>
     7dc:	ebba 0b04 	subs.w	fp, sl, r4
     7e0:	d00b      	beq.n	7fa <_svfiprintf_r+0x7a>
     7e2:	465b      	mov	r3, fp
     7e4:	4622      	mov	r2, r4
     7e6:	4629      	mov	r1, r5
     7e8:	4638      	mov	r0, r7
     7ea:	f7ff ff6d 	bl	6c8 <__ssputs_r>
     7ee:	3001      	adds	r0, #1
     7f0:	f000 80aa 	beq.w	948 <_svfiprintf_r+0x1c8>
     7f4:	9a09      	ldr	r2, [sp, #36]	; 0x24
     7f6:	445a      	add	r2, fp
     7f8:	9209      	str	r2, [sp, #36]	; 0x24
     7fa:	f89a 3000 	ldrb.w	r3, [sl]
     7fe:	2b00      	cmp	r3, #0
     800:	f000 80a2 	beq.w	948 <_svfiprintf_r+0x1c8>
     804:	2300      	movs	r3, #0
     806:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
     80a:	e9cd 2305 	strd	r2, r3, [sp, #20]
     80e:	f10a 0a01 	add.w	sl, sl, #1
     812:	9304      	str	r3, [sp, #16]
     814:	9307      	str	r3, [sp, #28]
     816:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
     81a:	931a      	str	r3, [sp, #104]	; 0x68
     81c:	4654      	mov	r4, sl
     81e:	2205      	movs	r2, #5
     820:	f814 1b01 	ldrb.w	r1, [r4], #1
     824:	4851      	ldr	r0, [pc, #324]	; (96c <_svfiprintf_r+0x1ec>)
     826:	f000 fa41 	bl	cac <memchr>
     82a:	9a04      	ldr	r2, [sp, #16]
     82c:	b9d8      	cbnz	r0, 866 <_svfiprintf_r+0xe6>
     82e:	06d0      	lsls	r0, r2, #27
     830:	bf44      	itt	mi
     832:	2320      	movmi	r3, #32
     834:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     838:	0711      	lsls	r1, r2, #28
     83a:	bf44      	itt	mi
     83c:	232b      	movmi	r3, #43	; 0x2b
     83e:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
     842:	f89a 3000 	ldrb.w	r3, [sl]
     846:	2b2a      	cmp	r3, #42	; 0x2a
     848:	d015      	beq.n	876 <_svfiprintf_r+0xf6>
     84a:	4654      	mov	r4, sl
     84c:	2000      	movs	r0, #0
     84e:	f04f 0c0a 	mov.w	ip, #10
     852:	9a07      	ldr	r2, [sp, #28]
     854:	4621      	mov	r1, r4
     856:	f811 3b01 	ldrb.w	r3, [r1], #1
     85a:	3b30      	subs	r3, #48	; 0x30
     85c:	2b09      	cmp	r3, #9
     85e:	d94e      	bls.n	8fe <_svfiprintf_r+0x17e>
     860:	b1b0      	cbz	r0, 890 <_svfiprintf_r+0x110>
     862:	9207      	str	r2, [sp, #28]
     864:	e014      	b.n	890 <_svfiprintf_r+0x110>
     866:	eba0 0308 	sub.w	r3, r0, r8
     86a:	fa09 f303 	lsl.w	r3, r9, r3
     86e:	4313      	orrs	r3, r2
     870:	46a2      	mov	sl, r4
     872:	9304      	str	r3, [sp, #16]
     874:	e7d2      	b.n	81c <_svfiprintf_r+0x9c>
     876:	9b03      	ldr	r3, [sp, #12]
     878:	1d19      	adds	r1, r3, #4
     87a:	681b      	ldr	r3, [r3, #0]
     87c:	9103      	str	r1, [sp, #12]
     87e:	2b00      	cmp	r3, #0
     880:	bfbb      	ittet	lt
     882:	425b      	neglt	r3, r3
     884:	f042 0202 	orrlt.w	r2, r2, #2
     888:	9307      	strge	r3, [sp, #28]
     88a:	9307      	strlt	r3, [sp, #28]
     88c:	bfb8      	it	lt
     88e:	9204      	strlt	r2, [sp, #16]
     890:	7823      	ldrb	r3, [r4, #0]
     892:	2b2e      	cmp	r3, #46	; 0x2e
     894:	d10c      	bne.n	8b0 <_svfiprintf_r+0x130>
     896:	7863      	ldrb	r3, [r4, #1]
     898:	2b2a      	cmp	r3, #42	; 0x2a
     89a:	d135      	bne.n	908 <_svfiprintf_r+0x188>
     89c:	9b03      	ldr	r3, [sp, #12]
     89e:	3402      	adds	r4, #2
     8a0:	1d1a      	adds	r2, r3, #4
     8a2:	681b      	ldr	r3, [r3, #0]
     8a4:	9203      	str	r2, [sp, #12]
     8a6:	2b00      	cmp	r3, #0
     8a8:	bfb8      	it	lt
     8aa:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
     8ae:	9305      	str	r3, [sp, #20]
     8b0:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 970 <_svfiprintf_r+0x1f0>
     8b4:	2203      	movs	r2, #3
     8b6:	4650      	mov	r0, sl
     8b8:	7821      	ldrb	r1, [r4, #0]
     8ba:	f000 f9f7 	bl	cac <memchr>
     8be:	b140      	cbz	r0, 8d2 <_svfiprintf_r+0x152>
     8c0:	2340      	movs	r3, #64	; 0x40
     8c2:	eba0 000a 	sub.w	r0, r0, sl
     8c6:	fa03 f000 	lsl.w	r0, r3, r0
     8ca:	9b04      	ldr	r3, [sp, #16]
     8cc:	3401      	adds	r4, #1
     8ce:	4303      	orrs	r3, r0
     8d0:	9304      	str	r3, [sp, #16]
     8d2:	f814 1b01 	ldrb.w	r1, [r4], #1
     8d6:	2206      	movs	r2, #6
     8d8:	4826      	ldr	r0, [pc, #152]	; (974 <_svfiprintf_r+0x1f4>)
     8da:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
     8de:	f000 f9e5 	bl	cac <memchr>
     8e2:	2800      	cmp	r0, #0
     8e4:	d038      	beq.n	958 <_svfiprintf_r+0x1d8>
     8e6:	4b24      	ldr	r3, [pc, #144]	; (978 <_svfiprintf_r+0x1f8>)
     8e8:	bb1b      	cbnz	r3, 932 <_svfiprintf_r+0x1b2>
     8ea:	9b03      	ldr	r3, [sp, #12]
     8ec:	3307      	adds	r3, #7
     8ee:	f023 0307 	bic.w	r3, r3, #7
     8f2:	3308      	adds	r3, #8
     8f4:	9303      	str	r3, [sp, #12]
     8f6:	9b09      	ldr	r3, [sp, #36]	; 0x24
     8f8:	4433      	add	r3, r6
     8fa:	9309      	str	r3, [sp, #36]	; 0x24
     8fc:	e767      	b.n	7ce <_svfiprintf_r+0x4e>
     8fe:	460c      	mov	r4, r1
     900:	2001      	movs	r0, #1
     902:	fb0c 3202 	mla	r2, ip, r2, r3
     906:	e7a5      	b.n	854 <_svfiprintf_r+0xd4>
     908:	2300      	movs	r3, #0
     90a:	f04f 0c0a 	mov.w	ip, #10
     90e:	4619      	mov	r1, r3
     910:	3401      	adds	r4, #1
     912:	9305      	str	r3, [sp, #20]
     914:	4620      	mov	r0, r4
     916:	f810 2b01 	ldrb.w	r2, [r0], #1
     91a:	3a30      	subs	r2, #48	; 0x30
     91c:	2a09      	cmp	r2, #9
     91e:	d903      	bls.n	928 <_svfiprintf_r+0x1a8>
     920:	2b00      	cmp	r3, #0
     922:	d0c5      	beq.n	8b0 <_svfiprintf_r+0x130>
     924:	9105      	str	r1, [sp, #20]
     926:	e7c3      	b.n	8b0 <_svfiprintf_r+0x130>
     928:	4604      	mov	r4, r0
     92a:	2301      	movs	r3, #1
     92c:	fb0c 2101 	mla	r1, ip, r1, r2
     930:	e7f0      	b.n	914 <_svfiprintf_r+0x194>
     932:	ab03      	add	r3, sp, #12
     934:	9300      	str	r3, [sp, #0]
     936:	462a      	mov	r2, r5
     938:	4638      	mov	r0, r7
     93a:	4b10      	ldr	r3, [pc, #64]	; (97c <_svfiprintf_r+0x1fc>)
     93c:	a904      	add	r1, sp, #16
     93e:	f3af 8000 	nop.w
     942:	1c42      	adds	r2, r0, #1
     944:	4606      	mov	r6, r0
     946:	d1d6      	bne.n	8f6 <_svfiprintf_r+0x176>
     948:	89ab      	ldrh	r3, [r5, #12]
     94a:	065b      	lsls	r3, r3, #25
     94c:	f53f af2c 	bmi.w	7a8 <_svfiprintf_r+0x28>
     950:	9809      	ldr	r0, [sp, #36]	; 0x24
     952:	b01d      	add	sp, #116	; 0x74
     954:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     958:	ab03      	add	r3, sp, #12
     95a:	9300      	str	r3, [sp, #0]
     95c:	462a      	mov	r2, r5
     95e:	4638      	mov	r0, r7
     960:	4b06      	ldr	r3, [pc, #24]	; (97c <_svfiprintf_r+0x1fc>)
     962:	a904      	add	r1, sp, #16
     964:	f000 f87c 	bl	a60 <_printf_i>
     968:	e7eb      	b.n	942 <_svfiprintf_r+0x1c2>
     96a:	bf00      	nop
     96c:	00000fe4 	andeq	r0, r0, r4, ror #31
     970:	00000fea 	andeq	r0, r0, sl, ror #31
     974:	00000fee 	andeq	r0, r0, lr, ror #31
     978:	00000000 	andeq	r0, r0, r0
     97c:	000006c9 	andeq	r0, r0, r9, asr #13

00000980 <_printf_common>:
     980:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     984:	4616      	mov	r6, r2
     986:	4699      	mov	r9, r3
     988:	688a      	ldr	r2, [r1, #8]
     98a:	690b      	ldr	r3, [r1, #16]
     98c:	4607      	mov	r7, r0
     98e:	4293      	cmp	r3, r2
     990:	bfb8      	it	lt
     992:	4613      	movlt	r3, r2
     994:	6033      	str	r3, [r6, #0]
     996:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
     99a:	460c      	mov	r4, r1
     99c:	f8dd 8020 	ldr.w	r8, [sp, #32]
     9a0:	b10a      	cbz	r2, 9a6 <_printf_common+0x26>
     9a2:	3301      	adds	r3, #1
     9a4:	6033      	str	r3, [r6, #0]
     9a6:	6823      	ldr	r3, [r4, #0]
     9a8:	0699      	lsls	r1, r3, #26
     9aa:	bf42      	ittt	mi
     9ac:	6833      	ldrmi	r3, [r6, #0]
     9ae:	3302      	addmi	r3, #2
     9b0:	6033      	strmi	r3, [r6, #0]
     9b2:	6825      	ldr	r5, [r4, #0]
     9b4:	f015 0506 	ands.w	r5, r5, #6
     9b8:	d106      	bne.n	9c8 <_printf_common+0x48>
     9ba:	f104 0a19 	add.w	sl, r4, #25
     9be:	68e3      	ldr	r3, [r4, #12]
     9c0:	6832      	ldr	r2, [r6, #0]
     9c2:	1a9b      	subs	r3, r3, r2
     9c4:	42ab      	cmp	r3, r5
     9c6:	dc28      	bgt.n	a1a <_printf_common+0x9a>
     9c8:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
     9cc:	1e13      	subs	r3, r2, #0
     9ce:	6822      	ldr	r2, [r4, #0]
     9d0:	bf18      	it	ne
     9d2:	2301      	movne	r3, #1
     9d4:	0692      	lsls	r2, r2, #26
     9d6:	d42d      	bmi.n	a34 <_printf_common+0xb4>
     9d8:	4649      	mov	r1, r9
     9da:	4638      	mov	r0, r7
     9dc:	f104 0243 	add.w	r2, r4, #67	; 0x43
     9e0:	47c0      	blx	r8
     9e2:	3001      	adds	r0, #1
     9e4:	d020      	beq.n	a28 <_printf_common+0xa8>
     9e6:	6823      	ldr	r3, [r4, #0]
     9e8:	68e5      	ldr	r5, [r4, #12]
     9ea:	f003 0306 	and.w	r3, r3, #6
     9ee:	2b04      	cmp	r3, #4
     9f0:	bf18      	it	ne
     9f2:	2500      	movne	r5, #0
     9f4:	6832      	ldr	r2, [r6, #0]
     9f6:	f04f 0600 	mov.w	r6, #0
     9fa:	68a3      	ldr	r3, [r4, #8]
     9fc:	bf08      	it	eq
     9fe:	1aad      	subeq	r5, r5, r2
     a00:	6922      	ldr	r2, [r4, #16]
     a02:	bf08      	it	eq
     a04:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
     a08:	4293      	cmp	r3, r2
     a0a:	bfc4      	itt	gt
     a0c:	1a9b      	subgt	r3, r3, r2
     a0e:	18ed      	addgt	r5, r5, r3
     a10:	341a      	adds	r4, #26
     a12:	42b5      	cmp	r5, r6
     a14:	d11a      	bne.n	a4c <_printf_common+0xcc>
     a16:	2000      	movs	r0, #0
     a18:	e008      	b.n	a2c <_printf_common+0xac>
     a1a:	2301      	movs	r3, #1
     a1c:	4652      	mov	r2, sl
     a1e:	4649      	mov	r1, r9
     a20:	4638      	mov	r0, r7
     a22:	47c0      	blx	r8
     a24:	3001      	adds	r0, #1
     a26:	d103      	bne.n	a30 <_printf_common+0xb0>
     a28:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     a2c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     a30:	3501      	adds	r5, #1
     a32:	e7c4      	b.n	9be <_printf_common+0x3e>
     a34:	2030      	movs	r0, #48	; 0x30
     a36:	18e1      	adds	r1, r4, r3
     a38:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
     a3c:	1c5a      	adds	r2, r3, #1
     a3e:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
     a42:	4422      	add	r2, r4
     a44:	3302      	adds	r3, #2
     a46:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
     a4a:	e7c5      	b.n	9d8 <_printf_common+0x58>
     a4c:	2301      	movs	r3, #1
     a4e:	4622      	mov	r2, r4
     a50:	4649      	mov	r1, r9
     a52:	4638      	mov	r0, r7
     a54:	47c0      	blx	r8
     a56:	3001      	adds	r0, #1
     a58:	d0e6      	beq.n	a28 <_printf_common+0xa8>
     a5a:	3601      	adds	r6, #1
     a5c:	e7d9      	b.n	a12 <_printf_common+0x92>
	...

00000a60 <_printf_i>:
     a60:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
     a64:	7e0f      	ldrb	r7, [r1, #24]
     a66:	4691      	mov	r9, r2
     a68:	2f78      	cmp	r7, #120	; 0x78
     a6a:	4680      	mov	r8, r0
     a6c:	460c      	mov	r4, r1
     a6e:	469a      	mov	sl, r3
     a70:	9d0c      	ldr	r5, [sp, #48]	; 0x30
     a72:	f101 0243 	add.w	r2, r1, #67	; 0x43
     a76:	d807      	bhi.n	a88 <_printf_i+0x28>
     a78:	2f62      	cmp	r7, #98	; 0x62
     a7a:	d80a      	bhi.n	a92 <_printf_i+0x32>
     a7c:	2f00      	cmp	r7, #0
     a7e:	f000 80d9 	beq.w	c34 <_printf_i+0x1d4>
     a82:	2f58      	cmp	r7, #88	; 0x58
     a84:	f000 80a4 	beq.w	bd0 <_printf_i+0x170>
     a88:	f104 0542 	add.w	r5, r4, #66	; 0x42
     a8c:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
     a90:	e03a      	b.n	b08 <_printf_i+0xa8>
     a92:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
     a96:	2b15      	cmp	r3, #21
     a98:	d8f6      	bhi.n	a88 <_printf_i+0x28>
     a9a:	a101      	add	r1, pc, #4	; (adr r1, aa0 <_printf_i+0x40>)
     a9c:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
     aa0:	00000af9 	strdeq	r0, [r0], -r9
     aa4:	00000b0d 	andeq	r0, r0, sp, lsl #22
     aa8:	00000a89 	andeq	r0, r0, r9, lsl #21
     aac:	00000a89 	andeq	r0, r0, r9, lsl #21
     ab0:	00000a89 	andeq	r0, r0, r9, lsl #21
     ab4:	00000a89 	andeq	r0, r0, r9, lsl #21
     ab8:	00000b0d 	andeq	r0, r0, sp, lsl #22
     abc:	00000a89 	andeq	r0, r0, r9, lsl #21
     ac0:	00000a89 	andeq	r0, r0, r9, lsl #21
     ac4:	00000a89 	andeq	r0, r0, r9, lsl #21
     ac8:	00000a89 	andeq	r0, r0, r9, lsl #21
     acc:	00000c1b 	andeq	r0, r0, fp, lsl ip
     ad0:	00000b3d 	andeq	r0, r0, sp, lsr fp
     ad4:	00000bfd 	strdeq	r0, [r0], -sp
     ad8:	00000a89 	andeq	r0, r0, r9, lsl #21
     adc:	00000a89 	andeq	r0, r0, r9, lsl #21
     ae0:	00000c3d 	andeq	r0, r0, sp, lsr ip
     ae4:	00000a89 	andeq	r0, r0, r9, lsl #21
     ae8:	00000b3d 	andeq	r0, r0, sp, lsr fp
     aec:	00000a89 	andeq	r0, r0, r9, lsl #21
     af0:	00000a89 	andeq	r0, r0, r9, lsl #21
     af4:	00000c05 	andeq	r0, r0, r5, lsl #24
     af8:	682b      	ldr	r3, [r5, #0]
     afa:	1d1a      	adds	r2, r3, #4
     afc:	681b      	ldr	r3, [r3, #0]
     afe:	602a      	str	r2, [r5, #0]
     b00:	f104 0542 	add.w	r5, r4, #66	; 0x42
     b04:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
     b08:	2301      	movs	r3, #1
     b0a:	e0a4      	b.n	c56 <_printf_i+0x1f6>
     b0c:	6820      	ldr	r0, [r4, #0]
     b0e:	6829      	ldr	r1, [r5, #0]
     b10:	0606      	lsls	r6, r0, #24
     b12:	f101 0304 	add.w	r3, r1, #4
     b16:	d50a      	bpl.n	b2e <_printf_i+0xce>
     b18:	680e      	ldr	r6, [r1, #0]
     b1a:	602b      	str	r3, [r5, #0]
     b1c:	2e00      	cmp	r6, #0
     b1e:	da03      	bge.n	b28 <_printf_i+0xc8>
     b20:	232d      	movs	r3, #45	; 0x2d
     b22:	4276      	negs	r6, r6
     b24:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     b28:	230a      	movs	r3, #10
     b2a:	485e      	ldr	r0, [pc, #376]	; (ca4 <_printf_i+0x244>)
     b2c:	e019      	b.n	b62 <_printf_i+0x102>
     b2e:	680e      	ldr	r6, [r1, #0]
     b30:	f010 0f40 	tst.w	r0, #64	; 0x40
     b34:	602b      	str	r3, [r5, #0]
     b36:	bf18      	it	ne
     b38:	b236      	sxthne	r6, r6
     b3a:	e7ef      	b.n	b1c <_printf_i+0xbc>
     b3c:	682b      	ldr	r3, [r5, #0]
     b3e:	6820      	ldr	r0, [r4, #0]
     b40:	1d19      	adds	r1, r3, #4
     b42:	6029      	str	r1, [r5, #0]
     b44:	0601      	lsls	r1, r0, #24
     b46:	d501      	bpl.n	b4c <_printf_i+0xec>
     b48:	681e      	ldr	r6, [r3, #0]
     b4a:	e002      	b.n	b52 <_printf_i+0xf2>
     b4c:	0646      	lsls	r6, r0, #25
     b4e:	d5fb      	bpl.n	b48 <_printf_i+0xe8>
     b50:	881e      	ldrh	r6, [r3, #0]
     b52:	2f6f      	cmp	r7, #111	; 0x6f
     b54:	bf0c      	ite	eq
     b56:	2308      	moveq	r3, #8
     b58:	230a      	movne	r3, #10
     b5a:	4852      	ldr	r0, [pc, #328]	; (ca4 <_printf_i+0x244>)
     b5c:	2100      	movs	r1, #0
     b5e:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
     b62:	6865      	ldr	r5, [r4, #4]
     b64:	2d00      	cmp	r5, #0
     b66:	bfa8      	it	ge
     b68:	6821      	ldrge	r1, [r4, #0]
     b6a:	60a5      	str	r5, [r4, #8]
     b6c:	bfa4      	itt	ge
     b6e:	f021 0104 	bicge.w	r1, r1, #4
     b72:	6021      	strge	r1, [r4, #0]
     b74:	b90e      	cbnz	r6, b7a <_printf_i+0x11a>
     b76:	2d00      	cmp	r5, #0
     b78:	d04d      	beq.n	c16 <_printf_i+0x1b6>
     b7a:	4615      	mov	r5, r2
     b7c:	fbb6 f1f3 	udiv	r1, r6, r3
     b80:	fb03 6711 	mls	r7, r3, r1, r6
     b84:	5dc7      	ldrb	r7, [r0, r7]
     b86:	f805 7d01 	strb.w	r7, [r5, #-1]!
     b8a:	4637      	mov	r7, r6
     b8c:	42bb      	cmp	r3, r7
     b8e:	460e      	mov	r6, r1
     b90:	d9f4      	bls.n	b7c <_printf_i+0x11c>
     b92:	2b08      	cmp	r3, #8
     b94:	d10b      	bne.n	bae <_printf_i+0x14e>
     b96:	6823      	ldr	r3, [r4, #0]
     b98:	07de      	lsls	r6, r3, #31
     b9a:	d508      	bpl.n	bae <_printf_i+0x14e>
     b9c:	6923      	ldr	r3, [r4, #16]
     b9e:	6861      	ldr	r1, [r4, #4]
     ba0:	4299      	cmp	r1, r3
     ba2:	bfde      	ittt	le
     ba4:	2330      	movle	r3, #48	; 0x30
     ba6:	f805 3c01 	strble.w	r3, [r5, #-1]
     baa:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
     bae:	1b52      	subs	r2, r2, r5
     bb0:	6122      	str	r2, [r4, #16]
     bb2:	464b      	mov	r3, r9
     bb4:	4621      	mov	r1, r4
     bb6:	4640      	mov	r0, r8
     bb8:	f8cd a000 	str.w	sl, [sp]
     bbc:	aa03      	add	r2, sp, #12
     bbe:	f7ff fedf 	bl	980 <_printf_common>
     bc2:	3001      	adds	r0, #1
     bc4:	d14c      	bne.n	c60 <_printf_i+0x200>
     bc6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
     bca:	b004      	add	sp, #16
     bcc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     bd0:	4834      	ldr	r0, [pc, #208]	; (ca4 <_printf_i+0x244>)
     bd2:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
     bd6:	6829      	ldr	r1, [r5, #0]
     bd8:	6823      	ldr	r3, [r4, #0]
     bda:	f851 6b04 	ldr.w	r6, [r1], #4
     bde:	6029      	str	r1, [r5, #0]
     be0:	061d      	lsls	r5, r3, #24
     be2:	d514      	bpl.n	c0e <_printf_i+0x1ae>
     be4:	07df      	lsls	r7, r3, #31
     be6:	bf44      	itt	mi
     be8:	f043 0320 	orrmi.w	r3, r3, #32
     bec:	6023      	strmi	r3, [r4, #0]
     bee:	b91e      	cbnz	r6, bf8 <_printf_i+0x198>
     bf0:	6823      	ldr	r3, [r4, #0]
     bf2:	f023 0320 	bic.w	r3, r3, #32
     bf6:	6023      	str	r3, [r4, #0]
     bf8:	2310      	movs	r3, #16
     bfa:	e7af      	b.n	b5c <_printf_i+0xfc>
     bfc:	6823      	ldr	r3, [r4, #0]
     bfe:	f043 0320 	orr.w	r3, r3, #32
     c02:	6023      	str	r3, [r4, #0]
     c04:	2378      	movs	r3, #120	; 0x78
     c06:	4828      	ldr	r0, [pc, #160]	; (ca8 <_printf_i+0x248>)
     c08:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     c0c:	e7e3      	b.n	bd6 <_printf_i+0x176>
     c0e:	0659      	lsls	r1, r3, #25
     c10:	bf48      	it	mi
     c12:	b2b6      	uxthmi	r6, r6
     c14:	e7e6      	b.n	be4 <_printf_i+0x184>
     c16:	4615      	mov	r5, r2
     c18:	e7bb      	b.n	b92 <_printf_i+0x132>
     c1a:	682b      	ldr	r3, [r5, #0]
     c1c:	6826      	ldr	r6, [r4, #0]
     c1e:	1d18      	adds	r0, r3, #4
     c20:	6961      	ldr	r1, [r4, #20]
     c22:	6028      	str	r0, [r5, #0]
     c24:	0635      	lsls	r5, r6, #24
     c26:	681b      	ldr	r3, [r3, #0]
     c28:	d501      	bpl.n	c2e <_printf_i+0x1ce>
     c2a:	6019      	str	r1, [r3, #0]
     c2c:	e002      	b.n	c34 <_printf_i+0x1d4>
     c2e:	0670      	lsls	r0, r6, #25
     c30:	d5fb      	bpl.n	c2a <_printf_i+0x1ca>
     c32:	8019      	strh	r1, [r3, #0]
     c34:	2300      	movs	r3, #0
     c36:	4615      	mov	r5, r2
     c38:	6123      	str	r3, [r4, #16]
     c3a:	e7ba      	b.n	bb2 <_printf_i+0x152>
     c3c:	682b      	ldr	r3, [r5, #0]
     c3e:	2100      	movs	r1, #0
     c40:	1d1a      	adds	r2, r3, #4
     c42:	602a      	str	r2, [r5, #0]
     c44:	681d      	ldr	r5, [r3, #0]
     c46:	6862      	ldr	r2, [r4, #4]
     c48:	4628      	mov	r0, r5
     c4a:	f000 f82f 	bl	cac <memchr>
     c4e:	b108      	cbz	r0, c54 <_printf_i+0x1f4>
     c50:	1b40      	subs	r0, r0, r5
     c52:	6060      	str	r0, [r4, #4]
     c54:	6863      	ldr	r3, [r4, #4]
     c56:	6123      	str	r3, [r4, #16]
     c58:	2300      	movs	r3, #0
     c5a:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
     c5e:	e7a8      	b.n	bb2 <_printf_i+0x152>
     c60:	462a      	mov	r2, r5
     c62:	4649      	mov	r1, r9
     c64:	4640      	mov	r0, r8
     c66:	6923      	ldr	r3, [r4, #16]
     c68:	47d0      	blx	sl
     c6a:	3001      	adds	r0, #1
     c6c:	d0ab      	beq.n	bc6 <_printf_i+0x166>
     c6e:	6823      	ldr	r3, [r4, #0]
     c70:	079b      	lsls	r3, r3, #30
     c72:	d413      	bmi.n	c9c <_printf_i+0x23c>
     c74:	68e0      	ldr	r0, [r4, #12]
     c76:	9b03      	ldr	r3, [sp, #12]
     c78:	4298      	cmp	r0, r3
     c7a:	bfb8      	it	lt
     c7c:	4618      	movlt	r0, r3
     c7e:	e7a4      	b.n	bca <_printf_i+0x16a>
     c80:	2301      	movs	r3, #1
     c82:	4632      	mov	r2, r6
     c84:	4649      	mov	r1, r9
     c86:	4640      	mov	r0, r8
     c88:	47d0      	blx	sl
     c8a:	3001      	adds	r0, #1
     c8c:	d09b      	beq.n	bc6 <_printf_i+0x166>
     c8e:	3501      	adds	r5, #1
     c90:	68e3      	ldr	r3, [r4, #12]
     c92:	9903      	ldr	r1, [sp, #12]
     c94:	1a5b      	subs	r3, r3, r1
     c96:	42ab      	cmp	r3, r5
     c98:	dcf2      	bgt.n	c80 <_printf_i+0x220>
     c9a:	e7eb      	b.n	c74 <_printf_i+0x214>
     c9c:	2500      	movs	r5, #0
     c9e:	f104 0619 	add.w	r6, r4, #25
     ca2:	e7f5      	b.n	c90 <_printf_i+0x230>
     ca4:	00000ff5 	strdeq	r0, [r0], -r5
     ca8:	00001006 	andeq	r1, r0, r6

00000cac <memchr>:
     cac:	4603      	mov	r3, r0
     cae:	b510      	push	{r4, lr}
     cb0:	b2c9      	uxtb	r1, r1
     cb2:	4402      	add	r2, r0
     cb4:	4293      	cmp	r3, r2
     cb6:	4618      	mov	r0, r3
     cb8:	d101      	bne.n	cbe <memchr+0x12>
     cba:	2000      	movs	r0, #0
     cbc:	e003      	b.n	cc6 <memchr+0x1a>
     cbe:	7804      	ldrb	r4, [r0, #0]
     cc0:	3301      	adds	r3, #1
     cc2:	428c      	cmp	r4, r1
     cc4:	d1f6      	bne.n	cb4 <memchr+0x8>
     cc6:	bd10      	pop	{r4, pc}

00000cc8 <memcpy>:
     cc8:	440a      	add	r2, r1
     cca:	4291      	cmp	r1, r2
     ccc:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
     cd0:	d100      	bne.n	cd4 <memcpy+0xc>
     cd2:	4770      	bx	lr
     cd4:	b510      	push	{r4, lr}
     cd6:	f811 4b01 	ldrb.w	r4, [r1], #1
     cda:	4291      	cmp	r1, r2
     cdc:	f803 4f01 	strb.w	r4, [r3, #1]!
     ce0:	d1f9      	bne.n	cd6 <memcpy+0xe>
     ce2:	bd10      	pop	{r4, pc}

00000ce4 <memmove>:
     ce4:	4288      	cmp	r0, r1
     ce6:	b510      	push	{r4, lr}
     ce8:	eb01 0402 	add.w	r4, r1, r2
     cec:	d902      	bls.n	cf4 <memmove+0x10>
     cee:	4284      	cmp	r4, r0
     cf0:	4623      	mov	r3, r4
     cf2:	d807      	bhi.n	d04 <memmove+0x20>
     cf4:	1e43      	subs	r3, r0, #1
     cf6:	42a1      	cmp	r1, r4
     cf8:	d008      	beq.n	d0c <memmove+0x28>
     cfa:	f811 2b01 	ldrb.w	r2, [r1], #1
     cfe:	f803 2f01 	strb.w	r2, [r3, #1]!
     d02:	e7f8      	b.n	cf6 <memmove+0x12>
     d04:	4601      	mov	r1, r0
     d06:	4402      	add	r2, r0
     d08:	428a      	cmp	r2, r1
     d0a:	d100      	bne.n	d0e <memmove+0x2a>
     d0c:	bd10      	pop	{r4, pc}
     d0e:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
     d12:	f802 4d01 	strb.w	r4, [r2, #-1]!
     d16:	e7f7      	b.n	d08 <memmove+0x24>

00000d18 <_free_r>:
     d18:	b538      	push	{r3, r4, r5, lr}
     d1a:	4605      	mov	r5, r0
     d1c:	2900      	cmp	r1, #0
     d1e:	d040      	beq.n	da2 <_free_r+0x8a>
     d20:	f851 3c04 	ldr.w	r3, [r1, #-4]
     d24:	1f0c      	subs	r4, r1, #4
     d26:	2b00      	cmp	r3, #0
     d28:	bfb8      	it	lt
     d2a:	18e4      	addlt	r4, r4, r3
     d2c:	f000 f910 	bl	f50 <__malloc_lock>
     d30:	4a1c      	ldr	r2, [pc, #112]	; (da4 <_free_r+0x8c>)
     d32:	6813      	ldr	r3, [r2, #0]
     d34:	b933      	cbnz	r3, d44 <_free_r+0x2c>
     d36:	6063      	str	r3, [r4, #4]
     d38:	6014      	str	r4, [r2, #0]
     d3a:	4628      	mov	r0, r5
     d3c:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     d40:	f000 b90c 	b.w	f5c <__malloc_unlock>
     d44:	42a3      	cmp	r3, r4
     d46:	d908      	bls.n	d5a <_free_r+0x42>
     d48:	6820      	ldr	r0, [r4, #0]
     d4a:	1821      	adds	r1, r4, r0
     d4c:	428b      	cmp	r3, r1
     d4e:	bf01      	itttt	eq
     d50:	6819      	ldreq	r1, [r3, #0]
     d52:	685b      	ldreq	r3, [r3, #4]
     d54:	1809      	addeq	r1, r1, r0
     d56:	6021      	streq	r1, [r4, #0]
     d58:	e7ed      	b.n	d36 <_free_r+0x1e>
     d5a:	461a      	mov	r2, r3
     d5c:	685b      	ldr	r3, [r3, #4]
     d5e:	b10b      	cbz	r3, d64 <_free_r+0x4c>
     d60:	42a3      	cmp	r3, r4
     d62:	d9fa      	bls.n	d5a <_free_r+0x42>
     d64:	6811      	ldr	r1, [r2, #0]
     d66:	1850      	adds	r0, r2, r1
     d68:	42a0      	cmp	r0, r4
     d6a:	d10b      	bne.n	d84 <_free_r+0x6c>
     d6c:	6820      	ldr	r0, [r4, #0]
     d6e:	4401      	add	r1, r0
     d70:	1850      	adds	r0, r2, r1
     d72:	4283      	cmp	r3, r0
     d74:	6011      	str	r1, [r2, #0]
     d76:	d1e0      	bne.n	d3a <_free_r+0x22>
     d78:	6818      	ldr	r0, [r3, #0]
     d7a:	685b      	ldr	r3, [r3, #4]
     d7c:	4401      	add	r1, r0
     d7e:	6011      	str	r1, [r2, #0]
     d80:	6053      	str	r3, [r2, #4]
     d82:	e7da      	b.n	d3a <_free_r+0x22>
     d84:	d902      	bls.n	d8c <_free_r+0x74>
     d86:	230c      	movs	r3, #12
     d88:	602b      	str	r3, [r5, #0]
     d8a:	e7d6      	b.n	d3a <_free_r+0x22>
     d8c:	6820      	ldr	r0, [r4, #0]
     d8e:	1821      	adds	r1, r4, r0
     d90:	428b      	cmp	r3, r1
     d92:	bf01      	itttt	eq
     d94:	6819      	ldreq	r1, [r3, #0]
     d96:	685b      	ldreq	r3, [r3, #4]
     d98:	1809      	addeq	r1, r1, r0
     d9a:	6021      	streq	r1, [r4, #0]
     d9c:	6063      	str	r3, [r4, #4]
     d9e:	6054      	str	r4, [r2, #4]
     da0:	e7cb      	b.n	d3a <_free_r+0x22>
     da2:	bd38      	pop	{r3, r4, r5, pc}
     da4:	000100a4 	andeq	r0, r1, r4, lsr #1

00000da8 <sbrk_aligned>:
     da8:	b570      	push	{r4, r5, r6, lr}
     daa:	4e0e      	ldr	r6, [pc, #56]	; (de4 <sbrk_aligned+0x3c>)
     dac:	460c      	mov	r4, r1
     dae:	6831      	ldr	r1, [r6, #0]
     db0:	4605      	mov	r5, r0
     db2:	b911      	cbnz	r1, dba <sbrk_aligned+0x12>
     db4:	f000 f8bc 	bl	f30 <_sbrk_r>
     db8:	6030      	str	r0, [r6, #0]
     dba:	4621      	mov	r1, r4
     dbc:	4628      	mov	r0, r5
     dbe:	f000 f8b7 	bl	f30 <_sbrk_r>
     dc2:	1c43      	adds	r3, r0, #1
     dc4:	d00a      	beq.n	ddc <sbrk_aligned+0x34>
     dc6:	1cc4      	adds	r4, r0, #3
     dc8:	f024 0403 	bic.w	r4, r4, #3
     dcc:	42a0      	cmp	r0, r4
     dce:	d007      	beq.n	de0 <sbrk_aligned+0x38>
     dd0:	1a21      	subs	r1, r4, r0
     dd2:	4628      	mov	r0, r5
     dd4:	f000 f8ac 	bl	f30 <_sbrk_r>
     dd8:	3001      	adds	r0, #1
     dda:	d101      	bne.n	de0 <sbrk_aligned+0x38>
     ddc:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
     de0:	4620      	mov	r0, r4
     de2:	bd70      	pop	{r4, r5, r6, pc}
     de4:	000100a8 	andeq	r0, r1, r8, lsr #1

00000de8 <_malloc_r>:
     de8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     dec:	1ccd      	adds	r5, r1, #3
     dee:	f025 0503 	bic.w	r5, r5, #3
     df2:	3508      	adds	r5, #8
     df4:	2d0c      	cmp	r5, #12
     df6:	bf38      	it	cc
     df8:	250c      	movcc	r5, #12
     dfa:	2d00      	cmp	r5, #0
     dfc:	4607      	mov	r7, r0
     dfe:	db01      	blt.n	e04 <_malloc_r+0x1c>
     e00:	42a9      	cmp	r1, r5
     e02:	d905      	bls.n	e10 <_malloc_r+0x28>
     e04:	230c      	movs	r3, #12
     e06:	2600      	movs	r6, #0
     e08:	603b      	str	r3, [r7, #0]
     e0a:	4630      	mov	r0, r6
     e0c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     e10:	4e2e      	ldr	r6, [pc, #184]	; (ecc <_malloc_r+0xe4>)
     e12:	f000 f89d 	bl	f50 <__malloc_lock>
     e16:	6833      	ldr	r3, [r6, #0]
     e18:	461c      	mov	r4, r3
     e1a:	bb34      	cbnz	r4, e6a <_malloc_r+0x82>
     e1c:	4629      	mov	r1, r5
     e1e:	4638      	mov	r0, r7
     e20:	f7ff ffc2 	bl	da8 <sbrk_aligned>
     e24:	1c43      	adds	r3, r0, #1
     e26:	4604      	mov	r4, r0
     e28:	d14d      	bne.n	ec6 <_malloc_r+0xde>
     e2a:	6834      	ldr	r4, [r6, #0]
     e2c:	4626      	mov	r6, r4
     e2e:	2e00      	cmp	r6, #0
     e30:	d140      	bne.n	eb4 <_malloc_r+0xcc>
     e32:	6823      	ldr	r3, [r4, #0]
     e34:	4631      	mov	r1, r6
     e36:	4638      	mov	r0, r7
     e38:	eb04 0803 	add.w	r8, r4, r3
     e3c:	f000 f878 	bl	f30 <_sbrk_r>
     e40:	4580      	cmp	r8, r0
     e42:	d13a      	bne.n	eba <_malloc_r+0xd2>
     e44:	6821      	ldr	r1, [r4, #0]
     e46:	3503      	adds	r5, #3
     e48:	1a6d      	subs	r5, r5, r1
     e4a:	f025 0503 	bic.w	r5, r5, #3
     e4e:	3508      	adds	r5, #8
     e50:	2d0c      	cmp	r5, #12
     e52:	bf38      	it	cc
     e54:	250c      	movcc	r5, #12
     e56:	4638      	mov	r0, r7
     e58:	4629      	mov	r1, r5
     e5a:	f7ff ffa5 	bl	da8 <sbrk_aligned>
     e5e:	3001      	adds	r0, #1
     e60:	d02b      	beq.n	eba <_malloc_r+0xd2>
     e62:	6823      	ldr	r3, [r4, #0]
     e64:	442b      	add	r3, r5
     e66:	6023      	str	r3, [r4, #0]
     e68:	e00e      	b.n	e88 <_malloc_r+0xa0>
     e6a:	6822      	ldr	r2, [r4, #0]
     e6c:	1b52      	subs	r2, r2, r5
     e6e:	d41e      	bmi.n	eae <_malloc_r+0xc6>
     e70:	2a0b      	cmp	r2, #11
     e72:	d916      	bls.n	ea2 <_malloc_r+0xba>
     e74:	1961      	adds	r1, r4, r5
     e76:	42a3      	cmp	r3, r4
     e78:	6025      	str	r5, [r4, #0]
     e7a:	bf18      	it	ne
     e7c:	6059      	strne	r1, [r3, #4]
     e7e:	6863      	ldr	r3, [r4, #4]
     e80:	bf08      	it	eq
     e82:	6031      	streq	r1, [r6, #0]
     e84:	5162      	str	r2, [r4, r5]
     e86:	604b      	str	r3, [r1, #4]
     e88:	4638      	mov	r0, r7
     e8a:	f104 060b 	add.w	r6, r4, #11
     e8e:	f000 f865 	bl	f5c <__malloc_unlock>
     e92:	f026 0607 	bic.w	r6, r6, #7
     e96:	1d23      	adds	r3, r4, #4
     e98:	1af2      	subs	r2, r6, r3
     e9a:	d0b6      	beq.n	e0a <_malloc_r+0x22>
     e9c:	1b9b      	subs	r3, r3, r6
     e9e:	50a3      	str	r3, [r4, r2]
     ea0:	e7b3      	b.n	e0a <_malloc_r+0x22>
     ea2:	6862      	ldr	r2, [r4, #4]
     ea4:	42a3      	cmp	r3, r4
     ea6:	bf0c      	ite	eq
     ea8:	6032      	streq	r2, [r6, #0]
     eaa:	605a      	strne	r2, [r3, #4]
     eac:	e7ec      	b.n	e88 <_malloc_r+0xa0>
     eae:	4623      	mov	r3, r4
     eb0:	6864      	ldr	r4, [r4, #4]
     eb2:	e7b2      	b.n	e1a <_malloc_r+0x32>
     eb4:	4634      	mov	r4, r6
     eb6:	6876      	ldr	r6, [r6, #4]
     eb8:	e7b9      	b.n	e2e <_malloc_r+0x46>
     eba:	230c      	movs	r3, #12
     ebc:	4638      	mov	r0, r7
     ebe:	603b      	str	r3, [r7, #0]
     ec0:	f000 f84c 	bl	f5c <__malloc_unlock>
     ec4:	e7a1      	b.n	e0a <_malloc_r+0x22>
     ec6:	6025      	str	r5, [r4, #0]
     ec8:	e7de      	b.n	e88 <_malloc_r+0xa0>
     eca:	bf00      	nop
     ecc:	000100a4 	andeq	r0, r1, r4, lsr #1

00000ed0 <_realloc_r>:
     ed0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     ed4:	4680      	mov	r8, r0
     ed6:	4614      	mov	r4, r2
     ed8:	460e      	mov	r6, r1
     eda:	b921      	cbnz	r1, ee6 <_realloc_r+0x16>
     edc:	4611      	mov	r1, r2
     ede:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
     ee2:	f7ff bf81 	b.w	de8 <_malloc_r>
     ee6:	b92a      	cbnz	r2, ef4 <_realloc_r+0x24>
     ee8:	f7ff ff16 	bl	d18 <_free_r>
     eec:	4625      	mov	r5, r4
     eee:	4628      	mov	r0, r5
     ef0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     ef4:	f000 f838 	bl	f68 <_malloc_usable_size_r>
     ef8:	4284      	cmp	r4, r0
     efa:	4607      	mov	r7, r0
     efc:	d802      	bhi.n	f04 <_realloc_r+0x34>
     efe:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
     f02:	d812      	bhi.n	f2a <_realloc_r+0x5a>
     f04:	4621      	mov	r1, r4
     f06:	4640      	mov	r0, r8
     f08:	f7ff ff6e 	bl	de8 <_malloc_r>
     f0c:	4605      	mov	r5, r0
     f0e:	2800      	cmp	r0, #0
     f10:	d0ed      	beq.n	eee <_realloc_r+0x1e>
     f12:	42bc      	cmp	r4, r7
     f14:	4622      	mov	r2, r4
     f16:	4631      	mov	r1, r6
     f18:	bf28      	it	cs
     f1a:	463a      	movcs	r2, r7
     f1c:	f7ff fed4 	bl	cc8 <memcpy>
     f20:	4631      	mov	r1, r6
     f22:	4640      	mov	r0, r8
     f24:	f7ff fef8 	bl	d18 <_free_r>
     f28:	e7e1      	b.n	eee <_realloc_r+0x1e>
     f2a:	4635      	mov	r5, r6
     f2c:	e7df      	b.n	eee <_realloc_r+0x1e>
	...

00000f30 <_sbrk_r>:
     f30:	b538      	push	{r3, r4, r5, lr}
     f32:	2300      	movs	r3, #0
     f34:	4d05      	ldr	r5, [pc, #20]	; (f4c <_sbrk_r+0x1c>)
     f36:	4604      	mov	r4, r0
     f38:	4608      	mov	r0, r1
     f3a:	602b      	str	r3, [r5, #0]
     f3c:	f000 f81e 	bl	f7c <_sbrk>
     f40:	1c43      	adds	r3, r0, #1
     f42:	d102      	bne.n	f4a <_sbrk_r+0x1a>
     f44:	682b      	ldr	r3, [r5, #0]
     f46:	b103      	cbz	r3, f4a <_sbrk_r+0x1a>
     f48:	6023      	str	r3, [r4, #0]
     f4a:	bd38      	pop	{r3, r4, r5, pc}
     f4c:	000100ac 	andeq	r0, r1, ip, lsr #1

00000f50 <__malloc_lock>:
     f50:	4801      	ldr	r0, [pc, #4]	; (f58 <__malloc_lock+0x8>)
     f52:	f000 b811 	b.w	f78 <__retarget_lock_acquire_recursive>
     f56:	bf00      	nop
     f58:	000100b0 	strheq	r0, [r1], -r0	; <UNPREDICTABLE>

00000f5c <__malloc_unlock>:
     f5c:	4801      	ldr	r0, [pc, #4]	; (f64 <__malloc_unlock+0x8>)
     f5e:	f000 b80c 	b.w	f7a <__retarget_lock_release_recursive>
     f62:	bf00      	nop
     f64:	000100b0 	strheq	r0, [r1], -r0	; <UNPREDICTABLE>

00000f68 <_malloc_usable_size_r>:
     f68:	f851 3c04 	ldr.w	r3, [r1, #-4]
     f6c:	1f18      	subs	r0, r3, #4
     f6e:	2b00      	cmp	r3, #0
     f70:	bfbc      	itt	lt
     f72:	580b      	ldrlt	r3, [r1, r0]
     f74:	18c0      	addlt	r0, r0, r3
     f76:	4770      	bx	lr

00000f78 <__retarget_lock_acquire_recursive>:
     f78:	4770      	bx	lr

00000f7a <__retarget_lock_release_recursive>:
     f7a:	4770      	bx	lr

00000f7c <_sbrk>:
     f7c:	4a04      	ldr	r2, [pc, #16]	; (f90 <_sbrk+0x14>)
     f7e:	4905      	ldr	r1, [pc, #20]	; (f94 <_sbrk+0x18>)
     f80:	6813      	ldr	r3, [r2, #0]
     f82:	2b00      	cmp	r3, #0
     f84:	bf08      	it	eq
     f86:	460b      	moveq	r3, r1
     f88:	4418      	add	r0, r3
     f8a:	6010      	str	r0, [r2, #0]
     f8c:	4618      	mov	r0, r3
     f8e:	4770      	bx	lr
     f90:	000100b4 	strheq	r0, [r1], -r4
     f94:	000100b8 	strheq	r0, [r1], -r8

00000f98 <_exit>:
     f98:	e7fe      	b.n	f98 <_exit>
     f9a:	bf00      	nop

00000f9c <_init>:
     f9c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     f9e:	bf00      	nop
     fa0:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fa2:	bc08      	pop	{r3}
     fa4:	469e      	mov	lr, r3
     fa6:	4770      	bx	lr

00000fa8 <_fini>:
     fa8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     faa:	bf00      	nop
     fac:	bcf8      	pop	{r3, r4, r5, r6, r7}
     fae:	bc08      	pop	{r3}
     fb0:	469e      	mov	lr, r3
     fb2:	4770      	bx	lr
     fb4:	69676e45 	stmdbvs	r7!, {r0, r2, r6, r9, sl, fp, sp, lr}^
     fb8:	6920656e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, sl, sp, lr}
     fbc:	706f2073 	rsbvc	r2, pc, r3, ror r0	; <UNPREDICTABLE>
     fc0:	74617265 	strbtvc	r7, [r1], #-613	; 0xfffffd9b
     fc4:	2c657669 	stclcs	6, cr7, [r5], #-420	; 0xfffffe5c
     fc8:	6c656820 	stclvs	8, cr6, [r5], #-128	; 0xffffff80
     fcc:	61206f6c 			; <UNDEFINED> instruction: 0x61206f6c
     fd0:	6720646e 	strvs	r6, [r0, -lr, ror #8]!
     fd4:	62646f6f 	rsbvs	r6, r4, #444	; 0x1bc
     fd8:	0d2e6579 	cfstr32eq	mvfx6, [lr, #-484]!	; 0xfffffe1c
     fdc:	0000000a 	andeq	r0, r0, sl

00000fe0 <_global_impure_ptr>:
     fe0:	00010004 	andeq	r0, r1, r4
     fe4:	2b302d23 	blcs	c0c478 <__StackTop+0xbfa478>
     fe8:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
     fec:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
     ff0:	47464567 	strbmi	r4, [r6, -r7, ror #10]
     ff4:	32313000 	eorscc	r3, r1, #0
     ff8:	36353433 			; <UNDEFINED> instruction: 0x36353433
     ffc:	41393837 	teqmi	r9, r7, lsr r8
    1000:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    1004:	31300046 	teqcc	r0, r6, asr #32
    1008:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    100c:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1010:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    1014:	00006665 	andeq	r6, r0, r5, ror #12

00001018 <__EH_FRAME_BEGIN__>:
    1018:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <_impure_ptr>:
   10000:	00010004 	andeq	r0, r1, r4

00010004 <impure_data>:
	...

00010064 <__frame_dummy_init_array_entry>:
   10064:	0000007d 	andeq	r0, r0, sp, ror r0

00010068 <__do_global_dtors_aux_fini_array_entry>:
   10068:	00000059 	andeq	r0, r0, r9, asr r0

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
  18:	00000650 	andeq	r0, r0, r0, asr r6
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000688 	andeq	r0, r0, r8, lsl #13
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	000006b4 			; <UNDEFINED> instruction: 0x000006b4
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	000006c8 	andeq	r0, r0, r8, asr #13
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
  cc:	00000780 	andeq	r0, r0, r0, lsl #15
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
 10c:	00000980 	andeq	r0, r0, r0, lsl #19
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xd0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00000a60 	andeq	r0, r0, r0, ror #20
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
 16c:	00000cac 	andeq	r0, r0, ip, lsr #25
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00000cc8 	andeq	r0, r0, r8, asr #25
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00000ce4 	andeq	r0, r0, r4, ror #25
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00000d18 	andeq	r0, r0, r8, lsl sp
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
 21c:	00000da8 	andeq	r0, r0, r8, lsr #27
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00000de8 	andeq	r0, r0, r8, ror #27
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
 268:	00000ed0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
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
 2a4:	00000f30 	andeq	r0, r0, r0, lsr pc
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
 2d0:	00000f50 	andeq	r0, r0, r0, asr pc
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00000f5c 	andeq	r0, r0, ip, asr pc
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00000f68 	andeq	r0, r0, r8, ror #30
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
 3cc:	00000f78 	andeq	r0, r0, r8, ror pc
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
 40c:	00000f7a 	andeq	r0, r0, sl, ror pc
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00000f7c 	andeq	r0, r0, ip, ror pc
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00000f98 	muleq	r0, r8, pc	; <UNPREDICTABLE>
 450:	00000002 	andeq	r0, r0, r2


fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00000e19 	andeq	r0, r0, r9, lsl lr
       8:	00000d51 	andeq	r0, r0, r1, asr sp
       c:	00000d53 	andeq	r0, r0, r3, asr sp
      10:	00000d55 	andeq	r0, r0, r5, asr sp
      14:	00000d57 	andeq	r0, r0, r7, asr sp
      18:	00000d59 	andeq	r0, r0, r9, asr sp
	...
      2c:	00000d5b 	andeq	r0, r0, fp, asr sp
      30:	00000d5d 	andeq	r0, r0, sp, asr sp
      34:	00000000 	andeq	r0, r0, r0
      38:	00000d5f 	andeq	r0, r0, pc, asr sp
      3c:	00000d61 	andeq	r0, r0, r1, ror #26
      40:	00000d65 	andeq	r0, r0, r5, ror #26
      44:	00000e6d 	andeq	r0, r0, sp, ror #28
      48:	00000e6f 	andeq	r0, r0, pc, ror #28
      4c:	00000e71 	andeq	r0, r0, r1, ror lr
      50:	00000dd5 	ldrdeq	r0, [r0], -r5
      54:	00000e75 	andeq	r0, r0, r5, ror lr
      58:	00000e77 	andeq	r0, r0, r7, ror lr
      5c:	00000e79 	andeq	r0, r0, r9, ror lr
      60:	00000e7b 	andeq	r0, r0, fp, ror lr
      64:	00000e7d 	andeq	r0, r0, sp, ror lr
      68:	00000e7f 	andeq	r0, r0, pc, ror lr
      6c:	00000e81 	andeq	r0, r0, r1, lsl #29
      70:	00000d81 	andeq	r0, r0, r1, lsl #27
      74:	00000d9d 	muleq	r0, sp, sp
      78:	00000db9 			; <UNDEFINED> instruction: 0x00000db9
      7c:	00000e89 	andeq	r0, r0, r9, lsl #29
      80:	00000e8b 	andeq	r0, r0, fp, lsl #29
      84:	00000e8d 	andeq	r0, r0, sp, lsl #29

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
      a0:	00020068 	andeq	r0, r2, r8, rrx
      a4:	00000000 	andeq	r0, r0, r0
      a8:	00001058 	andeq	r1, r0, r8, asr r0

000000ac <frame_dummy>:
      ac:	b508      	push	{r3, lr}
      ae:	4b03      	ldr	r3, [pc, #12]	; (bc <frame_dummy+0x10>)
      b0:	b11b      	cbz	r3, ba <frame_dummy+0xe>
      b2:	4903      	ldr	r1, [pc, #12]	; (c0 <frame_dummy+0x14>)
      b4:	4803      	ldr	r0, [pc, #12]	; (c4 <frame_dummy+0x18>)
      b6:	f3af 8000 	nop.w
      ba:	bd08      	pop	{r3, pc}
      bc:	00000000 	andeq	r0, r0, r0
      c0:	0002006c 	andeq	r0, r2, ip, rrx
      c4:	00001058 	andeq	r1, r0, r8, asr r0

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

000000ea <eth_sma_int_rx_turn_nack_callback>:
      ea:	4770      	bx	lr

000000ec <eth_sma_int_master_frame_done_callback>:
      ec:	4770      	bx	lr

000000ee <eth_sma_int_tx_fifo_empty_callback>:
      ee:	4770      	bx	lr

000000f0 <eth_sma_int_tx_fifo_thres_callback>:
      f0:	4770      	bx	lr

000000f2 <eth_sma_int_rx_fifo_noempty_callback>:
      f2:	4770      	bx	lr

000000f4 <eth_sma_int_rx_fifo_thres_callback>:
      f4:	4770      	bx	lr

000000f6 <drv_eth_sma_interrupt_handler>:
      f6:	b538      	push	{r3, r4, r5, lr}
      f8:	4604      	mov	r4, r0
      fa:	6803      	ldr	r3, [r0, #0]
      fc:	699d      	ldr	r5, [r3, #24]
      fe:	68db      	ldr	r3, [r3, #12]
     100:	b2db      	uxtb	r3, r3
     102:	401d      	ands	r5, r3
     104:	f015 0f20 	tst.w	r5, #32
     108:	d10f      	bne.n	12a <drv_eth_sma_interrupt_handler+0x34>
     10a:	f015 0f10 	tst.w	r5, #16
     10e:	d119      	bne.n	144 <drv_eth_sma_interrupt_handler+0x4e>
     110:	f015 0f01 	tst.w	r5, #1
     114:	d122      	bne.n	15c <drv_eth_sma_interrupt_handler+0x66>
     116:	f015 0f02 	tst.w	r5, #2
     11a:	d12b      	bne.n	174 <drv_eth_sma_interrupt_handler+0x7e>
     11c:	f015 0f04 	tst.w	r5, #4
     120:	d134      	bne.n	18c <drv_eth_sma_interrupt_handler+0x96>
     122:	f015 0f08 	tst.w	r5, #8
     126:	d13d      	bne.n	1a4 <drv_eth_sma_interrupt_handler+0xae>
     128:	bd38      	pop	{r3, r4, r5, pc}
     12a:	2302      	movs	r3, #2
     12c:	71c3      	strb	r3, [r0, #7]
     12e:	f7ff ffdc 	bl	ea <eth_sma_int_rx_turn_nack_callback>
     132:	6822      	ldr	r2, [r4, #0]
     134:	6913      	ldr	r3, [r2, #16]
     136:	f043 0320 	orr.w	r3, r3, #32
     13a:	6113      	str	r3, [r2, #16]
     13c:	6823      	ldr	r3, [r4, #0]
     13e:	2200      	movs	r2, #0
     140:	611a      	str	r2, [r3, #16]
     142:	e7e2      	b.n	10a <drv_eth_sma_interrupt_handler+0x14>
     144:	4620      	mov	r0, r4
     146:	f7ff ffd1 	bl	ec <eth_sma_int_master_frame_done_callback>
     14a:	6822      	ldr	r2, [r4, #0]
     14c:	6913      	ldr	r3, [r2, #16]
     14e:	f043 0310 	orr.w	r3, r3, #16
     152:	6113      	str	r3, [r2, #16]
     154:	6823      	ldr	r3, [r4, #0]
     156:	2200      	movs	r2, #0
     158:	611a      	str	r2, [r3, #16]
     15a:	e7d9      	b.n	110 <drv_eth_sma_interrupt_handler+0x1a>
     15c:	4620      	mov	r0, r4
     15e:	f7ff ffc7 	bl	f0 <eth_sma_int_tx_fifo_thres_callback>
     162:	6822      	ldr	r2, [r4, #0]
     164:	6913      	ldr	r3, [r2, #16]
     166:	f043 0301 	orr.w	r3, r3, #1
     16a:	6113      	str	r3, [r2, #16]
     16c:	6823      	ldr	r3, [r4, #0]
     16e:	2200      	movs	r2, #0
     170:	611a      	str	r2, [r3, #16]
     172:	e7d0      	b.n	116 <drv_eth_sma_interrupt_handler+0x20>
     174:	4620      	mov	r0, r4
     176:	f7ff ffba 	bl	ee <eth_sma_int_tx_fifo_empty_callback>
     17a:	6822      	ldr	r2, [r4, #0]
     17c:	6913      	ldr	r3, [r2, #16]
     17e:	f043 0302 	orr.w	r3, r3, #2
     182:	6113      	str	r3, [r2, #16]
     184:	6823      	ldr	r3, [r4, #0]
     186:	2200      	movs	r2, #0
     188:	611a      	str	r2, [r3, #16]
     18a:	e7c7      	b.n	11c <drv_eth_sma_interrupt_handler+0x26>
     18c:	4620      	mov	r0, r4
     18e:	f7ff ffb1 	bl	f4 <eth_sma_int_rx_fifo_thres_callback>
     192:	6822      	ldr	r2, [r4, #0]
     194:	6913      	ldr	r3, [r2, #16]
     196:	f043 0304 	orr.w	r3, r3, #4
     19a:	6113      	str	r3, [r2, #16]
     19c:	6823      	ldr	r3, [r4, #0]
     19e:	2200      	movs	r2, #0
     1a0:	611a      	str	r2, [r3, #16]
     1a2:	e7be      	b.n	122 <drv_eth_sma_interrupt_handler+0x2c>
     1a4:	4620      	mov	r0, r4
     1a6:	f7ff ffa4 	bl	f2 <eth_sma_int_rx_fifo_noempty_callback>
     1aa:	6822      	ldr	r2, [r4, #0]
     1ac:	6913      	ldr	r3, [r2, #16]
     1ae:	f043 0308 	orr.w	r3, r3, #8
     1b2:	6113      	str	r3, [r2, #16]
     1b4:	6823      	ldr	r3, [r4, #0]
     1b6:	2200      	movs	r2, #0
     1b8:	611a      	str	r2, [r3, #16]
     1ba:	e7b5      	b.n	128 <drv_eth_sma_interrupt_handler+0x32>

000001bc <drv_eth_mac_dma_default_config>:
     1bc:	2308      	movs	r3, #8
     1be:	7103      	strb	r3, [r0, #4]
     1c0:	2300      	movs	r3, #0
     1c2:	7143      	strb	r3, [r0, #5]
     1c4:	7183      	strb	r3, [r0, #6]
     1c6:	71c3      	strb	r3, [r0, #7]
     1c8:	4770      	bx	lr
	...

000001cc <drv_eth_mac_pe_default_config>:
     1cc:	4b07      	ldr	r3, [pc, #28]	; (1ec <drv_eth_mac_pe_default_config+0x20>)
     1ce:	60c3      	str	r3, [r0, #12]
     1d0:	f240 6305 	movw	r3, #1541	; 0x605
     1d4:	8203      	strh	r3, [r0, #16]
     1d6:	2300      	movs	r3, #0
     1d8:	7483      	strb	r3, [r0, #18]
     1da:	74c3      	strb	r3, [r0, #19]
     1dc:	7503      	strb	r3, [r0, #20]
     1de:	2201      	movs	r2, #1
     1e0:	7542      	strb	r2, [r0, #21]
     1e2:	7582      	strb	r2, [r0, #22]
     1e4:	75c3      	strb	r3, [r0, #23]
     1e6:	2360      	movs	r3, #96	; 0x60
     1e8:	7603      	strb	r3, [r0, #24]
     1ea:	4770      	bx	lr
     1ec:	04030201 	streq	r0, [r3], #-513	; 0xfffffdff

000001f0 <drv_eth_mac_set_dma_config>:
     1f0:	b508      	push	{r3, lr}
     1f2:	7903      	ldrb	r3, [r0, #4]
     1f4:	7941      	ldrb	r1, [r0, #5]
     1f6:	0089      	lsls	r1, r1, #2
     1f8:	ea41 7103 	orr.w	r1, r1, r3, lsl #28
     1fc:	7982      	ldrb	r2, [r0, #6]
     1fe:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     202:	79c2      	ldrb	r2, [r0, #7]
     204:	4311      	orrs	r1, r2
     206:	6800      	ldr	r0, [r0, #0]
     208:	460a      	mov	r2, r1
     20a:	3004      	adds	r0, #4
     20c:	f7ff ff5c 	bl	c8 <drv_check_rw_data>
     210:	bd08      	pop	{r3, pc}

00000212 <drv_eth_mac_set_pe_config>:
     212:	b510      	push	{r4, lr}
     214:	4604      	mov	r4, r0
     216:	68c1      	ldr	r1, [r0, #12]
     218:	6800      	ldr	r0, [r0, #0]
     21a:	460a      	mov	r2, r1
     21c:	30d0      	adds	r0, #208	; 0xd0
     21e:	f7ff ff53 	bl	c8 <drv_check_rw_data>
     222:	8a21      	ldrh	r1, [r4, #16]
     224:	6820      	ldr	r0, [r4, #0]
     226:	460a      	mov	r2, r1
     228:	30d4      	adds	r0, #212	; 0xd4
     22a:	f7ff ff4d 	bl	c8 <drv_check_rw_data>
     22e:	7ca3      	ldrb	r3, [r4, #18]
     230:	7ce1      	ldrb	r1, [r4, #19]
     232:	0709      	lsls	r1, r1, #28
     234:	ea41 71c3 	orr.w	r1, r1, r3, lsl #31
     238:	7d23      	ldrb	r3, [r4, #20]
     23a:	ea41 6143 	orr.w	r1, r1, r3, lsl #25
     23e:	7d63      	ldrb	r3, [r4, #21]
     240:	ea41 5183 	orr.w	r1, r1, r3, lsl #22
     244:	7da2      	ldrb	r2, [r4, #22]
     246:	ea41 3142 	orr.w	r1, r1, r2, lsl #13
     24a:	7de2      	ldrb	r2, [r4, #23]
     24c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     250:	6820      	ldr	r0, [r4, #0]
     252:	460a      	mov	r2, r1
     254:	30d8      	adds	r0, #216	; 0xd8
     256:	f7ff ff37 	bl	c8 <drv_check_rw_data>
     25a:	7e21      	ldrb	r1, [r4, #24]
     25c:	08c9      	lsrs	r1, r1, #3
     25e:	3905      	subs	r1, #5
     260:	0609      	lsls	r1, r1, #24
     262:	6820      	ldr	r0, [r4, #0]
     264:	460a      	mov	r2, r1
     266:	30dc      	adds	r0, #220	; 0xdc
     268:	f7ff ff2e 	bl	c8 <drv_check_rw_data>
     26c:	bd10      	pop	{r4, pc}

0000026e <drv_eth_mac_init>:
     26e:	b538      	push	{r3, r4, r5, lr}
     270:	4604      	mov	r4, r0
     272:	f7ff ffbd 	bl	1f0 <drv_eth_mac_set_dma_config>
     276:	4605      	mov	r5, r0
     278:	4620      	mov	r0, r4
     27a:	f7ff ffca 	bl	212 <drv_eth_mac_set_pe_config>
     27e:	4328      	orrs	r0, r5
     280:	2300      	movs	r3, #0
     282:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     286:	61e3      	str	r3, [r4, #28]
     288:	6223      	str	r3, [r4, #32]
     28a:	2204      	movs	r2, #4
     28c:	f884 2024 	strb.w	r2, [r4, #36]	; 0x24
     290:	f884 2025 	strb.w	r2, [r4, #37]	; 0x25
     294:	f884 3026 	strb.w	r3, [r4, #38]	; 0x26
     298:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
     29c:	6821      	ldr	r1, [r4, #0]
     29e:	680a      	ldr	r2, [r1, #0]
     2a0:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     2a4:	600a      	str	r2, [r1, #0]
     2a6:	6821      	ldr	r1, [r4, #0]
     2a8:	680a      	ldr	r2, [r1, #0]
     2aa:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     2ae:	600a      	str	r2, [r1, #0]
     2b0:	6821      	ldr	r1, [r4, #0]
     2b2:	680a      	ldr	r2, [r1, #0]
     2b4:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     2b8:	600a      	str	r2, [r1, #0]
     2ba:	6821      	ldr	r1, [r4, #0]
     2bc:	680a      	ldr	r2, [r1, #0]
     2be:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     2c2:	600a      	str	r2, [r1, #0]
     2c4:	6821      	ldr	r1, [r4, #0]
     2c6:	680a      	ldr	r2, [r1, #0]
     2c8:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     2cc:	600a      	str	r2, [r1, #0]
     2ce:	6821      	ldr	r1, [r4, #0]
     2d0:	680a      	ldr	r2, [r1, #0]
     2d2:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     2d6:	600a      	str	r2, [r1, #0]
     2d8:	6821      	ldr	r1, [r4, #0]
     2da:	680a      	ldr	r2, [r1, #0]
     2dc:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     2e0:	600a      	str	r2, [r1, #0]
     2e2:	6821      	ldr	r1, [r4, #0]
     2e4:	680a      	ldr	r2, [r1, #0]
     2e6:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     2ea:	600a      	str	r2, [r1, #0]
     2ec:	6821      	ldr	r1, [r4, #0]
     2ee:	680a      	ldr	r2, [r1, #0]
     2f0:	f442 5280 	orr.w	r2, r2, #4096	; 0x1000
     2f4:	600a      	str	r2, [r1, #0]
     2f6:	6821      	ldr	r1, [r4, #0]
     2f8:	680a      	ldr	r2, [r1, #0]
     2fa:	f422 5280 	bic.w	r2, r2, #4096	; 0x1000
     2fe:	600a      	str	r2, [r1, #0]
     300:	6821      	ldr	r1, [r4, #0]
     302:	2201      	movs	r2, #1
     304:	f8c1 2100 	str.w	r2, [r1, #256]	; 0x100
     308:	6821      	ldr	r1, [r4, #0]
     30a:	f8c1 3100 	str.w	r3, [r1, #256]	; 0x100
     30e:	6821      	ldr	r1, [r4, #0]
     310:	f8c1 2104 	str.w	r2, [r1, #260]	; 0x104
     314:	6822      	ldr	r2, [r4, #0]
     316:	f8c2 3104 	str.w	r3, [r2, #260]	; 0x104
     31a:	6822      	ldr	r2, [r4, #0]
     31c:	6813      	ldr	r3, [r2, #0]
     31e:	f043 0301 	orr.w	r3, r3, #1
     322:	6013      	str	r3, [r2, #0]
     324:	6822      	ldr	r2, [r4, #0]
     326:	6813      	ldr	r3, [r2, #0]
     328:	f023 0301 	bic.w	r3, r3, #1
     32c:	6013      	str	r3, [r2, #0]
     32e:	6822      	ldr	r2, [r4, #0]
     330:	6813      	ldr	r3, [r2, #0]
     332:	f043 0302 	orr.w	r3, r3, #2
     336:	6013      	str	r3, [r2, #0]
     338:	6822      	ldr	r2, [r4, #0]
     33a:	6813      	ldr	r3, [r2, #0]
     33c:	f023 0302 	bic.w	r3, r3, #2
     340:	6013      	str	r3, [r2, #0]
     342:	6822      	ldr	r2, [r4, #0]
     344:	6813      	ldr	r3, [r2, #0]
     346:	f043 0320 	orr.w	r3, r3, #32
     34a:	6013      	str	r3, [r2, #0]
     34c:	6822      	ldr	r2, [r4, #0]
     34e:	6813      	ldr	r3, [r2, #0]
     350:	f043 0310 	orr.w	r3, r3, #16
     354:	6013      	str	r3, [r2, #0]
     356:	b2c0      	uxtb	r0, r0
     358:	bd38      	pop	{r3, r4, r5, pc}

0000035a <drv_eth_mac_address_set>:
     35a:	78ca      	ldrb	r2, [r1, #3]
     35c:	788b      	ldrb	r3, [r1, #2]
     35e:	041b      	lsls	r3, r3, #16
     360:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
     364:	784a      	ldrb	r2, [r1, #1]
     366:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
     36a:	780a      	ldrb	r2, [r1, #0]
     36c:	4313      	orrs	r3, r2
     36e:	60c3      	str	r3, [r0, #12]
     370:	f891 c005 	ldrb.w	ip, [r1, #5]
     374:	790a      	ldrb	r2, [r1, #4]
     376:	ea42 220c 	orr.w	r2, r2, ip, lsl #8
     37a:	8202      	strh	r2, [r0, #16]
     37c:	6802      	ldr	r2, [r0, #0]
     37e:	f8d2 10d0 	ldr.w	r1, [r2, #208]	; 0xd0
     382:	f8c2 30d0 	str.w	r3, [r2, #208]	; 0xd0
     386:	6802      	ldr	r2, [r0, #0]
     388:	f8d2 30d4 	ldr.w	r3, [r2, #212]	; 0xd4
     38c:	0c1b      	lsrs	r3, r3, #16
     38e:	041b      	lsls	r3, r3, #16
     390:	8a01      	ldrh	r1, [r0, #16]
     392:	430b      	orrs	r3, r1
     394:	f8c2 30d4 	str.w	r3, [r2, #212]	; 0xd4
     398:	4770      	bx	lr

0000039a <drv_eth_mac_tx_descriptor_default_config>:
     39a:	2300      	movs	r3, #0
     39c:	6003      	str	r3, [r0, #0]
     39e:	7103      	strb	r3, [r0, #4]
     3a0:	80c3      	strh	r3, [r0, #6]
     3a2:	7203      	strb	r3, [r0, #8]
     3a4:	7243      	strb	r3, [r0, #9]
     3a6:	2301      	movs	r3, #1
     3a8:	7283      	strb	r3, [r0, #10]
     3aa:	4770      	bx	lr

000003ac <drv_eth_mac_tx_descriptor_config>:
     3ac:	6803      	ldr	r3, [r0, #0]
     3ae:	600b      	str	r3, [r1, #0]
     3b0:	2300      	movs	r3, #0
     3b2:	604b      	str	r3, [r1, #4]
     3b4:	7902      	ldrb	r2, [r0, #4]
     3b6:	88c3      	ldrh	r3, [r0, #6]
     3b8:	ea43 73c2 	orr.w	r3, r3, r2, lsl #31
     3bc:	608b      	str	r3, [r1, #8]
     3be:	7a02      	ldrb	r2, [r0, #8]
     3c0:	7a43      	ldrb	r3, [r0, #9]
     3c2:	061b      	lsls	r3, r3, #24
     3c4:	ea43 6382 	orr.w	r3, r3, r2, lsl #26
     3c8:	7a82      	ldrb	r2, [r0, #10]
     3ca:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
     3ce:	60cb      	str	r3, [r1, #12]
     3d0:	4770      	bx	lr

000003d2 <drv_eth_mac_set_tx_descriptor_config>:
     3d2:	61c1      	str	r1, [r0, #28]
     3d4:	6801      	ldr	r1, [r0, #0]
     3d6:	690b      	ldr	r3, [r1, #16]
     3d8:	f023 0303 	bic.w	r3, r3, #3
     3dc:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
     3e0:	3a01      	subs	r2, #1
     3e2:	4313      	orrs	r3, r2
     3e4:	610b      	str	r3, [r1, #16]
     3e6:	2300      	movs	r3, #0
     3e8:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     3ec:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
     3f0:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
     3f4:	4293      	cmp	r3, r2
     3f6:	d223      	bcs.n	440 <drv_eth_mac_set_tx_descriptor_config+0x6e>
     3f8:	b410      	push	{r4}
     3fa:	6802      	ldr	r2, [r0, #0]
     3fc:	3250      	adds	r2, #80	; 0x50
     3fe:	ea4f 1c03 	mov.w	ip, r3, lsl #4
     402:	eb02 1103 	add.w	r1, r2, r3, lsl #4
     406:	69c4      	ldr	r4, [r0, #28]
     408:	eb04 1303 	add.w	r3, r4, r3, lsl #4
     40c:	f854 400c 	ldr.w	r4, [r4, ip]
     410:	f842 400c 	str.w	r4, [r2, ip]
     414:	685a      	ldr	r2, [r3, #4]
     416:	604a      	str	r2, [r1, #4]
     418:	689a      	ldr	r2, [r3, #8]
     41a:	608a      	str	r2, [r1, #8]
     41c:	68db      	ldr	r3, [r3, #12]
     41e:	60cb      	str	r3, [r1, #12]
     420:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
     424:	3301      	adds	r3, #1
     426:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     42a:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
     42e:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
     432:	4293      	cmp	r3, r2
     434:	d3e1      	bcc.n	3fa <drv_eth_mac_set_tx_descriptor_config+0x28>
     436:	2300      	movs	r3, #0
     438:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     43c:	bc10      	pop	{r4}
     43e:	4770      	bx	lr
     440:	2300      	movs	r3, #0
     442:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     446:	4770      	bx	lr

00000448 <drv_eth_mac_tx_descriptor_clear>:
     448:	2300      	movs	r3, #0
     44a:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     44e:	e00f      	b.n	470 <drv_eth_mac_tx_descriptor_clear+0x28>
     450:	69c1      	ldr	r1, [r0, #28]
     452:	ea4f 1c03 	mov.w	ip, r3, lsl #4
     456:	eb01 1303 	add.w	r3, r1, r3, lsl #4
     45a:	2200      	movs	r2, #0
     45c:	f841 200c 	str.w	r2, [r1, ip]
     460:	605a      	str	r2, [r3, #4]
     462:	609a      	str	r2, [r3, #8]
     464:	60da      	str	r2, [r3, #12]
     466:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
     46a:	3301      	adds	r3, #1
     46c:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     470:	f890 3026 	ldrb.w	r3, [r0, #38]	; 0x26
     474:	f890 2024 	ldrb.w	r2, [r0, #36]	; 0x24
     478:	4293      	cmp	r3, r2
     47a:	d3e9      	bcc.n	450 <drv_eth_mac_tx_descriptor_clear+0x8>
     47c:	2300      	movs	r3, #0
     47e:	f880 3026 	strb.w	r3, [r0, #38]	; 0x26
     482:	4770      	bx	lr

00000484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>:
     484:	b510      	push	{r4, lr}
     486:	4604      	mov	r4, r0
     488:	f7ff ffa3 	bl	3d2 <drv_eth_mac_set_tx_descriptor_config>
     48c:	6822      	ldr	r2, [r4, #0]
     48e:	6813      	ldr	r3, [r2, #0]
     490:	f023 0308 	bic.w	r3, r3, #8
     494:	6013      	str	r3, [r2, #0]
     496:	6822      	ldr	r2, [r4, #0]
     498:	6813      	ldr	r3, [r2, #0]
     49a:	f043 0308 	orr.w	r3, r3, #8
     49e:	6013      	str	r3, [r2, #0]
     4a0:	6822      	ldr	r2, [r4, #0]
     4a2:	6813      	ldr	r3, [r2, #0]
     4a4:	f023 0308 	bic.w	r3, r3, #8
     4a8:	6013      	str	r3, [r2, #0]
     4aa:	bd10      	pop	{r4, pc}

000004ac <eth_mac_tx_int_tx_frame_done_callback>:
     4ac:	4770      	bx	lr

000004ae <eth_mac_rx_int_rx_frame_done_callback>:
     4ae:	4770      	bx	lr

000004b0 <eth_mac_dma_int_once_process_done_callback>:
     4b0:	4770      	bx	lr

000004b2 <eth_mac_dma_int_hready_to_callback>:
     4b2:	4770      	bx	lr

000004b4 <eth_mac_dma_int_bus_error_callback>:
     4b4:	4770      	bx	lr

000004b6 <drv_eth_mac_tx_interrupt_handler>:
     4b6:	6802      	ldr	r2, [r0, #0]
     4b8:	f8d2 3110 	ldr.w	r3, [r2, #272]	; 0x110
     4bc:	f8d2 20f0 	ldr.w	r2, [r2, #240]	; 0xf0
     4c0:	b2d2      	uxtb	r2, r2
     4c2:	4013      	ands	r3, r2
     4c4:	f013 0f01 	tst.w	r3, #1
     4c8:	d100      	bne.n	4cc <drv_eth_mac_tx_interrupt_handler+0x16>
     4ca:	4770      	bx	lr
     4cc:	b510      	push	{r4, lr}
     4ce:	4604      	mov	r4, r0
     4d0:	2302      	movs	r3, #2
     4d2:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
     4d6:	f7ff ffe9 	bl	4ac <eth_mac_tx_int_tx_frame_done_callback>
     4da:	6822      	ldr	r2, [r4, #0]
     4dc:	f8d2 3100 	ldr.w	r3, [r2, #256]	; 0x100
     4e0:	f043 0301 	orr.w	r3, r3, #1
     4e4:	f8c2 3100 	str.w	r3, [r2, #256]	; 0x100
     4e8:	6823      	ldr	r3, [r4, #0]
     4ea:	2200      	movs	r2, #0
     4ec:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
     4f0:	bd10      	pop	{r4, pc}

000004f2 <drv_eth_mac_rx_interrupt_handler>:
     4f2:	6802      	ldr	r2, [r0, #0]
     4f4:	f8d2 3114 	ldr.w	r3, [r2, #276]	; 0x114
     4f8:	f8d2 20f4 	ldr.w	r2, [r2, #244]	; 0xf4
     4fc:	b2d2      	uxtb	r2, r2
     4fe:	4013      	ands	r3, r2
     500:	f013 0f01 	tst.w	r3, #1
     504:	d100      	bne.n	508 <drv_eth_mac_rx_interrupt_handler+0x16>
     506:	4770      	bx	lr
     508:	b510      	push	{r4, lr}
     50a:	4604      	mov	r4, r0
     50c:	2302      	movs	r3, #2
     50e:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
     512:	f7ff ffcc 	bl	4ae <eth_mac_rx_int_rx_frame_done_callback>
     516:	6822      	ldr	r2, [r4, #0]
     518:	f8d2 3104 	ldr.w	r3, [r2, #260]	; 0x104
     51c:	f043 0301 	orr.w	r3, r3, #1
     520:	f8c2 3104 	str.w	r3, [r2, #260]	; 0x104
     524:	6823      	ldr	r3, [r4, #0]
     526:	2200      	movs	r2, #0
     528:	f8c3 2104 	str.w	r2, [r3, #260]	; 0x104
     52c:	bd10      	pop	{r4, pc}

0000052e <drv_eth_mac_dma_interrupt_handler>:
     52e:	b538      	push	{r3, r4, r5, lr}
     530:	4604      	mov	r4, r0
     532:	6803      	ldr	r3, [r0, #0]
     534:	f8d3 5118 	ldr.w	r5, [r3, #280]	; 0x118
     538:	f8d3 30f8 	ldr.w	r3, [r3, #248]	; 0xf8
     53c:	b2db      	uxtb	r3, r3
     53e:	401d      	ands	r5, r3
     540:	f015 0f01 	tst.w	r5, #1
     544:	d106      	bne.n	554 <drv_eth_mac_dma_interrupt_handler+0x26>
     546:	f015 0f02 	tst.w	r5, #2
     54a:	d114      	bne.n	576 <drv_eth_mac_dma_interrupt_handler+0x48>
     54c:	f015 0f04 	tst.w	r5, #4
     550:	d123      	bne.n	59a <drv_eth_mac_dma_interrupt_handler+0x6c>
     552:	bd38      	pop	{r3, r4, r5, pc}
     554:	2302      	movs	r3, #2
     556:	f880 3028 	strb.w	r3, [r0, #40]	; 0x28
     55a:	f7ff ffa9 	bl	4b0 <eth_mac_dma_int_once_process_done_callback>
     55e:	6822      	ldr	r2, [r4, #0]
     560:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
     564:	f043 0301 	orr.w	r3, r3, #1
     568:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
     56c:	6823      	ldr	r3, [r4, #0]
     56e:	2200      	movs	r2, #0
     570:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
     574:	e7e7      	b.n	546 <drv_eth_mac_dma_interrupt_handler+0x18>
     576:	2304      	movs	r3, #4
     578:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     57c:	4620      	mov	r0, r4
     57e:	f7ff ff98 	bl	4b2 <eth_mac_dma_int_hready_to_callback>
     582:	6822      	ldr	r2, [r4, #0]
     584:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
     588:	f043 0302 	orr.w	r3, r3, #2
     58c:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
     590:	6823      	ldr	r3, [r4, #0]
     592:	2200      	movs	r2, #0
     594:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
     598:	e7d8      	b.n	54c <drv_eth_mac_dma_interrupt_handler+0x1e>
     59a:	2310      	movs	r3, #16
     59c:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     5a0:	4620      	mov	r0, r4
     5a2:	f7ff ff87 	bl	4b4 <eth_mac_dma_int_bus_error_callback>
     5a6:	6822      	ldr	r2, [r4, #0]
     5a8:	f8d2 3108 	ldr.w	r3, [r2, #264]	; 0x108
     5ac:	f043 0304 	orr.w	r3, r3, #4
     5b0:	f8c2 3108 	str.w	r3, [r2, #264]	; 0x108
     5b4:	6823      	ldr	r3, [r4, #0]
     5b6:	2200      	movs	r2, #0
     5b8:	f8c3 2108 	str.w	r2, [r3, #264]	; 0x108
     5bc:	e7c9      	b.n	552 <drv_eth_mac_dma_interrupt_handler+0x24>

000005be <drv_uart_default_config>:
     5be:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
     5c2:	6043      	str	r3, [r0, #4]
     5c4:	230f      	movs	r3, #15
     5c6:	7203      	strb	r3, [r0, #8]
     5c8:	2300      	movs	r3, #0
     5ca:	7243      	strb	r3, [r0, #9]
     5cc:	7283      	strb	r3, [r0, #10]
     5ce:	72c3      	strb	r3, [r0, #11]
     5d0:	7303      	strb	r3, [r0, #12]
     5d2:	7343      	strb	r3, [r0, #13]
     5d4:	2301      	movs	r3, #1
     5d6:	7383      	strb	r3, [r0, #14]
     5d8:	4770      	bx	lr
	...

000005dc <drv_uart_set_config>:
     5dc:	b508      	push	{r3, lr}
     5de:	6841      	ldr	r1, [r0, #4]
     5e0:	7a03      	ldrb	r3, [r0, #8]
     5e2:	fb03 f201 	mul.w	r2, r3, r1
     5e6:	490e      	ldr	r1, [pc, #56]	; (620 <drv_uart_set_config+0x44>)
     5e8:	fbb1 f2f2 	udiv	r2, r1, r2
     5ec:	0419      	lsls	r1, r3, #16
     5ee:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     5f2:	7a43      	ldrb	r3, [r0, #9]
     5f4:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     5f8:	7a83      	ldrb	r3, [r0, #10]
     5fa:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     5fe:	7ac3      	ldrb	r3, [r0, #11]
     600:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     604:	7b03      	ldrb	r3, [r0, #12]
     606:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     60a:	7b42      	ldrb	r2, [r0, #13]
     60c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     610:	7b82      	ldrb	r2, [r0, #14]
     612:	4311      	orrs	r1, r2
     614:	6800      	ldr	r0, [r0, #0]
     616:	460a      	mov	r2, r1
     618:	3008      	adds	r0, #8
     61a:	f7ff fd55 	bl	c8 <drv_check_rw_data>
     61e:	bd08      	pop	{r3, pc}
     620:	02625a00 	rsbeq	r5, r2, #0, 20

00000624 <drv_uart_init>:
     624:	b538      	push	{r3, r4, r5, lr}
     626:	4604      	mov	r4, r0
     628:	2500      	movs	r5, #0
     62a:	7485      	strb	r5, [r0, #18]
     62c:	74c5      	strb	r5, [r0, #19]
     62e:	f7ff ffd5 	bl	5dc <drv_uart_set_config>
     632:	7425      	strb	r5, [r4, #16]
     634:	74a5      	strb	r5, [r4, #18]
     636:	74e5      	strb	r5, [r4, #19]
     638:	6822      	ldr	r2, [r4, #0]
     63a:	6853      	ldr	r3, [r2, #4]
     63c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     640:	6053      	str	r3, [r2, #4]
     642:	6822      	ldr	r2, [r4, #0]
     644:	6853      	ldr	r3, [r2, #4]
     646:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     64a:	6053      	str	r3, [r2, #4]
     64c:	6822      	ldr	r2, [r4, #0]
     64e:	6853      	ldr	r3, [r2, #4]
     650:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     654:	6053      	str	r3, [r2, #4]
     656:	6822      	ldr	r2, [r4, #0]
     658:	6853      	ldr	r3, [r2, #4]
     65a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     65e:	6053      	str	r3, [r2, #4]
     660:	6822      	ldr	r2, [r4, #0]
     662:	6853      	ldr	r3, [r2, #4]
     664:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     668:	6053      	str	r3, [r2, #4]
     66a:	6822      	ldr	r2, [r4, #0]
     66c:	6853      	ldr	r3, [r2, #4]
     66e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     672:	6053      	str	r3, [r2, #4]
     674:	6822      	ldr	r2, [r4, #0]
     676:	6853      	ldr	r3, [r2, #4]
     678:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     67c:	6053      	str	r3, [r2, #4]
     67e:	6822      	ldr	r2, [r4, #0]
     680:	6853      	ldr	r3, [r2, #4]
     682:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     686:	6053      	str	r3, [r2, #4]
     688:	6823      	ldr	r3, [r4, #0]
     68a:	f240 12ff 	movw	r2, #511	; 0x1ff
     68e:	611a      	str	r2, [r3, #16]
     690:	6823      	ldr	r3, [r4, #0]
     692:	611d      	str	r5, [r3, #16]
     694:	6822      	ldr	r2, [r4, #0]
     696:	6853      	ldr	r3, [r2, #4]
     698:	f043 0301 	orr.w	r3, r3, #1
     69c:	6053      	str	r3, [r2, #4]
     69e:	6822      	ldr	r2, [r4, #0]
     6a0:	6853      	ldr	r3, [r2, #4]
     6a2:	f023 0301 	bic.w	r3, r3, #1
     6a6:	6053      	str	r3, [r2, #4]
     6a8:	6822      	ldr	r2, [r4, #0]
     6aa:	6853      	ldr	r3, [r2, #4]
     6ac:	f043 0302 	orr.w	r3, r3, #2
     6b0:	6053      	str	r3, [r2, #4]
     6b2:	bd38      	pop	{r3, r4, r5, pc}

000006b4 <uart_int_tx_done_callback>:
     6b4:	4770      	bx	lr

000006b6 <uart_int_rx_stop_callback>:
     6b6:	4770      	bx	lr

000006b8 <uart_int_rx_parity_error_callback>:
     6b8:	4770      	bx	lr

000006ba <uart_int_rx_noise_detect_callback>:
     6ba:	4770      	bx	lr

000006bc <uart_int_rx_stop_detect_callback>:
     6bc:	4770      	bx	lr

000006be <uart_int_tx_fifo_empty_callback>:
     6be:	4770      	bx	lr

000006c0 <uart_int_tx_fifo_thres_callback>:
     6c0:	4770      	bx	lr

000006c2 <uart_int_rx_fifo_noempty_callback>:
     6c2:	4770      	bx	lr

000006c4 <uart_int_rx_fifo_thres_callback>:
     6c4:	4770      	bx	lr

000006c6 <drv_uart_interrupt_handler>:
     6c6:	b538      	push	{r3, r4, r5, lr}
     6c8:	4604      	mov	r4, r0
     6ca:	6803      	ldr	r3, [r0, #0]
     6cc:	699d      	ldr	r5, [r3, #24]
     6ce:	68db      	ldr	r3, [r3, #12]
     6d0:	b29b      	uxth	r3, r3
     6d2:	401d      	ands	r5, r3
     6d4:	f415 7f80 	tst.w	r5, #256	; 0x100
     6d8:	d144      	bne.n	764 <drv_uart_interrupt_handler+0x9e>
     6da:	f015 0f40 	tst.w	r5, #64	; 0x40
     6de:	d00f      	beq.n	700 <drv_uart_interrupt_handler+0x3a>
     6e0:	2301      	movs	r3, #1
     6e2:	7423      	strb	r3, [r4, #16]
     6e4:	7aa3      	ldrb	r3, [r4, #10]
     6e6:	2b01      	cmp	r3, #1
     6e8:	d147      	bne.n	77a <drv_uart_interrupt_handler+0xb4>
     6ea:	4620      	mov	r0, r4
     6ec:	f7ff ffe3 	bl	6b6 <uart_int_rx_stop_callback>
     6f0:	6822      	ldr	r2, [r4, #0]
     6f2:	6913      	ldr	r3, [r2, #16]
     6f4:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     6f8:	6113      	str	r3, [r2, #16]
     6fa:	6823      	ldr	r3, [r4, #0]
     6fc:	2200      	movs	r2, #0
     6fe:	611a      	str	r2, [r3, #16]
     700:	f015 0f80 	tst.w	r5, #128	; 0x80
     704:	d00f      	beq.n	726 <drv_uart_interrupt_handler+0x60>
     706:	2302      	movs	r3, #2
     708:	7423      	strb	r3, [r4, #16]
     70a:	7aa3      	ldrb	r3, [r4, #10]
     70c:	2b01      	cmp	r3, #1
     70e:	d166      	bne.n	7de <drv_uart_interrupt_handler+0x118>
     710:	4620      	mov	r0, r4
     712:	f7ff ffd1 	bl	6b8 <uart_int_rx_parity_error_callback>
     716:	6822      	ldr	r2, [r4, #0]
     718:	6913      	ldr	r3, [r2, #16]
     71a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     71e:	6113      	str	r3, [r2, #16]
     720:	6823      	ldr	r3, [r4, #0]
     722:	2200      	movs	r2, #0
     724:	611a      	str	r2, [r3, #16]
     726:	f015 0f20 	tst.w	r5, #32
     72a:	f040 808a 	bne.w	842 <drv_uart_interrupt_handler+0x17c>
     72e:	f015 0f10 	tst.w	r5, #16
     732:	f040 8092 	bne.w	85a <drv_uart_interrupt_handler+0x194>
     736:	f015 0f01 	tst.w	r5, #1
     73a:	f040 809a 	bne.w	872 <drv_uart_interrupt_handler+0x1ac>
     73e:	f015 0f02 	tst.w	r5, #2
     742:	f040 80a2 	bne.w	88a <drv_uart_interrupt_handler+0x1c4>
     746:	f015 0f04 	tst.w	r5, #4
     74a:	f000 80c1 	beq.w	8d0 <drv_uart_interrupt_handler+0x20a>
     74e:	7ce2      	ldrb	r2, [r4, #19]
     750:	7e23      	ldrb	r3, [r4, #24]
     752:	429a      	cmp	r2, r3
     754:	f0c0 80ac 	bcc.w	8b0 <drv_uart_interrupt_handler+0x1ea>
     758:	6822      	ldr	r2, [r4, #0]
     75a:	68d3      	ldr	r3, [r2, #12]
     75c:	f023 030c 	bic.w	r3, r3, #12
     760:	60d3      	str	r3, [r2, #12]
     762:	e0aa      	b.n	8ba <drv_uart_interrupt_handler+0x1f4>
     764:	f7ff ffa6 	bl	6b4 <uart_int_tx_done_callback>
     768:	6822      	ldr	r2, [r4, #0]
     76a:	6913      	ldr	r3, [r2, #16]
     76c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     770:	6113      	str	r3, [r2, #16]
     772:	6823      	ldr	r3, [r4, #0]
     774:	2200      	movs	r2, #0
     776:	611a      	str	r2, [r3, #16]
     778:	e7af      	b.n	6da <drv_uart_interrupt_handler+0x14>
     77a:	6822      	ldr	r2, [r4, #0]
     77c:	68d3      	ldr	r3, [r2, #12]
     77e:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     782:	60d3      	str	r3, [r2, #12]
     784:	2300      	movs	r3, #0
     786:	7423      	strb	r3, [r4, #16]
     788:	74a3      	strb	r3, [r4, #18]
     78a:	74e3      	strb	r3, [r4, #19]
     78c:	6822      	ldr	r2, [r4, #0]
     78e:	6853      	ldr	r3, [r2, #4]
     790:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     794:	6053      	str	r3, [r2, #4]
     796:	6822      	ldr	r2, [r4, #0]
     798:	6853      	ldr	r3, [r2, #4]
     79a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     79e:	6053      	str	r3, [r2, #4]
     7a0:	6822      	ldr	r2, [r4, #0]
     7a2:	6853      	ldr	r3, [r2, #4]
     7a4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     7a8:	6053      	str	r3, [r2, #4]
     7aa:	6822      	ldr	r2, [r4, #0]
     7ac:	6853      	ldr	r3, [r2, #4]
     7ae:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     7b2:	6053      	str	r3, [r2, #4]
     7b4:	6822      	ldr	r2, [r4, #0]
     7b6:	6853      	ldr	r3, [r2, #4]
     7b8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     7bc:	6053      	str	r3, [r2, #4]
     7be:	6822      	ldr	r2, [r4, #0]
     7c0:	6853      	ldr	r3, [r2, #4]
     7c2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     7c6:	6053      	str	r3, [r2, #4]
     7c8:	6822      	ldr	r2, [r4, #0]
     7ca:	6853      	ldr	r3, [r2, #4]
     7cc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     7d0:	6053      	str	r3, [r2, #4]
     7d2:	6822      	ldr	r2, [r4, #0]
     7d4:	6853      	ldr	r3, [r2, #4]
     7d6:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     7da:	6053      	str	r3, [r2, #4]
     7dc:	e785      	b.n	6ea <drv_uart_interrupt_handler+0x24>
     7de:	6822      	ldr	r2, [r4, #0]
     7e0:	68d3      	ldr	r3, [r2, #12]
     7e2:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     7e6:	60d3      	str	r3, [r2, #12]
     7e8:	2300      	movs	r3, #0
     7ea:	7423      	strb	r3, [r4, #16]
     7ec:	74a3      	strb	r3, [r4, #18]
     7ee:	74e3      	strb	r3, [r4, #19]
     7f0:	6822      	ldr	r2, [r4, #0]
     7f2:	6853      	ldr	r3, [r2, #4]
     7f4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     7f8:	6053      	str	r3, [r2, #4]
     7fa:	6822      	ldr	r2, [r4, #0]
     7fc:	6853      	ldr	r3, [r2, #4]
     7fe:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     802:	6053      	str	r3, [r2, #4]
     804:	6822      	ldr	r2, [r4, #0]
     806:	6853      	ldr	r3, [r2, #4]
     808:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     80c:	6053      	str	r3, [r2, #4]
     80e:	6822      	ldr	r2, [r4, #0]
     810:	6853      	ldr	r3, [r2, #4]
     812:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     816:	6053      	str	r3, [r2, #4]
     818:	6822      	ldr	r2, [r4, #0]
     81a:	6853      	ldr	r3, [r2, #4]
     81c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     820:	6053      	str	r3, [r2, #4]
     822:	6822      	ldr	r2, [r4, #0]
     824:	6853      	ldr	r3, [r2, #4]
     826:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     82a:	6053      	str	r3, [r2, #4]
     82c:	6822      	ldr	r2, [r4, #0]
     82e:	6853      	ldr	r3, [r2, #4]
     830:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     834:	6053      	str	r3, [r2, #4]
     836:	6822      	ldr	r2, [r4, #0]
     838:	6853      	ldr	r3, [r2, #4]
     83a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     83e:	6053      	str	r3, [r2, #4]
     840:	e766      	b.n	710 <drv_uart_interrupt_handler+0x4a>
     842:	4620      	mov	r0, r4
     844:	f7ff ff39 	bl	6ba <uart_int_rx_noise_detect_callback>
     848:	6822      	ldr	r2, [r4, #0]
     84a:	6913      	ldr	r3, [r2, #16]
     84c:	f043 0320 	orr.w	r3, r3, #32
     850:	6113      	str	r3, [r2, #16]
     852:	6823      	ldr	r3, [r4, #0]
     854:	2200      	movs	r2, #0
     856:	611a      	str	r2, [r3, #16]
     858:	e769      	b.n	72e <drv_uart_interrupt_handler+0x68>
     85a:	4620      	mov	r0, r4
     85c:	f7ff ff2e 	bl	6bc <uart_int_rx_stop_detect_callback>
     860:	6822      	ldr	r2, [r4, #0]
     862:	6913      	ldr	r3, [r2, #16]
     864:	f043 0310 	orr.w	r3, r3, #16
     868:	6113      	str	r3, [r2, #16]
     86a:	6823      	ldr	r3, [r4, #0]
     86c:	2200      	movs	r2, #0
     86e:	611a      	str	r2, [r3, #16]
     870:	e761      	b.n	736 <drv_uart_interrupt_handler+0x70>
     872:	4620      	mov	r0, r4
     874:	f7ff ff24 	bl	6c0 <uart_int_tx_fifo_thres_callback>
     878:	6822      	ldr	r2, [r4, #0]
     87a:	6913      	ldr	r3, [r2, #16]
     87c:	f043 0301 	orr.w	r3, r3, #1
     880:	6113      	str	r3, [r2, #16]
     882:	6823      	ldr	r3, [r4, #0]
     884:	2200      	movs	r2, #0
     886:	611a      	str	r2, [r3, #16]
     888:	e759      	b.n	73e <drv_uart_interrupt_handler+0x78>
     88a:	4620      	mov	r0, r4
     88c:	f7ff ff17 	bl	6be <uart_int_tx_fifo_empty_callback>
     890:	6822      	ldr	r2, [r4, #0]
     892:	6913      	ldr	r3, [r2, #16]
     894:	f043 0302 	orr.w	r3, r3, #2
     898:	6113      	str	r3, [r2, #16]
     89a:	6823      	ldr	r3, [r4, #0]
     89c:	2200      	movs	r2, #0
     89e:	611a      	str	r2, [r3, #16]
     8a0:	e751      	b.n	746 <drv_uart_interrupt_handler+0x80>
     8a2:	69d9      	ldr	r1, [r3, #28]
     8a4:	6962      	ldr	r2, [r4, #20]
     8a6:	7ce3      	ldrb	r3, [r4, #19]
     8a8:	1c58      	adds	r0, r3, #1
     8aa:	74e0      	strb	r0, [r4, #19]
     8ac:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     8b0:	6823      	ldr	r3, [r4, #0]
     8b2:	695a      	ldr	r2, [r3, #20]
     8b4:	f012 0f1f 	tst.w	r2, #31
     8b8:	d1f3      	bne.n	8a2 <drv_uart_interrupt_handler+0x1dc>
     8ba:	4620      	mov	r0, r4
     8bc:	f7ff ff02 	bl	6c4 <uart_int_rx_fifo_thres_callback>
     8c0:	6822      	ldr	r2, [r4, #0]
     8c2:	6913      	ldr	r3, [r2, #16]
     8c4:	f043 0304 	orr.w	r3, r3, #4
     8c8:	6113      	str	r3, [r2, #16]
     8ca:	6823      	ldr	r3, [r4, #0]
     8cc:	2200      	movs	r2, #0
     8ce:	611a      	str	r2, [r3, #16]
     8d0:	f015 0f08 	tst.w	r5, #8
     8d4:	d020      	beq.n	918 <drv_uart_interrupt_handler+0x252>
     8d6:	7ce2      	ldrb	r2, [r4, #19]
     8d8:	7e23      	ldrb	r3, [r4, #24]
     8da:	429a      	cmp	r2, r3
     8dc:	d30c      	bcc.n	8f8 <drv_uart_interrupt_handler+0x232>
     8de:	6822      	ldr	r2, [r4, #0]
     8e0:	68d3      	ldr	r3, [r2, #12]
     8e2:	f023 030c 	bic.w	r3, r3, #12
     8e6:	60d3      	str	r3, [r2, #12]
     8e8:	e00b      	b.n	902 <drv_uart_interrupt_handler+0x23c>
     8ea:	69d9      	ldr	r1, [r3, #28]
     8ec:	6962      	ldr	r2, [r4, #20]
     8ee:	7ce3      	ldrb	r3, [r4, #19]
     8f0:	1c58      	adds	r0, r3, #1
     8f2:	74e0      	strb	r0, [r4, #19]
     8f4:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     8f8:	6823      	ldr	r3, [r4, #0]
     8fa:	695a      	ldr	r2, [r3, #20]
     8fc:	f012 0f1f 	tst.w	r2, #31
     900:	d1f3      	bne.n	8ea <drv_uart_interrupt_handler+0x224>
     902:	4620      	mov	r0, r4
     904:	f7ff fedd 	bl	6c2 <uart_int_rx_fifo_noempty_callback>
     908:	6822      	ldr	r2, [r4, #0]
     90a:	6913      	ldr	r3, [r2, #16]
     90c:	f043 0308 	orr.w	r3, r3, #8
     910:	6113      	str	r3, [r2, #16]
     912:	6823      	ldr	r3, [r4, #0]
     914:	2200      	movs	r2, #0
     916:	611a      	str	r2, [r3, #16]
     918:	bd38      	pop	{r3, r4, r5, pc}
	...

0000091c <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare>:
     91c:	b510      	push	{r4, lr}
     91e:	b082      	sub	sp, #8
     920:	4b1c      	ldr	r3, [pc, #112]	; (994 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x78>)
     922:	e893 0003 	ldmia.w	r3, {r0, r1}
     926:	9000      	str	r0, [sp, #0]
     928:	f8ad 1004 	strh.w	r1, [sp, #4]
     92c:	4b1a      	ldr	r3, [pc, #104]	; (998 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x7c>)
     92e:	2201      	movs	r2, #1
     930:	f883 2024 	strb.w	r2, [r3, #36]	; 0x24
     934:	4c19      	ldr	r4, [pc, #100]	; (99c <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x80>)
     936:	4620      	mov	r0, r4
     938:	f7ff fd2f 	bl	39a <drv_eth_mac_tx_descriptor_default_config>
     93c:	2340      	movs	r3, #64	; 0x40
     93e:	80e3      	strh	r3, [r4, #6]
     940:	2302      	movs	r3, #2
     942:	72a3      	strb	r3, [r4, #10]
     944:	2203      	movs	r2, #3
     946:	7222      	strb	r2, [r4, #8]
     948:	7263      	strb	r3, [r4, #9]
     94a:	2400      	movs	r4, #0
     94c:	e00b      	b.n	966 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x4a>
     94e:	f104 0360 	add.w	r3, r4, #96	; 0x60
     952:	02db      	lsls	r3, r3, #11
     954:	4811      	ldr	r0, [pc, #68]	; (99c <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x80>)
     956:	6003      	str	r3, [r0, #0]
     958:	4911      	ldr	r1, [pc, #68]	; (9a0 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x84>)
     95a:	eb01 1104 	add.w	r1, r1, r4, lsl #4
     95e:	f7ff fd25 	bl	3ac <drv_eth_mac_tx_descriptor_config>
     962:	3401      	adds	r4, #1
     964:	b2e4      	uxtb	r4, r4
     966:	4b0c      	ldr	r3, [pc, #48]	; (998 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x7c>)
     968:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
     96c:	42a3      	cmp	r3, r4
     96e:	d8ee      	bhi.n	94e <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x32>
     970:	4c09      	ldr	r4, [pc, #36]	; (998 <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare+0x7c>)
     972:	4669      	mov	r1, sp
     974:	4620      	mov	r0, r4
     976:	f7ff fcf0 	bl	35a <drv_eth_mac_address_set>
     97a:	6822      	ldr	r2, [r4, #0]
     97c:	6813      	ldr	r3, [r2, #0]
     97e:	f043 0302 	orr.w	r3, r3, #2
     982:	6013      	str	r3, [r2, #0]
     984:	6822      	ldr	r2, [r4, #0]
     986:	6813      	ldr	r3, [r2, #0]
     988:	f023 0302 	bic.w	r3, r3, #2
     98c:	6013      	str	r3, [r2, #0]
     98e:	b002      	add	sp, #8
     990:	bd10      	pop	{r4, pc}
     992:	bf00      	nop
     994:	00000f04 	andeq	r0, r0, r4, lsl #30
     998:	000200d8 	ldrdeq	r0, [r2], -r8
     99c:	00020104 	andeq	r0, r2, r4, lsl #2
     9a0:	00020084 	andeq	r0, r2, r4, lsl #1

000009a4 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare>:
     9a4:	b530      	push	{r4, r5, lr}
     9a6:	b083      	sub	sp, #12
     9a8:	4b1b      	ldr	r3, [pc, #108]	; (a18 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x74>)
     9aa:	e893 0003 	ldmia.w	r3, {r0, r1}
     9ae:	9000      	str	r0, [sp, #0]
     9b0:	f8ad 1004 	strh.w	r1, [sp, #4]
     9b4:	4b19      	ldr	r3, [pc, #100]	; (a1c <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x78>)
     9b6:	2201      	movs	r2, #1
     9b8:	f883 2024 	strb.w	r2, [r3, #36]	; 0x24
     9bc:	4d18      	ldr	r5, [pc, #96]	; (a20 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x7c>)
     9be:	4628      	mov	r0, r5
     9c0:	f7ff fceb 	bl	39a <drv_eth_mac_tx_descriptor_default_config>
     9c4:	2332      	movs	r3, #50	; 0x32
     9c6:	80eb      	strh	r3, [r5, #6]
     9c8:	2302      	movs	r3, #2
     9ca:	72ab      	strb	r3, [r5, #10]
     9cc:	2400      	movs	r4, #0
     9ce:	722c      	strb	r4, [r5, #8]
     9d0:	726b      	strb	r3, [r5, #9]
     9d2:	e00b      	b.n	9ec <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x48>
     9d4:	f104 0360 	add.w	r3, r4, #96	; 0x60
     9d8:	02db      	lsls	r3, r3, #11
     9da:	4811      	ldr	r0, [pc, #68]	; (a20 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x7c>)
     9dc:	6003      	str	r3, [r0, #0]
     9de:	4911      	ldr	r1, [pc, #68]	; (a24 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x80>)
     9e0:	eb01 1104 	add.w	r1, r1, r4, lsl #4
     9e4:	f7ff fce2 	bl	3ac <drv_eth_mac_tx_descriptor_config>
     9e8:	3401      	adds	r4, #1
     9ea:	b2e4      	uxtb	r4, r4
     9ec:	4b0b      	ldr	r3, [pc, #44]	; (a1c <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x78>)
     9ee:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
     9f2:	42a3      	cmp	r3, r4
     9f4:	d8ee      	bhi.n	9d4 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x30>
     9f6:	4c09      	ldr	r4, [pc, #36]	; (a1c <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare+0x78>)
     9f8:	4669      	mov	r1, sp
     9fa:	4620      	mov	r0, r4
     9fc:	f7ff fcad 	bl	35a <drv_eth_mac_address_set>
     a00:	6822      	ldr	r2, [r4, #0]
     a02:	6813      	ldr	r3, [r2, #0]
     a04:	f043 0302 	orr.w	r3, r3, #2
     a08:	6013      	str	r3, [r2, #0]
     a0a:	6822      	ldr	r2, [r4, #0]
     a0c:	6813      	ldr	r3, [r2, #0]
     a0e:	f023 0302 	bic.w	r3, r3, #2
     a12:	6013      	str	r3, [r2, #0]
     a14:	b003      	add	sp, #12
     a16:	bd30      	pop	{r4, r5, pc}
     a18:	00000f04 	andeq	r0, r0, r4, lsl #30
     a1c:	000200d8 	ldrdeq	r0, [r2], -r8
     a20:	00020104 	andeq	r0, r2, r4, lsl #2
     a24:	00020084 	andeq	r0, r2, r4, lsl #1

00000a28 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare>:
     a28:	b510      	push	{r4, lr}
     a2a:	b082      	sub	sp, #8
     a2c:	4b1b      	ldr	r3, [pc, #108]	; (a9c <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x74>)
     a2e:	e893 0003 	ldmia.w	r3, {r0, r1}
     a32:	9000      	str	r0, [sp, #0]
     a34:	f8ad 1004 	strh.w	r1, [sp, #4]
     a38:	4b19      	ldr	r3, [pc, #100]	; (aa0 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x78>)
     a3a:	2201      	movs	r2, #1
     a3c:	f883 2024 	strb.w	r2, [r3, #36]	; 0x24
     a40:	4c18      	ldr	r4, [pc, #96]	; (aa4 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x7c>)
     a42:	4620      	mov	r0, r4
     a44:	f7ff fca9 	bl	39a <drv_eth_mac_tx_descriptor_default_config>
     a48:	2340      	movs	r3, #64	; 0x40
     a4a:	80e3      	strh	r3, [r4, #6]
     a4c:	2302      	movs	r3, #2
     a4e:	72a3      	strb	r3, [r4, #10]
     a50:	7223      	strb	r3, [r4, #8]
     a52:	7263      	strb	r3, [r4, #9]
     a54:	2400      	movs	r4, #0
     a56:	e00b      	b.n	a70 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x48>
     a58:	f104 0360 	add.w	r3, r4, #96	; 0x60
     a5c:	02db      	lsls	r3, r3, #11
     a5e:	4811      	ldr	r0, [pc, #68]	; (aa4 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x7c>)
     a60:	6003      	str	r3, [r0, #0]
     a62:	4911      	ldr	r1, [pc, #68]	; (aa8 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x80>)
     a64:	eb01 1104 	add.w	r1, r1, r4, lsl #4
     a68:	f7ff fca0 	bl	3ac <drv_eth_mac_tx_descriptor_config>
     a6c:	3401      	adds	r4, #1
     a6e:	b2e4      	uxtb	r4, r4
     a70:	4b0b      	ldr	r3, [pc, #44]	; (aa0 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x78>)
     a72:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
     a76:	42a3      	cmp	r3, r4
     a78:	d8ee      	bhi.n	a58 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x30>
     a7a:	4c09      	ldr	r4, [pc, #36]	; (aa0 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare+0x78>)
     a7c:	4669      	mov	r1, sp
     a7e:	4620      	mov	r0, r4
     a80:	f7ff fc6b 	bl	35a <drv_eth_mac_address_set>
     a84:	6822      	ldr	r2, [r4, #0]
     a86:	6813      	ldr	r3, [r2, #0]
     a88:	f043 0302 	orr.w	r3, r3, #2
     a8c:	6013      	str	r3, [r2, #0]
     a8e:	6822      	ldr	r2, [r4, #0]
     a90:	6813      	ldr	r3, [r2, #0]
     a92:	f023 0302 	bic.w	r3, r3, #2
     a96:	6013      	str	r3, [r2, #0]
     a98:	b002      	add	sp, #8
     a9a:	bd10      	pop	{r4, pc}
     a9c:	00000f04 	andeq	r0, r0, r4, lsl #30
     aa0:	000200d8 	ldrdeq	r0, [r2], -r8
     aa4:	00020104 	andeq	r0, r2, r4, lsl #2
     aa8:	00020084 	andeq	r0, r2, r4, lsl #1

00000aac <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare>:
     aac:	b530      	push	{r4, r5, lr}
     aae:	b083      	sub	sp, #12
     ab0:	4b1b      	ldr	r3, [pc, #108]	; (b20 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x74>)
     ab2:	e893 0003 	ldmia.w	r3, {r0, r1}
     ab6:	9000      	str	r0, [sp, #0]
     ab8:	f8ad 1004 	strh.w	r1, [sp, #4]
     abc:	4b19      	ldr	r3, [pc, #100]	; (b24 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x78>)
     abe:	2201      	movs	r2, #1
     ac0:	f883 2024 	strb.w	r2, [r3, #36]	; 0x24
     ac4:	4d18      	ldr	r5, [pc, #96]	; (b28 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x7c>)
     ac6:	4628      	mov	r0, r5
     ac8:	f7ff fc67 	bl	39a <drv_eth_mac_tx_descriptor_default_config>
     acc:	236d      	movs	r3, #109	; 0x6d
     ace:	80eb      	strh	r3, [r5, #6]
     ad0:	2302      	movs	r3, #2
     ad2:	72ab      	strb	r3, [r5, #10]
     ad4:	2400      	movs	r4, #0
     ad6:	722c      	strb	r4, [r5, #8]
     ad8:	726b      	strb	r3, [r5, #9]
     ada:	e00b      	b.n	af4 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x48>
     adc:	f104 0360 	add.w	r3, r4, #96	; 0x60
     ae0:	02db      	lsls	r3, r3, #11
     ae2:	4811      	ldr	r0, [pc, #68]	; (b28 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x7c>)
     ae4:	6003      	str	r3, [r0, #0]
     ae6:	4911      	ldr	r1, [pc, #68]	; (b2c <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x80>)
     ae8:	eb01 1104 	add.w	r1, r1, r4, lsl #4
     aec:	f7ff fc5e 	bl	3ac <drv_eth_mac_tx_descriptor_config>
     af0:	3401      	adds	r4, #1
     af2:	b2e4      	uxtb	r4, r4
     af4:	4b0b      	ldr	r3, [pc, #44]	; (b24 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x78>)
     af6:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
     afa:	42a3      	cmp	r3, r4
     afc:	d8ee      	bhi.n	adc <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x30>
     afe:	4c09      	ldr	r4, [pc, #36]	; (b24 <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare+0x78>)
     b00:	4669      	mov	r1, sp
     b02:	4620      	mov	r0, r4
     b04:	f7ff fc29 	bl	35a <drv_eth_mac_address_set>
     b08:	6822      	ldr	r2, [r4, #0]
     b0a:	6813      	ldr	r3, [r2, #0]
     b0c:	f043 0302 	orr.w	r3, r3, #2
     b10:	6013      	str	r3, [r2, #0]
     b12:	6822      	ldr	r2, [r4, #0]
     b14:	6813      	ldr	r3, [r2, #0]
     b16:	f023 0302 	bic.w	r3, r3, #2
     b1a:	6013      	str	r3, [r2, #0]
     b1c:	b003      	add	sp, #12
     b1e:	bd30      	pop	{r4, r5, pc}
     b20:	00000ef4 	strdeq	r0, [r0], -r4
     b24:	000200d8 	ldrdeq	r0, [r2], -r8
     b28:	00020104 	andeq	r0, r2, r4, lsl #2
     b2c:	00020084 	andeq	r0, r2, r4, lsl #1

00000b30 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare>:
     b30:	b570      	push	{r4, r5, r6, lr}
     b32:	b082      	sub	sp, #8
     b34:	4b1b      	ldr	r3, [pc, #108]	; (ba4 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x74>)
     b36:	e893 0003 	ldmia.w	r3, {r0, r1}
     b3a:	9000      	str	r0, [sp, #0]
     b3c:	f8ad 1004 	strh.w	r1, [sp, #4]
     b40:	2601      	movs	r6, #1
     b42:	4b19      	ldr	r3, [pc, #100]	; (ba8 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x78>)
     b44:	f883 6024 	strb.w	r6, [r3, #36]	; 0x24
     b48:	4d18      	ldr	r5, [pc, #96]	; (bac <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x7c>)
     b4a:	4628      	mov	r0, r5
     b4c:	f7ff fc25 	bl	39a <drv_eth_mac_tx_descriptor_default_config>
     b50:	2363      	movs	r3, #99	; 0x63
     b52:	80eb      	strh	r3, [r5, #6]
     b54:	72ae      	strb	r6, [r5, #10]
     b56:	2400      	movs	r4, #0
     b58:	722c      	strb	r4, [r5, #8]
     b5a:	726e      	strb	r6, [r5, #9]
     b5c:	e00b      	b.n	b76 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x46>
     b5e:	f104 0360 	add.w	r3, r4, #96	; 0x60
     b62:	02db      	lsls	r3, r3, #11
     b64:	4811      	ldr	r0, [pc, #68]	; (bac <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x7c>)
     b66:	6003      	str	r3, [r0, #0]
     b68:	4911      	ldr	r1, [pc, #68]	; (bb0 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x80>)
     b6a:	eb01 1104 	add.w	r1, r1, r4, lsl #4
     b6e:	f7ff fc1d 	bl	3ac <drv_eth_mac_tx_descriptor_config>
     b72:	3401      	adds	r4, #1
     b74:	b2e4      	uxtb	r4, r4
     b76:	4b0c      	ldr	r3, [pc, #48]	; (ba8 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x78>)
     b78:	f893 3024 	ldrb.w	r3, [r3, #36]	; 0x24
     b7c:	42a3      	cmp	r3, r4
     b7e:	d8ee      	bhi.n	b5e <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x2e>
     b80:	4c09      	ldr	r4, [pc, #36]	; (ba8 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare+0x78>)
     b82:	4669      	mov	r1, sp
     b84:	4620      	mov	r0, r4
     b86:	f7ff fbe8 	bl	35a <drv_eth_mac_address_set>
     b8a:	6822      	ldr	r2, [r4, #0]
     b8c:	6813      	ldr	r3, [r2, #0]
     b8e:	f043 0302 	orr.w	r3, r3, #2
     b92:	6013      	str	r3, [r2, #0]
     b94:	6822      	ldr	r2, [r4, #0]
     b96:	6813      	ldr	r3, [r2, #0]
     b98:	f023 0302 	bic.w	r3, r3, #2
     b9c:	6013      	str	r3, [r2, #0]
     b9e:	b002      	add	sp, #8
     ba0:	bd70      	pop	{r4, r5, r6, pc}
     ba2:	bf00      	nop
     ba4:	00000ef4 	strdeq	r0, [r0], -r4
     ba8:	000200d8 	ldrdeq	r0, [r2], -r8
     bac:	00020104 	andeq	r0, r2, r4, lsl #2
     bb0:	00020084 	andeq	r0, r2, r4, lsl #1

00000bb4 <eth_mac_init>:
     bb4:	b510      	push	{r4, lr}
     bb6:	4c08      	ldr	r4, [pc, #32]	; (bd8 <eth_mac_init+0x24>)
     bb8:	4b08      	ldr	r3, [pc, #32]	; (bdc <eth_mac_init+0x28>)
     bba:	6023      	str	r3, [r4, #0]
     bbc:	4620      	mov	r0, r4
     bbe:	f7ff fafd 	bl	1bc <drv_eth_mac_dma_default_config>
     bc2:	4620      	mov	r0, r4
     bc4:	f7ff fb02 	bl	1cc <drv_eth_mac_pe_default_config>
     bc8:	4620      	mov	r0, r4
     bca:	f7ff fb50 	bl	26e <drv_eth_mac_init>
     bce:	4620      	mov	r0, r4
     bd0:	f7ff fc3a 	bl	448 <drv_eth_mac_tx_descriptor_clear>
     bd4:	bd10      	pop	{r4, pc}
     bd6:	bf00      	nop
     bd8:	000200d8 	ldrdeq	r0, [r2], -r8
     bdc:	40020030 	andmi	r0, r2, r0, lsr r0

00000be0 <eth_mac_tx_frame_data_prepare>:
     be0:	b500      	push	{lr}
     be2:	f012 0e03 	ands.w	lr, r2, #3
     be6:	d008      	beq.n	bfa <eth_mac_tx_frame_data_prepare+0x1a>
     be8:	b2d3      	uxtb	r3, r2
     bea:	eba3 0e0e 	sub.w	lr, r3, lr
     bee:	fa5f fe8e 	uxtb.w	lr, lr
     bf2:	f10e 0e04 	add.w	lr, lr, #4
     bf6:	fa5f fe8e 	uxtb.w	lr, lr
     bfa:	f04f 0c00 	mov.w	ip, #0
     bfe:	e005      	b.n	c0c <eth_mac_tx_frame_data_prepare+0x2c>
     c00:	f811 300c 	ldrb.w	r3, [r1, ip]
     c04:	f80c 3000 	strb.w	r3, [ip, r0]
     c08:	f10c 0c01 	add.w	ip, ip, #1
     c0c:	4613      	mov	r3, r2
     c0e:	4562      	cmp	r2, ip
     c10:	d8f6      	bhi.n	c00 <eth_mac_tx_frame_data_prepare+0x20>
     c12:	e002      	b.n	c1a <eth_mac_tx_frame_data_prepare+0x3a>
     c14:	2200      	movs	r2, #0
     c16:	541a      	strb	r2, [r3, r0]
     c18:	3301      	adds	r3, #1
     c1a:	459e      	cmp	lr, r3
     c1c:	d8fa      	bhi.n	c14 <eth_mac_tx_frame_data_prepare+0x34>
     c1e:	f85d fb04 	ldr.w	pc, [sp], #4
	...

00000c24 <eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement>:
     c24:	b510      	push	{r4, lr}
     c26:	2240      	movs	r2, #64	; 0x40
     c28:	490a      	ldr	r1, [pc, #40]	; (c54 <eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement+0x30>)
     c2a:	f44f 3040 	mov.w	r0, #196608	; 0x30000
     c2e:	f7ff ffd7 	bl	be0 <eth_mac_tx_frame_data_prepare>
     c32:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     c36:	2301      	movs	r3, #1
     c38:	6023      	str	r3, [r4, #0]
     c3a:	f7ff ffbb 	bl	bb4 <eth_mac_init>
     c3e:	2302      	movs	r3, #2
     c40:	6023      	str	r3, [r4, #0]
     c42:	f7ff fe6b 	bl	91c <eth_mac_descriptor_ip_igmp_frame_crc_replacement_hw_handle_prepare>
     c46:	2303      	movs	r3, #3
     c48:	6023      	str	r3, [r4, #0]
     c4a:	4903      	ldr	r1, [pc, #12]	; (c58 <eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement+0x34>)
     c4c:	4803      	ldr	r0, [pc, #12]	; (c5c <eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement+0x38>)
     c4e:	f7ff fc19 	bl	484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
     c52:	bd10      	pop	{r4, pc}
     c54:	00000f40 	andeq	r0, r0, r0, asr #30
     c58:	00020084 	andeq	r0, r2, r4, lsl #1
     c5c:	000200d8 	ldrdeq	r0, [r2], -r8

00000c60 <eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion>:
     c60:	b510      	push	{r4, lr}
     c62:	2232      	movs	r2, #50	; 0x32
     c64:	490a      	ldr	r1, [pc, #40]	; (c90 <eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion+0x30>)
     c66:	f44f 3040 	mov.w	r0, #196608	; 0x30000
     c6a:	f7ff ffb9 	bl	be0 <eth_mac_tx_frame_data_prepare>
     c6e:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     c72:	2301      	movs	r3, #1
     c74:	6023      	str	r3, [r4, #0]
     c76:	f7ff ff9d 	bl	bb4 <eth_mac_init>
     c7a:	2302      	movs	r3, #2
     c7c:	6023      	str	r3, [r4, #0]
     c7e:	f7ff fe91 	bl	9a4 <eth_mac_descriptor_ip_igmp_frame_padding_crc_insertion_hw_handle_prepare>
     c82:	2303      	movs	r3, #3
     c84:	6023      	str	r3, [r4, #0]
     c86:	4903      	ldr	r1, [pc, #12]	; (c94 <eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion+0x34>)
     c88:	4803      	ldr	r0, [pc, #12]	; (c98 <eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion+0x38>)
     c8a:	f7ff fbfb 	bl	484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
     c8e:	bd10      	pop	{r4, pc}
     c90:	00000f0c 	andeq	r0, r0, ip, lsl #30
     c94:	00020084 	andeq	r0, r2, r4, lsl #1
     c98:	000200d8 	ldrdeq	r0, [r2], -r8

00000c9c <eth_mac_tx_ip_igmp_frame_by_sw_padding_crc>:
     c9c:	b510      	push	{r4, lr}
     c9e:	2240      	movs	r2, #64	; 0x40
     ca0:	490a      	ldr	r1, [pc, #40]	; (ccc <eth_mac_tx_ip_igmp_frame_by_sw_padding_crc+0x30>)
     ca2:	f44f 3040 	mov.w	r0, #196608	; 0x30000
     ca6:	f7ff ff9b 	bl	be0 <eth_mac_tx_frame_data_prepare>
     caa:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     cae:	2301      	movs	r3, #1
     cb0:	6023      	str	r3, [r4, #0]
     cb2:	f7ff ff7f 	bl	bb4 <eth_mac_init>
     cb6:	2302      	movs	r3, #2
     cb8:	6023      	str	r3, [r4, #0]
     cba:	f7ff feb5 	bl	a28 <eth_mac_descriptor_ip_igmp_frame_padding_crc_sw_handle_prepare>
     cbe:	2303      	movs	r3, #3
     cc0:	6023      	str	r3, [r4, #0]
     cc2:	4903      	ldr	r1, [pc, #12]	; (cd0 <eth_mac_tx_ip_igmp_frame_by_sw_padding_crc+0x34>)
     cc4:	4803      	ldr	r0, [pc, #12]	; (cd4 <eth_mac_tx_ip_igmp_frame_by_sw_padding_crc+0x38>)
     cc6:	f7ff fbdd 	bl	484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
     cca:	bd10      	pop	{r4, pc}
     ccc:	00000f40 	andeq	r0, r0, r0, asr #30
     cd0:	00020084 	andeq	r0, r2, r4, lsl #1
     cd4:	000200d8 	ldrdeq	r0, [r2], -r8

00000cd8 <eth_mac_tx_ip_udp_frame2_by_hw_replacement>:
     cd8:	b510      	push	{r4, lr}
     cda:	226d      	movs	r2, #109	; 0x6d
     cdc:	490a      	ldr	r1, [pc, #40]	; (d08 <eth_mac_tx_ip_udp_frame2_by_hw_replacement+0x30>)
     cde:	f44f 3040 	mov.w	r0, #196608	; 0x30000
     ce2:	f7ff ff7d 	bl	be0 <eth_mac_tx_frame_data_prepare>
     ce6:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     cea:	2301      	movs	r3, #1
     cec:	6023      	str	r3, [r4, #0]
     cee:	f7ff ff61 	bl	bb4 <eth_mac_init>
     cf2:	2302      	movs	r3, #2
     cf4:	6023      	str	r3, [r4, #0]
     cf6:	f7ff fed9 	bl	aac <eth_mac_descriptor_ip_udp_frame2_replacement_hw_handle_prepare>
     cfa:	2303      	movs	r3, #3
     cfc:	6023      	str	r3, [r4, #0]
     cfe:	4903      	ldr	r1, [pc, #12]	; (d0c <eth_mac_tx_ip_udp_frame2_by_hw_replacement+0x34>)
     d00:	4803      	ldr	r0, [pc, #12]	; (d10 <eth_mac_tx_ip_udp_frame2_by_hw_replacement+0x38>)
     d02:	f7ff fbbf 	bl	484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
     d06:	bd10      	pop	{r4, pc}
     d08:	00000fe4 	andeq	r0, r0, r4, ror #31
     d0c:	00020084 	andeq	r0, r2, r4, lsl #1
     d10:	000200d8 	ldrdeq	r0, [r2], -r8

00000d14 <eth_mac_tx_ip_udp_frame2_by_hw_insertion>:
     d14:	b510      	push	{r4, lr}
     d16:	2263      	movs	r2, #99	; 0x63
     d18:	490a      	ldr	r1, [pc, #40]	; (d44 <eth_mac_tx_ip_udp_frame2_by_hw_insertion+0x30>)
     d1a:	f44f 3040 	mov.w	r0, #196608	; 0x30000
     d1e:	f7ff ff5f 	bl	be0 <eth_mac_tx_frame_data_prepare>
     d22:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     d26:	2301      	movs	r3, #1
     d28:	6023      	str	r3, [r4, #0]
     d2a:	f7ff ff43 	bl	bb4 <eth_mac_init>
     d2e:	2302      	movs	r3, #2
     d30:	6023      	str	r3, [r4, #0]
     d32:	f7ff fefd 	bl	b30 <eth_mac_descriptor_ip_udp_frame2_insertion_hw_handle_prepare>
     d36:	2303      	movs	r3, #3
     d38:	6023      	str	r3, [r4, #0]
     d3a:	4903      	ldr	r1, [pc, #12]	; (d48 <eth_mac_tx_ip_udp_frame2_by_hw_insertion+0x34>)
     d3c:	4803      	ldr	r0, [pc, #12]	; (d4c <eth_mac_tx_ip_udp_frame2_by_hw_insertion+0x38>)
     d3e:	f7ff fba1 	bl	484 <drv_eth_mac_set_tx_descriptor_and_tx_enable>
     d42:	bd10      	pop	{r4, pc}
     d44:	00000f80 	andeq	r0, r0, r0, lsl #31
     d48:	00020084 	andeq	r0, r2, r4, lsl #1
     d4c:	000200d8 	ldrdeq	r0, [r2], -r8

00000d50 <NMI_Handler>:
     d50:	4770      	bx	lr

00000d52 <HardFault_Handler>:
     d52:	e7fe      	b.n	d52 <HardFault_Handler>

00000d54 <MemManage_Handler>:
     d54:	e7fe      	b.n	d54 <MemManage_Handler>

00000d56 <BusFault_Handler>:
     d56:	e7fe      	b.n	d56 <BusFault_Handler>

00000d58 <UsageFault_Handler>:
     d58:	e7fe      	b.n	d58 <UsageFault_Handler>

00000d5a <SVC_Handler>:
     d5a:	4770      	bx	lr

00000d5c <DebugMon_Handler>:
     d5c:	4770      	bx	lr

00000d5e <PendSV_Handler>:
     d5e:	4770      	bx	lr

00000d60 <SysTick_Handler>:
     d60:	4770      	bx	lr
	...

00000d64 <Uart0_Handler>:
     d64:	b508      	push	{r3, lr}
     d66:	4b04      	ldr	r3, [pc, #16]	; (d78 <Uart0_Handler+0x14>)
     d68:	2201      	movs	r2, #1
     d6a:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     d6e:	4803      	ldr	r0, [pc, #12]	; (d7c <Uart0_Handler+0x18>)
     d70:	f7ff fca9 	bl	6c6 <drv_uart_interrupt_handler>
     d74:	bd08      	pop	{r3, pc}
     d76:	bf00      	nop
     d78:	e000e100 	and	lr, r0, r0, lsl #2
     d7c:	00020110 	andeq	r0, r2, r0, lsl r1

00000d80 <EthSma_Handler>:
     d80:	b508      	push	{r3, lr}
     d82:	4b04      	ldr	r3, [pc, #16]	; (d94 <EthSma_Handler+0x14>)
     d84:	f44f 5280 	mov.w	r2, #4096	; 0x1000
     d88:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     d8c:	4802      	ldr	r0, [pc, #8]	; (d98 <EthSma_Handler+0x18>)
     d8e:	f7ff f9b2 	bl	f6 <drv_eth_sma_interrupt_handler>
     d92:	bd08      	pop	{r3, pc}
     d94:	e000e100 	and	lr, r0, r0, lsl #2
     d98:	000200c4 	andeq	r0, r2, r4, asr #1

00000d9c <EthTx_Handler>:
     d9c:	b508      	push	{r3, lr}
     d9e:	4b04      	ldr	r3, [pc, #16]	; (db0 <EthTx_Handler+0x14>)
     da0:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     da4:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     da8:	4802      	ldr	r0, [pc, #8]	; (db4 <EthTx_Handler+0x18>)
     daa:	f7ff fb84 	bl	4b6 <drv_eth_mac_tx_interrupt_handler>
     dae:	bd08      	pop	{r3, pc}
     db0:	e000e100 	and	lr, r0, r0, lsl #2
     db4:	000200d8 	ldrdeq	r0, [r2], -r8

00000db8 <EthRx_Handler>:
     db8:	b508      	push	{r3, lr}
     dba:	4b04      	ldr	r3, [pc, #16]	; (dcc <EthRx_Handler+0x14>)
     dbc:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     dc0:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     dc4:	4802      	ldr	r0, [pc, #8]	; (dd0 <EthRx_Handler+0x18>)
     dc6:	f7ff fb94 	bl	4f2 <drv_eth_mac_rx_interrupt_handler>
     dca:	bd08      	pop	{r3, pc}
     dcc:	e000e100 	and	lr, r0, r0, lsl #2
     dd0:	000200d8 	ldrdeq	r0, [r2], -r8

00000dd4 <EthDma_Handler>:
     dd4:	b508      	push	{r3, lr}
     dd6:	4b04      	ldr	r3, [pc, #16]	; (de8 <EthDma_Handler+0x14>)
     dd8:	2210      	movs	r2, #16
     dda:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     dde:	4803      	ldr	r0, [pc, #12]	; (dec <EthDma_Handler+0x18>)
     de0:	f7ff fba5 	bl	52e <drv_eth_mac_dma_interrupt_handler>
     de4:	bd08      	pop	{r3, pc}
     de6:	bf00      	nop
     de8:	e000e100 	and	lr, r0, r0, lsl #2
     dec:	000200d8 	ldrdeq	r0, [r2], -r8

00000df0 <main>:
     df0:	b508      	push	{r3, lr}
     df2:	f000 f84d 	bl	e90 <uart0_init>
     df6:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     dfa:	23bd      	movs	r3, #189	; 0xbd
     dfc:	60a3      	str	r3, [r4, #8]
     dfe:	f7ff ff11 	bl	c24 <eth_mac_tx_ip_igmp_frame_by_hw_crc_replacement>
     e02:	f7ff ff2d 	bl	c60 <eth_mac_tx_ip_igmp_frame_by_hw_padding_crc_insertion>
     e06:	f7ff ff49 	bl	c9c <eth_mac_tx_ip_igmp_frame_by_sw_padding_crc>
     e0a:	f7ff ff65 	bl	cd8 <eth_mac_tx_ip_udp_frame2_by_hw_replacement>
     e0e:	f7ff ff81 	bl	d14 <eth_mac_tx_ip_udp_frame2_by_hw_insertion>
     e12:	23ed      	movs	r3, #237	; 0xed
     e14:	60a3      	str	r3, [r4, #8]
     e16:	e7fe      	b.n	e16 <main+0x26>

00000e18 <Reset_Handler>:
     e18:	490a      	ldr	r1, [pc, #40]	; (e44 <Reset_Handler+0x2c>)
     e1a:	4a0b      	ldr	r2, [pc, #44]	; (e48 <Reset_Handler+0x30>)
     e1c:	4b0b      	ldr	r3, [pc, #44]	; (e4c <Reset_Handler+0x34>)
     e1e:	1a9b      	subs	r3, r3, r2
     e20:	dd03      	ble.n	e2a <Reset_Handler+0x12>
     e22:	3b04      	subs	r3, #4
     e24:	58c8      	ldr	r0, [r1, r3]
     e26:	50d0      	str	r0, [r2, r3]
     e28:	dcfb      	bgt.n	e22 <Reset_Handler+0xa>
     e2a:	4909      	ldr	r1, [pc, #36]	; (e50 <Reset_Handler+0x38>)
     e2c:	4a09      	ldr	r2, [pc, #36]	; (e54 <Reset_Handler+0x3c>)
     e2e:	2000      	movs	r0, #0
     e30:	4291      	cmp	r1, r2
     e32:	bfbc      	itt	lt
     e34:	f841 0b04 	strlt.w	r0, [r1], #4
     e38:	e7fa      	blt.n	e30 <Reset_Handler+0x18>
     e3a:	f7ff ffd9 	bl	df0 <main>
     e3e:	f000 f837 	bl	eb0 <exit>
     e42:	105c0000 	subsne	r0, ip, r0
     e46:	00000000 	andeq	r0, r0, r0
     e4a:	00680002 	rsbeq	r0, r8, r2
     e4e:	00680002 	rsbeq	r0, r8, r2
     e52:	012c0002 			; <UNDEFINED> instruction: 0x012c0002
     e56:	e7fe0002 	ldrb	r0, [lr, r2]!
     e5a:	e7fe      	b.n	e5a <Reset_Handler+0x42>
     e5c:	e7fe      	b.n	e5c <Reset_Handler+0x44>
     e5e:	e7fe      	b.n	e5e <Reset_Handler+0x46>
     e60:	e7fe      	b.n	e60 <Reset_Handler+0x48>
     e62:	e7fe      	b.n	e62 <Reset_Handler+0x4a>
     e64:	e7fe      	b.n	e64 <Reset_Handler+0x4c>
     e66:	e7fe      	b.n	e66 <Reset_Handler+0x4e>
     e68:	e7fe      	b.n	e68 <Reset_Handler+0x50>
     e6a:	e7fe      	b.n	e6a <Reset_Handler+0x52>

00000e6c <Uart1_Handler>:
     e6c:	e7fe      	b.n	e6c <Uart1_Handler>

00000e6e <Resv2_Handler>:
     e6e:	e7fe      	b.n	e6e <Resv2_Handler>

00000e70 <Resv3_Handler>:
     e70:	e7fe      	b.n	e70 <Resv3_Handler>
     e72:	e7fe      	b.n	e72 <Resv3_Handler+0x2>

00000e74 <Gpioa_Handler>:
     e74:	e7fe      	b.n	e74 <Gpioa_Handler>

00000e76 <Resv6_Handler>:
     e76:	e7fe      	b.n	e76 <Resv6_Handler>

00000e78 <Resv7_Handler>:
     e78:	e7fe      	b.n	e78 <Resv7_Handler>

00000e7a <Bastim_Ch0_Handler>:
     e7a:	e7fe      	b.n	e7a <Bastim_Ch0_Handler>

00000e7c <Bastim_Ch1_Handler>:
     e7c:	e7fe      	b.n	e7c <Bastim_Ch1_Handler>

00000e7e <Bastim_Ch2_Handler>:
     e7e:	e7fe      	b.n	e7e <Bastim_Ch2_Handler>

00000e80 <Bastim_Ch3_Handler>:
     e80:	e7fe      	b.n	e80 <Bastim_Ch3_Handler>
     e82:	e7fe      	b.n	e82 <Bastim_Ch3_Handler+0x2>
     e84:	e7fe      	b.n	e84 <Bastim_Ch3_Handler+0x4>
     e86:	e7fe      	b.n	e86 <Bastim_Ch3_Handler+0x6>

00000e88 <Resv15_Handler>:
     e88:	e7fe      	b.n	e88 <Resv15_Handler>

00000e8a <AdvtimGen_Handler>:
     e8a:	e7fe      	b.n	e8a <AdvtimGen_Handler>

00000e8c <AdvtimCap_Handler>:
     e8c:	e7fe      	b.n	e8c <AdvtimCap_Handler>
     e8e:	bf00      	nop

00000e90 <uart0_init>:
     e90:	b510      	push	{r4, lr}
     e92:	4c05      	ldr	r4, [pc, #20]	; (ea8 <uart0_init+0x18>)
     e94:	4b05      	ldr	r3, [pc, #20]	; (eac <uart0_init+0x1c>)
     e96:	6023      	str	r3, [r4, #0]
     e98:	4620      	mov	r0, r4
     e9a:	f7ff fb90 	bl	5be <drv_uart_default_config>
     e9e:	4620      	mov	r0, r4
     ea0:	f7ff fbc0 	bl	624 <drv_uart_init>
     ea4:	bd10      	pop	{r4, pc}
     ea6:	bf00      	nop
     ea8:	00020110 	andeq	r0, r2, r0, lsl r1
     eac:	40001000 	andmi	r1, r0, r0

00000eb0 <exit>:
     eb0:	b508      	push	{r3, lr}
     eb2:	4b07      	ldr	r3, [pc, #28]	; (ed0 <exit+0x20>)
     eb4:	4604      	mov	r4, r0
     eb6:	b113      	cbz	r3, ebe <exit+0xe>
     eb8:	2100      	movs	r1, #0
     eba:	f3af 8000 	nop.w
     ebe:	4b05      	ldr	r3, [pc, #20]	; (ed4 <exit+0x24>)
     ec0:	6818      	ldr	r0, [r3, #0]
     ec2:	6a83      	ldr	r3, [r0, #40]	; 0x28
     ec4:	b103      	cbz	r3, ec8 <exit+0x18>
     ec6:	4798      	blx	r3
     ec8:	4620      	mov	r0, r4
     eca:	f000 f805 	bl	ed8 <_exit>
     ece:	bf00      	nop
     ed0:	00000000 	andeq	r0, r0, r0
     ed4:	00001054 	andeq	r1, r0, r4, asr r0

00000ed8 <_exit>:
     ed8:	e7fe      	b.n	ed8 <_exit>
     eda:	bf00      	nop

00000edc <_init>:
     edc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     ede:	bf00      	nop
     ee0:	bcf8      	pop	{r3, r4, r5, r6, r7}
     ee2:	bc08      	pop	{r3}
     ee4:	469e      	mov	lr, r3
     ee6:	4770      	bx	lr

00000ee8 <_fini>:
     ee8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     eea:	bf00      	nop
     eec:	bcf8      	pop	{r3, r4, r5, r6, r7}
     eee:	bc08      	pop	{r3}
     ef0:	469e      	mov	lr, r3
     ef2:	4770      	bx	lr
     ef4:	c94ecbe0 	stmdbgt	lr, {r5, r6, r7, r8, r9, fp, lr, pc}^
     ef8:	0000cedf 	ldrdeq	ip, [r0], -pc	; <UNPREDICTABLE>
     efc:	d6290c00 	strtle	r0, [r9], -r0, lsl #24
     f00:	00009722 	andeq	r9, r0, r2, lsr #14
     f04:	85ba5000 	ldrhi	r5, [sl, #0]!
     f08:	0000b384 	andeq	fp, r0, r4, lsl #7

00000f0c <eth_igmp_hw_padding_crc_insertion_frame>:
     f0c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     f10:	0201ffff 	andeq	pc, r1, #1020	; 0x3fc
     f14:	06050403 	streq	r0, [r5], -r3, lsl #8
     f18:	00450008 	subeq	r0, r5, r8
     f1c:	01002400 	tsteq	r0, r0, lsl #8
     f20:	02010000 	andeq	r0, r1, #0
     f24:	a8c00000 	stmiage	r0, {}^	; <UNPREDICTABLE>
     f28:	00e00202 	rsceq	r0, r0, r2, lsl #4
     f2c:	00221600 	eoreq	r1, r2, r0, lsl #12
     f30:	0000fdea 	andeq	pc, r0, sl, ror #27
     f34:	00040100 	andeq	r0, r4, r0, lsl #2
     f38:	00ef0000 	rsceq	r0, pc, r0
     f3c:	00000000 	andeq	r0, r0, r0

00000f40 <eth_igmp_sw_padding_crc_frame>:
     f40:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     f44:	0201ffff 	andeq	pc, r1, #1020	; 0x3fc
     f48:	06050403 	streq	r0, [r5], -r3, lsl #8
     f4c:	00450008 	subeq	r0, r5, r8
     f50:	01002400 	tsteq	r0, r0, lsl #8
     f54:	02010000 	andeq	r0, r1, #0
     f58:	a8c00000 	stmiage	r0, {}^	; <UNPREDICTABLE>
     f5c:	00e00202 	rsceq	r0, r0, r2, lsl #4
     f60:	00221600 	eoreq	r1, r2, r0, lsl #12
     f64:	0000fdea 	andeq	pc, r0, sl, ror #27
     f68:	00040100 	andeq	r0, r4, r0, lsl #2
     f6c:	00ef0000 	rsceq	r0, pc, r0
	...
     f7c:	a3a2a1a0 			; <UNDEFINED> instruction: 0xa3a2a1a0

00000f80 <eth_udp_hw_insertion_frame2>:
     f80:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     f84:	0008ffff 	strdeq	pc, [r8], -pc	; <UNPREDICTABLE>
     f88:	5f000045 	svcpl	0x00000045
     f8c:	00001322 	andeq	r1, r0, r2, lsr #6
     f90:	45d31180 	ldrbmi	r1, [r3, #384]	; 0x180
     f94:	ffff87c6 			; <UNDEFINED> instruction: 0xffff87c6
     f98:	7909ffff 	stmdbvc	r9, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
     f9c:	4b007909 	blmi	1f3c8 <__FLASH_SIZE+0x173c8>
     fa0:	626c5f31 	rsbvs	r5, ip, #49, 30	; 0xc4
     fa4:	305f3274 	subscc	r3, pc, r4, ror r2	; <UNPREDICTABLE>
     fa8:	38323123 	ldmdacc	r2!, {r0, r1, r5, r8, ip, sp}
     fac:	30303023 	eorscc	r3, r0, r3, lsr #32
     fb0:	30303030 	eorscc	r3, r0, r0, lsr r0
     fb4:	30303030 	eorscc	r3, r0, r0, lsr r0
     fb8:	23302330 	teqcs	r0, #48, 6	; 0xc0000000
     fbc:	3a302330 	bcc	c09c84 <__StackTop+0xbe7c84>
     fc0:	32383231 	eorscc	r3, r8, #268435459	; 0x10000003
     fc4:	32323132 	eorscc	r3, r2, #-2147483636	; 0x8000000c
     fc8:	6c3a3639 	ldcvs	6, cr3, [sl], #-228	; 0xffffff1c
     fcc:	68737569 	ldmdavs	r3!, {r0, r3, r5, r6, r8, sl, ip, sp, lr}^
     fd0:	3a697875 	bcc	1a5f1ac <__StackTop+0x1a3d1ac>
     fd4:	5355494c 	cmppl	r5, #76, 18	; 0x130000
     fd8:	49585548 	ldmdbmi	r8, {r3, r6, r8, sl, ip, lr}^
     fdc:	3a43502d 	bcc	10d5098 <__StackTop+0x10b3098>
     fe0:	00003a30 	andeq	r3, r0, r0, lsr sl

00000fe4 <eth_udp_hw_replacement_frame2>:
     fe4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
     fe8:	cbe0ffff 	blgt	ff840fec <__StackTop+0xff81efec>
     fec:	cedfc94e 	vfnmagt.f16	s25, s30, s28	; <UNPREDICTABLE>
     ff0:	00450008 	subeq	r0, r5, r8
     ff4:	13225f00 			; <UNDEFINED> instruction: 0x13225f00
     ff8:	11800000 	orrne	r0, r0, r0
     ffc:	45d30000 	ldrbmi	r0, [r3]
    1000:	ffff87c6 			; <UNDEFINED> instruction: 0xffff87c6
    1004:	7909ffff 	stmdbvc	r9, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, sp, lr, pc}
    1008:	4b007909 	blmi	1f434 <__FLASH_SIZE+0x17434>
    100c:	5f310000 	svcpl	0x00310000
    1010:	3274626c 	rsbscc	r6, r4, #108, 4	; 0xc0000006
    1014:	3123305f 	qsubcc	r3, pc, r3	; <UNPREDICTABLE>
    1018:	30233832 	eorcc	r3, r3, r2, lsr r8
    101c:	30303030 	eorscc	r3, r0, r0, lsr r0
    1020:	30303030 	eorscc	r3, r0, r0, lsr r0
    1024:	23303030 	teqcs	r0, #48	; 0x30
    1028:	23302330 	teqcs	r0, #48, 6	; 0xc0000000
    102c:	32313a30 	eorscc	r3, r1, #48, 20	; 0x30000
    1030:	31323238 	teqcc	r2, r8, lsr r2
    1034:	36393232 			; <UNDEFINED> instruction: 0x36393232
    1038:	75696c3a 	strbvc	r6, [r9, #-3130]!	; 0xfffff3c6
    103c:	78756873 	ldmdavc	r5!, {r0, r1, r4, r5, r6, fp, sp, lr}^
    1040:	494c3a69 	stmdbmi	ip, {r0, r3, r5, r6, r9, fp, ip, sp}^
    1044:	55485355 	strbpl	r5, [r8, #-853]	; 0xfffffcab
    1048:	502d4958 	eorpl	r4, sp, r8, asr r9
    104c:	3a303a43 	bcc	c0f960 <__StackTop+0xbed960>
    1050:	00000000 	andeq	r0, r0, r0

00001054 <_global_impure_ptr>:
    1054:	00020000 	andeq	r0, r2, r0

00001058 <__EH_FRAME_BEGIN__>:
    1058:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <impure_data>:
	...

00020060 <__frame_dummy_init_array_entry>:
   20060:	000000ad 	andeq	r0, r0, sp, lsr #1

00020064 <__do_global_dtors_aux_fini_array_entry>:
   20064:	00000089 	andeq	r0, r0, r9, lsl #1

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
  18:	00000eb0 			; <UNDEFINED> instruction: 0x00000eb0
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000ed8 	ldrdeq	r0, [r0], -r8
  44:	00000002 	andeq	r0, r0, r2

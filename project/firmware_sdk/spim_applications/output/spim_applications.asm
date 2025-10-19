
spim_applications.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00001125 	andeq	r1, r0, r5, lsr #2
       8:	00000e39 	andeq	r0, r0, r9, lsr lr
       c:	00000e49 	andeq	r0, r0, r9, asr #28
      10:	00000e4b 	andeq	r0, r0, fp, asr #28
      14:	00000e4d 	andeq	r0, r0, sp, asr #28
      18:	00000e4f 	andeq	r0, r0, pc, asr #28
	...
      2c:	00000e51 	andeq	r0, r0, r1, asr lr
      30:	00000e53 	andeq	r0, r0, r3, asr lr
      34:	00000000 	andeq	r0, r0, r0
      38:	00000e55 	andeq	r0, r0, r5, asr lr
      3c:	00000e57 	andeq	r0, r0, r7, asr lr
      40:	00000e59 	andeq	r0, r0, r9, asr lr
      44:	00001179 	andeq	r1, r0, r9, ror r1
      48:	0000117b 	andeq	r1, r0, fp, ror r1
      4c:	0000117d 	andeq	r1, r0, sp, ror r1
      50:	0000117f 	andeq	r1, r0, pc, ror r1
      54:	00001181 	andeq	r1, r0, r1, lsl #3
      58:	00001183 	andeq	r1, r0, r3, lsl #3
      5c:	00001185 	andeq	r1, r0, r5, lsl #3
      60:	00001187 	andeq	r1, r0, r7, lsl #3
      64:	00001189 	andeq	r1, r0, r9, lsl #3
      68:	0000118b 	andeq	r1, r0, fp, lsl #3
      6c:	0000118d 	andeq	r1, r0, sp, lsl #3
      70:	0000118f 	andeq	r1, r0, pc, lsl #3
      74:	00001191 	muleq	r0, r1, r1
      78:	00001193 	muleq	r0, r3, r1
      7c:	00001195 	muleq	r0, r5, r1
      80:	00001197 	muleq	r0, r7, r1
      84:	00001199 	muleq	r0, r9, r1
      88:	0000119b 	muleq	r0, fp, r1
      8c:	00000e75 	andeq	r0, r0, r5, ror lr

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
      a8:	000204ac 	andeq	r0, r2, ip, lsr #9
      ac:	00000000 	andeq	r0, r0, r0
      b0:	00001c54 	andeq	r1, r0, r4, asr ip

000000b4 <frame_dummy>:
      b4:	b508      	push	{r3, lr}
      b6:	4b03      	ldr	r3, [pc, #12]	; (c4 <frame_dummy+0x10>)
      b8:	b11b      	cbz	r3, c2 <frame_dummy+0xe>
      ba:	4903      	ldr	r1, [pc, #12]	; (c8 <frame_dummy+0x14>)
      bc:	4803      	ldr	r0, [pc, #12]	; (cc <frame_dummy+0x18>)
      be:	f3af 8000 	nop.w
      c2:	bd08      	pop	{r3, pc}
      c4:	00000000 	andeq	r0, r0, r0
      c8:	000204b0 			; <UNDEFINED> instruction: 0x000204b0
      cc:	00001c54 	andeq	r1, r0, r4, asr ip

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

000000f2 <drv_spim_set_config>:
      f2:	b538      	push	{r3, r4, r5, lr}
      f4:	4604      	mov	r4, r0
      f6:	6843      	ldr	r3, [r0, #4]
      f8:	7a01      	ldrb	r1, [r0, #8]
      fa:	0589      	lsls	r1, r1, #22
      fc:	ea41 6103 	orr.w	r1, r1, r3, lsl #24
     100:	7a43      	ldrb	r3, [r0, #9]
     102:	ea41 5143 	orr.w	r1, r1, r3, lsl #21
     106:	7a82      	ldrb	r2, [r0, #10]
     108:	ea41 41c2 	orr.w	r1, r1, r2, lsl #19
     10c:	7ac2      	ldrb	r2, [r0, #11]
     10e:	ea41 4182 	orr.w	r1, r1, r2, lsl #18
     112:	6800      	ldr	r0, [r0, #0]
     114:	460a      	mov	r2, r1
     116:	3008      	adds	r0, #8
     118:	f7ff ffda 	bl	d0 <drv_check_rw_data>
     11c:	4605      	mov	r5, r0
     11e:	7b22      	ldrb	r2, [r4, #12]
     120:	7b61      	ldrb	r1, [r4, #13]
     122:	0109      	lsls	r1, r1, #4
     124:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
     128:	7ba2      	ldrb	r2, [r4, #14]
     12a:	4311      	orrs	r1, r2
     12c:	6820      	ldr	r0, [r4, #0]
     12e:	460a      	mov	r2, r1
     130:	300c      	adds	r0, #12
     132:	f7ff ffcd 	bl	d0 <drv_check_rw_data>
     136:	4328      	orrs	r0, r5
     138:	b2c0      	uxtb	r0, r0
     13a:	bd38      	pop	{r3, r4, r5, pc}

0000013c <drv_spim_init>:
     13c:	b538      	push	{r3, r4, r5, lr}
     13e:	4604      	mov	r4, r0
     140:	2500      	movs	r5, #0
     142:	7445      	strb	r5, [r0, #17]
     144:	7485      	strb	r5, [r0, #18]
     146:	f7ff ffd4 	bl	f2 <drv_spim_set_config>
     14a:	7465      	strb	r5, [r4, #17]
     14c:	74a5      	strb	r5, [r4, #18]
     14e:	6822      	ldr	r2, [r4, #0]
     150:	6853      	ldr	r3, [r2, #4]
     152:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     156:	6053      	str	r3, [r2, #4]
     158:	6822      	ldr	r2, [r4, #0]
     15a:	6853      	ldr	r3, [r2, #4]
     15c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     160:	6053      	str	r3, [r2, #4]
     162:	6822      	ldr	r2, [r4, #0]
     164:	6853      	ldr	r3, [r2, #4]
     166:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     16a:	6053      	str	r3, [r2, #4]
     16c:	6823      	ldr	r3, [r4, #0]
     16e:	223f      	movs	r2, #63	; 0x3f
     170:	619a      	str	r2, [r3, #24]
     172:	6822      	ldr	r2, [r4, #0]
     174:	6853      	ldr	r3, [r2, #4]
     176:	f043 0301 	orr.w	r3, r3, #1
     17a:	6053      	str	r3, [r2, #4]
     17c:	bd38      	pop	{r3, r4, r5, pc}

0000017e <drv_spim_deinit>:
     17e:	2300      	movs	r3, #0
     180:	7443      	strb	r3, [r0, #17]
     182:	7483      	strb	r3, [r0, #18]
     184:	6802      	ldr	r2, [r0, #0]
     186:	6853      	ldr	r3, [r2, #4]
     188:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     18c:	6053      	str	r3, [r2, #4]
     18e:	6802      	ldr	r2, [r0, #0]
     190:	6853      	ldr	r3, [r2, #4]
     192:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     196:	6053      	str	r3, [r2, #4]
     198:	6802      	ldr	r2, [r0, #0]
     19a:	6853      	ldr	r3, [r2, #4]
     19c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     1a0:	6053      	str	r3, [r2, #4]
     1a2:	6803      	ldr	r3, [r0, #0]
     1a4:	223f      	movs	r2, #63	; 0x3f
     1a6:	619a      	str	r2, [r3, #24]
     1a8:	6802      	ldr	r2, [r0, #0]
     1aa:	6853      	ldr	r3, [r2, #4]
     1ac:	f023 0302 	bic.w	r3, r3, #2
     1b0:	6053      	str	r3, [r2, #4]
     1b2:	6802      	ldr	r2, [r0, #0]
     1b4:	6913      	ldr	r3, [r2, #16]
     1b6:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
     1ba:	6113      	str	r3, [r2, #16]
     1bc:	4770      	bx	lr

000001be <drv_spim_tx_data>:
     1be:	b430      	push	{r4, r5}
     1c0:	2300      	movs	r3, #0
     1c2:	7443      	strb	r3, [r0, #17]
     1c4:	6804      	ldr	r4, [r0, #0]
     1c6:	68a3      	ldr	r3, [r4, #8]
     1c8:	f423 2300 	bic.w	r3, r3, #524288	; 0x80000
     1cc:	60a3      	str	r3, [r4, #8]
     1ce:	6804      	ldr	r4, [r0, #0]
     1d0:	68a3      	ldr	r3, [r4, #8]
     1d2:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
     1d6:	60a3      	str	r3, [r4, #8]
     1d8:	6804      	ldr	r4, [r0, #0]
     1da:	6923      	ldr	r3, [r4, #16]
     1dc:	f023 03ff 	bic.w	r3, r3, #255	; 0xff
     1e0:	4313      	orrs	r3, r2
     1e2:	6123      	str	r3, [r4, #16]
     1e4:	6804      	ldr	r4, [r0, #0]
     1e6:	6923      	ldr	r3, [r4, #16]
     1e8:	f423 437f 	bic.w	r3, r3, #65280	; 0xff00
     1ec:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
     1f0:	6123      	str	r3, [r4, #16]
     1f2:	6804      	ldr	r4, [r0, #0]
     1f4:	6863      	ldr	r3, [r4, #4]
     1f6:	f043 0301 	orr.w	r3, r3, #1
     1fa:	6063      	str	r3, [r4, #4]
     1fc:	2a10      	cmp	r2, #16
     1fe:	d91b      	bls.n	238 <Stack_Size+0x38>
     200:	2510      	movs	r5, #16
     202:	e004      	b.n	20e <Stack_Size+0xe>
     204:	1c5c      	adds	r4, r3, #1
     206:	7444      	strb	r4, [r0, #17]
     208:	6804      	ldr	r4, [r0, #0]
     20a:	5ccb      	ldrb	r3, [r1, r3]
     20c:	6023      	str	r3, [r4, #0]
     20e:	7c43      	ldrb	r3, [r0, #17]
     210:	42ab      	cmp	r3, r5
     212:	d3f7      	bcc.n	204 <Stack_Size+0x4>
     214:	6804      	ldr	r4, [r0, #0]
     216:	6863      	ldr	r3, [r4, #4]
     218:	f043 0302 	orr.w	r3, r3, #2
     21c:	6063      	str	r3, [r4, #4]
     21e:	7c43      	ldrb	r3, [r0, #17]
     220:	4293      	cmp	r3, r2
     222:	d20b      	bcs.n	23c <Stack_Size+0x3c>
     224:	6804      	ldr	r4, [r0, #0]
     226:	69e5      	ldr	r5, [r4, #28]
     228:	f415 5f80 	tst.w	r5, #4096	; 0x1000
     22c:	d1f7      	bne.n	21e <Stack_Size+0x1e>
     22e:	1c5d      	adds	r5, r3, #1
     230:	7445      	strb	r5, [r0, #17]
     232:	5ccb      	ldrb	r3, [r1, r3]
     234:	6023      	str	r3, [r4, #0]
     236:	e7f2      	b.n	21e <Stack_Size+0x1e>
     238:	4615      	mov	r5, r2
     23a:	e7e8      	b.n	20e <Stack_Size+0xe>
     23c:	6803      	ldr	r3, [r0, #0]
     23e:	6a1a      	ldr	r2, [r3, #32]
     240:	f012 0f20 	tst.w	r2, #32
     244:	d0fa      	beq.n	23c <Stack_Size+0x3c>
     246:	699a      	ldr	r2, [r3, #24]
     248:	f042 0220 	orr.w	r2, r2, #32
     24c:	619a      	str	r2, [r3, #24]
     24e:	6802      	ldr	r2, [r0, #0]
     250:	6853      	ldr	r3, [r2, #4]
     252:	f023 0302 	bic.w	r3, r3, #2
     256:	6053      	str	r3, [r2, #4]
     258:	2300      	movs	r3, #0
     25a:	7443      	strb	r3, [r0, #17]
     25c:	bc30      	pop	{r4, r5}
     25e:	4770      	bx	lr

00000260 <drv_spim_trans_data_with_pending>:
     260:	b510      	push	{r4, lr}
     262:	468c      	mov	ip, r1
     264:	469e      	mov	lr, r3
     266:	2300      	movs	r3, #0
     268:	7443      	strb	r3, [r0, #17]
     26a:	7483      	strb	r3, [r0, #18]
     26c:	6801      	ldr	r1, [r0, #0]
     26e:	688b      	ldr	r3, [r1, #8]
     270:	f423 2300 	bic.w	r3, r3, #524288	; 0x80000
     274:	608b      	str	r3, [r1, #8]
     276:	6801      	ldr	r1, [r0, #0]
     278:	688b      	ldr	r3, [r1, #8]
     27a:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
     27e:	608b      	str	r3, [r1, #8]
     280:	6801      	ldr	r1, [r0, #0]
     282:	690b      	ldr	r3, [r1, #16]
     284:	f023 03ff 	bic.w	r3, r3, #255	; 0xff
     288:	ea43 030e 	orr.w	r3, r3, lr
     28c:	610b      	str	r3, [r1, #16]
     28e:	6801      	ldr	r1, [r0, #0]
     290:	690b      	ldr	r3, [r1, #16]
     292:	f423 437f 	bic.w	r3, r3, #65280	; 0xff00
     296:	ea43 230e 	orr.w	r3, r3, lr, lsl #8
     29a:	610b      	str	r3, [r1, #16]
     29c:	6801      	ldr	r1, [r0, #0]
     29e:	690b      	ldr	r3, [r1, #16]
     2a0:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     2a4:	610b      	str	r3, [r1, #16]
     2a6:	6801      	ldr	r1, [r0, #0]
     2a8:	684b      	ldr	r3, [r1, #4]
     2aa:	f043 0301 	orr.w	r3, r3, #1
     2ae:	604b      	str	r3, [r1, #4]
     2b0:	f1be 0f10 	cmp.w	lr, #16
     2b4:	d90a      	bls.n	2cc <drv_spim_trans_data_with_pending+0x6c>
     2b6:	2410      	movs	r4, #16
     2b8:	7c43      	ldrb	r3, [r0, #17]
     2ba:	42a3      	cmp	r3, r4
     2bc:	d208      	bcs.n	2d0 <drv_spim_trans_data_with_pending+0x70>
     2be:	1c59      	adds	r1, r3, #1
     2c0:	7441      	strb	r1, [r0, #17]
     2c2:	6801      	ldr	r1, [r0, #0]
     2c4:	f81c 3003 	ldrb.w	r3, [ip, r3]
     2c8:	600b      	str	r3, [r1, #0]
     2ca:	e7f5      	b.n	2b8 <drv_spim_trans_data_with_pending+0x58>
     2cc:	4674      	mov	r4, lr
     2ce:	e7f3      	b.n	2b8 <drv_spim_trans_data_with_pending+0x58>
     2d0:	6801      	ldr	r1, [r0, #0]
     2d2:	684b      	ldr	r3, [r1, #4]
     2d4:	f043 0302 	orr.w	r3, r3, #2
     2d8:	604b      	str	r3, [r1, #4]
     2da:	e004      	b.n	2e6 <drv_spim_trans_data_with_pending+0x86>
     2dc:	6803      	ldr	r3, [r0, #0]
     2de:	6a19      	ldr	r1, [r3, #32]
     2e0:	f011 0f10 	tst.w	r1, #16
     2e4:	d117      	bne.n	316 <drv_spim_trans_data_with_pending+0xb6>
     2e6:	7c43      	ldrb	r3, [r0, #17]
     2e8:	4573      	cmp	r3, lr
     2ea:	d26b      	bcs.n	3c4 <drv_spim_trans_data_with_pending+0x164>
     2ec:	6801      	ldr	r1, [r0, #0]
     2ee:	69cc      	ldr	r4, [r1, #28]
     2f0:	f414 5f80 	tst.w	r4, #4096	; 0x1000
     2f4:	d104      	bne.n	300 <drv_spim_trans_data_with_pending+0xa0>
     2f6:	1c5c      	adds	r4, r3, #1
     2f8:	7444      	strb	r4, [r0, #17]
     2fa:	f81c 3003 	ldrb.w	r3, [ip, r3]
     2fe:	600b      	str	r3, [r1, #0]
     300:	6803      	ldr	r3, [r0, #0]
     302:	69d9      	ldr	r1, [r3, #28]
     304:	f011 0f1f 	tst.w	r1, #31
     308:	d0e8      	beq.n	2dc <drv_spim_trans_data_with_pending+0x7c>
     30a:	6a59      	ldr	r1, [r3, #36]	; 0x24
     30c:	7c83      	ldrb	r3, [r0, #18]
     30e:	1c5c      	adds	r4, r3, #1
     310:	7484      	strb	r4, [r0, #18]
     312:	54d1      	strb	r1, [r2, r3]
     314:	e7e2      	b.n	2dc <drv_spim_trans_data_with_pending+0x7c>
     316:	6919      	ldr	r1, [r3, #16]
     318:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
     31c:	6119      	str	r1, [r3, #16]
     31e:	6801      	ldr	r1, [r0, #0]
     320:	698b      	ldr	r3, [r1, #24]
     322:	f043 0310 	orr.w	r3, r3, #16
     326:	618b      	str	r3, [r1, #24]
     328:	e005      	b.n	336 <drv_spim_trans_data_with_pending+0xd6>
     32a:	1c59      	adds	r1, r3, #1
     32c:	7441      	strb	r1, [r0, #17]
     32e:	6801      	ldr	r1, [r0, #0]
     330:	f81c 3003 	ldrb.w	r3, [ip, r3]
     334:	600b      	str	r3, [r1, #0]
     336:	6803      	ldr	r3, [r0, #0]
     338:	69db      	ldr	r3, [r3, #28]
     33a:	f413 5f80 	tst.w	r3, #4096	; 0x1000
     33e:	d106      	bne.n	34e <drv_spim_trans_data_with_pending+0xee>
     340:	7c41      	ldrb	r1, [r0, #17]
     342:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     346:	6059      	str	r1, [r3, #4]
     348:	7c43      	ldrb	r3, [r0, #17]
     34a:	4573      	cmp	r3, lr
     34c:	d1ed      	bne.n	32a <drv_spim_trans_data_with_pending+0xca>
     34e:	6803      	ldr	r3, [r0, #0]
     350:	69db      	ldr	r3, [r3, #28]
     352:	f013 0f1f 	tst.w	r3, #31
     356:	d00c      	beq.n	372 <drv_spim_trans_data_with_pending+0x112>
     358:	7c81      	ldrb	r1, [r0, #18]
     35a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     35e:	60d9      	str	r1, [r3, #12]
     360:	7c83      	ldrb	r3, [r0, #18]
     362:	4573      	cmp	r3, lr
     364:	d005      	beq.n	372 <drv_spim_trans_data_with_pending+0x112>
     366:	6801      	ldr	r1, [r0, #0]
     368:	6a49      	ldr	r1, [r1, #36]	; 0x24
     36a:	1c5c      	adds	r4, r3, #1
     36c:	7484      	strb	r4, [r0, #18]
     36e:	54d1      	strb	r1, [r2, r3]
     370:	e7ed      	b.n	34e <drv_spim_trans_data_with_pending+0xee>
     372:	6801      	ldr	r1, [r0, #0]
     374:	690b      	ldr	r3, [r1, #16]
     376:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
     37a:	610b      	str	r3, [r1, #16]
     37c:	e7b3      	b.n	2e6 <drv_spim_trans_data_with_pending+0x86>
     37e:	6919      	ldr	r1, [r3, #16]
     380:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
     384:	6119      	str	r1, [r3, #16]
     386:	6801      	ldr	r1, [r0, #0]
     388:	698b      	ldr	r3, [r1, #24]
     38a:	f043 0310 	orr.w	r3, r3, #16
     38e:	618b      	str	r3, [r1, #24]
     390:	e006      	b.n	3a0 <drv_spim_trans_data_with_pending+0x140>
     392:	6801      	ldr	r1, [r0, #0]
     394:	6a49      	ldr	r1, [r1, #36]	; 0x24
     396:	f103 0c01 	add.w	ip, r3, #1
     39a:	f880 c012 	strb.w	ip, [r0, #18]
     39e:	54d1      	strb	r1, [r2, r3]
     3a0:	6803      	ldr	r3, [r0, #0]
     3a2:	69db      	ldr	r3, [r3, #28]
     3a4:	f013 0f1f 	tst.w	r3, #31
     3a8:	d006      	beq.n	3b8 <drv_spim_trans_data_with_pending+0x158>
     3aa:	7c81      	ldrb	r1, [r0, #18]
     3ac:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     3b0:	60d9      	str	r1, [r3, #12]
     3b2:	7c83      	ldrb	r3, [r0, #18]
     3b4:	4573      	cmp	r3, lr
     3b6:	d1ec      	bne.n	392 <drv_spim_trans_data_with_pending+0x132>
     3b8:	6801      	ldr	r1, [r0, #0]
     3ba:	690b      	ldr	r3, [r1, #16]
     3bc:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
     3c0:	610b      	str	r3, [r1, #16]
     3c2:	e007      	b.n	3d4 <drv_spim_trans_data_with_pending+0x174>
     3c4:	7c83      	ldrb	r3, [r0, #18]
     3c6:	4573      	cmp	r3, lr
     3c8:	d218      	bcs.n	3fc <drv_spim_trans_data_with_pending+0x19c>
     3ca:	6803      	ldr	r3, [r0, #0]
     3cc:	6a19      	ldr	r1, [r3, #32]
     3ce:	f011 0f10 	tst.w	r1, #16
     3d2:	d1d4      	bne.n	37e <drv_spim_trans_data_with_pending+0x11e>
     3d4:	6801      	ldr	r1, [r0, #0]
     3d6:	69c9      	ldr	r1, [r1, #28]
     3d8:	f011 0f1f 	tst.w	r1, #31
     3dc:	d0f2      	beq.n	3c4 <drv_spim_trans_data_with_pending+0x164>
     3de:	7c83      	ldrb	r3, [r0, #18]
     3e0:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     3e4:	60cb      	str	r3, [r1, #12]
     3e6:	7c81      	ldrb	r1, [r0, #18]
     3e8:	4571      	cmp	r1, lr
     3ea:	d0eb      	beq.n	3c4 <drv_spim_trans_data_with_pending+0x164>
     3ec:	6803      	ldr	r3, [r0, #0]
     3ee:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     3f0:	f101 0c01 	add.w	ip, r1, #1
     3f4:	f880 c012 	strb.w	ip, [r0, #18]
     3f8:	5453      	strb	r3, [r2, r1]
     3fa:	e7eb      	b.n	3d4 <drv_spim_trans_data_with_pending+0x174>
     3fc:	6803      	ldr	r3, [r0, #0]
     3fe:	6a1a      	ldr	r2, [r3, #32]
     400:	f012 0f20 	tst.w	r2, #32
     404:	d0fa      	beq.n	3fc <drv_spim_trans_data_with_pending+0x19c>
     406:	699a      	ldr	r2, [r3, #24]
     408:	f042 0220 	orr.w	r2, r2, #32
     40c:	619a      	str	r2, [r3, #24]
     40e:	6802      	ldr	r2, [r0, #0]
     410:	6913      	ldr	r3, [r2, #16]
     412:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
     416:	6113      	str	r3, [r2, #16]
     418:	6802      	ldr	r2, [r0, #0]
     41a:	6853      	ldr	r3, [r2, #4]
     41c:	f023 0302 	bic.w	r3, r3, #2
     420:	6053      	str	r3, [r2, #4]
     422:	2300      	movs	r3, #0
     424:	7443      	strb	r3, [r0, #17]
     426:	7483      	strb	r3, [r0, #18]
     428:	bd10      	pop	{r4, pc}

0000042a <drv_spim_trans_frame_with_pending>:
     42a:	b5f0      	push	{r4, r5, r6, r7, lr}
     42c:	460c      	mov	r4, r1
     42e:	461f      	mov	r7, r3
     430:	f89d 3014 	ldrb.w	r3, [sp, #20]
     434:	2100      	movs	r1, #0
     436:	7441      	strb	r1, [r0, #17]
     438:	7481      	strb	r1, [r0, #18]
     43a:	6805      	ldr	r5, [r0, #0]
     43c:	68a9      	ldr	r1, [r5, #8]
     43e:	f421 2100 	bic.w	r1, r1, #524288	; 0x80000
     442:	60a9      	str	r1, [r5, #8]
     444:	6805      	ldr	r5, [r0, #0]
     446:	68a9      	ldr	r1, [r5, #8]
     448:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
     44c:	60a9      	str	r1, [r5, #8]
     44e:	6805      	ldr	r5, [r0, #0]
     450:	6929      	ldr	r1, [r5, #16]
     452:	f021 01ff 	bic.w	r1, r1, #255	; 0xff
     456:	4339      	orrs	r1, r7
     458:	6129      	str	r1, [r5, #16]
     45a:	6805      	ldr	r5, [r0, #0]
     45c:	6929      	ldr	r1, [r5, #16]
     45e:	f421 417f 	bic.w	r1, r1, #65280	; 0xff00
     462:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     466:	6129      	str	r1, [r5, #16]
     468:	6805      	ldr	r5, [r0, #0]
     46a:	68a9      	ldr	r1, [r5, #8]
     46c:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
     470:	60a9      	str	r1, [r5, #8]
     472:	6805      	ldr	r5, [r0, #0]
     474:	6929      	ldr	r1, [r5, #16]
     476:	f441 3180 	orr.w	r1, r1, #65536	; 0x10000
     47a:	6129      	str	r1, [r5, #16]
     47c:	6805      	ldr	r5, [r0, #0]
     47e:	6869      	ldr	r1, [r5, #4]
     480:	f041 0101 	orr.w	r1, r1, #1
     484:	6069      	str	r1, [r5, #4]
     486:	eba7 0e03 	sub.w	lr, r7, r3
     48a:	fa5f fe8e 	uxtb.w	lr, lr
     48e:	2b10      	cmp	r3, #16
     490:	d914      	bls.n	4bc <drv_spim_trans_frame_with_pending+0x92>
     492:	2610      	movs	r6, #16
     494:	e006      	b.n	4a4 <drv_spim_trans_frame_with_pending+0x7a>
     496:	f10c 0101 	add.w	r1, ip, #1
     49a:	7441      	strb	r1, [r0, #17]
     49c:	6801      	ldr	r1, [r0, #0]
     49e:	f814 500c 	ldrb.w	r5, [r4, ip]
     4a2:	600d      	str	r5, [r1, #0]
     4a4:	f890 c011 	ldrb.w	ip, [r0, #17]
     4a8:	45b4      	cmp	ip, r6
     4aa:	d3f4      	bcc.n	496 <drv_spim_trans_frame_with_pending+0x6c>
     4ac:	6805      	ldr	r5, [r0, #0]
     4ae:	6869      	ldr	r1, [r5, #4]
     4b0:	f041 0102 	orr.w	r1, r1, #2
     4b4:	6069      	str	r1, [r5, #4]
     4b6:	429f      	cmp	r7, r3
     4b8:	d140      	bne.n	53c <drv_spim_trans_frame_with_pending+0x112>
     4ba:	e006      	b.n	4ca <drv_spim_trans_frame_with_pending+0xa0>
     4bc:	461e      	mov	r6, r3
     4be:	e7f1      	b.n	4a4 <drv_spim_trans_frame_with_pending+0x7a>
     4c0:	6802      	ldr	r2, [r0, #0]
     4c2:	6a11      	ldr	r1, [r2, #32]
     4c4:	f011 0f10 	tst.w	r1, #16
     4c8:	d112      	bne.n	4f0 <drv_spim_trans_frame_with_pending+0xc6>
     4ca:	7c42      	ldrb	r2, [r0, #17]
     4cc:	429a      	cmp	r2, r3
     4ce:	f080 80cc 	bcs.w	66a <drv_spim_trans_frame_with_pending+0x240>
     4d2:	6801      	ldr	r1, [r0, #0]
     4d4:	69c9      	ldr	r1, [r1, #28]
     4d6:	f411 5f80 	tst.w	r1, #4096	; 0x1000
     4da:	d1f1      	bne.n	4c0 <drv_spim_trans_frame_with_pending+0x96>
     4dc:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     4e0:	604a      	str	r2, [r1, #4]
     4e2:	7c42      	ldrb	r2, [r0, #17]
     4e4:	1c51      	adds	r1, r2, #1
     4e6:	7441      	strb	r1, [r0, #17]
     4e8:	6801      	ldr	r1, [r0, #0]
     4ea:	5ca2      	ldrb	r2, [r4, r2]
     4ec:	600a      	str	r2, [r1, #0]
     4ee:	e7e7      	b.n	4c0 <drv_spim_trans_frame_with_pending+0x96>
     4f0:	6911      	ldr	r1, [r2, #16]
     4f2:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
     4f6:	6111      	str	r1, [r2, #16]
     4f8:	6801      	ldr	r1, [r0, #0]
     4fa:	698a      	ldr	r2, [r1, #24]
     4fc:	f042 0210 	orr.w	r2, r2, #16
     500:	618a      	str	r2, [r1, #24]
     502:	6802      	ldr	r2, [r0, #0]
     504:	69d2      	ldr	r2, [r2, #28]
     506:	f412 5f80 	tst.w	r2, #4096	; 0x1000
     50a:	d10c      	bne.n	526 <drv_spim_trans_frame_with_pending+0xfc>
     50c:	7c41      	ldrb	r1, [r0, #17]
     50e:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
     512:	6051      	str	r1, [r2, #4]
     514:	7c42      	ldrb	r2, [r0, #17]
     516:	429a      	cmp	r2, r3
     518:	d005      	beq.n	526 <drv_spim_trans_frame_with_pending+0xfc>
     51a:	1c51      	adds	r1, r2, #1
     51c:	7441      	strb	r1, [r0, #17]
     51e:	6801      	ldr	r1, [r0, #0]
     520:	5ca2      	ldrb	r2, [r4, r2]
     522:	600a      	str	r2, [r1, #0]
     524:	e7ed      	b.n	502 <drv_spim_trans_frame_with_pending+0xd8>
     526:	6801      	ldr	r1, [r0, #0]
     528:	690a      	ldr	r2, [r1, #16]
     52a:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
     52e:	610a      	str	r2, [r1, #16]
     530:	e7cb      	b.n	4ca <drv_spim_trans_frame_with_pending+0xa0>
     532:	6801      	ldr	r1, [r0, #0]
     534:	6a0d      	ldr	r5, [r1, #32]
     536:	f015 0f10 	tst.w	r5, #16
     53a:	d122      	bne.n	582 <drv_spim_trans_frame_with_pending+0x158>
     53c:	7c41      	ldrb	r1, [r0, #17]
     53e:	4299      	cmp	r1, r3
     540:	d277      	bcs.n	632 <drv_spim_trans_frame_with_pending+0x208>
     542:	6805      	ldr	r5, [r0, #0]
     544:	69ed      	ldr	r5, [r5, #28]
     546:	f415 5f80 	tst.w	r5, #4096	; 0x1000
     54a:	d108      	bne.n	55e <drv_spim_trans_frame_with_pending+0x134>
     54c:	f04f 4580 	mov.w	r5, #1073741824	; 0x40000000
     550:	6069      	str	r1, [r5, #4]
     552:	7c41      	ldrb	r1, [r0, #17]
     554:	1c4d      	adds	r5, r1, #1
     556:	7445      	strb	r5, [r0, #17]
     558:	6805      	ldr	r5, [r0, #0]
     55a:	5c61      	ldrb	r1, [r4, r1]
     55c:	6029      	str	r1, [r5, #0]
     55e:	6801      	ldr	r1, [r0, #0]
     560:	69c9      	ldr	r1, [r1, #28]
     562:	f011 0f1f 	tst.w	r1, #31
     566:	d0e4      	beq.n	532 <drv_spim_trans_frame_with_pending+0x108>
     568:	7c85      	ldrb	r5, [r0, #18]
     56a:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     56e:	60cd      	str	r5, [r1, #12]
     570:	6801      	ldr	r1, [r0, #0]
     572:	6a4d      	ldr	r5, [r1, #36]	; 0x24
     574:	7c81      	ldrb	r1, [r0, #18]
     576:	f101 0c01 	add.w	ip, r1, #1
     57a:	f880 c012 	strb.w	ip, [r0, #18]
     57e:	5455      	strb	r5, [r2, r1]
     580:	e7d7      	b.n	532 <drv_spim_trans_frame_with_pending+0x108>
     582:	690d      	ldr	r5, [r1, #16]
     584:	f425 3500 	bic.w	r5, r5, #131072	; 0x20000
     588:	610d      	str	r5, [r1, #16]
     58a:	6805      	ldr	r5, [r0, #0]
     58c:	69a9      	ldr	r1, [r5, #24]
     58e:	f041 0110 	orr.w	r1, r1, #16
     592:	61a9      	str	r1, [r5, #24]
     594:	e004      	b.n	5a0 <drv_spim_trans_frame_with_pending+0x176>
     596:	1c4d      	adds	r5, r1, #1
     598:	7445      	strb	r5, [r0, #17]
     59a:	6805      	ldr	r5, [r0, #0]
     59c:	5c61      	ldrb	r1, [r4, r1]
     59e:	6029      	str	r1, [r5, #0]
     5a0:	6801      	ldr	r1, [r0, #0]
     5a2:	69c9      	ldr	r1, [r1, #28]
     5a4:	f411 5f80 	tst.w	r1, #4096	; 0x1000
     5a8:	d106      	bne.n	5b8 <drv_spim_trans_frame_with_pending+0x18e>
     5aa:	7c45      	ldrb	r5, [r0, #17]
     5ac:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     5b0:	604d      	str	r5, [r1, #4]
     5b2:	7c41      	ldrb	r1, [r0, #17]
     5b4:	4299      	cmp	r1, r3
     5b6:	d1ee      	bne.n	596 <drv_spim_trans_frame_with_pending+0x16c>
     5b8:	6801      	ldr	r1, [r0, #0]
     5ba:	69c9      	ldr	r1, [r1, #28]
     5bc:	f011 0f1f 	tst.w	r1, #31
     5c0:	d00e      	beq.n	5e0 <drv_spim_trans_frame_with_pending+0x1b6>
     5c2:	7c85      	ldrb	r5, [r0, #18]
     5c4:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     5c8:	60cd      	str	r5, [r1, #12]
     5ca:	7c81      	ldrb	r1, [r0, #18]
     5cc:	4571      	cmp	r1, lr
     5ce:	d007      	beq.n	5e0 <drv_spim_trans_frame_with_pending+0x1b6>
     5d0:	6805      	ldr	r5, [r0, #0]
     5d2:	6a6d      	ldr	r5, [r5, #36]	; 0x24
     5d4:	f101 0c01 	add.w	ip, r1, #1
     5d8:	f880 c012 	strb.w	ip, [r0, #18]
     5dc:	5455      	strb	r5, [r2, r1]
     5de:	e7eb      	b.n	5b8 <drv_spim_trans_frame_with_pending+0x18e>
     5e0:	6805      	ldr	r5, [r0, #0]
     5e2:	6929      	ldr	r1, [r5, #16]
     5e4:	f441 3100 	orr.w	r1, r1, #131072	; 0x20000
     5e8:	6129      	str	r1, [r5, #16]
     5ea:	e7a7      	b.n	53c <drv_spim_trans_frame_with_pending+0x112>
     5ec:	6919      	ldr	r1, [r3, #16]
     5ee:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
     5f2:	6119      	str	r1, [r3, #16]
     5f4:	6801      	ldr	r1, [r0, #0]
     5f6:	698b      	ldr	r3, [r1, #24]
     5f8:	f043 0310 	orr.w	r3, r3, #16
     5fc:	618b      	str	r3, [r1, #24]
     5fe:	e006      	b.n	60e <drv_spim_trans_frame_with_pending+0x1e4>
     600:	6801      	ldr	r1, [r0, #0]
     602:	6a49      	ldr	r1, [r1, #36]	; 0x24
     604:	f103 0c01 	add.w	ip, r3, #1
     608:	f880 c012 	strb.w	ip, [r0, #18]
     60c:	54d1      	strb	r1, [r2, r3]
     60e:	6803      	ldr	r3, [r0, #0]
     610:	69db      	ldr	r3, [r3, #28]
     612:	f013 0f1f 	tst.w	r3, #31
     616:	d006      	beq.n	626 <drv_spim_trans_frame_with_pending+0x1fc>
     618:	7c81      	ldrb	r1, [r0, #18]
     61a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     61e:	60d9      	str	r1, [r3, #12]
     620:	7c83      	ldrb	r3, [r0, #18]
     622:	4573      	cmp	r3, lr
     624:	d1ec      	bne.n	600 <drv_spim_trans_frame_with_pending+0x1d6>
     626:	6801      	ldr	r1, [r0, #0]
     628:	690b      	ldr	r3, [r1, #16]
     62a:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
     62e:	610b      	str	r3, [r1, #16]
     630:	e007      	b.n	642 <drv_spim_trans_frame_with_pending+0x218>
     632:	7c83      	ldrb	r3, [r0, #18]
     634:	4573      	cmp	r3, lr
     636:	d218      	bcs.n	66a <drv_spim_trans_frame_with_pending+0x240>
     638:	6803      	ldr	r3, [r0, #0]
     63a:	6a19      	ldr	r1, [r3, #32]
     63c:	f011 0f10 	tst.w	r1, #16
     640:	d1d4      	bne.n	5ec <drv_spim_trans_frame_with_pending+0x1c2>
     642:	6803      	ldr	r3, [r0, #0]
     644:	69db      	ldr	r3, [r3, #28]
     646:	f013 0f1f 	tst.w	r3, #31
     64a:	d0f2      	beq.n	632 <drv_spim_trans_frame_with_pending+0x208>
     64c:	7c81      	ldrb	r1, [r0, #18]
     64e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     652:	60d9      	str	r1, [r3, #12]
     654:	7c83      	ldrb	r3, [r0, #18]
     656:	4573      	cmp	r3, lr
     658:	d0eb      	beq.n	632 <drv_spim_trans_frame_with_pending+0x208>
     65a:	6801      	ldr	r1, [r0, #0]
     65c:	6a49      	ldr	r1, [r1, #36]	; 0x24
     65e:	f103 0c01 	add.w	ip, r3, #1
     662:	f880 c012 	strb.w	ip, [r0, #18]
     666:	54d1      	strb	r1, [r2, r3]
     668:	e7eb      	b.n	642 <drv_spim_trans_frame_with_pending+0x218>
     66a:	6803      	ldr	r3, [r0, #0]
     66c:	6a1a      	ldr	r2, [r3, #32]
     66e:	f012 0f20 	tst.w	r2, #32
     672:	d0fa      	beq.n	66a <drv_spim_trans_frame_with_pending+0x240>
     674:	699a      	ldr	r2, [r3, #24]
     676:	f042 0220 	orr.w	r2, r2, #32
     67a:	619a      	str	r2, [r3, #24]
     67c:	6802      	ldr	r2, [r0, #0]
     67e:	6913      	ldr	r3, [r2, #16]
     680:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
     684:	6113      	str	r3, [r2, #16]
     686:	6802      	ldr	r2, [r0, #0]
     688:	6853      	ldr	r3, [r2, #4]
     68a:	f023 0302 	bic.w	r3, r3, #2
     68e:	6053      	str	r3, [r2, #4]
     690:	6802      	ldr	r2, [r0, #0]
     692:	6893      	ldr	r3, [r2, #8]
     694:	f423 1380 	bic.w	r3, r3, #1048576	; 0x100000
     698:	6093      	str	r3, [r2, #8]
     69a:	2300      	movs	r3, #0
     69c:	7443      	strb	r3, [r0, #17]
     69e:	7483      	strb	r3, [r0, #18]
     6a0:	bdf0      	pop	{r4, r5, r6, r7, pc}

000006a2 <spim_int_frame_done_callback>:
     6a2:	4770      	bx	lr

000006a4 <spim_int_transferring_pending_callback>:
     6a4:	4770      	bx	lr

000006a6 <spim_int_tx_fifo_empty_callback>:
     6a6:	4770      	bx	lr

000006a8 <spim_int_tx_fifo_thres_callback>:
     6a8:	4770      	bx	lr

000006aa <spim_int_rx_fifo_noempty_callback>:
     6aa:	4770      	bx	lr

000006ac <spim_int_rx_fifo_thres_callback>:
     6ac:	4770      	bx	lr

000006ae <drv_spim_interrupt_handler>:
     6ae:	b538      	push	{r3, r4, r5, lr}
     6b0:	4605      	mov	r5, r0
     6b2:	6803      	ldr	r3, [r0, #0]
     6b4:	6a1c      	ldr	r4, [r3, #32]
     6b6:	695a      	ldr	r2, [r3, #20]
     6b8:	b2d2      	uxtb	r2, r2
     6ba:	4014      	ands	r4, r2
     6bc:	619c      	str	r4, [r3, #24]
     6be:	f014 0f20 	tst.w	r4, #32
     6c2:	d10f      	bne.n	6e4 <drv_spim_interrupt_handler+0x36>
     6c4:	f014 0f10 	tst.w	r4, #16
     6c8:	d10f      	bne.n	6ea <drv_spim_interrupt_handler+0x3c>
     6ca:	f014 0f01 	tst.w	r4, #1
     6ce:	d110      	bne.n	6f2 <drv_spim_interrupt_handler+0x44>
     6d0:	f014 0f02 	tst.w	r4, #2
     6d4:	d111      	bne.n	6fa <drv_spim_interrupt_handler+0x4c>
     6d6:	f014 0f04 	tst.w	r4, #4
     6da:	d112      	bne.n	702 <drv_spim_interrupt_handler+0x54>
     6dc:	f014 0f08 	tst.w	r4, #8
     6e0:	d113      	bne.n	70a <drv_spim_interrupt_handler+0x5c>
     6e2:	bd38      	pop	{r3, r4, r5, pc}
     6e4:	f7ff ffdd 	bl	6a2 <spim_int_frame_done_callback>
     6e8:	e7ec      	b.n	6c4 <drv_spim_interrupt_handler+0x16>
     6ea:	4628      	mov	r0, r5
     6ec:	f7ff ffda 	bl	6a4 <spim_int_transferring_pending_callback>
     6f0:	e7eb      	b.n	6ca <drv_spim_interrupt_handler+0x1c>
     6f2:	4628      	mov	r0, r5
     6f4:	f7ff ffd8 	bl	6a8 <spim_int_tx_fifo_thres_callback>
     6f8:	e7ea      	b.n	6d0 <drv_spim_interrupt_handler+0x22>
     6fa:	4628      	mov	r0, r5
     6fc:	f7ff ffd3 	bl	6a6 <spim_int_tx_fifo_empty_callback>
     700:	e7e9      	b.n	6d6 <drv_spim_interrupt_handler+0x28>
     702:	4628      	mov	r0, r5
     704:	f7ff ffd2 	bl	6ac <spim_int_rx_fifo_thres_callback>
     708:	e7e8      	b.n	6dc <drv_spim_interrupt_handler+0x2e>
     70a:	4628      	mov	r0, r5
     70c:	f7ff ffcd 	bl	6aa <spim_int_rx_fifo_noempty_callback>
     710:	e7e7      	b.n	6e2 <drv_spim_interrupt_handler+0x34>

00000712 <drv_uart_default_config>:
     712:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
     716:	6043      	str	r3, [r0, #4]
     718:	230f      	movs	r3, #15
     71a:	7203      	strb	r3, [r0, #8]
     71c:	2300      	movs	r3, #0
     71e:	7243      	strb	r3, [r0, #9]
     720:	7283      	strb	r3, [r0, #10]
     722:	72c3      	strb	r3, [r0, #11]
     724:	7303      	strb	r3, [r0, #12]
     726:	7343      	strb	r3, [r0, #13]
     728:	2301      	movs	r3, #1
     72a:	7383      	strb	r3, [r0, #14]
     72c:	4770      	bx	lr
	...

00000730 <drv_uart_set_config>:
     730:	b508      	push	{r3, lr}
     732:	6841      	ldr	r1, [r0, #4]
     734:	7a03      	ldrb	r3, [r0, #8]
     736:	fb03 f201 	mul.w	r2, r3, r1
     73a:	490e      	ldr	r1, [pc, #56]	; (774 <drv_uart_set_config+0x44>)
     73c:	fbb1 f2f2 	udiv	r2, r1, r2
     740:	0419      	lsls	r1, r3, #16
     742:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     746:	7a43      	ldrb	r3, [r0, #9]
     748:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     74c:	7a83      	ldrb	r3, [r0, #10]
     74e:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     752:	7ac3      	ldrb	r3, [r0, #11]
     754:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     758:	7b03      	ldrb	r3, [r0, #12]
     75a:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     75e:	7b42      	ldrb	r2, [r0, #13]
     760:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     764:	7b82      	ldrb	r2, [r0, #14]
     766:	4311      	orrs	r1, r2
     768:	6800      	ldr	r0, [r0, #0]
     76a:	460a      	mov	r2, r1
     76c:	3008      	adds	r0, #8
     76e:	f7ff fcaf 	bl	d0 <drv_check_rw_data>
     772:	bd08      	pop	{r3, pc}
     774:	02625a00 	rsbeq	r5, r2, #0, 20

00000778 <drv_uart_init>:
     778:	b538      	push	{r3, r4, r5, lr}
     77a:	4604      	mov	r4, r0
     77c:	2500      	movs	r5, #0
     77e:	7485      	strb	r5, [r0, #18]
     780:	74c5      	strb	r5, [r0, #19]
     782:	f7ff ffd5 	bl	730 <drv_uart_set_config>
     786:	7425      	strb	r5, [r4, #16]
     788:	74a5      	strb	r5, [r4, #18]
     78a:	74e5      	strb	r5, [r4, #19]
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
     7dc:	6823      	ldr	r3, [r4, #0]
     7de:	f240 12ff 	movw	r2, #511	; 0x1ff
     7e2:	611a      	str	r2, [r3, #16]
     7e4:	6823      	ldr	r3, [r4, #0]
     7e6:	611d      	str	r5, [r3, #16]
     7e8:	6822      	ldr	r2, [r4, #0]
     7ea:	6853      	ldr	r3, [r2, #4]
     7ec:	f043 0301 	orr.w	r3, r3, #1
     7f0:	6053      	str	r3, [r2, #4]
     7f2:	6822      	ldr	r2, [r4, #0]
     7f4:	6853      	ldr	r3, [r2, #4]
     7f6:	f023 0301 	bic.w	r3, r3, #1
     7fa:	6053      	str	r3, [r2, #4]
     7fc:	6822      	ldr	r2, [r4, #0]
     7fe:	6853      	ldr	r3, [r2, #4]
     800:	f043 0302 	orr.w	r3, r3, #2
     804:	6053      	str	r3, [r2, #4]
     806:	bd38      	pop	{r3, r4, r5, pc}

00000808 <drv_uart_putchars>:
     808:	b410      	push	{r4}
     80a:	2300      	movs	r3, #0
     80c:	7483      	strb	r3, [r0, #18]
     80e:	f890 c012 	ldrb.w	ip, [r0, #18]
     812:	4594      	cmp	ip, r2
     814:	d20c      	bcs.n	830 <drv_uart_putchars+0x28>
     816:	6804      	ldr	r4, [r0, #0]
     818:	6963      	ldr	r3, [r4, #20]
     81a:	0a1b      	lsrs	r3, r3, #8
     81c:	f013 0f18 	tst.w	r3, #24
     820:	d1f5      	bne.n	80e <drv_uart_putchars+0x6>
     822:	f10c 0301 	add.w	r3, ip, #1
     826:	7483      	strb	r3, [r0, #18]
     828:	f811 300c 	ldrb.w	r3, [r1, ip]
     82c:	6023      	str	r3, [r4, #0]
     82e:	e7ee      	b.n	80e <drv_uart_putchars+0x6>
     830:	6803      	ldr	r3, [r0, #0]
     832:	699a      	ldr	r2, [r3, #24]
     834:	f412 7f80 	tst.w	r2, #256	; 0x100
     838:	d0fa      	beq.n	830 <drv_uart_putchars+0x28>
     83a:	691a      	ldr	r2, [r3, #16]
     83c:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     840:	611a      	str	r2, [r3, #16]
     842:	6803      	ldr	r3, [r0, #0]
     844:	2200      	movs	r2, #0
     846:	611a      	str	r2, [r3, #16]
     848:	bc10      	pop	{r4}
     84a:	4770      	bx	lr

0000084c <drv_uart_getchar_timeout>:
     84c:	2a00      	cmp	r2, #0
     84e:	d059      	beq.n	904 <drv_uart_getchar_timeout+0xb8>
     850:	b430      	push	{r4, r5}
     852:	e00b      	b.n	86c <drv_uart_getchar_timeout+0x20>
     854:	69db      	ldr	r3, [r3, #28]
     856:	700b      	strb	r3, [r1, #0]
     858:	2000      	movs	r0, #0
     85a:	e051      	b.n	900 <drv_uart_getchar_timeout+0xb4>
     85c:	6803      	ldr	r3, [r0, #0]
     85e:	695c      	ldr	r4, [r3, #20]
     860:	f014 0f1f 	tst.w	r4, #31
     864:	d1f6      	bne.n	854 <drv_uart_getchar_timeout+0x8>
     866:	3a01      	subs	r2, #1
     868:	2a00      	cmp	r2, #0
     86a:	d048      	beq.n	8fe <drv_uart_getchar_timeout+0xb2>
     86c:	6803      	ldr	r3, [r0, #0]
     86e:	699d      	ldr	r5, [r3, #24]
     870:	691c      	ldr	r4, [r3, #16]
     872:	f044 04c0 	orr.w	r4, r4, #192	; 0xc0
     876:	611c      	str	r4, [r3, #16]
     878:	6803      	ldr	r3, [r0, #0]
     87a:	2400      	movs	r4, #0
     87c:	611c      	str	r4, [r3, #16]
     87e:	b2ab      	uxth	r3, r5
     880:	f015 0f40 	tst.w	r5, #64	; 0x40
     884:	d001      	beq.n	88a <drv_uart_getchar_timeout+0x3e>
     886:	2401      	movs	r4, #1
     888:	7404      	strb	r4, [r0, #16]
     88a:	f013 0f80 	tst.w	r3, #128	; 0x80
     88e:	d001      	beq.n	894 <drv_uart_getchar_timeout+0x48>
     890:	2302      	movs	r3, #2
     892:	7403      	strb	r3, [r0, #16]
     894:	7c03      	ldrb	r3, [r0, #16]
     896:	2b00      	cmp	r3, #0
     898:	d0e0      	beq.n	85c <drv_uart_getchar_timeout+0x10>
     89a:	7a83      	ldrb	r3, [r0, #10]
     89c:	2b01      	cmp	r3, #1
     89e:	d0dd      	beq.n	85c <drv_uart_getchar_timeout+0x10>
     8a0:	2300      	movs	r3, #0
     8a2:	7403      	strb	r3, [r0, #16]
     8a4:	7483      	strb	r3, [r0, #18]
     8a6:	74c3      	strb	r3, [r0, #19]
     8a8:	6804      	ldr	r4, [r0, #0]
     8aa:	6862      	ldr	r2, [r4, #4]
     8ac:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     8b0:	6062      	str	r2, [r4, #4]
     8b2:	6804      	ldr	r4, [r0, #0]
     8b4:	6862      	ldr	r2, [r4, #4]
     8b6:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     8ba:	6062      	str	r2, [r4, #4]
     8bc:	6804      	ldr	r4, [r0, #0]
     8be:	6862      	ldr	r2, [r4, #4]
     8c0:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     8c4:	6062      	str	r2, [r4, #4]
     8c6:	6804      	ldr	r4, [r0, #0]
     8c8:	6862      	ldr	r2, [r4, #4]
     8ca:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     8ce:	6062      	str	r2, [r4, #4]
     8d0:	6804      	ldr	r4, [r0, #0]
     8d2:	6862      	ldr	r2, [r4, #4]
     8d4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     8d8:	6062      	str	r2, [r4, #4]
     8da:	6804      	ldr	r4, [r0, #0]
     8dc:	6862      	ldr	r2, [r4, #4]
     8de:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     8e2:	6062      	str	r2, [r4, #4]
     8e4:	6804      	ldr	r4, [r0, #0]
     8e6:	6862      	ldr	r2, [r4, #4]
     8e8:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     8ec:	6062      	str	r2, [r4, #4]
     8ee:	6800      	ldr	r0, [r0, #0]
     8f0:	6842      	ldr	r2, [r0, #4]
     8f2:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     8f6:	6042      	str	r2, [r0, #4]
     8f8:	700b      	strb	r3, [r1, #0]
     8fa:	2001      	movs	r0, #1
     8fc:	e000      	b.n	900 <drv_uart_getchar_timeout+0xb4>
     8fe:	2002      	movs	r0, #2
     900:	bc30      	pop	{r4, r5}
     902:	4770      	bx	lr
     904:	2002      	movs	r0, #2
     906:	4770      	bx	lr

00000908 <uart_int_tx_done_callback>:
     908:	4770      	bx	lr

0000090a <uart_int_rx_stop_callback>:
     90a:	4770      	bx	lr

0000090c <uart_int_rx_parity_error_callback>:
     90c:	4770      	bx	lr

0000090e <uart_int_rx_noise_detect_callback>:
     90e:	4770      	bx	lr

00000910 <uart_int_rx_stop_detect_callback>:
     910:	4770      	bx	lr

00000912 <uart_int_tx_fifo_empty_callback>:
     912:	4770      	bx	lr

00000914 <uart_int_tx_fifo_thres_callback>:
     914:	4770      	bx	lr

00000916 <uart_int_rx_fifo_noempty_callback>:
     916:	4770      	bx	lr

00000918 <uart_int_rx_fifo_thres_callback>:
     918:	4770      	bx	lr

0000091a <drv_uart_interrupt_handler>:
     91a:	b538      	push	{r3, r4, r5, lr}
     91c:	4604      	mov	r4, r0
     91e:	6803      	ldr	r3, [r0, #0]
     920:	699d      	ldr	r5, [r3, #24]
     922:	68db      	ldr	r3, [r3, #12]
     924:	b29b      	uxth	r3, r3
     926:	401d      	ands	r5, r3
     928:	f415 7f80 	tst.w	r5, #256	; 0x100
     92c:	d144      	bne.n	9b8 <drv_uart_interrupt_handler+0x9e>
     92e:	f015 0f40 	tst.w	r5, #64	; 0x40
     932:	d00f      	beq.n	954 <drv_uart_interrupt_handler+0x3a>
     934:	2301      	movs	r3, #1
     936:	7423      	strb	r3, [r4, #16]
     938:	7aa3      	ldrb	r3, [r4, #10]
     93a:	2b01      	cmp	r3, #1
     93c:	d147      	bne.n	9ce <drv_uart_interrupt_handler+0xb4>
     93e:	4620      	mov	r0, r4
     940:	f7ff ffe3 	bl	90a <uart_int_rx_stop_callback>
     944:	6822      	ldr	r2, [r4, #0]
     946:	6913      	ldr	r3, [r2, #16]
     948:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     94c:	6113      	str	r3, [r2, #16]
     94e:	6823      	ldr	r3, [r4, #0]
     950:	2200      	movs	r2, #0
     952:	611a      	str	r2, [r3, #16]
     954:	f015 0f80 	tst.w	r5, #128	; 0x80
     958:	d00f      	beq.n	97a <drv_uart_interrupt_handler+0x60>
     95a:	2302      	movs	r3, #2
     95c:	7423      	strb	r3, [r4, #16]
     95e:	7aa3      	ldrb	r3, [r4, #10]
     960:	2b01      	cmp	r3, #1
     962:	d166      	bne.n	a32 <drv_uart_interrupt_handler+0x118>
     964:	4620      	mov	r0, r4
     966:	f7ff ffd1 	bl	90c <uart_int_rx_parity_error_callback>
     96a:	6822      	ldr	r2, [r4, #0]
     96c:	6913      	ldr	r3, [r2, #16]
     96e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     972:	6113      	str	r3, [r2, #16]
     974:	6823      	ldr	r3, [r4, #0]
     976:	2200      	movs	r2, #0
     978:	611a      	str	r2, [r3, #16]
     97a:	f015 0f20 	tst.w	r5, #32
     97e:	f040 808a 	bne.w	a96 <drv_uart_interrupt_handler+0x17c>
     982:	f015 0f10 	tst.w	r5, #16
     986:	f040 8092 	bne.w	aae <drv_uart_interrupt_handler+0x194>
     98a:	f015 0f01 	tst.w	r5, #1
     98e:	f040 809a 	bne.w	ac6 <drv_uart_interrupt_handler+0x1ac>
     992:	f015 0f02 	tst.w	r5, #2
     996:	f040 80a2 	bne.w	ade <drv_uart_interrupt_handler+0x1c4>
     99a:	f015 0f04 	tst.w	r5, #4
     99e:	f000 80c1 	beq.w	b24 <drv_uart_interrupt_handler+0x20a>
     9a2:	7ce2      	ldrb	r2, [r4, #19]
     9a4:	7e23      	ldrb	r3, [r4, #24]
     9a6:	429a      	cmp	r2, r3
     9a8:	f0c0 80ac 	bcc.w	b04 <drv_uart_interrupt_handler+0x1ea>
     9ac:	6822      	ldr	r2, [r4, #0]
     9ae:	68d3      	ldr	r3, [r2, #12]
     9b0:	f023 030c 	bic.w	r3, r3, #12
     9b4:	60d3      	str	r3, [r2, #12]
     9b6:	e0aa      	b.n	b0e <drv_uart_interrupt_handler+0x1f4>
     9b8:	f7ff ffa6 	bl	908 <uart_int_tx_done_callback>
     9bc:	6822      	ldr	r2, [r4, #0]
     9be:	6913      	ldr	r3, [r2, #16]
     9c0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     9c4:	6113      	str	r3, [r2, #16]
     9c6:	6823      	ldr	r3, [r4, #0]
     9c8:	2200      	movs	r2, #0
     9ca:	611a      	str	r2, [r3, #16]
     9cc:	e7af      	b.n	92e <drv_uart_interrupt_handler+0x14>
     9ce:	6822      	ldr	r2, [r4, #0]
     9d0:	68d3      	ldr	r3, [r2, #12]
     9d2:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     9d6:	60d3      	str	r3, [r2, #12]
     9d8:	2300      	movs	r3, #0
     9da:	7423      	strb	r3, [r4, #16]
     9dc:	74a3      	strb	r3, [r4, #18]
     9de:	74e3      	strb	r3, [r4, #19]
     9e0:	6822      	ldr	r2, [r4, #0]
     9e2:	6853      	ldr	r3, [r2, #4]
     9e4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     9e8:	6053      	str	r3, [r2, #4]
     9ea:	6822      	ldr	r2, [r4, #0]
     9ec:	6853      	ldr	r3, [r2, #4]
     9ee:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     9f2:	6053      	str	r3, [r2, #4]
     9f4:	6822      	ldr	r2, [r4, #0]
     9f6:	6853      	ldr	r3, [r2, #4]
     9f8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     9fc:	6053      	str	r3, [r2, #4]
     9fe:	6822      	ldr	r2, [r4, #0]
     a00:	6853      	ldr	r3, [r2, #4]
     a02:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     a06:	6053      	str	r3, [r2, #4]
     a08:	6822      	ldr	r2, [r4, #0]
     a0a:	6853      	ldr	r3, [r2, #4]
     a0c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     a10:	6053      	str	r3, [r2, #4]
     a12:	6822      	ldr	r2, [r4, #0]
     a14:	6853      	ldr	r3, [r2, #4]
     a16:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     a1a:	6053      	str	r3, [r2, #4]
     a1c:	6822      	ldr	r2, [r4, #0]
     a1e:	6853      	ldr	r3, [r2, #4]
     a20:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     a24:	6053      	str	r3, [r2, #4]
     a26:	6822      	ldr	r2, [r4, #0]
     a28:	6853      	ldr	r3, [r2, #4]
     a2a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     a2e:	6053      	str	r3, [r2, #4]
     a30:	e785      	b.n	93e <drv_uart_interrupt_handler+0x24>
     a32:	6822      	ldr	r2, [r4, #0]
     a34:	68d3      	ldr	r3, [r2, #12]
     a36:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     a3a:	60d3      	str	r3, [r2, #12]
     a3c:	2300      	movs	r3, #0
     a3e:	7423      	strb	r3, [r4, #16]
     a40:	74a3      	strb	r3, [r4, #18]
     a42:	74e3      	strb	r3, [r4, #19]
     a44:	6822      	ldr	r2, [r4, #0]
     a46:	6853      	ldr	r3, [r2, #4]
     a48:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     a4c:	6053      	str	r3, [r2, #4]
     a4e:	6822      	ldr	r2, [r4, #0]
     a50:	6853      	ldr	r3, [r2, #4]
     a52:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     a56:	6053      	str	r3, [r2, #4]
     a58:	6822      	ldr	r2, [r4, #0]
     a5a:	6853      	ldr	r3, [r2, #4]
     a5c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     a60:	6053      	str	r3, [r2, #4]
     a62:	6822      	ldr	r2, [r4, #0]
     a64:	6853      	ldr	r3, [r2, #4]
     a66:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     a6a:	6053      	str	r3, [r2, #4]
     a6c:	6822      	ldr	r2, [r4, #0]
     a6e:	6853      	ldr	r3, [r2, #4]
     a70:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     a74:	6053      	str	r3, [r2, #4]
     a76:	6822      	ldr	r2, [r4, #0]
     a78:	6853      	ldr	r3, [r2, #4]
     a7a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     a7e:	6053      	str	r3, [r2, #4]
     a80:	6822      	ldr	r2, [r4, #0]
     a82:	6853      	ldr	r3, [r2, #4]
     a84:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     a88:	6053      	str	r3, [r2, #4]
     a8a:	6822      	ldr	r2, [r4, #0]
     a8c:	6853      	ldr	r3, [r2, #4]
     a8e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     a92:	6053      	str	r3, [r2, #4]
     a94:	e766      	b.n	964 <drv_uart_interrupt_handler+0x4a>
     a96:	4620      	mov	r0, r4
     a98:	f7ff ff39 	bl	90e <uart_int_rx_noise_detect_callback>
     a9c:	6822      	ldr	r2, [r4, #0]
     a9e:	6913      	ldr	r3, [r2, #16]
     aa0:	f043 0320 	orr.w	r3, r3, #32
     aa4:	6113      	str	r3, [r2, #16]
     aa6:	6823      	ldr	r3, [r4, #0]
     aa8:	2200      	movs	r2, #0
     aaa:	611a      	str	r2, [r3, #16]
     aac:	e769      	b.n	982 <drv_uart_interrupt_handler+0x68>
     aae:	4620      	mov	r0, r4
     ab0:	f7ff ff2e 	bl	910 <uart_int_rx_stop_detect_callback>
     ab4:	6822      	ldr	r2, [r4, #0]
     ab6:	6913      	ldr	r3, [r2, #16]
     ab8:	f043 0310 	orr.w	r3, r3, #16
     abc:	6113      	str	r3, [r2, #16]
     abe:	6823      	ldr	r3, [r4, #0]
     ac0:	2200      	movs	r2, #0
     ac2:	611a      	str	r2, [r3, #16]
     ac4:	e761      	b.n	98a <drv_uart_interrupt_handler+0x70>
     ac6:	4620      	mov	r0, r4
     ac8:	f7ff ff24 	bl	914 <uart_int_tx_fifo_thres_callback>
     acc:	6822      	ldr	r2, [r4, #0]
     ace:	6913      	ldr	r3, [r2, #16]
     ad0:	f043 0301 	orr.w	r3, r3, #1
     ad4:	6113      	str	r3, [r2, #16]
     ad6:	6823      	ldr	r3, [r4, #0]
     ad8:	2200      	movs	r2, #0
     ada:	611a      	str	r2, [r3, #16]
     adc:	e759      	b.n	992 <drv_uart_interrupt_handler+0x78>
     ade:	4620      	mov	r0, r4
     ae0:	f7ff ff17 	bl	912 <uart_int_tx_fifo_empty_callback>
     ae4:	6822      	ldr	r2, [r4, #0]
     ae6:	6913      	ldr	r3, [r2, #16]
     ae8:	f043 0302 	orr.w	r3, r3, #2
     aec:	6113      	str	r3, [r2, #16]
     aee:	6823      	ldr	r3, [r4, #0]
     af0:	2200      	movs	r2, #0
     af2:	611a      	str	r2, [r3, #16]
     af4:	e751      	b.n	99a <drv_uart_interrupt_handler+0x80>
     af6:	69d9      	ldr	r1, [r3, #28]
     af8:	6962      	ldr	r2, [r4, #20]
     afa:	7ce3      	ldrb	r3, [r4, #19]
     afc:	1c58      	adds	r0, r3, #1
     afe:	74e0      	strb	r0, [r4, #19]
     b00:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     b04:	6823      	ldr	r3, [r4, #0]
     b06:	695a      	ldr	r2, [r3, #20]
     b08:	f012 0f1f 	tst.w	r2, #31
     b0c:	d1f3      	bne.n	af6 <drv_uart_interrupt_handler+0x1dc>
     b0e:	4620      	mov	r0, r4
     b10:	f7ff ff02 	bl	918 <uart_int_rx_fifo_thres_callback>
     b14:	6822      	ldr	r2, [r4, #0]
     b16:	6913      	ldr	r3, [r2, #16]
     b18:	f043 0304 	orr.w	r3, r3, #4
     b1c:	6113      	str	r3, [r2, #16]
     b1e:	6823      	ldr	r3, [r4, #0]
     b20:	2200      	movs	r2, #0
     b22:	611a      	str	r2, [r3, #16]
     b24:	f015 0f08 	tst.w	r5, #8
     b28:	d020      	beq.n	b6c <drv_uart_interrupt_handler+0x252>
     b2a:	7ce2      	ldrb	r2, [r4, #19]
     b2c:	7e23      	ldrb	r3, [r4, #24]
     b2e:	429a      	cmp	r2, r3
     b30:	d30c      	bcc.n	b4c <drv_uart_interrupt_handler+0x232>
     b32:	6822      	ldr	r2, [r4, #0]
     b34:	68d3      	ldr	r3, [r2, #12]
     b36:	f023 030c 	bic.w	r3, r3, #12
     b3a:	60d3      	str	r3, [r2, #12]
     b3c:	e00b      	b.n	b56 <drv_uart_interrupt_handler+0x23c>
     b3e:	69d9      	ldr	r1, [r3, #28]
     b40:	6962      	ldr	r2, [r4, #20]
     b42:	7ce3      	ldrb	r3, [r4, #19]
     b44:	1c58      	adds	r0, r3, #1
     b46:	74e0      	strb	r0, [r4, #19]
     b48:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     b4c:	6823      	ldr	r3, [r4, #0]
     b4e:	695a      	ldr	r2, [r3, #20]
     b50:	f012 0f1f 	tst.w	r2, #31
     b54:	d1f3      	bne.n	b3e <drv_uart_interrupt_handler+0x224>
     b56:	4620      	mov	r0, r4
     b58:	f7ff fedd 	bl	916 <uart_int_rx_fifo_noempty_callback>
     b5c:	6822      	ldr	r2, [r4, #0]
     b5e:	6913      	ldr	r3, [r2, #16]
     b60:	f043 0308 	orr.w	r3, r3, #8
     b64:	6113      	str	r3, [r2, #16]
     b66:	6823      	ldr	r3, [r4, #0]
     b68:	2200      	movs	r2, #0
     b6a:	611a      	str	r2, [r3, #16]
     b6c:	bd38      	pop	{r3, r4, r5, pc}
	...

00000b70 <vprintf>:
     b70:	b500      	push	{lr}
     b72:	b0a1      	sub	sp, #132	; 0x84
     b74:	460a      	mov	r2, r1
     b76:	4601      	mov	r1, r0
     b78:	4668      	mov	r0, sp
     b7a:	f000 fb69 	bl	1250 <vsiprintf>
     b7e:	2800      	cmp	r0, #0
     b80:	dc05      	bgt.n	b8e <vprintf+0x1e>
     b82:	4668      	mov	r0, sp
     b84:	f000 fb46 	bl	1214 <strlen>
     b88:	b021      	add	sp, #132	; 0x84
     b8a:	f85d fb04 	ldr.w	pc, [sp], #4
     b8e:	4668      	mov	r0, sp
     b90:	f000 fb40 	bl	1214 <strlen>
     b94:	b2c2      	uxtb	r2, r0
     b96:	4669      	mov	r1, sp
     b98:	4801      	ldr	r0, [pc, #4]	; (ba0 <vprintf+0x30>)
     b9a:	f7ff fe35 	bl	808 <drv_uart_putchars>
     b9e:	e7f0      	b.n	b82 <vprintf+0x12>
     ba0:	00020564 	andeq	r0, r2, r4, ror #10

00000ba4 <drv_uart_printf>:
     ba4:	b40f      	push	{r0, r1, r2, r3}
     ba6:	b500      	push	{lr}
     ba8:	b083      	sub	sp, #12
     baa:	a904      	add	r1, sp, #16
     bac:	f851 0b04 	ldr.w	r0, [r1], #4
     bb0:	9101      	str	r1, [sp, #4]
     bb2:	f7ff ffdd 	bl	b70 <vprintf>
     bb6:	b003      	add	sp, #12
     bb8:	f85d eb04 	ldr.w	lr, [sp], #4
     bbc:	b004      	add	sp, #16
     bbe:	4770      	bx	lr

00000bc0 <spim_init_for_gd25lb256e>:
     bc0:	b510      	push	{r4, lr}
     bc2:	4c0c      	ldr	r4, [pc, #48]	; (bf4 <spim_init_for_gd25lb256e+0x34>)
     bc4:	4b0c      	ldr	r3, [pc, #48]	; (bf8 <spim_init_for_gd25lb256e+0x38>)
     bc6:	6023      	str	r3, [r4, #0]
     bc8:	2300      	movs	r3, #0
     bca:	7223      	strb	r3, [r4, #8]
     bcc:	2228      	movs	r2, #40	; 0x28
     bce:	6062      	str	r2, [r4, #4]
     bd0:	2202      	movs	r2, #2
     bd2:	7322      	strb	r2, [r4, #12]
     bd4:	7362      	strb	r2, [r4, #13]
     bd6:	73a3      	strb	r3, [r4, #14]
     bd8:	4620      	mov	r0, r4
     bda:	f7ff faaf 	bl	13c <drv_spim_init>
     bde:	6823      	ldr	r3, [r4, #0]
     be0:	691a      	ldr	r2, [r3, #16]
     be2:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
     be6:	611a      	str	r2, [r3, #16]
     be8:	691a      	ldr	r2, [r3, #16]
     bea:	f442 2200 	orr.w	r2, r2, #524288	; 0x80000
     bee:	611a      	str	r2, [r3, #16]
     bf0:	bd10      	pop	{r4, pc}
     bf2:	bf00      	nop
     bf4:	000204c8 	andeq	r0, r2, r8, asr #9
     bf8:	40022000 	andmi	r2, r2, r0

00000bfc <spim_deinit_for_gd25lb256e>:
     bfc:	b508      	push	{r3, lr}
     bfe:	4802      	ldr	r0, [pc, #8]	; (c08 <spim_deinit_for_gd25lb256e+0xc>)
     c00:	f7ff fabd 	bl	17e <drv_spim_deinit>
     c04:	bd08      	pop	{r3, pc}
     c06:	bf00      	nop
     c08:	000204c8 	andeq	r0, r2, r8, asr #9

00000c0c <gd25lb256e_read_id>:
     c0c:	b530      	push	{r4, r5, lr}
     c0e:	b085      	sub	sp, #20
     c10:	4605      	mov	r5, r0
     c12:	2400      	movs	r4, #0
     c14:	9402      	str	r4, [sp, #8]
     c16:	f88d 400c 	strb.w	r4, [sp, #12]
     c1a:	9400      	str	r4, [sp, #0]
     c1c:	f88d 4004 	strb.w	r4, [sp, #4]
     c20:	239f      	movs	r3, #159	; 0x9f
     c22:	f88d 3008 	strb.w	r3, [sp, #8]
     c26:	2305      	movs	r3, #5
     c28:	466a      	mov	r2, sp
     c2a:	a902      	add	r1, sp, #8
     c2c:	480a      	ldr	r0, [pc, #40]	; (c58 <gd25lb256e_read_id+0x4c>)
     c2e:	f7ff fb17 	bl	260 <drv_spim_trans_data_with_pending>
     c32:	e009      	b.n	c48 <gd25lb256e_read_id+0x3c>
     c34:	f104 0310 	add.w	r3, r4, #16
     c38:	446b      	add	r3, sp
     c3a:	f813 1c10 	ldrb.w	r1, [r3, #-16]
     c3e:	4807      	ldr	r0, [pc, #28]	; (c5c <gd25lb256e_read_id+0x50>)
     c40:	f000 fac2 	bl	11c8 <test_printf_ch>
     c44:	3401      	adds	r4, #1
     c46:	b2e4      	uxtb	r4, r4
     c48:	2c04      	cmp	r4, #4
     c4a:	d9f3      	bls.n	c34 <gd25lb256e_read_id+0x28>
     c4c:	f8dd 3001 	ldr.w	r3, [sp, #1]
     c50:	602b      	str	r3, [r5, #0]
     c52:	b005      	add	sp, #20
     c54:	bd30      	pop	{r4, r5, pc}
     c56:	bf00      	nop
     c58:	000204c8 	andeq	r0, r2, r8, asr #9
     c5c:	00001b34 	andeq	r1, r0, r4, lsr fp

00000c60 <gd25lb256e_read_status_reg>:
     c60:	b500      	push	{lr}
     c62:	b083      	sub	sp, #12
     c64:	2300      	movs	r3, #0
     c66:	f8ad 3004 	strh.w	r3, [sp, #4]
     c6a:	f8ad 3000 	strh.w	r3, [sp]
     c6e:	2305      	movs	r3, #5
     c70:	f88d 3004 	strb.w	r3, [sp, #4]
     c74:	2302      	movs	r3, #2
     c76:	466a      	mov	r2, sp
     c78:	a901      	add	r1, sp, #4
     c7a:	4806      	ldr	r0, [pc, #24]	; (c94 <gd25lb256e_read_status_reg+0x34>)
     c7c:	f7ff faf0 	bl	260 <drv_spim_trans_data_with_pending>
     c80:	f89d 1001 	ldrb.w	r1, [sp, #1]
     c84:	4804      	ldr	r0, [pc, #16]	; (c98 <gd25lb256e_read_status_reg+0x38>)
     c86:	f000 fa9f 	bl	11c8 <test_printf_ch>
     c8a:	f89d 0001 	ldrb.w	r0, [sp, #1]
     c8e:	b003      	add	sp, #12
     c90:	f85d fb04 	ldr.w	pc, [sp], #4
     c94:	000204c8 	andeq	r0, r2, r8, asr #9
     c98:	00001b34 	andeq	r1, r0, r4, lsr fp

00000c9c <gd25lb256e_write_enable>:
     c9c:	b500      	push	{lr}
     c9e:	b083      	sub	sp, #12
     ca0:	2300      	movs	r3, #0
     ca2:	f88d 3004 	strb.w	r3, [sp, #4]
     ca6:	2306      	movs	r3, #6
     ca8:	f88d 3004 	strb.w	r3, [sp, #4]
     cac:	2201      	movs	r2, #1
     cae:	a901      	add	r1, sp, #4
     cb0:	4805      	ldr	r0, [pc, #20]	; (cc8 <gd25lb256e_write_enable+0x2c>)
     cb2:	f7ff fa84 	bl	1be <drv_spim_tx_data>
     cb6:	f7ff ffd3 	bl	c60 <gd25lb256e_read_status_reg>
     cba:	f010 0f02 	tst.w	r0, #2
     cbe:	d0fa      	beq.n	cb6 <gd25lb256e_write_enable+0x1a>
     cc0:	b003      	add	sp, #12
     cc2:	f85d fb04 	ldr.w	pc, [sp], #4
     cc6:	bf00      	nop
     cc8:	000204c8 	andeq	r0, r2, r8, asr #9

00000ccc <gd25lb256e_erase>:
     ccc:	b530      	push	{r4, r5, lr}
     cce:	b083      	sub	sp, #12
     cd0:	4604      	mov	r4, r0
     cd2:	460d      	mov	r5, r1
     cd4:	2300      	movs	r3, #0
     cd6:	9300      	str	r3, [sp, #0]
     cd8:	f88d 3004 	strb.w	r3, [sp, #4]
     cdc:	2a03      	cmp	r2, #3
     cde:	d828      	bhi.n	d32 <gd25lb256e_erase+0x66>
     ce0:	e8df f002 	tbb	[pc, r2]
     ce4:	231f1b02 	tstcs	pc, #2048	; 0x800
     ce8:	2320      	movs	r3, #32
     cea:	f88d 3000 	strb.w	r3, [sp]
     cee:	f7ff ffd5 	bl	c9c <gd25lb256e_write_enable>
     cf2:	bb15      	cbnz	r5, d3a <gd25lb256e_erase+0x6e>
     cf4:	b2e3      	uxtb	r3, r4
     cf6:	f88d 3003 	strb.w	r3, [sp, #3]
     cfa:	f88d 3002 	strb.w	r3, [sp, #2]
     cfe:	f88d 3001 	strb.w	r3, [sp, #1]
     d02:	2204      	movs	r2, #4
     d04:	4669      	mov	r1, sp
     d06:	4814      	ldr	r0, [pc, #80]	; (d58 <gd25lb256e_erase+0x8c>)
     d08:	f7ff fa59 	bl	1be <drv_spim_tx_data>
     d0c:	f7ff ffa8 	bl	c60 <gd25lb256e_read_status_reg>
     d10:	f010 0f01 	tst.w	r0, #1
     d14:	d1fa      	bne.n	d0c <gd25lb256e_erase+0x40>
     d16:	b003      	add	sp, #12
     d18:	bd30      	pop	{r4, r5, pc}
     d1a:	2352      	movs	r3, #82	; 0x52
     d1c:	f88d 3000 	strb.w	r3, [sp]
     d20:	e7e5      	b.n	cee <gd25lb256e_erase+0x22>
     d22:	23d8      	movs	r3, #216	; 0xd8
     d24:	f88d 3000 	strb.w	r3, [sp]
     d28:	e7e1      	b.n	cee <gd25lb256e_erase+0x22>
     d2a:	2360      	movs	r3, #96	; 0x60
     d2c:	f88d 3000 	strb.w	r3, [sp]
     d30:	e7dd      	b.n	cee <gd25lb256e_erase+0x22>
     d32:	2320      	movs	r3, #32
     d34:	f88d 3000 	strb.w	r3, [sp]
     d38:	e7d9      	b.n	cee <gd25lb256e_erase+0x22>
     d3a:	b2e3      	uxtb	r3, r4
     d3c:	f88d 3004 	strb.w	r3, [sp, #4]
     d40:	f88d 3003 	strb.w	r3, [sp, #3]
     d44:	f88d 3002 	strb.w	r3, [sp, #2]
     d48:	f88d 3001 	strb.w	r3, [sp, #1]
     d4c:	2205      	movs	r2, #5
     d4e:	4669      	mov	r1, sp
     d50:	4801      	ldr	r0, [pc, #4]	; (d58 <gd25lb256e_erase+0x8c>)
     d52:	f7ff fa34 	bl	1be <drv_spim_tx_data>
     d56:	e7d9      	b.n	d0c <gd25lb256e_erase+0x40>
     d58:	000204c8 	andeq	r0, r2, r8, asr #9

00000d5c <gd25lb256e_read_data_bytes>:
     d5c:	b510      	push	{r4, lr}
     d5e:	b084      	sub	sp, #16
     d60:	2400      	movs	r4, #0
     d62:	9402      	str	r4, [sp, #8]
     d64:	f88d 400c 	strb.w	r4, [sp, #12]
     d68:	2403      	movs	r4, #3
     d6a:	f88d 4008 	strb.w	r4, [sp, #8]
     d6e:	b981      	cbnz	r1, d92 <gd25lb256e_read_data_bytes+0x36>
     d70:	3304      	adds	r3, #4
     d72:	b2c0      	uxtb	r0, r0
     d74:	f88d 000b 	strb.w	r0, [sp, #11]
     d78:	f88d 000a 	strb.w	r0, [sp, #10]
     d7c:	f88d 0009 	strb.w	r0, [sp, #9]
     d80:	2104      	movs	r1, #4
     d82:	9100      	str	r1, [sp, #0]
     d84:	b2db      	uxtb	r3, r3
     d86:	a902      	add	r1, sp, #8
     d88:	480b      	ldr	r0, [pc, #44]	; (db8 <gd25lb256e_read_data_bytes+0x5c>)
     d8a:	f7ff fb4e 	bl	42a <drv_spim_trans_frame_with_pending>
     d8e:	b004      	add	sp, #16
     d90:	bd10      	pop	{r4, pc}
     d92:	3305      	adds	r3, #5
     d94:	b2c0      	uxtb	r0, r0
     d96:	f88d 000c 	strb.w	r0, [sp, #12]
     d9a:	f88d 000b 	strb.w	r0, [sp, #11]
     d9e:	f88d 000a 	strb.w	r0, [sp, #10]
     da2:	f88d 0009 	strb.w	r0, [sp, #9]
     da6:	2105      	movs	r1, #5
     da8:	9100      	str	r1, [sp, #0]
     daa:	b2db      	uxtb	r3, r3
     dac:	a902      	add	r1, sp, #8
     dae:	4802      	ldr	r0, [pc, #8]	; (db8 <gd25lb256e_read_data_bytes+0x5c>)
     db0:	f7ff fb3b 	bl	42a <drv_spim_trans_frame_with_pending>
     db4:	e7eb      	b.n	d8e <gd25lb256e_read_data_bytes+0x32>
     db6:	bf00      	nop
     db8:	000204c8 	andeq	r0, r2, r8, asr #9

00000dbc <gd25lb256e_program_data_bytes>:
     dbc:	b5f0      	push	{r4, r5, r6, r7, lr}
     dbe:	b091      	sub	sp, #68	; 0x44
     dc0:	4605      	mov	r5, r0
     dc2:	460f      	mov	r7, r1
     dc4:	4616      	mov	r6, r2
     dc6:	461c      	mov	r4, r3
     dc8:	f7ff ff68 	bl	c9c <gd25lb256e_write_enable>
     dcc:	2302      	movs	r3, #2
     dce:	f88d 3000 	strb.w	r3, [sp]
     dd2:	b9c7      	cbnz	r7, e06 <gd25lb256e_program_data_bytes+0x4a>
     dd4:	4622      	mov	r2, r4
     dd6:	4631      	mov	r1, r6
     dd8:	a801      	add	r0, sp, #4
     dda:	f000 fa0d 	bl	11f8 <memcpy>
     dde:	1d22      	adds	r2, r4, #4
     de0:	b2eb      	uxtb	r3, r5
     de2:	f88d 3003 	strb.w	r3, [sp, #3]
     de6:	f88d 3002 	strb.w	r3, [sp, #2]
     dea:	f88d 3001 	strb.w	r3, [sp, #1]
     dee:	b2d2      	uxtb	r2, r2
     df0:	4669      	mov	r1, sp
     df2:	4810      	ldr	r0, [pc, #64]	; (e34 <gd25lb256e_program_data_bytes+0x78>)
     df4:	f7ff f9e3 	bl	1be <drv_spim_tx_data>
     df8:	f7ff ff32 	bl	c60 <gd25lb256e_read_status_reg>
     dfc:	f010 0f01 	tst.w	r0, #1
     e00:	d1fa      	bne.n	df8 <gd25lb256e_program_data_bytes+0x3c>
     e02:	b011      	add	sp, #68	; 0x44
     e04:	bdf0      	pop	{r4, r5, r6, r7, pc}
     e06:	4622      	mov	r2, r4
     e08:	4631      	mov	r1, r6
     e0a:	f10d 0005 	add.w	r0, sp, #5
     e0e:	f000 f9f3 	bl	11f8 <memcpy>
     e12:	1d62      	adds	r2, r4, #5
     e14:	b2eb      	uxtb	r3, r5
     e16:	f88d 3004 	strb.w	r3, [sp, #4]
     e1a:	f88d 3003 	strb.w	r3, [sp, #3]
     e1e:	f88d 3002 	strb.w	r3, [sp, #2]
     e22:	f88d 3001 	strb.w	r3, [sp, #1]
     e26:	b2d2      	uxtb	r2, r2
     e28:	4669      	mov	r1, sp
     e2a:	4802      	ldr	r0, [pc, #8]	; (e34 <gd25lb256e_program_data_bytes+0x78>)
     e2c:	f7ff f9c7 	bl	1be <drv_spim_tx_data>
     e30:	e7e2      	b.n	df8 <gd25lb256e_program_data_bytes+0x3c>
     e32:	bf00      	nop
     e34:	000204c8 	andeq	r0, r2, r8, asr #9

00000e38 <NMI_Handler>:
     e38:	b508      	push	{r3, lr}
     e3a:	4802      	ldr	r0, [pc, #8]	; (e44 <NMI_Handler+0xc>)
     e3c:	f000 f9c0 	bl	11c0 <test_printf_s>
     e40:	bd08      	pop	{r3, pc}
     e42:	bf00      	nop
     e44:	00001b38 	andeq	r1, r0, r8, lsr fp

00000e48 <HardFault_Handler>:
     e48:	e7fe      	b.n	e48 <HardFault_Handler>

00000e4a <MemManage_Handler>:
     e4a:	e7fe      	b.n	e4a <MemManage_Handler>

00000e4c <BusFault_Handler>:
     e4c:	e7fe      	b.n	e4c <BusFault_Handler>

00000e4e <UsageFault_Handler>:
     e4e:	e7fe      	b.n	e4e <UsageFault_Handler>

00000e50 <SVC_Handler>:
     e50:	4770      	bx	lr

00000e52 <DebugMon_Handler>:
     e52:	4770      	bx	lr

00000e54 <PendSV_Handler>:
     e54:	4770      	bx	lr

00000e56 <SysTick_Handler>:
     e56:	4770      	bx	lr

00000e58 <Uart0_Handler>:
     e58:	b508      	push	{r3, lr}
     e5a:	4b04      	ldr	r3, [pc, #16]	; (e6c <Uart0_Handler+0x14>)
     e5c:	2201      	movs	r2, #1
     e5e:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     e62:	4803      	ldr	r0, [pc, #12]	; (e70 <Uart0_Handler+0x18>)
     e64:	f7ff fd59 	bl	91a <drv_uart_interrupt_handler>
     e68:	bd08      	pop	{r3, pc}
     e6a:	bf00      	nop
     e6c:	e000e100 	and	lr, r0, r0, lsl #2
     e70:	00020564 	andeq	r0, r2, r4, ror #10

00000e74 <Spim_Handler>:
     e74:	b508      	push	{r3, lr}
     e76:	4b04      	ldr	r3, [pc, #16]	; (e88 <Spim_Handler+0x14>)
     e78:	f44f 2200 	mov.w	r2, #524288	; 0x80000
     e7c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     e80:	4802      	ldr	r0, [pc, #8]	; (e8c <Spim_Handler+0x18>)
     e82:	f7ff fc14 	bl	6ae <drv_spim_interrupt_handler>
     e86:	bd08      	pop	{r3, pc}
     e88:	e000e100 	and	lr, r0, r0, lsl #2
     e8c:	000204c8 	andeq	r0, r2, r8, asr #9

00000e90 <show_testmenu>:
     e90:	b570      	push	{r4, r5, r6, lr}
     e92:	4605      	mov	r5, r0
     e94:	460e      	mov	r6, r1
     e96:	480b      	ldr	r0, [pc, #44]	; (ec4 <show_testmenu+0x34>)
     e98:	f7ff fe84 	bl	ba4 <drv_uart_printf>
     e9c:	2400      	movs	r4, #0
     e9e:	e00b      	b.n	eb8 <show_testmenu+0x28>
     ea0:	eb04 1304 	add.w	r3, r4, r4, lsl #4
     ea4:	eb05 02c3 	add.w	r2, r5, r3, lsl #3
     ea8:	3208      	adds	r2, #8
     eaa:	f815 1033 	ldrb.w	r1, [r5, r3, lsl #3]
     eae:	4806      	ldr	r0, [pc, #24]	; (ec8 <show_testmenu+0x38>)
     eb0:	f7ff fe78 	bl	ba4 <drv_uart_printf>
     eb4:	3401      	adds	r4, #1
     eb6:	b2e4      	uxtb	r4, r4
     eb8:	42b4      	cmp	r4, r6
     eba:	d3f1      	bcc.n	ea0 <show_testmenu+0x10>
     ebc:	4803      	ldr	r0, [pc, #12]	; (ecc <show_testmenu+0x3c>)
     ebe:	f7ff fe71 	bl	ba4 <drv_uart_printf>
     ec2:	bd70      	pop	{r4, r5, r6, pc}
     ec4:	00001b3c 	andeq	r1, r0, ip, lsr fp
     ec8:	00001b58 	andeq	r1, r0, r8, asr fp
     ecc:	00001b60 	andeq	r1, r0, r0, ror #22

00000ed0 <test_execute>:
     ed0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
     ed4:	b082      	sub	sp, #8
     ed6:	4605      	mov	r5, r0
     ed8:	460e      	mov	r6, r1
     eda:	e01d      	b.n	f18 <test_execute+0x48>
     edc:	3401      	adds	r4, #1
     ede:	b2e4      	uxtb	r4, r4
     ee0:	42b4      	cmp	r4, r6
     ee2:	d216      	bcs.n	f12 <test_execute+0x42>
     ee4:	eb04 1304 	add.w	r3, r4, r4, lsl #4
     ee8:	eb05 07c3 	add.w	r7, r5, r3, lsl #3
     eec:	f815 2033 	ldrb.w	r2, [r5, r3, lsl #3]
     ef0:	f89d 3007 	ldrb.w	r3, [sp, #7]
     ef4:	429a      	cmp	r2, r3
     ef6:	d1f1      	bne.n	edc <test_execute+0xc>
     ef8:	f107 0808 	add.w	r8, r7, #8
     efc:	4641      	mov	r1, r8
     efe:	4814      	ldr	r0, [pc, #80]	; (f50 <test_execute+0x80>)
     f00:	f7ff fe50 	bl	ba4 <drv_uart_printf>
     f04:	687b      	ldr	r3, [r7, #4]
     f06:	4798      	blx	r3
     f08:	4641      	mov	r1, r8
     f0a:	4812      	ldr	r0, [pc, #72]	; (f54 <test_execute+0x84>)
     f0c:	f7ff fe4a 	bl	ba4 <drv_uart_printf>
     f10:	e7e4      	b.n	edc <test_execute+0xc>
     f12:	4811      	ldr	r0, [pc, #68]	; (f58 <test_execute+0x88>)
     f14:	f7ff fe46 	bl	ba4 <drv_uart_printf>
     f18:	2300      	movs	r3, #0
     f1a:	f88d 3007 	strb.w	r3, [sp, #7]
     f1e:	4a0f      	ldr	r2, [pc, #60]	; (f5c <test_execute+0x8c>)
     f20:	f10d 0107 	add.w	r1, sp, #7
     f24:	480e      	ldr	r0, [pc, #56]	; (f60 <test_execute+0x90>)
     f26:	f7ff fc91 	bl	84c <drv_uart_getchar_timeout>
     f2a:	4604      	mov	r4, r0
     f2c:	2800      	cmp	r0, #0
     f2e:	d1f3      	bne.n	f18 <test_execute+0x48>
     f30:	f89d 1007 	ldrb.w	r1, [sp, #7]
     f34:	480b      	ldr	r0, [pc, #44]	; (f64 <test_execute+0x94>)
     f36:	f7ff fe35 	bl	ba4 <drv_uart_printf>
     f3a:	f89d 3007 	ldrb.w	r3, [sp, #7]
     f3e:	2b51      	cmp	r3, #81	; 0x51
     f40:	d1ce      	bne.n	ee0 <test_execute+0x10>
     f42:	4809      	ldr	r0, [pc, #36]	; (f68 <test_execute+0x98>)
     f44:	f7ff fe2e 	bl	ba4 <drv_uart_printf>
     f48:	b002      	add	sp, #8
     f4a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
     f4e:	bf00      	nop
     f50:	00001bb8 			; <UNDEFINED> instruction: 0x00001bb8
     f54:	00001bc8 	andeq	r1, r0, r8, asr #23
     f58:	00001bd8 	ldrdeq	r1, [r0], -r8
     f5c:	0003d090 	muleq	r3, r0, r0
     f60:	00020564 	andeq	r0, r2, r4, ror #10
     f64:	00001b90 	muleq	r0, r0, fp
     f68:	00001ba0 	andeq	r1, r0, r0, lsr #23

00000f6c <mcu_testmenu>:
     f6c:	b510      	push	{r4, lr}
     f6e:	4c05      	ldr	r4, [pc, #20]	; (f84 <mcu_testmenu+0x18>)
     f70:	2101      	movs	r1, #1
     f72:	4620      	mov	r0, r4
     f74:	f7ff ff8c 	bl	e90 <show_testmenu>
     f78:	2101      	movs	r1, #1
     f7a:	4620      	mov	r0, r4
     f7c:	f7ff ffa8 	bl	ed0 <test_execute>
     f80:	bd10      	pop	{r4, pc}
     f82:	bf00      	nop
     f84:	00020000 	andeq	r0, r2, r0

00000f88 <main>:
     f88:	b508      	push	{r3, lr}
     f8a:	f000 f909 	bl	11a0 <uart0_init>
     f8e:	4803      	ldr	r0, [pc, #12]	; (f9c <main+0x14>)
     f90:	f000 f916 	bl	11c0 <test_printf_s>
     f94:	f7ff ffea 	bl	f6c <mcu_testmenu>
     f98:	e7fc      	b.n	f94 <main+0xc>
     f9a:	bf00      	nop
     f9c:	00001bec 	andeq	r1, r0, ip, ror #23

00000fa0 <gd25lb256e_erase_case>:
     fa0:	b508      	push	{r3, lr}
     fa2:	2200      	movs	r2, #0
     fa4:	4611      	mov	r1, r2
     fa6:	4610      	mov	r0, r2
     fa8:	f7ff fe90 	bl	ccc <gd25lb256e_erase>
     fac:	bd08      	pop	{r3, pc}

00000fae <gd25lb256e_write_latch>:
     fae:	b508      	push	{r3, lr}
     fb0:	f7ff fe74 	bl	c9c <gd25lb256e_write_enable>
     fb4:	bd08      	pop	{r3, pc}

00000fb6 <gd25lb256e_read_all_status>:
     fb6:	b508      	push	{r3, lr}
     fb8:	f7ff fe52 	bl	c60 <gd25lb256e_read_status_reg>
     fbc:	bd08      	pop	{r3, pc}
	...

00000fc0 <tx_flash_data_prepare>:
     fc0:	2300      	movs	r3, #0
     fc2:	e003      	b.n	fcc <tx_flash_data_prepare+0xc>
     fc4:	4a03      	ldr	r2, [pc, #12]	; (fd4 <tx_flash_data_prepare+0x14>)
     fc6:	54d3      	strb	r3, [r2, r3]
     fc8:	3301      	adds	r3, #1
     fca:	b2db      	uxtb	r3, r3
     fcc:	2b3f      	cmp	r3, #63	; 0x3f
     fce:	d9f9      	bls.n	fc4 <tx_flash_data_prepare+0x4>
     fd0:	4770      	bx	lr
     fd2:	bf00      	nop
     fd4:	00020524 	andeq	r0, r2, r4, lsr #10

00000fd8 <gd25lb256e_program_case>:
     fd8:	b508      	push	{r3, lr}
     fda:	f7ff fff1 	bl	fc0 <tx_flash_data_prepare>
     fde:	2320      	movs	r3, #32
     fe0:	4a02      	ldr	r2, [pc, #8]	; (fec <gd25lb256e_program_case+0x14>)
     fe2:	2100      	movs	r1, #0
     fe4:	4608      	mov	r0, r1
     fe6:	f7ff fee9 	bl	dbc <gd25lb256e_program_data_bytes>
     fea:	bd08      	pop	{r3, pc}
     fec:	00020524 	andeq	r0, r2, r4, lsr #10

00000ff0 <rx_flash_data_prepare>:
     ff0:	2300      	movs	r3, #0
     ff2:	e004      	b.n	ffe <rx_flash_data_prepare+0xe>
     ff4:	4a03      	ldr	r2, [pc, #12]	; (1004 <rx_flash_data_prepare+0x14>)
     ff6:	2100      	movs	r1, #0
     ff8:	54d1      	strb	r1, [r2, r3]
     ffa:	3301      	adds	r3, #1
     ffc:	b2db      	uxtb	r3, r3
     ffe:	2b3f      	cmp	r3, #63	; 0x3f
    1000:	d9f8      	bls.n	ff4 <rx_flash_data_prepare+0x4>
    1002:	4770      	bx	lr
    1004:	000204e4 	andeq	r0, r2, r4, ror #9

00001008 <gd25lb256e_read_id_case>:
    1008:	b510      	push	{r4, lr}
    100a:	f7ff fff1 	bl	ff0 <rx_flash_data_prepare>
    100e:	4809      	ldr	r0, [pc, #36]	; (1034 <gd25lb256e_read_id_case+0x2c>)
    1010:	f7ff fdfc 	bl	c0c <gd25lb256e_read_id>
    1014:	2400      	movs	r4, #0
    1016:	e006      	b.n	1026 <gd25lb256e_read_id_case+0x1e>
    1018:	4b06      	ldr	r3, [pc, #24]	; (1034 <gd25lb256e_read_id_case+0x2c>)
    101a:	5d19      	ldrb	r1, [r3, r4]
    101c:	4806      	ldr	r0, [pc, #24]	; (1038 <gd25lb256e_read_id_case+0x30>)
    101e:	f000 f8d3 	bl	11c8 <test_printf_ch>
    1022:	3401      	adds	r4, #1
    1024:	b2e4      	uxtb	r4, r4
    1026:	2c03      	cmp	r4, #3
    1028:	d9f6      	bls.n	1018 <gd25lb256e_read_id_case+0x10>
    102a:	4804      	ldr	r0, [pc, #16]	; (103c <gd25lb256e_read_id_case+0x34>)
    102c:	f000 f8c8 	bl	11c0 <test_printf_s>
    1030:	bd10      	pop	{r4, pc}
    1032:	bf00      	nop
    1034:	000204e4 	andeq	r0, r2, r4, ror #9
    1038:	00001b34 	andeq	r1, r0, r4, lsr fp
    103c:	00001c0c 	andeq	r1, r0, ip, lsl #24

00001040 <gd25lb256e_read_case>:
    1040:	b510      	push	{r4, lr}
    1042:	f7ff ffd5 	bl	ff0 <rx_flash_data_prepare>
    1046:	2320      	movs	r3, #32
    1048:	4a09      	ldr	r2, [pc, #36]	; (1070 <gd25lb256e_read_case+0x30>)
    104a:	2100      	movs	r1, #0
    104c:	4608      	mov	r0, r1
    104e:	f7ff fe85 	bl	d5c <gd25lb256e_read_data_bytes>
    1052:	4808      	ldr	r0, [pc, #32]	; (1074 <gd25lb256e_read_case+0x34>)
    1054:	f000 f8b4 	bl	11c0 <test_printf_s>
    1058:	2400      	movs	r4, #0
    105a:	e006      	b.n	106a <gd25lb256e_read_case+0x2a>
    105c:	4b04      	ldr	r3, [pc, #16]	; (1070 <gd25lb256e_read_case+0x30>)
    105e:	5d19      	ldrb	r1, [r3, r4]
    1060:	4805      	ldr	r0, [pc, #20]	; (1078 <gd25lb256e_read_case+0x38>)
    1062:	f000 f8b1 	bl	11c8 <test_printf_ch>
    1066:	3401      	adds	r4, #1
    1068:	b2e4      	uxtb	r4, r4
    106a:	2c1f      	cmp	r4, #31
    106c:	d9f6      	bls.n	105c <gd25lb256e_read_case+0x1c>
    106e:	bd10      	pop	{r4, pc}
    1070:	000204e4 	andeq	r0, r2, r4, ror #9
    1074:	00001c10 	andeq	r1, r0, r0, lsl ip
    1078:	00001b34 	andeq	r1, r0, r4, lsr fp

0000107c <gd25lb256e_operations_case>:
    107c:	b510      	push	{r4, lr}
    107e:	f7ff ff9f 	bl	fc0 <tx_flash_data_prepare>
    1082:	f7ff ffb5 	bl	ff0 <rx_flash_data_prepare>
    1086:	2200      	movs	r2, #0
    1088:	4611      	mov	r1, r2
    108a:	4610      	mov	r0, r2
    108c:	f7ff fe1e 	bl	ccc <gd25lb256e_erase>
    1090:	2310      	movs	r3, #16
    1092:	4a17      	ldr	r2, [pc, #92]	; (10f0 <gd25lb256e_operations_case+0x74>)
    1094:	2100      	movs	r1, #0
    1096:	4608      	mov	r0, r1
    1098:	f7ff fe60 	bl	d5c <gd25lb256e_read_data_bytes>
    109c:	4815      	ldr	r0, [pc, #84]	; (10f4 <gd25lb256e_operations_case+0x78>)
    109e:	f000 f88f 	bl	11c0 <test_printf_s>
    10a2:	2400      	movs	r4, #0
    10a4:	e006      	b.n	10b4 <gd25lb256e_operations_case+0x38>
    10a6:	4b12      	ldr	r3, [pc, #72]	; (10f0 <gd25lb256e_operations_case+0x74>)
    10a8:	5d19      	ldrb	r1, [r3, r4]
    10aa:	4813      	ldr	r0, [pc, #76]	; (10f8 <gd25lb256e_operations_case+0x7c>)
    10ac:	f000 f88c 	bl	11c8 <test_printf_ch>
    10b0:	3401      	adds	r4, #1
    10b2:	b2e4      	uxtb	r4, r4
    10b4:	2c0f      	cmp	r4, #15
    10b6:	d9f6      	bls.n	10a6 <gd25lb256e_operations_case+0x2a>
    10b8:	2310      	movs	r3, #16
    10ba:	4a10      	ldr	r2, [pc, #64]	; (10fc <gd25lb256e_operations_case+0x80>)
    10bc:	2100      	movs	r1, #0
    10be:	4608      	mov	r0, r1
    10c0:	f7ff fe7c 	bl	dbc <gd25lb256e_program_data_bytes>
    10c4:	2310      	movs	r3, #16
    10c6:	4a0a      	ldr	r2, [pc, #40]	; (10f0 <gd25lb256e_operations_case+0x74>)
    10c8:	2100      	movs	r1, #0
    10ca:	4608      	mov	r0, r1
    10cc:	f7ff fe46 	bl	d5c <gd25lb256e_read_data_bytes>
    10d0:	4808      	ldr	r0, [pc, #32]	; (10f4 <gd25lb256e_operations_case+0x78>)
    10d2:	f000 f875 	bl	11c0 <test_printf_s>
    10d6:	2400      	movs	r4, #0
    10d8:	e006      	b.n	10e8 <gd25lb256e_operations_case+0x6c>
    10da:	4b05      	ldr	r3, [pc, #20]	; (10f0 <gd25lb256e_operations_case+0x74>)
    10dc:	5d19      	ldrb	r1, [r3, r4]
    10de:	4806      	ldr	r0, [pc, #24]	; (10f8 <gd25lb256e_operations_case+0x7c>)
    10e0:	f000 f872 	bl	11c8 <test_printf_ch>
    10e4:	3401      	adds	r4, #1
    10e6:	b2e4      	uxtb	r4, r4
    10e8:	2c0f      	cmp	r4, #15
    10ea:	d9f6      	bls.n	10da <gd25lb256e_operations_case+0x5e>
    10ec:	bd10      	pop	{r4, pc}
    10ee:	bf00      	nop
    10f0:	000204e4 	andeq	r0, r2, r4, ror #9
    10f4:	00001c10 	andeq	r1, r0, r0, lsl ip
    10f8:	00001b34 	andeq	r1, r0, r4, lsr fp
    10fc:	00020524 	andeq	r0, r2, r4, lsr #10

00001100 <gd25lb256e_spi_flash_cases>:
    1100:	b510      	push	{r4, lr}
    1102:	f7ff fd5d 	bl	bc0 <spim_init_for_gd25lb256e>
    1106:	4c06      	ldr	r4, [pc, #24]	; (1120 <gd25lb256e_spi_flash_cases+0x20>)
    1108:	2107      	movs	r1, #7
    110a:	4620      	mov	r0, r4
    110c:	f7ff fec0 	bl	e90 <show_testmenu>
    1110:	2107      	movs	r1, #7
    1112:	4620      	mov	r0, r4
    1114:	f7ff fedc 	bl	ed0 <test_execute>
    1118:	f7ff fd70 	bl	bfc <spim_deinit_for_gd25lb256e>
    111c:	bd10      	pop	{r4, pc}
    111e:	bf00      	nop
    1120:	00020088 	andeq	r0, r2, r8, lsl #1

00001124 <Reset_Handler>:
    1124:	490a      	ldr	r1, [pc, #40]	; (1150 <Reset_Handler+0x2c>)
    1126:	4a0b      	ldr	r2, [pc, #44]	; (1154 <Reset_Handler+0x30>)
    1128:	4b0b      	ldr	r3, [pc, #44]	; (1158 <Reset_Handler+0x34>)
    112a:	1a9b      	subs	r3, r3, r2
    112c:	dd03      	ble.n	1136 <Reset_Handler+0x12>
    112e:	3b04      	subs	r3, #4
    1130:	58c8      	ldr	r0, [r1, r3]
    1132:	50d0      	str	r0, [r2, r3]
    1134:	dcfb      	bgt.n	112e <Reset_Handler+0xa>
    1136:	4909      	ldr	r1, [pc, #36]	; (115c <Reset_Handler+0x38>)
    1138:	4a09      	ldr	r2, [pc, #36]	; (1160 <Reset_Handler+0x3c>)
    113a:	2000      	movs	r0, #0
    113c:	4291      	cmp	r1, r2
    113e:	bfbc      	itt	lt
    1140:	f841 0b04 	strlt.w	r0, [r1], #4
    1144:	e7fa      	blt.n	113c <Reset_Handler+0x18>
    1146:	f7ff ff1f 	bl	f88 <main>
    114a:	f000 f841 	bl	11d0 <exit>
    114e:	1c580000 	mrane	r0, r8, acc0
    1152:	00000000 	andeq	r0, r0, r0
    1156:	04ac0002 	strteq	r0, [ip], #2
    115a:	04ac0002 	strteq	r0, [ip], #2
    115e:	05940002 	ldreq	r0, [r4, #2]
    1162:	e7fe0002 	ldrb	r0, [lr, r2]!
    1166:	e7fe      	b.n	1166 <Reset_Handler+0x42>
    1168:	e7fe      	b.n	1168 <Reset_Handler+0x44>
    116a:	e7fe      	b.n	116a <Reset_Handler+0x46>
    116c:	e7fe      	b.n	116c <Reset_Handler+0x48>
    116e:	e7fe      	b.n	116e <Reset_Handler+0x4a>
    1170:	e7fe      	b.n	1170 <Reset_Handler+0x4c>
    1172:	e7fe      	b.n	1172 <Reset_Handler+0x4e>
    1174:	e7fe      	b.n	1174 <Reset_Handler+0x50>
    1176:	e7fe      	b.n	1176 <Reset_Handler+0x52>

00001178 <Uart1_Handler>:
    1178:	e7fe      	b.n	1178 <Uart1_Handler>

0000117a <Resv2_Handler>:
    117a:	e7fe      	b.n	117a <Resv2_Handler>

0000117c <Resv3_Handler>:
    117c:	e7fe      	b.n	117c <Resv3_Handler>

0000117e <EthDma_Handler>:
    117e:	e7fe      	b.n	117e <EthDma_Handler>

00001180 <Gpioa_Handler>:
    1180:	e7fe      	b.n	1180 <Gpioa_Handler>

00001182 <Resv6_Handler>:
    1182:	e7fe      	b.n	1182 <Resv6_Handler>

00001184 <Resv7_Handler>:
    1184:	e7fe      	b.n	1184 <Resv7_Handler>

00001186 <Bastim_Ch0_Handler>:
    1186:	e7fe      	b.n	1186 <Bastim_Ch0_Handler>

00001188 <Bastim_Ch1_Handler>:
    1188:	e7fe      	b.n	1188 <Bastim_Ch1_Handler>

0000118a <Bastim_Ch2_Handler>:
    118a:	e7fe      	b.n	118a <Bastim_Ch2_Handler>

0000118c <Bastim_Ch3_Handler>:
    118c:	e7fe      	b.n	118c <Bastim_Ch3_Handler>

0000118e <EthSma_Handler>:
    118e:	e7fe      	b.n	118e <EthSma_Handler>

00001190 <EthTx_Handler>:
    1190:	e7fe      	b.n	1190 <EthTx_Handler>

00001192 <EthRx_Handler>:
    1192:	e7fe      	b.n	1192 <EthRx_Handler>

00001194 <Resv15_Handler>:
    1194:	e7fe      	b.n	1194 <Resv15_Handler>

00001196 <AdvtimGen_Handler>:
    1196:	e7fe      	b.n	1196 <AdvtimGen_Handler>

00001198 <AdvtimCap_Handler>:
    1198:	e7fe      	b.n	1198 <AdvtimCap_Handler>

0000119a <AdvtimEnc_Handler>:
    119a:	e7fe      	b.n	119a <AdvtimEnc_Handler>
    119c:	e7fe      	b.n	119c <AdvtimEnc_Handler+0x2>
    119e:	bf00      	nop

000011a0 <uart0_init>:
    11a0:	b510      	push	{r4, lr}
    11a2:	4c05      	ldr	r4, [pc, #20]	; (11b8 <uart0_init+0x18>)
    11a4:	4b05      	ldr	r3, [pc, #20]	; (11bc <uart0_init+0x1c>)
    11a6:	6023      	str	r3, [r4, #0]
    11a8:	4620      	mov	r0, r4
    11aa:	f7ff fab2 	bl	712 <drv_uart_default_config>
    11ae:	4620      	mov	r0, r4
    11b0:	f7ff fae2 	bl	778 <drv_uart_init>
    11b4:	bd10      	pop	{r4, pc}
    11b6:	bf00      	nop
    11b8:	00020564 	andeq	r0, r2, r4, ror #10
    11bc:	40001000 	andmi	r1, r0, r0

000011c0 <test_printf_s>:
    11c0:	b508      	push	{r3, lr}
    11c2:	f7ff fcef 	bl	ba4 <drv_uart_printf>
    11c6:	bd08      	pop	{r3, pc}

000011c8 <test_printf_ch>:
    11c8:	b508      	push	{r3, lr}
    11ca:	f7ff fceb 	bl	ba4 <drv_uart_printf>
    11ce:	bd08      	pop	{r3, pc}

000011d0 <exit>:
    11d0:	b508      	push	{r3, lr}
    11d2:	4b07      	ldr	r3, [pc, #28]	; (11f0 <exit+0x20>)
    11d4:	4604      	mov	r4, r0
    11d6:	b113      	cbz	r3, 11de <exit+0xe>
    11d8:	2100      	movs	r1, #0
    11da:	f3af 8000 	nop.w
    11de:	4b05      	ldr	r3, [pc, #20]	; (11f4 <exit+0x24>)
    11e0:	6818      	ldr	r0, [r3, #0]
    11e2:	6a83      	ldr	r3, [r0, #40]	; 0x28
    11e4:	b103      	cbz	r3, 11e8 <exit+0x18>
    11e6:	4798      	blx	r3
    11e8:	4620      	mov	r0, r4
    11ea:	f000 fc95 	bl	1b18 <_exit>
    11ee:	bf00      	nop
    11f0:	00000000 	andeq	r0, r0, r0
    11f4:	00001c1c 	andeq	r1, r0, ip, lsl ip

000011f8 <memcpy>:
    11f8:	440a      	add	r2, r1
    11fa:	4291      	cmp	r1, r2
    11fc:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
    1200:	d100      	bne.n	1204 <memcpy+0xc>
    1202:	4770      	bx	lr
    1204:	b510      	push	{r4, lr}
    1206:	f811 4b01 	ldrb.w	r4, [r1], #1
    120a:	4291      	cmp	r1, r2
    120c:	f803 4f01 	strb.w	r4, [r3, #1]!
    1210:	d1f9      	bne.n	1206 <memcpy+0xe>
    1212:	bd10      	pop	{r4, pc}

00001214 <strlen>:
    1214:	4603      	mov	r3, r0
    1216:	f813 2b01 	ldrb.w	r2, [r3], #1
    121a:	2a00      	cmp	r2, #0
    121c:	d1fb      	bne.n	1216 <strlen+0x2>
    121e:	1a18      	subs	r0, r3, r0
    1220:	3801      	subs	r0, #1
    1222:	4770      	bx	lr

00001224 <_vsiprintf_r>:
    1224:	b500      	push	{lr}
    1226:	b09b      	sub	sp, #108	; 0x6c
    1228:	9100      	str	r1, [sp, #0]
    122a:	9104      	str	r1, [sp, #16]
    122c:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
    1230:	9105      	str	r1, [sp, #20]
    1232:	9102      	str	r1, [sp, #8]
    1234:	4905      	ldr	r1, [pc, #20]	; (124c <_vsiprintf_r+0x28>)
    1236:	9103      	str	r1, [sp, #12]
    1238:	4669      	mov	r1, sp
    123a:	f000 f86f 	bl	131c <_svfiprintf_r>
    123e:	2200      	movs	r2, #0
    1240:	9b00      	ldr	r3, [sp, #0]
    1242:	701a      	strb	r2, [r3, #0]
    1244:	b01b      	add	sp, #108	; 0x6c
    1246:	f85d fb04 	ldr.w	pc, [sp], #4
    124a:	bf00      	nop
    124c:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

00001250 <vsiprintf>:
    1250:	4613      	mov	r3, r2
    1252:	460a      	mov	r2, r1
    1254:	4601      	mov	r1, r0
    1256:	4802      	ldr	r0, [pc, #8]	; (1260 <vsiprintf+0x10>)
    1258:	6800      	ldr	r0, [r0, #0]
    125a:	f7ff bfe3 	b.w	1224 <_vsiprintf_r>
    125e:	bf00      	nop
    1260:	00020440 	andeq	r0, r2, r0, asr #8

00001264 <__ssputs_r>:
    1264:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1268:	688e      	ldr	r6, [r1, #8]
    126a:	4682      	mov	sl, r0
    126c:	429e      	cmp	r6, r3
    126e:	460c      	mov	r4, r1
    1270:	4690      	mov	r8, r2
    1272:	461f      	mov	r7, r3
    1274:	d838      	bhi.n	12e8 <__ssputs_r+0x84>
    1276:	898a      	ldrh	r2, [r1, #12]
    1278:	f412 6f90 	tst.w	r2, #1152	; 0x480
    127c:	d032      	beq.n	12e4 <__ssputs_r+0x80>
    127e:	6825      	ldr	r5, [r4, #0]
    1280:	6909      	ldr	r1, [r1, #16]
    1282:	3301      	adds	r3, #1
    1284:	eba5 0901 	sub.w	r9, r5, r1
    1288:	6965      	ldr	r5, [r4, #20]
    128a:	444b      	add	r3, r9
    128c:	eb05 0545 	add.w	r5, r5, r5, lsl #1
    1290:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
    1294:	106d      	asrs	r5, r5, #1
    1296:	429d      	cmp	r5, r3
    1298:	bf38      	it	cc
    129a:	461d      	movcc	r5, r3
    129c:	0553      	lsls	r3, r2, #21
    129e:	d531      	bpl.n	1304 <__ssputs_r+0xa0>
    12a0:	4629      	mov	r1, r5
    12a2:	f000 fb61 	bl	1968 <_malloc_r>
    12a6:	4606      	mov	r6, r0
    12a8:	b950      	cbnz	r0, 12c0 <__ssputs_r+0x5c>
    12aa:	230c      	movs	r3, #12
    12ac:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    12b0:	f8ca 3000 	str.w	r3, [sl]
    12b4:	89a3      	ldrh	r3, [r4, #12]
    12b6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    12ba:	81a3      	strh	r3, [r4, #12]
    12bc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    12c0:	464a      	mov	r2, r9
    12c2:	6921      	ldr	r1, [r4, #16]
    12c4:	f7ff ff98 	bl	11f8 <memcpy>
    12c8:	89a3      	ldrh	r3, [r4, #12]
    12ca:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
    12ce:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    12d2:	81a3      	strh	r3, [r4, #12]
    12d4:	6126      	str	r6, [r4, #16]
    12d6:	444e      	add	r6, r9
    12d8:	6026      	str	r6, [r4, #0]
    12da:	463e      	mov	r6, r7
    12dc:	6165      	str	r5, [r4, #20]
    12de:	eba5 0509 	sub.w	r5, r5, r9
    12e2:	60a5      	str	r5, [r4, #8]
    12e4:	42be      	cmp	r6, r7
    12e6:	d900      	bls.n	12ea <__ssputs_r+0x86>
    12e8:	463e      	mov	r6, r7
    12ea:	4632      	mov	r2, r6
    12ec:	4641      	mov	r1, r8
    12ee:	6820      	ldr	r0, [r4, #0]
    12f0:	f000 fab8 	bl	1864 <memmove>
    12f4:	68a3      	ldr	r3, [r4, #8]
    12f6:	2000      	movs	r0, #0
    12f8:	1b9b      	subs	r3, r3, r6
    12fa:	60a3      	str	r3, [r4, #8]
    12fc:	6823      	ldr	r3, [r4, #0]
    12fe:	4433      	add	r3, r6
    1300:	6023      	str	r3, [r4, #0]
    1302:	e7db      	b.n	12bc <__ssputs_r+0x58>
    1304:	462a      	mov	r2, r5
    1306:	f000 fba3 	bl	1a50 <_realloc_r>
    130a:	4606      	mov	r6, r0
    130c:	2800      	cmp	r0, #0
    130e:	d1e1      	bne.n	12d4 <__ssputs_r+0x70>
    1310:	4650      	mov	r0, sl
    1312:	6921      	ldr	r1, [r4, #16]
    1314:	f000 fac0 	bl	1898 <_free_r>
    1318:	e7c7      	b.n	12aa <__ssputs_r+0x46>
	...

0000131c <_svfiprintf_r>:
    131c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1320:	4698      	mov	r8, r3
    1322:	898b      	ldrh	r3, [r1, #12]
    1324:	4607      	mov	r7, r0
    1326:	061b      	lsls	r3, r3, #24
    1328:	460d      	mov	r5, r1
    132a:	4614      	mov	r4, r2
    132c:	b09d      	sub	sp, #116	; 0x74
    132e:	d50e      	bpl.n	134e <_svfiprintf_r+0x32>
    1330:	690b      	ldr	r3, [r1, #16]
    1332:	b963      	cbnz	r3, 134e <_svfiprintf_r+0x32>
    1334:	2140      	movs	r1, #64	; 0x40
    1336:	f000 fb17 	bl	1968 <_malloc_r>
    133a:	6028      	str	r0, [r5, #0]
    133c:	6128      	str	r0, [r5, #16]
    133e:	b920      	cbnz	r0, 134a <_svfiprintf_r+0x2e>
    1340:	230c      	movs	r3, #12
    1342:	603b      	str	r3, [r7, #0]
    1344:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1348:	e0d1      	b.n	14ee <_svfiprintf_r+0x1d2>
    134a:	2340      	movs	r3, #64	; 0x40
    134c:	616b      	str	r3, [r5, #20]
    134e:	2300      	movs	r3, #0
    1350:	9309      	str	r3, [sp, #36]	; 0x24
    1352:	2320      	movs	r3, #32
    1354:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
    1358:	2330      	movs	r3, #48	; 0x30
    135a:	f04f 0901 	mov.w	r9, #1
    135e:	f8cd 800c 	str.w	r8, [sp, #12]
    1362:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 1508 <_svfiprintf_r+0x1ec>
    1366:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
    136a:	4623      	mov	r3, r4
    136c:	469a      	mov	sl, r3
    136e:	f813 2b01 	ldrb.w	r2, [r3], #1
    1372:	b10a      	cbz	r2, 1378 <_svfiprintf_r+0x5c>
    1374:	2a25      	cmp	r2, #37	; 0x25
    1376:	d1f9      	bne.n	136c <_svfiprintf_r+0x50>
    1378:	ebba 0b04 	subs.w	fp, sl, r4
    137c:	d00b      	beq.n	1396 <_svfiprintf_r+0x7a>
    137e:	465b      	mov	r3, fp
    1380:	4622      	mov	r2, r4
    1382:	4629      	mov	r1, r5
    1384:	4638      	mov	r0, r7
    1386:	f7ff ff6d 	bl	1264 <__ssputs_r>
    138a:	3001      	adds	r0, #1
    138c:	f000 80aa 	beq.w	14e4 <_svfiprintf_r+0x1c8>
    1390:	9a09      	ldr	r2, [sp, #36]	; 0x24
    1392:	445a      	add	r2, fp
    1394:	9209      	str	r2, [sp, #36]	; 0x24
    1396:	f89a 3000 	ldrb.w	r3, [sl]
    139a:	2b00      	cmp	r3, #0
    139c:	f000 80a2 	beq.w	14e4 <_svfiprintf_r+0x1c8>
    13a0:	2300      	movs	r3, #0
    13a2:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    13a6:	e9cd 2305 	strd	r2, r3, [sp, #20]
    13aa:	f10a 0a01 	add.w	sl, sl, #1
    13ae:	9304      	str	r3, [sp, #16]
    13b0:	9307      	str	r3, [sp, #28]
    13b2:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
    13b6:	931a      	str	r3, [sp, #104]	; 0x68
    13b8:	4654      	mov	r4, sl
    13ba:	2205      	movs	r2, #5
    13bc:	f814 1b01 	ldrb.w	r1, [r4], #1
    13c0:	4851      	ldr	r0, [pc, #324]	; (1508 <_svfiprintf_r+0x1ec>)
    13c2:	f000 fa41 	bl	1848 <memchr>
    13c6:	9a04      	ldr	r2, [sp, #16]
    13c8:	b9d8      	cbnz	r0, 1402 <_svfiprintf_r+0xe6>
    13ca:	06d0      	lsls	r0, r2, #27
    13cc:	bf44      	itt	mi
    13ce:	2320      	movmi	r3, #32
    13d0:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    13d4:	0711      	lsls	r1, r2, #28
    13d6:	bf44      	itt	mi
    13d8:	232b      	movmi	r3, #43	; 0x2b
    13da:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    13de:	f89a 3000 	ldrb.w	r3, [sl]
    13e2:	2b2a      	cmp	r3, #42	; 0x2a
    13e4:	d015      	beq.n	1412 <_svfiprintf_r+0xf6>
    13e6:	4654      	mov	r4, sl
    13e8:	2000      	movs	r0, #0
    13ea:	f04f 0c0a 	mov.w	ip, #10
    13ee:	9a07      	ldr	r2, [sp, #28]
    13f0:	4621      	mov	r1, r4
    13f2:	f811 3b01 	ldrb.w	r3, [r1], #1
    13f6:	3b30      	subs	r3, #48	; 0x30
    13f8:	2b09      	cmp	r3, #9
    13fa:	d94e      	bls.n	149a <_svfiprintf_r+0x17e>
    13fc:	b1b0      	cbz	r0, 142c <_svfiprintf_r+0x110>
    13fe:	9207      	str	r2, [sp, #28]
    1400:	e014      	b.n	142c <_svfiprintf_r+0x110>
    1402:	eba0 0308 	sub.w	r3, r0, r8
    1406:	fa09 f303 	lsl.w	r3, r9, r3
    140a:	4313      	orrs	r3, r2
    140c:	46a2      	mov	sl, r4
    140e:	9304      	str	r3, [sp, #16]
    1410:	e7d2      	b.n	13b8 <_svfiprintf_r+0x9c>
    1412:	9b03      	ldr	r3, [sp, #12]
    1414:	1d19      	adds	r1, r3, #4
    1416:	681b      	ldr	r3, [r3, #0]
    1418:	9103      	str	r1, [sp, #12]
    141a:	2b00      	cmp	r3, #0
    141c:	bfbb      	ittet	lt
    141e:	425b      	neglt	r3, r3
    1420:	f042 0202 	orrlt.w	r2, r2, #2
    1424:	9307      	strge	r3, [sp, #28]
    1426:	9307      	strlt	r3, [sp, #28]
    1428:	bfb8      	it	lt
    142a:	9204      	strlt	r2, [sp, #16]
    142c:	7823      	ldrb	r3, [r4, #0]
    142e:	2b2e      	cmp	r3, #46	; 0x2e
    1430:	d10c      	bne.n	144c <_svfiprintf_r+0x130>
    1432:	7863      	ldrb	r3, [r4, #1]
    1434:	2b2a      	cmp	r3, #42	; 0x2a
    1436:	d135      	bne.n	14a4 <_svfiprintf_r+0x188>
    1438:	9b03      	ldr	r3, [sp, #12]
    143a:	3402      	adds	r4, #2
    143c:	1d1a      	adds	r2, r3, #4
    143e:	681b      	ldr	r3, [r3, #0]
    1440:	9203      	str	r2, [sp, #12]
    1442:	2b00      	cmp	r3, #0
    1444:	bfb8      	it	lt
    1446:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
    144a:	9305      	str	r3, [sp, #20]
    144c:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 150c <_svfiprintf_r+0x1f0>
    1450:	2203      	movs	r2, #3
    1452:	4650      	mov	r0, sl
    1454:	7821      	ldrb	r1, [r4, #0]
    1456:	f000 f9f7 	bl	1848 <memchr>
    145a:	b140      	cbz	r0, 146e <_svfiprintf_r+0x152>
    145c:	2340      	movs	r3, #64	; 0x40
    145e:	eba0 000a 	sub.w	r0, r0, sl
    1462:	fa03 f000 	lsl.w	r0, r3, r0
    1466:	9b04      	ldr	r3, [sp, #16]
    1468:	3401      	adds	r4, #1
    146a:	4303      	orrs	r3, r0
    146c:	9304      	str	r3, [sp, #16]
    146e:	f814 1b01 	ldrb.w	r1, [r4], #1
    1472:	2206      	movs	r2, #6
    1474:	4826      	ldr	r0, [pc, #152]	; (1510 <_svfiprintf_r+0x1f4>)
    1476:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
    147a:	f000 f9e5 	bl	1848 <memchr>
    147e:	2800      	cmp	r0, #0
    1480:	d038      	beq.n	14f4 <_svfiprintf_r+0x1d8>
    1482:	4b24      	ldr	r3, [pc, #144]	; (1514 <_svfiprintf_r+0x1f8>)
    1484:	bb1b      	cbnz	r3, 14ce <_svfiprintf_r+0x1b2>
    1486:	9b03      	ldr	r3, [sp, #12]
    1488:	3307      	adds	r3, #7
    148a:	f023 0307 	bic.w	r3, r3, #7
    148e:	3308      	adds	r3, #8
    1490:	9303      	str	r3, [sp, #12]
    1492:	9b09      	ldr	r3, [sp, #36]	; 0x24
    1494:	4433      	add	r3, r6
    1496:	9309      	str	r3, [sp, #36]	; 0x24
    1498:	e767      	b.n	136a <_svfiprintf_r+0x4e>
    149a:	460c      	mov	r4, r1
    149c:	2001      	movs	r0, #1
    149e:	fb0c 3202 	mla	r2, ip, r2, r3
    14a2:	e7a5      	b.n	13f0 <_svfiprintf_r+0xd4>
    14a4:	2300      	movs	r3, #0
    14a6:	f04f 0c0a 	mov.w	ip, #10
    14aa:	4619      	mov	r1, r3
    14ac:	3401      	adds	r4, #1
    14ae:	9305      	str	r3, [sp, #20]
    14b0:	4620      	mov	r0, r4
    14b2:	f810 2b01 	ldrb.w	r2, [r0], #1
    14b6:	3a30      	subs	r2, #48	; 0x30
    14b8:	2a09      	cmp	r2, #9
    14ba:	d903      	bls.n	14c4 <_svfiprintf_r+0x1a8>
    14bc:	2b00      	cmp	r3, #0
    14be:	d0c5      	beq.n	144c <_svfiprintf_r+0x130>
    14c0:	9105      	str	r1, [sp, #20]
    14c2:	e7c3      	b.n	144c <_svfiprintf_r+0x130>
    14c4:	4604      	mov	r4, r0
    14c6:	2301      	movs	r3, #1
    14c8:	fb0c 2101 	mla	r1, ip, r1, r2
    14cc:	e7f0      	b.n	14b0 <_svfiprintf_r+0x194>
    14ce:	ab03      	add	r3, sp, #12
    14d0:	9300      	str	r3, [sp, #0]
    14d2:	462a      	mov	r2, r5
    14d4:	4638      	mov	r0, r7
    14d6:	4b10      	ldr	r3, [pc, #64]	; (1518 <_svfiprintf_r+0x1fc>)
    14d8:	a904      	add	r1, sp, #16
    14da:	f3af 8000 	nop.w
    14de:	1c42      	adds	r2, r0, #1
    14e0:	4606      	mov	r6, r0
    14e2:	d1d6      	bne.n	1492 <_svfiprintf_r+0x176>
    14e4:	89ab      	ldrh	r3, [r5, #12]
    14e6:	065b      	lsls	r3, r3, #25
    14e8:	f53f af2c 	bmi.w	1344 <_svfiprintf_r+0x28>
    14ec:	9809      	ldr	r0, [sp, #36]	; 0x24
    14ee:	b01d      	add	sp, #116	; 0x74
    14f0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    14f4:	ab03      	add	r3, sp, #12
    14f6:	9300      	str	r3, [sp, #0]
    14f8:	462a      	mov	r2, r5
    14fa:	4638      	mov	r0, r7
    14fc:	4b06      	ldr	r3, [pc, #24]	; (1518 <_svfiprintf_r+0x1fc>)
    14fe:	a904      	add	r1, sp, #16
    1500:	f000 f87c 	bl	15fc <_printf_i>
    1504:	e7eb      	b.n	14de <_svfiprintf_r+0x1c2>
    1506:	bf00      	nop
    1508:	00001c20 	andeq	r1, r0, r0, lsr #24
    150c:	00001c26 	andeq	r1, r0, r6, lsr #24
    1510:	00001c2a 	andeq	r1, r0, sl, lsr #24
    1514:	00000000 	andeq	r0, r0, r0
    1518:	00001265 	andeq	r1, r0, r5, ror #4

0000151c <_printf_common>:
    151c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1520:	4616      	mov	r6, r2
    1522:	4699      	mov	r9, r3
    1524:	688a      	ldr	r2, [r1, #8]
    1526:	690b      	ldr	r3, [r1, #16]
    1528:	4607      	mov	r7, r0
    152a:	4293      	cmp	r3, r2
    152c:	bfb8      	it	lt
    152e:	4613      	movlt	r3, r2
    1530:	6033      	str	r3, [r6, #0]
    1532:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
    1536:	460c      	mov	r4, r1
    1538:	f8dd 8020 	ldr.w	r8, [sp, #32]
    153c:	b10a      	cbz	r2, 1542 <_printf_common+0x26>
    153e:	3301      	adds	r3, #1
    1540:	6033      	str	r3, [r6, #0]
    1542:	6823      	ldr	r3, [r4, #0]
    1544:	0699      	lsls	r1, r3, #26
    1546:	bf42      	ittt	mi
    1548:	6833      	ldrmi	r3, [r6, #0]
    154a:	3302      	addmi	r3, #2
    154c:	6033      	strmi	r3, [r6, #0]
    154e:	6825      	ldr	r5, [r4, #0]
    1550:	f015 0506 	ands.w	r5, r5, #6
    1554:	d106      	bne.n	1564 <_printf_common+0x48>
    1556:	f104 0a19 	add.w	sl, r4, #25
    155a:	68e3      	ldr	r3, [r4, #12]
    155c:	6832      	ldr	r2, [r6, #0]
    155e:	1a9b      	subs	r3, r3, r2
    1560:	42ab      	cmp	r3, r5
    1562:	dc28      	bgt.n	15b6 <_printf_common+0x9a>
    1564:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
    1568:	1e13      	subs	r3, r2, #0
    156a:	6822      	ldr	r2, [r4, #0]
    156c:	bf18      	it	ne
    156e:	2301      	movne	r3, #1
    1570:	0692      	lsls	r2, r2, #26
    1572:	d42d      	bmi.n	15d0 <_printf_common+0xb4>
    1574:	4649      	mov	r1, r9
    1576:	4638      	mov	r0, r7
    1578:	f104 0243 	add.w	r2, r4, #67	; 0x43
    157c:	47c0      	blx	r8
    157e:	3001      	adds	r0, #1
    1580:	d020      	beq.n	15c4 <_printf_common+0xa8>
    1582:	6823      	ldr	r3, [r4, #0]
    1584:	68e5      	ldr	r5, [r4, #12]
    1586:	f003 0306 	and.w	r3, r3, #6
    158a:	2b04      	cmp	r3, #4
    158c:	bf18      	it	ne
    158e:	2500      	movne	r5, #0
    1590:	6832      	ldr	r2, [r6, #0]
    1592:	f04f 0600 	mov.w	r6, #0
    1596:	68a3      	ldr	r3, [r4, #8]
    1598:	bf08      	it	eq
    159a:	1aad      	subeq	r5, r5, r2
    159c:	6922      	ldr	r2, [r4, #16]
    159e:	bf08      	it	eq
    15a0:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
    15a4:	4293      	cmp	r3, r2
    15a6:	bfc4      	itt	gt
    15a8:	1a9b      	subgt	r3, r3, r2
    15aa:	18ed      	addgt	r5, r5, r3
    15ac:	341a      	adds	r4, #26
    15ae:	42b5      	cmp	r5, r6
    15b0:	d11a      	bne.n	15e8 <_printf_common+0xcc>
    15b2:	2000      	movs	r0, #0
    15b4:	e008      	b.n	15c8 <_printf_common+0xac>
    15b6:	2301      	movs	r3, #1
    15b8:	4652      	mov	r2, sl
    15ba:	4649      	mov	r1, r9
    15bc:	4638      	mov	r0, r7
    15be:	47c0      	blx	r8
    15c0:	3001      	adds	r0, #1
    15c2:	d103      	bne.n	15cc <_printf_common+0xb0>
    15c4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    15c8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    15cc:	3501      	adds	r5, #1
    15ce:	e7c4      	b.n	155a <_printf_common+0x3e>
    15d0:	2030      	movs	r0, #48	; 0x30
    15d2:	18e1      	adds	r1, r4, r3
    15d4:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
    15d8:	1c5a      	adds	r2, r3, #1
    15da:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
    15de:	4422      	add	r2, r4
    15e0:	3302      	adds	r3, #2
    15e2:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
    15e6:	e7c5      	b.n	1574 <_printf_common+0x58>
    15e8:	2301      	movs	r3, #1
    15ea:	4622      	mov	r2, r4
    15ec:	4649      	mov	r1, r9
    15ee:	4638      	mov	r0, r7
    15f0:	47c0      	blx	r8
    15f2:	3001      	adds	r0, #1
    15f4:	d0e6      	beq.n	15c4 <_printf_common+0xa8>
    15f6:	3601      	adds	r6, #1
    15f8:	e7d9      	b.n	15ae <_printf_common+0x92>
	...

000015fc <_printf_i>:
    15fc:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
    1600:	7e0f      	ldrb	r7, [r1, #24]
    1602:	4691      	mov	r9, r2
    1604:	2f78      	cmp	r7, #120	; 0x78
    1606:	4680      	mov	r8, r0
    1608:	460c      	mov	r4, r1
    160a:	469a      	mov	sl, r3
    160c:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    160e:	f101 0243 	add.w	r2, r1, #67	; 0x43
    1612:	d807      	bhi.n	1624 <_printf_i+0x28>
    1614:	2f62      	cmp	r7, #98	; 0x62
    1616:	d80a      	bhi.n	162e <_printf_i+0x32>
    1618:	2f00      	cmp	r7, #0
    161a:	f000 80d9 	beq.w	17d0 <_printf_i+0x1d4>
    161e:	2f58      	cmp	r7, #88	; 0x58
    1620:	f000 80a4 	beq.w	176c <_printf_i+0x170>
    1624:	f104 0542 	add.w	r5, r4, #66	; 0x42
    1628:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
    162c:	e03a      	b.n	16a4 <_printf_i+0xa8>
    162e:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
    1632:	2b15      	cmp	r3, #21
    1634:	d8f6      	bhi.n	1624 <_printf_i+0x28>
    1636:	a101      	add	r1, pc, #4	; (adr r1, 163c <_printf_i+0x40>)
    1638:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    163c:	00001695 	muleq	r0, r5, r6
    1640:	000016a9 	andeq	r1, r0, r9, lsr #13
    1644:	00001625 	andeq	r1, r0, r5, lsr #12
    1648:	00001625 	andeq	r1, r0, r5, lsr #12
    164c:	00001625 	andeq	r1, r0, r5, lsr #12
    1650:	00001625 	andeq	r1, r0, r5, lsr #12
    1654:	000016a9 	andeq	r1, r0, r9, lsr #13
    1658:	00001625 	andeq	r1, r0, r5, lsr #12
    165c:	00001625 	andeq	r1, r0, r5, lsr #12
    1660:	00001625 	andeq	r1, r0, r5, lsr #12
    1664:	00001625 	andeq	r1, r0, r5, lsr #12
    1668:	000017b7 			; <UNDEFINED> instruction: 0x000017b7
    166c:	000016d9 	ldrdeq	r1, [r0], -r9
    1670:	00001799 	muleq	r0, r9, r7
    1674:	00001625 	andeq	r1, r0, r5, lsr #12
    1678:	00001625 	andeq	r1, r0, r5, lsr #12
    167c:	000017d9 	ldrdeq	r1, [r0], -r9
    1680:	00001625 	andeq	r1, r0, r5, lsr #12
    1684:	000016d9 	ldrdeq	r1, [r0], -r9
    1688:	00001625 	andeq	r1, r0, r5, lsr #12
    168c:	00001625 	andeq	r1, r0, r5, lsr #12
    1690:	000017a1 	andeq	r1, r0, r1, lsr #15
    1694:	682b      	ldr	r3, [r5, #0]
    1696:	1d1a      	adds	r2, r3, #4
    1698:	681b      	ldr	r3, [r3, #0]
    169a:	602a      	str	r2, [r5, #0]
    169c:	f104 0542 	add.w	r5, r4, #66	; 0x42
    16a0:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
    16a4:	2301      	movs	r3, #1
    16a6:	e0a4      	b.n	17f2 <_printf_i+0x1f6>
    16a8:	6820      	ldr	r0, [r4, #0]
    16aa:	6829      	ldr	r1, [r5, #0]
    16ac:	0606      	lsls	r6, r0, #24
    16ae:	f101 0304 	add.w	r3, r1, #4
    16b2:	d50a      	bpl.n	16ca <_printf_i+0xce>
    16b4:	680e      	ldr	r6, [r1, #0]
    16b6:	602b      	str	r3, [r5, #0]
    16b8:	2e00      	cmp	r6, #0
    16ba:	da03      	bge.n	16c4 <_printf_i+0xc8>
    16bc:	232d      	movs	r3, #45	; 0x2d
    16be:	4276      	negs	r6, r6
    16c0:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    16c4:	230a      	movs	r3, #10
    16c6:	485e      	ldr	r0, [pc, #376]	; (1840 <_printf_i+0x244>)
    16c8:	e019      	b.n	16fe <_printf_i+0x102>
    16ca:	680e      	ldr	r6, [r1, #0]
    16cc:	f010 0f40 	tst.w	r0, #64	; 0x40
    16d0:	602b      	str	r3, [r5, #0]
    16d2:	bf18      	it	ne
    16d4:	b236      	sxthne	r6, r6
    16d6:	e7ef      	b.n	16b8 <_printf_i+0xbc>
    16d8:	682b      	ldr	r3, [r5, #0]
    16da:	6820      	ldr	r0, [r4, #0]
    16dc:	1d19      	adds	r1, r3, #4
    16de:	6029      	str	r1, [r5, #0]
    16e0:	0601      	lsls	r1, r0, #24
    16e2:	d501      	bpl.n	16e8 <_printf_i+0xec>
    16e4:	681e      	ldr	r6, [r3, #0]
    16e6:	e002      	b.n	16ee <_printf_i+0xf2>
    16e8:	0646      	lsls	r6, r0, #25
    16ea:	d5fb      	bpl.n	16e4 <_printf_i+0xe8>
    16ec:	881e      	ldrh	r6, [r3, #0]
    16ee:	2f6f      	cmp	r7, #111	; 0x6f
    16f0:	bf0c      	ite	eq
    16f2:	2308      	moveq	r3, #8
    16f4:	230a      	movne	r3, #10
    16f6:	4852      	ldr	r0, [pc, #328]	; (1840 <_printf_i+0x244>)
    16f8:	2100      	movs	r1, #0
    16fa:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
    16fe:	6865      	ldr	r5, [r4, #4]
    1700:	2d00      	cmp	r5, #0
    1702:	bfa8      	it	ge
    1704:	6821      	ldrge	r1, [r4, #0]
    1706:	60a5      	str	r5, [r4, #8]
    1708:	bfa4      	itt	ge
    170a:	f021 0104 	bicge.w	r1, r1, #4
    170e:	6021      	strge	r1, [r4, #0]
    1710:	b90e      	cbnz	r6, 1716 <_printf_i+0x11a>
    1712:	2d00      	cmp	r5, #0
    1714:	d04d      	beq.n	17b2 <_printf_i+0x1b6>
    1716:	4615      	mov	r5, r2
    1718:	fbb6 f1f3 	udiv	r1, r6, r3
    171c:	fb03 6711 	mls	r7, r3, r1, r6
    1720:	5dc7      	ldrb	r7, [r0, r7]
    1722:	f805 7d01 	strb.w	r7, [r5, #-1]!
    1726:	4637      	mov	r7, r6
    1728:	42bb      	cmp	r3, r7
    172a:	460e      	mov	r6, r1
    172c:	d9f4      	bls.n	1718 <_printf_i+0x11c>
    172e:	2b08      	cmp	r3, #8
    1730:	d10b      	bne.n	174a <_printf_i+0x14e>
    1732:	6823      	ldr	r3, [r4, #0]
    1734:	07de      	lsls	r6, r3, #31
    1736:	d508      	bpl.n	174a <_printf_i+0x14e>
    1738:	6923      	ldr	r3, [r4, #16]
    173a:	6861      	ldr	r1, [r4, #4]
    173c:	4299      	cmp	r1, r3
    173e:	bfde      	ittt	le
    1740:	2330      	movle	r3, #48	; 0x30
    1742:	f805 3c01 	strble.w	r3, [r5, #-1]
    1746:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
    174a:	1b52      	subs	r2, r2, r5
    174c:	6122      	str	r2, [r4, #16]
    174e:	464b      	mov	r3, r9
    1750:	4621      	mov	r1, r4
    1752:	4640      	mov	r0, r8
    1754:	f8cd a000 	str.w	sl, [sp]
    1758:	aa03      	add	r2, sp, #12
    175a:	f7ff fedf 	bl	151c <_printf_common>
    175e:	3001      	adds	r0, #1
    1760:	d14c      	bne.n	17fc <_printf_i+0x200>
    1762:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1766:	b004      	add	sp, #16
    1768:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    176c:	4834      	ldr	r0, [pc, #208]	; (1840 <_printf_i+0x244>)
    176e:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
    1772:	6829      	ldr	r1, [r5, #0]
    1774:	6823      	ldr	r3, [r4, #0]
    1776:	f851 6b04 	ldr.w	r6, [r1], #4
    177a:	6029      	str	r1, [r5, #0]
    177c:	061d      	lsls	r5, r3, #24
    177e:	d514      	bpl.n	17aa <_printf_i+0x1ae>
    1780:	07df      	lsls	r7, r3, #31
    1782:	bf44      	itt	mi
    1784:	f043 0320 	orrmi.w	r3, r3, #32
    1788:	6023      	strmi	r3, [r4, #0]
    178a:	b91e      	cbnz	r6, 1794 <_printf_i+0x198>
    178c:	6823      	ldr	r3, [r4, #0]
    178e:	f023 0320 	bic.w	r3, r3, #32
    1792:	6023      	str	r3, [r4, #0]
    1794:	2310      	movs	r3, #16
    1796:	e7af      	b.n	16f8 <_printf_i+0xfc>
    1798:	6823      	ldr	r3, [r4, #0]
    179a:	f043 0320 	orr.w	r3, r3, #32
    179e:	6023      	str	r3, [r4, #0]
    17a0:	2378      	movs	r3, #120	; 0x78
    17a2:	4828      	ldr	r0, [pc, #160]	; (1844 <_printf_i+0x248>)
    17a4:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
    17a8:	e7e3      	b.n	1772 <_printf_i+0x176>
    17aa:	0659      	lsls	r1, r3, #25
    17ac:	bf48      	it	mi
    17ae:	b2b6      	uxthmi	r6, r6
    17b0:	e7e6      	b.n	1780 <_printf_i+0x184>
    17b2:	4615      	mov	r5, r2
    17b4:	e7bb      	b.n	172e <_printf_i+0x132>
    17b6:	682b      	ldr	r3, [r5, #0]
    17b8:	6826      	ldr	r6, [r4, #0]
    17ba:	1d18      	adds	r0, r3, #4
    17bc:	6961      	ldr	r1, [r4, #20]
    17be:	6028      	str	r0, [r5, #0]
    17c0:	0635      	lsls	r5, r6, #24
    17c2:	681b      	ldr	r3, [r3, #0]
    17c4:	d501      	bpl.n	17ca <_printf_i+0x1ce>
    17c6:	6019      	str	r1, [r3, #0]
    17c8:	e002      	b.n	17d0 <_printf_i+0x1d4>
    17ca:	0670      	lsls	r0, r6, #25
    17cc:	d5fb      	bpl.n	17c6 <_printf_i+0x1ca>
    17ce:	8019      	strh	r1, [r3, #0]
    17d0:	2300      	movs	r3, #0
    17d2:	4615      	mov	r5, r2
    17d4:	6123      	str	r3, [r4, #16]
    17d6:	e7ba      	b.n	174e <_printf_i+0x152>
    17d8:	682b      	ldr	r3, [r5, #0]
    17da:	2100      	movs	r1, #0
    17dc:	1d1a      	adds	r2, r3, #4
    17de:	602a      	str	r2, [r5, #0]
    17e0:	681d      	ldr	r5, [r3, #0]
    17e2:	6862      	ldr	r2, [r4, #4]
    17e4:	4628      	mov	r0, r5
    17e6:	f000 f82f 	bl	1848 <memchr>
    17ea:	b108      	cbz	r0, 17f0 <_printf_i+0x1f4>
    17ec:	1b40      	subs	r0, r0, r5
    17ee:	6060      	str	r0, [r4, #4]
    17f0:	6863      	ldr	r3, [r4, #4]
    17f2:	6123      	str	r3, [r4, #16]
    17f4:	2300      	movs	r3, #0
    17f6:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    17fa:	e7a8      	b.n	174e <_printf_i+0x152>
    17fc:	462a      	mov	r2, r5
    17fe:	4649      	mov	r1, r9
    1800:	4640      	mov	r0, r8
    1802:	6923      	ldr	r3, [r4, #16]
    1804:	47d0      	blx	sl
    1806:	3001      	adds	r0, #1
    1808:	d0ab      	beq.n	1762 <_printf_i+0x166>
    180a:	6823      	ldr	r3, [r4, #0]
    180c:	079b      	lsls	r3, r3, #30
    180e:	d413      	bmi.n	1838 <_printf_i+0x23c>
    1810:	68e0      	ldr	r0, [r4, #12]
    1812:	9b03      	ldr	r3, [sp, #12]
    1814:	4298      	cmp	r0, r3
    1816:	bfb8      	it	lt
    1818:	4618      	movlt	r0, r3
    181a:	e7a4      	b.n	1766 <_printf_i+0x16a>
    181c:	2301      	movs	r3, #1
    181e:	4632      	mov	r2, r6
    1820:	4649      	mov	r1, r9
    1822:	4640      	mov	r0, r8
    1824:	47d0      	blx	sl
    1826:	3001      	adds	r0, #1
    1828:	d09b      	beq.n	1762 <_printf_i+0x166>
    182a:	3501      	adds	r5, #1
    182c:	68e3      	ldr	r3, [r4, #12]
    182e:	9903      	ldr	r1, [sp, #12]
    1830:	1a5b      	subs	r3, r3, r1
    1832:	42ab      	cmp	r3, r5
    1834:	dcf2      	bgt.n	181c <_printf_i+0x220>
    1836:	e7eb      	b.n	1810 <_printf_i+0x214>
    1838:	2500      	movs	r5, #0
    183a:	f104 0619 	add.w	r6, r4, #25
    183e:	e7f5      	b.n	182c <_printf_i+0x230>
    1840:	00001c31 	andeq	r1, r0, r1, lsr ip
    1844:	00001c42 	andeq	r1, r0, r2, asr #24

00001848 <memchr>:
    1848:	4603      	mov	r3, r0
    184a:	b510      	push	{r4, lr}
    184c:	b2c9      	uxtb	r1, r1
    184e:	4402      	add	r2, r0
    1850:	4293      	cmp	r3, r2
    1852:	4618      	mov	r0, r3
    1854:	d101      	bne.n	185a <memchr+0x12>
    1856:	2000      	movs	r0, #0
    1858:	e003      	b.n	1862 <memchr+0x1a>
    185a:	7804      	ldrb	r4, [r0, #0]
    185c:	3301      	adds	r3, #1
    185e:	428c      	cmp	r4, r1
    1860:	d1f6      	bne.n	1850 <memchr+0x8>
    1862:	bd10      	pop	{r4, pc}

00001864 <memmove>:
    1864:	4288      	cmp	r0, r1
    1866:	b510      	push	{r4, lr}
    1868:	eb01 0402 	add.w	r4, r1, r2
    186c:	d902      	bls.n	1874 <memmove+0x10>
    186e:	4284      	cmp	r4, r0
    1870:	4623      	mov	r3, r4
    1872:	d807      	bhi.n	1884 <memmove+0x20>
    1874:	1e43      	subs	r3, r0, #1
    1876:	42a1      	cmp	r1, r4
    1878:	d008      	beq.n	188c <memmove+0x28>
    187a:	f811 2b01 	ldrb.w	r2, [r1], #1
    187e:	f803 2f01 	strb.w	r2, [r3, #1]!
    1882:	e7f8      	b.n	1876 <memmove+0x12>
    1884:	4601      	mov	r1, r0
    1886:	4402      	add	r2, r0
    1888:	428a      	cmp	r2, r1
    188a:	d100      	bne.n	188e <memmove+0x2a>
    188c:	bd10      	pop	{r4, pc}
    188e:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
    1892:	f802 4d01 	strb.w	r4, [r2, #-1]!
    1896:	e7f7      	b.n	1888 <memmove+0x24>

00001898 <_free_r>:
    1898:	b538      	push	{r3, r4, r5, lr}
    189a:	4605      	mov	r5, r0
    189c:	2900      	cmp	r1, #0
    189e:	d040      	beq.n	1922 <_free_r+0x8a>
    18a0:	f851 3c04 	ldr.w	r3, [r1, #-4]
    18a4:	1f0c      	subs	r4, r1, #4
    18a6:	2b00      	cmp	r3, #0
    18a8:	bfb8      	it	lt
    18aa:	18e4      	addlt	r4, r4, r3
    18ac:	f000 f910 	bl	1ad0 <__malloc_lock>
    18b0:	4a1c      	ldr	r2, [pc, #112]	; (1924 <_free_r+0x8c>)
    18b2:	6813      	ldr	r3, [r2, #0]
    18b4:	b933      	cbnz	r3, 18c4 <_free_r+0x2c>
    18b6:	6063      	str	r3, [r4, #4]
    18b8:	6014      	str	r4, [r2, #0]
    18ba:	4628      	mov	r0, r5
    18bc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    18c0:	f000 b90c 	b.w	1adc <__malloc_unlock>
    18c4:	42a3      	cmp	r3, r4
    18c6:	d908      	bls.n	18da <_free_r+0x42>
    18c8:	6820      	ldr	r0, [r4, #0]
    18ca:	1821      	adds	r1, r4, r0
    18cc:	428b      	cmp	r3, r1
    18ce:	bf01      	itttt	eq
    18d0:	6819      	ldreq	r1, [r3, #0]
    18d2:	685b      	ldreq	r3, [r3, #4]
    18d4:	1809      	addeq	r1, r1, r0
    18d6:	6021      	streq	r1, [r4, #0]
    18d8:	e7ed      	b.n	18b6 <_free_r+0x1e>
    18da:	461a      	mov	r2, r3
    18dc:	685b      	ldr	r3, [r3, #4]
    18de:	b10b      	cbz	r3, 18e4 <_free_r+0x4c>
    18e0:	42a3      	cmp	r3, r4
    18e2:	d9fa      	bls.n	18da <_free_r+0x42>
    18e4:	6811      	ldr	r1, [r2, #0]
    18e6:	1850      	adds	r0, r2, r1
    18e8:	42a0      	cmp	r0, r4
    18ea:	d10b      	bne.n	1904 <_free_r+0x6c>
    18ec:	6820      	ldr	r0, [r4, #0]
    18ee:	4401      	add	r1, r0
    18f0:	1850      	adds	r0, r2, r1
    18f2:	4283      	cmp	r3, r0
    18f4:	6011      	str	r1, [r2, #0]
    18f6:	d1e0      	bne.n	18ba <_free_r+0x22>
    18f8:	6818      	ldr	r0, [r3, #0]
    18fa:	685b      	ldr	r3, [r3, #4]
    18fc:	4401      	add	r1, r0
    18fe:	6011      	str	r1, [r2, #0]
    1900:	6053      	str	r3, [r2, #4]
    1902:	e7da      	b.n	18ba <_free_r+0x22>
    1904:	d902      	bls.n	190c <_free_r+0x74>
    1906:	230c      	movs	r3, #12
    1908:	602b      	str	r3, [r5, #0]
    190a:	e7d6      	b.n	18ba <_free_r+0x22>
    190c:	6820      	ldr	r0, [r4, #0]
    190e:	1821      	adds	r1, r4, r0
    1910:	428b      	cmp	r3, r1
    1912:	bf01      	itttt	eq
    1914:	6819      	ldreq	r1, [r3, #0]
    1916:	685b      	ldreq	r3, [r3, #4]
    1918:	1809      	addeq	r1, r1, r0
    191a:	6021      	streq	r1, [r4, #0]
    191c:	6063      	str	r3, [r4, #4]
    191e:	6054      	str	r4, [r2, #4]
    1920:	e7cb      	b.n	18ba <_free_r+0x22>
    1922:	bd38      	pop	{r3, r4, r5, pc}
    1924:	00020580 	andeq	r0, r2, r0, lsl #11

00001928 <sbrk_aligned>:
    1928:	b570      	push	{r4, r5, r6, lr}
    192a:	4e0e      	ldr	r6, [pc, #56]	; (1964 <sbrk_aligned+0x3c>)
    192c:	460c      	mov	r4, r1
    192e:	6831      	ldr	r1, [r6, #0]
    1930:	4605      	mov	r5, r0
    1932:	b911      	cbnz	r1, 193a <sbrk_aligned+0x12>
    1934:	f000 f8bc 	bl	1ab0 <_sbrk_r>
    1938:	6030      	str	r0, [r6, #0]
    193a:	4621      	mov	r1, r4
    193c:	4628      	mov	r0, r5
    193e:	f000 f8b7 	bl	1ab0 <_sbrk_r>
    1942:	1c43      	adds	r3, r0, #1
    1944:	d00a      	beq.n	195c <sbrk_aligned+0x34>
    1946:	1cc4      	adds	r4, r0, #3
    1948:	f024 0403 	bic.w	r4, r4, #3
    194c:	42a0      	cmp	r0, r4
    194e:	d007      	beq.n	1960 <sbrk_aligned+0x38>
    1950:	1a21      	subs	r1, r4, r0
    1952:	4628      	mov	r0, r5
    1954:	f000 f8ac 	bl	1ab0 <_sbrk_r>
    1958:	3001      	adds	r0, #1
    195a:	d101      	bne.n	1960 <sbrk_aligned+0x38>
    195c:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
    1960:	4620      	mov	r0, r4
    1962:	bd70      	pop	{r4, r5, r6, pc}
    1964:	00020584 	andeq	r0, r2, r4, lsl #11

00001968 <_malloc_r>:
    1968:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    196c:	1ccd      	adds	r5, r1, #3
    196e:	f025 0503 	bic.w	r5, r5, #3
    1972:	3508      	adds	r5, #8
    1974:	2d0c      	cmp	r5, #12
    1976:	bf38      	it	cc
    1978:	250c      	movcc	r5, #12
    197a:	2d00      	cmp	r5, #0
    197c:	4607      	mov	r7, r0
    197e:	db01      	blt.n	1984 <_malloc_r+0x1c>
    1980:	42a9      	cmp	r1, r5
    1982:	d905      	bls.n	1990 <_malloc_r+0x28>
    1984:	230c      	movs	r3, #12
    1986:	2600      	movs	r6, #0
    1988:	603b      	str	r3, [r7, #0]
    198a:	4630      	mov	r0, r6
    198c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1990:	4e2e      	ldr	r6, [pc, #184]	; (1a4c <_malloc_r+0xe4>)
    1992:	f000 f89d 	bl	1ad0 <__malloc_lock>
    1996:	6833      	ldr	r3, [r6, #0]
    1998:	461c      	mov	r4, r3
    199a:	bb34      	cbnz	r4, 19ea <_malloc_r+0x82>
    199c:	4629      	mov	r1, r5
    199e:	4638      	mov	r0, r7
    19a0:	f7ff ffc2 	bl	1928 <sbrk_aligned>
    19a4:	1c43      	adds	r3, r0, #1
    19a6:	4604      	mov	r4, r0
    19a8:	d14d      	bne.n	1a46 <_malloc_r+0xde>
    19aa:	6834      	ldr	r4, [r6, #0]
    19ac:	4626      	mov	r6, r4
    19ae:	2e00      	cmp	r6, #0
    19b0:	d140      	bne.n	1a34 <_malloc_r+0xcc>
    19b2:	6823      	ldr	r3, [r4, #0]
    19b4:	4631      	mov	r1, r6
    19b6:	4638      	mov	r0, r7
    19b8:	eb04 0803 	add.w	r8, r4, r3
    19bc:	f000 f878 	bl	1ab0 <_sbrk_r>
    19c0:	4580      	cmp	r8, r0
    19c2:	d13a      	bne.n	1a3a <_malloc_r+0xd2>
    19c4:	6821      	ldr	r1, [r4, #0]
    19c6:	3503      	adds	r5, #3
    19c8:	1a6d      	subs	r5, r5, r1
    19ca:	f025 0503 	bic.w	r5, r5, #3
    19ce:	3508      	adds	r5, #8
    19d0:	2d0c      	cmp	r5, #12
    19d2:	bf38      	it	cc
    19d4:	250c      	movcc	r5, #12
    19d6:	4638      	mov	r0, r7
    19d8:	4629      	mov	r1, r5
    19da:	f7ff ffa5 	bl	1928 <sbrk_aligned>
    19de:	3001      	adds	r0, #1
    19e0:	d02b      	beq.n	1a3a <_malloc_r+0xd2>
    19e2:	6823      	ldr	r3, [r4, #0]
    19e4:	442b      	add	r3, r5
    19e6:	6023      	str	r3, [r4, #0]
    19e8:	e00e      	b.n	1a08 <_malloc_r+0xa0>
    19ea:	6822      	ldr	r2, [r4, #0]
    19ec:	1b52      	subs	r2, r2, r5
    19ee:	d41e      	bmi.n	1a2e <_malloc_r+0xc6>
    19f0:	2a0b      	cmp	r2, #11
    19f2:	d916      	bls.n	1a22 <_malloc_r+0xba>
    19f4:	1961      	adds	r1, r4, r5
    19f6:	42a3      	cmp	r3, r4
    19f8:	6025      	str	r5, [r4, #0]
    19fa:	bf18      	it	ne
    19fc:	6059      	strne	r1, [r3, #4]
    19fe:	6863      	ldr	r3, [r4, #4]
    1a00:	bf08      	it	eq
    1a02:	6031      	streq	r1, [r6, #0]
    1a04:	5162      	str	r2, [r4, r5]
    1a06:	604b      	str	r3, [r1, #4]
    1a08:	4638      	mov	r0, r7
    1a0a:	f104 060b 	add.w	r6, r4, #11
    1a0e:	f000 f865 	bl	1adc <__malloc_unlock>
    1a12:	f026 0607 	bic.w	r6, r6, #7
    1a16:	1d23      	adds	r3, r4, #4
    1a18:	1af2      	subs	r2, r6, r3
    1a1a:	d0b6      	beq.n	198a <_malloc_r+0x22>
    1a1c:	1b9b      	subs	r3, r3, r6
    1a1e:	50a3      	str	r3, [r4, r2]
    1a20:	e7b3      	b.n	198a <_malloc_r+0x22>
    1a22:	6862      	ldr	r2, [r4, #4]
    1a24:	42a3      	cmp	r3, r4
    1a26:	bf0c      	ite	eq
    1a28:	6032      	streq	r2, [r6, #0]
    1a2a:	605a      	strne	r2, [r3, #4]
    1a2c:	e7ec      	b.n	1a08 <_malloc_r+0xa0>
    1a2e:	4623      	mov	r3, r4
    1a30:	6864      	ldr	r4, [r4, #4]
    1a32:	e7b2      	b.n	199a <_malloc_r+0x32>
    1a34:	4634      	mov	r4, r6
    1a36:	6876      	ldr	r6, [r6, #4]
    1a38:	e7b9      	b.n	19ae <_malloc_r+0x46>
    1a3a:	230c      	movs	r3, #12
    1a3c:	4638      	mov	r0, r7
    1a3e:	603b      	str	r3, [r7, #0]
    1a40:	f000 f84c 	bl	1adc <__malloc_unlock>
    1a44:	e7a1      	b.n	198a <_malloc_r+0x22>
    1a46:	6025      	str	r5, [r4, #0]
    1a48:	e7de      	b.n	1a08 <_malloc_r+0xa0>
    1a4a:	bf00      	nop
    1a4c:	00020580 	andeq	r0, r2, r0, lsl #11

00001a50 <_realloc_r>:
    1a50:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1a54:	4680      	mov	r8, r0
    1a56:	4614      	mov	r4, r2
    1a58:	460e      	mov	r6, r1
    1a5a:	b921      	cbnz	r1, 1a66 <_realloc_r+0x16>
    1a5c:	4611      	mov	r1, r2
    1a5e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    1a62:	f7ff bf81 	b.w	1968 <_malloc_r>
    1a66:	b92a      	cbnz	r2, 1a74 <_realloc_r+0x24>
    1a68:	f7ff ff16 	bl	1898 <_free_r>
    1a6c:	4625      	mov	r5, r4
    1a6e:	4628      	mov	r0, r5
    1a70:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1a74:	f000 f838 	bl	1ae8 <_malloc_usable_size_r>
    1a78:	4284      	cmp	r4, r0
    1a7a:	4607      	mov	r7, r0
    1a7c:	d802      	bhi.n	1a84 <_realloc_r+0x34>
    1a7e:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
    1a82:	d812      	bhi.n	1aaa <_realloc_r+0x5a>
    1a84:	4621      	mov	r1, r4
    1a86:	4640      	mov	r0, r8
    1a88:	f7ff ff6e 	bl	1968 <_malloc_r>
    1a8c:	4605      	mov	r5, r0
    1a8e:	2800      	cmp	r0, #0
    1a90:	d0ed      	beq.n	1a6e <_realloc_r+0x1e>
    1a92:	42bc      	cmp	r4, r7
    1a94:	4622      	mov	r2, r4
    1a96:	4631      	mov	r1, r6
    1a98:	bf28      	it	cs
    1a9a:	463a      	movcs	r2, r7
    1a9c:	f7ff fbac 	bl	11f8 <memcpy>
    1aa0:	4631      	mov	r1, r6
    1aa2:	4640      	mov	r0, r8
    1aa4:	f7ff fef8 	bl	1898 <_free_r>
    1aa8:	e7e1      	b.n	1a6e <_realloc_r+0x1e>
    1aaa:	4635      	mov	r5, r6
    1aac:	e7df      	b.n	1a6e <_realloc_r+0x1e>
	...

00001ab0 <_sbrk_r>:
    1ab0:	b538      	push	{r3, r4, r5, lr}
    1ab2:	2300      	movs	r3, #0
    1ab4:	4d05      	ldr	r5, [pc, #20]	; (1acc <_sbrk_r+0x1c>)
    1ab6:	4604      	mov	r4, r0
    1ab8:	4608      	mov	r0, r1
    1aba:	602b      	str	r3, [r5, #0]
    1abc:	f000 f81e 	bl	1afc <_sbrk>
    1ac0:	1c43      	adds	r3, r0, #1
    1ac2:	d102      	bne.n	1aca <_sbrk_r+0x1a>
    1ac4:	682b      	ldr	r3, [r5, #0]
    1ac6:	b103      	cbz	r3, 1aca <_sbrk_r+0x1a>
    1ac8:	6023      	str	r3, [r4, #0]
    1aca:	bd38      	pop	{r3, r4, r5, pc}
    1acc:	00020588 	andeq	r0, r2, r8, lsl #11

00001ad0 <__malloc_lock>:
    1ad0:	4801      	ldr	r0, [pc, #4]	; (1ad8 <__malloc_lock+0x8>)
    1ad2:	f000 b811 	b.w	1af8 <__retarget_lock_acquire_recursive>
    1ad6:	bf00      	nop
    1ad8:	0002058c 	andeq	r0, r2, ip, lsl #11

00001adc <__malloc_unlock>:
    1adc:	4801      	ldr	r0, [pc, #4]	; (1ae4 <__malloc_unlock+0x8>)
    1ade:	f000 b80c 	b.w	1afa <__retarget_lock_release_recursive>
    1ae2:	bf00      	nop
    1ae4:	0002058c 	andeq	r0, r2, ip, lsl #11

00001ae8 <_malloc_usable_size_r>:
    1ae8:	f851 3c04 	ldr.w	r3, [r1, #-4]
    1aec:	1f18      	subs	r0, r3, #4
    1aee:	2b00      	cmp	r3, #0
    1af0:	bfbc      	itt	lt
    1af2:	580b      	ldrlt	r3, [r1, r0]
    1af4:	18c0      	addlt	r0, r0, r3
    1af6:	4770      	bx	lr

00001af8 <__retarget_lock_acquire_recursive>:
    1af8:	4770      	bx	lr

00001afa <__retarget_lock_release_recursive>:
    1afa:	4770      	bx	lr

00001afc <_sbrk>:
    1afc:	4a04      	ldr	r2, [pc, #16]	; (1b10 <_sbrk+0x14>)
    1afe:	4905      	ldr	r1, [pc, #20]	; (1b14 <_sbrk+0x18>)
    1b00:	6813      	ldr	r3, [r2, #0]
    1b02:	2b00      	cmp	r3, #0
    1b04:	bf08      	it	eq
    1b06:	460b      	moveq	r3, r1
    1b08:	4418      	add	r0, r3
    1b0a:	6010      	str	r0, [r2, #0]
    1b0c:	4618      	mov	r0, r3
    1b0e:	4770      	bx	lr
    1b10:	00020590 	muleq	r2, r0, r5
    1b14:	00020598 	muleq	r2, r8, r5

00001b18 <_exit>:
    1b18:	e7fe      	b.n	1b18 <_exit>
    1b1a:	bf00      	nop

00001b1c <_init>:
    1b1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    1b1e:	bf00      	nop
    1b20:	bcf8      	pop	{r3, r4, r5, r6, r7}
    1b22:	bc08      	pop	{r3}
    1b24:	469e      	mov	lr, r3
    1b26:	4770      	bx	lr

00001b28 <_fini>:
    1b28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    1b2a:	bf00      	nop
    1b2c:	bcf8      	pop	{r3, r4, r5, r6, r7}
    1b2e:	bc08      	pop	{r3}
    1b30:	469e      	mov	lr, r3
    1b32:	4770      	bx	lr
    1b34:	00207825 	eoreq	r7, r0, r5, lsr #16
    1b38:	00494d4e 	subeq	r4, r9, lr, asr #26
    1b3c:	5345545b 	movtpl	r5, #21595	; 0x545b
    1b40:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    1b44:	20776f68 	rsbscs	r6, r7, r8, ror #30
    1b48:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
    1b4c:	6e656d20 	cdpvs	13, 6, cr6, cr5, cr0, {1}
    1b50:	2e2e2e75 	mcrcs	14, 1, r2, cr14, cr5, {3}
    1b54:	00000a0d 	andeq	r0, r0, sp, lsl #20
    1b58:	5d63255b 	cfstr64pl	mvdx2, [r3, #-364]!	; 0xfffffe94
    1b5c:	00732520 	rsbseq	r2, r3, r0, lsr #10
    1b60:	5345545b 	movtpl	r5, #21595	; 0x545b
    1b64:	50205d54 	eorpl	r5, r0, r4, asr sp
    1b68:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
    1b6c:	79656b20 	stmdbvc	r5!, {r5, r8, r9, fp, sp, lr}^
    1b70:	206f7420 	rsbcs	r7, pc, r0, lsr #8
    1b74:	63657865 	cmnvs	r5, #6619136	; 0x650000
    1b78:	20657475 	rsbcs	r7, r5, r5, ror r4
    1b7c:	2720726f 	strcs	r7, [r0, -pc, ror #4]!
    1b80:	74202751 	strtvc	r2, [r0], #-1873	; 0xfffff8af
    1b84:	7865206f 	stmdavc	r5!, {r0, r1, r2, r3, r5, r6, sp}^
    1b88:	2e2e7469 	cdpcs	4, 2, cr7, cr14, cr9, {3}
    1b8c:	000a0d2e 	andeq	r0, sl, lr, lsr #26
    1b90:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    1b94:	63252074 			; <UNDEFINED> instruction: 0x63252074
    1b98:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    1b9c:	0000000a 	andeq	r0, r0, sl
    1ba0:	5345545b 	movtpl	r5, #21595	; 0x545b
    1ba4:	54205d54 	strtpl	r5, [r0], #-3412	; 0xfffff2ac
    1ba8:	20747365 	rsbscs	r7, r4, r5, ror #6
    1bac:	73646e65 	cmnvc	r4, #1616	; 0x650
    1bb0:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    1bb4:	000a0d0a 	andeq	r0, sl, sl, lsl #26
    1bb8:	5345545b 	movtpl	r5, #21595	; 0x545b
    1bbc:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    1bc0:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
    1bc4:	0073253a 	rsbseq	r2, r3, sl, lsr r5
    1bc8:	5345545b 	movtpl	r5, #21595	; 0x545b
    1bcc:	45205d54 	strmi	r5, [r0, #-3412]!	; 0xfffff2ac
    1bd0:	253a646e 	ldrcs	r6, [sl, #-1134]!	; 0xfffffb92
    1bd4:	00000073 	andeq	r0, r0, r3, ror r0
    1bd8:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    1bdc:	72652074 	rsbvc	r2, r5, #116	; 0x74
    1be0:	2e726f72 	mrccs	15, 3, r6, cr2, cr2, {3}
    1be4:	0a0d2e2e 	beq	34d4a4 <__StackTop+0x32b4a4>
    1be8:	00000000 	andeq	r0, r0, r0
    1bec:	20495053 	subcs	r5, r9, r3, asr r0
    1bf0:	7473616d 	ldrbtvc	r6, [r3], #-365	; 0xfffffe93
    1bf4:	61207265 			; <UNDEFINED> instruction: 0x61207265
    1bf8:	696c7070 	stmdbvs	ip!, {r4, r5, r6, ip, sp, lr}^
    1bfc:	69746163 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, sp, lr}^
    1c00:	2e736e6f 	cdpcs	14, 7, cr6, cr3, cr15, {3}
    1c04:	0a0d2e2e 	beq	34d4c4 <__StackTop+0x32b4c4>
    1c08:	00000000 	andeq	r0, r0, r0
    1c0c:	00200a0d 	eoreq	r0, r0, sp, lsl #20
    1c10:	72200a0d 	eorvc	r0, r0, #53248	; 0xd000
    1c14:	3a646165 	bcc	191a1b0 <__StackTop+0x18f81b0>
    1c18:	00000020 	andeq	r0, r0, r0, lsr #32

00001c1c <_global_impure_ptr>:
    1c1c:	00020444 	andeq	r0, r2, r4, asr #8
    1c20:	2b302d23 	blcs	c0d0b4 <__StackTop+0xbeb0b4>
    1c24:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    1c28:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    1c2c:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    1c30:	32313000 	eorscc	r3, r1, #0
    1c34:	36353433 			; <UNDEFINED> instruction: 0x36353433
    1c38:	41393837 	teqmi	r9, r7, lsr r8
    1c3c:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    1c40:	31300046 	teqcc	r0, r6, asr #32
    1c44:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    1c48:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    1c4c:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    1c50:	00006665 	andeq	r6, r0, r5, ror #12

00001c54 <__EH_FRAME_BEGIN__>:
    1c54:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <g_mcu_menu>:
   20000:	00000031 	andeq	r0, r0, r1, lsr r0
   20004:	00001101 	andeq	r1, r0, r1, lsl #2
   20008:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   2000c:	32626c35 	rsbcc	r6, r2, #13568	; 0x3500
   20010:	5d653635 	stclpl	6, cr3, [r5, #-212]!	; 0xffffff2c
   20014:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   20018:	32626c35 	rsbcc	r6, r2, #13568	; 0x3500
   2001c:	20653635 	rsbcs	r3, r5, r5, lsr r6
   20020:	20697073 	rsbcs	r7, r9, r3, ror r0
   20024:	73616c66 	cmnvc	r1, #26112	; 0x6600
   20028:	61632068 	cmnvs	r3, r8, rrx
   2002c:	2e736573 	mrccs	5, 3, r6, cr3, cr3, {3}
   20030:	0a0d2e2e 	beq	36b8f0 <__StackTop+0x3498f0>
	...

00020088 <g_gd25lb256e_menu>:
   20088:	00000031 	andeq	r0, r0, r1, lsr r0
   2008c:	00001009 	andeq	r1, r0, r9
   20090:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   20094:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   20098:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   2009c:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   200a0:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   200a4:	20453635 	subcs	r3, r5, r5, lsr r6
   200a8:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
   200ac:	20646920 	rsbcs	r6, r4, r0, lsr #18
   200b0:	65736163 	ldrbvs	r6, [r3, #-355]!	; 0xfffffe9d
   200b4:	00000a0d 	andeq	r0, r0, sp, lsl #20
	...
   20110:	00000032 	andeq	r0, r0, r2, lsr r0
   20114:	00001041 	andeq	r1, r0, r1, asr #32
   20118:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   2011c:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   20120:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   20124:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   20128:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   2012c:	20453635 	subcs	r3, r5, r5, lsr r6
   20130:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
   20134:	73616320 	cmnvc	r1, #32, 6	; 0x80000000
   20138:	000a0d65 	andeq	r0, sl, r5, ror #26
	...
   20198:	00000033 	andeq	r0, r0, r3, lsr r0
   2019c:	00000fa1 	andeq	r0, r0, r1, lsr #31
   201a0:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   201a4:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   201a8:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   201ac:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   201b0:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   201b4:	20453635 	subcs	r3, r5, r5, lsr r6
   201b8:	73617265 	cmnvc	r1, #1342177286	; 0x50000006
   201bc:	61632065 	cmnvs	r3, r5, rrx
   201c0:	0a0d6573 	beq	379794 <__StackTop+0x357794>
	...
   20220:	00000034 	andeq	r0, r0, r4, lsr r0
   20224:	00000fd9 	ldrdeq	r0, [r0], -r9
   20228:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   2022c:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   20230:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   20234:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   20238:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   2023c:	20453635 	subcs	r3, r5, r5, lsr r6
   20240:	676f7270 			; <UNDEFINED> instruction: 0x676f7270
   20244:	206d6172 	rsbcs	r6, sp, r2, ror r1
   20248:	65736163 	ldrbvs	r6, [r3, #-355]!	; 0xfffffe9d
   2024c:	00000a0d 	andeq	r0, r0, sp, lsl #20
	...
   202a8:	00000035 	andeq	r0, r0, r5, lsr r0
   202ac:	0000107d 	andeq	r1, r0, sp, ror r0
   202b0:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   202b4:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   202b8:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   202bc:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   202c0:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   202c4:	20453635 	subcs	r3, r5, r5, lsr r6
   202c8:	7265706f 	rsbvc	r7, r5, #111	; 0x6f
   202cc:	6f697461 	svcvs	0x00697461
   202d0:	6320736e 			; <UNDEFINED> instruction: 0x6320736e
   202d4:	0d657361 	stcleq	3, cr7, [r5, #-388]!	; 0xfffffe7c
   202d8:	0000000a 	andeq	r0, r0, sl
	...
   20330:	00000036 	andeq	r0, r0, r6, lsr r0
   20334:	00000faf 	andeq	r0, r0, pc, lsr #31
   20338:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   2033c:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   20340:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   20344:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   20348:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   2034c:	20453635 	subcs	r3, r5, r5, lsr r6
   20350:	74697277 	strbtvc	r7, [r9], #-631	; 0xfffffd89
   20354:	6e652065 	cdpvs	0, 6, cr2, cr5, cr5, {3}
   20358:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
   2035c:	00000a0d 	andeq	r0, r0, sp, lsl #20
	...
   203b8:	00000037 	andeq	r0, r0, r7, lsr r0
   203bc:	00000fb7 			; <UNDEFINED> instruction: 0x00000fb7
   203c0:	3244475b 	subcc	r4, r4, #23855104	; 0x16c0000
   203c4:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   203c8:	5d453635 	stclpl	6, cr3, [r5, #-212]	; 0xffffff2c
   203cc:	32444720 	subcc	r4, r4, #32, 14	; 0x800000
   203d0:	32424c35 	subcc	r4, r2, #13568	; 0x3500
   203d4:	20453635 	subcs	r3, r5, r5, lsr r6
   203d8:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
   203dc:	0a0d7375 	beq	37d1b8 <__StackTop+0x35b1b8>
	...

00020440 <_impure_ptr>:
   20440:	00020444 	andeq	r0, r2, r4, asr #8

00020444 <impure_data>:
	...

000204a4 <__frame_dummy_init_array_entry>:
   204a4:	000000b5 	strheq	r0, [r0], -r5

000204a8 <__do_global_dtors_aux_fini_array_entry>:
   204a8:	00000091 	muleq	r0, r1, r0

Disassembly of section .bss:

000204ac <__bss_start__>:
   204ac:	00000000 	andeq	r0, r0, r0

000204b0 <object.0>:
	...

000204c8 <hspim>:
	...

000204e4 <rx_flash_data>:
	...

00020524 <tx_flash_data>:
	...

00020564 <huart0>:
	...

00020580 <__malloc_free_list>:
   20580:	00000000 	andeq	r0, r0, r0

00020584 <__malloc_sbrk_start>:
   20584:	00000000 	andeq	r0, r0, r0

00020588 <errno>:
   20588:	00000000 	andeq	r0, r0, r0

0002058c <__lock___malloc_recursive_mutex>:
   2058c:	00000000 	andeq	r0, r0, r0

00020590 <heap_end.0>:
   20590:	00000000 	andeq	r0, r0, r0

Disassembly of section .stack_dummy:

00020598 <__HeapBase>:
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
  18:	000011d0 	ldrdeq	r1, [r0], -r0
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000014 	andeq	r0, r0, r4, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	000011f8 	strdeq	r1, [r0], -r8
  44:	0000001c 	andeq	r0, r0, ip, lsl r0
  48:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
  4c:	00018e02 	andeq	r8, r1, r2, lsl #28
  50:	0000000c 	andeq	r0, r0, ip
  54:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  58:	7c020001 	stcvc	0, cr0, [r2], {1}
  5c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  60:	00000018 	andeq	r0, r0, r8, lsl r0
  64:	00000050 	andeq	r0, r0, r0, asr r0
  68:	00001224 	andeq	r1, r0, r4, lsr #4
  6c:	0000002c 	andeq	r0, r0, ip, lsr #32
  70:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  74:	700e4101 	andvc	r4, lr, r1, lsl #2
  78:	00040e4f 	andeq	r0, r4, pc, asr #28
  7c:	0000000c 	andeq	r0, r0, ip
  80:	00000050 	andeq	r0, r0, r0, asr r0
  84:	00001250 	andeq	r1, r0, r0, asr r2
  88:	00000014 	andeq	r0, r0, r4, lsl r0
  8c:	0000000c 	andeq	r0, r0, ip
  90:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  94:	7c020001 	stcvc	0, cr0, [r2], {1}
  98:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  9c:	00000020 	andeq	r0, r0, r0, lsr #32
  a0:	0000008c 	andeq	r0, r0, ip, lsl #1
  a4:	00001264 	andeq	r1, r0, r4, ror #4
  a8:	000000b6 	strheq	r0, [r0], -r6
  ac:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
  b0:	86078508 	strhi	r8, [r7], -r8, lsl #10
  b4:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  b8:	8a038904 	bhi	e24d0 <__StackTop+0xc04d0>
  bc:	00018e02 	andeq	r8, r1, r2, lsl #28
  c0:	00000028 	andeq	r0, r0, r8, lsr #32
  c4:	0000008c 	andeq	r0, r0, ip, lsl #1
  c8:	00000000 	andeq	r0, r0, r0
  cc:	000000f6 	strdeq	r0, [r0], -r6
  d0:	84300e43 	ldrthi	r0, [r0], #-3651	; 0xfffff1bd
  d4:	86088509 	strhi	r8, [r8], -r9, lsl #10
  d8:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
  dc:	8a048905 	bhi	1224f8 <__StackTop+0x1004f8>
  e0:	8e028b03 	vmlahi.f64	d8, d2, d3
  e4:	0a6a0201 	beq	1a808f0 <__StackTop+0x1a5e8f0>
  e8:	0b42240e 	bleq	1089128 <__StackTop+0x1067128>
  ec:	0000002c 	andeq	r0, r0, ip, lsr #32
  f0:	0000008c 	andeq	r0, r0, ip, lsl #1
  f4:	0000131c 	andeq	r1, r0, ip, lsl r3
  f8:	00000200 	andeq	r0, r0, r0, lsl #4
  fc:	84240e42 	strthi	r0, [r4], #-3650	; 0xfffff1be
 100:	86088509 	strhi	r8, [r8], -r9, lsl #10
 104:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 108:	8a048905 	bhi	122524 <__StackTop+0x100524>
 10c:	8e028b03 	vmlahi.f64	d8, d2, d3
 110:	980e4701 	stmdals	lr, {r0, r8, r9, sl, lr}
 114:	0ae10201 	beq	ff840920 <__StackTop+0xff81e920>
 118:	0b42240e 	bleq	1089158 <__StackTop+0x1067158>
 11c:	0000000c 	andeq	r0, r0, ip
 120:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 124:	7c020001 	stcvc	0, cr0, [r2], {1}
 128:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 12c:	00000020 	andeq	r0, r0, r0, lsr #32
 130:	0000011c 	andeq	r0, r0, ip, lsl r1
 134:	0000151c 	andeq	r1, r0, ip, lsl r5
 138:	000000de 	ldrdeq	r0, [r0], -lr
 13c:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 140:	86078508 	strhi	r8, [r7], -r8, lsl #10
 144:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 148:	8a038904 	bhi	e2560 <__StackTop+0xc0560>
 14c:	00018e02 	andeq	r8, r1, r2, lsl #28
 150:	00000028 	andeq	r0, r0, r8, lsr #32
 154:	0000011c 	andeq	r0, r0, ip, lsl r1
 158:	000015fc 	strdeq	r1, [r0], -ip
 15c:	0000024c 	andeq	r0, r0, ip, asr #4
 160:	84300e42 	ldrthi	r0, [r0], #-3650	; 0xfffff1be
 164:	86078508 	strhi	r8, [r7], -r8, lsl #10
 168:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 16c:	8a038904 	bhi	e2584 <__StackTop+0xc0584>
 170:	02018e02 	andeq	r8, r1, #2, 28
 174:	200e0ab4 			; <UNDEFINED> instruction: 0x200e0ab4
 178:	00000b42 	andeq	r0, r0, r2, asr #22
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00001848 	andeq	r1, r0, r8, asr #16
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00001864 	andeq	r1, r0, r4, ror #16
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00001898 	muleq	r0, r8, r8
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
 21c:	00001928 	andeq	r1, r0, r8, lsr #18
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00001968 	andeq	r1, r0, r8, ror #18
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
 268:	00001a50 	andeq	r1, r0, r0, asr sl
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
 2a4:	00001ab0 			; <UNDEFINED> instruction: 0x00001ab0
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
 2d0:	00001ad0 	ldrdeq	r1, [r0], -r0
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00001adc 	ldrdeq	r1, [r0], -ip
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00001ae8 	andeq	r1, r0, r8, ror #21
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
 3cc:	00001af8 	strdeq	r1, [r0], -r8
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
 40c:	00001afa 	strdeq	r1, [r0], -sl
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00001afc 	strdeq	r1, [r0], -ip
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00001b18 	andeq	r1, r0, r8, lsl fp
 450:	00000002 	andeq	r0, r0, r2

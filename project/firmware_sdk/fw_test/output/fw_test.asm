
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00022000 	andeq	r2, r2, r0
   4:	0000088d 	andeq	r0, r0, sp, lsl #17
   8:	0000076d 	andeq	r0, r0, sp, ror #14
   c:	0000077d 	andeq	r0, r0, sp, ror r7
  10:	0000077f 	andeq	r0, r0, pc, ror r7
  14:	00000781 	andeq	r0, r0, r1, lsl #15
  18:	00000783 	andeq	r0, r0, r3, lsl #15
	...
  2c:	00000785 	andeq	r0, r0, r5, lsl #15
  30:	00000787 	andeq	r0, r0, r7, lsl #15
  34:	00000000 	andeq	r0, r0, r0
  38:	00000789 	andeq	r0, r0, r9, lsl #15
  3c:	0000078b 	andeq	r0, r0, fp, lsl #15
  40:	0000078d 	andeq	r0, r0, sp, lsl #15
  44:	000008e1 	andeq	r0, r0, r1, ror #17
  48:	000008e3 	andeq	r0, r0, r3, ror #17
  4c:	000008e5 	andeq	r0, r0, r5, ror #17
  50:	000008e7 	andeq	r0, r0, r7, ror #17
  54:	000008e9 	andeq	r0, r0, r9, ror #17
  58:	000008eb 	andeq	r0, r0, fp, ror #17
  5c:	000008ed 	andeq	r0, r0, sp, ror #17
  60:	000008ef 	andeq	r0, r0, pc, ror #17
  64:	000008f1 	strdeq	r0, [r0], -r1
  68:	000008f3 	strdeq	r0, [r0], -r3
  6c:	000008f5 	strdeq	r0, [r0], -r5
  70:	000008f7 	strdeq	r0, [r0], -r7
  74:	000008f9 	strdeq	r0, [r0], -r9
  78:	000008fb 	strdeq	r0, [r0], -fp
  7c:	000008fd 	strdeq	r0, [r0], -sp
  80:	000008ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
  84:	00000901 	andeq	r0, r0, r1, lsl #18
  88:	00000903 	andeq	r0, r0, r3, lsl #18
  8c:	000007a9 	andeq	r0, r0, r9, lsr #15

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
  a8:	00020068 	andeq	r0, r2, r8, rrx
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00000978 	andeq	r0, r0, r8, ror r9

000000b4 <frame_dummy>:
  b4:	b508      	push	{r3, lr}
  b6:	4b03      	ldr	r3, [pc, #12]	; (c4 <frame_dummy+0x10>)
  b8:	b11b      	cbz	r3, c2 <frame_dummy+0xe>
  ba:	4903      	ldr	r1, [pc, #12]	; (c8 <frame_dummy+0x14>)
  bc:	4803      	ldr	r0, [pc, #12]	; (cc <frame_dummy+0x18>)
  be:	f3af 8000 	nop.w
  c2:	bd08      	pop	{r3, pc}
  c4:	00000000 	andeq	r0, r0, r0
  c8:	0002006c 	andeq	r0, r2, ip, rrx
  cc:	00000978 	andeq	r0, r0, r8, ror r9

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

000001be <drv_spim_trans_frame_with_pending>:
 1be:	b530      	push	{r4, r5, lr}
 1c0:	468c      	mov	ip, r1
 1c2:	f89d 400c 	ldrb.w	r4, [sp, #12]
 1c6:	2100      	movs	r1, #0
 1c8:	7441      	strb	r1, [r0, #17]
 1ca:	7481      	strb	r1, [r0, #18]
 1cc:	6805      	ldr	r5, [r0, #0]
 1ce:	68a9      	ldr	r1, [r5, #8]
 1d0:	f421 2100 	bic.w	r1, r1, #524288	; 0x80000
 1d4:	60a9      	str	r1, [r5, #8]
 1d6:	6805      	ldr	r5, [r0, #0]
 1d8:	68a9      	ldr	r1, [r5, #8]
 1da:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 1de:	60a9      	str	r1, [r5, #8]
 1e0:	6805      	ldr	r5, [r0, #0]
 1e2:	6929      	ldr	r1, [r5, #16]
 1e4:	f421 417f 	bic.w	r1, r1, #65280	; 0xff00
 1e8:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
 1ec:	6129      	str	r1, [r5, #16]
 1ee:	6805      	ldr	r5, [r0, #0]
 1f0:	6929      	ldr	r1, [r5, #16]
 1f2:	f021 01ff 	bic.w	r1, r1, #255	; 0xff
 1f6:	4319      	orrs	r1, r3
 1f8:	6129      	str	r1, [r5, #16]
 1fa:	6805      	ldr	r5, [r0, #0]
 1fc:	6929      	ldr	r1, [r5, #16]
 1fe:	f441 3180 	orr.w	r1, r1, #65536	; 0x10000
 202:	6129      	str	r1, [r5, #16]
 204:	6805      	ldr	r5, [r0, #0]
 206:	6869      	ldr	r1, [r5, #4]
 208:	f041 0101 	orr.w	r1, r1, #1
 20c:	6069      	str	r1, [r5, #4]
 20e:	1b1b      	subs	r3, r3, r4
 210:	fa5f fe83 	uxtb.w	lr, r3
 214:	2c10      	cmp	r4, #16
 216:	d90a      	bls.n	22e <Stack_Size+0x2e>
 218:	2510      	movs	r5, #16
 21a:	7c43      	ldrb	r3, [r0, #17]
 21c:	42ab      	cmp	r3, r5
 21e:	d208      	bcs.n	232 <Stack_Size+0x32>
 220:	1c59      	adds	r1, r3, #1
 222:	7441      	strb	r1, [r0, #17]
 224:	6801      	ldr	r1, [r0, #0]
 226:	f81c 3003 	ldrb.w	r3, [ip, r3]
 22a:	600b      	str	r3, [r1, #0]
 22c:	e7f5      	b.n	21a <Stack_Size+0x1a>
 22e:	4625      	mov	r5, r4
 230:	e7f3      	b.n	21a <Stack_Size+0x1a>
 232:	6801      	ldr	r1, [r0, #0]
 234:	684b      	ldr	r3, [r1, #4]
 236:	f043 0302 	orr.w	r3, r3, #2
 23a:	604b      	str	r3, [r1, #4]
 23c:	e004      	b.n	248 <Stack_Size+0x48>
 23e:	6803      	ldr	r3, [r0, #0]
 240:	6a19      	ldr	r1, [r3, #32]
 242:	f011 0f10 	tst.w	r1, #16
 246:	d121      	bne.n	28c <Stack_Size+0x8c>
 248:	7c43      	ldrb	r3, [r0, #17]
 24a:	42a3      	cmp	r3, r4
 24c:	d275      	bcs.n	33a <Stack_Size+0x13a>
 24e:	6801      	ldr	r1, [r0, #0]
 250:	69c9      	ldr	r1, [r1, #28]
 252:	f411 5f80 	tst.w	r1, #4096	; 0x1000
 256:	d109      	bne.n	26c <Stack_Size+0x6c>
 258:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
 25c:	604b      	str	r3, [r1, #4]
 25e:	7c43      	ldrb	r3, [r0, #17]
 260:	1c59      	adds	r1, r3, #1
 262:	7441      	strb	r1, [r0, #17]
 264:	6801      	ldr	r1, [r0, #0]
 266:	f81c 3003 	ldrb.w	r3, [ip, r3]
 26a:	600b      	str	r3, [r1, #0]
 26c:	6803      	ldr	r3, [r0, #0]
 26e:	69db      	ldr	r3, [r3, #28]
 270:	f013 0f1f 	tst.w	r3, #31
 274:	d0e3      	beq.n	23e <Stack_Size+0x3e>
 276:	7c81      	ldrb	r1, [r0, #18]
 278:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 27c:	60d9      	str	r1, [r3, #12]
 27e:	6803      	ldr	r3, [r0, #0]
 280:	6a59      	ldr	r1, [r3, #36]	; 0x24
 282:	7c83      	ldrb	r3, [r0, #18]
 284:	1c5d      	adds	r5, r3, #1
 286:	7485      	strb	r5, [r0, #18]
 288:	54d1      	strb	r1, [r2, r3]
 28a:	e7d8      	b.n	23e <Stack_Size+0x3e>
 28c:	6919      	ldr	r1, [r3, #16]
 28e:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
 292:	6119      	str	r1, [r3, #16]
 294:	6801      	ldr	r1, [r0, #0]
 296:	698b      	ldr	r3, [r1, #24]
 298:	f043 0310 	orr.w	r3, r3, #16
 29c:	618b      	str	r3, [r1, #24]
 29e:	e005      	b.n	2ac <Stack_Size+0xac>
 2a0:	1c59      	adds	r1, r3, #1
 2a2:	7441      	strb	r1, [r0, #17]
 2a4:	6801      	ldr	r1, [r0, #0]
 2a6:	f81c 3003 	ldrb.w	r3, [ip, r3]
 2aa:	600b      	str	r3, [r1, #0]
 2ac:	6803      	ldr	r3, [r0, #0]
 2ae:	69db      	ldr	r3, [r3, #28]
 2b0:	f413 5f80 	tst.w	r3, #4096	; 0x1000
 2b4:	d106      	bne.n	2c4 <Stack_Size+0xc4>
 2b6:	7c41      	ldrb	r1, [r0, #17]
 2b8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 2bc:	6059      	str	r1, [r3, #4]
 2be:	7c43      	ldrb	r3, [r0, #17]
 2c0:	42a3      	cmp	r3, r4
 2c2:	d1ed      	bne.n	2a0 <Stack_Size+0xa0>
 2c4:	6803      	ldr	r3, [r0, #0]
 2c6:	69db      	ldr	r3, [r3, #28]
 2c8:	f013 0f1f 	tst.w	r3, #31
 2cc:	d00c      	beq.n	2e8 <Stack_Size+0xe8>
 2ce:	7c81      	ldrb	r1, [r0, #18]
 2d0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 2d4:	60d9      	str	r1, [r3, #12]
 2d6:	7c83      	ldrb	r3, [r0, #18]
 2d8:	4573      	cmp	r3, lr
 2da:	d005      	beq.n	2e8 <Stack_Size+0xe8>
 2dc:	6801      	ldr	r1, [r0, #0]
 2de:	6a49      	ldr	r1, [r1, #36]	; 0x24
 2e0:	1c5d      	adds	r5, r3, #1
 2e2:	7485      	strb	r5, [r0, #18]
 2e4:	54d1      	strb	r1, [r2, r3]
 2e6:	e7ed      	b.n	2c4 <Stack_Size+0xc4>
 2e8:	6801      	ldr	r1, [r0, #0]
 2ea:	690b      	ldr	r3, [r1, #16]
 2ec:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 2f0:	610b      	str	r3, [r1, #16]
 2f2:	e7a9      	b.n	248 <Stack_Size+0x48>
 2f4:	6919      	ldr	r1, [r3, #16]
 2f6:	f421 3100 	bic.w	r1, r1, #131072	; 0x20000
 2fa:	6119      	str	r1, [r3, #16]
 2fc:	6801      	ldr	r1, [r0, #0]
 2fe:	698b      	ldr	r3, [r1, #24]
 300:	f043 0310 	orr.w	r3, r3, #16
 304:	618b      	str	r3, [r1, #24]
 306:	e006      	b.n	316 <Stack_Size+0x116>
 308:	6801      	ldr	r1, [r0, #0]
 30a:	6a49      	ldr	r1, [r1, #36]	; 0x24
 30c:	f103 0c01 	add.w	ip, r3, #1
 310:	f880 c012 	strb.w	ip, [r0, #18]
 314:	54d1      	strb	r1, [r2, r3]
 316:	6803      	ldr	r3, [r0, #0]
 318:	69db      	ldr	r3, [r3, #28]
 31a:	f013 0f1f 	tst.w	r3, #31
 31e:	d006      	beq.n	32e <Stack_Size+0x12e>
 320:	7c81      	ldrb	r1, [r0, #18]
 322:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 326:	60d9      	str	r1, [r3, #12]
 328:	7c83      	ldrb	r3, [r0, #18]
 32a:	4573      	cmp	r3, lr
 32c:	d1ec      	bne.n	308 <Stack_Size+0x108>
 32e:	6801      	ldr	r1, [r0, #0]
 330:	690b      	ldr	r3, [r1, #16]
 332:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 336:	610b      	str	r3, [r1, #16]
 338:	e007      	b.n	34a <Stack_Size+0x14a>
 33a:	7c83      	ldrb	r3, [r0, #18]
 33c:	4573      	cmp	r3, lr
 33e:	d218      	bcs.n	372 <Stack_Size+0x172>
 340:	6803      	ldr	r3, [r0, #0]
 342:	6a19      	ldr	r1, [r3, #32]
 344:	f011 0f10 	tst.w	r1, #16
 348:	d1d4      	bne.n	2f4 <Stack_Size+0xf4>
 34a:	6803      	ldr	r3, [r0, #0]
 34c:	69db      	ldr	r3, [r3, #28]
 34e:	f013 0f1f 	tst.w	r3, #31
 352:	d0f2      	beq.n	33a <Stack_Size+0x13a>
 354:	7c81      	ldrb	r1, [r0, #18]
 356:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 35a:	60d9      	str	r1, [r3, #12]
 35c:	7c83      	ldrb	r3, [r0, #18]
 35e:	4573      	cmp	r3, lr
 360:	d0eb      	beq.n	33a <Stack_Size+0x13a>
 362:	6801      	ldr	r1, [r0, #0]
 364:	6a49      	ldr	r1, [r1, #36]	; 0x24
 366:	f103 0c01 	add.w	ip, r3, #1
 36a:	f880 c012 	strb.w	ip, [r0, #18]
 36e:	54d1      	strb	r1, [r2, r3]
 370:	e7eb      	b.n	34a <Stack_Size+0x14a>
 372:	6803      	ldr	r3, [r0, #0]
 374:	6a1a      	ldr	r2, [r3, #32]
 376:	f012 0f20 	tst.w	r2, #32
 37a:	d0fa      	beq.n	372 <Stack_Size+0x172>
 37c:	699a      	ldr	r2, [r3, #24]
 37e:	f042 0220 	orr.w	r2, r2, #32
 382:	619a      	str	r2, [r3, #24]
 384:	6802      	ldr	r2, [r0, #0]
 386:	6913      	ldr	r3, [r2, #16]
 388:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 38c:	6113      	str	r3, [r2, #16]
 38e:	6802      	ldr	r2, [r0, #0]
 390:	6853      	ldr	r3, [r2, #4]
 392:	f023 0302 	bic.w	r3, r3, #2
 396:	6053      	str	r3, [r2, #4]
 398:	2300      	movs	r3, #0
 39a:	7443      	strb	r3, [r0, #17]
 39c:	7483      	strb	r3, [r0, #18]
 39e:	bd30      	pop	{r4, r5, pc}

000003a0 <spim_int_frame_done_callback>:
 3a0:	4770      	bx	lr

000003a2 <spim_int_transferring_pending_callback>:
 3a2:	4770      	bx	lr

000003a4 <spim_int_tx_fifo_empty_callback>:
 3a4:	4770      	bx	lr

000003a6 <spim_int_tx_fifo_thres_callback>:
 3a6:	4770      	bx	lr

000003a8 <spim_int_rx_fifo_noempty_callback>:
 3a8:	4770      	bx	lr

000003aa <spim_int_rx_fifo_thres_callback>:
 3aa:	4770      	bx	lr

000003ac <drv_spim_interrupt_handler>:
 3ac:	b538      	push	{r3, r4, r5, lr}
 3ae:	4605      	mov	r5, r0
 3b0:	6803      	ldr	r3, [r0, #0]
 3b2:	6a1c      	ldr	r4, [r3, #32]
 3b4:	695a      	ldr	r2, [r3, #20]
 3b6:	b2d2      	uxtb	r2, r2
 3b8:	4014      	ands	r4, r2
 3ba:	619c      	str	r4, [r3, #24]
 3bc:	f014 0f20 	tst.w	r4, #32
 3c0:	d10f      	bne.n	3e2 <drv_spim_interrupt_handler+0x36>
 3c2:	f014 0f10 	tst.w	r4, #16
 3c6:	d10f      	bne.n	3e8 <drv_spim_interrupt_handler+0x3c>
 3c8:	f014 0f01 	tst.w	r4, #1
 3cc:	d110      	bne.n	3f0 <drv_spim_interrupt_handler+0x44>
 3ce:	f014 0f02 	tst.w	r4, #2
 3d2:	d111      	bne.n	3f8 <drv_spim_interrupt_handler+0x4c>
 3d4:	f014 0f04 	tst.w	r4, #4
 3d8:	d112      	bne.n	400 <drv_spim_interrupt_handler+0x54>
 3da:	f014 0f08 	tst.w	r4, #8
 3de:	d113      	bne.n	408 <drv_spim_interrupt_handler+0x5c>
 3e0:	bd38      	pop	{r3, r4, r5, pc}
 3e2:	f7ff ffdd 	bl	3a0 <spim_int_frame_done_callback>
 3e6:	e7ec      	b.n	3c2 <drv_spim_interrupt_handler+0x16>
 3e8:	4628      	mov	r0, r5
 3ea:	f7ff ffda 	bl	3a2 <spim_int_transferring_pending_callback>
 3ee:	e7eb      	b.n	3c8 <drv_spim_interrupt_handler+0x1c>
 3f0:	4628      	mov	r0, r5
 3f2:	f7ff ffd8 	bl	3a6 <spim_int_tx_fifo_thres_callback>
 3f6:	e7ea      	b.n	3ce <drv_spim_interrupt_handler+0x22>
 3f8:	4628      	mov	r0, r5
 3fa:	f7ff ffd3 	bl	3a4 <spim_int_tx_fifo_empty_callback>
 3fe:	e7e9      	b.n	3d4 <drv_spim_interrupt_handler+0x28>
 400:	4628      	mov	r0, r5
 402:	f7ff ffd2 	bl	3aa <spim_int_rx_fifo_thres_callback>
 406:	e7e8      	b.n	3da <drv_spim_interrupt_handler+0x2e>
 408:	4628      	mov	r0, r5
 40a:	f7ff ffcd 	bl	3a8 <spim_int_rx_fifo_noempty_callback>
 40e:	e7e7      	b.n	3e0 <drv_spim_interrupt_handler+0x34>

00000410 <drv_uart_default_config>:
 410:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 414:	6043      	str	r3, [r0, #4]
 416:	230f      	movs	r3, #15
 418:	7203      	strb	r3, [r0, #8]
 41a:	2300      	movs	r3, #0
 41c:	7243      	strb	r3, [r0, #9]
 41e:	7283      	strb	r3, [r0, #10]
 420:	72c3      	strb	r3, [r0, #11]
 422:	7303      	strb	r3, [r0, #12]
 424:	7343      	strb	r3, [r0, #13]
 426:	2301      	movs	r3, #1
 428:	7383      	strb	r3, [r0, #14]
 42a:	4770      	bx	lr

0000042c <drv_uart_set_config>:
 42c:	b508      	push	{r3, lr}
 42e:	6841      	ldr	r1, [r0, #4]
 430:	7a03      	ldrb	r3, [r0, #8]
 432:	fb03 f201 	mul.w	r2, r3, r1
 436:	490e      	ldr	r1, [pc, #56]	; (470 <drv_uart_set_config+0x44>)
 438:	fbb1 f2f2 	udiv	r2, r1, r2
 43c:	0419      	lsls	r1, r3, #16
 43e:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 442:	7a43      	ldrb	r3, [r0, #9]
 444:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 448:	7a83      	ldrb	r3, [r0, #10]
 44a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 44e:	7ac3      	ldrb	r3, [r0, #11]
 450:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 454:	7b03      	ldrb	r3, [r0, #12]
 456:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 45a:	7b42      	ldrb	r2, [r0, #13]
 45c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 460:	7b82      	ldrb	r2, [r0, #14]
 462:	4311      	orrs	r1, r2
 464:	6800      	ldr	r0, [r0, #0]
 466:	460a      	mov	r2, r1
 468:	3008      	adds	r0, #8
 46a:	f7ff fe31 	bl	d0 <drv_check_rw_data>
 46e:	bd08      	pop	{r3, pc}
 470:	02625a00 	rsbeq	r5, r2, #0, 20

00000474 <drv_uart_init>:
 474:	b538      	push	{r3, r4, r5, lr}
 476:	4604      	mov	r4, r0
 478:	2500      	movs	r5, #0
 47a:	7485      	strb	r5, [r0, #18]
 47c:	74c5      	strb	r5, [r0, #19]
 47e:	f7ff ffd5 	bl	42c <drv_uart_set_config>
 482:	7425      	strb	r5, [r4, #16]
 484:	74a5      	strb	r5, [r4, #18]
 486:	74e5      	strb	r5, [r4, #19]
 488:	6822      	ldr	r2, [r4, #0]
 48a:	6853      	ldr	r3, [r2, #4]
 48c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 490:	6053      	str	r3, [r2, #4]
 492:	6822      	ldr	r2, [r4, #0]
 494:	6853      	ldr	r3, [r2, #4]
 496:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 49a:	6053      	str	r3, [r2, #4]
 49c:	6822      	ldr	r2, [r4, #0]
 49e:	6853      	ldr	r3, [r2, #4]
 4a0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 4a4:	6053      	str	r3, [r2, #4]
 4a6:	6822      	ldr	r2, [r4, #0]
 4a8:	6853      	ldr	r3, [r2, #4]
 4aa:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 4ae:	6053      	str	r3, [r2, #4]
 4b0:	6822      	ldr	r2, [r4, #0]
 4b2:	6853      	ldr	r3, [r2, #4]
 4b4:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 4b8:	6053      	str	r3, [r2, #4]
 4ba:	6822      	ldr	r2, [r4, #0]
 4bc:	6853      	ldr	r3, [r2, #4]
 4be:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 4c2:	6053      	str	r3, [r2, #4]
 4c4:	6822      	ldr	r2, [r4, #0]
 4c6:	6853      	ldr	r3, [r2, #4]
 4c8:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 4cc:	6053      	str	r3, [r2, #4]
 4ce:	6822      	ldr	r2, [r4, #0]
 4d0:	6853      	ldr	r3, [r2, #4]
 4d2:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 4d6:	6053      	str	r3, [r2, #4]
 4d8:	6823      	ldr	r3, [r4, #0]
 4da:	f240 12ff 	movw	r2, #511	; 0x1ff
 4de:	611a      	str	r2, [r3, #16]
 4e0:	6823      	ldr	r3, [r4, #0]
 4e2:	611d      	str	r5, [r3, #16]
 4e4:	6822      	ldr	r2, [r4, #0]
 4e6:	6853      	ldr	r3, [r2, #4]
 4e8:	f043 0301 	orr.w	r3, r3, #1
 4ec:	6053      	str	r3, [r2, #4]
 4ee:	6822      	ldr	r2, [r4, #0]
 4f0:	6853      	ldr	r3, [r2, #4]
 4f2:	f023 0301 	bic.w	r3, r3, #1
 4f6:	6053      	str	r3, [r2, #4]
 4f8:	6822      	ldr	r2, [r4, #0]
 4fa:	6853      	ldr	r3, [r2, #4]
 4fc:	f043 0302 	orr.w	r3, r3, #2
 500:	6053      	str	r3, [r2, #4]
 502:	bd38      	pop	{r3, r4, r5, pc}

00000504 <uart_int_tx_done_callback>:
 504:	4770      	bx	lr

00000506 <uart_int_rx_stop_callback>:
 506:	4770      	bx	lr

00000508 <uart_int_rx_parity_error_callback>:
 508:	4770      	bx	lr

0000050a <uart_int_rx_noise_detect_callback>:
 50a:	4770      	bx	lr

0000050c <uart_int_rx_stop_detect_callback>:
 50c:	4770      	bx	lr

0000050e <uart_int_tx_fifo_empty_callback>:
 50e:	4770      	bx	lr

00000510 <uart_int_tx_fifo_thres_callback>:
 510:	4770      	bx	lr

00000512 <uart_int_rx_fifo_noempty_callback>:
 512:	4770      	bx	lr

00000514 <uart_int_rx_fifo_thres_callback>:
 514:	4770      	bx	lr

00000516 <drv_uart_interrupt_handler>:
 516:	b538      	push	{r3, r4, r5, lr}
 518:	4604      	mov	r4, r0
 51a:	6803      	ldr	r3, [r0, #0]
 51c:	699d      	ldr	r5, [r3, #24]
 51e:	68db      	ldr	r3, [r3, #12]
 520:	b29b      	uxth	r3, r3
 522:	401d      	ands	r5, r3
 524:	f415 7f80 	tst.w	r5, #256	; 0x100
 528:	d144      	bne.n	5b4 <drv_uart_interrupt_handler+0x9e>
 52a:	f015 0f40 	tst.w	r5, #64	; 0x40
 52e:	d00f      	beq.n	550 <drv_uart_interrupt_handler+0x3a>
 530:	2301      	movs	r3, #1
 532:	7423      	strb	r3, [r4, #16]
 534:	7aa3      	ldrb	r3, [r4, #10]
 536:	2b01      	cmp	r3, #1
 538:	d147      	bne.n	5ca <drv_uart_interrupt_handler+0xb4>
 53a:	4620      	mov	r0, r4
 53c:	f7ff ffe3 	bl	506 <uart_int_rx_stop_callback>
 540:	6822      	ldr	r2, [r4, #0]
 542:	6913      	ldr	r3, [r2, #16]
 544:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 548:	6113      	str	r3, [r2, #16]
 54a:	6823      	ldr	r3, [r4, #0]
 54c:	2200      	movs	r2, #0
 54e:	611a      	str	r2, [r3, #16]
 550:	f015 0f80 	tst.w	r5, #128	; 0x80
 554:	d00f      	beq.n	576 <drv_uart_interrupt_handler+0x60>
 556:	2302      	movs	r3, #2
 558:	7423      	strb	r3, [r4, #16]
 55a:	7aa3      	ldrb	r3, [r4, #10]
 55c:	2b01      	cmp	r3, #1
 55e:	d166      	bne.n	62e <drv_uart_interrupt_handler+0x118>
 560:	4620      	mov	r0, r4
 562:	f7ff ffd1 	bl	508 <uart_int_rx_parity_error_callback>
 566:	6822      	ldr	r2, [r4, #0]
 568:	6913      	ldr	r3, [r2, #16]
 56a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 56e:	6113      	str	r3, [r2, #16]
 570:	6823      	ldr	r3, [r4, #0]
 572:	2200      	movs	r2, #0
 574:	611a      	str	r2, [r3, #16]
 576:	f015 0f20 	tst.w	r5, #32
 57a:	f040 808a 	bne.w	692 <drv_uart_interrupt_handler+0x17c>
 57e:	f015 0f10 	tst.w	r5, #16
 582:	f040 8092 	bne.w	6aa <drv_uart_interrupt_handler+0x194>
 586:	f015 0f01 	tst.w	r5, #1
 58a:	f040 809a 	bne.w	6c2 <drv_uart_interrupt_handler+0x1ac>
 58e:	f015 0f02 	tst.w	r5, #2
 592:	f040 80a2 	bne.w	6da <drv_uart_interrupt_handler+0x1c4>
 596:	f015 0f04 	tst.w	r5, #4
 59a:	f000 80c1 	beq.w	720 <drv_uart_interrupt_handler+0x20a>
 59e:	7ce2      	ldrb	r2, [r4, #19]
 5a0:	7e23      	ldrb	r3, [r4, #24]
 5a2:	429a      	cmp	r2, r3
 5a4:	f0c0 80ac 	bcc.w	700 <drv_uart_interrupt_handler+0x1ea>
 5a8:	6822      	ldr	r2, [r4, #0]
 5aa:	68d3      	ldr	r3, [r2, #12]
 5ac:	f023 030c 	bic.w	r3, r3, #12
 5b0:	60d3      	str	r3, [r2, #12]
 5b2:	e0aa      	b.n	70a <drv_uart_interrupt_handler+0x1f4>
 5b4:	f7ff ffa6 	bl	504 <uart_int_tx_done_callback>
 5b8:	6822      	ldr	r2, [r4, #0]
 5ba:	6913      	ldr	r3, [r2, #16]
 5bc:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 5c0:	6113      	str	r3, [r2, #16]
 5c2:	6823      	ldr	r3, [r4, #0]
 5c4:	2200      	movs	r2, #0
 5c6:	611a      	str	r2, [r3, #16]
 5c8:	e7af      	b.n	52a <drv_uart_interrupt_handler+0x14>
 5ca:	6822      	ldr	r2, [r4, #0]
 5cc:	68d3      	ldr	r3, [r2, #12]
 5ce:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 5d2:	60d3      	str	r3, [r2, #12]
 5d4:	2300      	movs	r3, #0
 5d6:	7423      	strb	r3, [r4, #16]
 5d8:	74a3      	strb	r3, [r4, #18]
 5da:	74e3      	strb	r3, [r4, #19]
 5dc:	6822      	ldr	r2, [r4, #0]
 5de:	6853      	ldr	r3, [r2, #4]
 5e0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 5e4:	6053      	str	r3, [r2, #4]
 5e6:	6822      	ldr	r2, [r4, #0]
 5e8:	6853      	ldr	r3, [r2, #4]
 5ea:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 5ee:	6053      	str	r3, [r2, #4]
 5f0:	6822      	ldr	r2, [r4, #0]
 5f2:	6853      	ldr	r3, [r2, #4]
 5f4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 5f8:	6053      	str	r3, [r2, #4]
 5fa:	6822      	ldr	r2, [r4, #0]
 5fc:	6853      	ldr	r3, [r2, #4]
 5fe:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 602:	6053      	str	r3, [r2, #4]
 604:	6822      	ldr	r2, [r4, #0]
 606:	6853      	ldr	r3, [r2, #4]
 608:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 60c:	6053      	str	r3, [r2, #4]
 60e:	6822      	ldr	r2, [r4, #0]
 610:	6853      	ldr	r3, [r2, #4]
 612:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 616:	6053      	str	r3, [r2, #4]
 618:	6822      	ldr	r2, [r4, #0]
 61a:	6853      	ldr	r3, [r2, #4]
 61c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 620:	6053      	str	r3, [r2, #4]
 622:	6822      	ldr	r2, [r4, #0]
 624:	6853      	ldr	r3, [r2, #4]
 626:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 62a:	6053      	str	r3, [r2, #4]
 62c:	e785      	b.n	53a <drv_uart_interrupt_handler+0x24>
 62e:	6822      	ldr	r2, [r4, #0]
 630:	68d3      	ldr	r3, [r2, #12]
 632:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 636:	60d3      	str	r3, [r2, #12]
 638:	2300      	movs	r3, #0
 63a:	7423      	strb	r3, [r4, #16]
 63c:	74a3      	strb	r3, [r4, #18]
 63e:	74e3      	strb	r3, [r4, #19]
 640:	6822      	ldr	r2, [r4, #0]
 642:	6853      	ldr	r3, [r2, #4]
 644:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 648:	6053      	str	r3, [r2, #4]
 64a:	6822      	ldr	r2, [r4, #0]
 64c:	6853      	ldr	r3, [r2, #4]
 64e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 652:	6053      	str	r3, [r2, #4]
 654:	6822      	ldr	r2, [r4, #0]
 656:	6853      	ldr	r3, [r2, #4]
 658:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 65c:	6053      	str	r3, [r2, #4]
 65e:	6822      	ldr	r2, [r4, #0]
 660:	6853      	ldr	r3, [r2, #4]
 662:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 666:	6053      	str	r3, [r2, #4]
 668:	6822      	ldr	r2, [r4, #0]
 66a:	6853      	ldr	r3, [r2, #4]
 66c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 670:	6053      	str	r3, [r2, #4]
 672:	6822      	ldr	r2, [r4, #0]
 674:	6853      	ldr	r3, [r2, #4]
 676:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 67a:	6053      	str	r3, [r2, #4]
 67c:	6822      	ldr	r2, [r4, #0]
 67e:	6853      	ldr	r3, [r2, #4]
 680:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 684:	6053      	str	r3, [r2, #4]
 686:	6822      	ldr	r2, [r4, #0]
 688:	6853      	ldr	r3, [r2, #4]
 68a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 68e:	6053      	str	r3, [r2, #4]
 690:	e766      	b.n	560 <drv_uart_interrupt_handler+0x4a>
 692:	4620      	mov	r0, r4
 694:	f7ff ff39 	bl	50a <uart_int_rx_noise_detect_callback>
 698:	6822      	ldr	r2, [r4, #0]
 69a:	6913      	ldr	r3, [r2, #16]
 69c:	f043 0320 	orr.w	r3, r3, #32
 6a0:	6113      	str	r3, [r2, #16]
 6a2:	6823      	ldr	r3, [r4, #0]
 6a4:	2200      	movs	r2, #0
 6a6:	611a      	str	r2, [r3, #16]
 6a8:	e769      	b.n	57e <drv_uart_interrupt_handler+0x68>
 6aa:	4620      	mov	r0, r4
 6ac:	f7ff ff2e 	bl	50c <uart_int_rx_stop_detect_callback>
 6b0:	6822      	ldr	r2, [r4, #0]
 6b2:	6913      	ldr	r3, [r2, #16]
 6b4:	f043 0310 	orr.w	r3, r3, #16
 6b8:	6113      	str	r3, [r2, #16]
 6ba:	6823      	ldr	r3, [r4, #0]
 6bc:	2200      	movs	r2, #0
 6be:	611a      	str	r2, [r3, #16]
 6c0:	e761      	b.n	586 <drv_uart_interrupt_handler+0x70>
 6c2:	4620      	mov	r0, r4
 6c4:	f7ff ff24 	bl	510 <uart_int_tx_fifo_thres_callback>
 6c8:	6822      	ldr	r2, [r4, #0]
 6ca:	6913      	ldr	r3, [r2, #16]
 6cc:	f043 0301 	orr.w	r3, r3, #1
 6d0:	6113      	str	r3, [r2, #16]
 6d2:	6823      	ldr	r3, [r4, #0]
 6d4:	2200      	movs	r2, #0
 6d6:	611a      	str	r2, [r3, #16]
 6d8:	e759      	b.n	58e <drv_uart_interrupt_handler+0x78>
 6da:	4620      	mov	r0, r4
 6dc:	f7ff ff17 	bl	50e <uart_int_tx_fifo_empty_callback>
 6e0:	6822      	ldr	r2, [r4, #0]
 6e2:	6913      	ldr	r3, [r2, #16]
 6e4:	f043 0302 	orr.w	r3, r3, #2
 6e8:	6113      	str	r3, [r2, #16]
 6ea:	6823      	ldr	r3, [r4, #0]
 6ec:	2200      	movs	r2, #0
 6ee:	611a      	str	r2, [r3, #16]
 6f0:	e751      	b.n	596 <drv_uart_interrupt_handler+0x80>
 6f2:	69d9      	ldr	r1, [r3, #28]
 6f4:	6962      	ldr	r2, [r4, #20]
 6f6:	7ce3      	ldrb	r3, [r4, #19]
 6f8:	1c58      	adds	r0, r3, #1
 6fa:	74e0      	strb	r0, [r4, #19]
 6fc:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 700:	6823      	ldr	r3, [r4, #0]
 702:	695a      	ldr	r2, [r3, #20]
 704:	f012 0f1f 	tst.w	r2, #31
 708:	d1f3      	bne.n	6f2 <drv_uart_interrupt_handler+0x1dc>
 70a:	4620      	mov	r0, r4
 70c:	f7ff ff02 	bl	514 <uart_int_rx_fifo_thres_callback>
 710:	6822      	ldr	r2, [r4, #0]
 712:	6913      	ldr	r3, [r2, #16]
 714:	f043 0304 	orr.w	r3, r3, #4
 718:	6113      	str	r3, [r2, #16]
 71a:	6823      	ldr	r3, [r4, #0]
 71c:	2200      	movs	r2, #0
 71e:	611a      	str	r2, [r3, #16]
 720:	f015 0f08 	tst.w	r5, #8
 724:	d020      	beq.n	768 <drv_uart_interrupt_handler+0x252>
 726:	7ce2      	ldrb	r2, [r4, #19]
 728:	7e23      	ldrb	r3, [r4, #24]
 72a:	429a      	cmp	r2, r3
 72c:	d30c      	bcc.n	748 <drv_uart_interrupt_handler+0x232>
 72e:	6822      	ldr	r2, [r4, #0]
 730:	68d3      	ldr	r3, [r2, #12]
 732:	f023 030c 	bic.w	r3, r3, #12
 736:	60d3      	str	r3, [r2, #12]
 738:	e00b      	b.n	752 <drv_uart_interrupt_handler+0x23c>
 73a:	69d9      	ldr	r1, [r3, #28]
 73c:	6962      	ldr	r2, [r4, #20]
 73e:	7ce3      	ldrb	r3, [r4, #19]
 740:	1c58      	adds	r0, r3, #1
 742:	74e0      	strb	r0, [r4, #19]
 744:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 748:	6823      	ldr	r3, [r4, #0]
 74a:	695a      	ldr	r2, [r3, #20]
 74c:	f012 0f1f 	tst.w	r2, #31
 750:	d1f3      	bne.n	73a <drv_uart_interrupt_handler+0x224>
 752:	4620      	mov	r0, r4
 754:	f7ff fedd 	bl	512 <uart_int_rx_fifo_noempty_callback>
 758:	6822      	ldr	r2, [r4, #0]
 75a:	6913      	ldr	r3, [r2, #16]
 75c:	f043 0308 	orr.w	r3, r3, #8
 760:	6113      	str	r3, [r2, #16]
 762:	6823      	ldr	r3, [r4, #0]
 764:	2200      	movs	r2, #0
 766:	611a      	str	r2, [r3, #16]
 768:	bd38      	pop	{r3, r4, r5, pc}
	...

0000076c <NMI_Handler>:
 76c:	b508      	push	{r3, lr}
 76e:	4802      	ldr	r0, [pc, #8]	; (778 <NMI_Handler+0xc>)
 770:	f000 f8da 	bl	928 <test_printf_s>
 774:	bd08      	pop	{r3, pc}
 776:	bf00      	nop
 778:	00000970 	andeq	r0, r0, r0, ror r9

0000077c <HardFault_Handler>:
 77c:	e7fe      	b.n	77c <HardFault_Handler>

0000077e <MemManage_Handler>:
 77e:	e7fe      	b.n	77e <MemManage_Handler>

00000780 <BusFault_Handler>:
 780:	e7fe      	b.n	780 <BusFault_Handler>

00000782 <UsageFault_Handler>:
 782:	e7fe      	b.n	782 <UsageFault_Handler>

00000784 <SVC_Handler>:
 784:	4770      	bx	lr

00000786 <DebugMon_Handler>:
 786:	4770      	bx	lr

00000788 <PendSV_Handler>:
 788:	4770      	bx	lr

0000078a <SysTick_Handler>:
 78a:	4770      	bx	lr

0000078c <Uart0_Handler>:
 78c:	b508      	push	{r3, lr}
 78e:	4b04      	ldr	r3, [pc, #16]	; (7a0 <Uart0_Handler+0x14>)
 790:	2201      	movs	r2, #1
 792:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 796:	4803      	ldr	r0, [pc, #12]	; (7a4 <Uart0_Handler+0x18>)
 798:	f7ff febd 	bl	516 <drv_uart_interrupt_handler>
 79c:	bd08      	pop	{r3, pc}
 79e:	bf00      	nop
 7a0:	e000e100 	and	lr, r0, r0, lsl #2
 7a4:	00020120 	andeq	r0, r2, r0, lsr #2

000007a8 <Spim_Handler>:
 7a8:	b508      	push	{r3, lr}
 7aa:	4b04      	ldr	r3, [pc, #16]	; (7bc <Spim_Handler+0x14>)
 7ac:	f44f 2200 	mov.w	r2, #524288	; 0x80000
 7b0:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 7b4:	4802      	ldr	r0, [pc, #8]	; (7c0 <Spim_Handler+0x18>)
 7b6:	f7ff fdf9 	bl	3ac <drv_spim_interrupt_handler>
 7ba:	bd08      	pop	{r3, pc}
 7bc:	e000e100 	and	lr, r0, r0, lsl #2
 7c0:	00020084 	andeq	r0, r2, r4, lsl #1

000007c4 <main>:
 7c4:	b508      	push	{r3, lr}
 7c6:	f000 f89f 	bl	908 <uart0_init>
 7ca:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 7ce:	23bd      	movs	r3, #189	; 0xbd
 7d0:	60a3      	str	r3, [r4, #8]
 7d2:	f000 f829 	bl	828 <spim_trans_frame_pending_test>
 7d6:	23ed      	movs	r3, #237	; 0xed
 7d8:	60a3      	str	r3, [r4, #8]
 7da:	e7fe      	b.n	7da <main+0x16>

000007dc <spim_init>:
 7dc:	b510      	push	{r4, lr}
 7de:	4b06      	ldr	r3, [pc, #24]	; (7f8 <spim_init+0x1c>)
 7e0:	4c06      	ldr	r4, [pc, #24]	; (7fc <spim_init+0x20>)
 7e2:	601c      	str	r4, [r3, #0]
 7e4:	7219      	strb	r1, [r3, #8]
 7e6:	6058      	str	r0, [r3, #4]
 7e8:	731a      	strb	r2, [r3, #12]
 7ea:	735a      	strb	r2, [r3, #13]
 7ec:	739a      	strb	r2, [r3, #14]
 7ee:	4618      	mov	r0, r3
 7f0:	f7ff fca4 	bl	13c <drv_spim_init>
 7f4:	bd10      	pop	{r4, pc}
 7f6:	bf00      	nop
 7f8:	00020084 	andeq	r0, r2, r4, lsl #1
 7fc:	40022000 	andmi	r2, r2, r0

00000800 <spim_deinit>:
 800:	b508      	push	{r3, lr}
 802:	4802      	ldr	r0, [pc, #8]	; (80c <spim_deinit+0xc>)
 804:	f7ff fcbb 	bl	17e <drv_spim_deinit>
 808:	bd08      	pop	{r3, pc}
 80a:	bf00      	nop
 80c:	00020084 	andeq	r0, r2, r4, lsl #1

00000810 <tx_data_prepare>:
 810:	2300      	movs	r3, #0
 812:	e003      	b.n	81c <tx_data_prepare+0xc>
 814:	4a03      	ldr	r2, [pc, #12]	; (824 <tx_data_prepare+0x14>)
 816:	54d3      	strb	r3, [r2, r3]
 818:	3301      	adds	r3, #1
 81a:	b2db      	uxtb	r3, r3
 81c:	2b3f      	cmp	r3, #63	; 0x3f
 81e:	d9f9      	bls.n	814 <tx_data_prepare+0x4>
 820:	4770      	bx	lr
 822:	bf00      	nop
 824:	000200e0 	andeq	r0, r2, r0, ror #1

00000828 <spim_trans_frame_pending_test>:
 828:	b570      	push	{r4, r5, r6, lr}
 82a:	b082      	sub	sp, #8
 82c:	f7ff fff0 	bl	810 <tx_data_prepare>
 830:	4b13      	ldr	r3, [pc, #76]	; (880 <spim_trans_frame_pending_test+0x58>)
 832:	2299      	movs	r2, #153	; 0x99
 834:	701a      	strb	r2, [r3, #0]
 836:	705a      	strb	r2, [r3, #1]
 838:	2601      	movs	r6, #1
 83a:	e01a      	b.n	872 <spim_trans_frame_pending_test+0x4a>
 83c:	4622      	mov	r2, r4
 83e:	4629      	mov	r1, r5
 840:	4630      	mov	r0, r6
 842:	f7ff ffcb 	bl	7dc <spim_init>
 846:	2302      	movs	r3, #2
 848:	9300      	str	r3, [sp, #0]
 84a:	2340      	movs	r3, #64	; 0x40
 84c:	4a0d      	ldr	r2, [pc, #52]	; (884 <spim_trans_frame_pending_test+0x5c>)
 84e:	490c      	ldr	r1, [pc, #48]	; (880 <spim_trans_frame_pending_test+0x58>)
 850:	480d      	ldr	r0, [pc, #52]	; (888 <spim_trans_frame_pending_test+0x60>)
 852:	f7ff fcb4 	bl	1be <drv_spim_trans_frame_with_pending>
 856:	f7ff ffd3 	bl	800 <spim_deinit>
 85a:	3401      	adds	r4, #1
 85c:	b2e4      	uxtb	r4, r4
 85e:	2c01      	cmp	r4, #1
 860:	d9ec      	bls.n	83c <spim_trans_frame_pending_test+0x14>
 862:	3501      	adds	r5, #1
 864:	b2ed      	uxtb	r5, r5
 866:	2d03      	cmp	r5, #3
 868:	d801      	bhi.n	86e <spim_trans_frame_pending_test+0x46>
 86a:	2400      	movs	r4, #0
 86c:	e7f7      	b.n	85e <spim_trans_frame_pending_test+0x36>
 86e:	3601      	adds	r6, #1
 870:	b2f6      	uxtb	r6, r6
 872:	2e02      	cmp	r6, #2
 874:	d801      	bhi.n	87a <spim_trans_frame_pending_test+0x52>
 876:	2500      	movs	r5, #0
 878:	e7f5      	b.n	866 <spim_trans_frame_pending_test+0x3e>
 87a:	b002      	add	sp, #8
 87c:	bd70      	pop	{r4, r5, r6, pc}
 87e:	bf00      	nop
 880:	000200e0 	andeq	r0, r2, r0, ror #1
 884:	000200a0 	andeq	r0, r2, r0, lsr #1
 888:	00020084 	andeq	r0, r2, r4, lsl #1

0000088c <Reset_Handler>:
 88c:	490a      	ldr	r1, [pc, #40]	; (8b8 <Reset_Handler+0x2c>)
 88e:	4a0b      	ldr	r2, [pc, #44]	; (8bc <Reset_Handler+0x30>)
 890:	4b0b      	ldr	r3, [pc, #44]	; (8c0 <Reset_Handler+0x34>)
 892:	1a9b      	subs	r3, r3, r2
 894:	dd03      	ble.n	89e <Reset_Handler+0x12>
 896:	3b04      	subs	r3, #4
 898:	58c8      	ldr	r0, [r1, r3]
 89a:	50d0      	str	r0, [r2, r3]
 89c:	dcfb      	bgt.n	896 <Reset_Handler+0xa>
 89e:	4909      	ldr	r1, [pc, #36]	; (8c4 <Reset_Handler+0x38>)
 8a0:	4a09      	ldr	r2, [pc, #36]	; (8c8 <Reset_Handler+0x3c>)
 8a2:	2000      	movs	r0, #0
 8a4:	4291      	cmp	r1, r2
 8a6:	bfbc      	itt	lt
 8a8:	f841 0b04 	strlt.w	r0, [r1], #4
 8ac:	e7fa      	blt.n	8a4 <Reset_Handler+0x18>
 8ae:	f7ff ff89 	bl	7c4 <main>
 8b2:	f000 f83b 	bl	92c <exit>
 8b6:	097c0000 	ldmdbeq	ip!, {}^	; <UNPREDICTABLE>
 8ba:	00000000 	andeq	r0, r0, r0
 8be:	00680002 	rsbeq	r0, r8, r2
 8c2:	00680002 	rsbeq	r0, r8, r2
 8c6:	013c0002 	teqeq	ip, r2
 8ca:	e7fe0002 	ldrb	r0, [lr, r2]!
 8ce:	e7fe      	b.n	8ce <Reset_Handler+0x42>
 8d0:	e7fe      	b.n	8d0 <Reset_Handler+0x44>
 8d2:	e7fe      	b.n	8d2 <Reset_Handler+0x46>
 8d4:	e7fe      	b.n	8d4 <Reset_Handler+0x48>
 8d6:	e7fe      	b.n	8d6 <Reset_Handler+0x4a>
 8d8:	e7fe      	b.n	8d8 <Reset_Handler+0x4c>
 8da:	e7fe      	b.n	8da <Reset_Handler+0x4e>
 8dc:	e7fe      	b.n	8dc <Reset_Handler+0x50>
 8de:	e7fe      	b.n	8de <Reset_Handler+0x52>

000008e0 <Uart1_Handler>:
 8e0:	e7fe      	b.n	8e0 <Uart1_Handler>

000008e2 <Resv2_Handler>:
 8e2:	e7fe      	b.n	8e2 <Resv2_Handler>

000008e4 <Resv3_Handler>:
 8e4:	e7fe      	b.n	8e4 <Resv3_Handler>

000008e6 <EthDma_Handler>:
 8e6:	e7fe      	b.n	8e6 <EthDma_Handler>

000008e8 <Gpioa_Handler>:
 8e8:	e7fe      	b.n	8e8 <Gpioa_Handler>

000008ea <Resv6_Handler>:
 8ea:	e7fe      	b.n	8ea <Resv6_Handler>

000008ec <Resv7_Handler>:
 8ec:	e7fe      	b.n	8ec <Resv7_Handler>

000008ee <Bastim_Ch0_Handler>:
 8ee:	e7fe      	b.n	8ee <Bastim_Ch0_Handler>

000008f0 <Bastim_Ch1_Handler>:
 8f0:	e7fe      	b.n	8f0 <Bastim_Ch1_Handler>

000008f2 <Bastim_Ch2_Handler>:
 8f2:	e7fe      	b.n	8f2 <Bastim_Ch2_Handler>

000008f4 <Bastim_Ch3_Handler>:
 8f4:	e7fe      	b.n	8f4 <Bastim_Ch3_Handler>

000008f6 <EthSma_Handler>:
 8f6:	e7fe      	b.n	8f6 <EthSma_Handler>

000008f8 <EthTx_Handler>:
 8f8:	e7fe      	b.n	8f8 <EthTx_Handler>

000008fa <EthRx_Handler>:
 8fa:	e7fe      	b.n	8fa <EthRx_Handler>

000008fc <Resv15_Handler>:
 8fc:	e7fe      	b.n	8fc <Resv15_Handler>

000008fe <AdvtimGen_Handler>:
 8fe:	e7fe      	b.n	8fe <AdvtimGen_Handler>

00000900 <AdvtimCap_Handler>:
 900:	e7fe      	b.n	900 <AdvtimCap_Handler>

00000902 <AdvtimEnc_Handler>:
 902:	e7fe      	b.n	902 <AdvtimEnc_Handler>
 904:	e7fe      	b.n	904 <AdvtimEnc_Handler+0x2>
 906:	bf00      	nop

00000908 <uart0_init>:
 908:	b510      	push	{r4, lr}
 90a:	4c05      	ldr	r4, [pc, #20]	; (920 <uart0_init+0x18>)
 90c:	4b05      	ldr	r3, [pc, #20]	; (924 <uart0_init+0x1c>)
 90e:	6023      	str	r3, [r4, #0]
 910:	4620      	mov	r0, r4
 912:	f7ff fd7d 	bl	410 <drv_uart_default_config>
 916:	4620      	mov	r0, r4
 918:	f7ff fdac 	bl	474 <drv_uart_init>
 91c:	bd10      	pop	{r4, pc}
 91e:	bf00      	nop
 920:	00020120 	andeq	r0, r2, r0, lsr #2
 924:	40001000 	andmi	r1, r0, r0

00000928 <test_printf_s>:
 928:	4770      	bx	lr
	...

0000092c <exit>:
 92c:	b508      	push	{r3, lr}
 92e:	4b07      	ldr	r3, [pc, #28]	; (94c <exit+0x20>)
 930:	4604      	mov	r4, r0
 932:	b113      	cbz	r3, 93a <exit+0xe>
 934:	2100      	movs	r1, #0
 936:	f3af 8000 	nop.w
 93a:	4b05      	ldr	r3, [pc, #20]	; (950 <exit+0x24>)
 93c:	6818      	ldr	r0, [r3, #0]
 93e:	6a83      	ldr	r3, [r0, #40]	; 0x28
 940:	b103      	cbz	r3, 944 <exit+0x18>
 942:	4798      	blx	r3
 944:	4620      	mov	r0, r4
 946:	f000 f805 	bl	954 <_exit>
 94a:	bf00      	nop
 94c:	00000000 	andeq	r0, r0, r0
 950:	00000974 	andeq	r0, r0, r4, ror r9

00000954 <_exit>:
 954:	e7fe      	b.n	954 <_exit>
 956:	bf00      	nop

00000958 <_init>:
 958:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 95a:	bf00      	nop
 95c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 95e:	bc08      	pop	{r3}
 960:	469e      	mov	lr, r3
 962:	4770      	bx	lr

00000964 <_fini>:
 964:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 966:	bf00      	nop
 968:	bcf8      	pop	{r3, r4, r5, r6, r7}
 96a:	bc08      	pop	{r3}
 96c:	469e      	mov	lr, r3
 96e:	4770      	bx	lr
 970:	00494d4e 	subeq	r4, r9, lr, asr #26

00000974 <_global_impure_ptr>:
 974:	00020000 	andeq	r0, r2, r0

00000978 <__EH_FRAME_BEGIN__>:
 978:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <impure_data>:
	...

00020060 <__frame_dummy_init_array_entry>:
   20060:	000000b5 	strheq	r0, [r0], -r5

00020064 <__do_global_dtors_aux_fini_array_entry>:
   20064:	00000091 	muleq	r0, r1, r0

Disassembly of section .bss:

00020068 <__bss_start__>:
   20068:	00000000 	andeq	r0, r0, r0

0002006c <object.0>:
	...

00020084 <hspim>:
	...

000200a0 <rx_data>:
	...

000200e0 <tx_data>:
	...

00020120 <huart0>:
	...

Disassembly of section .stack_dummy:

00020140 <__HeapBase>:
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
  18:	0000092c 	andeq	r0, r0, ip, lsr #18
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000954 	andeq	r0, r0, r4, asr r9
  44:	00000002 	andeq	r0, r0, r2

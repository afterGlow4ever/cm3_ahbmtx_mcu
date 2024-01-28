
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00012000 	andeq	r2, r1, r0
   4:	000009e5 	andeq	r0, r0, r5, ror #19
   8:	0000092f 	andeq	r0, r0, pc, lsr #18
   c:	00000931 	andeq	r0, r0, r1, lsr r9
  10:	00000933 	andeq	r0, r0, r3, lsr r9
  14:	00000935 	andeq	r0, r0, r5, lsr r9
  18:	00000937 	andeq	r0, r0, r7, lsr r9
	...
  2c:	00000939 	andeq	r0, r0, r9, lsr r9
  30:	0000093b 	andeq	r0, r0, fp, lsr r9
  34:	00000000 	andeq	r0, r0, r0
  38:	0000093d 	andeq	r0, r0, sp, lsr r9
  3c:	0000093f 	andeq	r0, r0, pc, lsr r9
  40:	00000941 	andeq	r0, r0, r1, asr #18
  44:	00000a39 	andeq	r0, r0, r9, lsr sl
  48:	00000a3b 	andeq	r0, r0, fp, lsr sl
  4c:	00000a3d 	andeq	r0, r0, sp, lsr sl
  50:	00000a3f 	andeq	r0, r0, pc, lsr sl
  54:	00000a41 	andeq	r0, r0, r1, asr #20
  58:	00000a43 	andeq	r0, r0, r3, asr #20
  5c:	00000a45 	andeq	r0, r0, r5, asr #20
  60:	0000095d 	andeq	r0, r0, sp, asr r9
  64:	00000979 	andeq	r0, r0, r9, ror r9
  68:	00000995 	muleq	r0, r5, r9
  6c:	000009b1 			; <UNDEFINED> instruction: 0x000009b1
  70:	00000a4f 	andeq	r0, r0, pc, asr #20

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
  8c:	00010068 	andeq	r0, r1, r8, rrx
  90:	00000000 	andeq	r0, r0, r0
  94:	00000adc 	ldrdeq	r0, [r0], -ip

00000098 <frame_dummy>:
  98:	b508      	push	{r3, lr}
  9a:	4b03      	ldr	r3, [pc, #12]	; (a8 <frame_dummy+0x10>)
  9c:	b11b      	cbz	r3, a6 <frame_dummy+0xe>
  9e:	4903      	ldr	r1, [pc, #12]	; (ac <frame_dummy+0x14>)
  a0:	4803      	ldr	r0, [pc, #12]	; (b0 <frame_dummy+0x18>)
  a2:	f3af 8000 	nop.w
  a6:	bd08      	pop	{r3, pc}
  a8:	00000000 	andeq	r0, r0, r0
  ac:	0001006c 	andeq	r0, r1, ip, rrx
  b0:	00000adc 	ldrdeq	r0, [r0], -ip

000000b4 <bastim_ch0_init>:
  b4:	b508      	push	{r3, lr}
  b6:	4907      	ldr	r1, [pc, #28]	; (d4 <bastim_ch0_init+0x20>)
  b8:	2300      	movs	r3, #0
  ba:	700b      	strb	r3, [r1, #0]
  bc:	2301      	movs	r3, #1
  be:	704b      	strb	r3, [r1, #1]
  c0:	2314      	movs	r3, #20
  c2:	804b      	strh	r3, [r1, #2]
  c4:	808b      	strh	r3, [r1, #4]
  c6:	230a      	movs	r3, #10
  c8:	80cb      	strh	r3, [r1, #6]
  ca:	4803      	ldr	r0, [pc, #12]	; (d8 <bastim_ch0_init+0x24>)
  cc:	f000 f9bf 	bl	44e <drv_bastim_init>
  d0:	bd08      	pop	{r3, pc}
  d2:	bf00      	nop
  d4:	00010084 	andeq	r0, r1, r4, lsl #1
  d8:	40010000 	andmi	r0, r1, r0

000000dc <bastim_ch1_init>:
  dc:	b508      	push	{r3, lr}
  de:	4907      	ldr	r1, [pc, #28]	; (fc <bastim_ch1_init+0x20>)
  e0:	2301      	movs	r3, #1
  e2:	700b      	strb	r3, [r1, #0]
  e4:	704b      	strb	r3, [r1, #1]
  e6:	2314      	movs	r3, #20
  e8:	804b      	strh	r3, [r1, #2]
  ea:	230a      	movs	r3, #10
  ec:	808b      	strh	r3, [r1, #4]
  ee:	2300      	movs	r3, #0
  f0:	80cb      	strh	r3, [r1, #6]
  f2:	4803      	ldr	r0, [pc, #12]	; (100 <bastim_ch1_init+0x24>)
  f4:	f000 f9ab 	bl	44e <drv_bastim_init>
  f8:	bd08      	pop	{r3, pc}
  fa:	bf00      	nop
  fc:	0001008c 	andeq	r0, r1, ip, lsl #1
 100:	40010000 	andmi	r0, r1, r0

00000104 <bastim_ch2_init>:
 104:	b508      	push	{r3, lr}
 106:	4907      	ldr	r1, [pc, #28]	; (124 <bastim_ch2_init+0x20>)
 108:	2302      	movs	r3, #2
 10a:	700b      	strb	r3, [r1, #0]
 10c:	2301      	movs	r3, #1
 10e:	704b      	strb	r3, [r1, #1]
 110:	230a      	movs	r3, #10
 112:	804b      	strh	r3, [r1, #2]
 114:	2314      	movs	r3, #20
 116:	808b      	strh	r3, [r1, #4]
 118:	2300      	movs	r3, #0
 11a:	80cb      	strh	r3, [r1, #6]
 11c:	4802      	ldr	r0, [pc, #8]	; (128 <bastim_ch2_init+0x24>)
 11e:	f000 f996 	bl	44e <drv_bastim_init>
 122:	bd08      	pop	{r3, pc}
 124:	00010094 	muleq	r1, r4, r0
 128:	40010000 	andmi	r0, r1, r0

0000012c <bastim_ch3_init>:
 12c:	b508      	push	{r3, lr}
 12e:	4907      	ldr	r1, [pc, #28]	; (14c <bastim_ch3_init+0x20>)
 130:	2303      	movs	r3, #3
 132:	700b      	strb	r3, [r1, #0]
 134:	2301      	movs	r3, #1
 136:	704b      	strb	r3, [r1, #1]
 138:	230f      	movs	r3, #15
 13a:	804b      	strh	r3, [r1, #2]
 13c:	808b      	strh	r3, [r1, #4]
 13e:	2300      	movs	r3, #0
 140:	80cb      	strh	r3, [r1, #6]
 142:	4803      	ldr	r0, [pc, #12]	; (150 <bastim_ch3_init+0x24>)
 144:	f000 f983 	bl	44e <drv_bastim_init>
 148:	bd08      	pop	{r3, pc}
 14a:	bf00      	nop
 14c:	0001009c 	muleq	r1, ip, r0
 150:	40010000 	andmi	r0, r1, r0

00000154 <bastim_ch0_deinit>:
 154:	b508      	push	{r3, lr}
 156:	4902      	ldr	r1, [pc, #8]	; (160 <bastim_ch0_deinit+0xc>)
 158:	4802      	ldr	r0, [pc, #8]	; (164 <bastim_ch0_deinit+0x10>)
 15a:	f000 f9b9 	bl	4d0 <drv_bastim_deinit>
 15e:	bd08      	pop	{r3, pc}
 160:	00010084 	andeq	r0, r1, r4, lsl #1
 164:	40010000 	andmi	r0, r1, r0

00000168 <bastim_ch1_deinit>:
 168:	b508      	push	{r3, lr}
 16a:	4902      	ldr	r1, [pc, #8]	; (174 <bastim_ch1_deinit+0xc>)
 16c:	4802      	ldr	r0, [pc, #8]	; (178 <bastim_ch1_deinit+0x10>)
 16e:	f000 f9af 	bl	4d0 <drv_bastim_deinit>
 172:	bd08      	pop	{r3, pc}
 174:	0001008c 	andeq	r0, r1, ip, lsl #1
 178:	40010000 	andmi	r0, r1, r0

0000017c <bastim_ch2_deinit>:
 17c:	b508      	push	{r3, lr}
 17e:	4902      	ldr	r1, [pc, #8]	; (188 <bastim_ch2_deinit+0xc>)
 180:	4802      	ldr	r0, [pc, #8]	; (18c <bastim_ch2_deinit+0x10>)
 182:	f000 f9a5 	bl	4d0 <drv_bastim_deinit>
 186:	bd08      	pop	{r3, pc}
 188:	00010094 	muleq	r1, r4, r0
 18c:	40010000 	andmi	r0, r1, r0

00000190 <bastim_ch3_deinit>:
 190:	b508      	push	{r3, lr}
 192:	4902      	ldr	r1, [pc, #8]	; (19c <bastim_ch3_deinit+0xc>)
 194:	4802      	ldr	r0, [pc, #8]	; (1a0 <bastim_ch3_deinit+0x10>)
 196:	f000 f99b 	bl	4d0 <drv_bastim_deinit>
 19a:	bd08      	pop	{r3, pc}
 19c:	0001009c 	muleq	r1, ip, r0
 1a0:	40010000 	andmi	r0, r1, r0

000001a4 <bastim_4ch_autoreload_int_test>:
 1a4:	b508      	push	{r3, lr}
 1a6:	f7ff ff85 	bl	b4 <bastim_ch0_init>
 1aa:	f7ff ff97 	bl	dc <bastim_ch1_init>
 1ae:	f7ff ffa9 	bl	104 <bastim_ch2_init>
 1b2:	f7ff ffbb 	bl	12c <bastim_ch3_init>
 1b6:	4b48      	ldr	r3, [pc, #288]	; (2d8 <Stack_Size+0xd8>)
 1b8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 1ba:	f042 0201 	orr.w	r2, r2, #1
 1be:	641a      	str	r2, [r3, #64]	; 0x40
 1c0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 1c2:	f042 0202 	orr.w	r2, r2, #2
 1c6:	641a      	str	r2, [r3, #64]	; 0x40
 1c8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 1ca:	f042 0204 	orr.w	r2, r2, #4
 1ce:	641a      	str	r2, [r3, #64]	; 0x40
 1d0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 1d2:	f042 0208 	orr.w	r2, r2, #8
 1d6:	641a      	str	r2, [r3, #64]	; 0x40
 1d8:	4940      	ldr	r1, [pc, #256]	; (2dc <Stack_Size+0xdc>)
 1da:	2200      	movs	r2, #0
 1dc:	f881 2308 	strb.w	r2, [r1, #776]	; 0x308
 1e0:	f44f 7080 	mov.w	r0, #256	; 0x100
 1e4:	6008      	str	r0, [r1, #0]
 1e6:	f881 2309 	strb.w	r2, [r1, #777]	; 0x309
 1ea:	f44f 7000 	mov.w	r0, #512	; 0x200
 1ee:	6008      	str	r0, [r1, #0]
 1f0:	f881 230a 	strb.w	r2, [r1, #778]	; 0x30a
 1f4:	f44f 6080 	mov.w	r0, #1024	; 0x400
 1f8:	6008      	str	r0, [r1, #0]
 1fa:	f881 230b 	strb.w	r2, [r1, #779]	; 0x30b
 1fe:	f44f 6000 	mov.w	r0, #2048	; 0x800
 202:	6008      	str	r0, [r1, #0]
 204:	6819      	ldr	r1, [r3, #0]
 206:	f021 0102 	bic.w	r1, r1, #2
 20a:	6019      	str	r1, [r3, #0]
 20c:	6819      	ldr	r1, [r3, #0]
 20e:	f041 0102 	orr.w	r1, r1, #2
 212:	6019      	str	r1, [r3, #0]
 214:	6919      	ldr	r1, [r3, #16]
 216:	f021 0102 	bic.w	r1, r1, #2
 21a:	6119      	str	r1, [r3, #16]
 21c:	6919      	ldr	r1, [r3, #16]
 21e:	f041 0102 	orr.w	r1, r1, #2
 222:	6119      	str	r1, [r3, #16]
 224:	6a19      	ldr	r1, [r3, #32]
 226:	f021 0102 	bic.w	r1, r1, #2
 22a:	6219      	str	r1, [r3, #32]
 22c:	6a19      	ldr	r1, [r3, #32]
 22e:	f041 0102 	orr.w	r1, r1, #2
 232:	6219      	str	r1, [r3, #32]
 234:	6b19      	ldr	r1, [r3, #48]	; 0x30
 236:	f021 0102 	bic.w	r1, r1, #2
 23a:	6319      	str	r1, [r3, #48]	; 0x30
 23c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 23e:	f041 0102 	orr.w	r1, r1, #2
 242:	6319      	str	r1, [r3, #48]	; 0x30
 244:	4b26      	ldr	r3, [pc, #152]	; (2e0 <Stack_Size+0xe0>)
 246:	701a      	strb	r2, [r3, #0]
 248:	4b26      	ldr	r3, [pc, #152]	; (2e4 <Stack_Size+0xe4>)
 24a:	701a      	strb	r2, [r3, #0]
 24c:	4b26      	ldr	r3, [pc, #152]	; (2e8 <Stack_Size+0xe8>)
 24e:	701a      	strb	r2, [r3, #0]
 250:	4b26      	ldr	r3, [pc, #152]	; (2ec <Stack_Size+0xec>)
 252:	701a      	strb	r2, [r3, #0]
 254:	4b22      	ldr	r3, [pc, #136]	; (2e0 <Stack_Size+0xe0>)
 256:	781b      	ldrb	r3, [r3, #0]
 258:	b2db      	uxtb	r3, r3
 25a:	2b02      	cmp	r3, #2
 25c:	d9fa      	bls.n	254 <Stack_Size+0x54>
 25e:	4b21      	ldr	r3, [pc, #132]	; (2e4 <Stack_Size+0xe4>)
 260:	781b      	ldrb	r3, [r3, #0]
 262:	b2db      	uxtb	r3, r3
 264:	2b02      	cmp	r3, #2
 266:	d9f5      	bls.n	254 <Stack_Size+0x54>
 268:	4b1f      	ldr	r3, [pc, #124]	; (2e8 <Stack_Size+0xe8>)
 26a:	781b      	ldrb	r3, [r3, #0]
 26c:	b2db      	uxtb	r3, r3
 26e:	2b02      	cmp	r3, #2
 270:	d9f0      	bls.n	254 <Stack_Size+0x54>
 272:	4b1e      	ldr	r3, [pc, #120]	; (2ec <Stack_Size+0xec>)
 274:	781b      	ldrb	r3, [r3, #0]
 276:	b2db      	uxtb	r3, r3
 278:	2b02      	cmp	r3, #2
 27a:	d9eb      	bls.n	254 <Stack_Size+0x54>
 27c:	481c      	ldr	r0, [pc, #112]	; (2f0 <Stack_Size+0xf0>)
 27e:	f000 fbf7 	bl	a70 <test_printf_s>
 282:	4b16      	ldr	r3, [pc, #88]	; (2dc <Stack_Size+0xdc>)
 284:	f44f 7280 	mov.w	r2, #256	; 0x100
 288:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 28c:	f3bf 8f4f 	dsb	sy
 290:	f3bf 8f6f 	isb	sy
 294:	f44f 7200 	mov.w	r2, #512	; 0x200
 298:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 29c:	f3bf 8f4f 	dsb	sy
 2a0:	f3bf 8f6f 	isb	sy
 2a4:	f44f 6280 	mov.w	r2, #1024	; 0x400
 2a8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 2ac:	f3bf 8f4f 	dsb	sy
 2b0:	f3bf 8f6f 	isb	sy
 2b4:	f44f 6200 	mov.w	r2, #2048	; 0x800
 2b8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 2bc:	f3bf 8f4f 	dsb	sy
 2c0:	f3bf 8f6f 	isb	sy
 2c4:	f7ff ff46 	bl	154 <bastim_ch0_deinit>
 2c8:	f7ff ff4e 	bl	168 <bastim_ch1_deinit>
 2cc:	f7ff ff56 	bl	17c <bastim_ch2_deinit>
 2d0:	f7ff ff5e 	bl	190 <bastim_ch3_deinit>
 2d4:	bd08      	pop	{r3, pc}
 2d6:	bf00      	nop
 2d8:	40010000 	andmi	r0, r1, r0
 2dc:	e000e100 	and	lr, r0, r0, lsl #2
 2e0:	000100a4 	andeq	r0, r1, r4, lsr #1
 2e4:	000100a5 	andeq	r0, r1, r5, lsr #1
 2e8:	000100a6 	andeq	r0, r1, r6, lsr #1
 2ec:	000100a7 	andeq	r0, r1, r7, lsr #1
 2f0:	00000ab8 			; <UNDEFINED> instruction: 0x00000ab8

000002f4 <bastim_channel0_int_callback>:
 2f4:	4a02      	ldr	r2, [pc, #8]	; (300 <bastim_channel0_int_callback+0xc>)
 2f6:	7813      	ldrb	r3, [r2, #0]
 2f8:	3301      	adds	r3, #1
 2fa:	b2db      	uxtb	r3, r3
 2fc:	7013      	strb	r3, [r2, #0]
 2fe:	4770      	bx	lr
 300:	000100a4 	andeq	r0, r1, r4, lsr #1

00000304 <bastim_channel1_int_callback>:
 304:	4a02      	ldr	r2, [pc, #8]	; (310 <bastim_channel1_int_callback+0xc>)
 306:	7813      	ldrb	r3, [r2, #0]
 308:	3301      	adds	r3, #1
 30a:	b2db      	uxtb	r3, r3
 30c:	7013      	strb	r3, [r2, #0]
 30e:	4770      	bx	lr
 310:	000100a5 	andeq	r0, r1, r5, lsr #1

00000314 <bastim_channel2_int_callback>:
 314:	4a02      	ldr	r2, [pc, #8]	; (320 <bastim_channel2_int_callback+0xc>)
 316:	7813      	ldrb	r3, [r2, #0]
 318:	3301      	adds	r3, #1
 31a:	b2db      	uxtb	r3, r3
 31c:	7013      	strb	r3, [r2, #0]
 31e:	4770      	bx	lr
 320:	000100a6 	andeq	r0, r1, r6, lsr #1

00000324 <bastim_channel3_int_callback>:
 324:	4a02      	ldr	r2, [pc, #8]	; (330 <bastim_channel3_int_callback+0xc>)
 326:	7813      	ldrb	r3, [r2, #0]
 328:	3301      	adds	r3, #1
 32a:	b2db      	uxtb	r3, r3
 32c:	7013      	strb	r3, [r2, #0]
 32e:	4770      	bx	lr
 330:	000100a7 	andeq	r0, r1, r7, lsr #1

00000334 <drv_bastim_set_config>:
 334:	b570      	push	{r4, r5, r6, lr}
 336:	4606      	mov	r6, r0
 338:	460d      	mov	r5, r1
 33a:	780b      	ldrb	r3, [r1, #0]
 33c:	2b03      	cmp	r3, #3
 33e:	d86d      	bhi.n	41c <drv_bastim_set_config+0xe8>
 340:	e8df f003 	tbb	[pc, r3]
 344:	51361b02 	teqpl	r6, r2, lsl #22
 348:	7849      	ldrb	r1, [r1, #1]
 34a:	0089      	lsls	r1, r1, #2
 34c:	460a      	mov	r2, r1
 34e:	f000 f92f 	bl	5b0 <drv_check_rw_data>
 352:	4604      	mov	r4, r0
 354:	88aa      	ldrh	r2, [r5, #4]
 356:	8869      	ldrh	r1, [r5, #2]
 358:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 35c:	460a      	mov	r2, r1
 35e:	1d30      	adds	r0, r6, #4
 360:	f000 f926 	bl	5b0 <drv_check_rw_data>
 364:	4304      	orrs	r4, r0
 366:	b2e4      	uxtb	r4, r4
 368:	88e9      	ldrh	r1, [r5, #6]
 36a:	460a      	mov	r2, r1
 36c:	f106 0008 	add.w	r0, r6, #8
 370:	f000 f91e 	bl	5b0 <drv_check_rw_data>
 374:	4320      	orrs	r0, r4
 376:	b2c0      	uxtb	r0, r0
 378:	bd70      	pop	{r4, r5, r6, pc}
 37a:	7849      	ldrb	r1, [r1, #1]
 37c:	0089      	lsls	r1, r1, #2
 37e:	460a      	mov	r2, r1
 380:	3010      	adds	r0, #16
 382:	f000 f915 	bl	5b0 <drv_check_rw_data>
 386:	4604      	mov	r4, r0
 388:	88aa      	ldrh	r2, [r5, #4]
 38a:	8869      	ldrh	r1, [r5, #2]
 38c:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 390:	460a      	mov	r2, r1
 392:	f106 0014 	add.w	r0, r6, #20
 396:	f000 f90b 	bl	5b0 <drv_check_rw_data>
 39a:	4304      	orrs	r4, r0
 39c:	b2e4      	uxtb	r4, r4
 39e:	88e9      	ldrh	r1, [r5, #6]
 3a0:	460a      	mov	r2, r1
 3a2:	f106 0018 	add.w	r0, r6, #24
 3a6:	f000 f903 	bl	5b0 <drv_check_rw_data>
 3aa:	4320      	orrs	r0, r4
 3ac:	b2c0      	uxtb	r0, r0
 3ae:	e7e3      	b.n	378 <drv_bastim_set_config+0x44>
 3b0:	7849      	ldrb	r1, [r1, #1]
 3b2:	0089      	lsls	r1, r1, #2
 3b4:	460a      	mov	r2, r1
 3b6:	3020      	adds	r0, #32
 3b8:	f000 f8fa 	bl	5b0 <drv_check_rw_data>
 3bc:	4604      	mov	r4, r0
 3be:	88aa      	ldrh	r2, [r5, #4]
 3c0:	8869      	ldrh	r1, [r5, #2]
 3c2:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 3c6:	460a      	mov	r2, r1
 3c8:	f106 0024 	add.w	r0, r6, #36	; 0x24
 3cc:	f000 f8f0 	bl	5b0 <drv_check_rw_data>
 3d0:	4304      	orrs	r4, r0
 3d2:	b2e4      	uxtb	r4, r4
 3d4:	88e9      	ldrh	r1, [r5, #6]
 3d6:	460a      	mov	r2, r1
 3d8:	f106 0028 	add.w	r0, r6, #40	; 0x28
 3dc:	f000 f8e8 	bl	5b0 <drv_check_rw_data>
 3e0:	4320      	orrs	r0, r4
 3e2:	b2c0      	uxtb	r0, r0
 3e4:	e7c8      	b.n	378 <drv_bastim_set_config+0x44>
 3e6:	7849      	ldrb	r1, [r1, #1]
 3e8:	0089      	lsls	r1, r1, #2
 3ea:	460a      	mov	r2, r1
 3ec:	3030      	adds	r0, #48	; 0x30
 3ee:	f000 f8df 	bl	5b0 <drv_check_rw_data>
 3f2:	4604      	mov	r4, r0
 3f4:	88aa      	ldrh	r2, [r5, #4]
 3f6:	8869      	ldrh	r1, [r5, #2]
 3f8:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 3fc:	460a      	mov	r2, r1
 3fe:	f106 0034 	add.w	r0, r6, #52	; 0x34
 402:	f000 f8d5 	bl	5b0 <drv_check_rw_data>
 406:	4304      	orrs	r4, r0
 408:	b2e4      	uxtb	r4, r4
 40a:	88e9      	ldrh	r1, [r5, #6]
 40c:	460a      	mov	r2, r1
 40e:	f106 0038 	add.w	r0, r6, #56	; 0x38
 412:	f000 f8cd 	bl	5b0 <drv_check_rw_data>
 416:	4320      	orrs	r0, r4
 418:	b2c0      	uxtb	r0, r0
 41a:	e7ad      	b.n	378 <drv_bastim_set_config+0x44>
 41c:	7849      	ldrb	r1, [r1, #1]
 41e:	0089      	lsls	r1, r1, #2
 420:	460a      	mov	r2, r1
 422:	f000 f8c5 	bl	5b0 <drv_check_rw_data>
 426:	4604      	mov	r4, r0
 428:	88ab      	ldrh	r3, [r5, #4]
 42a:	8869      	ldrh	r1, [r5, #2]
 42c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
 430:	460a      	mov	r2, r1
 432:	1d30      	adds	r0, r6, #4
 434:	f000 f8bc 	bl	5b0 <drv_check_rw_data>
 438:	4304      	orrs	r4, r0
 43a:	b2e4      	uxtb	r4, r4
 43c:	88e9      	ldrh	r1, [r5, #6]
 43e:	460a      	mov	r2, r1
 440:	f106 0008 	add.w	r0, r6, #8
 444:	f000 f8b4 	bl	5b0 <drv_check_rw_data>
 448:	4320      	orrs	r0, r4
 44a:	b2c0      	uxtb	r0, r0
 44c:	e794      	b.n	378 <drv_bastim_set_config+0x44>

0000044e <drv_bastim_init>:
 44e:	b538      	push	{r3, r4, r5, lr}
 450:	4604      	mov	r4, r0
 452:	460d      	mov	r5, r1
 454:	f7ff ff6e 	bl	334 <drv_bastim_set_config>
 458:	782b      	ldrb	r3, [r5, #0]
 45a:	2b03      	cmp	r3, #3
 45c:	d82f      	bhi.n	4be <drv_bastim_init+0x70>
 45e:	e8df f003 	tbb	[pc, r3]
 462:	251c1302 	ldrcs	r1, [ip, #-770]	; 0xfffffcfe
 466:	6823      	ldr	r3, [r4, #0]
 468:	f043 0301 	orr.w	r3, r3, #1
 46c:	6023      	str	r3, [r4, #0]
 46e:	6823      	ldr	r3, [r4, #0]
 470:	f023 0301 	bic.w	r3, r3, #1
 474:	6023      	str	r3, [r4, #0]
 476:	7829      	ldrb	r1, [r5, #0]
 478:	6c63      	ldr	r3, [r4, #68]	; 0x44
 47a:	2201      	movs	r2, #1
 47c:	408a      	lsls	r2, r1
 47e:	4313      	orrs	r3, r2
 480:	6463      	str	r3, [r4, #68]	; 0x44
 482:	2300      	movs	r3, #0
 484:	6463      	str	r3, [r4, #68]	; 0x44
 486:	bd38      	pop	{r3, r4, r5, pc}
 488:	6923      	ldr	r3, [r4, #16]
 48a:	f043 0301 	orr.w	r3, r3, #1
 48e:	6123      	str	r3, [r4, #16]
 490:	6923      	ldr	r3, [r4, #16]
 492:	f023 0301 	bic.w	r3, r3, #1
 496:	6123      	str	r3, [r4, #16]
 498:	e7ed      	b.n	476 <drv_bastim_init+0x28>
 49a:	6a23      	ldr	r3, [r4, #32]
 49c:	f043 0301 	orr.w	r3, r3, #1
 4a0:	6223      	str	r3, [r4, #32]
 4a2:	6a23      	ldr	r3, [r4, #32]
 4a4:	f023 0301 	bic.w	r3, r3, #1
 4a8:	6223      	str	r3, [r4, #32]
 4aa:	e7e4      	b.n	476 <drv_bastim_init+0x28>
 4ac:	6b23      	ldr	r3, [r4, #48]	; 0x30
 4ae:	f043 0301 	orr.w	r3, r3, #1
 4b2:	6323      	str	r3, [r4, #48]	; 0x30
 4b4:	6b23      	ldr	r3, [r4, #48]	; 0x30
 4b6:	f023 0301 	bic.w	r3, r3, #1
 4ba:	6323      	str	r3, [r4, #48]	; 0x30
 4bc:	e7db      	b.n	476 <drv_bastim_init+0x28>
 4be:	6823      	ldr	r3, [r4, #0]
 4c0:	f043 0301 	orr.w	r3, r3, #1
 4c4:	6023      	str	r3, [r4, #0]
 4c6:	6823      	ldr	r3, [r4, #0]
 4c8:	f023 0301 	bic.w	r3, r3, #1
 4cc:	6023      	str	r3, [r4, #0]
 4ce:	e7d2      	b.n	476 <drv_bastim_init+0x28>

000004d0 <drv_bastim_deinit>:
 4d0:	780b      	ldrb	r3, [r1, #0]
 4d2:	2b03      	cmp	r3, #3
 4d4:	d81f      	bhi.n	516 <drv_bastim_deinit+0x46>
 4d6:	e8df f003 	tbb	[pc, r3]
 4da:	19140f02 	ldmdbne	r4, {r1, r8, r9, sl, fp}
 4de:	6803      	ldr	r3, [r0, #0]
 4e0:	f023 0302 	bic.w	r3, r3, #2
 4e4:	6003      	str	r3, [r0, #0]
 4e6:	7809      	ldrb	r1, [r1, #0]
 4e8:	6c43      	ldr	r3, [r0, #68]	; 0x44
 4ea:	2201      	movs	r2, #1
 4ec:	408a      	lsls	r2, r1
 4ee:	4313      	orrs	r3, r2
 4f0:	6443      	str	r3, [r0, #68]	; 0x44
 4f2:	2300      	movs	r3, #0
 4f4:	6443      	str	r3, [r0, #68]	; 0x44
 4f6:	4770      	bx	lr
 4f8:	6903      	ldr	r3, [r0, #16]
 4fa:	f023 0302 	bic.w	r3, r3, #2
 4fe:	6103      	str	r3, [r0, #16]
 500:	e7f1      	b.n	4e6 <drv_bastim_deinit+0x16>
 502:	6a03      	ldr	r3, [r0, #32]
 504:	f023 0302 	bic.w	r3, r3, #2
 508:	6203      	str	r3, [r0, #32]
 50a:	e7ec      	b.n	4e6 <drv_bastim_deinit+0x16>
 50c:	6b03      	ldr	r3, [r0, #48]	; 0x30
 50e:	f023 0302 	bic.w	r3, r3, #2
 512:	6303      	str	r3, [r0, #48]	; 0x30
 514:	e7e7      	b.n	4e6 <drv_bastim_deinit+0x16>
 516:	6803      	ldr	r3, [r0, #0]
 518:	f023 0302 	bic.w	r3, r3, #2
 51c:	6003      	str	r3, [r0, #0]
 51e:	e7e2      	b.n	4e6 <drv_bastim_deinit+0x16>

00000520 <drv_bastim_channel0_interrupt_handler>:
 520:	6c83      	ldr	r3, [r0, #72]	; 0x48
 522:	6c02      	ldr	r2, [r0, #64]	; 0x40
 524:	4013      	ands	r3, r2
 526:	f013 0f01 	tst.w	r3, #1
 52a:	d100      	bne.n	52e <drv_bastim_channel0_interrupt_handler+0xe>
 52c:	4770      	bx	lr
 52e:	b510      	push	{r4, lr}
 530:	4604      	mov	r4, r0
 532:	f7ff fedf 	bl	2f4 <bastim_channel0_int_callback>
 536:	6c63      	ldr	r3, [r4, #68]	; 0x44
 538:	f043 0301 	orr.w	r3, r3, #1
 53c:	6463      	str	r3, [r4, #68]	; 0x44
 53e:	2300      	movs	r3, #0
 540:	6463      	str	r3, [r4, #68]	; 0x44
 542:	bd10      	pop	{r4, pc}

00000544 <drv_bastim_channel1_interrupt_handler>:
 544:	6c83      	ldr	r3, [r0, #72]	; 0x48
 546:	6c02      	ldr	r2, [r0, #64]	; 0x40
 548:	4013      	ands	r3, r2
 54a:	f013 0f02 	tst.w	r3, #2
 54e:	d100      	bne.n	552 <drv_bastim_channel1_interrupt_handler+0xe>
 550:	4770      	bx	lr
 552:	b510      	push	{r4, lr}
 554:	4604      	mov	r4, r0
 556:	f7ff fed5 	bl	304 <bastim_channel1_int_callback>
 55a:	6c63      	ldr	r3, [r4, #68]	; 0x44
 55c:	f043 0302 	orr.w	r3, r3, #2
 560:	6463      	str	r3, [r4, #68]	; 0x44
 562:	2300      	movs	r3, #0
 564:	6463      	str	r3, [r4, #68]	; 0x44
 566:	bd10      	pop	{r4, pc}

00000568 <drv_bastim_channel2_interrupt_handler>:
 568:	6c83      	ldr	r3, [r0, #72]	; 0x48
 56a:	6c02      	ldr	r2, [r0, #64]	; 0x40
 56c:	4013      	ands	r3, r2
 56e:	f013 0f04 	tst.w	r3, #4
 572:	d100      	bne.n	576 <drv_bastim_channel2_interrupt_handler+0xe>
 574:	4770      	bx	lr
 576:	b510      	push	{r4, lr}
 578:	4604      	mov	r4, r0
 57a:	f7ff fecb 	bl	314 <bastim_channel2_int_callback>
 57e:	6c63      	ldr	r3, [r4, #68]	; 0x44
 580:	f043 0304 	orr.w	r3, r3, #4
 584:	6463      	str	r3, [r4, #68]	; 0x44
 586:	2300      	movs	r3, #0
 588:	6463      	str	r3, [r4, #68]	; 0x44
 58a:	bd10      	pop	{r4, pc}

0000058c <drv_bastim_channel3_interrupt_handler>:
 58c:	6c83      	ldr	r3, [r0, #72]	; 0x48
 58e:	6c02      	ldr	r2, [r0, #64]	; 0x40
 590:	4013      	ands	r3, r2
 592:	f013 0f08 	tst.w	r3, #8
 596:	d100      	bne.n	59a <drv_bastim_channel3_interrupt_handler+0xe>
 598:	4770      	bx	lr
 59a:	b510      	push	{r4, lr}
 59c:	4604      	mov	r4, r0
 59e:	f7ff fec1 	bl	324 <bastim_channel3_int_callback>
 5a2:	6c63      	ldr	r3, [r4, #68]	; 0x44
 5a4:	f043 0308 	orr.w	r3, r3, #8
 5a8:	6463      	str	r3, [r4, #68]	; 0x44
 5aa:	2300      	movs	r3, #0
 5ac:	6463      	str	r3, [r4, #68]	; 0x44
 5ae:	bd10      	pop	{r4, pc}

000005b0 <drv_check_rw_data>:
 5b0:	6001      	str	r1, [r0, #0]
 5b2:	6803      	ldr	r3, [r0, #0]
 5b4:	4293      	cmp	r3, r2
 5b6:	d007      	beq.n	5c8 <drv_check_rw_data+0x18>
 5b8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 5bc:	2001      	movs	r0, #1
 5be:	6018      	str	r0, [r3, #0]
 5c0:	685a      	ldr	r2, [r3, #4]
 5c2:	4402      	add	r2, r0
 5c4:	601a      	str	r2, [r3, #0]
 5c6:	4770      	bx	lr
 5c8:	2000      	movs	r0, #0
 5ca:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 5ce:	6018      	str	r0, [r3, #0]
 5d0:	4770      	bx	lr

000005d2 <drv_uart_default_config>:
 5d2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 5d6:	6043      	str	r3, [r0, #4]
 5d8:	230f      	movs	r3, #15
 5da:	7203      	strb	r3, [r0, #8]
 5dc:	2300      	movs	r3, #0
 5de:	7243      	strb	r3, [r0, #9]
 5e0:	7283      	strb	r3, [r0, #10]
 5e2:	72c3      	strb	r3, [r0, #11]
 5e4:	7303      	strb	r3, [r0, #12]
 5e6:	7343      	strb	r3, [r0, #13]
 5e8:	2301      	movs	r3, #1
 5ea:	7383      	strb	r3, [r0, #14]
 5ec:	4770      	bx	lr
	...

000005f0 <drv_uart_set_config>:
 5f0:	b508      	push	{r3, lr}
 5f2:	6841      	ldr	r1, [r0, #4]
 5f4:	7a03      	ldrb	r3, [r0, #8]
 5f6:	fb03 f201 	mul.w	r2, r3, r1
 5fa:	490e      	ldr	r1, [pc, #56]	; (634 <drv_uart_set_config+0x44>)
 5fc:	fbb1 f2f2 	udiv	r2, r1, r2
 600:	0419      	lsls	r1, r3, #16
 602:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 606:	7a43      	ldrb	r3, [r0, #9]
 608:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 60c:	7a83      	ldrb	r3, [r0, #10]
 60e:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 612:	7ac3      	ldrb	r3, [r0, #11]
 614:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 618:	7b03      	ldrb	r3, [r0, #12]
 61a:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 61e:	7b42      	ldrb	r2, [r0, #13]
 620:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 624:	7b82      	ldrb	r2, [r0, #14]
 626:	4311      	orrs	r1, r2
 628:	6800      	ldr	r0, [r0, #0]
 62a:	460a      	mov	r2, r1
 62c:	3008      	adds	r0, #8
 62e:	f7ff ffbf 	bl	5b0 <drv_check_rw_data>
 632:	bd08      	pop	{r3, pc}
 634:	02625a00 	rsbeq	r5, r2, #0, 20

00000638 <drv_uart_init>:
 638:	b538      	push	{r3, r4, r5, lr}
 63a:	4604      	mov	r4, r0
 63c:	2500      	movs	r5, #0
 63e:	7485      	strb	r5, [r0, #18]
 640:	74c5      	strb	r5, [r0, #19]
 642:	f7ff ffd5 	bl	5f0 <drv_uart_set_config>
 646:	7425      	strb	r5, [r4, #16]
 648:	74a5      	strb	r5, [r4, #18]
 64a:	74e5      	strb	r5, [r4, #19]
 64c:	6822      	ldr	r2, [r4, #0]
 64e:	6853      	ldr	r3, [r2, #4]
 650:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 654:	6053      	str	r3, [r2, #4]
 656:	6822      	ldr	r2, [r4, #0]
 658:	6853      	ldr	r3, [r2, #4]
 65a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 65e:	6053      	str	r3, [r2, #4]
 660:	6822      	ldr	r2, [r4, #0]
 662:	6853      	ldr	r3, [r2, #4]
 664:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 668:	6053      	str	r3, [r2, #4]
 66a:	6822      	ldr	r2, [r4, #0]
 66c:	6853      	ldr	r3, [r2, #4]
 66e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 672:	6053      	str	r3, [r2, #4]
 674:	6822      	ldr	r2, [r4, #0]
 676:	6853      	ldr	r3, [r2, #4]
 678:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 67c:	6053      	str	r3, [r2, #4]
 67e:	6822      	ldr	r2, [r4, #0]
 680:	6853      	ldr	r3, [r2, #4]
 682:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 686:	6053      	str	r3, [r2, #4]
 688:	6822      	ldr	r2, [r4, #0]
 68a:	6853      	ldr	r3, [r2, #4]
 68c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 690:	6053      	str	r3, [r2, #4]
 692:	6822      	ldr	r2, [r4, #0]
 694:	6853      	ldr	r3, [r2, #4]
 696:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 69a:	6053      	str	r3, [r2, #4]
 69c:	6823      	ldr	r3, [r4, #0]
 69e:	f240 12ff 	movw	r2, #511	; 0x1ff
 6a2:	611a      	str	r2, [r3, #16]
 6a4:	6823      	ldr	r3, [r4, #0]
 6a6:	611d      	str	r5, [r3, #16]
 6a8:	6822      	ldr	r2, [r4, #0]
 6aa:	6853      	ldr	r3, [r2, #4]
 6ac:	f043 0301 	orr.w	r3, r3, #1
 6b0:	6053      	str	r3, [r2, #4]
 6b2:	6822      	ldr	r2, [r4, #0]
 6b4:	6853      	ldr	r3, [r2, #4]
 6b6:	f023 0301 	bic.w	r3, r3, #1
 6ba:	6053      	str	r3, [r2, #4]
 6bc:	6822      	ldr	r2, [r4, #0]
 6be:	6853      	ldr	r3, [r2, #4]
 6c0:	f043 0302 	orr.w	r3, r3, #2
 6c4:	6053      	str	r3, [r2, #4]
 6c6:	bd38      	pop	{r3, r4, r5, pc}

000006c8 <uart_int_tx_done_callback>:
 6c8:	4770      	bx	lr

000006ca <uart_int_rx_stop_callback>:
 6ca:	4770      	bx	lr

000006cc <uart_int_rx_parity_error_callback>:
 6cc:	4770      	bx	lr

000006ce <uart_int_rx_noise_detect_callback>:
 6ce:	4770      	bx	lr

000006d0 <uart_int_rx_stop_detect_callback>:
 6d0:	4770      	bx	lr

000006d2 <uart_int_tx_fifo_empty_callback>:
 6d2:	4770      	bx	lr

000006d4 <uart_int_tx_fifo_thres_callback>:
 6d4:	4770      	bx	lr

000006d6 <uart_int_rx_fifo_noempty_callback>:
 6d6:	4770      	bx	lr

000006d8 <uart_int_rx_fifo_thres_callback>:
 6d8:	4770      	bx	lr

000006da <drv_uart_interrupt_handler>:
 6da:	b538      	push	{r3, r4, r5, lr}
 6dc:	4604      	mov	r4, r0
 6de:	6803      	ldr	r3, [r0, #0]
 6e0:	699d      	ldr	r5, [r3, #24]
 6e2:	68db      	ldr	r3, [r3, #12]
 6e4:	b29b      	uxth	r3, r3
 6e6:	401d      	ands	r5, r3
 6e8:	f415 7f80 	tst.w	r5, #256	; 0x100
 6ec:	d144      	bne.n	778 <drv_uart_interrupt_handler+0x9e>
 6ee:	f015 0f40 	tst.w	r5, #64	; 0x40
 6f2:	d00f      	beq.n	714 <drv_uart_interrupt_handler+0x3a>
 6f4:	2301      	movs	r3, #1
 6f6:	7423      	strb	r3, [r4, #16]
 6f8:	7aa3      	ldrb	r3, [r4, #10]
 6fa:	2b01      	cmp	r3, #1
 6fc:	d147      	bne.n	78e <drv_uart_interrupt_handler+0xb4>
 6fe:	4620      	mov	r0, r4
 700:	f7ff ffe3 	bl	6ca <uart_int_rx_stop_callback>
 704:	6822      	ldr	r2, [r4, #0]
 706:	6913      	ldr	r3, [r2, #16]
 708:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 70c:	6113      	str	r3, [r2, #16]
 70e:	6823      	ldr	r3, [r4, #0]
 710:	2200      	movs	r2, #0
 712:	611a      	str	r2, [r3, #16]
 714:	f015 0f80 	tst.w	r5, #128	; 0x80
 718:	d00f      	beq.n	73a <drv_uart_interrupt_handler+0x60>
 71a:	2302      	movs	r3, #2
 71c:	7423      	strb	r3, [r4, #16]
 71e:	7aa3      	ldrb	r3, [r4, #10]
 720:	2b01      	cmp	r3, #1
 722:	d166      	bne.n	7f2 <drv_uart_interrupt_handler+0x118>
 724:	4620      	mov	r0, r4
 726:	f7ff ffd1 	bl	6cc <uart_int_rx_parity_error_callback>
 72a:	6822      	ldr	r2, [r4, #0]
 72c:	6913      	ldr	r3, [r2, #16]
 72e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 732:	6113      	str	r3, [r2, #16]
 734:	6823      	ldr	r3, [r4, #0]
 736:	2200      	movs	r2, #0
 738:	611a      	str	r2, [r3, #16]
 73a:	f015 0f20 	tst.w	r5, #32
 73e:	f040 808a 	bne.w	856 <drv_uart_interrupt_handler+0x17c>
 742:	f015 0f10 	tst.w	r5, #16
 746:	f040 8092 	bne.w	86e <drv_uart_interrupt_handler+0x194>
 74a:	f015 0f01 	tst.w	r5, #1
 74e:	f040 809a 	bne.w	886 <drv_uart_interrupt_handler+0x1ac>
 752:	f015 0f02 	tst.w	r5, #2
 756:	f040 80a2 	bne.w	89e <drv_uart_interrupt_handler+0x1c4>
 75a:	f015 0f04 	tst.w	r5, #4
 75e:	f000 80c1 	beq.w	8e4 <drv_uart_interrupt_handler+0x20a>
 762:	7ce2      	ldrb	r2, [r4, #19]
 764:	7e23      	ldrb	r3, [r4, #24]
 766:	429a      	cmp	r2, r3
 768:	f0c0 80ac 	bcc.w	8c4 <drv_uart_interrupt_handler+0x1ea>
 76c:	6822      	ldr	r2, [r4, #0]
 76e:	68d3      	ldr	r3, [r2, #12]
 770:	f023 030c 	bic.w	r3, r3, #12
 774:	60d3      	str	r3, [r2, #12]
 776:	e0aa      	b.n	8ce <drv_uart_interrupt_handler+0x1f4>
 778:	f7ff ffa6 	bl	6c8 <uart_int_tx_done_callback>
 77c:	6822      	ldr	r2, [r4, #0]
 77e:	6913      	ldr	r3, [r2, #16]
 780:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 784:	6113      	str	r3, [r2, #16]
 786:	6823      	ldr	r3, [r4, #0]
 788:	2200      	movs	r2, #0
 78a:	611a      	str	r2, [r3, #16]
 78c:	e7af      	b.n	6ee <drv_uart_interrupt_handler+0x14>
 78e:	6822      	ldr	r2, [r4, #0]
 790:	68d3      	ldr	r3, [r2, #12]
 792:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 796:	60d3      	str	r3, [r2, #12]
 798:	2300      	movs	r3, #0
 79a:	7423      	strb	r3, [r4, #16]
 79c:	74a3      	strb	r3, [r4, #18]
 79e:	74e3      	strb	r3, [r4, #19]
 7a0:	6822      	ldr	r2, [r4, #0]
 7a2:	6853      	ldr	r3, [r2, #4]
 7a4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 7a8:	6053      	str	r3, [r2, #4]
 7aa:	6822      	ldr	r2, [r4, #0]
 7ac:	6853      	ldr	r3, [r2, #4]
 7ae:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 7b2:	6053      	str	r3, [r2, #4]
 7b4:	6822      	ldr	r2, [r4, #0]
 7b6:	6853      	ldr	r3, [r2, #4]
 7b8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 7bc:	6053      	str	r3, [r2, #4]
 7be:	6822      	ldr	r2, [r4, #0]
 7c0:	6853      	ldr	r3, [r2, #4]
 7c2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 7c6:	6053      	str	r3, [r2, #4]
 7c8:	6822      	ldr	r2, [r4, #0]
 7ca:	6853      	ldr	r3, [r2, #4]
 7cc:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 7d0:	6053      	str	r3, [r2, #4]
 7d2:	6822      	ldr	r2, [r4, #0]
 7d4:	6853      	ldr	r3, [r2, #4]
 7d6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 7da:	6053      	str	r3, [r2, #4]
 7dc:	6822      	ldr	r2, [r4, #0]
 7de:	6853      	ldr	r3, [r2, #4]
 7e0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 7e4:	6053      	str	r3, [r2, #4]
 7e6:	6822      	ldr	r2, [r4, #0]
 7e8:	6853      	ldr	r3, [r2, #4]
 7ea:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 7ee:	6053      	str	r3, [r2, #4]
 7f0:	e785      	b.n	6fe <drv_uart_interrupt_handler+0x24>
 7f2:	6822      	ldr	r2, [r4, #0]
 7f4:	68d3      	ldr	r3, [r2, #12]
 7f6:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 7fa:	60d3      	str	r3, [r2, #12]
 7fc:	2300      	movs	r3, #0
 7fe:	7423      	strb	r3, [r4, #16]
 800:	74a3      	strb	r3, [r4, #18]
 802:	74e3      	strb	r3, [r4, #19]
 804:	6822      	ldr	r2, [r4, #0]
 806:	6853      	ldr	r3, [r2, #4]
 808:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 80c:	6053      	str	r3, [r2, #4]
 80e:	6822      	ldr	r2, [r4, #0]
 810:	6853      	ldr	r3, [r2, #4]
 812:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 816:	6053      	str	r3, [r2, #4]
 818:	6822      	ldr	r2, [r4, #0]
 81a:	6853      	ldr	r3, [r2, #4]
 81c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 820:	6053      	str	r3, [r2, #4]
 822:	6822      	ldr	r2, [r4, #0]
 824:	6853      	ldr	r3, [r2, #4]
 826:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 82a:	6053      	str	r3, [r2, #4]
 82c:	6822      	ldr	r2, [r4, #0]
 82e:	6853      	ldr	r3, [r2, #4]
 830:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 834:	6053      	str	r3, [r2, #4]
 836:	6822      	ldr	r2, [r4, #0]
 838:	6853      	ldr	r3, [r2, #4]
 83a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 83e:	6053      	str	r3, [r2, #4]
 840:	6822      	ldr	r2, [r4, #0]
 842:	6853      	ldr	r3, [r2, #4]
 844:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 848:	6053      	str	r3, [r2, #4]
 84a:	6822      	ldr	r2, [r4, #0]
 84c:	6853      	ldr	r3, [r2, #4]
 84e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 852:	6053      	str	r3, [r2, #4]
 854:	e766      	b.n	724 <drv_uart_interrupt_handler+0x4a>
 856:	4620      	mov	r0, r4
 858:	f7ff ff39 	bl	6ce <uart_int_rx_noise_detect_callback>
 85c:	6822      	ldr	r2, [r4, #0]
 85e:	6913      	ldr	r3, [r2, #16]
 860:	f043 0320 	orr.w	r3, r3, #32
 864:	6113      	str	r3, [r2, #16]
 866:	6823      	ldr	r3, [r4, #0]
 868:	2200      	movs	r2, #0
 86a:	611a      	str	r2, [r3, #16]
 86c:	e769      	b.n	742 <drv_uart_interrupt_handler+0x68>
 86e:	4620      	mov	r0, r4
 870:	f7ff ff2e 	bl	6d0 <uart_int_rx_stop_detect_callback>
 874:	6822      	ldr	r2, [r4, #0]
 876:	6913      	ldr	r3, [r2, #16]
 878:	f043 0310 	orr.w	r3, r3, #16
 87c:	6113      	str	r3, [r2, #16]
 87e:	6823      	ldr	r3, [r4, #0]
 880:	2200      	movs	r2, #0
 882:	611a      	str	r2, [r3, #16]
 884:	e761      	b.n	74a <drv_uart_interrupt_handler+0x70>
 886:	4620      	mov	r0, r4
 888:	f7ff ff24 	bl	6d4 <uart_int_tx_fifo_thres_callback>
 88c:	6822      	ldr	r2, [r4, #0]
 88e:	6913      	ldr	r3, [r2, #16]
 890:	f043 0301 	orr.w	r3, r3, #1
 894:	6113      	str	r3, [r2, #16]
 896:	6823      	ldr	r3, [r4, #0]
 898:	2200      	movs	r2, #0
 89a:	611a      	str	r2, [r3, #16]
 89c:	e759      	b.n	752 <drv_uart_interrupt_handler+0x78>
 89e:	4620      	mov	r0, r4
 8a0:	f7ff ff17 	bl	6d2 <uart_int_tx_fifo_empty_callback>
 8a4:	6822      	ldr	r2, [r4, #0]
 8a6:	6913      	ldr	r3, [r2, #16]
 8a8:	f043 0302 	orr.w	r3, r3, #2
 8ac:	6113      	str	r3, [r2, #16]
 8ae:	6823      	ldr	r3, [r4, #0]
 8b0:	2200      	movs	r2, #0
 8b2:	611a      	str	r2, [r3, #16]
 8b4:	e751      	b.n	75a <drv_uart_interrupt_handler+0x80>
 8b6:	69d9      	ldr	r1, [r3, #28]
 8b8:	6962      	ldr	r2, [r4, #20]
 8ba:	7ce3      	ldrb	r3, [r4, #19]
 8bc:	1c58      	adds	r0, r3, #1
 8be:	74e0      	strb	r0, [r4, #19]
 8c0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8c4:	6823      	ldr	r3, [r4, #0]
 8c6:	695a      	ldr	r2, [r3, #20]
 8c8:	f012 0f1f 	tst.w	r2, #31
 8cc:	d1f3      	bne.n	8b6 <drv_uart_interrupt_handler+0x1dc>
 8ce:	4620      	mov	r0, r4
 8d0:	f7ff ff02 	bl	6d8 <uart_int_rx_fifo_thres_callback>
 8d4:	6822      	ldr	r2, [r4, #0]
 8d6:	6913      	ldr	r3, [r2, #16]
 8d8:	f043 0304 	orr.w	r3, r3, #4
 8dc:	6113      	str	r3, [r2, #16]
 8de:	6823      	ldr	r3, [r4, #0]
 8e0:	2200      	movs	r2, #0
 8e2:	611a      	str	r2, [r3, #16]
 8e4:	f015 0f08 	tst.w	r5, #8
 8e8:	d020      	beq.n	92c <drv_uart_interrupt_handler+0x252>
 8ea:	7ce2      	ldrb	r2, [r4, #19]
 8ec:	7e23      	ldrb	r3, [r4, #24]
 8ee:	429a      	cmp	r2, r3
 8f0:	d30c      	bcc.n	90c <drv_uart_interrupt_handler+0x232>
 8f2:	6822      	ldr	r2, [r4, #0]
 8f4:	68d3      	ldr	r3, [r2, #12]
 8f6:	f023 030c 	bic.w	r3, r3, #12
 8fa:	60d3      	str	r3, [r2, #12]
 8fc:	e00b      	b.n	916 <drv_uart_interrupt_handler+0x23c>
 8fe:	69d9      	ldr	r1, [r3, #28]
 900:	6962      	ldr	r2, [r4, #20]
 902:	7ce3      	ldrb	r3, [r4, #19]
 904:	1c58      	adds	r0, r3, #1
 906:	74e0      	strb	r0, [r4, #19]
 908:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 90c:	6823      	ldr	r3, [r4, #0]
 90e:	695a      	ldr	r2, [r3, #20]
 910:	f012 0f1f 	tst.w	r2, #31
 914:	d1f3      	bne.n	8fe <drv_uart_interrupt_handler+0x224>
 916:	4620      	mov	r0, r4
 918:	f7ff fedd 	bl	6d6 <uart_int_rx_fifo_noempty_callback>
 91c:	6822      	ldr	r2, [r4, #0]
 91e:	6913      	ldr	r3, [r2, #16]
 920:	f043 0308 	orr.w	r3, r3, #8
 924:	6113      	str	r3, [r2, #16]
 926:	6823      	ldr	r3, [r4, #0]
 928:	2200      	movs	r2, #0
 92a:	611a      	str	r2, [r3, #16]
 92c:	bd38      	pop	{r3, r4, r5, pc}

0000092e <NMI_Handler>:
 92e:	4770      	bx	lr

00000930 <HardFault_Handler>:
 930:	e7fe      	b.n	930 <HardFault_Handler>

00000932 <MemManage_Handler>:
 932:	e7fe      	b.n	932 <MemManage_Handler>

00000934 <BusFault_Handler>:
 934:	e7fe      	b.n	934 <BusFault_Handler>

00000936 <UsageFault_Handler>:
 936:	e7fe      	b.n	936 <UsageFault_Handler>

00000938 <SVC_Handler>:
 938:	4770      	bx	lr

0000093a <DebugMon_Handler>:
 93a:	4770      	bx	lr

0000093c <PendSV_Handler>:
 93c:	4770      	bx	lr

0000093e <SysTick_Handler>:
 93e:	4770      	bx	lr

00000940 <Uart0_Handler>:
 940:	b508      	push	{r3, lr}
 942:	4b04      	ldr	r3, [pc, #16]	; (954 <Uart0_Handler+0x14>)
 944:	2201      	movs	r2, #1
 946:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 94a:	4803      	ldr	r0, [pc, #12]	; (958 <Uart0_Handler+0x18>)
 94c:	f7ff fec5 	bl	6da <drv_uart_interrupt_handler>
 950:	bd08      	pop	{r3, pc}
 952:	bf00      	nop
 954:	e000e100 	and	lr, r0, r0, lsl #2
 958:	000100a8 	andeq	r0, r1, r8, lsr #1

0000095c <Bastim_Ch0_Handler>:
 95c:	b508      	push	{r3, lr}
 95e:	4b04      	ldr	r3, [pc, #16]	; (970 <Bastim_Ch0_Handler+0x14>)
 960:	f44f 7280 	mov.w	r2, #256	; 0x100
 964:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 968:	4802      	ldr	r0, [pc, #8]	; (974 <Bastim_Ch0_Handler+0x18>)
 96a:	f7ff fdd9 	bl	520 <drv_bastim_channel0_interrupt_handler>
 96e:	bd08      	pop	{r3, pc}
 970:	e000e100 	and	lr, r0, r0, lsl #2
 974:	40010000 	andmi	r0, r1, r0

00000978 <Bastim_Ch1_Handler>:
 978:	b508      	push	{r3, lr}
 97a:	4b04      	ldr	r3, [pc, #16]	; (98c <Bastim_Ch1_Handler+0x14>)
 97c:	f44f 7200 	mov.w	r2, #512	; 0x200
 980:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 984:	4802      	ldr	r0, [pc, #8]	; (990 <Bastim_Ch1_Handler+0x18>)
 986:	f7ff fddd 	bl	544 <drv_bastim_channel1_interrupt_handler>
 98a:	bd08      	pop	{r3, pc}
 98c:	e000e100 	and	lr, r0, r0, lsl #2
 990:	40010000 	andmi	r0, r1, r0

00000994 <Bastim_Ch2_Handler>:
 994:	b508      	push	{r3, lr}
 996:	4b04      	ldr	r3, [pc, #16]	; (9a8 <Bastim_Ch2_Handler+0x14>)
 998:	f44f 6280 	mov.w	r2, #1024	; 0x400
 99c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 9a0:	4802      	ldr	r0, [pc, #8]	; (9ac <Bastim_Ch2_Handler+0x18>)
 9a2:	f7ff fde1 	bl	568 <drv_bastim_channel2_interrupt_handler>
 9a6:	bd08      	pop	{r3, pc}
 9a8:	e000e100 	and	lr, r0, r0, lsl #2
 9ac:	40010000 	andmi	r0, r1, r0

000009b0 <Bastim_Ch3_Handler>:
 9b0:	b508      	push	{r3, lr}
 9b2:	4b04      	ldr	r3, [pc, #16]	; (9c4 <Bastim_Ch3_Handler+0x14>)
 9b4:	f44f 6200 	mov.w	r2, #2048	; 0x800
 9b8:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 9bc:	4802      	ldr	r0, [pc, #8]	; (9c8 <Bastim_Ch3_Handler+0x18>)
 9be:	f7ff fde5 	bl	58c <drv_bastim_channel3_interrupt_handler>
 9c2:	bd08      	pop	{r3, pc}
 9c4:	e000e100 	and	lr, r0, r0, lsl #2
 9c8:	40010000 	andmi	r0, r1, r0

000009cc <main>:
 9cc:	b508      	push	{r3, lr}
 9ce:	f000 f83f 	bl	a50 <uart0_init>
 9d2:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 9d6:	23bd      	movs	r3, #189	; 0xbd
 9d8:	60a3      	str	r3, [r4, #8]
 9da:	f7ff fbe3 	bl	1a4 <bastim_4ch_autoreload_int_test>
 9de:	23ed      	movs	r3, #237	; 0xed
 9e0:	60a3      	str	r3, [r4, #8]
 9e2:	e7fe      	b.n	9e2 <main+0x16>

000009e4 <Reset_Handler>:
 9e4:	490a      	ldr	r1, [pc, #40]	; (a10 <Reset_Handler+0x2c>)
 9e6:	4a0b      	ldr	r2, [pc, #44]	; (a14 <Reset_Handler+0x30>)
 9e8:	4b0b      	ldr	r3, [pc, #44]	; (a18 <Reset_Handler+0x34>)
 9ea:	1a9b      	subs	r3, r3, r2
 9ec:	dd03      	ble.n	9f6 <Reset_Handler+0x12>
 9ee:	3b04      	subs	r3, #4
 9f0:	58c8      	ldr	r0, [r1, r3]
 9f2:	50d0      	str	r0, [r2, r3]
 9f4:	dcfb      	bgt.n	9ee <Reset_Handler+0xa>
 9f6:	4909      	ldr	r1, [pc, #36]	; (a1c <Reset_Handler+0x38>)
 9f8:	4a09      	ldr	r2, [pc, #36]	; (a20 <Reset_Handler+0x3c>)
 9fa:	2000      	movs	r0, #0
 9fc:	4291      	cmp	r1, r2
 9fe:	bfbc      	itt	lt
 a00:	f841 0b04 	strlt.w	r0, [r1], #4
 a04:	e7fa      	blt.n	9fc <Reset_Handler+0x18>
 a06:	f7ff ffe1 	bl	9cc <main>
 a0a:	f000 f833 	bl	a74 <exit>
 a0e:	0ae00000 	beq	ff800a16 <__StackTop+0xff7eea16>
 a12:	00000000 	andeq	r0, r0, r0
 a16:	00680001 	rsbeq	r0, r8, r1
 a1a:	00680001 	rsbeq	r0, r8, r1
 a1e:	00c40001 	sbceq	r0, r4, r1
 a22:	e7fe0001 	ldrb	r0, [lr, r1]!
 a26:	e7fe      	b.n	a26 <Reset_Handler+0x42>
 a28:	e7fe      	b.n	a28 <Reset_Handler+0x44>
 a2a:	e7fe      	b.n	a2a <Reset_Handler+0x46>
 a2c:	e7fe      	b.n	a2c <Reset_Handler+0x48>
 a2e:	e7fe      	b.n	a2e <Reset_Handler+0x4a>
 a30:	e7fe      	b.n	a30 <Reset_Handler+0x4c>
 a32:	e7fe      	b.n	a32 <Reset_Handler+0x4e>
 a34:	e7fe      	b.n	a34 <Reset_Handler+0x50>
 a36:	e7fe      	b.n	a36 <Reset_Handler+0x52>

00000a38 <Uart1_Handler>:
 a38:	e7fe      	b.n	a38 <Uart1_Handler>

00000a3a <Resv2_Handler>:
 a3a:	e7fe      	b.n	a3a <Resv2_Handler>

00000a3c <Resv3_Handler>:
 a3c:	e7fe      	b.n	a3c <Resv3_Handler>

00000a3e <Resv4_Handler>:
 a3e:	e7fe      	b.n	a3e <Resv4_Handler>

00000a40 <Gpioa_Handler>:
 a40:	e7fe      	b.n	a40 <Gpioa_Handler>

00000a42 <Resv6_Handler>:
 a42:	e7fe      	b.n	a42 <Resv6_Handler>

00000a44 <Resv7_Handler>:
 a44:	e7fe      	b.n	a44 <Resv7_Handler>
 a46:	e7fe      	b.n	a46 <Resv7_Handler+0x2>
 a48:	e7fe      	b.n	a48 <Resv7_Handler+0x4>
 a4a:	e7fe      	b.n	a4a <Resv7_Handler+0x6>
 a4c:	e7fe      	b.n	a4c <Resv7_Handler+0x8>

00000a4e <Resv12_Handler>:
 a4e:	e7fe      	b.n	a4e <Resv12_Handler>

00000a50 <uart0_init>:
 a50:	b510      	push	{r4, lr}
 a52:	4c05      	ldr	r4, [pc, #20]	; (a68 <uart0_init+0x18>)
 a54:	4b05      	ldr	r3, [pc, #20]	; (a6c <uart0_init+0x1c>)
 a56:	6023      	str	r3, [r4, #0]
 a58:	4620      	mov	r0, r4
 a5a:	f7ff fdba 	bl	5d2 <drv_uart_default_config>
 a5e:	4620      	mov	r0, r4
 a60:	f7ff fdea 	bl	638 <drv_uart_init>
 a64:	bd10      	pop	{r4, pc}
 a66:	bf00      	nop
 a68:	000100a8 	andeq	r0, r1, r8, lsr #1
 a6c:	40001000 	andmi	r1, r0, r0

00000a70 <test_printf_s>:
 a70:	4770      	bx	lr
	...

00000a74 <exit>:
 a74:	b508      	push	{r3, lr}
 a76:	4b07      	ldr	r3, [pc, #28]	; (a94 <exit+0x20>)
 a78:	4604      	mov	r4, r0
 a7a:	b113      	cbz	r3, a82 <exit+0xe>
 a7c:	2100      	movs	r1, #0
 a7e:	f3af 8000 	nop.w
 a82:	4b05      	ldr	r3, [pc, #20]	; (a98 <exit+0x24>)
 a84:	6818      	ldr	r0, [r3, #0]
 a86:	6a83      	ldr	r3, [r0, #40]	; 0x28
 a88:	b103      	cbz	r3, a8c <exit+0x18>
 a8a:	4798      	blx	r3
 a8c:	4620      	mov	r0, r4
 a8e:	f000 f805 	bl	a9c <_exit>
 a92:	bf00      	nop
 a94:	00000000 	andeq	r0, r0, r0
 a98:	00000ad8 	ldrdeq	r0, [r0], -r8

00000a9c <_exit>:
 a9c:	e7fe      	b.n	a9c <_exit>
 a9e:	bf00      	nop

00000aa0 <_init>:
 aa0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 aa2:	bf00      	nop
 aa4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 aa6:	bc08      	pop	{r3}
 aa8:	469e      	mov	lr, r3
 aaa:	4770      	bx	lr

00000aac <_fini>:
 aac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 aae:	bf00      	nop
 ab0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 ab2:	bc08      	pop	{r3}
 ab4:	469e      	mov	lr, r3
 ab6:	4770      	bx	lr
 ab8:	74736162 	ldrbtvc	r6, [r3], #-354	; 0xfffffe9e
 abc:	34206d69 	strtcc	r6, [r0], #-3433	; 0xfffff297
 ac0:	61206863 			; <UNDEFINED> instruction: 0x61206863
 ac4:	726f7475 	rsbvc	r7, pc, #1962934272	; 0x75000000
 ac8:	616f6c65 	cmnvs	pc, r5, ror #24
 acc:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
 ad0:	0a0d2e74 	beq	34c4a8 <__StackTop+0x33a4a8>
 ad4:	00000000 	andeq	r0, r0, r0

00000ad8 <_global_impure_ptr>:
 ad8:	00010000 	andeq	r0, r1, r0

00000adc <__EH_FRAME_BEGIN__>:
 adc:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00010000 <impure_data>:
	...

00010060 <__frame_dummy_init_array_entry>:
   10060:	00000099 	muleq	r0, r9, r0

00010064 <__do_global_dtors_aux_fini_array_entry>:
   10064:	00000075 	andeq	r0, r0, r5, ror r0

Disassembly of section .bss:

00010068 <__bss_start__>:
   10068:	00000000 	andeq	r0, r0, r0

0001006c <object.0>:
	...

00010084 <bastim_ch0>:
	...

0001008c <bastim_ch1>:
	...

00010094 <bastim_ch2>:
	...

0001009c <bastim_ch3>:
	...

000100a4 <bastim_ch0_int_flag>:
	...

000100a5 <bastim_ch1_int_flag>:
	...

000100a6 <bastim_ch2_int_flag>:
	...

000100a7 <bastim_ch3_int_flag>:
	...

000100a8 <huart0>:
	...

Disassembly of section .stack_dummy:

000100c8 <__HeapBase>:
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
  18:	00000a74 	andeq	r0, r0, r4, ror sl
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000a9c 	muleq	r0, ip, sl
  44:	00000002 	andeq	r0, r0, r2

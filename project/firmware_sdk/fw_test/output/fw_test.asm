
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
   0:	00022000 	andeq	r2, r2, r0
   4:	000009ad 	andeq	r0, r0, sp, lsr #19
   8:	000008d9 	ldrdeq	r0, [r0], -r9
   c:	000008e9 	andeq	r0, r0, r9, ror #17
  10:	000008eb 	andeq	r0, r0, fp, ror #17
  14:	000008ed 	andeq	r0, r0, sp, ror #17
  18:	000008ef 	andeq	r0, r0, pc, ror #17
	...
  2c:	000008f1 	strdeq	r0, [r0], -r1
  30:	000008f3 	strdeq	r0, [r0], -r3
  34:	00000000 	andeq	r0, r0, r0
  38:	000008f5 	strdeq	r0, [r0], -r5
  3c:	000008f7 	strdeq	r0, [r0], -r7
  40:	000008f9 	strdeq	r0, [r0], -r9
  44:	00000a01 	andeq	r0, r0, r1, lsl #20
  48:	00000a03 	andeq	r0, r0, r3, lsl #20
  4c:	00000a05 	andeq	r0, r0, r5, lsl #20
  50:	00000a07 	andeq	r0, r0, r7, lsl #20
  54:	00000a09 	andeq	r0, r0, r9, lsl #20
  58:	00000a0b 	andeq	r0, r0, fp, lsl #20
  5c:	00000a0d 	andeq	r0, r0, sp, lsl #20
  60:	00000a0f 	andeq	r0, r0, pc, lsl #20
  64:	00000a11 	andeq	r0, r0, r1, lsl sl
  68:	00000a13 	andeq	r0, r0, r3, lsl sl
  6c:	00000a15 	andeq	r0, r0, r5, lsl sl
  70:	00000a17 	andeq	r0, r0, r7, lsl sl
  74:	00000a19 	andeq	r0, r0, r9, lsl sl
  78:	00000a1b 	andeq	r0, r0, fp, lsl sl
  7c:	00000a1d 	andeq	r0, r0, sp, lsl sl
  80:	00000915 	andeq	r0, r0, r5, lsl r9
  84:	00000931 	andeq	r0, r0, r1, lsr r9
  88:	0000094d 	andeq	r0, r0, sp, asr #18

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
  a4:	00020068 	andeq	r0, r2, r8, rrx
  a8:	00000000 	andeq	r0, r0, r0
  ac:	00000aa8 	andeq	r0, r0, r8, lsr #21

000000b0 <frame_dummy>:
  b0:	b508      	push	{r3, lr}
  b2:	4b03      	ldr	r3, [pc, #12]	; (c0 <frame_dummy+0x10>)
  b4:	b11b      	cbz	r3, be <frame_dummy+0xe>
  b6:	4903      	ldr	r1, [pc, #12]	; (c4 <frame_dummy+0x14>)
  b8:	4803      	ldr	r0, [pc, #12]	; (c8 <frame_dummy+0x18>)
  ba:	f3af 8000 	nop.w
  be:	bd08      	pop	{r3, pc}
  c0:	00000000 	andeq	r0, r0, r0
  c4:	0002006c 	andeq	r0, r2, ip, rrx
  c8:	00000aa8 	andeq	r0, r0, r8, lsr #21

000000cc <advtim_ch1_enc_direct_both_edge_on_init>:
  cc:	b510      	push	{r4, lr}
  ce:	4c12      	ldr	r4, [pc, #72]	; (118 <advtim_ch1_enc_direct_both_edge_on_init+0x4c>)
  d0:	4a12      	ldr	r2, [pc, #72]	; (11c <advtim_ch1_enc_direct_both_edge_on_init+0x50>)
  d2:	6022      	str	r2, [r4, #0]
  d4:	f649 4340 	movw	r3, #40000	; 0x9c40
  d8:	6663      	str	r3, [r4, #100]	; 0x64
  da:	2304      	movs	r3, #4
  dc:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
  e0:	2301      	movs	r3, #1
  e2:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
  e6:	f884 306a 	strb.w	r3, [r4, #106]	; 0x6a
  ea:	f884 306b 	strb.w	r3, [r4, #107]	; 0x6b
  ee:	f884 306c 	strb.w	r3, [r4, #108]	; 0x6c
  f2:	f884 306d 	strb.w	r3, [r4, #109]	; 0x6d
  f6:	6813      	ldr	r3, [r2, #0]
  f8:	f043 0302 	orr.w	r3, r3, #2
  fc:	6013      	str	r3, [r2, #0]
  fe:	4620      	mov	r0, r4
 100:	f000 f94c 	bl	39c <drv_advtim_enc_init>
 104:	6823      	ldr	r3, [r4, #0]
 106:	6fda      	ldr	r2, [r3, #124]	; 0x7c
 108:	f042 0202 	orr.w	r2, r2, #2
 10c:	67da      	str	r2, [r3, #124]	; 0x7c
 10e:	6fda      	ldr	r2, [r3, #124]	; 0x7c
 110:	f042 0201 	orr.w	r2, r2, #1
 114:	67da      	str	r2, [r3, #124]	; 0x7c
 116:	bd10      	pop	{r4, pc}
 118:	00020084 	andeq	r0, r2, r4, lsl #1
 11c:	40021000 	andmi	r1, r2, r0

00000120 <advtim_ch1_encoder_direct_both_edge_on_test>:
 120:	b570      	push	{r4, r5, r6, lr}
 122:	f7ff ffd3 	bl	cc <advtim_ch1_enc_direct_both_edge_on_init>
 126:	2300      	movs	r3, #0
 128:	4a13      	ldr	r2, [pc, #76]	; (178 <advtim_ch1_encoder_direct_both_edge_on_test+0x58>)
 12a:	8013      	strh	r3, [r2, #0]
 12c:	4a13      	ldr	r2, [pc, #76]	; (17c <advtim_ch1_encoder_direct_both_edge_on_test+0x5c>)
 12e:	7013      	strb	r3, [r2, #0]
 130:	4c13      	ldr	r4, [pc, #76]	; (180 <advtim_ch1_encoder_direct_both_edge_on_test+0x60>)
 132:	6821      	ldr	r1, [r4, #0]
 134:	680a      	ldr	r2, [r1, #0]
 136:	f042 0201 	orr.w	r2, r2, #1
 13a:	600a      	str	r2, [r1, #0]
 13c:	6821      	ldr	r1, [r4, #0]
 13e:	680a      	ldr	r2, [r1, #0]
 140:	f022 0201 	bic.w	r2, r2, #1
 144:	600a      	str	r2, [r1, #0]
 146:	4d0f      	ldr	r5, [pc, #60]	; (184 <advtim_ch1_encoder_direct_both_edge_on_test+0x64>)
 148:	f885 3312 	strb.w	r3, [r5, #786]	; 0x312
 14c:	f44f 2680 	mov.w	r6, #262144	; 0x40000
 150:	602e      	str	r6, [r5, #0]
 152:	6822      	ldr	r2, [r4, #0]
 154:	6813      	ldr	r3, [r2, #0]
 156:	f043 0310 	orr.w	r3, r3, #16
 15a:	6013      	str	r3, [r2, #0]
 15c:	f000 fc10 	bl	980 <exit_current_test_loop>
 160:	6822      	ldr	r2, [r4, #0]
 162:	6813      	ldr	r3, [r2, #0]
 164:	f023 0310 	bic.w	r3, r3, #16
 168:	6013      	str	r3, [r2, #0]
 16a:	f8c5 6080 	str.w	r6, [r5, #128]	; 0x80
 16e:	f3bf 8f4f 	dsb	sy
 172:	f3bf 8f6f 	isb	sy
 176:	bd70      	pop	{r4, r5, r6, pc}
 178:	000200f6 	strdeq	r0, [r2], -r6
 17c:	000200f9 	strdeq	r0, [r2], -r9
 180:	00020084 	andeq	r0, r2, r4, lsl #1
 184:	e000e100 	and	lr, r0, r0, lsl #2

00000188 <advtim_gen_int_reloaded_callback>:
 188:	4a1e      	ldr	r2, [pc, #120]	; (204 <Stack_Size+0x4>)
 18a:	8813      	ldrh	r3, [r2, #0]
 18c:	b29b      	uxth	r3, r3
 18e:	3301      	adds	r3, #1
 190:	b29b      	uxth	r3, r3
 192:	8013      	strh	r3, [r2, #0]
 194:	4b1c      	ldr	r3, [pc, #112]	; (208 <Stack_Size+0x8>)
 196:	781b      	ldrb	r3, [r3, #0]
 198:	b2db      	uxtb	r3, r3
 19a:	2b01      	cmp	r3, #1
 19c:	d000      	beq.n	1a0 <advtim_gen_int_reloaded_callback+0x18>
 19e:	4770      	bx	lr
 1a0:	4611      	mov	r1, r2
 1a2:	8810      	ldrh	r0, [r2, #0]
 1a4:	4b19      	ldr	r3, [pc, #100]	; (20c <Stack_Size+0xc>)
 1a6:	681b      	ldr	r3, [r3, #0]
 1a8:	691a      	ldr	r2, [r3, #16]
 1aa:	b292      	uxth	r2, r2
 1ac:	ea42 4200 	orr.w	r2, r2, r0, lsl #16
 1b0:	611a      	str	r2, [r3, #16]
 1b2:	8808      	ldrh	r0, [r1, #0]
 1b4:	695a      	ldr	r2, [r3, #20]
 1b6:	b292      	uxth	r2, r2
 1b8:	ea42 4200 	orr.w	r2, r2, r0, lsl #16
 1bc:	615a      	str	r2, [r3, #20]
 1be:	880a      	ldrh	r2, [r1, #0]
 1c0:	b292      	uxth	r2, r2
 1c2:	f640 11c2 	movw	r1, #2498	; 0x9c2
 1c6:	428a      	cmp	r2, r1
 1c8:	d9e9      	bls.n	19e <advtim_gen_int_reloaded_callback+0x16>
 1ca:	4a0e      	ldr	r2, [pc, #56]	; (204 <Stack_Size+0x4>)
 1cc:	2100      	movs	r1, #0
 1ce:	8011      	strh	r1, [r2, #0]
 1d0:	4a0f      	ldr	r2, [pc, #60]	; (210 <Stack_Size+0x10>)
 1d2:	7812      	ldrb	r2, [r2, #0]
 1d4:	b152      	cbz	r2, 1ec <advtim_gen_int_reloaded_callback+0x64>
 1d6:	699a      	ldr	r2, [r3, #24]
 1d8:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
 1dc:	619a      	str	r2, [r3, #24]
 1de:	699a      	ldr	r2, [r3, #24]
 1e0:	f422 5200 	bic.w	r2, r2, #8192	; 0x2000
 1e4:	619a      	str	r2, [r3, #24]
 1e6:	4b0a      	ldr	r3, [pc, #40]	; (210 <Stack_Size+0x10>)
 1e8:	7019      	strb	r1, [r3, #0]
 1ea:	4770      	bx	lr
 1ec:	699a      	ldr	r2, [r3, #24]
 1ee:	f422 4280 	bic.w	r2, r2, #16384	; 0x4000
 1f2:	619a      	str	r2, [r3, #24]
 1f4:	699a      	ldr	r2, [r3, #24]
 1f6:	f442 5200 	orr.w	r2, r2, #8192	; 0x2000
 1fa:	619a      	str	r2, [r3, #24]
 1fc:	4b04      	ldr	r3, [pc, #16]	; (210 <Stack_Size+0x10>)
 1fe:	2201      	movs	r2, #1
 200:	701a      	strb	r2, [r3, #0]
 202:	e7cc      	b.n	19e <advtim_gen_int_reloaded_callback+0x16>
 204:	000200f6 	strdeq	r0, [r2], -r6
 208:	000200f4 	strdeq	r0, [r2], -r4
 20c:	00020084 	andeq	r0, r2, r4, lsl #1
 210:	000200fa 	strdeq	r0, [r2], -sl

00000214 <advtim_gen_int_reloading_reaching_rcr_callback>:
 214:	4a03      	ldr	r2, [pc, #12]	; (224 <advtim_gen_int_reloading_reaching_rcr_callback+0x10>)
 216:	8813      	ldrh	r3, [r2, #0]
 218:	b29b      	uxth	r3, r3
 21a:	3301      	adds	r3, #1
 21c:	b29b      	uxth	r3, r3
 21e:	8013      	strh	r3, [r2, #0]
 220:	4770      	bx	lr
 222:	bf00      	nop
 224:	000200f6 	strdeq	r0, [r2], -r6

00000228 <advtim_gen_int_fault_detected_callback>:
 228:	b510      	push	{r4, lr}
 22a:	4c08      	ldr	r4, [pc, #32]	; (24c <advtim_gen_int_fault_detected_callback+0x24>)
 22c:	7823      	ldrb	r3, [r4, #0]
 22e:	3301      	adds	r3, #1
 230:	b2db      	uxtb	r3, r3
 232:	7023      	strb	r3, [r4, #0]
 234:	4806      	ldr	r0, [pc, #24]	; (250 <advtim_gen_int_fault_detected_callback+0x28>)
 236:	f000 fc05 	bl	a44 <test_printf_s>
 23a:	7823      	ldrb	r3, [r4, #0]
 23c:	b2db      	uxtb	r3, r3
 23e:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 242:	6093      	str	r3, [r2, #8]
 244:	230e      	movs	r3, #14
 246:	60d3      	str	r3, [r2, #12]
 248:	bd10      	pop	{r4, pc}
 24a:	bf00      	nop
 24c:	000200f8 	strdeq	r0, [r2], -r8
 250:	00000a8c 	andeq	r0, r0, ip, lsl #21

00000254 <advtim_cap_int_reloaded_callback>:
 254:	4813      	ldr	r0, [pc, #76]	; (2a4 <advtim_cap_int_reloaded_callback+0x50>)
 256:	6802      	ldr	r2, [r0, #0]
 258:	6e53      	ldr	r3, [r2, #100]	; 0x64
 25a:	0c1b      	lsrs	r3, r3, #16
 25c:	6e92      	ldr	r2, [r2, #104]	; 0x68
 25e:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 262:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 266:	eb03 4312 	add.w	r3, r3, r2, lsr #16
 26a:	b2db      	uxtb	r3, r3
 26c:	4a0e      	ldr	r2, [pc, #56]	; (2a8 <advtim_cap_int_reloaded_callback+0x54>)
 26e:	7013      	strb	r3, [r2, #0]
 270:	7813      	ldrb	r3, [r2, #0]
 272:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 276:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 27a:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
 27e:	600b      	str	r3, [r1, #0]
 280:	6800      	ldr	r0, [r0, #0]
 282:	6e43      	ldr	r3, [r0, #100]	; 0x64
 284:	6e80      	ldr	r0, [r0, #104]	; 0x68
 286:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 28a:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 28e:	4403      	add	r3, r0
 290:	b2db      	uxtb	r3, r3
 292:	7013      	strb	r3, [r2, #0]
 294:	7813      	ldrb	r3, [r2, #0]
 296:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 29a:	eb03 0383 	add.w	r3, r3, r3, lsl #2
 29e:	604b      	str	r3, [r1, #4]
 2a0:	4770      	bx	lr
 2a2:	bf00      	nop
 2a4:	00020084 	andeq	r0, r2, r4, lsl #1
 2a8:	000200f8 	strdeq	r0, [r2], -r8

000002ac <advtim_cap_int_reloading_reaching_rcr_callback>:
 2ac:	4a03      	ldr	r2, [pc, #12]	; (2bc <advtim_cap_int_reloading_reaching_rcr_callback+0x10>)
 2ae:	8813      	ldrh	r3, [r2, #0]
 2b0:	b29b      	uxth	r3, r3
 2b2:	3301      	adds	r3, #1
 2b4:	b29b      	uxth	r3, r3
 2b6:	8013      	strh	r3, [r2, #0]
 2b8:	4770      	bx	lr
 2ba:	bf00      	nop
 2bc:	000200f6 	strdeq	r0, [r2], -r6

000002c0 <advtim_enc_int_reloaded_callback>:
 2c0:	4a09      	ldr	r2, [pc, #36]	; (2e8 <advtim_enc_int_reloaded_callback+0x28>)
 2c2:	8813      	ldrh	r3, [r2, #0]
 2c4:	b29b      	uxth	r3, r3
 2c6:	3301      	adds	r3, #1
 2c8:	b29b      	uxth	r3, r3
 2ca:	8013      	strh	r3, [r2, #0]
 2cc:	4b07      	ldr	r3, [pc, #28]	; (2ec <advtim_enc_int_reloaded_callback+0x2c>)
 2ce:	681b      	ldr	r3, [r3, #0]
 2d0:	f8d3 3084 	ldr.w	r3, [r3, #132]	; 0x84
 2d4:	b29b      	uxth	r3, r3
 2d6:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
 2da:	6013      	str	r3, [r2, #0]
 2dc:	4b04      	ldr	r3, [pc, #16]	; (2f0 <advtim_enc_int_reloaded_callback+0x30>)
 2de:	781b      	ldrb	r3, [r3, #0]
 2e0:	b2db      	uxtb	r3, r3
 2e2:	6053      	str	r3, [r2, #4]
 2e4:	4770      	bx	lr
 2e6:	bf00      	nop
 2e8:	000200f6 	strdeq	r0, [r2], -r6
 2ec:	00020084 	andeq	r0, r2, r4, lsl #1
 2f0:	000200f9 	strdeq	r0, [r2], -r9

000002f4 <advtim_enc_int_detected_callback>:
 2f4:	4a02      	ldr	r2, [pc, #8]	; (300 <advtim_enc_int_detected_callback+0xc>)
 2f6:	7813      	ldrb	r3, [r2, #0]
 2f8:	3301      	adds	r3, #1
 2fa:	b2db      	uxtb	r3, r3
 2fc:	7013      	strb	r3, [r2, #0]
 2fe:	4770      	bx	lr
 300:	000200f9 	strdeq	r0, [r2], -r9

00000304 <drv_advtim_cap_interrupt_handler>:
 304:	b538      	push	{r3, r4, r5, lr}
 306:	4604      	mov	r4, r0
 308:	6803      	ldr	r3, [r0, #0]
 30a:	6edd      	ldr	r5, [r3, #108]	; 0x6c
 30c:	6ddb      	ldr	r3, [r3, #92]	; 0x5c
 30e:	b2db      	uxtb	r3, r3
 310:	401d      	ands	r5, r3
 312:	f015 0f01 	tst.w	r5, #1
 316:	d103      	bne.n	320 <drv_advtim_cap_interrupt_handler+0x1c>
 318:	f015 0f02 	tst.w	r5, #2
 31c:	d10b      	bne.n	336 <drv_advtim_cap_interrupt_handler+0x32>
 31e:	bd38      	pop	{r3, r4, r5, pc}
 320:	f7ff ff98 	bl	254 <advtim_cap_int_reloaded_callback>
 324:	6822      	ldr	r2, [r4, #0]
 326:	6e13      	ldr	r3, [r2, #96]	; 0x60
 328:	f043 0301 	orr.w	r3, r3, #1
 32c:	6613      	str	r3, [r2, #96]	; 0x60
 32e:	6823      	ldr	r3, [r4, #0]
 330:	2200      	movs	r2, #0
 332:	661a      	str	r2, [r3, #96]	; 0x60
 334:	e7f0      	b.n	318 <drv_advtim_cap_interrupt_handler+0x14>
 336:	4620      	mov	r0, r4
 338:	f7ff ffb8 	bl	2ac <advtim_cap_int_reloading_reaching_rcr_callback>
 33c:	6822      	ldr	r2, [r4, #0]
 33e:	6e13      	ldr	r3, [r2, #96]	; 0x60
 340:	f043 0302 	orr.w	r3, r3, #2
 344:	6613      	str	r3, [r2, #96]	; 0x60
 346:	6823      	ldr	r3, [r4, #0]
 348:	2200      	movs	r2, #0
 34a:	661a      	str	r2, [r3, #96]	; 0x60
 34c:	e7e7      	b.n	31e <drv_advtim_cap_interrupt_handler+0x1a>

0000034e <drv_advtim_enc_set_config>:
 34e:	b538      	push	{r3, r4, r5, lr}
 350:	4604      	mov	r4, r0
 352:	6e41      	ldr	r1, [r0, #100]	; 0x64
 354:	6800      	ldr	r0, [r0, #0]
 356:	460a      	mov	r2, r1
 358:	3070      	adds	r0, #112	; 0x70
 35a:	f000 f8a0 	bl	49e <drv_check_rw_data>
 35e:	4605      	mov	r5, r0
 360:	f894 3068 	ldrb.w	r3, [r4, #104]	; 0x68
 364:	f894 1069 	ldrb.w	r1, [r4, #105]	; 0x69
 368:	0409      	lsls	r1, r1, #16
 36a:	ea41 7103 	orr.w	r1, r1, r3, lsl #28
 36e:	f894 306c 	ldrb.w	r3, [r4, #108]	; 0x6c
 372:	ea41 01c3 	orr.w	r1, r1, r3, lsl #3
 376:	f894 306d 	ldrb.w	r3, [r4, #109]	; 0x6d
 37a:	ea41 0183 	orr.w	r1, r1, r3, lsl #2
 37e:	f894 206a 	ldrb.w	r2, [r4, #106]	; 0x6a
 382:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
 386:	f894 206b 	ldrb.w	r2, [r4, #107]	; 0x6b
 38a:	4311      	orrs	r1, r2
 38c:	6820      	ldr	r0, [r4, #0]
 38e:	460a      	mov	r2, r1
 390:	3074      	adds	r0, #116	; 0x74
 392:	f000 f884 	bl	49e <drv_check_rw_data>
 396:	4328      	orrs	r0, r5
 398:	b2c0      	uxtb	r0, r0
 39a:	bd38      	pop	{r3, r4, r5, pc}

0000039c <drv_advtim_enc_init>:
 39c:	b510      	push	{r4, lr}
 39e:	4604      	mov	r4, r0
 3a0:	f7ff ffd5 	bl	34e <drv_advtim_enc_set_config>
 3a4:	6822      	ldr	r2, [r4, #0]
 3a6:	6813      	ldr	r3, [r2, #0]
 3a8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 3ac:	6013      	str	r3, [r2, #0]
 3ae:	6822      	ldr	r2, [r4, #0]
 3b0:	6813      	ldr	r3, [r2, #0]
 3b2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 3b6:	6013      	str	r3, [r2, #0]
 3b8:	6823      	ldr	r3, [r4, #0]
 3ba:	2203      	movs	r2, #3
 3bc:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 3c0:	6823      	ldr	r3, [r4, #0]
 3c2:	2200      	movs	r2, #0
 3c4:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 3c8:	6822      	ldr	r2, [r4, #0]
 3ca:	6813      	ldr	r3, [r2, #0]
 3cc:	f043 0301 	orr.w	r3, r3, #1
 3d0:	6013      	str	r3, [r2, #0]
 3d2:	6822      	ldr	r2, [r4, #0]
 3d4:	6813      	ldr	r3, [r2, #0]
 3d6:	f023 0301 	bic.w	r3, r3, #1
 3da:	6013      	str	r3, [r2, #0]
 3dc:	bd10      	pop	{r4, pc}

000003de <drv_advtim_enc_interrupt_handler>:
 3de:	b538      	push	{r3, r4, r5, lr}
 3e0:	4604      	mov	r4, r0
 3e2:	6803      	ldr	r3, [r0, #0]
 3e4:	f8d3 5088 	ldr.w	r5, [r3, #136]	; 0x88
 3e8:	6fdb      	ldr	r3, [r3, #124]	; 0x7c
 3ea:	b2db      	uxtb	r3, r3
 3ec:	401d      	ands	r5, r3
 3ee:	f015 0f01 	tst.w	r5, #1
 3f2:	d103      	bne.n	3fc <drv_advtim_enc_interrupt_handler+0x1e>
 3f4:	f015 0f02 	tst.w	r5, #2
 3f8:	d10e      	bne.n	418 <drv_advtim_enc_interrupt_handler+0x3a>
 3fa:	bd38      	pop	{r3, r4, r5, pc}
 3fc:	f7ff ff60 	bl	2c0 <advtim_enc_int_reloaded_callback>
 400:	6822      	ldr	r2, [r4, #0]
 402:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
 406:	f043 0301 	orr.w	r3, r3, #1
 40a:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
 40e:	6823      	ldr	r3, [r4, #0]
 410:	2200      	movs	r2, #0
 412:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 416:	e7ed      	b.n	3f4 <drv_advtim_enc_interrupt_handler+0x16>
 418:	4620      	mov	r0, r4
 41a:	f7ff ff6b 	bl	2f4 <advtim_enc_int_detected_callback>
 41e:	6822      	ldr	r2, [r4, #0]
 420:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
 424:	f043 0302 	orr.w	r3, r3, #2
 428:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
 42c:	6823      	ldr	r3, [r4, #0]
 42e:	2200      	movs	r2, #0
 430:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
 434:	e7e1      	b.n	3fa <drv_advtim_enc_interrupt_handler+0x1c>

00000436 <drv_advtim_gen_interrupt_handler>:
 436:	b538      	push	{r3, r4, r5, lr}
 438:	4604      	mov	r4, r0
 43a:	6803      	ldr	r3, [r0, #0]
 43c:	6c9d      	ldr	r5, [r3, #72]	; 0x48
 43e:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 440:	b2db      	uxtb	r3, r3
 442:	401d      	ands	r5, r3
 444:	f015 0f04 	tst.w	r5, #4
 448:	d106      	bne.n	458 <drv_advtim_gen_interrupt_handler+0x22>
 44a:	f015 0f01 	tst.w	r5, #1
 44e:	d10e      	bne.n	46e <drv_advtim_gen_interrupt_handler+0x38>
 450:	f015 0f02 	tst.w	r5, #2
 454:	d117      	bne.n	486 <drv_advtim_gen_interrupt_handler+0x50>
 456:	bd38      	pop	{r3, r4, r5, pc}
 458:	f7ff fee6 	bl	228 <advtim_gen_int_fault_detected_callback>
 45c:	6822      	ldr	r2, [r4, #0]
 45e:	6c53      	ldr	r3, [r2, #68]	; 0x44
 460:	f043 0304 	orr.w	r3, r3, #4
 464:	6453      	str	r3, [r2, #68]	; 0x44
 466:	6823      	ldr	r3, [r4, #0]
 468:	2200      	movs	r2, #0
 46a:	645a      	str	r2, [r3, #68]	; 0x44
 46c:	e7ed      	b.n	44a <drv_advtim_gen_interrupt_handler+0x14>
 46e:	4620      	mov	r0, r4
 470:	f7ff fe8a 	bl	188 <advtim_gen_int_reloaded_callback>
 474:	6822      	ldr	r2, [r4, #0]
 476:	6c53      	ldr	r3, [r2, #68]	; 0x44
 478:	f043 0301 	orr.w	r3, r3, #1
 47c:	6453      	str	r3, [r2, #68]	; 0x44
 47e:	6823      	ldr	r3, [r4, #0]
 480:	2200      	movs	r2, #0
 482:	645a      	str	r2, [r3, #68]	; 0x44
 484:	e7e4      	b.n	450 <drv_advtim_gen_interrupt_handler+0x1a>
 486:	4620      	mov	r0, r4
 488:	f7ff fec4 	bl	214 <advtim_gen_int_reloading_reaching_rcr_callback>
 48c:	6822      	ldr	r2, [r4, #0]
 48e:	6c53      	ldr	r3, [r2, #68]	; 0x44
 490:	f043 0302 	orr.w	r3, r3, #2
 494:	6453      	str	r3, [r2, #68]	; 0x44
 496:	6823      	ldr	r3, [r4, #0]
 498:	2200      	movs	r2, #0
 49a:	645a      	str	r2, [r3, #68]	; 0x44
 49c:	e7db      	b.n	456 <drv_advtim_gen_interrupt_handler+0x20>

0000049e <drv_check_rw_data>:
 49e:	6001      	str	r1, [r0, #0]
 4a0:	6803      	ldr	r3, [r0, #0]
 4a2:	4293      	cmp	r3, r2
 4a4:	d007      	beq.n	4b6 <drv_check_rw_data+0x18>
 4a6:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 4aa:	2001      	movs	r0, #1
 4ac:	6018      	str	r0, [r3, #0]
 4ae:	685a      	ldr	r2, [r3, #4]
 4b0:	4402      	add	r2, r0
 4b2:	601a      	str	r2, [r3, #0]
 4b4:	4770      	bx	lr
 4b6:	2000      	movs	r0, #0
 4b8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
 4bc:	6018      	str	r0, [r3, #0]
 4be:	4770      	bx	lr

000004c0 <drv_uart_default_config>:
 4c0:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 4c4:	6043      	str	r3, [r0, #4]
 4c6:	230f      	movs	r3, #15
 4c8:	7203      	strb	r3, [r0, #8]
 4ca:	2300      	movs	r3, #0
 4cc:	7243      	strb	r3, [r0, #9]
 4ce:	7283      	strb	r3, [r0, #10]
 4d0:	72c3      	strb	r3, [r0, #11]
 4d2:	7303      	strb	r3, [r0, #12]
 4d4:	7343      	strb	r3, [r0, #13]
 4d6:	2301      	movs	r3, #1
 4d8:	7383      	strb	r3, [r0, #14]
 4da:	4770      	bx	lr

000004dc <drv_uart_set_config>:
 4dc:	b508      	push	{r3, lr}
 4de:	6841      	ldr	r1, [r0, #4]
 4e0:	7a03      	ldrb	r3, [r0, #8]
 4e2:	fb03 f201 	mul.w	r2, r3, r1
 4e6:	490e      	ldr	r1, [pc, #56]	; (520 <drv_uart_set_config+0x44>)
 4e8:	fbb1 f2f2 	udiv	r2, r1, r2
 4ec:	0419      	lsls	r1, r3, #16
 4ee:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
 4f2:	7a43      	ldrb	r3, [r0, #9]
 4f4:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
 4f8:	7a83      	ldrb	r3, [r0, #10]
 4fa:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
 4fe:	7ac3      	ldrb	r3, [r0, #11]
 500:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
 504:	7b03      	ldrb	r3, [r0, #12]
 506:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
 50a:	7b42      	ldrb	r2, [r0, #13]
 50c:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
 510:	7b82      	ldrb	r2, [r0, #14]
 512:	4311      	orrs	r1, r2
 514:	6800      	ldr	r0, [r0, #0]
 516:	460a      	mov	r2, r1
 518:	3008      	adds	r0, #8
 51a:	f7ff ffc0 	bl	49e <drv_check_rw_data>
 51e:	bd08      	pop	{r3, pc}
 520:	02625a00 	rsbeq	r5, r2, #0, 20

00000524 <drv_uart_init>:
 524:	b538      	push	{r3, r4, r5, lr}
 526:	4604      	mov	r4, r0
 528:	2500      	movs	r5, #0
 52a:	7485      	strb	r5, [r0, #18]
 52c:	74c5      	strb	r5, [r0, #19]
 52e:	f7ff ffd5 	bl	4dc <drv_uart_set_config>
 532:	7425      	strb	r5, [r4, #16]
 534:	74a5      	strb	r5, [r4, #18]
 536:	74e5      	strb	r5, [r4, #19]
 538:	6822      	ldr	r2, [r4, #0]
 53a:	6853      	ldr	r3, [r2, #4]
 53c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 540:	6053      	str	r3, [r2, #4]
 542:	6822      	ldr	r2, [r4, #0]
 544:	6853      	ldr	r3, [r2, #4]
 546:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 54a:	6053      	str	r3, [r2, #4]
 54c:	6822      	ldr	r2, [r4, #0]
 54e:	6853      	ldr	r3, [r2, #4]
 550:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 554:	6053      	str	r3, [r2, #4]
 556:	6822      	ldr	r2, [r4, #0]
 558:	6853      	ldr	r3, [r2, #4]
 55a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 55e:	6053      	str	r3, [r2, #4]
 560:	6822      	ldr	r2, [r4, #0]
 562:	6853      	ldr	r3, [r2, #4]
 564:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 568:	6053      	str	r3, [r2, #4]
 56a:	6822      	ldr	r2, [r4, #0]
 56c:	6853      	ldr	r3, [r2, #4]
 56e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 572:	6053      	str	r3, [r2, #4]
 574:	6822      	ldr	r2, [r4, #0]
 576:	6853      	ldr	r3, [r2, #4]
 578:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 57c:	6053      	str	r3, [r2, #4]
 57e:	6822      	ldr	r2, [r4, #0]
 580:	6853      	ldr	r3, [r2, #4]
 582:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 586:	6053      	str	r3, [r2, #4]
 588:	6823      	ldr	r3, [r4, #0]
 58a:	f240 12ff 	movw	r2, #511	; 0x1ff
 58e:	611a      	str	r2, [r3, #16]
 590:	6823      	ldr	r3, [r4, #0]
 592:	611d      	str	r5, [r3, #16]
 594:	6822      	ldr	r2, [r4, #0]
 596:	6853      	ldr	r3, [r2, #4]
 598:	f043 0301 	orr.w	r3, r3, #1
 59c:	6053      	str	r3, [r2, #4]
 59e:	6822      	ldr	r2, [r4, #0]
 5a0:	6853      	ldr	r3, [r2, #4]
 5a2:	f023 0301 	bic.w	r3, r3, #1
 5a6:	6053      	str	r3, [r2, #4]
 5a8:	6822      	ldr	r2, [r4, #0]
 5aa:	6853      	ldr	r3, [r2, #4]
 5ac:	f043 0302 	orr.w	r3, r3, #2
 5b0:	6053      	str	r3, [r2, #4]
 5b2:	bd38      	pop	{r3, r4, r5, pc}

000005b4 <drv_uart_getchar_timeout>:
 5b4:	2a00      	cmp	r2, #0
 5b6:	d059      	beq.n	66c <drv_uart_getchar_timeout+0xb8>
 5b8:	b430      	push	{r4, r5}
 5ba:	e00b      	b.n	5d4 <drv_uart_getchar_timeout+0x20>
 5bc:	69db      	ldr	r3, [r3, #28]
 5be:	700b      	strb	r3, [r1, #0]
 5c0:	2000      	movs	r0, #0
 5c2:	e051      	b.n	668 <drv_uart_getchar_timeout+0xb4>
 5c4:	6803      	ldr	r3, [r0, #0]
 5c6:	695c      	ldr	r4, [r3, #20]
 5c8:	f014 0f1f 	tst.w	r4, #31
 5cc:	d1f6      	bne.n	5bc <drv_uart_getchar_timeout+0x8>
 5ce:	3a01      	subs	r2, #1
 5d0:	2a00      	cmp	r2, #0
 5d2:	d048      	beq.n	666 <drv_uart_getchar_timeout+0xb2>
 5d4:	6803      	ldr	r3, [r0, #0]
 5d6:	699d      	ldr	r5, [r3, #24]
 5d8:	691c      	ldr	r4, [r3, #16]
 5da:	f044 04c0 	orr.w	r4, r4, #192	; 0xc0
 5de:	611c      	str	r4, [r3, #16]
 5e0:	6803      	ldr	r3, [r0, #0]
 5e2:	2400      	movs	r4, #0
 5e4:	611c      	str	r4, [r3, #16]
 5e6:	b2ab      	uxth	r3, r5
 5e8:	f015 0f40 	tst.w	r5, #64	; 0x40
 5ec:	d001      	beq.n	5f2 <drv_uart_getchar_timeout+0x3e>
 5ee:	2401      	movs	r4, #1
 5f0:	7404      	strb	r4, [r0, #16]
 5f2:	f013 0f80 	tst.w	r3, #128	; 0x80
 5f6:	d001      	beq.n	5fc <drv_uart_getchar_timeout+0x48>
 5f8:	2302      	movs	r3, #2
 5fa:	7403      	strb	r3, [r0, #16]
 5fc:	7c03      	ldrb	r3, [r0, #16]
 5fe:	2b00      	cmp	r3, #0
 600:	d0e0      	beq.n	5c4 <drv_uart_getchar_timeout+0x10>
 602:	7a83      	ldrb	r3, [r0, #10]
 604:	2b01      	cmp	r3, #1
 606:	d0dd      	beq.n	5c4 <drv_uart_getchar_timeout+0x10>
 608:	2300      	movs	r3, #0
 60a:	7403      	strb	r3, [r0, #16]
 60c:	7483      	strb	r3, [r0, #18]
 60e:	74c3      	strb	r3, [r0, #19]
 610:	6804      	ldr	r4, [r0, #0]
 612:	6862      	ldr	r2, [r4, #4]
 614:	f442 7280 	orr.w	r2, r2, #256	; 0x100
 618:	6062      	str	r2, [r4, #4]
 61a:	6804      	ldr	r4, [r0, #0]
 61c:	6862      	ldr	r2, [r4, #4]
 61e:	f422 7280 	bic.w	r2, r2, #256	; 0x100
 622:	6062      	str	r2, [r4, #4]
 624:	6804      	ldr	r4, [r0, #0]
 626:	6862      	ldr	r2, [r4, #4]
 628:	f442 7200 	orr.w	r2, r2, #512	; 0x200
 62c:	6062      	str	r2, [r4, #4]
 62e:	6804      	ldr	r4, [r0, #0]
 630:	6862      	ldr	r2, [r4, #4]
 632:	f422 7200 	bic.w	r2, r2, #512	; 0x200
 636:	6062      	str	r2, [r4, #4]
 638:	6804      	ldr	r4, [r0, #0]
 63a:	6862      	ldr	r2, [r4, #4]
 63c:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 640:	6062      	str	r2, [r4, #4]
 642:	6804      	ldr	r4, [r0, #0]
 644:	6862      	ldr	r2, [r4, #4]
 646:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
 64a:	6062      	str	r2, [r4, #4]
 64c:	6804      	ldr	r4, [r0, #0]
 64e:	6862      	ldr	r2, [r4, #4]
 650:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
 654:	6062      	str	r2, [r4, #4]
 656:	6800      	ldr	r0, [r0, #0]
 658:	6842      	ldr	r2, [r0, #4]
 65a:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
 65e:	6042      	str	r2, [r0, #4]
 660:	700b      	strb	r3, [r1, #0]
 662:	2001      	movs	r0, #1
 664:	e000      	b.n	668 <drv_uart_getchar_timeout+0xb4>
 666:	2002      	movs	r0, #2
 668:	bc30      	pop	{r4, r5}
 66a:	4770      	bx	lr
 66c:	2002      	movs	r0, #2
 66e:	4770      	bx	lr

00000670 <uart_int_tx_done_callback>:
 670:	4770      	bx	lr

00000672 <uart_int_rx_stop_callback>:
 672:	4770      	bx	lr

00000674 <uart_int_rx_parity_error_callback>:
 674:	4770      	bx	lr

00000676 <uart_int_rx_noise_detect_callback>:
 676:	4770      	bx	lr

00000678 <uart_int_rx_stop_detect_callback>:
 678:	4770      	bx	lr

0000067a <uart_int_tx_fifo_empty_callback>:
 67a:	4770      	bx	lr

0000067c <uart_int_tx_fifo_thres_callback>:
 67c:	4770      	bx	lr

0000067e <uart_int_rx_fifo_noempty_callback>:
 67e:	4770      	bx	lr

00000680 <uart_int_rx_fifo_thres_callback>:
 680:	4770      	bx	lr

00000682 <drv_uart_interrupt_handler>:
 682:	b538      	push	{r3, r4, r5, lr}
 684:	4604      	mov	r4, r0
 686:	6803      	ldr	r3, [r0, #0]
 688:	699d      	ldr	r5, [r3, #24]
 68a:	68db      	ldr	r3, [r3, #12]
 68c:	b29b      	uxth	r3, r3
 68e:	401d      	ands	r5, r3
 690:	f415 7f80 	tst.w	r5, #256	; 0x100
 694:	d144      	bne.n	720 <drv_uart_interrupt_handler+0x9e>
 696:	f015 0f40 	tst.w	r5, #64	; 0x40
 69a:	d00f      	beq.n	6bc <drv_uart_interrupt_handler+0x3a>
 69c:	2301      	movs	r3, #1
 69e:	7423      	strb	r3, [r4, #16]
 6a0:	7aa3      	ldrb	r3, [r4, #10]
 6a2:	2b01      	cmp	r3, #1
 6a4:	d147      	bne.n	736 <drv_uart_interrupt_handler+0xb4>
 6a6:	4620      	mov	r0, r4
 6a8:	f7ff ffe3 	bl	672 <uart_int_rx_stop_callback>
 6ac:	6822      	ldr	r2, [r4, #0]
 6ae:	6913      	ldr	r3, [r2, #16]
 6b0:	f043 0340 	orr.w	r3, r3, #64	; 0x40
 6b4:	6113      	str	r3, [r2, #16]
 6b6:	6823      	ldr	r3, [r4, #0]
 6b8:	2200      	movs	r2, #0
 6ba:	611a      	str	r2, [r3, #16]
 6bc:	f015 0f80 	tst.w	r5, #128	; 0x80
 6c0:	d00f      	beq.n	6e2 <drv_uart_interrupt_handler+0x60>
 6c2:	2302      	movs	r3, #2
 6c4:	7423      	strb	r3, [r4, #16]
 6c6:	7aa3      	ldrb	r3, [r4, #10]
 6c8:	2b01      	cmp	r3, #1
 6ca:	d166      	bne.n	79a <drv_uart_interrupt_handler+0x118>
 6cc:	4620      	mov	r0, r4
 6ce:	f7ff ffd1 	bl	674 <uart_int_rx_parity_error_callback>
 6d2:	6822      	ldr	r2, [r4, #0]
 6d4:	6913      	ldr	r3, [r2, #16]
 6d6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
 6da:	6113      	str	r3, [r2, #16]
 6dc:	6823      	ldr	r3, [r4, #0]
 6de:	2200      	movs	r2, #0
 6e0:	611a      	str	r2, [r3, #16]
 6e2:	f015 0f20 	tst.w	r5, #32
 6e6:	f040 808a 	bne.w	7fe <drv_uart_interrupt_handler+0x17c>
 6ea:	f015 0f10 	tst.w	r5, #16
 6ee:	f040 8092 	bne.w	816 <drv_uart_interrupt_handler+0x194>
 6f2:	f015 0f01 	tst.w	r5, #1
 6f6:	f040 809a 	bne.w	82e <drv_uart_interrupt_handler+0x1ac>
 6fa:	f015 0f02 	tst.w	r5, #2
 6fe:	f040 80a2 	bne.w	846 <drv_uart_interrupt_handler+0x1c4>
 702:	f015 0f04 	tst.w	r5, #4
 706:	f000 80c1 	beq.w	88c <drv_uart_interrupt_handler+0x20a>
 70a:	7ce2      	ldrb	r2, [r4, #19]
 70c:	7e23      	ldrb	r3, [r4, #24]
 70e:	429a      	cmp	r2, r3
 710:	f0c0 80ac 	bcc.w	86c <drv_uart_interrupt_handler+0x1ea>
 714:	6822      	ldr	r2, [r4, #0]
 716:	68d3      	ldr	r3, [r2, #12]
 718:	f023 030c 	bic.w	r3, r3, #12
 71c:	60d3      	str	r3, [r2, #12]
 71e:	e0aa      	b.n	876 <drv_uart_interrupt_handler+0x1f4>
 720:	f7ff ffa6 	bl	670 <uart_int_tx_done_callback>
 724:	6822      	ldr	r2, [r4, #0]
 726:	6913      	ldr	r3, [r2, #16]
 728:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 72c:	6113      	str	r3, [r2, #16]
 72e:	6823      	ldr	r3, [r4, #0]
 730:	2200      	movs	r2, #0
 732:	611a      	str	r2, [r3, #16]
 734:	e7af      	b.n	696 <drv_uart_interrupt_handler+0x14>
 736:	6822      	ldr	r2, [r4, #0]
 738:	68d3      	ldr	r3, [r2, #12]
 73a:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 73e:	60d3      	str	r3, [r2, #12]
 740:	2300      	movs	r3, #0
 742:	7423      	strb	r3, [r4, #16]
 744:	74a3      	strb	r3, [r4, #18]
 746:	74e3      	strb	r3, [r4, #19]
 748:	6822      	ldr	r2, [r4, #0]
 74a:	6853      	ldr	r3, [r2, #4]
 74c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 750:	6053      	str	r3, [r2, #4]
 752:	6822      	ldr	r2, [r4, #0]
 754:	6853      	ldr	r3, [r2, #4]
 756:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 75a:	6053      	str	r3, [r2, #4]
 75c:	6822      	ldr	r2, [r4, #0]
 75e:	6853      	ldr	r3, [r2, #4]
 760:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 764:	6053      	str	r3, [r2, #4]
 766:	6822      	ldr	r2, [r4, #0]
 768:	6853      	ldr	r3, [r2, #4]
 76a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 76e:	6053      	str	r3, [r2, #4]
 770:	6822      	ldr	r2, [r4, #0]
 772:	6853      	ldr	r3, [r2, #4]
 774:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 778:	6053      	str	r3, [r2, #4]
 77a:	6822      	ldr	r2, [r4, #0]
 77c:	6853      	ldr	r3, [r2, #4]
 77e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 782:	6053      	str	r3, [r2, #4]
 784:	6822      	ldr	r2, [r4, #0]
 786:	6853      	ldr	r3, [r2, #4]
 788:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 78c:	6053      	str	r3, [r2, #4]
 78e:	6822      	ldr	r2, [r4, #0]
 790:	6853      	ldr	r3, [r2, #4]
 792:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 796:	6053      	str	r3, [r2, #4]
 798:	e785      	b.n	6a6 <drv_uart_interrupt_handler+0x24>
 79a:	6822      	ldr	r2, [r4, #0]
 79c:	68d3      	ldr	r3, [r2, #12]
 79e:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
 7a2:	60d3      	str	r3, [r2, #12]
 7a4:	2300      	movs	r3, #0
 7a6:	7423      	strb	r3, [r4, #16]
 7a8:	74a3      	strb	r3, [r4, #18]
 7aa:	74e3      	strb	r3, [r4, #19]
 7ac:	6822      	ldr	r2, [r4, #0]
 7ae:	6853      	ldr	r3, [r2, #4]
 7b0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 7b4:	6053      	str	r3, [r2, #4]
 7b6:	6822      	ldr	r2, [r4, #0]
 7b8:	6853      	ldr	r3, [r2, #4]
 7ba:	f423 7380 	bic.w	r3, r3, #256	; 0x100
 7be:	6053      	str	r3, [r2, #4]
 7c0:	6822      	ldr	r2, [r4, #0]
 7c2:	6853      	ldr	r3, [r2, #4]
 7c4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 7c8:	6053      	str	r3, [r2, #4]
 7ca:	6822      	ldr	r2, [r4, #0]
 7cc:	6853      	ldr	r3, [r2, #4]
 7ce:	f423 7300 	bic.w	r3, r3, #512	; 0x200
 7d2:	6053      	str	r3, [r2, #4]
 7d4:	6822      	ldr	r2, [r4, #0]
 7d6:	6853      	ldr	r3, [r2, #4]
 7d8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
 7dc:	6053      	str	r3, [r2, #4]
 7de:	6822      	ldr	r2, [r4, #0]
 7e0:	6853      	ldr	r3, [r2, #4]
 7e2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
 7e6:	6053      	str	r3, [r2, #4]
 7e8:	6822      	ldr	r2, [r4, #0]
 7ea:	6853      	ldr	r3, [r2, #4]
 7ec:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
 7f0:	6053      	str	r3, [r2, #4]
 7f2:	6822      	ldr	r2, [r4, #0]
 7f4:	6853      	ldr	r3, [r2, #4]
 7f6:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
 7fa:	6053      	str	r3, [r2, #4]
 7fc:	e766      	b.n	6cc <drv_uart_interrupt_handler+0x4a>
 7fe:	4620      	mov	r0, r4
 800:	f7ff ff39 	bl	676 <uart_int_rx_noise_detect_callback>
 804:	6822      	ldr	r2, [r4, #0]
 806:	6913      	ldr	r3, [r2, #16]
 808:	f043 0320 	orr.w	r3, r3, #32
 80c:	6113      	str	r3, [r2, #16]
 80e:	6823      	ldr	r3, [r4, #0]
 810:	2200      	movs	r2, #0
 812:	611a      	str	r2, [r3, #16]
 814:	e769      	b.n	6ea <drv_uart_interrupt_handler+0x68>
 816:	4620      	mov	r0, r4
 818:	f7ff ff2e 	bl	678 <uart_int_rx_stop_detect_callback>
 81c:	6822      	ldr	r2, [r4, #0]
 81e:	6913      	ldr	r3, [r2, #16]
 820:	f043 0310 	orr.w	r3, r3, #16
 824:	6113      	str	r3, [r2, #16]
 826:	6823      	ldr	r3, [r4, #0]
 828:	2200      	movs	r2, #0
 82a:	611a      	str	r2, [r3, #16]
 82c:	e761      	b.n	6f2 <drv_uart_interrupt_handler+0x70>
 82e:	4620      	mov	r0, r4
 830:	f7ff ff24 	bl	67c <uart_int_tx_fifo_thres_callback>
 834:	6822      	ldr	r2, [r4, #0]
 836:	6913      	ldr	r3, [r2, #16]
 838:	f043 0301 	orr.w	r3, r3, #1
 83c:	6113      	str	r3, [r2, #16]
 83e:	6823      	ldr	r3, [r4, #0]
 840:	2200      	movs	r2, #0
 842:	611a      	str	r2, [r3, #16]
 844:	e759      	b.n	6fa <drv_uart_interrupt_handler+0x78>
 846:	4620      	mov	r0, r4
 848:	f7ff ff17 	bl	67a <uart_int_tx_fifo_empty_callback>
 84c:	6822      	ldr	r2, [r4, #0]
 84e:	6913      	ldr	r3, [r2, #16]
 850:	f043 0302 	orr.w	r3, r3, #2
 854:	6113      	str	r3, [r2, #16]
 856:	6823      	ldr	r3, [r4, #0]
 858:	2200      	movs	r2, #0
 85a:	611a      	str	r2, [r3, #16]
 85c:	e751      	b.n	702 <drv_uart_interrupt_handler+0x80>
 85e:	69d9      	ldr	r1, [r3, #28]
 860:	6962      	ldr	r2, [r4, #20]
 862:	7ce3      	ldrb	r3, [r4, #19]
 864:	1c58      	adds	r0, r3, #1
 866:	74e0      	strb	r0, [r4, #19]
 868:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 86c:	6823      	ldr	r3, [r4, #0]
 86e:	695a      	ldr	r2, [r3, #20]
 870:	f012 0f1f 	tst.w	r2, #31
 874:	d1f3      	bne.n	85e <drv_uart_interrupt_handler+0x1dc>
 876:	4620      	mov	r0, r4
 878:	f7ff ff02 	bl	680 <uart_int_rx_fifo_thres_callback>
 87c:	6822      	ldr	r2, [r4, #0]
 87e:	6913      	ldr	r3, [r2, #16]
 880:	f043 0304 	orr.w	r3, r3, #4
 884:	6113      	str	r3, [r2, #16]
 886:	6823      	ldr	r3, [r4, #0]
 888:	2200      	movs	r2, #0
 88a:	611a      	str	r2, [r3, #16]
 88c:	f015 0f08 	tst.w	r5, #8
 890:	d020      	beq.n	8d4 <drv_uart_interrupt_handler+0x252>
 892:	7ce2      	ldrb	r2, [r4, #19]
 894:	7e23      	ldrb	r3, [r4, #24]
 896:	429a      	cmp	r2, r3
 898:	d30c      	bcc.n	8b4 <drv_uart_interrupt_handler+0x232>
 89a:	6822      	ldr	r2, [r4, #0]
 89c:	68d3      	ldr	r3, [r2, #12]
 89e:	f023 030c 	bic.w	r3, r3, #12
 8a2:	60d3      	str	r3, [r2, #12]
 8a4:	e00b      	b.n	8be <drv_uart_interrupt_handler+0x23c>
 8a6:	69d9      	ldr	r1, [r3, #28]
 8a8:	6962      	ldr	r2, [r4, #20]
 8aa:	7ce3      	ldrb	r3, [r4, #19]
 8ac:	1c58      	adds	r0, r3, #1
 8ae:	74e0      	strb	r0, [r4, #19]
 8b0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8b4:	6823      	ldr	r3, [r4, #0]
 8b6:	695a      	ldr	r2, [r3, #20]
 8b8:	f012 0f1f 	tst.w	r2, #31
 8bc:	d1f3      	bne.n	8a6 <drv_uart_interrupt_handler+0x224>
 8be:	4620      	mov	r0, r4
 8c0:	f7ff fedd 	bl	67e <uart_int_rx_fifo_noempty_callback>
 8c4:	6822      	ldr	r2, [r4, #0]
 8c6:	6913      	ldr	r3, [r2, #16]
 8c8:	f043 0308 	orr.w	r3, r3, #8
 8cc:	6113      	str	r3, [r2, #16]
 8ce:	6823      	ldr	r3, [r4, #0]
 8d0:	2200      	movs	r2, #0
 8d2:	611a      	str	r2, [r3, #16]
 8d4:	bd38      	pop	{r3, r4, r5, pc}
	...

000008d8 <NMI_Handler>:
 8d8:	b508      	push	{r3, lr}
 8da:	4802      	ldr	r0, [pc, #8]	; (8e4 <NMI_Handler+0xc>)
 8dc:	f000 f8b2 	bl	a44 <test_printf_s>
 8e0:	bd08      	pop	{r3, pc}
 8e2:	bf00      	nop
 8e4:	00000aa0 	andeq	r0, r0, r0, lsr #21

000008e8 <HardFault_Handler>:
 8e8:	e7fe      	b.n	8e8 <HardFault_Handler>

000008ea <MemManage_Handler>:
 8ea:	e7fe      	b.n	8ea <MemManage_Handler>

000008ec <BusFault_Handler>:
 8ec:	e7fe      	b.n	8ec <BusFault_Handler>

000008ee <UsageFault_Handler>:
 8ee:	e7fe      	b.n	8ee <UsageFault_Handler>

000008f0 <SVC_Handler>:
 8f0:	4770      	bx	lr

000008f2 <DebugMon_Handler>:
 8f2:	4770      	bx	lr

000008f4 <PendSV_Handler>:
 8f4:	4770      	bx	lr

000008f6 <SysTick_Handler>:
 8f6:	4770      	bx	lr

000008f8 <Uart0_Handler>:
 8f8:	b508      	push	{r3, lr}
 8fa:	4b04      	ldr	r3, [pc, #16]	; (90c <Uart0_Handler+0x14>)
 8fc:	2201      	movs	r2, #1
 8fe:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 902:	4803      	ldr	r0, [pc, #12]	; (910 <Uart0_Handler+0x18>)
 904:	f7ff febd 	bl	682 <drv_uart_interrupt_handler>
 908:	bd08      	pop	{r3, pc}
 90a:	bf00      	nop
 90c:	e000e100 	and	lr, r0, r0, lsl #2
 910:	000200fc 	strdeq	r0, [r2], -ip

00000914 <AdvtimGen_Handler>:
 914:	b508      	push	{r3, lr}
 916:	4b04      	ldr	r3, [pc, #16]	; (928 <AdvtimGen_Handler+0x14>)
 918:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 91c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 920:	4802      	ldr	r0, [pc, #8]	; (92c <AdvtimGen_Handler+0x18>)
 922:	f7ff fd88 	bl	436 <drv_advtim_gen_interrupt_handler>
 926:	bd08      	pop	{r3, pc}
 928:	e000e100 	and	lr, r0, r0, lsl #2
 92c:	00020084 	andeq	r0, r2, r4, lsl #1

00000930 <AdvtimCap_Handler>:
 930:	b508      	push	{r3, lr}
 932:	4b04      	ldr	r3, [pc, #16]	; (944 <AdvtimCap_Handler+0x14>)
 934:	f44f 3200 	mov.w	r2, #131072	; 0x20000
 938:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 93c:	4802      	ldr	r0, [pc, #8]	; (948 <AdvtimCap_Handler+0x18>)
 93e:	f7ff fce1 	bl	304 <drv_advtim_cap_interrupt_handler>
 942:	bd08      	pop	{r3, pc}
 944:	e000e100 	and	lr, r0, r0, lsl #2
 948:	00020084 	andeq	r0, r2, r4, lsl #1

0000094c <AdvtimEnc_Handler>:
 94c:	b508      	push	{r3, lr}
 94e:	4b04      	ldr	r3, [pc, #16]	; (960 <AdvtimEnc_Handler+0x14>)
 950:	f44f 2280 	mov.w	r2, #262144	; 0x40000
 954:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
 958:	4802      	ldr	r0, [pc, #8]	; (964 <AdvtimEnc_Handler+0x18>)
 95a:	f7ff fd40 	bl	3de <drv_advtim_enc_interrupt_handler>
 95e:	bd08      	pop	{r3, pc}
 960:	e000e100 	and	lr, r0, r0, lsl #2
 964:	00020084 	andeq	r0, r2, r4, lsl #1

00000968 <main>:
 968:	b508      	push	{r3, lr}
 96a:	f000 f85b 	bl	a24 <uart0_init>
 96e:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
 972:	23bd      	movs	r3, #189	; 0xbd
 974:	60a3      	str	r3, [r4, #8]
 976:	f7ff fbd3 	bl	120 <advtim_ch1_encoder_direct_both_edge_on_test>
 97a:	23ed      	movs	r3, #237	; 0xed
 97c:	60a3      	str	r3, [r4, #8]
 97e:	e7fe      	b.n	97e <main+0x16>

00000980 <exit_current_test_loop>:
 980:	b500      	push	{lr}
 982:	b083      	sub	sp, #12
 984:	4a07      	ldr	r2, [pc, #28]	; (9a4 <exit_current_test_loop+0x24>)
 986:	f10d 0107 	add.w	r1, sp, #7
 98a:	4807      	ldr	r0, [pc, #28]	; (9a8 <exit_current_test_loop+0x28>)
 98c:	f7ff fe12 	bl	5b4 <drv_uart_getchar_timeout>
 990:	2800      	cmp	r0, #0
 992:	d1f7      	bne.n	984 <exit_current_test_loop+0x4>
 994:	f89d 3007 	ldrb.w	r3, [sp, #7]
 998:	2b51      	cmp	r3, #81	; 0x51
 99a:	d1f3      	bne.n	984 <exit_current_test_loop+0x4>
 99c:	b003      	add	sp, #12
 99e:	f85d fb04 	ldr.w	pc, [sp], #4
 9a2:	bf00      	nop
 9a4:	0003d090 	muleq	r3, r0, r0
 9a8:	000200fc 	strdeq	r0, [r2], -ip

000009ac <Reset_Handler>:
 9ac:	490a      	ldr	r1, [pc, #40]	; (9d8 <Reset_Handler+0x2c>)
 9ae:	4a0b      	ldr	r2, [pc, #44]	; (9dc <Reset_Handler+0x30>)
 9b0:	4b0b      	ldr	r3, [pc, #44]	; (9e0 <Reset_Handler+0x34>)
 9b2:	1a9b      	subs	r3, r3, r2
 9b4:	dd03      	ble.n	9be <Reset_Handler+0x12>
 9b6:	3b04      	subs	r3, #4
 9b8:	58c8      	ldr	r0, [r1, r3]
 9ba:	50d0      	str	r0, [r2, r3]
 9bc:	dcfb      	bgt.n	9b6 <Reset_Handler+0xa>
 9be:	4909      	ldr	r1, [pc, #36]	; (9e4 <Reset_Handler+0x38>)
 9c0:	4a09      	ldr	r2, [pc, #36]	; (9e8 <Reset_Handler+0x3c>)
 9c2:	2000      	movs	r0, #0
 9c4:	4291      	cmp	r1, r2
 9c6:	bfbc      	itt	lt
 9c8:	f841 0b04 	strlt.w	r0, [r1], #4
 9cc:	e7fa      	blt.n	9c4 <Reset_Handler+0x18>
 9ce:	f7ff ffcb 	bl	968 <main>
 9d2:	f000 f839 	bl	a48 <exit>
 9d6:	0aac0000 	beq	feb009de <__StackTop+0xfeade9de>
 9da:	00000000 	andeq	r0, r0, r0
 9de:	00680002 	rsbeq	r0, r8, r2
 9e2:	00680002 	rsbeq	r0, r8, r2
 9e6:	01180002 	tsteq	r8, r2
 9ea:	e7fe0002 	ldrb	r0, [lr, r2]!
 9ee:	e7fe      	b.n	9ee <Reset_Handler+0x42>
 9f0:	e7fe      	b.n	9f0 <Reset_Handler+0x44>
 9f2:	e7fe      	b.n	9f2 <Reset_Handler+0x46>
 9f4:	e7fe      	b.n	9f4 <Reset_Handler+0x48>
 9f6:	e7fe      	b.n	9f6 <Reset_Handler+0x4a>
 9f8:	e7fe      	b.n	9f8 <Reset_Handler+0x4c>
 9fa:	e7fe      	b.n	9fa <Reset_Handler+0x4e>
 9fc:	e7fe      	b.n	9fc <Reset_Handler+0x50>
 9fe:	e7fe      	b.n	9fe <Reset_Handler+0x52>

00000a00 <Uart1_Handler>:
 a00:	e7fe      	b.n	a00 <Uart1_Handler>

00000a02 <Resv2_Handler>:
 a02:	e7fe      	b.n	a02 <Resv2_Handler>

00000a04 <Resv3_Handler>:
 a04:	e7fe      	b.n	a04 <Resv3_Handler>

00000a06 <EthDma_Handler>:
 a06:	e7fe      	b.n	a06 <EthDma_Handler>

00000a08 <Gpioa_Handler>:
 a08:	e7fe      	b.n	a08 <Gpioa_Handler>

00000a0a <Resv6_Handler>:
 a0a:	e7fe      	b.n	a0a <Resv6_Handler>

00000a0c <Resv7_Handler>:
 a0c:	e7fe      	b.n	a0c <Resv7_Handler>

00000a0e <Bastim_Ch0_Handler>:
 a0e:	e7fe      	b.n	a0e <Bastim_Ch0_Handler>

00000a10 <Bastim_Ch1_Handler>:
 a10:	e7fe      	b.n	a10 <Bastim_Ch1_Handler>

00000a12 <Bastim_Ch2_Handler>:
 a12:	e7fe      	b.n	a12 <Bastim_Ch2_Handler>

00000a14 <Bastim_Ch3_Handler>:
 a14:	e7fe      	b.n	a14 <Bastim_Ch3_Handler>

00000a16 <EthSma_Handler>:
 a16:	e7fe      	b.n	a16 <EthSma_Handler>

00000a18 <EthTx_Handler>:
 a18:	e7fe      	b.n	a18 <EthTx_Handler>

00000a1a <EthRx_Handler>:
 a1a:	e7fe      	b.n	a1a <EthRx_Handler>

00000a1c <Resv15_Handler>:
 a1c:	e7fe      	b.n	a1c <Resv15_Handler>
 a1e:	e7fe      	b.n	a1e <Resv15_Handler+0x2>
 a20:	e7fe      	b.n	a20 <Resv15_Handler+0x4>
 a22:	e7fe      	b.n	a22 <Resv15_Handler+0x6>

00000a24 <uart0_init>:
 a24:	b510      	push	{r4, lr}
 a26:	4c05      	ldr	r4, [pc, #20]	; (a3c <uart0_init+0x18>)
 a28:	4b05      	ldr	r3, [pc, #20]	; (a40 <uart0_init+0x1c>)
 a2a:	6023      	str	r3, [r4, #0]
 a2c:	4620      	mov	r0, r4
 a2e:	f7ff fd47 	bl	4c0 <drv_uart_default_config>
 a32:	4620      	mov	r0, r4
 a34:	f7ff fd76 	bl	524 <drv_uart_init>
 a38:	bd10      	pop	{r4, pc}
 a3a:	bf00      	nop
 a3c:	000200fc 	strdeq	r0, [r2], -ip
 a40:	40001000 	andmi	r1, r0, r0

00000a44 <test_printf_s>:
 a44:	4770      	bx	lr
	...

00000a48 <exit>:
 a48:	b508      	push	{r3, lr}
 a4a:	4b07      	ldr	r3, [pc, #28]	; (a68 <exit+0x20>)
 a4c:	4604      	mov	r4, r0
 a4e:	b113      	cbz	r3, a56 <exit+0xe>
 a50:	2100      	movs	r1, #0
 a52:	f3af 8000 	nop.w
 a56:	4b05      	ldr	r3, [pc, #20]	; (a6c <exit+0x24>)
 a58:	6818      	ldr	r0, [r3, #0]
 a5a:	6a83      	ldr	r3, [r0, #40]	; 0x28
 a5c:	b103      	cbz	r3, a60 <exit+0x18>
 a5e:	4798      	blx	r3
 a60:	4620      	mov	r0, r4
 a62:	f000 f805 	bl	a70 <_exit>
 a66:	bf00      	nop
 a68:	00000000 	andeq	r0, r0, r0
 a6c:	00000aa4 	andeq	r0, r0, r4, lsr #21

00000a70 <_exit>:
 a70:	e7fe      	b.n	a70 <_exit>
 a72:	bf00      	nop

00000a74 <_init>:
 a74:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 a76:	bf00      	nop
 a78:	bcf8      	pop	{r3, r4, r5, r6, r7}
 a7a:	bc08      	pop	{r3}
 a7c:	469e      	mov	lr, r3
 a7e:	4770      	bx	lr

00000a80 <_fini>:
 a80:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 a82:	bf00      	nop
 a84:	bcf8      	pop	{r3, r4, r5, r6, r7}
 a86:	bc08      	pop	{r3}
 a88:	469e      	mov	lr, r3
 a8a:	4770      	bx	lr
 a8c:	6c756146 	ldfvse	f6, [r5], #-280	; 0xfffffee8
 a90:	65642074 	strbvs	r2, [r4, #-116]!	; 0xffffff8c
 a94:	74636574 	strbtvc	r6, [r3], #-1396	; 0xfffffa8c
 a98:	0d216465 	cfstrseq	mvf6, [r1, #-404]!	; 0xfffffe6c
 a9c:	0000000a 	andeq	r0, r0, sl
 aa0:	00494d4e 	subeq	r4, r9, lr, asr #26

00000aa4 <_global_impure_ptr>:
 aa4:	00020000 	andeq	r0, r2, r0

00000aa8 <__EH_FRAME_BEGIN__>:
 aa8:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <impure_data>:
	...

00020060 <__frame_dummy_init_array_entry>:
   20060:	000000b1 	strheq	r0, [r0], -r1

00020064 <__do_global_dtors_aux_fini_array_entry>:
   20064:	0000008d 	andeq	r0, r0, sp, lsl #1

Disassembly of section .bss:

00020068 <__bss_start__>:
   20068:	00000000 	andeq	r0, r0, r0

0002006c <object.0>:
	...

00020084 <hadvtim>:
	...

000200f4 <advtim_case_flag>:
	...

000200f6 <advtim_int_flag>:
	...

000200f8 <advtim_int_flag2>:
	...

000200f9 <advtim_int_flag3>:
	...

000200fa <advtim_temp>:
	...

000200fc <huart0>:
	...

Disassembly of section .stack_dummy:

00020118 <__HeapBase>:
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
  18:	00000a48 	andeq	r0, r0, r8, asr #20
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	0000000c 	andeq	r0, r0, ip
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00000a70 	andeq	r0, r0, r0, ror sl
  44:	00000002 	andeq	r0, r0, r2

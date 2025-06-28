
dc_motor_6612.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	000010c1 	andeq	r1, r0, r1, asr #1
       8:	00000e41 	andeq	r0, r0, r1, asr #28
       c:	00000e51 	andeq	r0, r0, r1, asr lr
      10:	00000e53 	andeq	r0, r0, r3, asr lr
      14:	00000e55 	andeq	r0, r0, r5, asr lr
      18:	00000e57 	andeq	r0, r0, r7, asr lr
	...
      2c:	00000e59 	andeq	r0, r0, r9, asr lr
      30:	00000e5b 	andeq	r0, r0, fp, asr lr
      34:	00000000 	andeq	r0, r0, r0
      38:	00000e5d 	andeq	r0, r0, sp, asr lr
      3c:	00000e5f 	andeq	r0, r0, pc, asr lr
      40:	00000e61 	andeq	r0, r0, r1, ror #28
      44:	00001115 	andeq	r1, r0, r5, lsl r1
      48:	00001117 	andeq	r1, r0, r7, lsl r1
      4c:	00001119 	andeq	r1, r0, r9, lsl r1
      50:	0000111b 	andeq	r1, r0, fp, lsl r1
      54:	0000111d 	andeq	r1, r0, sp, lsl r1
      58:	0000111f 	andeq	r1, r0, pc, lsl r1
      5c:	00001121 	andeq	r1, r0, r1, lsr #2
      60:	00001123 	andeq	r1, r0, r3, lsr #2
      64:	00001125 	andeq	r1, r0, r5, lsr #2
      68:	00001127 	andeq	r1, r0, r7, lsr #2
      6c:	00001129 	andeq	r1, r0, r9, lsr #2
      70:	0000112b 	andeq	r1, r0, fp, lsr #2
      74:	0000112d 	andeq	r1, r0, sp, lsr #2
      78:	0000112f 	andeq	r1, r0, pc, lsr #2
      7c:	00001131 	andeq	r1, r0, r1, lsr r1
      80:	000010a5 	andeq	r1, r0, r5, lsr #1
      84:	00001135 	andeq	r1, r0, r5, lsr r1
      88:	00000e25 	andeq	r0, r0, r5, lsr #28

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
      a4:	00020314 	andeq	r0, r2, r4, lsl r3
      a8:	00000000 	andeq	r0, r0, r0
      ac:	00002a90 	muleq	r0, r0, sl

000000b0 <frame_dummy>:
      b0:	b508      	push	{r3, lr}
      b2:	4b03      	ldr	r3, [pc, #12]	; (c0 <frame_dummy+0x10>)
      b4:	b11b      	cbz	r3, be <frame_dummy+0xe>
      b6:	4903      	ldr	r1, [pc, #12]	; (c4 <frame_dummy+0x14>)
      b8:	4803      	ldr	r0, [pc, #12]	; (c8 <frame_dummy+0x18>)
      ba:	f3af 8000 	nop.w
      be:	bd08      	pop	{r3, pc}
      c0:	00000000 	andeq	r0, r0, r0
      c4:	00020318 	andeq	r0, r2, r8, lsl r3
      c8:	00002a90 	muleq	r0, r0, sl

000000cc <advtim_init>:
      cc:	b538      	push	{r3, r4, r5, lr}
      ce:	4c33      	ldr	r4, [pc, #204]	; (19c <advtim_init+0xd0>)
      d0:	4a33      	ldr	r2, [pc, #204]	; (1a0 <advtim_init+0xd4>)
      d2:	6022      	str	r2, [r4, #0]
      d4:	2302      	movs	r3, #2
      d6:	80a3      	strh	r3, [r4, #4]
      d8:	f44f 617a 	mov.w	r1, #4000	; 0xfa0
      dc:	80e1      	strh	r1, [r4, #6]
      de:	2500      	movs	r5, #0
      e0:	8125      	strh	r5, [r4, #8]
      e2:	72a5      	strb	r5, [r4, #10]
      e4:	72e5      	strb	r5, [r4, #11]
      e6:	2348      	movs	r3, #72	; 0x48
      e8:	81a3      	strh	r3, [r4, #12]
      ea:	2301      	movs	r3, #1
      ec:	75e3      	strb	r3, [r4, #23]
      ee:	7623      	strb	r3, [r4, #24]
      f0:	7665      	strb	r5, [r4, #25]
      f2:	76a3      	strb	r3, [r4, #26]
      f4:	2007      	movs	r0, #7
      f6:	73a0      	strb	r0, [r4, #14]
      f8:	7425      	strb	r5, [r4, #16]
      fa:	7465      	strb	r5, [r4, #17]
      fc:	83a1      	strh	r1, [r4, #28]
      fe:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
     102:	f884 5028 	strb.w	r5, [r4, #40]	; 0x28
     106:	f884 3022 	strb.w	r3, [r4, #34]	; 0x22
     10a:	f884 5020 	strb.w	r5, [r4, #32]
     10e:	85a1      	strh	r1, [r4, #44]	; 0x2c
     110:	f884 3037 	strb.w	r3, [r4, #55]	; 0x37
     114:	f884 5038 	strb.w	r5, [r4, #56]	; 0x38
     118:	f884 3032 	strb.w	r3, [r4, #50]	; 0x32
     11c:	f884 5030 	strb.w	r5, [r4, #48]	; 0x30
     120:	2104      	movs	r1, #4
     122:	f8a4 104e 	strh.w	r1, [r4, #78]	; 0x4e
     126:	75a5      	strb	r5, [r4, #22]
     128:	f884 1050 	strb.w	r1, [r4, #80]	; 0x50
     12c:	f884 3051 	strb.w	r3, [r4, #81]	; 0x51
     130:	f884 3052 	strb.w	r3, [r4, #82]	; 0x52
     134:	f884 5053 	strb.w	r5, [r4, #83]	; 0x53
     138:	f884 5054 	strb.w	r5, [r4, #84]	; 0x54
     13c:	4919      	ldr	r1, [pc, #100]	; (1a4 <advtim_init+0xd8>)
     13e:	6661      	str	r1, [r4, #100]	; 0x64
     140:	2108      	movs	r1, #8
     142:	f884 1068 	strb.w	r1, [r4, #104]	; 0x68
     146:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
     14a:	f884 306a 	strb.w	r3, [r4, #106]	; 0x6a
     14e:	f884 306b 	strb.w	r3, [r4, #107]	; 0x6b
     152:	f884 306c 	strb.w	r3, [r4, #108]	; 0x6c
     156:	f884 306d 	strb.w	r3, [r4, #109]	; 0x6d
     15a:	6813      	ldr	r3, [r2, #0]
     15c:	f043 0302 	orr.w	r3, r3, #2
     160:	6013      	str	r3, [r2, #0]
     162:	4620      	mov	r0, r4
     164:	f000 fb62 	bl	82c <drv_advtim_gen_init>
     168:	4620      	mov	r0, r4
     16a:	f000 f9e4 	bl	536 <drv_advtim_enc_init>
     16e:	6822      	ldr	r2, [r4, #0]
     170:	6813      	ldr	r3, [r2, #0]
     172:	f043 0301 	orr.w	r3, r3, #1
     176:	6013      	str	r3, [r2, #0]
     178:	6822      	ldr	r2, [r4, #0]
     17a:	6813      	ldr	r3, [r2, #0]
     17c:	f023 0301 	bic.w	r3, r3, #1
     180:	6013      	str	r3, [r2, #0]
     182:	4b09      	ldr	r3, [pc, #36]	; (1a8 <advtim_init+0xdc>)
     184:	f883 5310 	strb.w	r5, [r3, #784]	; 0x310
     188:	f883 5312 	strb.w	r5, [r3, #786]	; 0x312
     18c:	f44f 3280 	mov.w	r2, #65536	; 0x10000
     190:	601a      	str	r2, [r3, #0]
     192:	f44f 2280 	mov.w	r2, #262144	; 0x40000
     196:	601a      	str	r2, [r3, #0]
     198:	bd38      	pop	{r3, r4, r5, pc}
     19a:	bf00      	nop
     19c:	00020330 	andeq	r0, r2, r0, lsr r3
     1a0:	40021000 	andmi	r1, r2, r0
     1a4:	003d0900 	eorseq	r0, sp, r0, lsl #18
     1a8:	e000e100 	and	lr, r0, r0, lsl #2

000001ac <dcm_actutor_enable>:
     1ac:	b508      	push	{r3, lr}
     1ae:	f000 ff1b 	bl	fe8 <dcm_pwm_enable>
     1b2:	bd08      	pop	{r3, pc}

000001b4 <dcm_actutor_disable>:
     1b4:	b508      	push	{r3, lr}
     1b6:	f000 fef9 	bl	fac <dcm_pwm_disable>
     1ba:	bd08      	pop	{r3, pc}

000001bc <dcm_actutor_speed_set>:
     1bc:	b510      	push	{r4, lr}
     1be:	4604      	mov	r4, r0
     1c0:	4b06      	ldr	r3, [pc, #24]	; (1dc <dcm_actutor_speed_set+0x20>)
     1c2:	60d8      	str	r0, [r3, #12]
     1c4:	2100      	movs	r1, #0
     1c6:	f001 fe99 	bl	1efc <__aeabi_fcmplt>
     1ca:	b918      	cbnz	r0, 1d4 <dcm_actutor_speed_set+0x18>
     1cc:	4620      	mov	r0, r4
     1ce:	f000 ff21 	bl	1014 <dcm_pwm_set>
     1d2:	bd10      	pop	{r4, pc}
     1d4:	f104 4400 	add.w	r4, r4, #2147483648	; 0x80000000
     1d8:	e7f8      	b.n	1cc <dcm_actutor_speed_set+0x10>
     1da:	bf00      	nop
     1dc:	000203a0 	andeq	r0, r2, r0, lsr #7

000001e0 <dcm_actutor_dir_set>:
     1e0:	b508      	push	{r3, lr}
     1e2:	f000 ff33 	bl	104c <dcm_dir_set>
     1e6:	bd08      	pop	{r3, pc}

000001e8 <dcm_speed_loop>:
     1e8:	b510      	push	{r4, lr}
     1ea:	4b15      	ldr	r3, [pc, #84]	; (240 <Stack_Size+0x40>)
     1ec:	689c      	ldr	r4, [r3, #8]
     1ee:	2100      	movs	r1, #0
     1f0:	4620      	mov	r0, r4
     1f2:	f001 fe83 	bl	1efc <__aeabi_fcmplt>
     1f6:	b990      	cbnz	r0, 21e <Stack_Size+0x1e>
     1f8:	4912      	ldr	r1, [pc, #72]	; (244 <Stack_Size+0x44>)
     1fa:	4620      	mov	r0, r4
     1fc:	f001 fe9c 	bl	1f38 <__aeabi_fcmpgt>
     200:	b100      	cbz	r0, 204 <Stack_Size+0x4>
     202:	4c10      	ldr	r4, [pc, #64]	; (244 <Stack_Size+0x44>)
     204:	4910      	ldr	r1, [pc, #64]	; (248 <Stack_Size+0x48>)
     206:	4620      	mov	r0, r4
     208:	f001 fe78 	bl	1efc <__aeabi_fcmplt>
     20c:	b100      	cbz	r0, 210 <Stack_Size+0x10>
     20e:	4c0e      	ldr	r4, [pc, #56]	; (248 <Stack_Size+0x48>)
     210:	2000      	movs	r0, #0
     212:	f000 ff1b 	bl	104c <dcm_dir_set>
     216:	4620      	mov	r0, r4
     218:	f7ff ffd0 	bl	1bc <dcm_actutor_speed_set>
     21c:	bd10      	pop	{r4, pc}
     21e:	490b      	ldr	r1, [pc, #44]	; (24c <Stack_Size+0x4c>)
     220:	4620      	mov	r0, r4
     222:	f001 fe6b 	bl	1efc <__aeabi_fcmplt>
     226:	b100      	cbz	r0, 22a <Stack_Size+0x2a>
     228:	4c08      	ldr	r4, [pc, #32]	; (24c <Stack_Size+0x4c>)
     22a:	4909      	ldr	r1, [pc, #36]	; (250 <Stack_Size+0x50>)
     22c:	4620      	mov	r0, r4
     22e:	f001 fe83 	bl	1f38 <__aeabi_fcmpgt>
     232:	b100      	cbz	r0, 236 <Stack_Size+0x36>
     234:	4c06      	ldr	r4, [pc, #24]	; (250 <Stack_Size+0x50>)
     236:	2001      	movs	r0, #1
     238:	f000 ff08 	bl	104c <dcm_dir_set>
     23c:	e7eb      	b.n	216 <Stack_Size+0x16>
     23e:	bf00      	nop
     240:	000203a0 	andeq	r0, r2, r0, lsr #7
     244:	459c4000 	ldrmi	r4, [ip]
     248:	42c80000 	sbcmi	r0, r8, #0
     24c:	c59c4000 	ldrgt	r4, [ip]
     250:	c2c80000 	sbcgt	r0, r8, #0

00000254 <dcm_para_reset>:
     254:	4b09      	ldr	r3, [pc, #36]	; (27c <dcm_para_reset+0x28>)
     256:	2200      	movs	r2, #0
     258:	709a      	strb	r2, [r3, #2]
     25a:	705a      	strb	r2, [r3, #1]
     25c:	f8c3 20ac 	str.w	r2, [r3, #172]	; 0xac
     260:	2100      	movs	r1, #0
     262:	60d9      	str	r1, [r3, #12]
     264:	821a      	strh	r2, [r3, #16]
     266:	f8c3 1090 	str.w	r1, [r3, #144]	; 0x90
     26a:	f883 2098 	strb.w	r2, [r3, #152]	; 0x98
     26e:	f8c3 209c 	str.w	r2, [r3, #156]	; 0x9c
     272:	f8c3 20a0 	str.w	r2, [r3, #160]	; 0xa0
     276:	f8c3 10a4 	str.w	r1, [r3, #164]	; 0xa4
     27a:	4770      	bx	lr
     27c:	000203a0 	andeq	r0, r2, r0, lsr #7

00000280 <dcm_system_init>:
     280:	b508      	push	{r3, lr}
     282:	f7ff ffe7 	bl	254 <dcm_para_reset>
     286:	f7ff ff21 	bl	cc <advtim_init>
     28a:	4b04      	ldr	r3, [pc, #16]	; (29c <dcm_system_init+0x1c>)
     28c:	4a04      	ldr	r2, [pc, #16]	; (2a0 <dcm_system_init+0x20>)
     28e:	609a      	str	r2, [r3, #8]
     290:	2201      	movs	r2, #1
     292:	70da      	strb	r2, [r3, #3]
     294:	2200      	movs	r2, #0
     296:	701a      	strb	r2, [r3, #0]
     298:	bd08      	pop	{r3, pc}
     29a:	bf00      	nop
     29c:	000203a0 	andeq	r0, r2, r0, lsr #7
     2a0:	43480000 	movtmi	r0, #32768	; 0x8000

000002a4 <dcm_system_enable>:
     2a4:	b510      	push	{r4, lr}
     2a6:	4c0e      	ldr	r4, [pc, #56]	; (2e0 <dcm_system_enable+0x3c>)
     2a8:	68a0      	ldr	r0, [r4, #8]
     2aa:	f7ff ff87 	bl	1bc <dcm_actutor_speed_set>
     2ae:	78e0      	ldrb	r0, [r4, #3]
     2b0:	f7ff ff96 	bl	1e0 <dcm_actutor_dir_set>
     2b4:	4a0b      	ldr	r2, [pc, #44]	; (2e4 <dcm_system_enable+0x40>)
     2b6:	6811      	ldr	r1, [r2, #0]
     2b8:	680b      	ldr	r3, [r1, #0]
     2ba:	f043 0301 	orr.w	r3, r3, #1
     2be:	600b      	str	r3, [r1, #0]
     2c0:	6812      	ldr	r2, [r2, #0]
     2c2:	6813      	ldr	r3, [r2, #0]
     2c4:	f023 0301 	bic.w	r3, r3, #1
     2c8:	6013      	str	r3, [r2, #0]
     2ca:	2301      	movs	r3, #1
     2cc:	70a3      	strb	r3, [r4, #2]
     2ce:	7063      	strb	r3, [r4, #1]
     2d0:	2300      	movs	r3, #0
     2d2:	7023      	strb	r3, [r4, #0]
     2d4:	f7ff ff6a 	bl	1ac <dcm_actutor_enable>
     2d8:	f000 f8bc 	bl	454 <dcm_feedback_enable>
     2dc:	bd10      	pop	{r4, pc}
     2de:	bf00      	nop
     2e0:	000203a0 	andeq	r0, r2, r0, lsr #7
     2e4:	00020330 	andeq	r0, r2, r0, lsr r3

000002e8 <dcm_system_disable>:
     2e8:	b508      	push	{r3, lr}
     2ea:	f7ff ff63 	bl	1b4 <dcm_actutor_disable>
     2ee:	f000 f8b5 	bl	45c <dcm_feedback_disable>
     2f2:	f7ff ffaf 	bl	254 <dcm_para_reset>
     2f6:	bd08      	pop	{r3, pc}

000002f8 <dcm_show_status>:
     2f8:	b510      	push	{r4, lr}
     2fa:	4c0e      	ldr	r4, [pc, #56]	; (334 <dcm_show_status+0x3c>)
     2fc:	78a1      	ldrb	r1, [r4, #2]
     2fe:	480e      	ldr	r0, [pc, #56]	; (338 <dcm_show_status+0x40>)
     300:	f000 ff2e 	bl	1160 <test_printf_ch>
     304:	68a0      	ldr	r0, [r4, #8]
     306:	f001 fe21 	bl	1f4c <__aeabi_f2uiz>
     30a:	4601      	mov	r1, r0
     30c:	480b      	ldr	r0, [pc, #44]	; (33c <dcm_show_status+0x44>)
     30e:	f000 ff27 	bl	1160 <test_printf_ch>
     312:	f8d4 0090 	ldr.w	r0, [r4, #144]	; 0x90
     316:	f001 fe19 	bl	1f4c <__aeabi_f2uiz>
     31a:	4601      	mov	r1, r0
     31c:	4808      	ldr	r0, [pc, #32]	; (340 <dcm_show_status+0x48>)
     31e:	f000 ff1f 	bl	1160 <test_printf_ch>
     322:	7921      	ldrb	r1, [r4, #4]
     324:	4807      	ldr	r0, [pc, #28]	; (344 <dcm_show_status+0x4c>)
     326:	f000 ff1b 	bl	1160 <test_printf_ch>
     32a:	7821      	ldrb	r1, [r4, #0]
     32c:	4806      	ldr	r0, [pc, #24]	; (348 <dcm_show_status+0x50>)
     32e:	f000 ff17 	bl	1160 <test_printf_ch>
     332:	bd10      	pop	{r4, pc}
     334:	000203a0 	andeq	r0, r2, r0, lsr #7
     338:	000028f0 	strdeq	r2, [r0], -r0
     33c:	000028fc 	strdeq	r2, [r0], -ip
     340:	0000290c 	andeq	r2, r0, ip, lsl #18
     344:	00002920 	andeq	r2, r0, r0, lsr #18
     348:	00002938 	andeq	r2, r0, r8, lsr r9

0000034c <dcm_speed_up>:
     34c:	b538      	push	{r3, r4, r5, lr}
     34e:	4d1a      	ldr	r5, [pc, #104]	; (3b8 <dcm_speed_up+0x6c>)
     350:	491a      	ldr	r1, [pc, #104]	; (3bc <dcm_speed_up+0x70>)
     352:	68a8      	ldr	r0, [r5, #8]
     354:	f001 fb2c 	bl	19b0 <__addsf3>
     358:	4604      	mov	r4, r0
     35a:	60a8      	str	r0, [r5, #8]
     35c:	2100      	movs	r1, #0
     35e:	f001 fdeb 	bl	1f38 <__aeabi_fcmpgt>
     362:	b180      	cbz	r0, 386 <dcm_speed_up+0x3a>
     364:	4916      	ldr	r1, [pc, #88]	; (3c0 <dcm_speed_up+0x74>)
     366:	4620      	mov	r0, r4
     368:	f001 fde6 	bl	1f38 <__aeabi_fcmpgt>
     36c:	b108      	cbz	r0, 372 <dcm_speed_up+0x26>
     36e:	4a14      	ldr	r2, [pc, #80]	; (3c0 <dcm_speed_up+0x74>)
     370:	60aa      	str	r2, [r5, #8]
     372:	4912      	ldr	r1, [pc, #72]	; (3bc <dcm_speed_up+0x70>)
     374:	4b10      	ldr	r3, [pc, #64]	; (3b8 <dcm_speed_up+0x6c>)
     376:	6898      	ldr	r0, [r3, #8]
     378:	f001 fdc0 	bl	1efc <__aeabi_fcmplt>
     37c:	b110      	cbz	r0, 384 <dcm_speed_up+0x38>
     37e:	4b0e      	ldr	r3, [pc, #56]	; (3b8 <dcm_speed_up+0x6c>)
     380:	4a0e      	ldr	r2, [pc, #56]	; (3bc <dcm_speed_up+0x70>)
     382:	609a      	str	r2, [r3, #8]
     384:	bd38      	pop	{r3, r4, r5, pc}
     386:	2100      	movs	r1, #0
     388:	4620      	mov	r0, r4
     38a:	f001 fdb7 	bl	1efc <__aeabi_fcmplt>
     38e:	2800      	cmp	r0, #0
     390:	d0f8      	beq.n	384 <dcm_speed_up+0x38>
     392:	490c      	ldr	r1, [pc, #48]	; (3c4 <dcm_speed_up+0x78>)
     394:	4620      	mov	r0, r4
     396:	f001 fdb1 	bl	1efc <__aeabi_fcmplt>
     39a:	b110      	cbz	r0, 3a2 <dcm_speed_up+0x56>
     39c:	4b06      	ldr	r3, [pc, #24]	; (3b8 <dcm_speed_up+0x6c>)
     39e:	4a09      	ldr	r2, [pc, #36]	; (3c4 <dcm_speed_up+0x78>)
     3a0:	609a      	str	r2, [r3, #8]
     3a2:	4909      	ldr	r1, [pc, #36]	; (3c8 <dcm_speed_up+0x7c>)
     3a4:	4b04      	ldr	r3, [pc, #16]	; (3b8 <dcm_speed_up+0x6c>)
     3a6:	6898      	ldr	r0, [r3, #8]
     3a8:	f001 fdc6 	bl	1f38 <__aeabi_fcmpgt>
     3ac:	2800      	cmp	r0, #0
     3ae:	d0e9      	beq.n	384 <dcm_speed_up+0x38>
     3b0:	4b01      	ldr	r3, [pc, #4]	; (3b8 <dcm_speed_up+0x6c>)
     3b2:	4a05      	ldr	r2, [pc, #20]	; (3c8 <dcm_speed_up+0x7c>)
     3b4:	609a      	str	r2, [r3, #8]
     3b6:	e7e5      	b.n	384 <dcm_speed_up+0x38>
     3b8:	000203a0 	andeq	r0, r2, r0, lsr #7
     3bc:	42c80000 	sbcmi	r0, r8, #0
     3c0:	459c4000 	ldrmi	r4, [ip]
     3c4:	c59c4000 	ldrgt	r4, [ip]
     3c8:	c2c80000 	sbcgt	r0, r8, #0

000003cc <dcm_speed_down>:
     3cc:	b538      	push	{r3, r4, r5, lr}
     3ce:	4d1a      	ldr	r5, [pc, #104]	; (438 <dcm_speed_down+0x6c>)
     3d0:	491a      	ldr	r1, [pc, #104]	; (43c <dcm_speed_down+0x70>)
     3d2:	68a8      	ldr	r0, [r5, #8]
     3d4:	f001 faea 	bl	19ac <__aeabi_fsub>
     3d8:	4604      	mov	r4, r0
     3da:	60a8      	str	r0, [r5, #8]
     3dc:	2100      	movs	r1, #0
     3de:	f001 fdab 	bl	1f38 <__aeabi_fcmpgt>
     3e2:	b180      	cbz	r0, 406 <dcm_speed_down+0x3a>
     3e4:	4916      	ldr	r1, [pc, #88]	; (440 <dcm_speed_down+0x74>)
     3e6:	4620      	mov	r0, r4
     3e8:	f001 fda6 	bl	1f38 <__aeabi_fcmpgt>
     3ec:	b108      	cbz	r0, 3f2 <dcm_speed_down+0x26>
     3ee:	4a14      	ldr	r2, [pc, #80]	; (440 <dcm_speed_down+0x74>)
     3f0:	60aa      	str	r2, [r5, #8]
     3f2:	4912      	ldr	r1, [pc, #72]	; (43c <dcm_speed_down+0x70>)
     3f4:	4b10      	ldr	r3, [pc, #64]	; (438 <dcm_speed_down+0x6c>)
     3f6:	6898      	ldr	r0, [r3, #8]
     3f8:	f001 fd80 	bl	1efc <__aeabi_fcmplt>
     3fc:	b110      	cbz	r0, 404 <dcm_speed_down+0x38>
     3fe:	4b0e      	ldr	r3, [pc, #56]	; (438 <dcm_speed_down+0x6c>)
     400:	4a0e      	ldr	r2, [pc, #56]	; (43c <dcm_speed_down+0x70>)
     402:	609a      	str	r2, [r3, #8]
     404:	bd38      	pop	{r3, r4, r5, pc}
     406:	2100      	movs	r1, #0
     408:	4620      	mov	r0, r4
     40a:	f001 fd77 	bl	1efc <__aeabi_fcmplt>
     40e:	2800      	cmp	r0, #0
     410:	d0f8      	beq.n	404 <dcm_speed_down+0x38>
     412:	490c      	ldr	r1, [pc, #48]	; (444 <dcm_speed_down+0x78>)
     414:	4620      	mov	r0, r4
     416:	f001 fd71 	bl	1efc <__aeabi_fcmplt>
     41a:	b110      	cbz	r0, 422 <dcm_speed_down+0x56>
     41c:	4b06      	ldr	r3, [pc, #24]	; (438 <dcm_speed_down+0x6c>)
     41e:	4a09      	ldr	r2, [pc, #36]	; (444 <dcm_speed_down+0x78>)
     420:	609a      	str	r2, [r3, #8]
     422:	4909      	ldr	r1, [pc, #36]	; (448 <dcm_speed_down+0x7c>)
     424:	4b04      	ldr	r3, [pc, #16]	; (438 <dcm_speed_down+0x6c>)
     426:	6898      	ldr	r0, [r3, #8]
     428:	f001 fd86 	bl	1f38 <__aeabi_fcmpgt>
     42c:	2800      	cmp	r0, #0
     42e:	d0e9      	beq.n	404 <dcm_speed_down+0x38>
     430:	4b01      	ldr	r3, [pc, #4]	; (438 <dcm_speed_down+0x6c>)
     432:	4a05      	ldr	r2, [pc, #20]	; (448 <dcm_speed_down+0x7c>)
     434:	609a      	str	r2, [r3, #8]
     436:	e7e5      	b.n	404 <dcm_speed_down+0x38>
     438:	000203a0 	andeq	r0, r2, r0, lsr #7
     43c:	42c80000 	sbcmi	r0, r8, #0
     440:	459c4000 	ldrmi	r4, [ip]
     444:	c59c4000 	ldrgt	r4, [ip]
     448:	c2c80000 	sbcgt	r0, r8, #0

0000044c <dcm_loop>:
     44c:	b508      	push	{r3, lr}
     44e:	f7ff fecb 	bl	1e8 <dcm_speed_loop>
     452:	bd08      	pop	{r3, pc}

00000454 <dcm_feedback_enable>:
     454:	b508      	push	{r3, lr}
     456:	f000 fcb7 	bl	dc8 <dcm_encoder_enable>
     45a:	bd08      	pop	{r3, pc}

0000045c <dcm_feedback_disable>:
     45c:	b508      	push	{r3, lr}
     45e:	f000 fca1 	bl	da4 <dcm_encoder_disable>
     462:	bd08      	pop	{r3, pc}
     464:	0000      	movs	r0, r0
	...

00000468 <dcm_speed_calculate>:
     468:	b510      	push	{r4, lr}
     46a:	4c11      	ldr	r4, [pc, #68]	; (4b0 <dcm_speed_calculate+0x48>)
     46c:	f8d4 009c 	ldr.w	r0, [r4, #156]	; 0x9c
     470:	f000 ffcc 	bl	140c <__aeabi_i2d>
     474:	2200      	movs	r2, #0
     476:	4b0f      	ldr	r3, [pc, #60]	; (4b4 <dcm_speed_calculate+0x4c>)
     478:	f001 f95c 	bl	1734 <__aeabi_ddiv>
     47c:	a30a      	add	r3, pc, #40	; (adr r3, 4a8 <dcm_speed_calculate+0x40>)
     47e:	e9d3 2300 	ldrd	r2, r3, [r3]
     482:	f001 f82d 	bl	14e0 <__aeabi_dmul>
     486:	2200      	movs	r2, #0
     488:	4b0b      	ldr	r3, [pc, #44]	; (4b8 <dcm_speed_calculate+0x50>)
     48a:	f001 f829 	bl	14e0 <__aeabi_dmul>
     48e:	2200      	movs	r2, #0
     490:	4b0a      	ldr	r3, [pc, #40]	; (4bc <dcm_speed_calculate+0x54>)
     492:	f001 f825 	bl	14e0 <__aeabi_dmul>
     496:	f001 fa35 	bl	1904 <__aeabi_d2f>
     49a:	f8c4 00a4 	str.w	r0, [r4, #164]	; 0xa4
     49e:	f8c4 0090 	str.w	r0, [r4, #144]	; 0x90
     4a2:	bd10      	pop	{r4, pc}
     4a4:	f3af 8000 	nop.w
     4a8:	33333333 	teqcc	r3, #-872415232	; 0xcc000000
     4ac:	40347333 	eorsmi	r7, r4, r3, lsr r3
     4b0:	000203a0 	andeq	r0, r2, r0, lsr #7
     4b4:	40704000 	rsbsmi	r4, r0, r0
     4b8:	409f4000 	addsmi	r4, pc, r0
     4bc:	404e0000 	submi	r0, lr, r0

000004c0 <advtim_enc_int_reloaded_callback>:
     4c0:	b510      	push	{r4, lr}
     4c2:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
     4c6:	23b2      	movs	r3, #178	; 0xb2
     4c8:	6063      	str	r3, [r4, #4]
     4ca:	f000 fc8f 	bl	dec <dcm_encoder_read_counter>
     4ce:	f000 fc9b 	bl	e08 <dcm_encoder_read_direction>
     4d2:	23b3      	movs	r3, #179	; 0xb3
     4d4:	6063      	str	r3, [r4, #4]
     4d6:	f7ff ffc7 	bl	468 <dcm_speed_calculate>
     4da:	23b4      	movs	r3, #180	; 0xb4
     4dc:	6063      	str	r3, [r4, #4]
     4de:	f7ff ffb5 	bl	44c <dcm_loop>
     4e2:	23b5      	movs	r3, #181	; 0xb5
     4e4:	6063      	str	r3, [r4, #4]
     4e6:	bd10      	pop	{r4, pc}

000004e8 <drv_advtim_enc_set_config>:
     4e8:	b538      	push	{r3, r4, r5, lr}
     4ea:	4604      	mov	r4, r0
     4ec:	6e41      	ldr	r1, [r0, #100]	; 0x64
     4ee:	6800      	ldr	r0, [r0, #0]
     4f0:	460a      	mov	r2, r1
     4f2:	3070      	adds	r0, #112	; 0x70
     4f4:	f000 f9ef 	bl	8d6 <drv_check_rw_data>
     4f8:	4605      	mov	r5, r0
     4fa:	f894 3068 	ldrb.w	r3, [r4, #104]	; 0x68
     4fe:	f894 1069 	ldrb.w	r1, [r4, #105]	; 0x69
     502:	0409      	lsls	r1, r1, #16
     504:	ea41 7103 	orr.w	r1, r1, r3, lsl #28
     508:	f894 306c 	ldrb.w	r3, [r4, #108]	; 0x6c
     50c:	ea41 01c3 	orr.w	r1, r1, r3, lsl #3
     510:	f894 306d 	ldrb.w	r3, [r4, #109]	; 0x6d
     514:	ea41 0183 	orr.w	r1, r1, r3, lsl #2
     518:	f894 206a 	ldrb.w	r2, [r4, #106]	; 0x6a
     51c:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     520:	f894 206b 	ldrb.w	r2, [r4, #107]	; 0x6b
     524:	4311      	orrs	r1, r2
     526:	6820      	ldr	r0, [r4, #0]
     528:	460a      	mov	r2, r1
     52a:	3074      	adds	r0, #116	; 0x74
     52c:	f000 f9d3 	bl	8d6 <drv_check_rw_data>
     530:	4328      	orrs	r0, r5
     532:	b2c0      	uxtb	r0, r0
     534:	bd38      	pop	{r3, r4, r5, pc}

00000536 <drv_advtim_enc_init>:
     536:	b510      	push	{r4, lr}
     538:	4604      	mov	r4, r0
     53a:	f7ff ffd5 	bl	4e8 <drv_advtim_enc_set_config>
     53e:	6822      	ldr	r2, [r4, #0]
     540:	6813      	ldr	r3, [r2, #0]
     542:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     546:	6013      	str	r3, [r2, #0]
     548:	6822      	ldr	r2, [r4, #0]
     54a:	6813      	ldr	r3, [r2, #0]
     54c:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     550:	6013      	str	r3, [r2, #0]
     552:	6823      	ldr	r3, [r4, #0]
     554:	2203      	movs	r2, #3
     556:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     55a:	6823      	ldr	r3, [r4, #0]
     55c:	2200      	movs	r2, #0
     55e:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     562:	6822      	ldr	r2, [r4, #0]
     564:	6813      	ldr	r3, [r2, #0]
     566:	f043 0301 	orr.w	r3, r3, #1
     56a:	6013      	str	r3, [r2, #0]
     56c:	6822      	ldr	r2, [r4, #0]
     56e:	6813      	ldr	r3, [r2, #0]
     570:	f023 0301 	bic.w	r3, r3, #1
     574:	6013      	str	r3, [r2, #0]
     576:	bd10      	pop	{r4, pc}

00000578 <advtim_enc_int_detected_callback>:
     578:	4770      	bx	lr

0000057a <drv_advtim_enc_interrupt_handler>:
     57a:	b538      	push	{r3, r4, r5, lr}
     57c:	4604      	mov	r4, r0
     57e:	6803      	ldr	r3, [r0, #0]
     580:	f8d3 5088 	ldr.w	r5, [r3, #136]	; 0x88
     584:	6fdb      	ldr	r3, [r3, #124]	; 0x7c
     586:	b2db      	uxtb	r3, r3
     588:	401d      	ands	r5, r3
     58a:	f015 0f01 	tst.w	r5, #1
     58e:	d103      	bne.n	598 <drv_advtim_enc_interrupt_handler+0x1e>
     590:	f015 0f02 	tst.w	r5, #2
     594:	d10e      	bne.n	5b4 <drv_advtim_enc_interrupt_handler+0x3a>
     596:	bd38      	pop	{r3, r4, r5, pc}
     598:	f7ff ff92 	bl	4c0 <advtim_enc_int_reloaded_callback>
     59c:	6822      	ldr	r2, [r4, #0]
     59e:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
     5a2:	f043 0301 	orr.w	r3, r3, #1
     5a6:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
     5aa:	6823      	ldr	r3, [r4, #0]
     5ac:	2200      	movs	r2, #0
     5ae:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     5b2:	e7ed      	b.n	590 <drv_advtim_enc_interrupt_handler+0x16>
     5b4:	4620      	mov	r0, r4
     5b6:	f7ff ffdf 	bl	578 <advtim_enc_int_detected_callback>
     5ba:	6822      	ldr	r2, [r4, #0]
     5bc:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
     5c0:	f043 0302 	orr.w	r3, r3, #2
     5c4:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
     5c8:	6823      	ldr	r3, [r4, #0]
     5ca:	2200      	movs	r2, #0
     5cc:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     5d0:	e7e1      	b.n	596 <drv_advtim_enc_interrupt_handler+0x1c>

000005d2 <drv_advtim_gen_set_config>:
     5d2:	b538      	push	{r3, r4, r5, lr}
     5d4:	4604      	mov	r4, r0
     5d6:	8882      	ldrh	r2, [r0, #4]
     5d8:	88c1      	ldrh	r1, [r0, #6]
     5da:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
     5de:	6800      	ldr	r0, [r0, #0]
     5e0:	460a      	mov	r2, r1
     5e2:	3004      	adds	r0, #4
     5e4:	f000 f977 	bl	8d6 <drv_check_rw_data>
     5e8:	4605      	mov	r5, r0
     5ea:	8921      	ldrh	r1, [r4, #8]
     5ec:	0409      	lsls	r1, r1, #16
     5ee:	6820      	ldr	r0, [r4, #0]
     5f0:	460a      	mov	r2, r1
     5f2:	3008      	adds	r0, #8
     5f4:	f000 f96f 	bl	8d6 <drv_check_rw_data>
     5f8:	4305      	orrs	r5, r0
     5fa:	b2ed      	uxtb	r5, r5
     5fc:	7aa2      	ldrb	r2, [r4, #10]
     5fe:	7ae1      	ldrb	r1, [r4, #11]
     600:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     604:	6820      	ldr	r0, [r4, #0]
     606:	460a      	mov	r2, r1
     608:	300c      	adds	r0, #12
     60a:	f000 f964 	bl	8d6 <drv_check_rw_data>
     60e:	4305      	orrs	r5, r0
     610:	b2ed      	uxtb	r5, r5
     612:	89a3      	ldrh	r3, [r4, #12]
     614:	7d21      	ldrb	r1, [r4, #20]
     616:	0389      	lsls	r1, r1, #14
     618:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     61c:	7d63      	ldrb	r3, [r4, #21]
     61e:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     622:	7c23      	ldrb	r3, [r4, #16]
     624:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     628:	7c63      	ldrb	r3, [r4, #17]
     62a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     62e:	7ca3      	ldrb	r3, [r4, #18]
     630:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     634:	7ce3      	ldrb	r3, [r4, #19]
     636:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     63a:	7da3      	ldrb	r3, [r4, #22]
     63c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     640:	7de3      	ldrb	r3, [r4, #23]
     642:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     646:	7e23      	ldrb	r3, [r4, #24]
     648:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     64c:	7e63      	ldrb	r3, [r4, #25]
     64e:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     652:	7ea2      	ldrb	r2, [r4, #26]
     654:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     658:	7ba2      	ldrb	r2, [r4, #14]
     65a:	4311      	orrs	r1, r2
     65c:	6820      	ldr	r0, [r4, #0]
     65e:	460a      	mov	r2, r1
     660:	3010      	adds	r0, #16
     662:	f000 f938 	bl	8d6 <drv_check_rw_data>
     666:	4305      	orrs	r5, r0
     668:	b2ed      	uxtb	r5, r5
     66a:	8ba3      	ldrh	r3, [r4, #28]
     66c:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
     670:	0389      	lsls	r1, r1, #14
     672:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     676:	f894 3025 	ldrb.w	r3, [r4, #37]	; 0x25
     67a:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     67e:	f894 3020 	ldrb.w	r3, [r4, #32]
     682:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     686:	f894 3021 	ldrb.w	r3, [r4, #33]	; 0x21
     68a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     68e:	f894 3022 	ldrb.w	r3, [r4, #34]	; 0x22
     692:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     696:	f894 3023 	ldrb.w	r3, [r4, #35]	; 0x23
     69a:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     69e:	f894 3026 	ldrb.w	r3, [r4, #38]	; 0x26
     6a2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     6a6:	f894 3027 	ldrb.w	r3, [r4, #39]	; 0x27
     6aa:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     6ae:	f894 3028 	ldrb.w	r3, [r4, #40]	; 0x28
     6b2:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     6b6:	f894 3029 	ldrb.w	r3, [r4, #41]	; 0x29
     6ba:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     6be:	f894 202a 	ldrb.w	r2, [r4, #42]	; 0x2a
     6c2:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     6c6:	7fa2      	ldrb	r2, [r4, #30]
     6c8:	4311      	orrs	r1, r2
     6ca:	6820      	ldr	r0, [r4, #0]
     6cc:	460a      	mov	r2, r1
     6ce:	3014      	adds	r0, #20
     6d0:	f000 f901 	bl	8d6 <drv_check_rw_data>
     6d4:	4305      	orrs	r5, r0
     6d6:	b2ed      	uxtb	r5, r5
     6d8:	8da3      	ldrh	r3, [r4, #44]	; 0x2c
     6da:	f894 1034 	ldrb.w	r1, [r4, #52]	; 0x34
     6de:	0389      	lsls	r1, r1, #14
     6e0:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     6e4:	f894 3035 	ldrb.w	r3, [r4, #53]	; 0x35
     6e8:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     6ec:	f894 3030 	ldrb.w	r3, [r4, #48]	; 0x30
     6f0:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     6f4:	f894 3031 	ldrb.w	r3, [r4, #49]	; 0x31
     6f8:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     6fc:	f894 3032 	ldrb.w	r3, [r4, #50]	; 0x32
     700:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     704:	f894 3033 	ldrb.w	r3, [r4, #51]	; 0x33
     708:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     70c:	f894 3036 	ldrb.w	r3, [r4, #54]	; 0x36
     710:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     714:	f894 3037 	ldrb.w	r3, [r4, #55]	; 0x37
     718:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     71c:	f894 3038 	ldrb.w	r3, [r4, #56]	; 0x38
     720:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     724:	f894 3039 	ldrb.w	r3, [r4, #57]	; 0x39
     728:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     72c:	f894 203a 	ldrb.w	r2, [r4, #58]	; 0x3a
     730:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     734:	f894 202e 	ldrb.w	r2, [r4, #46]	; 0x2e
     738:	4311      	orrs	r1, r2
     73a:	6820      	ldr	r0, [r4, #0]
     73c:	460a      	mov	r2, r1
     73e:	3018      	adds	r0, #24
     740:	f000 f8c9 	bl	8d6 <drv_check_rw_data>
     744:	4305      	orrs	r5, r0
     746:	b2ed      	uxtb	r5, r5
     748:	8fa3      	ldrh	r3, [r4, #60]	; 0x3c
     74a:	f894 103f 	ldrb.w	r1, [r4, #63]	; 0x3f
     74e:	0309      	lsls	r1, r1, #12
     750:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     754:	f894 3040 	ldrb.w	r3, [r4, #64]	; 0x40
     758:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     75c:	f894 2041 	ldrb.w	r2, [r4, #65]	; 0x41
     760:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     764:	f894 203e 	ldrb.w	r2, [r4, #62]	; 0x3e
     768:	4311      	orrs	r1, r2
     76a:	6820      	ldr	r0, [r4, #0]
     76c:	460a      	mov	r2, r1
     76e:	301c      	adds	r0, #28
     770:	f000 f8b1 	bl	8d6 <drv_check_rw_data>
     774:	4305      	orrs	r5, r0
     776:	b2ed      	uxtb	r5, r5
     778:	f8b4 3042 	ldrh.w	r3, [r4, #66]	; 0x42
     77c:	7be1      	ldrb	r1, [r4, #15]
     77e:	0349      	lsls	r1, r1, #13
     780:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     784:	7fe3      	ldrb	r3, [r4, #31]
     786:	ea41 3183 	orr.w	r1, r1, r3, lsl #14
     78a:	f894 302f 	ldrb.w	r3, [r4, #47]	; 0x2f
     78e:	ea41 31c3 	orr.w	r1, r1, r3, lsl #15
     792:	f894 3045 	ldrb.w	r3, [r4, #69]	; 0x45
     796:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     79a:	f894 3046 	ldrb.w	r3, [r4, #70]	; 0x46
     79e:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     7a2:	f894 2047 	ldrb.w	r2, [r4, #71]	; 0x47
     7a6:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     7aa:	f894 2044 	ldrb.w	r2, [r4, #68]	; 0x44
     7ae:	4311      	orrs	r1, r2
     7b0:	6820      	ldr	r0, [r4, #0]
     7b2:	460a      	mov	r2, r1
     7b4:	3020      	adds	r0, #32
     7b6:	f000 f88e 	bl	8d6 <drv_check_rw_data>
     7ba:	4305      	orrs	r5, r0
     7bc:	b2ed      	uxtb	r5, r5
     7be:	f8b4 3048 	ldrh.w	r3, [r4, #72]	; 0x48
     7c2:	f894 104b 	ldrb.w	r1, [r4, #75]	; 0x4b
     7c6:	0309      	lsls	r1, r1, #12
     7c8:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     7cc:	f894 304c 	ldrb.w	r3, [r4, #76]	; 0x4c
     7d0:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     7d4:	f894 204d 	ldrb.w	r2, [r4, #77]	; 0x4d
     7d8:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     7dc:	f894 204a 	ldrb.w	r2, [r4, #74]	; 0x4a
     7e0:	4311      	orrs	r1, r2
     7e2:	6820      	ldr	r0, [r4, #0]
     7e4:	460a      	mov	r2, r1
     7e6:	3024      	adds	r0, #36	; 0x24
     7e8:	f000 f875 	bl	8d6 <drv_check_rw_data>
     7ec:	4305      	orrs	r5, r0
     7ee:	b2ed      	uxtb	r5, r5
     7f0:	f894 3050 	ldrb.w	r3, [r4, #80]	; 0x50
     7f4:	f894 1054 	ldrb.w	r1, [r4, #84]	; 0x54
     7f8:	0349      	lsls	r1, r1, #13
     7fa:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     7fe:	f894 3052 	ldrb.w	r3, [r4, #82]	; 0x52
     802:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     806:	f894 3053 	ldrb.w	r3, [r4, #83]	; 0x53
     80a:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     80e:	f894 2051 	ldrb.w	r2, [r4, #81]	; 0x51
     812:	ea41 2182 	orr.w	r1, r1, r2, lsl #10
     816:	f8b4 204e 	ldrh.w	r2, [r4, #78]	; 0x4e
     81a:	4311      	orrs	r1, r2
     81c:	6820      	ldr	r0, [r4, #0]
     81e:	460a      	mov	r2, r1
     820:	3028      	adds	r0, #40	; 0x28
     822:	f000 f858 	bl	8d6 <drv_check_rw_data>
     826:	4328      	orrs	r0, r5
     828:	b2c0      	uxtb	r0, r0
     82a:	bd38      	pop	{r3, r4, r5, pc}

0000082c <drv_advtim_gen_init>:
     82c:	b510      	push	{r4, lr}
     82e:	4604      	mov	r4, r0
     830:	f7ff fecf 	bl	5d2 <drv_advtim_gen_set_config>
     834:	6822      	ldr	r2, [r4, #0]
     836:	6813      	ldr	r3, [r2, #0]
     838:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     83c:	6013      	str	r3, [r2, #0]
     83e:	6822      	ldr	r2, [r4, #0]
     840:	6813      	ldr	r3, [r2, #0]
     842:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     846:	6013      	str	r3, [r2, #0]
     848:	6823      	ldr	r3, [r4, #0]
     84a:	2207      	movs	r2, #7
     84c:	645a      	str	r2, [r3, #68]	; 0x44
     84e:	6823      	ldr	r3, [r4, #0]
     850:	2200      	movs	r2, #0
     852:	645a      	str	r2, [r3, #68]	; 0x44
     854:	6822      	ldr	r2, [r4, #0]
     856:	6813      	ldr	r3, [r2, #0]
     858:	f043 0301 	orr.w	r3, r3, #1
     85c:	6013      	str	r3, [r2, #0]
     85e:	6822      	ldr	r2, [r4, #0]
     860:	6813      	ldr	r3, [r2, #0]
     862:	f023 0301 	bic.w	r3, r3, #1
     866:	6013      	str	r3, [r2, #0]
     868:	bd10      	pop	{r4, pc}

0000086a <advtim_gen_int_reloaded_callback>:
     86a:	4770      	bx	lr

0000086c <advtim_gen_int_reloading_reaching_rcr_callback>:
     86c:	4770      	bx	lr

0000086e <drv_advtim_gen_interrupt_handler>:
     86e:	b538      	push	{r3, r4, r5, lr}
     870:	4604      	mov	r4, r0
     872:	6803      	ldr	r3, [r0, #0]
     874:	6c9d      	ldr	r5, [r3, #72]	; 0x48
     876:	6c1b      	ldr	r3, [r3, #64]	; 0x40
     878:	b2db      	uxtb	r3, r3
     87a:	401d      	ands	r5, r3
     87c:	f015 0f04 	tst.w	r5, #4
     880:	d106      	bne.n	890 <drv_advtim_gen_interrupt_handler+0x22>
     882:	f015 0f01 	tst.w	r5, #1
     886:	d10e      	bne.n	8a6 <drv_advtim_gen_interrupt_handler+0x38>
     888:	f015 0f02 	tst.w	r5, #2
     88c:	d117      	bne.n	8be <drv_advtim_gen_interrupt_handler+0x50>
     88e:	bd38      	pop	{r3, r4, r5, pc}
     890:	f000 fbfa 	bl	1088 <advtim_gen_int_fault_detected_callback>
     894:	6822      	ldr	r2, [r4, #0]
     896:	6c53      	ldr	r3, [r2, #68]	; 0x44
     898:	f043 0304 	orr.w	r3, r3, #4
     89c:	6453      	str	r3, [r2, #68]	; 0x44
     89e:	6823      	ldr	r3, [r4, #0]
     8a0:	2200      	movs	r2, #0
     8a2:	645a      	str	r2, [r3, #68]	; 0x44
     8a4:	e7ed      	b.n	882 <drv_advtim_gen_interrupt_handler+0x14>
     8a6:	4620      	mov	r0, r4
     8a8:	f7ff ffdf 	bl	86a <advtim_gen_int_reloaded_callback>
     8ac:	6822      	ldr	r2, [r4, #0]
     8ae:	6c53      	ldr	r3, [r2, #68]	; 0x44
     8b0:	f043 0301 	orr.w	r3, r3, #1
     8b4:	6453      	str	r3, [r2, #68]	; 0x44
     8b6:	6823      	ldr	r3, [r4, #0]
     8b8:	2200      	movs	r2, #0
     8ba:	645a      	str	r2, [r3, #68]	; 0x44
     8bc:	e7e4      	b.n	888 <drv_advtim_gen_interrupt_handler+0x1a>
     8be:	4620      	mov	r0, r4
     8c0:	f7ff ffd4 	bl	86c <advtim_gen_int_reloading_reaching_rcr_callback>
     8c4:	6822      	ldr	r2, [r4, #0]
     8c6:	6c53      	ldr	r3, [r2, #68]	; 0x44
     8c8:	f043 0302 	orr.w	r3, r3, #2
     8cc:	6453      	str	r3, [r2, #68]	; 0x44
     8ce:	6823      	ldr	r3, [r4, #0]
     8d0:	2200      	movs	r2, #0
     8d2:	645a      	str	r2, [r3, #68]	; 0x44
     8d4:	e7db      	b.n	88e <drv_advtim_gen_interrupt_handler+0x20>

000008d6 <drv_check_rw_data>:
     8d6:	6001      	str	r1, [r0, #0]
     8d8:	6803      	ldr	r3, [r0, #0]
     8da:	4293      	cmp	r3, r2
     8dc:	d007      	beq.n	8ee <drv_check_rw_data+0x18>
     8de:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     8e2:	2001      	movs	r0, #1
     8e4:	6018      	str	r0, [r3, #0]
     8e6:	685a      	ldr	r2, [r3, #4]
     8e8:	4402      	add	r2, r0
     8ea:	601a      	str	r2, [r3, #0]
     8ec:	4770      	bx	lr
     8ee:	2000      	movs	r0, #0
     8f0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     8f4:	6018      	str	r0, [r3, #0]
     8f6:	4770      	bx	lr

000008f8 <drv_uart_default_config>:
     8f8:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
     8fc:	6043      	str	r3, [r0, #4]
     8fe:	230f      	movs	r3, #15
     900:	7203      	strb	r3, [r0, #8]
     902:	2300      	movs	r3, #0
     904:	7243      	strb	r3, [r0, #9]
     906:	7283      	strb	r3, [r0, #10]
     908:	72c3      	strb	r3, [r0, #11]
     90a:	7303      	strb	r3, [r0, #12]
     90c:	7343      	strb	r3, [r0, #13]
     90e:	2301      	movs	r3, #1
     910:	7383      	strb	r3, [r0, #14]
     912:	4770      	bx	lr

00000914 <drv_uart_set_config>:
     914:	b508      	push	{r3, lr}
     916:	6841      	ldr	r1, [r0, #4]
     918:	7a03      	ldrb	r3, [r0, #8]
     91a:	fb03 f201 	mul.w	r2, r3, r1
     91e:	490e      	ldr	r1, [pc, #56]	; (958 <drv_uart_set_config+0x44>)
     920:	fbb1 f2f2 	udiv	r2, r1, r2
     924:	0419      	lsls	r1, r3, #16
     926:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
     92a:	7a43      	ldrb	r3, [r0, #9]
     92c:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     930:	7a83      	ldrb	r3, [r0, #10]
     932:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     936:	7ac3      	ldrb	r3, [r0, #11]
     938:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     93c:	7b03      	ldrb	r3, [r0, #12]
     93e:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     942:	7b42      	ldrb	r2, [r0, #13]
     944:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
     948:	7b82      	ldrb	r2, [r0, #14]
     94a:	4311      	orrs	r1, r2
     94c:	6800      	ldr	r0, [r0, #0]
     94e:	460a      	mov	r2, r1
     950:	3008      	adds	r0, #8
     952:	f7ff ffc0 	bl	8d6 <drv_check_rw_data>
     956:	bd08      	pop	{r3, pc}
     958:	02625a00 	rsbeq	r5, r2, #0, 20

0000095c <drv_uart_init>:
     95c:	b538      	push	{r3, r4, r5, lr}
     95e:	4604      	mov	r4, r0
     960:	2500      	movs	r5, #0
     962:	7485      	strb	r5, [r0, #18]
     964:	74c5      	strb	r5, [r0, #19]
     966:	f7ff ffd5 	bl	914 <drv_uart_set_config>
     96a:	7425      	strb	r5, [r4, #16]
     96c:	74a5      	strb	r5, [r4, #18]
     96e:	74e5      	strb	r5, [r4, #19]
     970:	6822      	ldr	r2, [r4, #0]
     972:	6853      	ldr	r3, [r2, #4]
     974:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     978:	6053      	str	r3, [r2, #4]
     97a:	6822      	ldr	r2, [r4, #0]
     97c:	6853      	ldr	r3, [r2, #4]
     97e:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     982:	6053      	str	r3, [r2, #4]
     984:	6822      	ldr	r2, [r4, #0]
     986:	6853      	ldr	r3, [r2, #4]
     988:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     98c:	6053      	str	r3, [r2, #4]
     98e:	6822      	ldr	r2, [r4, #0]
     990:	6853      	ldr	r3, [r2, #4]
     992:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     996:	6053      	str	r3, [r2, #4]
     998:	6822      	ldr	r2, [r4, #0]
     99a:	6853      	ldr	r3, [r2, #4]
     99c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     9a0:	6053      	str	r3, [r2, #4]
     9a2:	6822      	ldr	r2, [r4, #0]
     9a4:	6853      	ldr	r3, [r2, #4]
     9a6:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     9aa:	6053      	str	r3, [r2, #4]
     9ac:	6822      	ldr	r2, [r4, #0]
     9ae:	6853      	ldr	r3, [r2, #4]
     9b0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     9b4:	6053      	str	r3, [r2, #4]
     9b6:	6822      	ldr	r2, [r4, #0]
     9b8:	6853      	ldr	r3, [r2, #4]
     9ba:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     9be:	6053      	str	r3, [r2, #4]
     9c0:	6823      	ldr	r3, [r4, #0]
     9c2:	f240 12ff 	movw	r2, #511	; 0x1ff
     9c6:	611a      	str	r2, [r3, #16]
     9c8:	6823      	ldr	r3, [r4, #0]
     9ca:	611d      	str	r5, [r3, #16]
     9cc:	6822      	ldr	r2, [r4, #0]
     9ce:	6853      	ldr	r3, [r2, #4]
     9d0:	f043 0301 	orr.w	r3, r3, #1
     9d4:	6053      	str	r3, [r2, #4]
     9d6:	6822      	ldr	r2, [r4, #0]
     9d8:	6853      	ldr	r3, [r2, #4]
     9da:	f023 0301 	bic.w	r3, r3, #1
     9de:	6053      	str	r3, [r2, #4]
     9e0:	6822      	ldr	r2, [r4, #0]
     9e2:	6853      	ldr	r3, [r2, #4]
     9e4:	f043 0302 	orr.w	r3, r3, #2
     9e8:	6053      	str	r3, [r2, #4]
     9ea:	bd38      	pop	{r3, r4, r5, pc}

000009ec <drv_uart_putchars>:
     9ec:	b410      	push	{r4}
     9ee:	2300      	movs	r3, #0
     9f0:	7483      	strb	r3, [r0, #18]
     9f2:	f890 c012 	ldrb.w	ip, [r0, #18]
     9f6:	4594      	cmp	ip, r2
     9f8:	d20c      	bcs.n	a14 <drv_uart_putchars+0x28>
     9fa:	6804      	ldr	r4, [r0, #0]
     9fc:	6963      	ldr	r3, [r4, #20]
     9fe:	0a1b      	lsrs	r3, r3, #8
     a00:	f013 0f18 	tst.w	r3, #24
     a04:	d1f5      	bne.n	9f2 <drv_uart_putchars+0x6>
     a06:	f10c 0301 	add.w	r3, ip, #1
     a0a:	7483      	strb	r3, [r0, #18]
     a0c:	f811 300c 	ldrb.w	r3, [r1, ip]
     a10:	6023      	str	r3, [r4, #0]
     a12:	e7ee      	b.n	9f2 <drv_uart_putchars+0x6>
     a14:	6803      	ldr	r3, [r0, #0]
     a16:	699a      	ldr	r2, [r3, #24]
     a18:	f412 7f80 	tst.w	r2, #256	; 0x100
     a1c:	d0fa      	beq.n	a14 <drv_uart_putchars+0x28>
     a1e:	691a      	ldr	r2, [r3, #16]
     a20:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     a24:	611a      	str	r2, [r3, #16]
     a26:	6803      	ldr	r3, [r0, #0]
     a28:	2200      	movs	r2, #0
     a2a:	611a      	str	r2, [r3, #16]
     a2c:	bc10      	pop	{r4}
     a2e:	4770      	bx	lr

00000a30 <drv_uart_getchar_timeout>:
     a30:	2a00      	cmp	r2, #0
     a32:	d059      	beq.n	ae8 <drv_uart_getchar_timeout+0xb8>
     a34:	b430      	push	{r4, r5}
     a36:	e00b      	b.n	a50 <drv_uart_getchar_timeout+0x20>
     a38:	69db      	ldr	r3, [r3, #28]
     a3a:	700b      	strb	r3, [r1, #0]
     a3c:	2000      	movs	r0, #0
     a3e:	e051      	b.n	ae4 <drv_uart_getchar_timeout+0xb4>
     a40:	6803      	ldr	r3, [r0, #0]
     a42:	695c      	ldr	r4, [r3, #20]
     a44:	f014 0f1f 	tst.w	r4, #31
     a48:	d1f6      	bne.n	a38 <drv_uart_getchar_timeout+0x8>
     a4a:	3a01      	subs	r2, #1
     a4c:	2a00      	cmp	r2, #0
     a4e:	d048      	beq.n	ae2 <drv_uart_getchar_timeout+0xb2>
     a50:	6803      	ldr	r3, [r0, #0]
     a52:	699d      	ldr	r5, [r3, #24]
     a54:	691c      	ldr	r4, [r3, #16]
     a56:	f044 04c0 	orr.w	r4, r4, #192	; 0xc0
     a5a:	611c      	str	r4, [r3, #16]
     a5c:	6803      	ldr	r3, [r0, #0]
     a5e:	2400      	movs	r4, #0
     a60:	611c      	str	r4, [r3, #16]
     a62:	b2ab      	uxth	r3, r5
     a64:	f015 0f40 	tst.w	r5, #64	; 0x40
     a68:	d001      	beq.n	a6e <drv_uart_getchar_timeout+0x3e>
     a6a:	2401      	movs	r4, #1
     a6c:	7404      	strb	r4, [r0, #16]
     a6e:	f013 0f80 	tst.w	r3, #128	; 0x80
     a72:	d001      	beq.n	a78 <drv_uart_getchar_timeout+0x48>
     a74:	2302      	movs	r3, #2
     a76:	7403      	strb	r3, [r0, #16]
     a78:	7c03      	ldrb	r3, [r0, #16]
     a7a:	2b00      	cmp	r3, #0
     a7c:	d0e0      	beq.n	a40 <drv_uart_getchar_timeout+0x10>
     a7e:	7a83      	ldrb	r3, [r0, #10]
     a80:	2b01      	cmp	r3, #1
     a82:	d0dd      	beq.n	a40 <drv_uart_getchar_timeout+0x10>
     a84:	2300      	movs	r3, #0
     a86:	7403      	strb	r3, [r0, #16]
     a88:	7483      	strb	r3, [r0, #18]
     a8a:	74c3      	strb	r3, [r0, #19]
     a8c:	6804      	ldr	r4, [r0, #0]
     a8e:	6862      	ldr	r2, [r4, #4]
     a90:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     a94:	6062      	str	r2, [r4, #4]
     a96:	6804      	ldr	r4, [r0, #0]
     a98:	6862      	ldr	r2, [r4, #4]
     a9a:	f422 7280 	bic.w	r2, r2, #256	; 0x100
     a9e:	6062      	str	r2, [r4, #4]
     aa0:	6804      	ldr	r4, [r0, #0]
     aa2:	6862      	ldr	r2, [r4, #4]
     aa4:	f442 7200 	orr.w	r2, r2, #512	; 0x200
     aa8:	6062      	str	r2, [r4, #4]
     aaa:	6804      	ldr	r4, [r0, #0]
     aac:	6862      	ldr	r2, [r4, #4]
     aae:	f422 7200 	bic.w	r2, r2, #512	; 0x200
     ab2:	6062      	str	r2, [r4, #4]
     ab4:	6804      	ldr	r4, [r0, #0]
     ab6:	6862      	ldr	r2, [r4, #4]
     ab8:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     abc:	6062      	str	r2, [r4, #4]
     abe:	6804      	ldr	r4, [r0, #0]
     ac0:	6862      	ldr	r2, [r4, #4]
     ac2:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
     ac6:	6062      	str	r2, [r4, #4]
     ac8:	6804      	ldr	r4, [r0, #0]
     aca:	6862      	ldr	r2, [r4, #4]
     acc:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
     ad0:	6062      	str	r2, [r4, #4]
     ad2:	6800      	ldr	r0, [r0, #0]
     ad4:	6842      	ldr	r2, [r0, #4]
     ad6:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
     ada:	6042      	str	r2, [r0, #4]
     adc:	700b      	strb	r3, [r1, #0]
     ade:	2001      	movs	r0, #1
     ae0:	e000      	b.n	ae4 <drv_uart_getchar_timeout+0xb4>
     ae2:	2002      	movs	r0, #2
     ae4:	bc30      	pop	{r4, r5}
     ae6:	4770      	bx	lr
     ae8:	2002      	movs	r0, #2
     aea:	4770      	bx	lr

00000aec <uart_int_tx_done_callback>:
     aec:	4770      	bx	lr

00000aee <uart_int_rx_stop_callback>:
     aee:	4770      	bx	lr

00000af0 <uart_int_rx_parity_error_callback>:
     af0:	4770      	bx	lr

00000af2 <uart_int_rx_noise_detect_callback>:
     af2:	4770      	bx	lr

00000af4 <uart_int_rx_stop_detect_callback>:
     af4:	4770      	bx	lr

00000af6 <uart_int_tx_fifo_empty_callback>:
     af6:	4770      	bx	lr

00000af8 <uart_int_tx_fifo_thres_callback>:
     af8:	4770      	bx	lr

00000afa <uart_int_rx_fifo_noempty_callback>:
     afa:	4770      	bx	lr

00000afc <uart_int_rx_fifo_thres_callback>:
     afc:	4770      	bx	lr

00000afe <drv_uart_interrupt_handler>:
     afe:	b538      	push	{r3, r4, r5, lr}
     b00:	4604      	mov	r4, r0
     b02:	6803      	ldr	r3, [r0, #0]
     b04:	699d      	ldr	r5, [r3, #24]
     b06:	68db      	ldr	r3, [r3, #12]
     b08:	b29b      	uxth	r3, r3
     b0a:	401d      	ands	r5, r3
     b0c:	f415 7f80 	tst.w	r5, #256	; 0x100
     b10:	d144      	bne.n	b9c <drv_uart_interrupt_handler+0x9e>
     b12:	f015 0f40 	tst.w	r5, #64	; 0x40
     b16:	d00f      	beq.n	b38 <drv_uart_interrupt_handler+0x3a>
     b18:	2301      	movs	r3, #1
     b1a:	7423      	strb	r3, [r4, #16]
     b1c:	7aa3      	ldrb	r3, [r4, #10]
     b1e:	2b01      	cmp	r3, #1
     b20:	d147      	bne.n	bb2 <drv_uart_interrupt_handler+0xb4>
     b22:	4620      	mov	r0, r4
     b24:	f7ff ffe3 	bl	aee <uart_int_rx_stop_callback>
     b28:	6822      	ldr	r2, [r4, #0]
     b2a:	6913      	ldr	r3, [r2, #16]
     b2c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     b30:	6113      	str	r3, [r2, #16]
     b32:	6823      	ldr	r3, [r4, #0]
     b34:	2200      	movs	r2, #0
     b36:	611a      	str	r2, [r3, #16]
     b38:	f015 0f80 	tst.w	r5, #128	; 0x80
     b3c:	d00f      	beq.n	b5e <drv_uart_interrupt_handler+0x60>
     b3e:	2302      	movs	r3, #2
     b40:	7423      	strb	r3, [r4, #16]
     b42:	7aa3      	ldrb	r3, [r4, #10]
     b44:	2b01      	cmp	r3, #1
     b46:	d166      	bne.n	c16 <drv_uart_interrupt_handler+0x118>
     b48:	4620      	mov	r0, r4
     b4a:	f7ff ffd1 	bl	af0 <uart_int_rx_parity_error_callback>
     b4e:	6822      	ldr	r2, [r4, #0]
     b50:	6913      	ldr	r3, [r2, #16]
     b52:	f043 0380 	orr.w	r3, r3, #128	; 0x80
     b56:	6113      	str	r3, [r2, #16]
     b58:	6823      	ldr	r3, [r4, #0]
     b5a:	2200      	movs	r2, #0
     b5c:	611a      	str	r2, [r3, #16]
     b5e:	f015 0f20 	tst.w	r5, #32
     b62:	f040 808a 	bne.w	c7a <drv_uart_interrupt_handler+0x17c>
     b66:	f015 0f10 	tst.w	r5, #16
     b6a:	f040 8092 	bne.w	c92 <drv_uart_interrupt_handler+0x194>
     b6e:	f015 0f01 	tst.w	r5, #1
     b72:	f040 809a 	bne.w	caa <drv_uart_interrupt_handler+0x1ac>
     b76:	f015 0f02 	tst.w	r5, #2
     b7a:	f040 80a2 	bne.w	cc2 <drv_uart_interrupt_handler+0x1c4>
     b7e:	f015 0f04 	tst.w	r5, #4
     b82:	f000 80c1 	beq.w	d08 <drv_uart_interrupt_handler+0x20a>
     b86:	7ce2      	ldrb	r2, [r4, #19]
     b88:	7e23      	ldrb	r3, [r4, #24]
     b8a:	429a      	cmp	r2, r3
     b8c:	f0c0 80ac 	bcc.w	ce8 <drv_uart_interrupt_handler+0x1ea>
     b90:	6822      	ldr	r2, [r4, #0]
     b92:	68d3      	ldr	r3, [r2, #12]
     b94:	f023 030c 	bic.w	r3, r3, #12
     b98:	60d3      	str	r3, [r2, #12]
     b9a:	e0aa      	b.n	cf2 <drv_uart_interrupt_handler+0x1f4>
     b9c:	f7ff ffa6 	bl	aec <uart_int_tx_done_callback>
     ba0:	6822      	ldr	r2, [r4, #0]
     ba2:	6913      	ldr	r3, [r2, #16]
     ba4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     ba8:	6113      	str	r3, [r2, #16]
     baa:	6823      	ldr	r3, [r4, #0]
     bac:	2200      	movs	r2, #0
     bae:	611a      	str	r2, [r3, #16]
     bb0:	e7af      	b.n	b12 <drv_uart_interrupt_handler+0x14>
     bb2:	6822      	ldr	r2, [r4, #0]
     bb4:	68d3      	ldr	r3, [r2, #12]
     bb6:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     bba:	60d3      	str	r3, [r2, #12]
     bbc:	2300      	movs	r3, #0
     bbe:	7423      	strb	r3, [r4, #16]
     bc0:	74a3      	strb	r3, [r4, #18]
     bc2:	74e3      	strb	r3, [r4, #19]
     bc4:	6822      	ldr	r2, [r4, #0]
     bc6:	6853      	ldr	r3, [r2, #4]
     bc8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     bcc:	6053      	str	r3, [r2, #4]
     bce:	6822      	ldr	r2, [r4, #0]
     bd0:	6853      	ldr	r3, [r2, #4]
     bd2:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     bd6:	6053      	str	r3, [r2, #4]
     bd8:	6822      	ldr	r2, [r4, #0]
     bda:	6853      	ldr	r3, [r2, #4]
     bdc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     be0:	6053      	str	r3, [r2, #4]
     be2:	6822      	ldr	r2, [r4, #0]
     be4:	6853      	ldr	r3, [r2, #4]
     be6:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     bea:	6053      	str	r3, [r2, #4]
     bec:	6822      	ldr	r2, [r4, #0]
     bee:	6853      	ldr	r3, [r2, #4]
     bf0:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     bf4:	6053      	str	r3, [r2, #4]
     bf6:	6822      	ldr	r2, [r4, #0]
     bf8:	6853      	ldr	r3, [r2, #4]
     bfa:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     bfe:	6053      	str	r3, [r2, #4]
     c00:	6822      	ldr	r2, [r4, #0]
     c02:	6853      	ldr	r3, [r2, #4]
     c04:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     c08:	6053      	str	r3, [r2, #4]
     c0a:	6822      	ldr	r2, [r4, #0]
     c0c:	6853      	ldr	r3, [r2, #4]
     c0e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     c12:	6053      	str	r3, [r2, #4]
     c14:	e785      	b.n	b22 <drv_uart_interrupt_handler+0x24>
     c16:	6822      	ldr	r2, [r4, #0]
     c18:	68d3      	ldr	r3, [r2, #12]
     c1a:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
     c1e:	60d3      	str	r3, [r2, #12]
     c20:	2300      	movs	r3, #0
     c22:	7423      	strb	r3, [r4, #16]
     c24:	74a3      	strb	r3, [r4, #18]
     c26:	74e3      	strb	r3, [r4, #19]
     c28:	6822      	ldr	r2, [r4, #0]
     c2a:	6853      	ldr	r3, [r2, #4]
     c2c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     c30:	6053      	str	r3, [r2, #4]
     c32:	6822      	ldr	r2, [r4, #0]
     c34:	6853      	ldr	r3, [r2, #4]
     c36:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     c3a:	6053      	str	r3, [r2, #4]
     c3c:	6822      	ldr	r2, [r4, #0]
     c3e:	6853      	ldr	r3, [r2, #4]
     c40:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     c44:	6053      	str	r3, [r2, #4]
     c46:	6822      	ldr	r2, [r4, #0]
     c48:	6853      	ldr	r3, [r2, #4]
     c4a:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     c4e:	6053      	str	r3, [r2, #4]
     c50:	6822      	ldr	r2, [r4, #0]
     c52:	6853      	ldr	r3, [r2, #4]
     c54:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     c58:	6053      	str	r3, [r2, #4]
     c5a:	6822      	ldr	r2, [r4, #0]
     c5c:	6853      	ldr	r3, [r2, #4]
     c5e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     c62:	6053      	str	r3, [r2, #4]
     c64:	6822      	ldr	r2, [r4, #0]
     c66:	6853      	ldr	r3, [r2, #4]
     c68:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
     c6c:	6053      	str	r3, [r2, #4]
     c6e:	6822      	ldr	r2, [r4, #0]
     c70:	6853      	ldr	r3, [r2, #4]
     c72:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
     c76:	6053      	str	r3, [r2, #4]
     c78:	e766      	b.n	b48 <drv_uart_interrupt_handler+0x4a>
     c7a:	4620      	mov	r0, r4
     c7c:	f7ff ff39 	bl	af2 <uart_int_rx_noise_detect_callback>
     c80:	6822      	ldr	r2, [r4, #0]
     c82:	6913      	ldr	r3, [r2, #16]
     c84:	f043 0320 	orr.w	r3, r3, #32
     c88:	6113      	str	r3, [r2, #16]
     c8a:	6823      	ldr	r3, [r4, #0]
     c8c:	2200      	movs	r2, #0
     c8e:	611a      	str	r2, [r3, #16]
     c90:	e769      	b.n	b66 <drv_uart_interrupt_handler+0x68>
     c92:	4620      	mov	r0, r4
     c94:	f7ff ff2e 	bl	af4 <uart_int_rx_stop_detect_callback>
     c98:	6822      	ldr	r2, [r4, #0]
     c9a:	6913      	ldr	r3, [r2, #16]
     c9c:	f043 0310 	orr.w	r3, r3, #16
     ca0:	6113      	str	r3, [r2, #16]
     ca2:	6823      	ldr	r3, [r4, #0]
     ca4:	2200      	movs	r2, #0
     ca6:	611a      	str	r2, [r3, #16]
     ca8:	e761      	b.n	b6e <drv_uart_interrupt_handler+0x70>
     caa:	4620      	mov	r0, r4
     cac:	f7ff ff24 	bl	af8 <uart_int_tx_fifo_thres_callback>
     cb0:	6822      	ldr	r2, [r4, #0]
     cb2:	6913      	ldr	r3, [r2, #16]
     cb4:	f043 0301 	orr.w	r3, r3, #1
     cb8:	6113      	str	r3, [r2, #16]
     cba:	6823      	ldr	r3, [r4, #0]
     cbc:	2200      	movs	r2, #0
     cbe:	611a      	str	r2, [r3, #16]
     cc0:	e759      	b.n	b76 <drv_uart_interrupt_handler+0x78>
     cc2:	4620      	mov	r0, r4
     cc4:	f7ff ff17 	bl	af6 <uart_int_tx_fifo_empty_callback>
     cc8:	6822      	ldr	r2, [r4, #0]
     cca:	6913      	ldr	r3, [r2, #16]
     ccc:	f043 0302 	orr.w	r3, r3, #2
     cd0:	6113      	str	r3, [r2, #16]
     cd2:	6823      	ldr	r3, [r4, #0]
     cd4:	2200      	movs	r2, #0
     cd6:	611a      	str	r2, [r3, #16]
     cd8:	e751      	b.n	b7e <drv_uart_interrupt_handler+0x80>
     cda:	69d9      	ldr	r1, [r3, #28]
     cdc:	6962      	ldr	r2, [r4, #20]
     cde:	7ce3      	ldrb	r3, [r4, #19]
     ce0:	1c58      	adds	r0, r3, #1
     ce2:	74e0      	strb	r0, [r4, #19]
     ce4:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     ce8:	6823      	ldr	r3, [r4, #0]
     cea:	695a      	ldr	r2, [r3, #20]
     cec:	f012 0f1f 	tst.w	r2, #31
     cf0:	d1f3      	bne.n	cda <drv_uart_interrupt_handler+0x1dc>
     cf2:	4620      	mov	r0, r4
     cf4:	f7ff ff02 	bl	afc <uart_int_rx_fifo_thres_callback>
     cf8:	6822      	ldr	r2, [r4, #0]
     cfa:	6913      	ldr	r3, [r2, #16]
     cfc:	f043 0304 	orr.w	r3, r3, #4
     d00:	6113      	str	r3, [r2, #16]
     d02:	6823      	ldr	r3, [r4, #0]
     d04:	2200      	movs	r2, #0
     d06:	611a      	str	r2, [r3, #16]
     d08:	f015 0f08 	tst.w	r5, #8
     d0c:	d020      	beq.n	d50 <drv_uart_interrupt_handler+0x252>
     d0e:	7ce2      	ldrb	r2, [r4, #19]
     d10:	7e23      	ldrb	r3, [r4, #24]
     d12:	429a      	cmp	r2, r3
     d14:	d30c      	bcc.n	d30 <drv_uart_interrupt_handler+0x232>
     d16:	6822      	ldr	r2, [r4, #0]
     d18:	68d3      	ldr	r3, [r2, #12]
     d1a:	f023 030c 	bic.w	r3, r3, #12
     d1e:	60d3      	str	r3, [r2, #12]
     d20:	e00b      	b.n	d3a <drv_uart_interrupt_handler+0x23c>
     d22:	69d9      	ldr	r1, [r3, #28]
     d24:	6962      	ldr	r2, [r4, #20]
     d26:	7ce3      	ldrb	r3, [r4, #19]
     d28:	1c58      	adds	r0, r3, #1
     d2a:	74e0      	strb	r0, [r4, #19]
     d2c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
     d30:	6823      	ldr	r3, [r4, #0]
     d32:	695a      	ldr	r2, [r3, #20]
     d34:	f012 0f1f 	tst.w	r2, #31
     d38:	d1f3      	bne.n	d22 <drv_uart_interrupt_handler+0x224>
     d3a:	4620      	mov	r0, r4
     d3c:	f7ff fedd 	bl	afa <uart_int_rx_fifo_noempty_callback>
     d40:	6822      	ldr	r2, [r4, #0]
     d42:	6913      	ldr	r3, [r2, #16]
     d44:	f043 0308 	orr.w	r3, r3, #8
     d48:	6113      	str	r3, [r2, #16]
     d4a:	6823      	ldr	r3, [r4, #0]
     d4c:	2200      	movs	r2, #0
     d4e:	611a      	str	r2, [r3, #16]
     d50:	bd38      	pop	{r3, r4, r5, pc}
	...

00000d54 <vprintf>:
     d54:	b500      	push	{lr}
     d56:	b0a1      	sub	sp, #132	; 0x84
     d58:	460a      	mov	r2, r1
     d5a:	4601      	mov	r1, r0
     d5c:	4668      	mov	r0, sp
     d5e:	f001 f947 	bl	1ff0 <vsiprintf>
     d62:	2800      	cmp	r0, #0
     d64:	dc05      	bgt.n	d72 <vprintf+0x1e>
     d66:	4668      	mov	r0, sp
     d68:	f001 f924 	bl	1fb4 <strlen>
     d6c:	b021      	add	sp, #132	; 0x84
     d6e:	f85d fb04 	ldr.w	pc, [sp], #4
     d72:	4668      	mov	r0, sp
     d74:	f001 f91e 	bl	1fb4 <strlen>
     d78:	b2c2      	uxtb	r2, r0
     d7a:	4669      	mov	r1, sp
     d7c:	4801      	ldr	r0, [pc, #4]	; (d84 <vprintf+0x30>)
     d7e:	f7ff fe35 	bl	9ec <drv_uart_putchars>
     d82:	e7f0      	b.n	d66 <vprintf+0x12>
     d84:	00020450 	andeq	r0, r2, r0, asr r4

00000d88 <drv_uart_printf>:
     d88:	b40f      	push	{r0, r1, r2, r3}
     d8a:	b500      	push	{lr}
     d8c:	b083      	sub	sp, #12
     d8e:	a904      	add	r1, sp, #16
     d90:	f851 0b04 	ldr.w	r0, [r1], #4
     d94:	9101      	str	r1, [sp, #4]
     d96:	f7ff ffdd 	bl	d54 <vprintf>
     d9a:	b003      	add	sp, #12
     d9c:	f85d eb04 	ldr.w	lr, [sp], #4
     da0:	b004      	add	sp, #16
     da2:	4770      	bx	lr

00000da4 <dcm_encoder_disable>:
     da4:	4a07      	ldr	r2, [pc, #28]	; (dc4 <dcm_encoder_disable+0x20>)
     da6:	6811      	ldr	r1, [r2, #0]
     da8:	680b      	ldr	r3, [r1, #0]
     daa:	f023 0310 	bic.w	r3, r3, #16
     dae:	600b      	str	r3, [r1, #0]
     db0:	6813      	ldr	r3, [r2, #0]
     db2:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     db4:	f042 0202 	orr.w	r2, r2, #2
     db8:	67da      	str	r2, [r3, #124]	; 0x7c
     dba:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     dbc:	f042 0201 	orr.w	r2, r2, #1
     dc0:	67da      	str	r2, [r3, #124]	; 0x7c
     dc2:	4770      	bx	lr
     dc4:	00020330 	andeq	r0, r2, r0, lsr r3

00000dc8 <dcm_encoder_enable>:
     dc8:	4b07      	ldr	r3, [pc, #28]	; (de8 <dcm_encoder_enable+0x20>)
     dca:	681b      	ldr	r3, [r3, #0]
     dcc:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     dce:	f042 0202 	orr.w	r2, r2, #2
     dd2:	67da      	str	r2, [r3, #124]	; 0x7c
     dd4:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     dd6:	f042 0201 	orr.w	r2, r2, #1
     dda:	67da      	str	r2, [r3, #124]	; 0x7c
     ddc:	681a      	ldr	r2, [r3, #0]
     dde:	f042 0210 	orr.w	r2, r2, #16
     de2:	601a      	str	r2, [r3, #0]
     de4:	4770      	bx	lr
     de6:	bf00      	nop
     de8:	00020330 	andeq	r0, r2, r0, lsr r3

00000dec <dcm_encoder_read_counter>:
     dec:	4b04      	ldr	r3, [pc, #16]	; (e00 <dcm_encoder_read_counter+0x14>)
     dee:	681b      	ldr	r3, [r3, #0]
     df0:	f8d3 3084 	ldr.w	r3, [r3, #132]	; 0x84
     df4:	b29b      	uxth	r3, r3
     df6:	4a03      	ldr	r2, [pc, #12]	; (e04 <dcm_encoder_read_counter+0x18>)
     df8:	f8c2 309c 	str.w	r3, [r2, #156]	; 0x9c
     dfc:	4770      	bx	lr
     dfe:	bf00      	nop
     e00:	00020330 	andeq	r0, r2, r0, lsr r3
     e04:	000203a0 	andeq	r0, r2, r0, lsr #7

00000e08 <dcm_encoder_read_direction>:
     e08:	4b04      	ldr	r3, [pc, #16]	; (e1c <dcm_encoder_read_direction+0x14>)
     e0a:	681b      	ldr	r3, [r3, #0]
     e0c:	f8d3 3084 	ldr.w	r3, [r3, #132]	; 0x84
     e10:	f3c3 4300 	ubfx	r3, r3, #16, #1
     e14:	4a02      	ldr	r2, [pc, #8]	; (e20 <dcm_encoder_read_direction+0x18>)
     e16:	f882 30a8 	strb.w	r3, [r2, #168]	; 0xa8
     e1a:	4770      	bx	lr
     e1c:	00020330 	andeq	r0, r2, r0, lsr r3
     e20:	000203a0 	andeq	r0, r2, r0, lsr #7

00000e24 <AdvtimEnc_Handler>:
     e24:	b508      	push	{r3, lr}
     e26:	4b04      	ldr	r3, [pc, #16]	; (e38 <AdvtimEnc_Handler+0x14>)
     e28:	f44f 2280 	mov.w	r2, #262144	; 0x40000
     e2c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     e30:	4802      	ldr	r0, [pc, #8]	; (e3c <AdvtimEnc_Handler+0x18>)
     e32:	f7ff fba2 	bl	57a <drv_advtim_enc_interrupt_handler>
     e36:	bd08      	pop	{r3, pc}
     e38:	e000e100 	and	lr, r0, r0, lsl #2
     e3c:	00020330 	andeq	r0, r2, r0, lsr r3

00000e40 <NMI_Handler>:
     e40:	b508      	push	{r3, lr}
     e42:	4802      	ldr	r0, [pc, #8]	; (e4c <NMI_Handler+0xc>)
     e44:	f000 f988 	bl	1158 <test_printf_s>
     e48:	bd08      	pop	{r3, pc}
     e4a:	bf00      	nop
     e4c:	00002944 	andeq	r2, r0, r4, asr #18

00000e50 <HardFault_Handler>:
     e50:	e7fe      	b.n	e50 <HardFault_Handler>

00000e52 <MemManage_Handler>:
     e52:	e7fe      	b.n	e52 <MemManage_Handler>

00000e54 <BusFault_Handler>:
     e54:	e7fe      	b.n	e54 <BusFault_Handler>

00000e56 <UsageFault_Handler>:
     e56:	e7fe      	b.n	e56 <UsageFault_Handler>

00000e58 <SVC_Handler>:
     e58:	4770      	bx	lr

00000e5a <DebugMon_Handler>:
     e5a:	4770      	bx	lr

00000e5c <PendSV_Handler>:
     e5c:	4770      	bx	lr

00000e5e <SysTick_Handler>:
     e5e:	4770      	bx	lr

00000e60 <Uart0_Handler>:
     e60:	b508      	push	{r3, lr}
     e62:	4b04      	ldr	r3, [pc, #16]	; (e74 <Uart0_Handler+0x14>)
     e64:	2201      	movs	r2, #1
     e66:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
     e6a:	4803      	ldr	r0, [pc, #12]	; (e78 <Uart0_Handler+0x18>)
     e6c:	f7ff fe47 	bl	afe <drv_uart_interrupt_handler>
     e70:	bd08      	pop	{r3, pc}
     e72:	bf00      	nop
     e74:	e000e100 	and	lr, r0, r0, lsl #2
     e78:	00020450 	andeq	r0, r2, r0, asr r4

00000e7c <show_testmenu>:
     e7c:	b570      	push	{r4, r5, r6, lr}
     e7e:	4605      	mov	r5, r0
     e80:	460e      	mov	r6, r1
     e82:	480b      	ldr	r0, [pc, #44]	; (eb0 <show_testmenu+0x34>)
     e84:	f7ff ff80 	bl	d88 <drv_uart_printf>
     e88:	2400      	movs	r4, #0
     e8a:	e00b      	b.n	ea4 <show_testmenu+0x28>
     e8c:	eb04 1304 	add.w	r3, r4, r4, lsl #4
     e90:	eb05 02c3 	add.w	r2, r5, r3, lsl #3
     e94:	3208      	adds	r2, #8
     e96:	f815 1033 	ldrb.w	r1, [r5, r3, lsl #3]
     e9a:	4806      	ldr	r0, [pc, #24]	; (eb4 <show_testmenu+0x38>)
     e9c:	f7ff ff74 	bl	d88 <drv_uart_printf>
     ea0:	3401      	adds	r4, #1
     ea2:	b2e4      	uxtb	r4, r4
     ea4:	42b4      	cmp	r4, r6
     ea6:	d3f1      	bcc.n	e8c <show_testmenu+0x10>
     ea8:	4803      	ldr	r0, [pc, #12]	; (eb8 <show_testmenu+0x3c>)
     eaa:	f7ff ff6d 	bl	d88 <drv_uart_printf>
     eae:	bd70      	pop	{r4, r5, r6, pc}
     eb0:	00002948 	andeq	r2, r0, r8, asr #18
     eb4:	00002964 	andeq	r2, r0, r4, ror #18
     eb8:	0000296c 	andeq	r2, r0, ip, ror #18

00000ebc <test_execute>:
     ebc:	b5f0      	push	{r4, r5, r6, r7, lr}
     ebe:	b083      	sub	sp, #12
     ec0:	4605      	mov	r5, r0
     ec2:	460e      	mov	r6, r1
     ec4:	e01f      	b.n	f06 <test_execute+0x4a>
     ec6:	4821      	ldr	r0, [pc, #132]	; (f4c <test_execute+0x90>)
     ec8:	f7ff ff5e 	bl	d88 <drv_uart_printf>
     ecc:	e00b      	b.n	ee6 <test_execute+0x2a>
     ece:	f107 0408 	add.w	r4, r7, #8
     ed2:	4621      	mov	r1, r4
     ed4:	481e      	ldr	r0, [pc, #120]	; (f50 <test_execute+0x94>)
     ed6:	f7ff ff57 	bl	d88 <drv_uart_printf>
     eda:	687b      	ldr	r3, [r7, #4]
     edc:	4798      	blx	r3
     ede:	4621      	mov	r1, r4
     ee0:	481c      	ldr	r0, [pc, #112]	; (f54 <test_execute+0x98>)
     ee2:	f7ff ff51 	bl	d88 <drv_uart_printf>
     ee6:	b003      	add	sp, #12
     ee8:	bdf0      	pop	{r4, r5, r6, r7, pc}
     eea:	481b      	ldr	r0, [pc, #108]	; (f58 <test_execute+0x9c>)
     eec:	f7ff ff4c 	bl	d88 <drv_uart_printf>
     ef0:	4c1a      	ldr	r4, [pc, #104]	; (f5c <test_execute+0xa0>)
     ef2:	f894 10a8 	ldrb.w	r1, [r4, #168]	; 0xa8
     ef6:	481a      	ldr	r0, [pc, #104]	; (f60 <test_execute+0xa4>)
     ef8:	f000 f932 	bl	1160 <test_printf_ch>
     efc:	f8d4 109c 	ldr.w	r1, [r4, #156]	; 0x9c
     f00:	4818      	ldr	r0, [pc, #96]	; (f64 <test_execute+0xa8>)
     f02:	f000 f92d 	bl	1160 <test_printf_ch>
     f06:	2300      	movs	r3, #0
     f08:	f88d 3007 	strb.w	r3, [sp, #7]
     f0c:	4a16      	ldr	r2, [pc, #88]	; (f68 <test_execute+0xac>)
     f0e:	f10d 0107 	add.w	r1, sp, #7
     f12:	4816      	ldr	r0, [pc, #88]	; (f6c <test_execute+0xb0>)
     f14:	f7ff fd8c 	bl	a30 <drv_uart_getchar_timeout>
     f18:	4604      	mov	r4, r0
     f1a:	2800      	cmp	r0, #0
     f1c:	d1e8      	bne.n	ef0 <test_execute+0x34>
     f1e:	f89d 1007 	ldrb.w	r1, [sp, #7]
     f22:	4813      	ldr	r0, [pc, #76]	; (f70 <test_execute+0xb4>)
     f24:	f7ff ff30 	bl	d88 <drv_uart_printf>
     f28:	f89d 2007 	ldrb.w	r2, [sp, #7]
     f2c:	2a51      	cmp	r2, #81	; 0x51
     f2e:	d0ca      	beq.n	ec6 <test_execute+0xa>
     f30:	42b4      	cmp	r4, r6
     f32:	d2da      	bcs.n	eea <test_execute+0x2e>
     f34:	eb04 1304 	add.w	r3, r4, r4, lsl #4
     f38:	eb05 07c3 	add.w	r7, r5, r3, lsl #3
     f3c:	f815 3033 	ldrb.w	r3, [r5, r3, lsl #3]
     f40:	429a      	cmp	r2, r3
     f42:	d0c4      	beq.n	ece <test_execute+0x12>
     f44:	3401      	adds	r4, #1
     f46:	b2e4      	uxtb	r4, r4
     f48:	e7f2      	b.n	f30 <test_execute+0x74>
     f4a:	bf00      	nop
     f4c:	000029ac 	andeq	r2, r0, ip, lsr #19
     f50:	000029c4 	andeq	r2, r0, r4, asr #19
     f54:	000029d4 	ldrdeq	r2, [r0], -r4
     f58:	000029e4 	andeq	r2, r0, r4, ror #19
     f5c:	000203a0 	andeq	r0, r2, r0, lsr #7
     f60:	000029f8 	strdeq	r2, [r0], -r8
     f64:	00002a00 	andeq	r2, r0, r0, lsl #20
     f68:	0003d090 	muleq	r3, r0, r0
     f6c:	00020450 	andeq	r0, r2, r0, asr r4
     f70:	0000299c 	muleq	r0, ip, r9

00000f74 <mcu_testmenu>:
     f74:	b510      	push	{r4, lr}
     f76:	4c05      	ldr	r4, [pc, #20]	; (f8c <mcu_testmenu+0x18>)
     f78:	2105      	movs	r1, #5
     f7a:	4620      	mov	r0, r4
     f7c:	f7ff ff7e 	bl	e7c <show_testmenu>
     f80:	2105      	movs	r1, #5
     f82:	4620      	mov	r0, r4
     f84:	f7ff ff9a 	bl	ebc <test_execute>
     f88:	bd10      	pop	{r4, pc}
     f8a:	bf00      	nop
     f8c:	00020000 	andeq	r0, r2, r0

00000f90 <main>:
     f90:	b508      	push	{r3, lr}
     f92:	f000 f8d1 	bl	1138 <uart0_init>
     f96:	f7ff f973 	bl	280 <dcm_system_init>
     f9a:	4803      	ldr	r0, [pc, #12]	; (fa8 <main+0x18>)
     f9c:	f000 f8dc 	bl	1158 <test_printf_s>
     fa0:	f7ff ffe8 	bl	f74 <mcu_testmenu>
     fa4:	e7fc      	b.n	fa0 <main+0x10>
     fa6:	bf00      	nop
     fa8:	00002a08 	andeq	r2, r0, r8, lsl #20

00000fac <dcm_pwm_disable>:
     fac:	490d      	ldr	r1, [pc, #52]	; (fe4 <dcm_pwm_disable+0x38>)
     fae:	680b      	ldr	r3, [r1, #0]
     fb0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     fb2:	f022 0202 	bic.w	r2, r2, #2
     fb6:	641a      	str	r2, [r3, #64]	; 0x40
     fb8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     fba:	f022 0201 	bic.w	r2, r2, #1
     fbe:	641a      	str	r2, [r3, #64]	; 0x40
     fc0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     fc2:	f022 0204 	bic.w	r2, r2, #4
     fc6:	641a      	str	r2, [r3, #64]	; 0x40
     fc8:	2207      	movs	r2, #7
     fca:	645a      	str	r2, [r3, #68]	; 0x44
     fcc:	2200      	movs	r2, #0
     fce:	645a      	str	r2, [r3, #68]	; 0x44
     fd0:	681a      	ldr	r2, [r3, #0]
     fd2:	f442 7280 	orr.w	r2, r2, #256	; 0x100
     fd6:	601a      	str	r2, [r3, #0]
     fd8:	680a      	ldr	r2, [r1, #0]
     fda:	6813      	ldr	r3, [r2, #0]
     fdc:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     fe0:	6013      	str	r3, [r2, #0]
     fe2:	4770      	bx	lr
     fe4:	00020330 	andeq	r0, r2, r0, lsr r3

00000fe8 <dcm_pwm_enable>:
     fe8:	4a09      	ldr	r2, [pc, #36]	; (1010 <dcm_pwm_enable+0x28>)
     fea:	6811      	ldr	r1, [r2, #0]
     fec:	680b      	ldr	r3, [r1, #0]
     fee:	f043 0304 	orr.w	r3, r3, #4
     ff2:	600b      	str	r3, [r1, #0]
     ff4:	6813      	ldr	r3, [r2, #0]
     ff6:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     ff8:	f042 0202 	orr.w	r2, r2, #2
     ffc:	641a      	str	r2, [r3, #64]	; 0x40
     ffe:	6c1a      	ldr	r2, [r3, #64]	; 0x40
    1000:	f042 0201 	orr.w	r2, r2, #1
    1004:	641a      	str	r2, [r3, #64]	; 0x40
    1006:	6c1a      	ldr	r2, [r3, #64]	; 0x40
    1008:	f042 0204 	orr.w	r2, r2, #4
    100c:	641a      	str	r2, [r3, #64]	; 0x40
    100e:	4770      	bx	lr
    1010:	00020330 	andeq	r0, r2, r0, lsr r3

00001014 <dcm_pwm_set>:
    1014:	b508      	push	{r3, lr}
    1016:	4909      	ldr	r1, [pc, #36]	; (103c <dcm_pwm_set+0x28>)
    1018:	f000 fdd2 	bl	1bc0 <__aeabi_fmul>
    101c:	4908      	ldr	r1, [pc, #32]	; (1040 <dcm_pwm_set+0x2c>)
    101e:	f000 fe83 	bl	1d28 <__aeabi_fdiv>
    1022:	f000 ff93 	bl	1f4c <__aeabi_f2uiz>
    1026:	b283      	uxth	r3, r0
    1028:	4a06      	ldr	r2, [pc, #24]	; (1044 <dcm_pwm_set+0x30>)
    102a:	8213      	strh	r3, [r2, #16]
    102c:	4a06      	ldr	r2, [pc, #24]	; (1048 <dcm_pwm_set+0x34>)
    102e:	6812      	ldr	r2, [r2, #0]
    1030:	6910      	ldr	r0, [r2, #16]
    1032:	b280      	uxth	r0, r0
    1034:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
    1038:	6110      	str	r0, [r2, #16]
    103a:	bd08      	pop	{r3, pc}
    103c:	457a0000 	ldrbmi	r0, [sl, #-0]!
    1040:	462be000 	strtmi	lr, [fp], -r0
    1044:	000203a0 	andeq	r0, r2, r0, lsr #7
    1048:	00020330 	andeq	r0, r2, r0, lsr r3

0000104c <dcm_dir_set>:
    104c:	4b0c      	ldr	r3, [pc, #48]	; (1080 <dcm_dir_set+0x34>)
    104e:	7118      	strb	r0, [r3, #4]
    1050:	b950      	cbnz	r0, 1068 <dcm_dir_set+0x1c>
    1052:	4b0c      	ldr	r3, [pc, #48]	; (1084 <dcm_dir_set+0x38>)
    1054:	681b      	ldr	r3, [r3, #0]
    1056:	695a      	ldr	r2, [r3, #20]
    1058:	f422 4280 	bic.w	r2, r2, #16384	; 0x4000
    105c:	615a      	str	r2, [r3, #20]
    105e:	699a      	ldr	r2, [r3, #24]
    1060:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
    1064:	619a      	str	r2, [r3, #24]
    1066:	4770      	bx	lr
    1068:	4b06      	ldr	r3, [pc, #24]	; (1084 <dcm_dir_set+0x38>)
    106a:	681b      	ldr	r3, [r3, #0]
    106c:	699a      	ldr	r2, [r3, #24]
    106e:	f422 4280 	bic.w	r2, r2, #16384	; 0x4000
    1072:	619a      	str	r2, [r3, #24]
    1074:	695a      	ldr	r2, [r3, #20]
    1076:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
    107a:	615a      	str	r2, [r3, #20]
    107c:	4770      	bx	lr
    107e:	bf00      	nop
    1080:	000203a0 	andeq	r0, r2, r0, lsr #7
    1084:	00020330 	andeq	r0, r2, r0, lsr r3

00001088 <advtim_gen_int_fault_detected_callback>:
    1088:	b508      	push	{r3, lr}
    108a:	f7ff f92d 	bl	2e8 <dcm_system_disable>
    108e:	4b03      	ldr	r3, [pc, #12]	; (109c <advtim_gen_int_fault_detected_callback+0x14>)
    1090:	2201      	movs	r2, #1
    1092:	701a      	strb	r2, [r3, #0]
    1094:	4802      	ldr	r0, [pc, #8]	; (10a0 <advtim_gen_int_fault_detected_callback+0x18>)
    1096:	f000 f85f 	bl	1158 <test_printf_s>
    109a:	bd08      	pop	{r3, pc}
    109c:	000203a0 	andeq	r0, r2, r0, lsr #7
    10a0:	00002a30 	andeq	r2, r0, r0, lsr sl

000010a4 <AdvtimGen_Handler>:
    10a4:	b508      	push	{r3, lr}
    10a6:	4b04      	ldr	r3, [pc, #16]	; (10b8 <AdvtimGen_Handler+0x14>)
    10a8:	f44f 3280 	mov.w	r2, #65536	; 0x10000
    10ac:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    10b0:	4802      	ldr	r0, [pc, #8]	; (10bc <AdvtimGen_Handler+0x18>)
    10b2:	f7ff fbdc 	bl	86e <drv_advtim_gen_interrupt_handler>
    10b6:	bd08      	pop	{r3, pc}
    10b8:	e000e100 	and	lr, r0, r0, lsl #2
    10bc:	00020330 	andeq	r0, r2, r0, lsr r3

000010c0 <Reset_Handler>:
    10c0:	490a      	ldr	r1, [pc, #40]	; (10ec <Reset_Handler+0x2c>)
    10c2:	4a0b      	ldr	r2, [pc, #44]	; (10f0 <Reset_Handler+0x30>)
    10c4:	4b0b      	ldr	r3, [pc, #44]	; (10f4 <Reset_Handler+0x34>)
    10c6:	1a9b      	subs	r3, r3, r2
    10c8:	dd03      	ble.n	10d2 <Reset_Handler+0x12>
    10ca:	3b04      	subs	r3, #4
    10cc:	58c8      	ldr	r0, [r1, r3]
    10ce:	50d0      	str	r0, [r2, r3]
    10d0:	dcfb      	bgt.n	10ca <Reset_Handler+0xa>
    10d2:	4909      	ldr	r1, [pc, #36]	; (10f8 <Reset_Handler+0x38>)
    10d4:	4a09      	ldr	r2, [pc, #36]	; (10fc <Reset_Handler+0x3c>)
    10d6:	2000      	movs	r0, #0
    10d8:	4291      	cmp	r1, r2
    10da:	bfbc      	itt	lt
    10dc:	f841 0b04 	strlt.w	r0, [r1], #4
    10e0:	e7fa      	blt.n	10d8 <Reset_Handler+0x18>
    10e2:	f7ff ff55 	bl	f90 <main>
    10e6:	f000 ff51 	bl	1f8c <exit>
    10ea:	2a940000 	bcs	fe5010f2 <__StackTop+0xfe4df0f2>
    10ee:	00000000 	andeq	r0, r0, r0
    10f2:	03140002 	tsteq	r4, #2
    10f6:	03140002 	tsteq	r4, #2
    10fa:	04800002 	streq	r0, [r0], #2
    10fe:	e7fe0002 	ldrb	r0, [lr, r2]!
    1102:	e7fe      	b.n	1102 <Reset_Handler+0x42>
    1104:	e7fe      	b.n	1104 <Reset_Handler+0x44>
    1106:	e7fe      	b.n	1106 <Reset_Handler+0x46>
    1108:	e7fe      	b.n	1108 <Reset_Handler+0x48>
    110a:	e7fe      	b.n	110a <Reset_Handler+0x4a>
    110c:	e7fe      	b.n	110c <Reset_Handler+0x4c>
    110e:	e7fe      	b.n	110e <Reset_Handler+0x4e>
    1110:	e7fe      	b.n	1110 <Reset_Handler+0x50>
    1112:	e7fe      	b.n	1112 <Reset_Handler+0x52>

00001114 <Uart1_Handler>:
    1114:	e7fe      	b.n	1114 <Uart1_Handler>

00001116 <Resv2_Handler>:
    1116:	e7fe      	b.n	1116 <Resv2_Handler>

00001118 <Resv3_Handler>:
    1118:	e7fe      	b.n	1118 <Resv3_Handler>

0000111a <EthDma_Handler>:
    111a:	e7fe      	b.n	111a <EthDma_Handler>

0000111c <Gpioa_Handler>:
    111c:	e7fe      	b.n	111c <Gpioa_Handler>

0000111e <Resv6_Handler>:
    111e:	e7fe      	b.n	111e <Resv6_Handler>

00001120 <Resv7_Handler>:
    1120:	e7fe      	b.n	1120 <Resv7_Handler>

00001122 <Bastim_Ch0_Handler>:
    1122:	e7fe      	b.n	1122 <Bastim_Ch0_Handler>

00001124 <Bastim_Ch1_Handler>:
    1124:	e7fe      	b.n	1124 <Bastim_Ch1_Handler>

00001126 <Bastim_Ch2_Handler>:
    1126:	e7fe      	b.n	1126 <Bastim_Ch2_Handler>

00001128 <Bastim_Ch3_Handler>:
    1128:	e7fe      	b.n	1128 <Bastim_Ch3_Handler>

0000112a <EthSma_Handler>:
    112a:	e7fe      	b.n	112a <EthSma_Handler>

0000112c <EthTx_Handler>:
    112c:	e7fe      	b.n	112c <EthTx_Handler>

0000112e <EthRx_Handler>:
    112e:	e7fe      	b.n	112e <EthRx_Handler>

00001130 <Resv15_Handler>:
    1130:	e7fe      	b.n	1130 <Resv15_Handler>
    1132:	e7fe      	b.n	1132 <Resv15_Handler+0x2>

00001134 <AdvtimCap_Handler>:
    1134:	e7fe      	b.n	1134 <AdvtimCap_Handler>
    1136:	e7fe      	b.n	1136 <AdvtimCap_Handler+0x2>

00001138 <uart0_init>:
    1138:	b510      	push	{r4, lr}
    113a:	4c05      	ldr	r4, [pc, #20]	; (1150 <uart0_init+0x18>)
    113c:	4b05      	ldr	r3, [pc, #20]	; (1154 <uart0_init+0x1c>)
    113e:	6023      	str	r3, [r4, #0]
    1140:	4620      	mov	r0, r4
    1142:	f7ff fbd9 	bl	8f8 <drv_uart_default_config>
    1146:	4620      	mov	r0, r4
    1148:	f7ff fc08 	bl	95c <drv_uart_init>
    114c:	bd10      	pop	{r4, pc}
    114e:	bf00      	nop
    1150:	00020450 	andeq	r0, r2, r0, asr r4
    1154:	40001000 	andmi	r1, r0, r0

00001158 <test_printf_s>:
    1158:	b508      	push	{r3, lr}
    115a:	f7ff fe15 	bl	d88 <drv_uart_printf>
    115e:	bd08      	pop	{r3, pc}

00001160 <test_printf_ch>:
    1160:	b508      	push	{r3, lr}
    1162:	f7ff fe11 	bl	d88 <drv_uart_printf>
    1166:	bd08      	pop	{r3, pc}

00001168 <__aeabi_drsub>:
    1168:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
    116c:	e002      	b.n	1174 <__adddf3>
    116e:	bf00      	nop

00001170 <__aeabi_dsub>:
    1170:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

00001174 <__adddf3>:
    1174:	b530      	push	{r4, r5, lr}
    1176:	ea4f 0441 	mov.w	r4, r1, lsl #1
    117a:	ea4f 0543 	mov.w	r5, r3, lsl #1
    117e:	ea94 0f05 	teq	r4, r5
    1182:	bf08      	it	eq
    1184:	ea90 0f02 	teqeq	r0, r2
    1188:	bf1f      	itttt	ne
    118a:	ea54 0c00 	orrsne.w	ip, r4, r0
    118e:	ea55 0c02 	orrsne.w	ip, r5, r2
    1192:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
    1196:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    119a:	f000 80e2 	beq.w	1362 <__adddf3+0x1ee>
    119e:	ea4f 5454 	mov.w	r4, r4, lsr #21
    11a2:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
    11a6:	bfb8      	it	lt
    11a8:	426d      	neglt	r5, r5
    11aa:	dd0c      	ble.n	11c6 <__adddf3+0x52>
    11ac:	442c      	add	r4, r5
    11ae:	ea80 0202 	eor.w	r2, r0, r2
    11b2:	ea81 0303 	eor.w	r3, r1, r3
    11b6:	ea82 0000 	eor.w	r0, r2, r0
    11ba:	ea83 0101 	eor.w	r1, r3, r1
    11be:	ea80 0202 	eor.w	r2, r0, r2
    11c2:	ea81 0303 	eor.w	r3, r1, r3
    11c6:	2d36      	cmp	r5, #54	; 0x36
    11c8:	bf88      	it	hi
    11ca:	bd30      	pophi	{r4, r5, pc}
    11cc:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    11d0:	ea4f 3101 	mov.w	r1, r1, lsl #12
    11d4:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
    11d8:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
    11dc:	d002      	beq.n	11e4 <__adddf3+0x70>
    11de:	4240      	negs	r0, r0
    11e0:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    11e4:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
    11e8:	ea4f 3303 	mov.w	r3, r3, lsl #12
    11ec:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
    11f0:	d002      	beq.n	11f8 <__adddf3+0x84>
    11f2:	4252      	negs	r2, r2
    11f4:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
    11f8:	ea94 0f05 	teq	r4, r5
    11fc:	f000 80a7 	beq.w	134e <__adddf3+0x1da>
    1200:	f1a4 0401 	sub.w	r4, r4, #1
    1204:	f1d5 0e20 	rsbs	lr, r5, #32
    1208:	db0d      	blt.n	1226 <__adddf3+0xb2>
    120a:	fa02 fc0e 	lsl.w	ip, r2, lr
    120e:	fa22 f205 	lsr.w	r2, r2, r5
    1212:	1880      	adds	r0, r0, r2
    1214:	f141 0100 	adc.w	r1, r1, #0
    1218:	fa03 f20e 	lsl.w	r2, r3, lr
    121c:	1880      	adds	r0, r0, r2
    121e:	fa43 f305 	asr.w	r3, r3, r5
    1222:	4159      	adcs	r1, r3
    1224:	e00e      	b.n	1244 <__adddf3+0xd0>
    1226:	f1a5 0520 	sub.w	r5, r5, #32
    122a:	f10e 0e20 	add.w	lr, lr, #32
    122e:	2a01      	cmp	r2, #1
    1230:	fa03 fc0e 	lsl.w	ip, r3, lr
    1234:	bf28      	it	cs
    1236:	f04c 0c02 	orrcs.w	ip, ip, #2
    123a:	fa43 f305 	asr.w	r3, r3, r5
    123e:	18c0      	adds	r0, r0, r3
    1240:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
    1244:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    1248:	d507      	bpl.n	125a <__adddf3+0xe6>
    124a:	f04f 0e00 	mov.w	lr, #0
    124e:	f1dc 0c00 	rsbs	ip, ip, #0
    1252:	eb7e 0000 	sbcs.w	r0, lr, r0
    1256:	eb6e 0101 	sbc.w	r1, lr, r1
    125a:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
    125e:	d31b      	bcc.n	1298 <__adddf3+0x124>
    1260:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
    1264:	d30c      	bcc.n	1280 <__adddf3+0x10c>
    1266:	0849      	lsrs	r1, r1, #1
    1268:	ea5f 0030 	movs.w	r0, r0, rrx
    126c:	ea4f 0c3c 	mov.w	ip, ip, rrx
    1270:	f104 0401 	add.w	r4, r4, #1
    1274:	ea4f 5244 	mov.w	r2, r4, lsl #21
    1278:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
    127c:	f080 809a 	bcs.w	13b4 <__adddf3+0x240>
    1280:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    1284:	bf08      	it	eq
    1286:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    128a:	f150 0000 	adcs.w	r0, r0, #0
    128e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    1292:	ea41 0105 	orr.w	r1, r1, r5
    1296:	bd30      	pop	{r4, r5, pc}
    1298:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
    129c:	4140      	adcs	r0, r0
    129e:	eb41 0101 	adc.w	r1, r1, r1
    12a2:	3c01      	subs	r4, #1
    12a4:	bf28      	it	cs
    12a6:	f5b1 1f80 	cmpcs.w	r1, #1048576	; 0x100000
    12aa:	d2e9      	bcs.n	1280 <__adddf3+0x10c>
    12ac:	f091 0f00 	teq	r1, #0
    12b0:	bf04      	itt	eq
    12b2:	4601      	moveq	r1, r0
    12b4:	2000      	moveq	r0, #0
    12b6:	fab1 f381 	clz	r3, r1
    12ba:	bf08      	it	eq
    12bc:	3320      	addeq	r3, #32
    12be:	f1a3 030b 	sub.w	r3, r3, #11
    12c2:	f1b3 0220 	subs.w	r2, r3, #32
    12c6:	da0c      	bge.n	12e2 <__adddf3+0x16e>
    12c8:	320c      	adds	r2, #12
    12ca:	dd08      	ble.n	12de <__adddf3+0x16a>
    12cc:	f102 0c14 	add.w	ip, r2, #20
    12d0:	f1c2 020c 	rsb	r2, r2, #12
    12d4:	fa01 f00c 	lsl.w	r0, r1, ip
    12d8:	fa21 f102 	lsr.w	r1, r1, r2
    12dc:	e00c      	b.n	12f8 <__adddf3+0x184>
    12de:	f102 0214 	add.w	r2, r2, #20
    12e2:	bfd8      	it	le
    12e4:	f1c2 0c20 	rsble	ip, r2, #32
    12e8:	fa01 f102 	lsl.w	r1, r1, r2
    12ec:	fa20 fc0c 	lsr.w	ip, r0, ip
    12f0:	bfdc      	itt	le
    12f2:	ea41 010c 	orrle.w	r1, r1, ip
    12f6:	4090      	lslle	r0, r2
    12f8:	1ae4      	subs	r4, r4, r3
    12fa:	bfa2      	ittt	ge
    12fc:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
    1300:	4329      	orrge	r1, r5
    1302:	bd30      	popge	{r4, r5, pc}
    1304:	ea6f 0404 	mvn.w	r4, r4
    1308:	3c1f      	subs	r4, #31
    130a:	da1c      	bge.n	1346 <__adddf3+0x1d2>
    130c:	340c      	adds	r4, #12
    130e:	dc0e      	bgt.n	132e <__adddf3+0x1ba>
    1310:	f104 0414 	add.w	r4, r4, #20
    1314:	f1c4 0220 	rsb	r2, r4, #32
    1318:	fa20 f004 	lsr.w	r0, r0, r4
    131c:	fa01 f302 	lsl.w	r3, r1, r2
    1320:	ea40 0003 	orr.w	r0, r0, r3
    1324:	fa21 f304 	lsr.w	r3, r1, r4
    1328:	ea45 0103 	orr.w	r1, r5, r3
    132c:	bd30      	pop	{r4, r5, pc}
    132e:	f1c4 040c 	rsb	r4, r4, #12
    1332:	f1c4 0220 	rsb	r2, r4, #32
    1336:	fa20 f002 	lsr.w	r0, r0, r2
    133a:	fa01 f304 	lsl.w	r3, r1, r4
    133e:	ea40 0003 	orr.w	r0, r0, r3
    1342:	4629      	mov	r1, r5
    1344:	bd30      	pop	{r4, r5, pc}
    1346:	fa21 f004 	lsr.w	r0, r1, r4
    134a:	4629      	mov	r1, r5
    134c:	bd30      	pop	{r4, r5, pc}
    134e:	f094 0f00 	teq	r4, #0
    1352:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
    1356:	bf06      	itte	eq
    1358:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
    135c:	3401      	addeq	r4, #1
    135e:	3d01      	subne	r5, #1
    1360:	e74e      	b.n	1200 <__adddf3+0x8c>
    1362:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    1366:	bf18      	it	ne
    1368:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
    136c:	d029      	beq.n	13c2 <__adddf3+0x24e>
    136e:	ea94 0f05 	teq	r4, r5
    1372:	bf08      	it	eq
    1374:	ea90 0f02 	teqeq	r0, r2
    1378:	d005      	beq.n	1386 <__adddf3+0x212>
    137a:	ea54 0c00 	orrs.w	ip, r4, r0
    137e:	bf04      	itt	eq
    1380:	4619      	moveq	r1, r3
    1382:	4610      	moveq	r0, r2
    1384:	bd30      	pop	{r4, r5, pc}
    1386:	ea91 0f03 	teq	r1, r3
    138a:	bf1e      	ittt	ne
    138c:	2100      	movne	r1, #0
    138e:	2000      	movne	r0, #0
    1390:	bd30      	popne	{r4, r5, pc}
    1392:	ea5f 5c54 	movs.w	ip, r4, lsr #21
    1396:	d105      	bne.n	13a4 <__adddf3+0x230>
    1398:	0040      	lsls	r0, r0, #1
    139a:	4149      	adcs	r1, r1
    139c:	bf28      	it	cs
    139e:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
    13a2:	bd30      	pop	{r4, r5, pc}
    13a4:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
    13a8:	bf3c      	itt	cc
    13aa:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
    13ae:	bd30      	popcc	{r4, r5, pc}
    13b0:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    13b4:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
    13b8:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    13bc:	f04f 0000 	mov.w	r0, #0
    13c0:	bd30      	pop	{r4, r5, pc}
    13c2:	ea7f 5c64 	mvns.w	ip, r4, asr #21
    13c6:	bf1a      	itte	ne
    13c8:	4619      	movne	r1, r3
    13ca:	4610      	movne	r0, r2
    13cc:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
    13d0:	bf1c      	itt	ne
    13d2:	460b      	movne	r3, r1
    13d4:	4602      	movne	r2, r0
    13d6:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    13da:	bf06      	itte	eq
    13dc:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
    13e0:	ea91 0f03 	teqeq	r1, r3
    13e4:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
    13e8:	bd30      	pop	{r4, r5, pc}
    13ea:	bf00      	nop

000013ec <__aeabi_ui2d>:
    13ec:	f090 0f00 	teq	r0, #0
    13f0:	bf04      	itt	eq
    13f2:	2100      	moveq	r1, #0
    13f4:	4770      	bxeq	lr
    13f6:	b530      	push	{r4, r5, lr}
    13f8:	f44f 6480 	mov.w	r4, #1024	; 0x400
    13fc:	f104 0432 	add.w	r4, r4, #50	; 0x32
    1400:	f04f 0500 	mov.w	r5, #0
    1404:	f04f 0100 	mov.w	r1, #0
    1408:	e750      	b.n	12ac <__adddf3+0x138>
    140a:	bf00      	nop

0000140c <__aeabi_i2d>:
    140c:	f090 0f00 	teq	r0, #0
    1410:	bf04      	itt	eq
    1412:	2100      	moveq	r1, #0
    1414:	4770      	bxeq	lr
    1416:	b530      	push	{r4, r5, lr}
    1418:	f44f 6480 	mov.w	r4, #1024	; 0x400
    141c:	f104 0432 	add.w	r4, r4, #50	; 0x32
    1420:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
    1424:	bf48      	it	mi
    1426:	4240      	negmi	r0, r0
    1428:	f04f 0100 	mov.w	r1, #0
    142c:	e73e      	b.n	12ac <__adddf3+0x138>
    142e:	bf00      	nop

00001430 <__aeabi_f2d>:
    1430:	0042      	lsls	r2, r0, #1
    1432:	ea4f 01e2 	mov.w	r1, r2, asr #3
    1436:	ea4f 0131 	mov.w	r1, r1, rrx
    143a:	ea4f 7002 	mov.w	r0, r2, lsl #28
    143e:	bf1f      	itttt	ne
    1440:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
    1444:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
    1448:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
    144c:	4770      	bxne	lr
    144e:	f032 427f 	bics.w	r2, r2, #4278190080	; 0xff000000
    1452:	bf08      	it	eq
    1454:	4770      	bxeq	lr
    1456:	f093 4f7f 	teq	r3, #4278190080	; 0xff000000
    145a:	bf04      	itt	eq
    145c:	f441 2100 	orreq.w	r1, r1, #524288	; 0x80000
    1460:	4770      	bxeq	lr
    1462:	b530      	push	{r4, r5, lr}
    1464:	f44f 7460 	mov.w	r4, #896	; 0x380
    1468:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
    146c:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    1470:	e71c      	b.n	12ac <__adddf3+0x138>
    1472:	bf00      	nop

00001474 <__aeabi_ul2d>:
    1474:	ea50 0201 	orrs.w	r2, r0, r1
    1478:	bf08      	it	eq
    147a:	4770      	bxeq	lr
    147c:	b530      	push	{r4, r5, lr}
    147e:	f04f 0500 	mov.w	r5, #0
    1482:	e00a      	b.n	149a <__aeabi_l2d+0x16>

00001484 <__aeabi_l2d>:
    1484:	ea50 0201 	orrs.w	r2, r0, r1
    1488:	bf08      	it	eq
    148a:	4770      	bxeq	lr
    148c:	b530      	push	{r4, r5, lr}
    148e:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
    1492:	d502      	bpl.n	149a <__aeabi_l2d+0x16>
    1494:	4240      	negs	r0, r0
    1496:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    149a:	f44f 6480 	mov.w	r4, #1024	; 0x400
    149e:	f104 0432 	add.w	r4, r4, #50	; 0x32
    14a2:	ea5f 5c91 	movs.w	ip, r1, lsr #22
    14a6:	f43f aed8 	beq.w	125a <__adddf3+0xe6>
    14aa:	f04f 0203 	mov.w	r2, #3
    14ae:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    14b2:	bf18      	it	ne
    14b4:	3203      	addne	r2, #3
    14b6:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
    14ba:	bf18      	it	ne
    14bc:	3203      	addne	r2, #3
    14be:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
    14c2:	f1c2 0320 	rsb	r3, r2, #32
    14c6:	fa00 fc03 	lsl.w	ip, r0, r3
    14ca:	fa20 f002 	lsr.w	r0, r0, r2
    14ce:	fa01 fe03 	lsl.w	lr, r1, r3
    14d2:	ea40 000e 	orr.w	r0, r0, lr
    14d6:	fa21 f102 	lsr.w	r1, r1, r2
    14da:	4414      	add	r4, r2
    14dc:	e6bd      	b.n	125a <__adddf3+0xe6>
    14de:	bf00      	nop

000014e0 <__aeabi_dmul>:
    14e0:	b570      	push	{r4, r5, r6, lr}
    14e2:	f04f 0cff 	mov.w	ip, #255	; 0xff
    14e6:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    14ea:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    14ee:	bf1d      	ittte	ne
    14f0:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    14f4:	ea94 0f0c 	teqne	r4, ip
    14f8:	ea95 0f0c 	teqne	r5, ip
    14fc:	f000 f8de 	bleq	16bc <__aeabi_dmul+0x1dc>
    1500:	442c      	add	r4, r5
    1502:	ea81 0603 	eor.w	r6, r1, r3
    1506:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
    150a:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
    150e:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
    1512:	bf18      	it	ne
    1514:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
    1518:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    151c:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
    1520:	d038      	beq.n	1594 <__aeabi_dmul+0xb4>
    1522:	fba0 ce02 	umull	ip, lr, r0, r2
    1526:	f04f 0500 	mov.w	r5, #0
    152a:	fbe1 e502 	umlal	lr, r5, r1, r2
    152e:	f006 4200 	and.w	r2, r6, #2147483648	; 0x80000000
    1532:	fbe0 e503 	umlal	lr, r5, r0, r3
    1536:	f04f 0600 	mov.w	r6, #0
    153a:	fbe1 5603 	umlal	r5, r6, r1, r3
    153e:	f09c 0f00 	teq	ip, #0
    1542:	bf18      	it	ne
    1544:	f04e 0e01 	orrne.w	lr, lr, #1
    1548:	f1a4 04ff 	sub.w	r4, r4, #255	; 0xff
    154c:	f5b6 7f00 	cmp.w	r6, #512	; 0x200
    1550:	f564 7440 	sbc.w	r4, r4, #768	; 0x300
    1554:	d204      	bcs.n	1560 <__aeabi_dmul+0x80>
    1556:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
    155a:	416d      	adcs	r5, r5
    155c:	eb46 0606 	adc.w	r6, r6, r6
    1560:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
    1564:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
    1568:	ea4f 20c5 	mov.w	r0, r5, lsl #11
    156c:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
    1570:	ea4f 2ece 	mov.w	lr, lr, lsl #11
    1574:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    1578:	bf88      	it	hi
    157a:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    157e:	d81e      	bhi.n	15be <__aeabi_dmul+0xde>
    1580:	f1be 4f00 	cmp.w	lr, #2147483648	; 0x80000000
    1584:	bf08      	it	eq
    1586:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
    158a:	f150 0000 	adcs.w	r0, r0, #0
    158e:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    1592:	bd70      	pop	{r4, r5, r6, pc}
    1594:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
    1598:	ea46 0101 	orr.w	r1, r6, r1
    159c:	ea40 0002 	orr.w	r0, r0, r2
    15a0:	ea81 0103 	eor.w	r1, r1, r3
    15a4:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
    15a8:	bfc2      	ittt	gt
    15aa:	ebd4 050c 	rsbsgt	r5, r4, ip
    15ae:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    15b2:	bd70      	popgt	{r4, r5, r6, pc}
    15b4:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    15b8:	f04f 0e00 	mov.w	lr, #0
    15bc:	3c01      	subs	r4, #1
    15be:	f300 80ab 	bgt.w	1718 <__aeabi_dmul+0x238>
    15c2:	f114 0f36 	cmn.w	r4, #54	; 0x36
    15c6:	bfde      	ittt	le
    15c8:	2000      	movle	r0, #0
    15ca:	f001 4100 	andle.w	r1, r1, #2147483648	; 0x80000000
    15ce:	bd70      	pople	{r4, r5, r6, pc}
    15d0:	f1c4 0400 	rsb	r4, r4, #0
    15d4:	3c20      	subs	r4, #32
    15d6:	da35      	bge.n	1644 <__aeabi_dmul+0x164>
    15d8:	340c      	adds	r4, #12
    15da:	dc1b      	bgt.n	1614 <__aeabi_dmul+0x134>
    15dc:	f104 0414 	add.w	r4, r4, #20
    15e0:	f1c4 0520 	rsb	r5, r4, #32
    15e4:	fa00 f305 	lsl.w	r3, r0, r5
    15e8:	fa20 f004 	lsr.w	r0, r0, r4
    15ec:	fa01 f205 	lsl.w	r2, r1, r5
    15f0:	ea40 0002 	orr.w	r0, r0, r2
    15f4:	f001 4200 	and.w	r2, r1, #2147483648	; 0x80000000
    15f8:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
    15fc:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    1600:	fa21 f604 	lsr.w	r6, r1, r4
    1604:	eb42 0106 	adc.w	r1, r2, r6
    1608:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    160c:	bf08      	it	eq
    160e:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    1612:	bd70      	pop	{r4, r5, r6, pc}
    1614:	f1c4 040c 	rsb	r4, r4, #12
    1618:	f1c4 0520 	rsb	r5, r4, #32
    161c:	fa00 f304 	lsl.w	r3, r0, r4
    1620:	fa20 f005 	lsr.w	r0, r0, r5
    1624:	fa01 f204 	lsl.w	r2, r1, r4
    1628:	ea40 0002 	orr.w	r0, r0, r2
    162c:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    1630:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
    1634:	f141 0100 	adc.w	r1, r1, #0
    1638:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    163c:	bf08      	it	eq
    163e:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    1642:	bd70      	pop	{r4, r5, r6, pc}
    1644:	f1c4 0520 	rsb	r5, r4, #32
    1648:	fa00 f205 	lsl.w	r2, r0, r5
    164c:	ea4e 0e02 	orr.w	lr, lr, r2
    1650:	fa20 f304 	lsr.w	r3, r0, r4
    1654:	fa01 f205 	lsl.w	r2, r1, r5
    1658:	ea43 0302 	orr.w	r3, r3, r2
    165c:	fa21 f004 	lsr.w	r0, r1, r4
    1660:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    1664:	fa21 f204 	lsr.w	r2, r1, r4
    1668:	ea20 0002 	bic.w	r0, r0, r2
    166c:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
    1670:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
    1674:	bf08      	it	eq
    1676:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
    167a:	bd70      	pop	{r4, r5, r6, pc}
    167c:	f094 0f00 	teq	r4, #0
    1680:	d10f      	bne.n	16a2 <__aeabi_dmul+0x1c2>
    1682:	f001 4600 	and.w	r6, r1, #2147483648	; 0x80000000
    1686:	0040      	lsls	r0, r0, #1
    1688:	eb41 0101 	adc.w	r1, r1, r1
    168c:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    1690:	bf08      	it	eq
    1692:	3c01      	subeq	r4, #1
    1694:	d0f7      	beq.n	1686 <__aeabi_dmul+0x1a6>
    1696:	ea41 0106 	orr.w	r1, r1, r6
    169a:	f095 0f00 	teq	r5, #0
    169e:	bf18      	it	ne
    16a0:	4770      	bxne	lr
    16a2:	f003 4600 	and.w	r6, r3, #2147483648	; 0x80000000
    16a6:	0052      	lsls	r2, r2, #1
    16a8:	eb43 0303 	adc.w	r3, r3, r3
    16ac:	f413 1f80 	tst.w	r3, #1048576	; 0x100000
    16b0:	bf08      	it	eq
    16b2:	3d01      	subeq	r5, #1
    16b4:	d0f7      	beq.n	16a6 <__aeabi_dmul+0x1c6>
    16b6:	ea43 0306 	orr.w	r3, r3, r6
    16ba:	4770      	bx	lr
    16bc:	ea94 0f0c 	teq	r4, ip
    16c0:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    16c4:	bf18      	it	ne
    16c6:	ea95 0f0c 	teqne	r5, ip
    16ca:	d00c      	beq.n	16e6 <__aeabi_dmul+0x206>
    16cc:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    16d0:	bf18      	it	ne
    16d2:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    16d6:	d1d1      	bne.n	167c <__aeabi_dmul+0x19c>
    16d8:	ea81 0103 	eor.w	r1, r1, r3
    16dc:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    16e0:	f04f 0000 	mov.w	r0, #0
    16e4:	bd70      	pop	{r4, r5, r6, pc}
    16e6:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    16ea:	bf06      	itte	eq
    16ec:	4610      	moveq	r0, r2
    16ee:	4619      	moveq	r1, r3
    16f0:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    16f4:	d019      	beq.n	172a <__aeabi_dmul+0x24a>
    16f6:	ea94 0f0c 	teq	r4, ip
    16fa:	d102      	bne.n	1702 <__aeabi_dmul+0x222>
    16fc:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
    1700:	d113      	bne.n	172a <__aeabi_dmul+0x24a>
    1702:	ea95 0f0c 	teq	r5, ip
    1706:	d105      	bne.n	1714 <__aeabi_dmul+0x234>
    1708:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
    170c:	bf1c      	itt	ne
    170e:	4610      	movne	r0, r2
    1710:	4619      	movne	r1, r3
    1712:	d10a      	bne.n	172a <__aeabi_dmul+0x24a>
    1714:	ea81 0103 	eor.w	r1, r1, r3
    1718:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
    171c:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    1720:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
    1724:	f04f 0000 	mov.w	r0, #0
    1728:	bd70      	pop	{r4, r5, r6, pc}
    172a:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
    172e:	f441 0178 	orr.w	r1, r1, #16252928	; 0xf80000
    1732:	bd70      	pop	{r4, r5, r6, pc}

00001734 <__aeabi_ddiv>:
    1734:	b570      	push	{r4, r5, r6, lr}
    1736:	f04f 0cff 	mov.w	ip, #255	; 0xff
    173a:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
    173e:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
    1742:	bf1d      	ittte	ne
    1744:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
    1748:	ea94 0f0c 	teqne	r4, ip
    174c:	ea95 0f0c 	teqne	r5, ip
    1750:	f000 f8a7 	bleq	18a2 <__aeabi_ddiv+0x16e>
    1754:	eba4 0405 	sub.w	r4, r4, r5
    1758:	ea81 0e03 	eor.w	lr, r1, r3
    175c:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    1760:	ea4f 3101 	mov.w	r1, r1, lsl #12
    1764:	f000 8088 	beq.w	1878 <__aeabi_ddiv+0x144>
    1768:	ea4f 3303 	mov.w	r3, r3, lsl #12
    176c:	f04f 5580 	mov.w	r5, #268435456	; 0x10000000
    1770:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
    1774:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
    1778:	ea4f 2202 	mov.w	r2, r2, lsl #8
    177c:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
    1780:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
    1784:	ea4f 2600 	mov.w	r6, r0, lsl #8
    1788:	f00e 4100 	and.w	r1, lr, #2147483648	; 0x80000000
    178c:	429d      	cmp	r5, r3
    178e:	bf08      	it	eq
    1790:	4296      	cmpeq	r6, r2
    1792:	f144 04fd 	adc.w	r4, r4, #253	; 0xfd
    1796:	f504 7440 	add.w	r4, r4, #768	; 0x300
    179a:	d202      	bcs.n	17a2 <__aeabi_ddiv+0x6e>
    179c:	085b      	lsrs	r3, r3, #1
    179e:	ea4f 0232 	mov.w	r2, r2, rrx
    17a2:	1ab6      	subs	r6, r6, r2
    17a4:	eb65 0503 	sbc.w	r5, r5, r3
    17a8:	085b      	lsrs	r3, r3, #1
    17aa:	ea4f 0232 	mov.w	r2, r2, rrx
    17ae:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
    17b2:	f44f 2c00 	mov.w	ip, #524288	; 0x80000
    17b6:	ebb6 0e02 	subs.w	lr, r6, r2
    17ba:	eb75 0e03 	sbcs.w	lr, r5, r3
    17be:	bf22      	ittt	cs
    17c0:	1ab6      	subcs	r6, r6, r2
    17c2:	4675      	movcs	r5, lr
    17c4:	ea40 000c 	orrcs.w	r0, r0, ip
    17c8:	085b      	lsrs	r3, r3, #1
    17ca:	ea4f 0232 	mov.w	r2, r2, rrx
    17ce:	ebb6 0e02 	subs.w	lr, r6, r2
    17d2:	eb75 0e03 	sbcs.w	lr, r5, r3
    17d6:	bf22      	ittt	cs
    17d8:	1ab6      	subcs	r6, r6, r2
    17da:	4675      	movcs	r5, lr
    17dc:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    17e0:	085b      	lsrs	r3, r3, #1
    17e2:	ea4f 0232 	mov.w	r2, r2, rrx
    17e6:	ebb6 0e02 	subs.w	lr, r6, r2
    17ea:	eb75 0e03 	sbcs.w	lr, r5, r3
    17ee:	bf22      	ittt	cs
    17f0:	1ab6      	subcs	r6, r6, r2
    17f2:	4675      	movcs	r5, lr
    17f4:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    17f8:	085b      	lsrs	r3, r3, #1
    17fa:	ea4f 0232 	mov.w	r2, r2, rrx
    17fe:	ebb6 0e02 	subs.w	lr, r6, r2
    1802:	eb75 0e03 	sbcs.w	lr, r5, r3
    1806:	bf22      	ittt	cs
    1808:	1ab6      	subcs	r6, r6, r2
    180a:	4675      	movcs	r5, lr
    180c:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    1810:	ea55 0e06 	orrs.w	lr, r5, r6
    1814:	d018      	beq.n	1848 <__aeabi_ddiv+0x114>
    1816:	ea4f 1505 	mov.w	r5, r5, lsl #4
    181a:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
    181e:	ea4f 1606 	mov.w	r6, r6, lsl #4
    1822:	ea4f 03c3 	mov.w	r3, r3, lsl #3
    1826:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
    182a:	ea4f 02c2 	mov.w	r2, r2, lsl #3
    182e:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
    1832:	d1c0      	bne.n	17b6 <__aeabi_ddiv+0x82>
    1834:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    1838:	d10b      	bne.n	1852 <__aeabi_ddiv+0x11e>
    183a:	ea41 0100 	orr.w	r1, r1, r0
    183e:	f04f 0000 	mov.w	r0, #0
    1842:	f04f 4c00 	mov.w	ip, #2147483648	; 0x80000000
    1846:	e7b6      	b.n	17b6 <__aeabi_ddiv+0x82>
    1848:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
    184c:	bf04      	itt	eq
    184e:	4301      	orreq	r1, r0
    1850:	2000      	moveq	r0, #0
    1852:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
    1856:	bf88      	it	hi
    1858:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
    185c:	f63f aeaf 	bhi.w	15be <__aeabi_dmul+0xde>
    1860:	ebb5 0c03 	subs.w	ip, r5, r3
    1864:	bf04      	itt	eq
    1866:	ebb6 0c02 	subseq.w	ip, r6, r2
    186a:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
    186e:	f150 0000 	adcs.w	r0, r0, #0
    1872:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
    1876:	bd70      	pop	{r4, r5, r6, pc}
    1878:	f00e 4e00 	and.w	lr, lr, #2147483648	; 0x80000000
    187c:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
    1880:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
    1884:	bfc2      	ittt	gt
    1886:	ebd4 050c 	rsbsgt	r5, r4, ip
    188a:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
    188e:	bd70      	popgt	{r4, r5, r6, pc}
    1890:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    1894:	f04f 0e00 	mov.w	lr, #0
    1898:	3c01      	subs	r4, #1
    189a:	e690      	b.n	15be <__aeabi_dmul+0xde>
    189c:	ea45 0e06 	orr.w	lr, r5, r6
    18a0:	e68d      	b.n	15be <__aeabi_dmul+0xde>
    18a2:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
    18a6:	ea94 0f0c 	teq	r4, ip
    18aa:	bf08      	it	eq
    18ac:	ea95 0f0c 	teqeq	r5, ip
    18b0:	f43f af3b 	beq.w	172a <__aeabi_dmul+0x24a>
    18b4:	ea94 0f0c 	teq	r4, ip
    18b8:	d10a      	bne.n	18d0 <__aeabi_ddiv+0x19c>
    18ba:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
    18be:	f47f af34 	bne.w	172a <__aeabi_dmul+0x24a>
    18c2:	ea95 0f0c 	teq	r5, ip
    18c6:	f47f af25 	bne.w	1714 <__aeabi_dmul+0x234>
    18ca:	4610      	mov	r0, r2
    18cc:	4619      	mov	r1, r3
    18ce:	e72c      	b.n	172a <__aeabi_dmul+0x24a>
    18d0:	ea95 0f0c 	teq	r5, ip
    18d4:	d106      	bne.n	18e4 <__aeabi_ddiv+0x1b0>
    18d6:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
    18da:	f43f aefd 	beq.w	16d8 <__aeabi_dmul+0x1f8>
    18de:	4610      	mov	r0, r2
    18e0:	4619      	mov	r1, r3
    18e2:	e722      	b.n	172a <__aeabi_dmul+0x24a>
    18e4:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
    18e8:	bf18      	it	ne
    18ea:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
    18ee:	f47f aec5 	bne.w	167c <__aeabi_dmul+0x19c>
    18f2:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
    18f6:	f47f af0d 	bne.w	1714 <__aeabi_dmul+0x234>
    18fa:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
    18fe:	f47f aeeb 	bne.w	16d8 <__aeabi_dmul+0x1f8>
    1902:	e712      	b.n	172a <__aeabi_dmul+0x24a>

00001904 <__aeabi_d2f>:
    1904:	ea4f 0241 	mov.w	r2, r1, lsl #1
    1908:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
    190c:	bf24      	itt	cs
    190e:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
    1912:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
    1916:	d90d      	bls.n	1934 <__aeabi_d2f+0x30>
    1918:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    191c:	ea4f 02c0 	mov.w	r2, r0, lsl #3
    1920:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
    1924:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
    1928:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
    192c:	bf08      	it	eq
    192e:	f020 0001 	biceq.w	r0, r0, #1
    1932:	4770      	bx	lr
    1934:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
    1938:	d121      	bne.n	197e <__aeabi_d2f+0x7a>
    193a:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
    193e:	bfbc      	itt	lt
    1940:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
    1944:	4770      	bxlt	lr
    1946:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
    194a:	ea4f 5252 	mov.w	r2, r2, lsr #21
    194e:	f1c2 0218 	rsb	r2, r2, #24
    1952:	f1c2 0c20 	rsb	ip, r2, #32
    1956:	fa10 f30c 	lsls.w	r3, r0, ip
    195a:	fa20 f002 	lsr.w	r0, r0, r2
    195e:	bf18      	it	ne
    1960:	f040 0001 	orrne.w	r0, r0, #1
    1964:	ea4f 23c1 	mov.w	r3, r1, lsl #11
    1968:	ea4f 23d3 	mov.w	r3, r3, lsr #11
    196c:	fa03 fc0c 	lsl.w	ip, r3, ip
    1970:	ea40 000c 	orr.w	r0, r0, ip
    1974:	fa23 f302 	lsr.w	r3, r3, r2
    1978:	ea4f 0343 	mov.w	r3, r3, lsl #1
    197c:	e7cc      	b.n	1918 <__aeabi_d2f+0x14>
    197e:	ea7f 5362 	mvns.w	r3, r2, asr #21
    1982:	d107      	bne.n	1994 <__aeabi_d2f+0x90>
    1984:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
    1988:	bf1e      	ittt	ne
    198a:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
    198e:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
    1992:	4770      	bxne	lr
    1994:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
    1998:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    199c:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    19a0:	4770      	bx	lr
    19a2:	bf00      	nop

000019a4 <__aeabi_frsub>:
    19a4:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
    19a8:	e002      	b.n	19b0 <__addsf3>
    19aa:	bf00      	nop

000019ac <__aeabi_fsub>:
    19ac:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

000019b0 <__addsf3>:
    19b0:	0042      	lsls	r2, r0, #1
    19b2:	bf1f      	itttt	ne
    19b4:	ea5f 0341 	movsne.w	r3, r1, lsl #1
    19b8:	ea92 0f03 	teqne	r2, r3
    19bc:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
    19c0:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    19c4:	d06a      	beq.n	1a9c <__addsf3+0xec>
    19c6:	ea4f 6212 	mov.w	r2, r2, lsr #24
    19ca:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
    19ce:	bfc1      	itttt	gt
    19d0:	18d2      	addgt	r2, r2, r3
    19d2:	4041      	eorgt	r1, r0
    19d4:	4048      	eorgt	r0, r1
    19d6:	4041      	eorgt	r1, r0
    19d8:	bfb8      	it	lt
    19da:	425b      	neglt	r3, r3
    19dc:	2b19      	cmp	r3, #25
    19de:	bf88      	it	hi
    19e0:	4770      	bxhi	lr
    19e2:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
    19e6:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    19ea:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    19ee:	bf18      	it	ne
    19f0:	4240      	negne	r0, r0
    19f2:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
    19f6:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
    19fa:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
    19fe:	bf18      	it	ne
    1a00:	4249      	negne	r1, r1
    1a02:	ea92 0f03 	teq	r2, r3
    1a06:	d03f      	beq.n	1a88 <__addsf3+0xd8>
    1a08:	f1a2 0201 	sub.w	r2, r2, #1
    1a0c:	fa41 fc03 	asr.w	ip, r1, r3
    1a10:	eb10 000c 	adds.w	r0, r0, ip
    1a14:	f1c3 0320 	rsb	r3, r3, #32
    1a18:	fa01 f103 	lsl.w	r1, r1, r3
    1a1c:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    1a20:	d502      	bpl.n	1a28 <__addsf3+0x78>
    1a22:	4249      	negs	r1, r1
    1a24:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
    1a28:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    1a2c:	d313      	bcc.n	1a56 <__addsf3+0xa6>
    1a2e:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
    1a32:	d306      	bcc.n	1a42 <__addsf3+0x92>
    1a34:	0840      	lsrs	r0, r0, #1
    1a36:	ea4f 0131 	mov.w	r1, r1, rrx
    1a3a:	f102 0201 	add.w	r2, r2, #1
    1a3e:	2afe      	cmp	r2, #254	; 0xfe
    1a40:	d251      	bcs.n	1ae6 <__addsf3+0x136>
    1a42:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
    1a46:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    1a4a:	bf08      	it	eq
    1a4c:	f020 0001 	biceq.w	r0, r0, #1
    1a50:	ea40 0003 	orr.w	r0, r0, r3
    1a54:	4770      	bx	lr
    1a56:	0049      	lsls	r1, r1, #1
    1a58:	eb40 0000 	adc.w	r0, r0, r0
    1a5c:	3a01      	subs	r2, #1
    1a5e:	bf28      	it	cs
    1a60:	f5b0 0f00 	cmpcs.w	r0, #8388608	; 0x800000
    1a64:	d2ed      	bcs.n	1a42 <__addsf3+0x92>
    1a66:	fab0 fc80 	clz	ip, r0
    1a6a:	f1ac 0c08 	sub.w	ip, ip, #8
    1a6e:	ebb2 020c 	subs.w	r2, r2, ip
    1a72:	fa00 f00c 	lsl.w	r0, r0, ip
    1a76:	bfaa      	itet	ge
    1a78:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
    1a7c:	4252      	neglt	r2, r2
    1a7e:	4318      	orrge	r0, r3
    1a80:	bfbc      	itt	lt
    1a82:	40d0      	lsrlt	r0, r2
    1a84:	4318      	orrlt	r0, r3
    1a86:	4770      	bx	lr
    1a88:	f092 0f00 	teq	r2, #0
    1a8c:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
    1a90:	bf06      	itte	eq
    1a92:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
    1a96:	3201      	addeq	r2, #1
    1a98:	3b01      	subne	r3, #1
    1a9a:	e7b5      	b.n	1a08 <__addsf3+0x58>
    1a9c:	ea4f 0341 	mov.w	r3, r1, lsl #1
    1aa0:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    1aa4:	bf18      	it	ne
    1aa6:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    1aaa:	d021      	beq.n	1af0 <__addsf3+0x140>
    1aac:	ea92 0f03 	teq	r2, r3
    1ab0:	d004      	beq.n	1abc <__addsf3+0x10c>
    1ab2:	f092 0f00 	teq	r2, #0
    1ab6:	bf08      	it	eq
    1ab8:	4608      	moveq	r0, r1
    1aba:	4770      	bx	lr
    1abc:	ea90 0f01 	teq	r0, r1
    1ac0:	bf1c      	itt	ne
    1ac2:	2000      	movne	r0, #0
    1ac4:	4770      	bxne	lr
    1ac6:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
    1aca:	d104      	bne.n	1ad6 <__addsf3+0x126>
    1acc:	0040      	lsls	r0, r0, #1
    1ace:	bf28      	it	cs
    1ad0:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
    1ad4:	4770      	bx	lr
    1ad6:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
    1ada:	bf3c      	itt	cc
    1adc:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
    1ae0:	4770      	bxcc	lr
    1ae2:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
    1ae6:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
    1aea:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    1aee:	4770      	bx	lr
    1af0:	ea7f 6222 	mvns.w	r2, r2, asr #24
    1af4:	bf16      	itet	ne
    1af6:	4608      	movne	r0, r1
    1af8:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
    1afc:	4601      	movne	r1, r0
    1afe:	0242      	lsls	r2, r0, #9
    1b00:	bf06      	itte	eq
    1b02:	ea5f 2341 	movseq.w	r3, r1, lsl #9
    1b06:	ea90 0f01 	teqeq	r0, r1
    1b0a:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
    1b0e:	4770      	bx	lr

00001b10 <__aeabi_ui2f>:
    1b10:	f04f 0300 	mov.w	r3, #0
    1b14:	e004      	b.n	1b20 <__aeabi_i2f+0x8>
    1b16:	bf00      	nop

00001b18 <__aeabi_i2f>:
    1b18:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
    1b1c:	bf48      	it	mi
    1b1e:	4240      	negmi	r0, r0
    1b20:	ea5f 0c00 	movs.w	ip, r0
    1b24:	bf08      	it	eq
    1b26:	4770      	bxeq	lr
    1b28:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
    1b2c:	4601      	mov	r1, r0
    1b2e:	f04f 0000 	mov.w	r0, #0
    1b32:	e01c      	b.n	1b6e <__aeabi_l2f+0x2a>

00001b34 <__aeabi_ul2f>:
    1b34:	ea50 0201 	orrs.w	r2, r0, r1
    1b38:	bf08      	it	eq
    1b3a:	4770      	bxeq	lr
    1b3c:	f04f 0300 	mov.w	r3, #0
    1b40:	e00a      	b.n	1b58 <__aeabi_l2f+0x14>
    1b42:	bf00      	nop

00001b44 <__aeabi_l2f>:
    1b44:	ea50 0201 	orrs.w	r2, r0, r1
    1b48:	bf08      	it	eq
    1b4a:	4770      	bxeq	lr
    1b4c:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
    1b50:	d502      	bpl.n	1b58 <__aeabi_l2f+0x14>
    1b52:	4240      	negs	r0, r0
    1b54:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
    1b58:	ea5f 0c01 	movs.w	ip, r1
    1b5c:	bf02      	ittt	eq
    1b5e:	4684      	moveq	ip, r0
    1b60:	4601      	moveq	r1, r0
    1b62:	2000      	moveq	r0, #0
    1b64:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
    1b68:	bf08      	it	eq
    1b6a:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
    1b6e:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
    1b72:	fabc f28c 	clz	r2, ip
    1b76:	3a08      	subs	r2, #8
    1b78:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
    1b7c:	db10      	blt.n	1ba0 <__aeabi_l2f+0x5c>
    1b7e:	fa01 fc02 	lsl.w	ip, r1, r2
    1b82:	4463      	add	r3, ip
    1b84:	fa00 fc02 	lsl.w	ip, r0, r2
    1b88:	f1c2 0220 	rsb	r2, r2, #32
    1b8c:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
    1b90:	fa20 f202 	lsr.w	r2, r0, r2
    1b94:	eb43 0002 	adc.w	r0, r3, r2
    1b98:	bf08      	it	eq
    1b9a:	f020 0001 	biceq.w	r0, r0, #1
    1b9e:	4770      	bx	lr
    1ba0:	f102 0220 	add.w	r2, r2, #32
    1ba4:	fa01 fc02 	lsl.w	ip, r1, r2
    1ba8:	f1c2 0220 	rsb	r2, r2, #32
    1bac:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
    1bb0:	fa21 f202 	lsr.w	r2, r1, r2
    1bb4:	eb43 0002 	adc.w	r0, r3, r2
    1bb8:	bf08      	it	eq
    1bba:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    1bbe:	4770      	bx	lr

00001bc0 <__aeabi_fmul>:
    1bc0:	f04f 0cff 	mov.w	ip, #255	; 0xff
    1bc4:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    1bc8:	bf1e      	ittt	ne
    1bca:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    1bce:	ea92 0f0c 	teqne	r2, ip
    1bd2:	ea93 0f0c 	teqne	r3, ip
    1bd6:	d06f      	beq.n	1cb8 <__aeabi_fmul+0xf8>
    1bd8:	441a      	add	r2, r3
    1bda:	ea80 0c01 	eor.w	ip, r0, r1
    1bde:	0240      	lsls	r0, r0, #9
    1be0:	bf18      	it	ne
    1be2:	ea5f 2141 	movsne.w	r1, r1, lsl #9
    1be6:	d01e      	beq.n	1c26 <__aeabi_fmul+0x66>
    1be8:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
    1bec:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
    1bf0:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
    1bf4:	fba0 3101 	umull	r3, r1, r0, r1
    1bf8:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    1bfc:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
    1c00:	bf3e      	ittt	cc
    1c02:	0049      	lslcc	r1, r1, #1
    1c04:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
    1c08:	005b      	lslcc	r3, r3, #1
    1c0a:	ea40 0001 	orr.w	r0, r0, r1
    1c0e:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
    1c12:	2afd      	cmp	r2, #253	; 0xfd
    1c14:	d81d      	bhi.n	1c52 <__aeabi_fmul+0x92>
    1c16:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    1c1a:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    1c1e:	bf08      	it	eq
    1c20:	f020 0001 	biceq.w	r0, r0, #1
    1c24:	4770      	bx	lr
    1c26:	f090 0f00 	teq	r0, #0
    1c2a:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    1c2e:	bf08      	it	eq
    1c30:	0249      	lsleq	r1, r1, #9
    1c32:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    1c36:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
    1c3a:	3a7f      	subs	r2, #127	; 0x7f
    1c3c:	bfc2      	ittt	gt
    1c3e:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    1c42:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    1c46:	4770      	bxgt	lr
    1c48:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    1c4c:	f04f 0300 	mov.w	r3, #0
    1c50:	3a01      	subs	r2, #1
    1c52:	dc5d      	bgt.n	1d10 <__aeabi_fmul+0x150>
    1c54:	f112 0f19 	cmn.w	r2, #25
    1c58:	bfdc      	itt	le
    1c5a:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
    1c5e:	4770      	bxle	lr
    1c60:	f1c2 0200 	rsb	r2, r2, #0
    1c64:	0041      	lsls	r1, r0, #1
    1c66:	fa21 f102 	lsr.w	r1, r1, r2
    1c6a:	f1c2 0220 	rsb	r2, r2, #32
    1c6e:	fa00 fc02 	lsl.w	ip, r0, r2
    1c72:	ea5f 0031 	movs.w	r0, r1, rrx
    1c76:	f140 0000 	adc.w	r0, r0, #0
    1c7a:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
    1c7e:	bf08      	it	eq
    1c80:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
    1c84:	4770      	bx	lr
    1c86:	f092 0f00 	teq	r2, #0
    1c8a:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    1c8e:	bf02      	ittt	eq
    1c90:	0040      	lsleq	r0, r0, #1
    1c92:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    1c96:	3a01      	subeq	r2, #1
    1c98:	d0f9      	beq.n	1c8e <__aeabi_fmul+0xce>
    1c9a:	ea40 000c 	orr.w	r0, r0, ip
    1c9e:	f093 0f00 	teq	r3, #0
    1ca2:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    1ca6:	bf02      	ittt	eq
    1ca8:	0049      	lsleq	r1, r1, #1
    1caa:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    1cae:	3b01      	subeq	r3, #1
    1cb0:	d0f9      	beq.n	1ca6 <__aeabi_fmul+0xe6>
    1cb2:	ea41 010c 	orr.w	r1, r1, ip
    1cb6:	e78f      	b.n	1bd8 <__aeabi_fmul+0x18>
    1cb8:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    1cbc:	ea92 0f0c 	teq	r2, ip
    1cc0:	bf18      	it	ne
    1cc2:	ea93 0f0c 	teqne	r3, ip
    1cc6:	d00a      	beq.n	1cde <__aeabi_fmul+0x11e>
    1cc8:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    1ccc:	bf18      	it	ne
    1cce:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    1cd2:	d1d8      	bne.n	1c86 <__aeabi_fmul+0xc6>
    1cd4:	ea80 0001 	eor.w	r0, r0, r1
    1cd8:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    1cdc:	4770      	bx	lr
    1cde:	f090 0f00 	teq	r0, #0
    1ce2:	bf17      	itett	ne
    1ce4:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
    1ce8:	4608      	moveq	r0, r1
    1cea:	f091 0f00 	teqne	r1, #0
    1cee:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
    1cf2:	d014      	beq.n	1d1e <__aeabi_fmul+0x15e>
    1cf4:	ea92 0f0c 	teq	r2, ip
    1cf8:	d101      	bne.n	1cfe <__aeabi_fmul+0x13e>
    1cfa:	0242      	lsls	r2, r0, #9
    1cfc:	d10f      	bne.n	1d1e <__aeabi_fmul+0x15e>
    1cfe:	ea93 0f0c 	teq	r3, ip
    1d02:	d103      	bne.n	1d0c <__aeabi_fmul+0x14c>
    1d04:	024b      	lsls	r3, r1, #9
    1d06:	bf18      	it	ne
    1d08:	4608      	movne	r0, r1
    1d0a:	d108      	bne.n	1d1e <__aeabi_fmul+0x15e>
    1d0c:	ea80 0001 	eor.w	r0, r0, r1
    1d10:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
    1d14:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    1d18:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    1d1c:	4770      	bx	lr
    1d1e:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
    1d22:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
    1d26:	4770      	bx	lr

00001d28 <__aeabi_fdiv>:
    1d28:	f04f 0cff 	mov.w	ip, #255	; 0xff
    1d2c:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
    1d30:	bf1e      	ittt	ne
    1d32:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
    1d36:	ea92 0f0c 	teqne	r2, ip
    1d3a:	ea93 0f0c 	teqne	r3, ip
    1d3e:	d069      	beq.n	1e14 <__aeabi_fdiv+0xec>
    1d40:	eba2 0203 	sub.w	r2, r2, r3
    1d44:	ea80 0c01 	eor.w	ip, r0, r1
    1d48:	0249      	lsls	r1, r1, #9
    1d4a:	ea4f 2040 	mov.w	r0, r0, lsl #9
    1d4e:	d037      	beq.n	1dc0 <__aeabi_fdiv+0x98>
    1d50:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    1d54:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
    1d58:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
    1d5c:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
    1d60:	428b      	cmp	r3, r1
    1d62:	bf38      	it	cc
    1d64:	005b      	lslcc	r3, r3, #1
    1d66:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
    1d6a:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
    1d6e:	428b      	cmp	r3, r1
    1d70:	bf24      	itt	cs
    1d72:	1a5b      	subcs	r3, r3, r1
    1d74:	ea40 000c 	orrcs.w	r0, r0, ip
    1d78:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
    1d7c:	bf24      	itt	cs
    1d7e:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
    1d82:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
    1d86:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
    1d8a:	bf24      	itt	cs
    1d8c:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
    1d90:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
    1d94:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
    1d98:	bf24      	itt	cs
    1d9a:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
    1d9e:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
    1da2:	011b      	lsls	r3, r3, #4
    1da4:	bf18      	it	ne
    1da6:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
    1daa:	d1e0      	bne.n	1d6e <__aeabi_fdiv+0x46>
    1dac:	2afd      	cmp	r2, #253	; 0xfd
    1dae:	f63f af50 	bhi.w	1c52 <__aeabi_fmul+0x92>
    1db2:	428b      	cmp	r3, r1
    1db4:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
    1db8:	bf08      	it	eq
    1dba:	f020 0001 	biceq.w	r0, r0, #1
    1dbe:	4770      	bx	lr
    1dc0:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
    1dc4:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
    1dc8:	327f      	adds	r2, #127	; 0x7f
    1dca:	bfc2      	ittt	gt
    1dcc:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
    1dd0:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
    1dd4:	4770      	bxgt	lr
    1dd6:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
    1dda:	f04f 0300 	mov.w	r3, #0
    1dde:	3a01      	subs	r2, #1
    1de0:	e737      	b.n	1c52 <__aeabi_fmul+0x92>
    1de2:	f092 0f00 	teq	r2, #0
    1de6:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
    1dea:	bf02      	ittt	eq
    1dec:	0040      	lsleq	r0, r0, #1
    1dee:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
    1df2:	3a01      	subeq	r2, #1
    1df4:	d0f9      	beq.n	1dea <__aeabi_fdiv+0xc2>
    1df6:	ea40 000c 	orr.w	r0, r0, ip
    1dfa:	f093 0f00 	teq	r3, #0
    1dfe:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
    1e02:	bf02      	ittt	eq
    1e04:	0049      	lsleq	r1, r1, #1
    1e06:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
    1e0a:	3b01      	subeq	r3, #1
    1e0c:	d0f9      	beq.n	1e02 <__aeabi_fdiv+0xda>
    1e0e:	ea41 010c 	orr.w	r1, r1, ip
    1e12:	e795      	b.n	1d40 <__aeabi_fdiv+0x18>
    1e14:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
    1e18:	ea92 0f0c 	teq	r2, ip
    1e1c:	d108      	bne.n	1e30 <__aeabi_fdiv+0x108>
    1e1e:	0242      	lsls	r2, r0, #9
    1e20:	f47f af7d 	bne.w	1d1e <__aeabi_fmul+0x15e>
    1e24:	ea93 0f0c 	teq	r3, ip
    1e28:	f47f af70 	bne.w	1d0c <__aeabi_fmul+0x14c>
    1e2c:	4608      	mov	r0, r1
    1e2e:	e776      	b.n	1d1e <__aeabi_fmul+0x15e>
    1e30:	ea93 0f0c 	teq	r3, ip
    1e34:	d104      	bne.n	1e40 <__aeabi_fdiv+0x118>
    1e36:	024b      	lsls	r3, r1, #9
    1e38:	f43f af4c 	beq.w	1cd4 <__aeabi_fmul+0x114>
    1e3c:	4608      	mov	r0, r1
    1e3e:	e76e      	b.n	1d1e <__aeabi_fmul+0x15e>
    1e40:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
    1e44:	bf18      	it	ne
    1e46:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
    1e4a:	d1ca      	bne.n	1de2 <__aeabi_fdiv+0xba>
    1e4c:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
    1e50:	f47f af5c 	bne.w	1d0c <__aeabi_fmul+0x14c>
    1e54:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
    1e58:	f47f af3c 	bne.w	1cd4 <__aeabi_fmul+0x114>
    1e5c:	e75f      	b.n	1d1e <__aeabi_fmul+0x15e>
    1e5e:	bf00      	nop

00001e60 <__gesf2>:
    1e60:	f04f 3cff 	mov.w	ip, #4294967295	; 0xffffffff
    1e64:	e006      	b.n	1e74 <__cmpsf2+0x4>
    1e66:	bf00      	nop

00001e68 <__lesf2>:
    1e68:	f04f 0c01 	mov.w	ip, #1
    1e6c:	e002      	b.n	1e74 <__cmpsf2+0x4>
    1e6e:	bf00      	nop

00001e70 <__cmpsf2>:
    1e70:	f04f 0c01 	mov.w	ip, #1
    1e74:	f84d cd04 	str.w	ip, [sp, #-4]!
    1e78:	ea4f 0240 	mov.w	r2, r0, lsl #1
    1e7c:	ea4f 0341 	mov.w	r3, r1, lsl #1
    1e80:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    1e84:	bf18      	it	ne
    1e86:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
    1e8a:	d011      	beq.n	1eb0 <__cmpsf2+0x40>
    1e8c:	b001      	add	sp, #4
    1e8e:	ea52 0c53 	orrs.w	ip, r2, r3, lsr #1
    1e92:	bf18      	it	ne
    1e94:	ea90 0f01 	teqne	r0, r1
    1e98:	bf58      	it	pl
    1e9a:	ebb2 0003 	subspl.w	r0, r2, r3
    1e9e:	bf88      	it	hi
    1ea0:	17c8      	asrhi	r0, r1, #31
    1ea2:	bf38      	it	cc
    1ea4:	ea6f 70e1 	mvncc.w	r0, r1, asr #31
    1ea8:	bf18      	it	ne
    1eaa:	f040 0001 	orrne.w	r0, r0, #1
    1eae:	4770      	bx	lr
    1eb0:	ea7f 6c22 	mvns.w	ip, r2, asr #24
    1eb4:	d102      	bne.n	1ebc <__cmpsf2+0x4c>
    1eb6:	ea5f 2c40 	movs.w	ip, r0, lsl #9
    1eba:	d105      	bne.n	1ec8 <__cmpsf2+0x58>
    1ebc:	ea7f 6c23 	mvns.w	ip, r3, asr #24
    1ec0:	d1e4      	bne.n	1e8c <__cmpsf2+0x1c>
    1ec2:	ea5f 2c41 	movs.w	ip, r1, lsl #9
    1ec6:	d0e1      	beq.n	1e8c <__cmpsf2+0x1c>
    1ec8:	f85d 0b04 	ldr.w	r0, [sp], #4
    1ecc:	4770      	bx	lr
    1ece:	bf00      	nop

00001ed0 <__aeabi_cfrcmple>:
    1ed0:	4684      	mov	ip, r0
    1ed2:	4608      	mov	r0, r1
    1ed4:	4661      	mov	r1, ip
    1ed6:	e7ff      	b.n	1ed8 <__aeabi_cfcmpeq>

00001ed8 <__aeabi_cfcmpeq>:
    1ed8:	b50f      	push	{r0, r1, r2, r3, lr}
    1eda:	f7ff ffc9 	bl	1e70 <__cmpsf2>
    1ede:	2800      	cmp	r0, #0
    1ee0:	bf48      	it	mi
    1ee2:	f110 0f00 	cmnmi.w	r0, #0
    1ee6:	bd0f      	pop	{r0, r1, r2, r3, pc}

00001ee8 <__aeabi_fcmpeq>:
    1ee8:	f84d ed08 	str.w	lr, [sp, #-8]!
    1eec:	f7ff fff4 	bl	1ed8 <__aeabi_cfcmpeq>
    1ef0:	bf0c      	ite	eq
    1ef2:	2001      	moveq	r0, #1
    1ef4:	2000      	movne	r0, #0
    1ef6:	f85d fb08 	ldr.w	pc, [sp], #8
    1efa:	bf00      	nop

00001efc <__aeabi_fcmplt>:
    1efc:	f84d ed08 	str.w	lr, [sp, #-8]!
    1f00:	f7ff ffea 	bl	1ed8 <__aeabi_cfcmpeq>
    1f04:	bf34      	ite	cc
    1f06:	2001      	movcc	r0, #1
    1f08:	2000      	movcs	r0, #0
    1f0a:	f85d fb08 	ldr.w	pc, [sp], #8
    1f0e:	bf00      	nop

00001f10 <__aeabi_fcmple>:
    1f10:	f84d ed08 	str.w	lr, [sp, #-8]!
    1f14:	f7ff ffe0 	bl	1ed8 <__aeabi_cfcmpeq>
    1f18:	bf94      	ite	ls
    1f1a:	2001      	movls	r0, #1
    1f1c:	2000      	movhi	r0, #0
    1f1e:	f85d fb08 	ldr.w	pc, [sp], #8
    1f22:	bf00      	nop

00001f24 <__aeabi_fcmpge>:
    1f24:	f84d ed08 	str.w	lr, [sp, #-8]!
    1f28:	f7ff ffd2 	bl	1ed0 <__aeabi_cfrcmple>
    1f2c:	bf94      	ite	ls
    1f2e:	2001      	movls	r0, #1
    1f30:	2000      	movhi	r0, #0
    1f32:	f85d fb08 	ldr.w	pc, [sp], #8
    1f36:	bf00      	nop

00001f38 <__aeabi_fcmpgt>:
    1f38:	f84d ed08 	str.w	lr, [sp, #-8]!
    1f3c:	f7ff ffc8 	bl	1ed0 <__aeabi_cfrcmple>
    1f40:	bf34      	ite	cc
    1f42:	2001      	movcc	r0, #1
    1f44:	2000      	movcs	r0, #0
    1f46:	f85d fb08 	ldr.w	pc, [sp], #8
    1f4a:	bf00      	nop

00001f4c <__aeabi_f2uiz>:
    1f4c:	0042      	lsls	r2, r0, #1
    1f4e:	d20e      	bcs.n	1f6e <__aeabi_f2uiz+0x22>
    1f50:	f1b2 4ffe 	cmp.w	r2, #2130706432	; 0x7f000000
    1f54:	d30b      	bcc.n	1f6e <__aeabi_f2uiz+0x22>
    1f56:	f04f 039e 	mov.w	r3, #158	; 0x9e
    1f5a:	ebb3 6212 	subs.w	r2, r3, r2, lsr #24
    1f5e:	d409      	bmi.n	1f74 <__aeabi_f2uiz+0x28>
    1f60:	ea4f 2300 	mov.w	r3, r0, lsl #8
    1f64:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
    1f68:	fa23 f002 	lsr.w	r0, r3, r2
    1f6c:	4770      	bx	lr
    1f6e:	f04f 0000 	mov.w	r0, #0
    1f72:	4770      	bx	lr
    1f74:	f112 0f61 	cmn.w	r2, #97	; 0x61
    1f78:	d101      	bne.n	1f7e <__aeabi_f2uiz+0x32>
    1f7a:	0242      	lsls	r2, r0, #9
    1f7c:	d102      	bne.n	1f84 <__aeabi_f2uiz+0x38>
    1f7e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1f82:	4770      	bx	lr
    1f84:	f04f 0000 	mov.w	r0, #0
    1f88:	4770      	bx	lr
    1f8a:	bf00      	nop

00001f8c <exit>:
    1f8c:	b508      	push	{r3, lr}
    1f8e:	4b07      	ldr	r3, [pc, #28]	; (1fac <exit+0x20>)
    1f90:	4604      	mov	r4, r0
    1f92:	b113      	cbz	r3, 1f9a <exit+0xe>
    1f94:	2100      	movs	r1, #0
    1f96:	f3af 8000 	nop.w
    1f9a:	4b05      	ldr	r3, [pc, #20]	; (1fb0 <exit+0x24>)
    1f9c:	6818      	ldr	r0, [r3, #0]
    1f9e:	6a83      	ldr	r3, [r0, #40]	; 0x28
    1fa0:	b103      	cbz	r3, 1fa4 <exit+0x18>
    1fa2:	4798      	blx	r3
    1fa4:	4620      	mov	r0, r4
    1fa6:	f000 fc95 	bl	28d4 <_exit>
    1faa:	bf00      	nop
    1fac:	00000000 	andeq	r0, r0, r0
    1fb0:	00002a58 	andeq	r2, r0, r8, asr sl

00001fb4 <strlen>:
    1fb4:	4603      	mov	r3, r0
    1fb6:	f813 2b01 	ldrb.w	r2, [r3], #1
    1fba:	2a00      	cmp	r2, #0
    1fbc:	d1fb      	bne.n	1fb6 <strlen+0x2>
    1fbe:	1a18      	subs	r0, r3, r0
    1fc0:	3801      	subs	r0, #1
    1fc2:	4770      	bx	lr

00001fc4 <_vsiprintf_r>:
    1fc4:	b500      	push	{lr}
    1fc6:	b09b      	sub	sp, #108	; 0x6c
    1fc8:	9100      	str	r1, [sp, #0]
    1fca:	9104      	str	r1, [sp, #16]
    1fcc:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
    1fd0:	9105      	str	r1, [sp, #20]
    1fd2:	9102      	str	r1, [sp, #8]
    1fd4:	4905      	ldr	r1, [pc, #20]	; (1fec <_vsiprintf_r+0x28>)
    1fd6:	9103      	str	r1, [sp, #12]
    1fd8:	4669      	mov	r1, sp
    1fda:	f000 f86f 	bl	20bc <_svfiprintf_r>
    1fde:	2200      	movs	r2, #0
    1fe0:	9b00      	ldr	r3, [sp, #0]
    1fe2:	701a      	strb	r2, [r3, #0]
    1fe4:	b01b      	add	sp, #108	; 0x6c
    1fe6:	f85d fb04 	ldr.w	pc, [sp], #4
    1fea:	bf00      	nop
    1fec:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

00001ff0 <vsiprintf>:
    1ff0:	4613      	mov	r3, r2
    1ff2:	460a      	mov	r2, r1
    1ff4:	4601      	mov	r1, r0
    1ff6:	4802      	ldr	r0, [pc, #8]	; (2000 <__RAM_SIZE>)
    1ff8:	6800      	ldr	r0, [r0, #0]
    1ffa:	f7ff bfe3 	b.w	1fc4 <_vsiprintf_r>
    1ffe:	bf00      	nop
    2000:	000202a8 	andeq	r0, r2, r8, lsr #5

00002004 <__ssputs_r>:
    2004:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2008:	688e      	ldr	r6, [r1, #8]
    200a:	4682      	mov	sl, r0
    200c:	429e      	cmp	r6, r3
    200e:	460c      	mov	r4, r1
    2010:	4690      	mov	r8, r2
    2012:	461f      	mov	r7, r3
    2014:	d838      	bhi.n	2088 <__ssputs_r+0x84>
    2016:	898a      	ldrh	r2, [r1, #12]
    2018:	f412 6f90 	tst.w	r2, #1152	; 0x480
    201c:	d032      	beq.n	2084 <__ssputs_r+0x80>
    201e:	6825      	ldr	r5, [r4, #0]
    2020:	6909      	ldr	r1, [r1, #16]
    2022:	3301      	adds	r3, #1
    2024:	eba5 0901 	sub.w	r9, r5, r1
    2028:	6965      	ldr	r5, [r4, #20]
    202a:	444b      	add	r3, r9
    202c:	eb05 0545 	add.w	r5, r5, r5, lsl #1
    2030:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
    2034:	106d      	asrs	r5, r5, #1
    2036:	429d      	cmp	r5, r3
    2038:	bf38      	it	cc
    203a:	461d      	movcc	r5, r3
    203c:	0553      	lsls	r3, r2, #21
    203e:	d531      	bpl.n	20a4 <__ssputs_r+0xa0>
    2040:	4629      	mov	r1, r5
    2042:	f000 fb6f 	bl	2724 <_malloc_r>
    2046:	4606      	mov	r6, r0
    2048:	b950      	cbnz	r0, 2060 <__ssputs_r+0x5c>
    204a:	230c      	movs	r3, #12
    204c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    2050:	f8ca 3000 	str.w	r3, [sl]
    2054:	89a3      	ldrh	r3, [r4, #12]
    2056:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    205a:	81a3      	strh	r3, [r4, #12]
    205c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2060:	464a      	mov	r2, r9
    2062:	6921      	ldr	r1, [r4, #16]
    2064:	f000 face 	bl	2604 <memcpy>
    2068:	89a3      	ldrh	r3, [r4, #12]
    206a:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
    206e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2072:	81a3      	strh	r3, [r4, #12]
    2074:	6126      	str	r6, [r4, #16]
    2076:	444e      	add	r6, r9
    2078:	6026      	str	r6, [r4, #0]
    207a:	463e      	mov	r6, r7
    207c:	6165      	str	r5, [r4, #20]
    207e:	eba5 0509 	sub.w	r5, r5, r9
    2082:	60a5      	str	r5, [r4, #8]
    2084:	42be      	cmp	r6, r7
    2086:	d900      	bls.n	208a <__ssputs_r+0x86>
    2088:	463e      	mov	r6, r7
    208a:	4632      	mov	r2, r6
    208c:	4641      	mov	r1, r8
    208e:	6820      	ldr	r0, [r4, #0]
    2090:	f000 fac6 	bl	2620 <memmove>
    2094:	68a3      	ldr	r3, [r4, #8]
    2096:	2000      	movs	r0, #0
    2098:	1b9b      	subs	r3, r3, r6
    209a:	60a3      	str	r3, [r4, #8]
    209c:	6823      	ldr	r3, [r4, #0]
    209e:	4433      	add	r3, r6
    20a0:	6023      	str	r3, [r4, #0]
    20a2:	e7db      	b.n	205c <__ssputs_r+0x58>
    20a4:	462a      	mov	r2, r5
    20a6:	f000 fbb1 	bl	280c <_realloc_r>
    20aa:	4606      	mov	r6, r0
    20ac:	2800      	cmp	r0, #0
    20ae:	d1e1      	bne.n	2074 <__ssputs_r+0x70>
    20b0:	4650      	mov	r0, sl
    20b2:	6921      	ldr	r1, [r4, #16]
    20b4:	f000 face 	bl	2654 <_free_r>
    20b8:	e7c7      	b.n	204a <__ssputs_r+0x46>
	...

000020bc <_svfiprintf_r>:
    20bc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    20c0:	4698      	mov	r8, r3
    20c2:	898b      	ldrh	r3, [r1, #12]
    20c4:	4607      	mov	r7, r0
    20c6:	061b      	lsls	r3, r3, #24
    20c8:	460d      	mov	r5, r1
    20ca:	4614      	mov	r4, r2
    20cc:	b09d      	sub	sp, #116	; 0x74
    20ce:	d50e      	bpl.n	20ee <_svfiprintf_r+0x32>
    20d0:	690b      	ldr	r3, [r1, #16]
    20d2:	b963      	cbnz	r3, 20ee <_svfiprintf_r+0x32>
    20d4:	2140      	movs	r1, #64	; 0x40
    20d6:	f000 fb25 	bl	2724 <_malloc_r>
    20da:	6028      	str	r0, [r5, #0]
    20dc:	6128      	str	r0, [r5, #16]
    20de:	b920      	cbnz	r0, 20ea <_svfiprintf_r+0x2e>
    20e0:	230c      	movs	r3, #12
    20e2:	603b      	str	r3, [r7, #0]
    20e4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    20e8:	e0d1      	b.n	228e <_svfiprintf_r+0x1d2>
    20ea:	2340      	movs	r3, #64	; 0x40
    20ec:	616b      	str	r3, [r5, #20]
    20ee:	2300      	movs	r3, #0
    20f0:	9309      	str	r3, [sp, #36]	; 0x24
    20f2:	2320      	movs	r3, #32
    20f4:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
    20f8:	2330      	movs	r3, #48	; 0x30
    20fa:	f04f 0901 	mov.w	r9, #1
    20fe:	f8cd 800c 	str.w	r8, [sp, #12]
    2102:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 22a8 <_svfiprintf_r+0x1ec>
    2106:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
    210a:	4623      	mov	r3, r4
    210c:	469a      	mov	sl, r3
    210e:	f813 2b01 	ldrb.w	r2, [r3], #1
    2112:	b10a      	cbz	r2, 2118 <_svfiprintf_r+0x5c>
    2114:	2a25      	cmp	r2, #37	; 0x25
    2116:	d1f9      	bne.n	210c <_svfiprintf_r+0x50>
    2118:	ebba 0b04 	subs.w	fp, sl, r4
    211c:	d00b      	beq.n	2136 <_svfiprintf_r+0x7a>
    211e:	465b      	mov	r3, fp
    2120:	4622      	mov	r2, r4
    2122:	4629      	mov	r1, r5
    2124:	4638      	mov	r0, r7
    2126:	f7ff ff6d 	bl	2004 <__ssputs_r>
    212a:	3001      	adds	r0, #1
    212c:	f000 80aa 	beq.w	2284 <_svfiprintf_r+0x1c8>
    2130:	9a09      	ldr	r2, [sp, #36]	; 0x24
    2132:	445a      	add	r2, fp
    2134:	9209      	str	r2, [sp, #36]	; 0x24
    2136:	f89a 3000 	ldrb.w	r3, [sl]
    213a:	2b00      	cmp	r3, #0
    213c:	f000 80a2 	beq.w	2284 <_svfiprintf_r+0x1c8>
    2140:	2300      	movs	r3, #0
    2142:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    2146:	e9cd 2305 	strd	r2, r3, [sp, #20]
    214a:	f10a 0a01 	add.w	sl, sl, #1
    214e:	9304      	str	r3, [sp, #16]
    2150:	9307      	str	r3, [sp, #28]
    2152:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
    2156:	931a      	str	r3, [sp, #104]	; 0x68
    2158:	4654      	mov	r4, sl
    215a:	2205      	movs	r2, #5
    215c:	f814 1b01 	ldrb.w	r1, [r4], #1
    2160:	4851      	ldr	r0, [pc, #324]	; (22a8 <_svfiprintf_r+0x1ec>)
    2162:	f000 fa41 	bl	25e8 <memchr>
    2166:	9a04      	ldr	r2, [sp, #16]
    2168:	b9d8      	cbnz	r0, 21a2 <_svfiprintf_r+0xe6>
    216a:	06d0      	lsls	r0, r2, #27
    216c:	bf44      	itt	mi
    216e:	2320      	movmi	r3, #32
    2170:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    2174:	0711      	lsls	r1, r2, #28
    2176:	bf44      	itt	mi
    2178:	232b      	movmi	r3, #43	; 0x2b
    217a:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    217e:	f89a 3000 	ldrb.w	r3, [sl]
    2182:	2b2a      	cmp	r3, #42	; 0x2a
    2184:	d015      	beq.n	21b2 <_svfiprintf_r+0xf6>
    2186:	4654      	mov	r4, sl
    2188:	2000      	movs	r0, #0
    218a:	f04f 0c0a 	mov.w	ip, #10
    218e:	9a07      	ldr	r2, [sp, #28]
    2190:	4621      	mov	r1, r4
    2192:	f811 3b01 	ldrb.w	r3, [r1], #1
    2196:	3b30      	subs	r3, #48	; 0x30
    2198:	2b09      	cmp	r3, #9
    219a:	d94e      	bls.n	223a <_svfiprintf_r+0x17e>
    219c:	b1b0      	cbz	r0, 21cc <_svfiprintf_r+0x110>
    219e:	9207      	str	r2, [sp, #28]
    21a0:	e014      	b.n	21cc <_svfiprintf_r+0x110>
    21a2:	eba0 0308 	sub.w	r3, r0, r8
    21a6:	fa09 f303 	lsl.w	r3, r9, r3
    21aa:	4313      	orrs	r3, r2
    21ac:	46a2      	mov	sl, r4
    21ae:	9304      	str	r3, [sp, #16]
    21b0:	e7d2      	b.n	2158 <_svfiprintf_r+0x9c>
    21b2:	9b03      	ldr	r3, [sp, #12]
    21b4:	1d19      	adds	r1, r3, #4
    21b6:	681b      	ldr	r3, [r3, #0]
    21b8:	9103      	str	r1, [sp, #12]
    21ba:	2b00      	cmp	r3, #0
    21bc:	bfbb      	ittet	lt
    21be:	425b      	neglt	r3, r3
    21c0:	f042 0202 	orrlt.w	r2, r2, #2
    21c4:	9307      	strge	r3, [sp, #28]
    21c6:	9307      	strlt	r3, [sp, #28]
    21c8:	bfb8      	it	lt
    21ca:	9204      	strlt	r2, [sp, #16]
    21cc:	7823      	ldrb	r3, [r4, #0]
    21ce:	2b2e      	cmp	r3, #46	; 0x2e
    21d0:	d10c      	bne.n	21ec <_svfiprintf_r+0x130>
    21d2:	7863      	ldrb	r3, [r4, #1]
    21d4:	2b2a      	cmp	r3, #42	; 0x2a
    21d6:	d135      	bne.n	2244 <_svfiprintf_r+0x188>
    21d8:	9b03      	ldr	r3, [sp, #12]
    21da:	3402      	adds	r4, #2
    21dc:	1d1a      	adds	r2, r3, #4
    21de:	681b      	ldr	r3, [r3, #0]
    21e0:	9203      	str	r2, [sp, #12]
    21e2:	2b00      	cmp	r3, #0
    21e4:	bfb8      	it	lt
    21e6:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
    21ea:	9305      	str	r3, [sp, #20]
    21ec:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 22ac <_svfiprintf_r+0x1f0>
    21f0:	2203      	movs	r2, #3
    21f2:	4650      	mov	r0, sl
    21f4:	7821      	ldrb	r1, [r4, #0]
    21f6:	f000 f9f7 	bl	25e8 <memchr>
    21fa:	b140      	cbz	r0, 220e <_svfiprintf_r+0x152>
    21fc:	2340      	movs	r3, #64	; 0x40
    21fe:	eba0 000a 	sub.w	r0, r0, sl
    2202:	fa03 f000 	lsl.w	r0, r3, r0
    2206:	9b04      	ldr	r3, [sp, #16]
    2208:	3401      	adds	r4, #1
    220a:	4303      	orrs	r3, r0
    220c:	9304      	str	r3, [sp, #16]
    220e:	f814 1b01 	ldrb.w	r1, [r4], #1
    2212:	2206      	movs	r2, #6
    2214:	4826      	ldr	r0, [pc, #152]	; (22b0 <_svfiprintf_r+0x1f4>)
    2216:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
    221a:	f000 f9e5 	bl	25e8 <memchr>
    221e:	2800      	cmp	r0, #0
    2220:	d038      	beq.n	2294 <_svfiprintf_r+0x1d8>
    2222:	4b24      	ldr	r3, [pc, #144]	; (22b4 <_svfiprintf_r+0x1f8>)
    2224:	bb1b      	cbnz	r3, 226e <_svfiprintf_r+0x1b2>
    2226:	9b03      	ldr	r3, [sp, #12]
    2228:	3307      	adds	r3, #7
    222a:	f023 0307 	bic.w	r3, r3, #7
    222e:	3308      	adds	r3, #8
    2230:	9303      	str	r3, [sp, #12]
    2232:	9b09      	ldr	r3, [sp, #36]	; 0x24
    2234:	4433      	add	r3, r6
    2236:	9309      	str	r3, [sp, #36]	; 0x24
    2238:	e767      	b.n	210a <_svfiprintf_r+0x4e>
    223a:	460c      	mov	r4, r1
    223c:	2001      	movs	r0, #1
    223e:	fb0c 3202 	mla	r2, ip, r2, r3
    2242:	e7a5      	b.n	2190 <_svfiprintf_r+0xd4>
    2244:	2300      	movs	r3, #0
    2246:	f04f 0c0a 	mov.w	ip, #10
    224a:	4619      	mov	r1, r3
    224c:	3401      	adds	r4, #1
    224e:	9305      	str	r3, [sp, #20]
    2250:	4620      	mov	r0, r4
    2252:	f810 2b01 	ldrb.w	r2, [r0], #1
    2256:	3a30      	subs	r2, #48	; 0x30
    2258:	2a09      	cmp	r2, #9
    225a:	d903      	bls.n	2264 <_svfiprintf_r+0x1a8>
    225c:	2b00      	cmp	r3, #0
    225e:	d0c5      	beq.n	21ec <_svfiprintf_r+0x130>
    2260:	9105      	str	r1, [sp, #20]
    2262:	e7c3      	b.n	21ec <_svfiprintf_r+0x130>
    2264:	4604      	mov	r4, r0
    2266:	2301      	movs	r3, #1
    2268:	fb0c 2101 	mla	r1, ip, r1, r2
    226c:	e7f0      	b.n	2250 <_svfiprintf_r+0x194>
    226e:	ab03      	add	r3, sp, #12
    2270:	9300      	str	r3, [sp, #0]
    2272:	462a      	mov	r2, r5
    2274:	4638      	mov	r0, r7
    2276:	4b10      	ldr	r3, [pc, #64]	; (22b8 <_svfiprintf_r+0x1fc>)
    2278:	a904      	add	r1, sp, #16
    227a:	f3af 8000 	nop.w
    227e:	1c42      	adds	r2, r0, #1
    2280:	4606      	mov	r6, r0
    2282:	d1d6      	bne.n	2232 <_svfiprintf_r+0x176>
    2284:	89ab      	ldrh	r3, [r5, #12]
    2286:	065b      	lsls	r3, r3, #25
    2288:	f53f af2c 	bmi.w	20e4 <_svfiprintf_r+0x28>
    228c:	9809      	ldr	r0, [sp, #36]	; 0x24
    228e:	b01d      	add	sp, #116	; 0x74
    2290:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2294:	ab03      	add	r3, sp, #12
    2296:	9300      	str	r3, [sp, #0]
    2298:	462a      	mov	r2, r5
    229a:	4638      	mov	r0, r7
    229c:	4b06      	ldr	r3, [pc, #24]	; (22b8 <_svfiprintf_r+0x1fc>)
    229e:	a904      	add	r1, sp, #16
    22a0:	f000 f87c 	bl	239c <_printf_i>
    22a4:	e7eb      	b.n	227e <_svfiprintf_r+0x1c2>
    22a6:	bf00      	nop
    22a8:	00002a5c 	andeq	r2, r0, ip, asr sl
    22ac:	00002a62 	andeq	r2, r0, r2, ror #20
    22b0:	00002a66 	andeq	r2, r0, r6, ror #20
    22b4:	00000000 	andeq	r0, r0, r0
    22b8:	00002005 	andeq	r2, r0, r5

000022bc <_printf_common>:
    22bc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    22c0:	4616      	mov	r6, r2
    22c2:	4699      	mov	r9, r3
    22c4:	688a      	ldr	r2, [r1, #8]
    22c6:	690b      	ldr	r3, [r1, #16]
    22c8:	4607      	mov	r7, r0
    22ca:	4293      	cmp	r3, r2
    22cc:	bfb8      	it	lt
    22ce:	4613      	movlt	r3, r2
    22d0:	6033      	str	r3, [r6, #0]
    22d2:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
    22d6:	460c      	mov	r4, r1
    22d8:	f8dd 8020 	ldr.w	r8, [sp, #32]
    22dc:	b10a      	cbz	r2, 22e2 <_printf_common+0x26>
    22de:	3301      	adds	r3, #1
    22e0:	6033      	str	r3, [r6, #0]
    22e2:	6823      	ldr	r3, [r4, #0]
    22e4:	0699      	lsls	r1, r3, #26
    22e6:	bf42      	ittt	mi
    22e8:	6833      	ldrmi	r3, [r6, #0]
    22ea:	3302      	addmi	r3, #2
    22ec:	6033      	strmi	r3, [r6, #0]
    22ee:	6825      	ldr	r5, [r4, #0]
    22f0:	f015 0506 	ands.w	r5, r5, #6
    22f4:	d106      	bne.n	2304 <_printf_common+0x48>
    22f6:	f104 0a19 	add.w	sl, r4, #25
    22fa:	68e3      	ldr	r3, [r4, #12]
    22fc:	6832      	ldr	r2, [r6, #0]
    22fe:	1a9b      	subs	r3, r3, r2
    2300:	42ab      	cmp	r3, r5
    2302:	dc28      	bgt.n	2356 <_printf_common+0x9a>
    2304:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
    2308:	1e13      	subs	r3, r2, #0
    230a:	6822      	ldr	r2, [r4, #0]
    230c:	bf18      	it	ne
    230e:	2301      	movne	r3, #1
    2310:	0692      	lsls	r2, r2, #26
    2312:	d42d      	bmi.n	2370 <_printf_common+0xb4>
    2314:	4649      	mov	r1, r9
    2316:	4638      	mov	r0, r7
    2318:	f104 0243 	add.w	r2, r4, #67	; 0x43
    231c:	47c0      	blx	r8
    231e:	3001      	adds	r0, #1
    2320:	d020      	beq.n	2364 <_printf_common+0xa8>
    2322:	6823      	ldr	r3, [r4, #0]
    2324:	68e5      	ldr	r5, [r4, #12]
    2326:	f003 0306 	and.w	r3, r3, #6
    232a:	2b04      	cmp	r3, #4
    232c:	bf18      	it	ne
    232e:	2500      	movne	r5, #0
    2330:	6832      	ldr	r2, [r6, #0]
    2332:	f04f 0600 	mov.w	r6, #0
    2336:	68a3      	ldr	r3, [r4, #8]
    2338:	bf08      	it	eq
    233a:	1aad      	subeq	r5, r5, r2
    233c:	6922      	ldr	r2, [r4, #16]
    233e:	bf08      	it	eq
    2340:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
    2344:	4293      	cmp	r3, r2
    2346:	bfc4      	itt	gt
    2348:	1a9b      	subgt	r3, r3, r2
    234a:	18ed      	addgt	r5, r5, r3
    234c:	341a      	adds	r4, #26
    234e:	42b5      	cmp	r5, r6
    2350:	d11a      	bne.n	2388 <_printf_common+0xcc>
    2352:	2000      	movs	r0, #0
    2354:	e008      	b.n	2368 <_printf_common+0xac>
    2356:	2301      	movs	r3, #1
    2358:	4652      	mov	r2, sl
    235a:	4649      	mov	r1, r9
    235c:	4638      	mov	r0, r7
    235e:	47c0      	blx	r8
    2360:	3001      	adds	r0, #1
    2362:	d103      	bne.n	236c <_printf_common+0xb0>
    2364:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    2368:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    236c:	3501      	adds	r5, #1
    236e:	e7c4      	b.n	22fa <_printf_common+0x3e>
    2370:	2030      	movs	r0, #48	; 0x30
    2372:	18e1      	adds	r1, r4, r3
    2374:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
    2378:	1c5a      	adds	r2, r3, #1
    237a:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
    237e:	4422      	add	r2, r4
    2380:	3302      	adds	r3, #2
    2382:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
    2386:	e7c5      	b.n	2314 <_printf_common+0x58>
    2388:	2301      	movs	r3, #1
    238a:	4622      	mov	r2, r4
    238c:	4649      	mov	r1, r9
    238e:	4638      	mov	r0, r7
    2390:	47c0      	blx	r8
    2392:	3001      	adds	r0, #1
    2394:	d0e6      	beq.n	2364 <_printf_common+0xa8>
    2396:	3601      	adds	r6, #1
    2398:	e7d9      	b.n	234e <_printf_common+0x92>
	...

0000239c <_printf_i>:
    239c:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
    23a0:	7e0f      	ldrb	r7, [r1, #24]
    23a2:	4691      	mov	r9, r2
    23a4:	2f78      	cmp	r7, #120	; 0x78
    23a6:	4680      	mov	r8, r0
    23a8:	460c      	mov	r4, r1
    23aa:	469a      	mov	sl, r3
    23ac:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    23ae:	f101 0243 	add.w	r2, r1, #67	; 0x43
    23b2:	d807      	bhi.n	23c4 <_printf_i+0x28>
    23b4:	2f62      	cmp	r7, #98	; 0x62
    23b6:	d80a      	bhi.n	23ce <_printf_i+0x32>
    23b8:	2f00      	cmp	r7, #0
    23ba:	f000 80d9 	beq.w	2570 <_printf_i+0x1d4>
    23be:	2f58      	cmp	r7, #88	; 0x58
    23c0:	f000 80a4 	beq.w	250c <_printf_i+0x170>
    23c4:	f104 0542 	add.w	r5, r4, #66	; 0x42
    23c8:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
    23cc:	e03a      	b.n	2444 <_printf_i+0xa8>
    23ce:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
    23d2:	2b15      	cmp	r3, #21
    23d4:	d8f6      	bhi.n	23c4 <_printf_i+0x28>
    23d6:	a101      	add	r1, pc, #4	; (adr r1, 23dc <_printf_i+0x40>)
    23d8:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    23dc:	00002435 	andeq	r2, r0, r5, lsr r4
    23e0:	00002449 	andeq	r2, r0, r9, asr #8
    23e4:	000023c5 	andeq	r2, r0, r5, asr #7
    23e8:	000023c5 	andeq	r2, r0, r5, asr #7
    23ec:	000023c5 	andeq	r2, r0, r5, asr #7
    23f0:	000023c5 	andeq	r2, r0, r5, asr #7
    23f4:	00002449 	andeq	r2, r0, r9, asr #8
    23f8:	000023c5 	andeq	r2, r0, r5, asr #7
    23fc:	000023c5 	andeq	r2, r0, r5, asr #7
    2400:	000023c5 	andeq	r2, r0, r5, asr #7
    2404:	000023c5 	andeq	r2, r0, r5, asr #7
    2408:	00002557 	andeq	r2, r0, r7, asr r5
    240c:	00002479 	andeq	r2, r0, r9, ror r4
    2410:	00002539 	andeq	r2, r0, r9, lsr r5
    2414:	000023c5 	andeq	r2, r0, r5, asr #7
    2418:	000023c5 	andeq	r2, r0, r5, asr #7
    241c:	00002579 	andeq	r2, r0, r9, ror r5
    2420:	000023c5 	andeq	r2, r0, r5, asr #7
    2424:	00002479 	andeq	r2, r0, r9, ror r4
    2428:	000023c5 	andeq	r2, r0, r5, asr #7
    242c:	000023c5 	andeq	r2, r0, r5, asr #7
    2430:	00002541 	andeq	r2, r0, r1, asr #10
    2434:	682b      	ldr	r3, [r5, #0]
    2436:	1d1a      	adds	r2, r3, #4
    2438:	681b      	ldr	r3, [r3, #0]
    243a:	602a      	str	r2, [r5, #0]
    243c:	f104 0542 	add.w	r5, r4, #66	; 0x42
    2440:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
    2444:	2301      	movs	r3, #1
    2446:	e0a4      	b.n	2592 <_printf_i+0x1f6>
    2448:	6820      	ldr	r0, [r4, #0]
    244a:	6829      	ldr	r1, [r5, #0]
    244c:	0606      	lsls	r6, r0, #24
    244e:	f101 0304 	add.w	r3, r1, #4
    2452:	d50a      	bpl.n	246a <_printf_i+0xce>
    2454:	680e      	ldr	r6, [r1, #0]
    2456:	602b      	str	r3, [r5, #0]
    2458:	2e00      	cmp	r6, #0
    245a:	da03      	bge.n	2464 <_printf_i+0xc8>
    245c:	232d      	movs	r3, #45	; 0x2d
    245e:	4276      	negs	r6, r6
    2460:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    2464:	230a      	movs	r3, #10
    2466:	485e      	ldr	r0, [pc, #376]	; (25e0 <_printf_i+0x244>)
    2468:	e019      	b.n	249e <_printf_i+0x102>
    246a:	680e      	ldr	r6, [r1, #0]
    246c:	f010 0f40 	tst.w	r0, #64	; 0x40
    2470:	602b      	str	r3, [r5, #0]
    2472:	bf18      	it	ne
    2474:	b236      	sxthne	r6, r6
    2476:	e7ef      	b.n	2458 <_printf_i+0xbc>
    2478:	682b      	ldr	r3, [r5, #0]
    247a:	6820      	ldr	r0, [r4, #0]
    247c:	1d19      	adds	r1, r3, #4
    247e:	6029      	str	r1, [r5, #0]
    2480:	0601      	lsls	r1, r0, #24
    2482:	d501      	bpl.n	2488 <_printf_i+0xec>
    2484:	681e      	ldr	r6, [r3, #0]
    2486:	e002      	b.n	248e <_printf_i+0xf2>
    2488:	0646      	lsls	r6, r0, #25
    248a:	d5fb      	bpl.n	2484 <_printf_i+0xe8>
    248c:	881e      	ldrh	r6, [r3, #0]
    248e:	2f6f      	cmp	r7, #111	; 0x6f
    2490:	bf0c      	ite	eq
    2492:	2308      	moveq	r3, #8
    2494:	230a      	movne	r3, #10
    2496:	4852      	ldr	r0, [pc, #328]	; (25e0 <_printf_i+0x244>)
    2498:	2100      	movs	r1, #0
    249a:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
    249e:	6865      	ldr	r5, [r4, #4]
    24a0:	2d00      	cmp	r5, #0
    24a2:	bfa8      	it	ge
    24a4:	6821      	ldrge	r1, [r4, #0]
    24a6:	60a5      	str	r5, [r4, #8]
    24a8:	bfa4      	itt	ge
    24aa:	f021 0104 	bicge.w	r1, r1, #4
    24ae:	6021      	strge	r1, [r4, #0]
    24b0:	b90e      	cbnz	r6, 24b6 <_printf_i+0x11a>
    24b2:	2d00      	cmp	r5, #0
    24b4:	d04d      	beq.n	2552 <_printf_i+0x1b6>
    24b6:	4615      	mov	r5, r2
    24b8:	fbb6 f1f3 	udiv	r1, r6, r3
    24bc:	fb03 6711 	mls	r7, r3, r1, r6
    24c0:	5dc7      	ldrb	r7, [r0, r7]
    24c2:	f805 7d01 	strb.w	r7, [r5, #-1]!
    24c6:	4637      	mov	r7, r6
    24c8:	42bb      	cmp	r3, r7
    24ca:	460e      	mov	r6, r1
    24cc:	d9f4      	bls.n	24b8 <_printf_i+0x11c>
    24ce:	2b08      	cmp	r3, #8
    24d0:	d10b      	bne.n	24ea <_printf_i+0x14e>
    24d2:	6823      	ldr	r3, [r4, #0]
    24d4:	07de      	lsls	r6, r3, #31
    24d6:	d508      	bpl.n	24ea <_printf_i+0x14e>
    24d8:	6923      	ldr	r3, [r4, #16]
    24da:	6861      	ldr	r1, [r4, #4]
    24dc:	4299      	cmp	r1, r3
    24de:	bfde      	ittt	le
    24e0:	2330      	movle	r3, #48	; 0x30
    24e2:	f805 3c01 	strble.w	r3, [r5, #-1]
    24e6:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
    24ea:	1b52      	subs	r2, r2, r5
    24ec:	6122      	str	r2, [r4, #16]
    24ee:	464b      	mov	r3, r9
    24f0:	4621      	mov	r1, r4
    24f2:	4640      	mov	r0, r8
    24f4:	f8cd a000 	str.w	sl, [sp]
    24f8:	aa03      	add	r2, sp, #12
    24fa:	f7ff fedf 	bl	22bc <_printf_common>
    24fe:	3001      	adds	r0, #1
    2500:	d14c      	bne.n	259c <_printf_i+0x200>
    2502:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    2506:	b004      	add	sp, #16
    2508:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    250c:	4834      	ldr	r0, [pc, #208]	; (25e0 <_printf_i+0x244>)
    250e:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
    2512:	6829      	ldr	r1, [r5, #0]
    2514:	6823      	ldr	r3, [r4, #0]
    2516:	f851 6b04 	ldr.w	r6, [r1], #4
    251a:	6029      	str	r1, [r5, #0]
    251c:	061d      	lsls	r5, r3, #24
    251e:	d514      	bpl.n	254a <_printf_i+0x1ae>
    2520:	07df      	lsls	r7, r3, #31
    2522:	bf44      	itt	mi
    2524:	f043 0320 	orrmi.w	r3, r3, #32
    2528:	6023      	strmi	r3, [r4, #0]
    252a:	b91e      	cbnz	r6, 2534 <_printf_i+0x198>
    252c:	6823      	ldr	r3, [r4, #0]
    252e:	f023 0320 	bic.w	r3, r3, #32
    2532:	6023      	str	r3, [r4, #0]
    2534:	2310      	movs	r3, #16
    2536:	e7af      	b.n	2498 <_printf_i+0xfc>
    2538:	6823      	ldr	r3, [r4, #0]
    253a:	f043 0320 	orr.w	r3, r3, #32
    253e:	6023      	str	r3, [r4, #0]
    2540:	2378      	movs	r3, #120	; 0x78
    2542:	4828      	ldr	r0, [pc, #160]	; (25e4 <_printf_i+0x248>)
    2544:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
    2548:	e7e3      	b.n	2512 <_printf_i+0x176>
    254a:	0659      	lsls	r1, r3, #25
    254c:	bf48      	it	mi
    254e:	b2b6      	uxthmi	r6, r6
    2550:	e7e6      	b.n	2520 <_printf_i+0x184>
    2552:	4615      	mov	r5, r2
    2554:	e7bb      	b.n	24ce <_printf_i+0x132>
    2556:	682b      	ldr	r3, [r5, #0]
    2558:	6826      	ldr	r6, [r4, #0]
    255a:	1d18      	adds	r0, r3, #4
    255c:	6961      	ldr	r1, [r4, #20]
    255e:	6028      	str	r0, [r5, #0]
    2560:	0635      	lsls	r5, r6, #24
    2562:	681b      	ldr	r3, [r3, #0]
    2564:	d501      	bpl.n	256a <_printf_i+0x1ce>
    2566:	6019      	str	r1, [r3, #0]
    2568:	e002      	b.n	2570 <_printf_i+0x1d4>
    256a:	0670      	lsls	r0, r6, #25
    256c:	d5fb      	bpl.n	2566 <_printf_i+0x1ca>
    256e:	8019      	strh	r1, [r3, #0]
    2570:	2300      	movs	r3, #0
    2572:	4615      	mov	r5, r2
    2574:	6123      	str	r3, [r4, #16]
    2576:	e7ba      	b.n	24ee <_printf_i+0x152>
    2578:	682b      	ldr	r3, [r5, #0]
    257a:	2100      	movs	r1, #0
    257c:	1d1a      	adds	r2, r3, #4
    257e:	602a      	str	r2, [r5, #0]
    2580:	681d      	ldr	r5, [r3, #0]
    2582:	6862      	ldr	r2, [r4, #4]
    2584:	4628      	mov	r0, r5
    2586:	f000 f82f 	bl	25e8 <memchr>
    258a:	b108      	cbz	r0, 2590 <_printf_i+0x1f4>
    258c:	1b40      	subs	r0, r0, r5
    258e:	6060      	str	r0, [r4, #4]
    2590:	6863      	ldr	r3, [r4, #4]
    2592:	6123      	str	r3, [r4, #16]
    2594:	2300      	movs	r3, #0
    2596:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    259a:	e7a8      	b.n	24ee <_printf_i+0x152>
    259c:	462a      	mov	r2, r5
    259e:	4649      	mov	r1, r9
    25a0:	4640      	mov	r0, r8
    25a2:	6923      	ldr	r3, [r4, #16]
    25a4:	47d0      	blx	sl
    25a6:	3001      	adds	r0, #1
    25a8:	d0ab      	beq.n	2502 <_printf_i+0x166>
    25aa:	6823      	ldr	r3, [r4, #0]
    25ac:	079b      	lsls	r3, r3, #30
    25ae:	d413      	bmi.n	25d8 <_printf_i+0x23c>
    25b0:	68e0      	ldr	r0, [r4, #12]
    25b2:	9b03      	ldr	r3, [sp, #12]
    25b4:	4298      	cmp	r0, r3
    25b6:	bfb8      	it	lt
    25b8:	4618      	movlt	r0, r3
    25ba:	e7a4      	b.n	2506 <_printf_i+0x16a>
    25bc:	2301      	movs	r3, #1
    25be:	4632      	mov	r2, r6
    25c0:	4649      	mov	r1, r9
    25c2:	4640      	mov	r0, r8
    25c4:	47d0      	blx	sl
    25c6:	3001      	adds	r0, #1
    25c8:	d09b      	beq.n	2502 <_printf_i+0x166>
    25ca:	3501      	adds	r5, #1
    25cc:	68e3      	ldr	r3, [r4, #12]
    25ce:	9903      	ldr	r1, [sp, #12]
    25d0:	1a5b      	subs	r3, r3, r1
    25d2:	42ab      	cmp	r3, r5
    25d4:	dcf2      	bgt.n	25bc <_printf_i+0x220>
    25d6:	e7eb      	b.n	25b0 <_printf_i+0x214>
    25d8:	2500      	movs	r5, #0
    25da:	f104 0619 	add.w	r6, r4, #25
    25de:	e7f5      	b.n	25cc <_printf_i+0x230>
    25e0:	00002a6d 	andeq	r2, r0, sp, ror #20
    25e4:	00002a7e 	andeq	r2, r0, lr, ror sl

000025e8 <memchr>:
    25e8:	4603      	mov	r3, r0
    25ea:	b510      	push	{r4, lr}
    25ec:	b2c9      	uxtb	r1, r1
    25ee:	4402      	add	r2, r0
    25f0:	4293      	cmp	r3, r2
    25f2:	4618      	mov	r0, r3
    25f4:	d101      	bne.n	25fa <memchr+0x12>
    25f6:	2000      	movs	r0, #0
    25f8:	e003      	b.n	2602 <memchr+0x1a>
    25fa:	7804      	ldrb	r4, [r0, #0]
    25fc:	3301      	adds	r3, #1
    25fe:	428c      	cmp	r4, r1
    2600:	d1f6      	bne.n	25f0 <memchr+0x8>
    2602:	bd10      	pop	{r4, pc}

00002604 <memcpy>:
    2604:	440a      	add	r2, r1
    2606:	4291      	cmp	r1, r2
    2608:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
    260c:	d100      	bne.n	2610 <memcpy+0xc>
    260e:	4770      	bx	lr
    2610:	b510      	push	{r4, lr}
    2612:	f811 4b01 	ldrb.w	r4, [r1], #1
    2616:	4291      	cmp	r1, r2
    2618:	f803 4f01 	strb.w	r4, [r3, #1]!
    261c:	d1f9      	bne.n	2612 <memcpy+0xe>
    261e:	bd10      	pop	{r4, pc}

00002620 <memmove>:
    2620:	4288      	cmp	r0, r1
    2622:	b510      	push	{r4, lr}
    2624:	eb01 0402 	add.w	r4, r1, r2
    2628:	d902      	bls.n	2630 <memmove+0x10>
    262a:	4284      	cmp	r4, r0
    262c:	4623      	mov	r3, r4
    262e:	d807      	bhi.n	2640 <memmove+0x20>
    2630:	1e43      	subs	r3, r0, #1
    2632:	42a1      	cmp	r1, r4
    2634:	d008      	beq.n	2648 <memmove+0x28>
    2636:	f811 2b01 	ldrb.w	r2, [r1], #1
    263a:	f803 2f01 	strb.w	r2, [r3, #1]!
    263e:	e7f8      	b.n	2632 <memmove+0x12>
    2640:	4601      	mov	r1, r0
    2642:	4402      	add	r2, r0
    2644:	428a      	cmp	r2, r1
    2646:	d100      	bne.n	264a <memmove+0x2a>
    2648:	bd10      	pop	{r4, pc}
    264a:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
    264e:	f802 4d01 	strb.w	r4, [r2, #-1]!
    2652:	e7f7      	b.n	2644 <memmove+0x24>

00002654 <_free_r>:
    2654:	b538      	push	{r3, r4, r5, lr}
    2656:	4605      	mov	r5, r0
    2658:	2900      	cmp	r1, #0
    265a:	d040      	beq.n	26de <_free_r+0x8a>
    265c:	f851 3c04 	ldr.w	r3, [r1, #-4]
    2660:	1f0c      	subs	r4, r1, #4
    2662:	2b00      	cmp	r3, #0
    2664:	bfb8      	it	lt
    2666:	18e4      	addlt	r4, r4, r3
    2668:	f000 f910 	bl	288c <__malloc_lock>
    266c:	4a1c      	ldr	r2, [pc, #112]	; (26e0 <_free_r+0x8c>)
    266e:	6813      	ldr	r3, [r2, #0]
    2670:	b933      	cbnz	r3, 2680 <_free_r+0x2c>
    2672:	6063      	str	r3, [r4, #4]
    2674:	6014      	str	r4, [r2, #0]
    2676:	4628      	mov	r0, r5
    2678:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    267c:	f000 b90c 	b.w	2898 <__malloc_unlock>
    2680:	42a3      	cmp	r3, r4
    2682:	d908      	bls.n	2696 <_free_r+0x42>
    2684:	6820      	ldr	r0, [r4, #0]
    2686:	1821      	adds	r1, r4, r0
    2688:	428b      	cmp	r3, r1
    268a:	bf01      	itttt	eq
    268c:	6819      	ldreq	r1, [r3, #0]
    268e:	685b      	ldreq	r3, [r3, #4]
    2690:	1809      	addeq	r1, r1, r0
    2692:	6021      	streq	r1, [r4, #0]
    2694:	e7ed      	b.n	2672 <_free_r+0x1e>
    2696:	461a      	mov	r2, r3
    2698:	685b      	ldr	r3, [r3, #4]
    269a:	b10b      	cbz	r3, 26a0 <_free_r+0x4c>
    269c:	42a3      	cmp	r3, r4
    269e:	d9fa      	bls.n	2696 <_free_r+0x42>
    26a0:	6811      	ldr	r1, [r2, #0]
    26a2:	1850      	adds	r0, r2, r1
    26a4:	42a0      	cmp	r0, r4
    26a6:	d10b      	bne.n	26c0 <_free_r+0x6c>
    26a8:	6820      	ldr	r0, [r4, #0]
    26aa:	4401      	add	r1, r0
    26ac:	1850      	adds	r0, r2, r1
    26ae:	4283      	cmp	r3, r0
    26b0:	6011      	str	r1, [r2, #0]
    26b2:	d1e0      	bne.n	2676 <_free_r+0x22>
    26b4:	6818      	ldr	r0, [r3, #0]
    26b6:	685b      	ldr	r3, [r3, #4]
    26b8:	4401      	add	r1, r0
    26ba:	6011      	str	r1, [r2, #0]
    26bc:	6053      	str	r3, [r2, #4]
    26be:	e7da      	b.n	2676 <_free_r+0x22>
    26c0:	d902      	bls.n	26c8 <_free_r+0x74>
    26c2:	230c      	movs	r3, #12
    26c4:	602b      	str	r3, [r5, #0]
    26c6:	e7d6      	b.n	2676 <_free_r+0x22>
    26c8:	6820      	ldr	r0, [r4, #0]
    26ca:	1821      	adds	r1, r4, r0
    26cc:	428b      	cmp	r3, r1
    26ce:	bf01      	itttt	eq
    26d0:	6819      	ldreq	r1, [r3, #0]
    26d2:	685b      	ldreq	r3, [r3, #4]
    26d4:	1809      	addeq	r1, r1, r0
    26d6:	6021      	streq	r1, [r4, #0]
    26d8:	6063      	str	r3, [r4, #4]
    26da:	6054      	str	r4, [r2, #4]
    26dc:	e7cb      	b.n	2676 <_free_r+0x22>
    26de:	bd38      	pop	{r3, r4, r5, pc}
    26e0:	0002046c 	andeq	r0, r2, ip, ror #8

000026e4 <sbrk_aligned>:
    26e4:	b570      	push	{r4, r5, r6, lr}
    26e6:	4e0e      	ldr	r6, [pc, #56]	; (2720 <sbrk_aligned+0x3c>)
    26e8:	460c      	mov	r4, r1
    26ea:	6831      	ldr	r1, [r6, #0]
    26ec:	4605      	mov	r5, r0
    26ee:	b911      	cbnz	r1, 26f6 <sbrk_aligned+0x12>
    26f0:	f000 f8bc 	bl	286c <_sbrk_r>
    26f4:	6030      	str	r0, [r6, #0]
    26f6:	4621      	mov	r1, r4
    26f8:	4628      	mov	r0, r5
    26fa:	f000 f8b7 	bl	286c <_sbrk_r>
    26fe:	1c43      	adds	r3, r0, #1
    2700:	d00a      	beq.n	2718 <sbrk_aligned+0x34>
    2702:	1cc4      	adds	r4, r0, #3
    2704:	f024 0403 	bic.w	r4, r4, #3
    2708:	42a0      	cmp	r0, r4
    270a:	d007      	beq.n	271c <sbrk_aligned+0x38>
    270c:	1a21      	subs	r1, r4, r0
    270e:	4628      	mov	r0, r5
    2710:	f000 f8ac 	bl	286c <_sbrk_r>
    2714:	3001      	adds	r0, #1
    2716:	d101      	bne.n	271c <sbrk_aligned+0x38>
    2718:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
    271c:	4620      	mov	r0, r4
    271e:	bd70      	pop	{r4, r5, r6, pc}
    2720:	00020470 	andeq	r0, r2, r0, ror r4

00002724 <_malloc_r>:
    2724:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2728:	1ccd      	adds	r5, r1, #3
    272a:	f025 0503 	bic.w	r5, r5, #3
    272e:	3508      	adds	r5, #8
    2730:	2d0c      	cmp	r5, #12
    2732:	bf38      	it	cc
    2734:	250c      	movcc	r5, #12
    2736:	2d00      	cmp	r5, #0
    2738:	4607      	mov	r7, r0
    273a:	db01      	blt.n	2740 <_malloc_r+0x1c>
    273c:	42a9      	cmp	r1, r5
    273e:	d905      	bls.n	274c <_malloc_r+0x28>
    2740:	230c      	movs	r3, #12
    2742:	2600      	movs	r6, #0
    2744:	603b      	str	r3, [r7, #0]
    2746:	4630      	mov	r0, r6
    2748:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    274c:	4e2e      	ldr	r6, [pc, #184]	; (2808 <_malloc_r+0xe4>)
    274e:	f000 f89d 	bl	288c <__malloc_lock>
    2752:	6833      	ldr	r3, [r6, #0]
    2754:	461c      	mov	r4, r3
    2756:	bb34      	cbnz	r4, 27a6 <_malloc_r+0x82>
    2758:	4629      	mov	r1, r5
    275a:	4638      	mov	r0, r7
    275c:	f7ff ffc2 	bl	26e4 <sbrk_aligned>
    2760:	1c43      	adds	r3, r0, #1
    2762:	4604      	mov	r4, r0
    2764:	d14d      	bne.n	2802 <_malloc_r+0xde>
    2766:	6834      	ldr	r4, [r6, #0]
    2768:	4626      	mov	r6, r4
    276a:	2e00      	cmp	r6, #0
    276c:	d140      	bne.n	27f0 <_malloc_r+0xcc>
    276e:	6823      	ldr	r3, [r4, #0]
    2770:	4631      	mov	r1, r6
    2772:	4638      	mov	r0, r7
    2774:	eb04 0803 	add.w	r8, r4, r3
    2778:	f000 f878 	bl	286c <_sbrk_r>
    277c:	4580      	cmp	r8, r0
    277e:	d13a      	bne.n	27f6 <_malloc_r+0xd2>
    2780:	6821      	ldr	r1, [r4, #0]
    2782:	3503      	adds	r5, #3
    2784:	1a6d      	subs	r5, r5, r1
    2786:	f025 0503 	bic.w	r5, r5, #3
    278a:	3508      	adds	r5, #8
    278c:	2d0c      	cmp	r5, #12
    278e:	bf38      	it	cc
    2790:	250c      	movcc	r5, #12
    2792:	4638      	mov	r0, r7
    2794:	4629      	mov	r1, r5
    2796:	f7ff ffa5 	bl	26e4 <sbrk_aligned>
    279a:	3001      	adds	r0, #1
    279c:	d02b      	beq.n	27f6 <_malloc_r+0xd2>
    279e:	6823      	ldr	r3, [r4, #0]
    27a0:	442b      	add	r3, r5
    27a2:	6023      	str	r3, [r4, #0]
    27a4:	e00e      	b.n	27c4 <_malloc_r+0xa0>
    27a6:	6822      	ldr	r2, [r4, #0]
    27a8:	1b52      	subs	r2, r2, r5
    27aa:	d41e      	bmi.n	27ea <_malloc_r+0xc6>
    27ac:	2a0b      	cmp	r2, #11
    27ae:	d916      	bls.n	27de <_malloc_r+0xba>
    27b0:	1961      	adds	r1, r4, r5
    27b2:	42a3      	cmp	r3, r4
    27b4:	6025      	str	r5, [r4, #0]
    27b6:	bf18      	it	ne
    27b8:	6059      	strne	r1, [r3, #4]
    27ba:	6863      	ldr	r3, [r4, #4]
    27bc:	bf08      	it	eq
    27be:	6031      	streq	r1, [r6, #0]
    27c0:	5162      	str	r2, [r4, r5]
    27c2:	604b      	str	r3, [r1, #4]
    27c4:	4638      	mov	r0, r7
    27c6:	f104 060b 	add.w	r6, r4, #11
    27ca:	f000 f865 	bl	2898 <__malloc_unlock>
    27ce:	f026 0607 	bic.w	r6, r6, #7
    27d2:	1d23      	adds	r3, r4, #4
    27d4:	1af2      	subs	r2, r6, r3
    27d6:	d0b6      	beq.n	2746 <_malloc_r+0x22>
    27d8:	1b9b      	subs	r3, r3, r6
    27da:	50a3      	str	r3, [r4, r2]
    27dc:	e7b3      	b.n	2746 <_malloc_r+0x22>
    27de:	6862      	ldr	r2, [r4, #4]
    27e0:	42a3      	cmp	r3, r4
    27e2:	bf0c      	ite	eq
    27e4:	6032      	streq	r2, [r6, #0]
    27e6:	605a      	strne	r2, [r3, #4]
    27e8:	e7ec      	b.n	27c4 <_malloc_r+0xa0>
    27ea:	4623      	mov	r3, r4
    27ec:	6864      	ldr	r4, [r4, #4]
    27ee:	e7b2      	b.n	2756 <_malloc_r+0x32>
    27f0:	4634      	mov	r4, r6
    27f2:	6876      	ldr	r6, [r6, #4]
    27f4:	e7b9      	b.n	276a <_malloc_r+0x46>
    27f6:	230c      	movs	r3, #12
    27f8:	4638      	mov	r0, r7
    27fa:	603b      	str	r3, [r7, #0]
    27fc:	f000 f84c 	bl	2898 <__malloc_unlock>
    2800:	e7a1      	b.n	2746 <_malloc_r+0x22>
    2802:	6025      	str	r5, [r4, #0]
    2804:	e7de      	b.n	27c4 <_malloc_r+0xa0>
    2806:	bf00      	nop
    2808:	0002046c 	andeq	r0, r2, ip, ror #8

0000280c <_realloc_r>:
    280c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2810:	4680      	mov	r8, r0
    2812:	4614      	mov	r4, r2
    2814:	460e      	mov	r6, r1
    2816:	b921      	cbnz	r1, 2822 <_realloc_r+0x16>
    2818:	4611      	mov	r1, r2
    281a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    281e:	f7ff bf81 	b.w	2724 <_malloc_r>
    2822:	b92a      	cbnz	r2, 2830 <_realloc_r+0x24>
    2824:	f7ff ff16 	bl	2654 <_free_r>
    2828:	4625      	mov	r5, r4
    282a:	4628      	mov	r0, r5
    282c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    2830:	f000 f838 	bl	28a4 <_malloc_usable_size_r>
    2834:	4284      	cmp	r4, r0
    2836:	4607      	mov	r7, r0
    2838:	d802      	bhi.n	2840 <_realloc_r+0x34>
    283a:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
    283e:	d812      	bhi.n	2866 <_realloc_r+0x5a>
    2840:	4621      	mov	r1, r4
    2842:	4640      	mov	r0, r8
    2844:	f7ff ff6e 	bl	2724 <_malloc_r>
    2848:	4605      	mov	r5, r0
    284a:	2800      	cmp	r0, #0
    284c:	d0ed      	beq.n	282a <_realloc_r+0x1e>
    284e:	42bc      	cmp	r4, r7
    2850:	4622      	mov	r2, r4
    2852:	4631      	mov	r1, r6
    2854:	bf28      	it	cs
    2856:	463a      	movcs	r2, r7
    2858:	f7ff fed4 	bl	2604 <memcpy>
    285c:	4631      	mov	r1, r6
    285e:	4640      	mov	r0, r8
    2860:	f7ff fef8 	bl	2654 <_free_r>
    2864:	e7e1      	b.n	282a <_realloc_r+0x1e>
    2866:	4635      	mov	r5, r6
    2868:	e7df      	b.n	282a <_realloc_r+0x1e>
	...

0000286c <_sbrk_r>:
    286c:	b538      	push	{r3, r4, r5, lr}
    286e:	2300      	movs	r3, #0
    2870:	4d05      	ldr	r5, [pc, #20]	; (2888 <_sbrk_r+0x1c>)
    2872:	4604      	mov	r4, r0
    2874:	4608      	mov	r0, r1
    2876:	602b      	str	r3, [r5, #0]
    2878:	f000 f81e 	bl	28b8 <_sbrk>
    287c:	1c43      	adds	r3, r0, #1
    287e:	d102      	bne.n	2886 <_sbrk_r+0x1a>
    2880:	682b      	ldr	r3, [r5, #0]
    2882:	b103      	cbz	r3, 2886 <_sbrk_r+0x1a>
    2884:	6023      	str	r3, [r4, #0]
    2886:	bd38      	pop	{r3, r4, r5, pc}
    2888:	00020474 	andeq	r0, r2, r4, ror r4

0000288c <__malloc_lock>:
    288c:	4801      	ldr	r0, [pc, #4]	; (2894 <__malloc_lock+0x8>)
    288e:	f000 b811 	b.w	28b4 <__retarget_lock_acquire_recursive>
    2892:	bf00      	nop
    2894:	00020478 	andeq	r0, r2, r8, ror r4

00002898 <__malloc_unlock>:
    2898:	4801      	ldr	r0, [pc, #4]	; (28a0 <__malloc_unlock+0x8>)
    289a:	f000 b80c 	b.w	28b6 <__retarget_lock_release_recursive>
    289e:	bf00      	nop
    28a0:	00020478 	andeq	r0, r2, r8, ror r4

000028a4 <_malloc_usable_size_r>:
    28a4:	f851 3c04 	ldr.w	r3, [r1, #-4]
    28a8:	1f18      	subs	r0, r3, #4
    28aa:	2b00      	cmp	r3, #0
    28ac:	bfbc      	itt	lt
    28ae:	580b      	ldrlt	r3, [r1, r0]
    28b0:	18c0      	addlt	r0, r0, r3
    28b2:	4770      	bx	lr

000028b4 <__retarget_lock_acquire_recursive>:
    28b4:	4770      	bx	lr

000028b6 <__retarget_lock_release_recursive>:
    28b6:	4770      	bx	lr

000028b8 <_sbrk>:
    28b8:	4a04      	ldr	r2, [pc, #16]	; (28cc <_sbrk+0x14>)
    28ba:	4905      	ldr	r1, [pc, #20]	; (28d0 <_sbrk+0x18>)
    28bc:	6813      	ldr	r3, [r2, #0]
    28be:	2b00      	cmp	r3, #0
    28c0:	bf08      	it	eq
    28c2:	460b      	moveq	r3, r1
    28c4:	4418      	add	r0, r3
    28c6:	6010      	str	r0, [r2, #0]
    28c8:	4618      	mov	r0, r3
    28ca:	4770      	bx	lr
    28cc:	0002047c 	andeq	r0, r2, ip, ror r4
    28d0:	00020480 	andeq	r0, r2, r0, lsl #9

000028d4 <_exit>:
    28d4:	e7fe      	b.n	28d4 <_exit>
    28d6:	bf00      	nop

000028d8 <_init>:
    28d8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    28da:	bf00      	nop
    28dc:	bcf8      	pop	{r3, r4, r5, r6, r7}
    28de:	bc08      	pop	{r3}
    28e0:	469e      	mov	lr, r3
    28e2:	4770      	bx	lr

000028e4 <_fini>:
    28e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    28e6:	bf00      	nop
    28e8:	bcf8      	pop	{r3, r4, r5, r6, r7}
    28ea:	bc08      	pop	{r3}
    28ec:	469e      	mov	lr, r3
    28ee:	4770      	bx	lr
    28f0:	74617453 	strbtvc	r7, [r1], #-1107	; 0xfffffbad
    28f4:	25207375 	strcs	r7, [r0, #-885]!	; 0xfffffc8b
    28f8:	000a0d64 	andeq	r0, sl, r4, ror #26
    28fc:	65657053 	strbvs	r7, [r5, #-83]!	; 0xffffffad
    2900:	65732064 	ldrbvs	r2, [r3, #-100]!	; 0xffffff9c
    2904:	64252074 	strtvs	r2, [r5], #-116	; 0xffffff8c
    2908:	00000a0d 	andeq	r0, r0, sp, lsl #20
    290c:	72727543 	rsbsvc	r7, r2, #281018368	; 0x10c00000
    2910:	20746e65 	rsbscs	r6, r4, r5, ror #28
    2914:	65657073 	strbvs	r7, [r5, #-115]!	; 0xffffff8d
    2918:	64252064 	strtvs	r2, [r5], #-100	; 0xffffff9c
    291c:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2920:	72727543 	rsbsvc	r7, r2, #281018368	; 0x10c00000
    2924:	20746e65 	rsbscs	r6, r4, r5, ror #28
    2928:	65726964 	ldrbvs	r6, [r2, #-2404]!	; 0xfffff69c
    292c:	6f697463 	svcvs	0x00697463
    2930:	6425206e 	strtvs	r2, [r5], #-110	; 0xffffff92
    2934:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2938:	6f727245 	svcvs	0x00727245
    293c:	64252072 	strtvs	r2, [r5], #-114	; 0xffffff8e
    2940:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2944:	00494d4e 	subeq	r4, r9, lr, asr #26
    2948:	5345545b 	movtpl	r5, #21595	; 0x545b
    294c:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    2950:	20776f68 	rsbscs	r6, r7, r8, ror #30
    2954:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
    2958:	6e656d20 	cdpvs	13, 6, cr6, cr5, cr0, {1}
    295c:	2e2e2e75 	mcrcs	14, 1, r2, cr14, cr5, {3}
    2960:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2964:	5d63255b 	cfstr64pl	mvdx2, [r3, #-364]!	; 0xfffffe94
    2968:	00732520 	rsbseq	r2, r3, r0, lsr #10
    296c:	5345545b 	movtpl	r5, #21595	; 0x545b
    2970:	50205d54 	eorpl	r5, r0, r4, asr sp
    2974:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
    2978:	79656b20 	stmdbvc	r5!, {r5, r8, r9, fp, sp, lr}^
    297c:	206f7420 	rsbcs	r7, pc, r0, lsr #8
    2980:	63657865 	cmnvs	r5, #6619136	; 0x650000
    2984:	20657475 	rsbcs	r7, r5, r5, ror r4
    2988:	2720726f 	strcs	r7, [r0, -pc, ror #4]!
    298c:	74202751 	strtvc	r2, [r0], #-1873	; 0xfffff8af
    2990:	7865206f 	stmdavc	r5!, {r0, r1, r2, r3, r5, r6, sp}^
    2994:	2e2e7469 	cdpcs	4, 2, cr7, cr14, cr9, {3}
    2998:	000a0d2e 	andeq	r0, sl, lr, lsr #26
    299c:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    29a0:	63252074 			; <UNDEFINED> instruction: 0x63252074
    29a4:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    29a8:	0000000a 	andeq	r0, r0, sl
    29ac:	5345545b 	movtpl	r5, #21595	; 0x545b
    29b0:	54205d54 	strtpl	r5, [r0], #-3412	; 0xfffff2ac
    29b4:	20747365 	rsbscs	r7, r4, r5, ror #6
    29b8:	73646e65 	cmnvc	r4, #1616	; 0x650
    29bc:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    29c0:	000a0d0a 	andeq	r0, sl, sl, lsl #26
    29c4:	5345545b 	movtpl	r5, #21595	; 0x545b
    29c8:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    29cc:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
    29d0:	0073253a 	rsbseq	r2, r3, sl, lsr r5
    29d4:	5345545b 	movtpl	r5, #21595	; 0x545b
    29d8:	45205d54 	strmi	r5, [r0, #-3412]!	; 0xfffff2ac
    29dc:	253a646e 	ldrcs	r6, [sl, #-1134]!	; 0xfffffb92
    29e0:	00000073 	andeq	r0, r0, r3, ror r0
    29e4:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    29e8:	72652074 	rsbvc	r2, r5, #116	; 0x74
    29ec:	2e726f72 	mrccs	15, 3, r6, cr2, cr2, {3}
    29f0:	0a0d2e2e 	beq	34e2b0 <__StackTop+0x32c2b0>
    29f4:	00000000 	andeq	r0, r0, r0
    29f8:	25204f52 	strcs	r4, [r0, #-3922]!	; 0xfffff0ae
    29fc:	000a0d64 	andeq	r0, sl, r4, ror #26
    2a00:	25204352 	strcs	r4, [r0, #-850]!	; 0xfffffcae
    2a04:	000a0d64 	andeq	r0, sl, r4, ror #26
    2a08:	6d204344 	stcvs	3, cr4, [r0, #-272]!	; 0xfffffef0
    2a0c:	726f746f 	rsbvc	r7, pc, #1862270976	; 0x6f000000
    2a10:	74697720 	strbtvc	r7, [r9], #-1824	; 0xfffff8e0
    2a14:	62742068 	rsbsvs	r2, r4, #104	; 0x68
    2a18:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
    2a1c:	70706120 	rsbsvc	r6, r0, r0, lsr #2
    2a20:	6163696c 	cmnvs	r3, ip, ror #18
    2a24:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
    2a28:	2e2e2e73 	mcrcs	14, 1, r2, cr14, cr3, {3}
    2a2c:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2a30:	6c756146 	ldfvse	f6, [r5], #-280	; 0xfffffee8
    2a34:	65642074 	strbvs	r2, [r4, #-116]!	; 0xffffff8c
    2a38:	74636574 	strbtvc	r6, [r3], #-1396	; 0xfffffa8c
    2a3c:	20216465 	eorcs	r6, r1, r5, ror #8
    2a40:	74737953 	ldrbtvc	r7, [r3], #-2387	; 0xfffff6ad
    2a44:	64206d65 	strtvs	r6, [r0], #-3429	; 0xfffff29b
    2a48:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
    2a4c:	2e64656c 	cdpcs	5, 6, cr6, cr4, cr12, {3}
    2a50:	0a0d2e2e 	beq	34e310 <__StackTop+0x32c310>
    2a54:	00000000 	andeq	r0, r0, r0

00002a58 <_global_impure_ptr>:
    2a58:	000202ac 	andeq	r0, r2, ip, lsr #5
    2a5c:	2b302d23 	blcs	c0def0 <__StackTop+0xbebef0>
    2a60:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    2a64:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    2a68:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    2a6c:	32313000 	eorscc	r3, r1, #0
    2a70:	36353433 			; <UNDEFINED> instruction: 0x36353433
    2a74:	41393837 	teqmi	r9, r7, lsr r8
    2a78:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    2a7c:	31300046 	teqcc	r0, r6, asr #32
    2a80:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    2a84:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    2a88:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    2a8c:	00006665 	andeq	r6, r0, r5, ror #12

00002a90 <__EH_FRAME_BEGIN__>:
    2a90:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <g_mcu_menu>:
   20000:	00000031 	andeq	r0, r0, r1, lsr r0
   20004:	000002a5 	andeq	r0, r0, r5, lsr #5
   20008:	4d43445b 	cfstrdmi	mvd4, [r3, #-364]	; 0xfffffe94
   2000c:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
   20010:	4344205d 	movtmi	r2, #16477	; 0x405d
   20014:	7973204d 	ldmdbvc	r3!, {r0, r2, r3, r6, sp}^
   20018:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
   2001c:	616e6520 	cmnvs	lr, r0, lsr #10
   20020:	2e656c62 	cdpcs	12, 6, cr6, cr5, cr2, {3}
   20024:	0a0d2e2e 	beq	36b8e4 <__StackTop+0x3498e4>
	...
   20088:	00000032 	andeq	r0, r0, r2, lsr r0
   2008c:	000002e9 	andeq	r0, r0, r9, ror #5
   20090:	4d43445b 	cfstrdmi	mvd4, [r3, #-364]	; 0xfffffe94
   20094:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
   20098:	4344205d 	movtmi	r2, #16477	; 0x405d
   2009c:	7973204d 	ldmdbvc	r3!, {r0, r2, r3, r6, sp}^
   200a0:	6d657473 	cfstrdvs	mvd7, [r5, #-460]!	; 0xfffffe34
   200a4:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
   200a8:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
   200ac:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   200b0:	0000000a 	andeq	r0, r0, sl
	...
   20110:	00000033 	andeq	r0, r0, r3, lsr r0
   20114:	0000034d 	andeq	r0, r0, sp, asr #6
   20118:	4d43445b 	cfstrdmi	mvd4, [r3, #-364]	; 0xfffffe94
   2011c:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
   20120:	4344205d 	movtmi	r2, #16477	; 0x405d
   20124:	7073204d 	rsbsvc	r2, r3, sp, asr #32
   20128:	20646565 	rsbcs	r6, r4, r5, ror #10
   2012c:	2e2e7075 	mcrcs	0, 1, r7, cr14, cr5, {3}
   20130:	000a0d2e 	andeq	r0, sl, lr, lsr #26
	...
   20198:	00000034 	andeq	r0, r0, r4, lsr r0
   2019c:	000003cd 	andeq	r0, r0, sp, asr #7
   201a0:	4d43445b 	cfstrdmi	mvd4, [r3, #-364]	; 0xfffffe94
   201a4:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
   201a8:	4344205d 	movtmi	r2, #16477	; 0x405d
   201ac:	7073204d 	rsbsvc	r2, r3, sp, asr #32
   201b0:	20646565 	rsbcs	r6, r4, r5, ror #10
   201b4:	6e776f64 	cdpvs	15, 7, cr6, cr7, cr4, {3}
   201b8:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   201bc:	0000000a 	andeq	r0, r0, sl
	...
   20220:	00000071 	andeq	r0, r0, r1, ror r0
   20224:	000002f9 	strdeq	r0, [r0], -r9
   20228:	4d43445b 	cfstrdmi	mvd4, [r3, #-364]	; 0xfffffe94
   2022c:	32313636 	eorscc	r3, r1, #56623104	; 0x3600000
   20230:	4344205d 	movtmi	r2, #16477	; 0x405d
   20234:	7473204d 	ldrbtvc	r2, [r3], #-77	; 0xffffffb3
   20238:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
   2023c:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
   20240:	79616c70 	stmdbvc	r1!, {r4, r5, r6, sl, fp, sp, lr}^
   20244:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   20248:	0000000a 	andeq	r0, r0, sl
	...

000202a8 <_impure_ptr>:
   202a8:	000202ac 	andeq	r0, r2, ip, lsr #5

000202ac <impure_data>:
	...

0002030c <__frame_dummy_init_array_entry>:
   2030c:	000000b1 	strheq	r0, [r0], -r1

00020310 <__do_global_dtors_aux_fini_array_entry>:
   20310:	0000008d 	andeq	r0, r0, sp, lsl #1

Disassembly of section .bss:

00020314 <__bss_start__>:
   20314:	00000000 	andeq	r0, r0, r0

00020318 <object.0>:
	...

00020330 <hadvtim>:
	...

000203a0 <DCM>:
	...

00020450 <huart0>:
	...

0002046c <__malloc_free_list>:
   2046c:	00000000 	andeq	r0, r0, r0

00020470 <__malloc_sbrk_start>:
   20470:	00000000 	andeq	r0, r0, r0

00020474 <errno>:
   20474:	00000000 	andeq	r0, r0, r0

00020478 <__lock___malloc_recursive_mutex>:
   20478:	00000000 	andeq	r0, r0, r0

0002047c <heap_end.0>:
   2047c:	00000000 	andeq	r0, r0, r0

Disassembly of section .stack_dummy:

00020480 <__HeapBase>:
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
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00001168 	andeq	r1, r0, r8, ror #2
  1c:	00000282 	andeq	r0, r0, r2, lsl #5
  20:	0c0e470a 	stceq	7, cr4, [lr], {10}
  24:	02850384 	addeq	r0, r5, #132, 6	; 0x10000002
  28:	3a03018e 	bcc	c0668 <__StackTop+0x9e668>
  2c:	00000b01 	andeq	r0, r0, r1, lsl #22
  30:	00000018 	andeq	r0, r0, r8, lsl r0
  34:	00000000 	andeq	r0, r0, r0
  38:	000013ec 	andeq	r1, r0, ip, ror #7
  3c:	0000001e 	andeq	r0, r0, lr, lsl r0
  40:	0c0e460a 	stceq	6, cr4, [lr], {10}
  44:	02850384 	addeq	r0, r5, #132, 6	; 0x10000002
  48:	0b49018e 	bleq	1240688 <__StackTop+0x121e688>
  4c:	00000018 	andeq	r0, r0, r8, lsl r0
  50:	00000000 	andeq	r0, r0, r0
  54:	0000140c 	andeq	r1, r0, ip, lsl #8
  58:	00000022 	andeq	r0, r0, r2, lsr #32
  5c:	0c0e460a 	stceq	6, cr4, [lr], {10}
  60:	02850384 	addeq	r0, r5, #132, 6	; 0x10000002
  64:	0b4b018e 	bleq	12c06a4 <__StackTop+0x129e6a4>
  68:	00000018 	andeq	r0, r0, r8, lsl r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00001430 	andeq	r1, r0, r0, lsr r4
  74:	00000042 	andeq	r0, r0, r2, asr #32
  78:	0c0e5a0a 			; <UNDEFINED> instruction: 0x0c0e5a0a
  7c:	02850384 	addeq	r0, r5, #132, 6	; 0x10000002
  80:	0b47018e 	bleq	11c06c0 <__StackTop+0x119e6c0>
  84:	00000024 	andeq	r0, r0, r4, lsr #32
  88:	00000000 	andeq	r0, r0, r0
  8c:	00001474 	andeq	r1, r0, r4, ror r4
  90:	0000006a 	andeq	r0, r0, sl, rrx
  94:	0e450a0a 	vmlaeq.f32	s1, s10, s20
  98:	8503840c 	strhi	r8, [r3, #-1036]	; 0xfffffbf4
  9c:	43018e02 	movwmi	r8, #7682	; 0x1e02
  a0:	0c0e450b 	cfstr32eq	mvfx4, [lr], {11}
  a4:	02850384 	addeq	r0, r5, #132, 6	; 0x10000002
  a8:	0b68018e 	bleq	1a006e8 <__StackTop+0x19de6e8>
  ac:	0000000c 	andeq	r0, r0, ip
  b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  b4:	7c020001 	stcvc	0, cr0, [r2], {1}
  b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  bc:	0000001c 	andeq	r0, r0, ip, lsl r0
  c0:	000000ac 	andeq	r0, r0, ip, lsr #1
  c4:	000014e0 	andeq	r1, r0, r0, ror #9
  c8:	00000254 	andeq	r0, r0, r4, asr r2
  cc:	100e410a 	andne	r4, lr, sl, lsl #2
  d0:	03850484 	orreq	r0, r5, #132, 8	; 0x84000000
  d4:	018e0286 	orreq	r0, lr, r6, lsl #5
  d8:	0b012903 	bleq	4a4ec <__StackTop+0x284ec>
  dc:	0000001c 	andeq	r0, r0, ip, lsl r0
  e0:	000000ac 	andeq	r0, r0, ip, lsr #1
  e4:	00001734 	andeq	r1, r0, r4, lsr r7
  e8:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  ec:	100e410a 	andne	r4, lr, sl, lsl #2
  f0:	03850484 	orreq	r0, r5, #132, 8	; 0x84000000
  f4:	018e0286 	orreq	r0, lr, r6, lsl #5
  f8:	000be702 	andeq	lr, fp, r2, lsl #14
  fc:	0000000c 	andeq	r0, r0, ip
 100:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 104:	7c020001 	stcvc	0, cr0, [r2], {1}
 108:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 10c:	00000010 	andeq	r0, r0, r0, lsl r0
 110:	000000fc 	strdeq	r0, [r0], -ip
 114:	00001904 	andeq	r1, r0, r4, lsl #18
 118:	0000009e 	muleq	r0, lr, r0
 11c:	0b4f020a 	bleq	13c094c <__StackTop+0x139e94c>
 120:	0000000c 	andeq	r0, r0, ip
 124:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 128:	7c020001 	stcvc	0, cr0, [r2], {1}
 12c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 130:	00000010 	andeq	r0, r0, r0, lsl r0
 134:	00000120 	andeq	r0, r0, r0, lsr #2
 138:	000019a4 	andeq	r1, r0, r4, lsr #19
 13c:	0000016c 	andeq	r0, r0, ip, ror #2
 140:	0bb6020a 	bleq	fed80970 <__StackTop+0xfed5e970>
 144:	00000010 	andeq	r0, r0, r0, lsl r0
 148:	00000120 	andeq	r0, r0, r0, lsr #2
 14c:	00001b10 	andeq	r1, r0, r0, lsl fp
 150:	00000024 	andeq	r0, r0, r4, lsr #32
 154:	000b520a 	andeq	r5, fp, sl, lsl #4
 158:	00000010 	andeq	r0, r0, r0, lsl r0
 15c:	00000120 	andeq	r0, r0, r0, lsr #2
 160:	00001b34 	andeq	r1, r0, r4, lsr fp
 164:	0000008c 	andeq	r0, r0, ip, lsl #1
 168:	0b46020a 	bleq	1180998 <__StackTop+0x115e998>
 16c:	0000000c 	andeq	r0, r0, ip
 170:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 174:	7c020001 	stcvc	0, cr0, [r2], {1}
 178:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 17c:	00000010 	andeq	r0, r0, r0, lsl r0
 180:	0000016c 	andeq	r0, r0, ip, ror #2
 184:	00001bc0 	andeq	r1, r0, r0, asr #23
 188:	00000168 	andeq	r0, r0, r8, ror #2
 18c:	0bb4020a 	bleq	fed009bc <__StackTop+0xfecde9bc>
 190:	00000010 	andeq	r0, r0, r0, lsl r0
 194:	0000016c 	andeq	r0, r0, ip, ror #2
 198:	00001d28 	andeq	r1, r0, r8, lsr #26
 19c:	00000136 	andeq	r0, r0, r6, lsr r1
 1a0:	0b9b020a 	bleq	fe6c09d0 <__StackTop+0xfe69e9d0>
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00001e60 	andeq	r1, r0, r0, ror #28
 1c0:	0000006e 	andeq	r0, r0, lr, rrx
 1c4:	040e4c0a 	streq	r4, [lr], #-3082	; 0xfffff3f6
 1c8:	0e410a4a 	vmlseq.f32	s1, s2, s20
 1cc:	4e0b5100 	adfmie	f5, f3, f0
 1d0:	0b41000e 	bleq	1040210 <__StackTop+0x101e210>
 1d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1dc:	00001ed0 	ldrdeq	r1, [r0], -r0
 1e0:	00000018 	andeq	r0, r0, r8, lsl r0
 1e4:	140e450a 	strne	r4, [lr], #-1290	; 0xfffffaf6
 1e8:	04810580 	streq	r0, [r1], #1408	; 0x580
 1ec:	02830382 	addeq	r0, r3, #134217730	; 0x8000002
 1f0:	0b47018e 	bleq	11c0830 <__StackTop+0x119e830>
 1f4:	00000014 	andeq	r0, r0, r4, lsl r0
 1f8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1fc:	00001ee8 	andeq	r1, r0, r8, ror #29
 200:	00000012 	andeq	r0, r0, r2, lsl r0
 204:	080e420a 	stmdaeq	lr, {r1, r3, r9, lr}
 208:	0b47028e 	bleq	11c0c48 <__StackTop+0x119ec48>
 20c:	00000014 	andeq	r0, r0, r4, lsl r0
 210:	000001a4 	andeq	r0, r0, r4, lsr #3
 214:	00001efc 	strdeq	r1, [r0], -ip
 218:	00000012 	andeq	r0, r0, r2, lsl r0
 21c:	080e420a 	stmdaeq	lr, {r1, r3, r9, lr}
 220:	0b47028e 	bleq	11c0c60 <__StackTop+0x119ec60>
 224:	00000014 	andeq	r0, r0, r4, lsl r0
 228:	000001a4 	andeq	r0, r0, r4, lsr #3
 22c:	00001f10 	andeq	r1, r0, r0, lsl pc
 230:	00000012 	andeq	r0, r0, r2, lsl r0
 234:	080e420a 	stmdaeq	lr, {r1, r3, r9, lr}
 238:	0b47028e 	bleq	11c0c78 <__StackTop+0x119ec78>
 23c:	00000014 	andeq	r0, r0, r4, lsl r0
 240:	000001a4 	andeq	r0, r0, r4, lsr #3
 244:	00001f24 	andeq	r1, r0, r4, lsr #30
 248:	00000012 	andeq	r0, r0, r2, lsl r0
 24c:	080e420a 	stmdaeq	lr, {r1, r3, r9, lr}
 250:	0b47028e 	bleq	11c0c90 <__StackTop+0x119ec90>
 254:	00000014 	andeq	r0, r0, r4, lsl r0
 258:	000001a4 	andeq	r0, r0, r4, lsr #3
 25c:	00001f38 	andeq	r1, r0, r8, lsr pc
 260:	00000012 	andeq	r0, r0, r2, lsl r0
 264:	080e420a 	stmdaeq	lr, {r1, r3, r9, lr}
 268:	0b47028e 	bleq	11c0ca8 <__StackTop+0x119eca8>
 26c:	0000000c 	andeq	r0, r0, ip
 270:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 274:	7c020001 	stcvc	0, cr0, [r2], {1}
 278:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 27c:	00000010 	andeq	r0, r0, r0, lsl r0
 280:	0000026c 	andeq	r0, r0, ip, ror #4
 284:	00001f4c 	andeq	r1, r0, ip, asr #30
 288:	0000003e 	andeq	r0, r0, lr, lsr r0
 28c:	000b5f0a 	andeq	r5, fp, sl, lsl #30
 290:	0000000c 	andeq	r0, r0, ip
 294:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 298:	7c020001 	stcvc	0, cr0, [r2], {1}
 29c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2a0:	00000014 	andeq	r0, r0, r4, lsl r0
 2a4:	00000290 	muleq	r0, r0, r2
 2a8:	00001f8c 	andeq	r1, r0, ip, lsl #31
 2ac:	00000028 	andeq	r0, r0, r8, lsr #32
 2b0:	83080e41 	movwhi	r0, #36417	; 0x8e41
 2b4:	00018e02 	andeq	r8, r1, r2, lsl #28
 2b8:	0000000c 	andeq	r0, r0, ip
 2bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2c8:	00000018 	andeq	r0, r0, r8, lsl r0
 2cc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2d0:	00001fc4 	andeq	r1, r0, r4, asr #31
 2d4:	0000002c 	andeq	r0, r0, ip, lsr #32
 2d8:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
 2dc:	700e4101 	andvc	r4, lr, r1, lsl #2
 2e0:	00040e4f 	andeq	r0, r4, pc, asr #28
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2ec:	00001ff0 	strdeq	r1, [r0], -r0
 2f0:	00000014 	andeq	r0, r0, r4, lsl r0
 2f4:	0000000c 	andeq	r0, r0, ip
 2f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 300:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 304:	00000020 	andeq	r0, r0, r0, lsr #32
 308:	000002f4 	strdeq	r0, [r0], -r4
 30c:	00002004 	andeq	r2, r0, r4
 310:	000000b6 	strheq	r0, [r0], -r6
 314:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 318:	86078508 	strhi	r8, [r7], -r8, lsl #10
 31c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 320:	8a038904 	bhi	e2738 <__StackTop+0xc0738>
 324:	00018e02 	andeq	r8, r1, r2, lsl #28
 328:	00000028 	andeq	r0, r0, r8, lsr #32
 32c:	000002f4 	strdeq	r0, [r0], -r4
 330:	00000000 	andeq	r0, r0, r0
 334:	000000f6 	strdeq	r0, [r0], -r6
 338:	84300e43 	ldrthi	r0, [r0], #-3651	; 0xfffff1bd
 33c:	86088509 	strhi	r8, [r8], -r9, lsl #10
 340:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 344:	8a048905 	bhi	122760 <__StackTop+0x100760>
 348:	8e028b03 	vmlahi.f64	d8, d2, d3
 34c:	0a6a0201 	beq	1a80b58 <__StackTop+0x1a5eb58>
 350:	0b42240e 	bleq	1089390 <__StackTop+0x1067390>
 354:	0000002c 	andeq	r0, r0, ip, lsr #32
 358:	000002f4 	strdeq	r0, [r0], -r4
 35c:	000020bc 	strheq	r2, [r0], -ip
 360:	00000200 	andeq	r0, r0, r0, lsl #4
 364:	84240e42 	strthi	r0, [r4], #-3650	; 0xfffff1be
 368:	86088509 	strhi	r8, [r8], -r9, lsl #10
 36c:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 370:	8a048905 	bhi	12278c <__StackTop+0x10078c>
 374:	8e028b03 	vmlahi.f64	d8, d2, d3
 378:	980e4701 	stmdals	lr, {r0, r8, r9, sl, lr}
 37c:	0ae10201 	beq	ff840b88 <__StackTop+0xff81eb88>
 380:	0b42240e 	bleq	10893c0 <__StackTop+0x10673c0>
 384:	0000000c 	andeq	r0, r0, ip
 388:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 38c:	7c020001 	stcvc	0, cr0, [r2], {1}
 390:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 394:	00000020 	andeq	r0, r0, r0, lsr #32
 398:	00000384 	andeq	r0, r0, r4, lsl #7
 39c:	000022bc 			; <UNDEFINED> instruction: 0x000022bc
 3a0:	000000de 	ldrdeq	r0, [r0], -lr
 3a4:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 3a8:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3ac:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3b0:	8a038904 	bhi	e27c8 <__StackTop+0xc07c8>
 3b4:	00018e02 	andeq	r8, r1, r2, lsl #28
 3b8:	00000028 	andeq	r0, r0, r8, lsr #32
 3bc:	00000384 	andeq	r0, r0, r4, lsl #7
 3c0:	0000239c 	muleq	r0, ip, r3
 3c4:	0000024c 	andeq	r0, r0, ip, asr #4
 3c8:	84300e42 	ldrthi	r0, [r0], #-3650	; 0xfffff1be
 3cc:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3d0:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3d4:	8a038904 	bhi	e27ec <__StackTop+0xc07ec>
 3d8:	02018e02 	andeq	r8, r1, #2, 28
 3dc:	200e0ab4 			; <UNDEFINED> instruction: 0x200e0ab4
 3e0:	00000b42 	andeq	r0, r0, r2, asr #22
 3e4:	0000000c 	andeq	r0, r0, ip
 3e8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3ec:	7c020001 	stcvc	0, cr0, [r2], {1}
 3f0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3f4:	00000014 	andeq	r0, r0, r4, lsl r0
 3f8:	000003e4 	andeq	r0, r0, r4, ror #7
 3fc:	000025e8 	andeq	r2, r0, r8, ror #11
 400:	0000001c 	andeq	r0, r0, ip, lsl r0
 404:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 408:	00018e02 	andeq	r8, r1, r2, lsl #28
 40c:	0000000c 	andeq	r0, r0, ip
 410:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 414:	7c020001 	stcvc	0, cr0, [r2], {1}
 418:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 41c:	00000014 	andeq	r0, r0, r4, lsl r0
 420:	0000040c 	andeq	r0, r0, ip, lsl #8
 424:	00002604 	andeq	r2, r0, r4, lsl #12
 428:	0000001c 	andeq	r0, r0, ip, lsl r0
 42c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 430:	00018e02 	andeq	r8, r1, r2, lsl #28
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	00000014 	andeq	r0, r0, r4, lsl r0
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00002620 	andeq	r2, r0, r0, lsr #12
 450:	00000034 	andeq	r0, r0, r4, lsr r0
 454:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 458:	00018e02 	andeq	r8, r1, r2, lsl #28
 45c:	0000000c 	andeq	r0, r0, ip
 460:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 464:	7c020001 	stcvc	0, cr0, [r2], {1}
 468:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 46c:	00000024 	andeq	r0, r0, r4, lsr #32
 470:	0000045c 	andeq	r0, r0, ip, asr r4
 474:	00002654 	andeq	r2, r0, r4, asr r6
 478:	00000090 	muleq	r0, r0, r0
 47c:	83100e41 	tsthi	r0, #1040	; 0x410
 480:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 484:	53018e02 	movwpl	r8, #7682	; 0x1e02
 488:	c4c5ce0a 	strbgt	ip, [r5], #3594	; 0xe0a
 48c:	42000ec3 	andmi	r0, r0, #3120	; 0xc30
 490:	0000000b 	andeq	r0, r0, fp
 494:	0000000c 	andeq	r0, r0, ip
 498:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 49c:	7c020001 	stcvc	0, cr0, [r2], {1}
 4a0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 4a4:	00000018 	andeq	r0, r0, r8, lsl r0
 4a8:	00000494 	muleq	r0, r4, r4
 4ac:	000026e4 	andeq	r2, r0, r4, ror #13
 4b0:	00000040 	andeq	r0, r0, r0, asr #32
 4b4:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 4b8:	86038504 	strhi	r8, [r3], -r4, lsl #10
 4bc:	00018e02 	andeq	r8, r1, r2, lsl #28
 4c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 4c4:	00000494 	muleq	r0, r4, r4
 4c8:	00002724 	andeq	r2, r0, r4, lsr #14
 4cc:	000000e8 	andeq	r0, r0, r8, ror #1
 4d0:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xfffff1be
 4d4:	86058506 	strhi	r8, [r5], -r6, lsl #10
 4d8:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 4dc:	00018e02 	andeq	r8, r1, r2, lsl #28
 4e0:	0000000c 	andeq	r0, r0, ip
 4e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 4e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 4ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 4f0:	00000028 	andeq	r0, r0, r8, lsr #32
 4f4:	000004e0 	andeq	r0, r0, r0, ror #9
 4f8:	0000280c 	andeq	r2, r0, ip, lsl #16
 4fc:	0000005e 	andeq	r0, r0, lr, asr r0
 500:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xfffff1be
 504:	86058506 	strhi	r8, [r5], -r6, lsl #10
 508:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 50c:	47018e02 	strmi	r8, [r1, -r2, lsl #28]
 510:	c7c8ce0a 	strbgt	ip, [r8, sl, lsl #28]
 514:	0ec4c5c6 	cdpeq	5, 12, cr12, cr4, cr6, {6}
 518:	000b4200 	andeq	r4, fp, r0, lsl #4
 51c:	0000000c 	andeq	r0, r0, ip
 520:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 524:	7c020001 	stcvc	0, cr0, [r2], {1}
 528:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 52c:	00000018 	andeq	r0, r0, r8, lsl r0
 530:	0000051c 	andeq	r0, r0, ip, lsl r5
 534:	0000286c 	andeq	r2, r0, ip, ror #16
 538:	00000020 	andeq	r0, r0, r0, lsr #32
 53c:	83100e41 	tsthi	r0, #1040	; 0x410
 540:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 544:	00018e02 	andeq	r8, r1, r2, lsl #28
 548:	0000000c 	andeq	r0, r0, ip
 54c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 550:	7c020001 	stcvc	0, cr0, [r2], {1}
 554:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 558:	0000000c 	andeq	r0, r0, ip
 55c:	00000548 	andeq	r0, r0, r8, asr #10
 560:	0000288c 	andeq	r2, r0, ip, lsl #17
 564:	0000000c 	andeq	r0, r0, ip
 568:	0000000c 	andeq	r0, r0, ip
 56c:	00000548 	andeq	r0, r0, r8, asr #10
 570:	00002898 	muleq	r0, r8, r8
 574:	0000000c 	andeq	r0, r0, ip
 578:	0000000c 	andeq	r0, r0, ip
 57c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 580:	7c020001 	stcvc	0, cr0, [r2], {1}
 584:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 588:	0000000c 	andeq	r0, r0, ip
 58c:	00000578 	andeq	r0, r0, r8, ror r5
 590:	000028a4 	andeq	r2, r0, r4, lsr #17
 594:	00000010 	andeq	r0, r0, r0, lsl r0
 598:	0000000c 	andeq	r0, r0, ip
 59c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 5a0:	7c020001 	stcvc	0, cr0, [r2], {1}
 5a4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5a8:	00000020 	andeq	r0, r0, r0, lsr #32
 5ac:	00000598 	muleq	r0, r8, r5
 5b0:	00000000 	andeq	r0, r0, r0
 5b4:	0000001a 	andeq	r0, r0, sl, lsl r0
 5b8:	83100e41 	tsthi	r0, #1040	; 0x410
 5bc:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 5c0:	4a018e02 	bmi	63dd0 <__StackTop+0x41dd0>
 5c4:	c3c4c5ce 	bicgt	ip, r4, #864026624	; 0x33800000
 5c8:	0000000e 	andeq	r0, r0, lr
 5cc:	00000024 	andeq	r0, r0, r4, lsr #32
 5d0:	00000598 	muleq	r0, r8, r5
 5d4:	00000000 	andeq	r0, r0, r0
 5d8:	000000b8 	strheq	r0, [r0], -r8
 5dc:	84100e42 	ldrhi	r0, [r0], #-3650	; 0xfffff1be
 5e0:	86038504 	strhi	r8, [r3], -r4, lsl #10
 5e4:	02018e02 	andeq	r8, r1, #2, 28
 5e8:	c6ce0a41 	strbgt	r0, [lr], r1, asr #20
 5ec:	000ec4c5 	andeq	ip, lr, r5, asr #9
 5f0:	00000b42 	andeq	r0, r0, r2, asr #22
 5f4:	0000000c 	andeq	r0, r0, ip
 5f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 5fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 600:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 604:	0000000c 	andeq	r0, r0, ip
 608:	000005f4 	strdeq	r0, [r0], -r4
 60c:	00000000 	andeq	r0, r0, r0
 610:	00000002 	andeq	r0, r0, r2
 614:	0000000c 	andeq	r0, r0, ip
 618:	000005f4 	strdeq	r0, [r0], -r4
 61c:	00000000 	andeq	r0, r0, r0
 620:	00000002 	andeq	r0, r0, r2
 624:	0000000c 	andeq	r0, r0, ip
 628:	000005f4 	strdeq	r0, [r0], -r4
 62c:	00000000 	andeq	r0, r0, r0
 630:	00000002 	andeq	r0, r0, r2
 634:	0000000c 	andeq	r0, r0, ip
 638:	000005f4 	strdeq	r0, [r0], -r4
 63c:	00000000 	andeq	r0, r0, r0
 640:	00000002 	andeq	r0, r0, r2
 644:	0000000c 	andeq	r0, r0, ip
 648:	000005f4 	strdeq	r0, [r0], -r4
 64c:	00000000 	andeq	r0, r0, r0
 650:	00000002 	andeq	r0, r0, r2
 654:	0000000c 	andeq	r0, r0, ip
 658:	000005f4 	strdeq	r0, [r0], -r4
 65c:	000028b4 			; <UNDEFINED> instruction: 0x000028b4
 660:	00000002 	andeq	r0, r0, r2
 664:	0000000c 	andeq	r0, r0, ip
 668:	000005f4 	strdeq	r0, [r0], -r4
 66c:	00000000 	andeq	r0, r0, r0
 670:	00000004 	andeq	r0, r0, r4
 674:	0000000c 	andeq	r0, r0, ip
 678:	000005f4 	strdeq	r0, [r0], -r4
 67c:	00000000 	andeq	r0, r0, r0
 680:	00000004 	andeq	r0, r0, r4
 684:	0000000c 	andeq	r0, r0, ip
 688:	000005f4 	strdeq	r0, [r0], -r4
 68c:	00000000 	andeq	r0, r0, r0
 690:	00000002 	andeq	r0, r0, r2
 694:	0000000c 	andeq	r0, r0, ip
 698:	000005f4 	strdeq	r0, [r0], -r4
 69c:	000028b6 			; <UNDEFINED> instruction: 0x000028b6
 6a0:	00000002 	andeq	r0, r0, r2
 6a4:	0000000c 	andeq	r0, r0, ip
 6a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 6ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 6b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 6b4:	0000000c 	andeq	r0, r0, ip
 6b8:	000006a4 	andeq	r0, r0, r4, lsr #13
 6bc:	000028b8 			; <UNDEFINED> instruction: 0x000028b8
 6c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 6c4:	0000000c 	andeq	r0, r0, ip
 6c8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 6cc:	7c020001 	stcvc	0, cr0, [r2], {1}
 6d0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 6d4:	0000000c 	andeq	r0, r0, ip
 6d8:	000006c4 	andeq	r0, r0, r4, asr #13
 6dc:	000028d4 	ldrdeq	r2, [r0], -r4
 6e0:	00000002 	andeq	r0, r0, r2

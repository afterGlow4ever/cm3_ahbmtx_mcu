
fw_test.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <__isr_vector>:
       0:	00022000 	andeq	r2, r2, r0
       4:	00001679 	andeq	r1, r0, r9, ror r6
       8:	000014c1 	andeq	r1, r0, r1, asr #9
       c:	000014d1 	ldrdeq	r1, [r0], -r1	; <UNPREDICTABLE>
      10:	000014d3 	ldrdeq	r1, [r0], -r3
      14:	000014d5 	ldrdeq	r1, [r0], -r5
      18:	000014d7 	ldrdeq	r1, [r0], -r7
	...
      2c:	000014d9 	ldrdeq	r1, [r0], -r9
      30:	000014db 	ldrdeq	r1, [r0], -fp
      34:	00000000 	andeq	r0, r0, r0
      38:	000014dd 	ldrdeq	r1, [r0], -sp
      3c:	000014df 	ldrdeq	r1, [r0], -pc	; <UNPREDICTABLE>
      40:	000014e1 	andeq	r1, r0, r1, ror #9
      44:	000016cd 	andeq	r1, r0, sp, asr #13
      48:	000016cf 	andeq	r1, r0, pc, asr #13
      4c:	000016d1 	ldrdeq	r1, [r0], -r1	; <UNPREDICTABLE>
      50:	000016d3 	ldrdeq	r1, [r0], -r3
      54:	000016d5 	ldrdeq	r1, [r0], -r5
      58:	000016d7 	ldrdeq	r1, [r0], -r7
      5c:	000016d9 	ldrdeq	r1, [r0], -r9
      60:	000016db 	ldrdeq	r1, [r0], -fp
      64:	000016dd 	ldrdeq	r1, [r0], -sp
      68:	000016df 	ldrdeq	r1, [r0], -pc	; <UNPREDICTABLE>
      6c:	000016e1 	andeq	r1, r0, r1, ror #13
      70:	000016e3 	andeq	r1, r0, r3, ror #13
      74:	000016e5 	andeq	r1, r0, r5, ror #13
      78:	000016e7 	andeq	r1, r0, r7, ror #13
      7c:	000016e9 	andeq	r1, r0, r9, ror #13
      80:	000014fd 	strdeq	r1, [r0], -sp
      84:	00001519 	andeq	r1, r0, r9, lsl r5
      88:	00001535 	andeq	r1, r0, r5, lsr r5

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
      a4:	00020534 	andeq	r0, r2, r4, lsr r5
      a8:	00000000 	andeq	r0, r0, r0
      ac:	00002190 	muleq	r0, r0, r1

000000b0 <frame_dummy>:
      b0:	b508      	push	{r3, lr}
      b2:	4b03      	ldr	r3, [pc, #12]	; (c0 <frame_dummy+0x10>)
      b4:	b11b      	cbz	r3, be <frame_dummy+0xe>
      b6:	4903      	ldr	r1, [pc, #12]	; (c4 <frame_dummy+0x14>)
      b8:	4803      	ldr	r0, [pc, #12]	; (c8 <frame_dummy+0x18>)
      ba:	f3af 8000 	nop.w
      be:	bd08      	pop	{r3, pc}
      c0:	00000000 	andeq	r0, r0, r0
      c4:	00020538 	andeq	r0, r2, r8, lsr r5
      c8:	00002190 	muleq	r0, r0, r1

000000cc <advtim_ch_all_pwm_with_deadzone_with_break_on_init>:
      cc:	b538      	push	{r3, r4, r5, lr}
      ce:	4c42      	ldr	r4, [pc, #264]	; (1d8 <advtim_ch_all_pwm_with_deadzone_with_break_on_init+0x10c>)
      d0:	4842      	ldr	r0, [pc, #264]	; (1dc <advtim_ch_all_pwm_with_deadzone_with_break_on_init+0x110>)
      d2:	6020      	str	r0, [r4, #0]
      d4:	2302      	movs	r3, #2
      d6:	80a3      	strh	r3, [r4, #4]
      d8:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
      dc:	80e3      	strh	r3, [r4, #6]
      de:	2200      	movs	r2, #0
      e0:	8122      	strh	r2, [r4, #8]
      e2:	2301      	movs	r3, #1
      e4:	72a3      	strb	r3, [r4, #10]
      e6:	72e3      	strb	r3, [r4, #11]
      e8:	2164      	movs	r1, #100	; 0x64
      ea:	81a1      	strh	r1, [r4, #12]
      ec:	75e3      	strb	r3, [r4, #23]
      ee:	7623      	strb	r3, [r4, #24]
      f0:	7662      	strb	r2, [r4, #25]
      f2:	76a2      	strb	r2, [r4, #26]
      f4:	2106      	movs	r1, #6
      f6:	73a1      	strb	r1, [r4, #14]
      f8:	7522      	strb	r2, [r4, #20]
      fa:	7562      	strb	r2, [r4, #21]
      fc:	f04f 0efa 	mov.w	lr, #250	; 0xfa
     100:	f8a4 e01c 	strh.w	lr, [r4, #28]
     104:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
     108:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     10c:	f884 3029 	strb.w	r3, [r4, #41]	; 0x29
     110:	f884 302a 	strb.w	r3, [r4, #42]	; 0x2a
     114:	f04f 0c07 	mov.w	ip, #7
     118:	f884 c01e 	strb.w	ip, [r4, #30]
     11c:	f884 2024 	strb.w	r2, [r4, #36]	; 0x24
     120:	f884 2025 	strb.w	r2, [r4, #37]	; 0x25
     124:	f44f 75c8 	mov.w	r5, #400	; 0x190
     128:	85a5      	strh	r5, [r4, #44]	; 0x2c
     12a:	f884 3037 	strb.w	r3, [r4, #55]	; 0x37
     12e:	f884 3038 	strb.w	r3, [r4, #56]	; 0x38
     132:	f884 2039 	strb.w	r2, [r4, #57]	; 0x39
     136:	f884 203a 	strb.w	r2, [r4, #58]	; 0x3a
     13a:	f884 102e 	strb.w	r1, [r4, #46]	; 0x2e
     13e:	f884 2034 	strb.w	r2, [r4, #52]	; 0x34
     142:	f884 2035 	strb.w	r2, [r4, #53]	; 0x35
     146:	25c8      	movs	r5, #200	; 0xc8
     148:	87a5      	strh	r5, [r4, #60]	; 0x3c
     14a:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
     14e:	f884 2041 	strb.w	r2, [r4, #65]	; 0x41
     152:	f884 303f 	strb.w	r3, [r4, #63]	; 0x3f
     156:	f884 103e 	strb.w	r1, [r4, #62]	; 0x3e
     15a:	f44f 7596 	mov.w	r5, #300	; 0x12c
     15e:	f8a4 5042 	strh.w	r5, [r4, #66]	; 0x42
     162:	f884 3046 	strb.w	r3, [r4, #70]	; 0x46
     166:	f884 3047 	strb.w	r3, [r4, #71]	; 0x47
     16a:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     16e:	f884 1044 	strb.w	r1, [r4, #68]	; 0x44
     172:	f8a4 e048 	strh.w	lr, [r4, #72]	; 0x48
     176:	f884 304c 	strb.w	r3, [r4, #76]	; 0x4c
     17a:	f884 304d 	strb.w	r3, [r4, #77]	; 0x4d
     17e:	f884 204b 	strb.w	r2, [r4, #75]	; 0x4b
     182:	f884 c04a 	strb.w	ip, [r4, #74]	; 0x4a
     186:	f04f 0c0a 	mov.w	ip, #10
     18a:	f8a4 c04e 	strh.w	ip, [r4, #78]	; 0x4e
     18e:	75a3      	strb	r3, [r4, #22]
     190:	f884 3026 	strb.w	r3, [r4, #38]	; 0x26
     194:	f884 3036 	strb.w	r3, [r4, #54]	; 0x36
     198:	f884 1050 	strb.w	r1, [r4, #80]	; 0x50
     19c:	f884 3051 	strb.w	r3, [r4, #81]	; 0x51
     1a0:	f884 3052 	strb.w	r3, [r4, #82]	; 0x52
     1a4:	f884 2053 	strb.w	r2, [r4, #83]	; 0x53
     1a8:	f884 2054 	strb.w	r2, [r4, #84]	; 0x54
     1ac:	6803      	ldr	r3, [r0, #0]
     1ae:	f043 0302 	orr.w	r3, r3, #2
     1b2:	6003      	str	r3, [r0, #0]
     1b4:	4620      	mov	r0, r4
     1b6:	f000 feb6 	bl	f26 <drv_advtim_gen_init>
     1ba:	6823      	ldr	r3, [r4, #0]
     1bc:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     1be:	f042 0202 	orr.w	r2, r2, #2
     1c2:	641a      	str	r2, [r3, #64]	; 0x40
     1c4:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     1c6:	f042 0201 	orr.w	r2, r2, #1
     1ca:	641a      	str	r2, [r3, #64]	; 0x40
     1cc:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     1ce:	f042 0204 	orr.w	r2, r2, #4
     1d2:	641a      	str	r2, [r3, #64]	; 0x40
     1d4:	bd38      	pop	{r3, r4, r5, pc}
     1d6:	bf00      	nop
     1d8:	00020550 	andeq	r0, r2, r0, asr r5
     1dc:	40021000 	andmi	r1, r2, r0

000001e0 <advtim_ch_up_all_pwm_with_deadzone_with_break_on_init>:
     1e0:	b538      	push	{r3, r4, r5, lr}
     1e2:	4c42      	ldr	r4, [pc, #264]	; (2ec <Stack_Size+0xec>)
     1e4:	4842      	ldr	r0, [pc, #264]	; (2f0 <Stack_Size+0xf0>)
     1e6:	6020      	str	r0, [r4, #0]
     1e8:	2302      	movs	r3, #2
     1ea:	80a3      	strh	r3, [r4, #4]
     1ec:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
     1f0:	80e3      	strh	r3, [r4, #6]
     1f2:	2200      	movs	r2, #0
     1f4:	8122      	strh	r2, [r4, #8]
     1f6:	72a2      	strb	r2, [r4, #10]
     1f8:	72e2      	strb	r2, [r4, #11]
     1fa:	2364      	movs	r3, #100	; 0x64
     1fc:	81a3      	strh	r3, [r4, #12]
     1fe:	2301      	movs	r3, #1
     200:	75e3      	strb	r3, [r4, #23]
     202:	7623      	strb	r3, [r4, #24]
     204:	7662      	strb	r2, [r4, #25]
     206:	76a2      	strb	r2, [r4, #26]
     208:	2106      	movs	r1, #6
     20a:	73a1      	strb	r1, [r4, #14]
     20c:	7522      	strb	r2, [r4, #20]
     20e:	7562      	strb	r2, [r4, #21]
     210:	f04f 0efa 	mov.w	lr, #250	; 0xfa
     214:	f8a4 e01c 	strh.w	lr, [r4, #28]
     218:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
     21c:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     220:	f884 3029 	strb.w	r3, [r4, #41]	; 0x29
     224:	f884 302a 	strb.w	r3, [r4, #42]	; 0x2a
     228:	f04f 0c07 	mov.w	ip, #7
     22c:	f884 c01e 	strb.w	ip, [r4, #30]
     230:	f884 2024 	strb.w	r2, [r4, #36]	; 0x24
     234:	f884 2025 	strb.w	r2, [r4, #37]	; 0x25
     238:	f44f 75c8 	mov.w	r5, #400	; 0x190
     23c:	85a5      	strh	r5, [r4, #44]	; 0x2c
     23e:	f884 3037 	strb.w	r3, [r4, #55]	; 0x37
     242:	f884 3038 	strb.w	r3, [r4, #56]	; 0x38
     246:	f884 2039 	strb.w	r2, [r4, #57]	; 0x39
     24a:	f884 203a 	strb.w	r2, [r4, #58]	; 0x3a
     24e:	f884 102e 	strb.w	r1, [r4, #46]	; 0x2e
     252:	f884 2034 	strb.w	r2, [r4, #52]	; 0x34
     256:	f884 2035 	strb.w	r2, [r4, #53]	; 0x35
     25a:	25c8      	movs	r5, #200	; 0xc8
     25c:	87a5      	strh	r5, [r4, #60]	; 0x3c
     25e:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
     262:	f884 2041 	strb.w	r2, [r4, #65]	; 0x41
     266:	f884 303f 	strb.w	r3, [r4, #63]	; 0x3f
     26a:	f884 103e 	strb.w	r1, [r4, #62]	; 0x3e
     26e:	f44f 7596 	mov.w	r5, #300	; 0x12c
     272:	f8a4 5042 	strh.w	r5, [r4, #66]	; 0x42
     276:	f884 3046 	strb.w	r3, [r4, #70]	; 0x46
     27a:	f884 3047 	strb.w	r3, [r4, #71]	; 0x47
     27e:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     282:	f884 1044 	strb.w	r1, [r4, #68]	; 0x44
     286:	f8a4 e048 	strh.w	lr, [r4, #72]	; 0x48
     28a:	f884 304c 	strb.w	r3, [r4, #76]	; 0x4c
     28e:	f884 304d 	strb.w	r3, [r4, #77]	; 0x4d
     292:	f884 204b 	strb.w	r2, [r4, #75]	; 0x4b
     296:	f884 c04a 	strb.w	ip, [r4, #74]	; 0x4a
     29a:	f04f 0c0a 	mov.w	ip, #10
     29e:	f8a4 c04e 	strh.w	ip, [r4, #78]	; 0x4e
     2a2:	75a3      	strb	r3, [r4, #22]
     2a4:	f884 3026 	strb.w	r3, [r4, #38]	; 0x26
     2a8:	f884 3036 	strb.w	r3, [r4, #54]	; 0x36
     2ac:	f884 1050 	strb.w	r1, [r4, #80]	; 0x50
     2b0:	f884 3051 	strb.w	r3, [r4, #81]	; 0x51
     2b4:	f884 3052 	strb.w	r3, [r4, #82]	; 0x52
     2b8:	f884 2053 	strb.w	r2, [r4, #83]	; 0x53
     2bc:	f884 2054 	strb.w	r2, [r4, #84]	; 0x54
     2c0:	6803      	ldr	r3, [r0, #0]
     2c2:	f043 0302 	orr.w	r3, r3, #2
     2c6:	6003      	str	r3, [r0, #0]
     2c8:	4620      	mov	r0, r4
     2ca:	f000 fe2c 	bl	f26 <drv_advtim_gen_init>
     2ce:	6823      	ldr	r3, [r4, #0]
     2d0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     2d2:	f042 0202 	orr.w	r2, r2, #2
     2d6:	641a      	str	r2, [r3, #64]	; 0x40
     2d8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     2da:	f042 0201 	orr.w	r2, r2, #1
     2de:	641a      	str	r2, [r3, #64]	; 0x40
     2e0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     2e2:	f042 0204 	orr.w	r2, r2, #4
     2e6:	641a      	str	r2, [r3, #64]	; 0x40
     2e8:	bd38      	pop	{r3, r4, r5, pc}
     2ea:	bf00      	nop
     2ec:	00020550 	andeq	r0, r2, r0, asr r5
     2f0:	40021000 	andmi	r1, r2, r0

000002f4 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init>:
     2f4:	b510      	push	{r4, lr}
     2f6:	4c43      	ldr	r4, [pc, #268]	; (404 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init+0x110>)
     2f8:	4943      	ldr	r1, [pc, #268]	; (408 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init+0x114>)
     2fa:	6021      	str	r1, [r4, #0]
     2fc:	2302      	movs	r3, #2
     2fe:	80a3      	strh	r3, [r4, #4]
     300:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
     304:	80e3      	strh	r3, [r4, #6]
     306:	2200      	movs	r2, #0
     308:	8122      	strh	r2, [r4, #8]
     30a:	2301      	movs	r3, #1
     30c:	72a3      	strb	r3, [r4, #10]
     30e:	72e2      	strb	r2, [r4, #11]
     310:	2064      	movs	r0, #100	; 0x64
     312:	81a0      	strh	r0, [r4, #12]
     314:	75e3      	strb	r3, [r4, #23]
     316:	7623      	strb	r3, [r4, #24]
     318:	7662      	strb	r2, [r4, #25]
     31a:	76a2      	strb	r2, [r4, #26]
     31c:	200c      	movs	r0, #12
     31e:	73a0      	strb	r0, [r4, #14]
     320:	7522      	strb	r2, [r4, #20]
     322:	7562      	strb	r2, [r4, #21]
     324:	f44f 70c8 	mov.w	r0, #400	; 0x190
     328:	83a0      	strh	r0, [r4, #28]
     32a:	f884 3027 	strb.w	r3, [r4, #39]	; 0x27
     32e:	f884 3028 	strb.w	r3, [r4, #40]	; 0x28
     332:	f884 3029 	strb.w	r3, [r4, #41]	; 0x29
     336:	f884 302a 	strb.w	r3, [r4, #42]	; 0x2a
     33a:	200d      	movs	r0, #13
     33c:	77a0      	strb	r0, [r4, #30]
     33e:	f884 2024 	strb.w	r2, [r4, #36]	; 0x24
     342:	f884 2025 	strb.w	r2, [r4, #37]	; 0x25
     346:	20c8      	movs	r0, #200	; 0xc8
     348:	85a0      	strh	r0, [r4, #44]	; 0x2c
     34a:	f884 3037 	strb.w	r3, [r4, #55]	; 0x37
     34e:	f884 3038 	strb.w	r3, [r4, #56]	; 0x38
     352:	f884 2039 	strb.w	r2, [r4, #57]	; 0x39
     356:	f884 203a 	strb.w	r2, [r4, #58]	; 0x3a
     35a:	200e      	movs	r0, #14
     35c:	f884 002e 	strb.w	r0, [r4, #46]	; 0x2e
     360:	f884 2034 	strb.w	r2, [r4, #52]	; 0x34
     364:	f884 2035 	strb.w	r2, [r4, #53]	; 0x35
     368:	f44f 7096 	mov.w	r0, #300	; 0x12c
     36c:	87a0      	strh	r0, [r4, #60]	; 0x3c
     36e:	f884 3040 	strb.w	r3, [r4, #64]	; 0x40
     372:	f884 2041 	strb.w	r2, [r4, #65]	; 0x41
     376:	f884 303f 	strb.w	r3, [r4, #63]	; 0x3f
     37a:	200f      	movs	r0, #15
     37c:	f884 003e 	strb.w	r0, [r4, #62]	; 0x3e
     380:	f04f 0cfa 	mov.w	ip, #250	; 0xfa
     384:	f8a4 c042 	strh.w	ip, [r4, #66]	; 0x42
     388:	f884 3046 	strb.w	r3, [r4, #70]	; 0x46
     38c:	f884 3047 	strb.w	r3, [r4, #71]	; 0x47
     390:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
     394:	2006      	movs	r0, #6
     396:	f884 0044 	strb.w	r0, [r4, #68]	; 0x44
     39a:	f8a4 c048 	strh.w	ip, [r4, #72]	; 0x48
     39e:	f884 304c 	strb.w	r3, [r4, #76]	; 0x4c
     3a2:	f884 304d 	strb.w	r3, [r4, #77]	; 0x4d
     3a6:	f884 204b 	strb.w	r2, [r4, #75]	; 0x4b
     3aa:	f04f 0c07 	mov.w	ip, #7
     3ae:	f884 c04a 	strb.w	ip, [r4, #74]	; 0x4a
     3b2:	f04f 0c0a 	mov.w	ip, #10
     3b6:	f8a4 c04e 	strh.w	ip, [r4, #78]	; 0x4e
     3ba:	75a3      	strb	r3, [r4, #22]
     3bc:	f884 3026 	strb.w	r3, [r4, #38]	; 0x26
     3c0:	f884 3036 	strb.w	r3, [r4, #54]	; 0x36
     3c4:	f884 0050 	strb.w	r0, [r4, #80]	; 0x50
     3c8:	f884 3051 	strb.w	r3, [r4, #81]	; 0x51
     3cc:	f884 3052 	strb.w	r3, [r4, #82]	; 0x52
     3d0:	f884 2053 	strb.w	r2, [r4, #83]	; 0x53
     3d4:	f884 2054 	strb.w	r2, [r4, #84]	; 0x54
     3d8:	680b      	ldr	r3, [r1, #0]
     3da:	f043 0302 	orr.w	r3, r3, #2
     3de:	600b      	str	r3, [r1, #0]
     3e0:	4620      	mov	r0, r4
     3e2:	f000 fda0 	bl	f26 <drv_advtim_gen_init>
     3e6:	6823      	ldr	r3, [r4, #0]
     3e8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     3ea:	f042 0202 	orr.w	r2, r2, #2
     3ee:	641a      	str	r2, [r3, #64]	; 0x40
     3f0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     3f2:	f042 0201 	orr.w	r2, r2, #1
     3f6:	641a      	str	r2, [r3, #64]	; 0x40
     3f8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
     3fa:	f042 0204 	orr.w	r2, r2, #4
     3fe:	641a      	str	r2, [r3, #64]	; 0x40
     400:	bd10      	pop	{r4, pc}
     402:	bf00      	nop
     404:	00020550 	andeq	r0, r2, r0, asr r5
     408:	40021000 	andmi	r1, r2, r0

0000040c <advtim_ch1_cap_step_on_init>:
     40c:	b510      	push	{r4, lr}
     40e:	4c15      	ldr	r4, [pc, #84]	; (464 <advtim_ch1_cap_step_on_init+0x58>)
     410:	4b15      	ldr	r3, [pc, #84]	; (468 <advtim_ch1_cap_step_on_init+0x5c>)
     412:	6023      	str	r3, [r4, #0]
     414:	2202      	movs	r2, #2
     416:	f8a4 2056 	strh.w	r2, [r4, #86]	; 0x56
     41a:	2219      	movs	r2, #25
     41c:	f8a4 2058 	strh.w	r2, [r4, #88]	; 0x58
     420:	2100      	movs	r1, #0
     422:	f8a4 105a 	strh.w	r1, [r4, #90]	; 0x5a
     426:	2204      	movs	r2, #4
     428:	f884 205c 	strb.w	r2, [r4, #92]	; 0x5c
     42c:	f884 105d 	strb.w	r1, [r4, #93]	; 0x5d
     430:	2201      	movs	r2, #1
     432:	f884 205e 	strb.w	r2, [r4, #94]	; 0x5e
     436:	f884 105f 	strb.w	r1, [r4, #95]	; 0x5f
     43a:	f884 2060 	strb.w	r2, [r4, #96]	; 0x60
     43e:	f884 2061 	strb.w	r2, [r4, #97]	; 0x61
     442:	681a      	ldr	r2, [r3, #0]
     444:	f042 0202 	orr.w	r2, r2, #2
     448:	601a      	str	r2, [r3, #0]
     44a:	4620      	mov	r0, r4
     44c:	f000 fb5e 	bl	b0c <drv_advtim_cap_init>
     450:	6823      	ldr	r3, [r4, #0]
     452:	6dda      	ldr	r2, [r3, #92]	; 0x5c
     454:	f042 0202 	orr.w	r2, r2, #2
     458:	65da      	str	r2, [r3, #92]	; 0x5c
     45a:	6dda      	ldr	r2, [r3, #92]	; 0x5c
     45c:	f042 0201 	orr.w	r2, r2, #1
     460:	65da      	str	r2, [r3, #92]	; 0x5c
     462:	bd10      	pop	{r4, pc}
     464:	00020550 	andeq	r0, r2, r0, asr r5
     468:	40021000 	andmi	r1, r2, r0

0000046c <advtim_ch1_cap_pwm_on_init>:
     46c:	b510      	push	{r4, lr}
     46e:	4c15      	ldr	r4, [pc, #84]	; (4c4 <advtim_ch1_cap_pwm_on_init+0x58>)
     470:	4a15      	ldr	r2, [pc, #84]	; (4c8 <advtim_ch1_cap_pwm_on_init+0x5c>)
     472:	6022      	str	r2, [r4, #0]
     474:	2302      	movs	r3, #2
     476:	f8a4 3056 	strh.w	r3, [r4, #86]	; 0x56
     47a:	2319      	movs	r3, #25
     47c:	f8a4 3058 	strh.w	r3, [r4, #88]	; 0x58
     480:	2100      	movs	r1, #0
     482:	f8a4 105a 	strh.w	r1, [r4, #90]	; 0x5a
     486:	2304      	movs	r3, #4
     488:	f884 305c 	strb.w	r3, [r4, #92]	; 0x5c
     48c:	2301      	movs	r3, #1
     48e:	f884 305d 	strb.w	r3, [r4, #93]	; 0x5d
     492:	f884 305e 	strb.w	r3, [r4, #94]	; 0x5e
     496:	f884 105f 	strb.w	r1, [r4, #95]	; 0x5f
     49a:	f884 3060 	strb.w	r3, [r4, #96]	; 0x60
     49e:	f884 3061 	strb.w	r3, [r4, #97]	; 0x61
     4a2:	6813      	ldr	r3, [r2, #0]
     4a4:	f043 0302 	orr.w	r3, r3, #2
     4a8:	6013      	str	r3, [r2, #0]
     4aa:	4620      	mov	r0, r4
     4ac:	f000 fb2e 	bl	b0c <drv_advtim_cap_init>
     4b0:	6823      	ldr	r3, [r4, #0]
     4b2:	6dda      	ldr	r2, [r3, #92]	; 0x5c
     4b4:	f042 0202 	orr.w	r2, r2, #2
     4b8:	65da      	str	r2, [r3, #92]	; 0x5c
     4ba:	6dda      	ldr	r2, [r3, #92]	; 0x5c
     4bc:	f042 0201 	orr.w	r2, r2, #1
     4c0:	65da      	str	r2, [r3, #92]	; 0x5c
     4c2:	bd10      	pop	{r4, pc}
     4c4:	00020550 	andeq	r0, r2, r0, asr r5
     4c8:	40021000 	andmi	r1, r2, r0

000004cc <advtim_ch1_enc_direct_both_edge_on_init>:
     4cc:	b510      	push	{r4, lr}
     4ce:	4c13      	ldr	r4, [pc, #76]	; (51c <advtim_ch1_enc_direct_both_edge_on_init+0x50>)
     4d0:	4a13      	ldr	r2, [pc, #76]	; (520 <advtim_ch1_enc_direct_both_edge_on_init+0x54>)
     4d2:	6022      	str	r2, [r4, #0]
     4d4:	f44f 637a 	mov.w	r3, #4000	; 0xfa0
     4d8:	6663      	str	r3, [r4, #100]	; 0x64
     4da:	2304      	movs	r3, #4
     4dc:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
     4e0:	2301      	movs	r3, #1
     4e2:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
     4e6:	f884 306a 	strb.w	r3, [r4, #106]	; 0x6a
     4ea:	2100      	movs	r1, #0
     4ec:	f884 106b 	strb.w	r1, [r4, #107]	; 0x6b
     4f0:	f884 306c 	strb.w	r3, [r4, #108]	; 0x6c
     4f4:	f884 306d 	strb.w	r3, [r4, #109]	; 0x6d
     4f8:	6813      	ldr	r3, [r2, #0]
     4fa:	f043 0302 	orr.w	r3, r3, #2
     4fe:	6013      	str	r3, [r2, #0]
     500:	4620      	mov	r0, r4
     502:	f000 fb81 	bl	c08 <drv_advtim_enc_init>
     506:	6823      	ldr	r3, [r4, #0]
     508:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     50a:	f042 0202 	orr.w	r2, r2, #2
     50e:	67da      	str	r2, [r3, #124]	; 0x7c
     510:	6fda      	ldr	r2, [r3, #124]	; 0x7c
     512:	f042 0201 	orr.w	r2, r2, #1
     516:	67da      	str	r2, [r3, #124]	; 0x7c
     518:	bd10      	pop	{r4, pc}
     51a:	bf00      	nop
     51c:	00020550 	andeq	r0, r2, r0, asr r5
     520:	40021000 	andmi	r1, r2, r0

00000524 <advtim_deinit>:
     524:	b510      	push	{r4, lr}
     526:	4c05      	ldr	r4, [pc, #20]	; (53c <advtim_deinit+0x18>)
     528:	4620      	mov	r0, r4
     52a:	f000 fd1b 	bl	f64 <drv_advtim_gen_deinit>
     52e:	4620      	mov	r0, r4
     530:	f000 fb0b 	bl	b4a <drv_advtim_cap_deinit>
     534:	4620      	mov	r0, r4
     536:	f000 fb88 	bl	c4a <drv_advtim_enc_deinit>
     53a:	bd10      	pop	{r4, pc}
     53c:	00020550 	andeq	r0, r2, r0, asr r5

00000540 <advtim_ch_all_pwm_with_deadzone_with_break_on_test>:
     540:	b538      	push	{r3, r4, r5, lr}
     542:	4819      	ldr	r0, [pc, #100]	; (5a8 <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x68>)
     544:	f001 f8e4 	bl	1710 <test_printf_s>
     548:	f7ff fdc0 	bl	cc <advtim_ch_all_pwm_with_deadzone_with_break_on_init>
     54c:	2200      	movs	r2, #0
     54e:	4b17      	ldr	r3, [pc, #92]	; (5ac <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x6c>)
     550:	801a      	strh	r2, [r3, #0]
     552:	4b17      	ldr	r3, [pc, #92]	; (5b0 <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x70>)
     554:	701a      	strb	r2, [r3, #0]
     556:	4b17      	ldr	r3, [pc, #92]	; (5b4 <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x74>)
     558:	701a      	strb	r2, [r3, #0]
     55a:	4b17      	ldr	r3, [pc, #92]	; (5b8 <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x78>)
     55c:	6818      	ldr	r0, [r3, #0]
     55e:	6801      	ldr	r1, [r0, #0]
     560:	f041 0101 	orr.w	r1, r1, #1
     564:	6001      	str	r1, [r0, #0]
     566:	6818      	ldr	r0, [r3, #0]
     568:	6801      	ldr	r1, [r0, #0]
     56a:	f021 0101 	bic.w	r1, r1, #1
     56e:	6001      	str	r1, [r0, #0]
     570:	4c12      	ldr	r4, [pc, #72]	; (5bc <advtim_ch_all_pwm_with_deadzone_with_break_on_test+0x7c>)
     572:	f884 2310 	strb.w	r2, [r4, #784]	; 0x310
     576:	f44f 3580 	mov.w	r5, #65536	; 0x10000
     57a:	6025      	str	r5, [r4, #0]
     57c:	6819      	ldr	r1, [r3, #0]
     57e:	680a      	ldr	r2, [r1, #0]
     580:	f042 0204 	orr.w	r2, r2, #4
     584:	600a      	str	r2, [r1, #0]
     586:	681a      	ldr	r2, [r3, #0]
     588:	6813      	ldr	r3, [r2, #0]
     58a:	f023 0304 	bic.w	r3, r3, #4
     58e:	6013      	str	r3, [r2, #0]
     590:	f001 f85c 	bl	164c <exit_current_test_loop>
     594:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     598:	f3bf 8f4f 	dsb	sy
     59c:	f3bf 8f6f 	isb	sy
     5a0:	f7ff ffc0 	bl	524 <advtim_deinit>
     5a4:	bd38      	pop	{r3, r4, r5, pc}
     5a6:	bf00      	nop
     5a8:	0000207c 	andeq	r2, r0, ip, ror r0
     5ac:	000205c2 	andeq	r0, r2, r2, asr #11
     5b0:	000205c4 	andeq	r0, r2, r4, asr #11
     5b4:	000205c5 	andeq	r0, r2, r5, asr #11
     5b8:	00020550 	andeq	r0, r2, r0, asr r5
     5bc:	e000e100 	and	lr, r0, r0, lsl #2

000005c0 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test>:
     5c0:	b538      	push	{r3, r4, r5, lr}
     5c2:	4823      	ldr	r0, [pc, #140]	; (650 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0x90>)
     5c4:	f001 f8a4 	bl	1710 <test_printf_s>
     5c8:	f7ff fd80 	bl	cc <advtim_ch_all_pwm_with_deadzone_with_break_on_init>
     5cc:	2200      	movs	r2, #0
     5ce:	4b21      	ldr	r3, [pc, #132]	; (654 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0x94>)
     5d0:	801a      	strh	r2, [r3, #0]
     5d2:	4b21      	ldr	r3, [pc, #132]	; (658 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0x98>)
     5d4:	701a      	strb	r2, [r3, #0]
     5d6:	4b21      	ldr	r3, [pc, #132]	; (65c <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0x9c>)
     5d8:	701a      	strb	r2, [r3, #0]
     5da:	4b21      	ldr	r3, [pc, #132]	; (660 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0xa0>)
     5dc:	2101      	movs	r1, #1
     5de:	7019      	strb	r1, [r3, #0]
     5e0:	4b20      	ldr	r3, [pc, #128]	; (664 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0xa4>)
     5e2:	701a      	strb	r2, [r3, #0]
     5e4:	4920      	ldr	r1, [pc, #128]	; (668 <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0xa8>)
     5e6:	680b      	ldr	r3, [r1, #0]
     5e8:	6958      	ldr	r0, [r3, #20]
     5ea:	f420 5000 	bic.w	r0, r0, #8192	; 0x2000
     5ee:	6158      	str	r0, [r3, #20]
     5f0:	6958      	ldr	r0, [r3, #20]
     5f2:	f440 7000 	orr.w	r0, r0, #512	; 0x200
     5f6:	6158      	str	r0, [r3, #20]
     5f8:	6998      	ldr	r0, [r3, #24]
     5fa:	f440 4080 	orr.w	r0, r0, #16384	; 0x4000
     5fe:	6198      	str	r0, [r3, #24]
     600:	6998      	ldr	r0, [r3, #24]
     602:	f440 6080 	orr.w	r0, r0, #1024	; 0x400
     606:	6198      	str	r0, [r3, #24]
     608:	6818      	ldr	r0, [r3, #0]
     60a:	f040 0001 	orr.w	r0, r0, #1
     60e:	6018      	str	r0, [r3, #0]
     610:	6808      	ldr	r0, [r1, #0]
     612:	6803      	ldr	r3, [r0, #0]
     614:	f023 0301 	bic.w	r3, r3, #1
     618:	6003      	str	r3, [r0, #0]
     61a:	4c14      	ldr	r4, [pc, #80]	; (66c <advtim_ch_all_pwm_gpio_with_deadzone_with_break_on_test+0xac>)
     61c:	f884 2310 	strb.w	r2, [r4, #784]	; 0x310
     620:	f44f 3580 	mov.w	r5, #65536	; 0x10000
     624:	6025      	str	r5, [r4, #0]
     626:	680a      	ldr	r2, [r1, #0]
     628:	6813      	ldr	r3, [r2, #0]
     62a:	f043 0304 	orr.w	r3, r3, #4
     62e:	6013      	str	r3, [r2, #0]
     630:	680a      	ldr	r2, [r1, #0]
     632:	6813      	ldr	r3, [r2, #0]
     634:	f023 0304 	bic.w	r3, r3, #4
     638:	6013      	str	r3, [r2, #0]
     63a:	f001 f807 	bl	164c <exit_current_test_loop>
     63e:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     642:	f3bf 8f4f 	dsb	sy
     646:	f3bf 8f6f 	isb	sy
     64a:	f7ff ff6b 	bl	524 <advtim_deinit>
     64e:	bd38      	pop	{r3, r4, r5, pc}
     650:	0000207c 	andeq	r2, r0, ip, ror r0
     654:	000205c2 	andeq	r0, r2, r2, asr #11
     658:	000205c4 	andeq	r0, r2, r4, asr #11
     65c:	000205c5 	andeq	r0, r2, r5, asr #11
     660:	000205c0 	andeq	r0, r2, r0, asr #11
     664:	000205c7 	andeq	r0, r2, r7, asr #11
     668:	00020550 	andeq	r0, r2, r0, asr r5
     66c:	e000e100 	and	lr, r0, r0, lsl #2

00000670 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test>:
     670:	b538      	push	{r3, r4, r5, lr}
     672:	4823      	ldr	r0, [pc, #140]	; (700 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0x90>)
     674:	f001 f84c 	bl	1710 <test_printf_s>
     678:	f7ff fdb2 	bl	1e0 <advtim_ch_up_all_pwm_with_deadzone_with_break_on_init>
     67c:	2200      	movs	r2, #0
     67e:	4b21      	ldr	r3, [pc, #132]	; (704 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0x94>)
     680:	801a      	strh	r2, [r3, #0]
     682:	4b21      	ldr	r3, [pc, #132]	; (708 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0x98>)
     684:	701a      	strb	r2, [r3, #0]
     686:	4b21      	ldr	r3, [pc, #132]	; (70c <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0x9c>)
     688:	701a      	strb	r2, [r3, #0]
     68a:	4b21      	ldr	r3, [pc, #132]	; (710 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0xa0>)
     68c:	2101      	movs	r1, #1
     68e:	7019      	strb	r1, [r3, #0]
     690:	4b20      	ldr	r3, [pc, #128]	; (714 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0xa4>)
     692:	701a      	strb	r2, [r3, #0]
     694:	4920      	ldr	r1, [pc, #128]	; (718 <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0xa8>)
     696:	680b      	ldr	r3, [r1, #0]
     698:	6958      	ldr	r0, [r3, #20]
     69a:	f420 5000 	bic.w	r0, r0, #8192	; 0x2000
     69e:	6158      	str	r0, [r3, #20]
     6a0:	6958      	ldr	r0, [r3, #20]
     6a2:	f440 7000 	orr.w	r0, r0, #512	; 0x200
     6a6:	6158      	str	r0, [r3, #20]
     6a8:	6998      	ldr	r0, [r3, #24]
     6aa:	f440 4080 	orr.w	r0, r0, #16384	; 0x4000
     6ae:	6198      	str	r0, [r3, #24]
     6b0:	6998      	ldr	r0, [r3, #24]
     6b2:	f440 6080 	orr.w	r0, r0, #1024	; 0x400
     6b6:	6198      	str	r0, [r3, #24]
     6b8:	6818      	ldr	r0, [r3, #0]
     6ba:	f040 0001 	orr.w	r0, r0, #1
     6be:	6018      	str	r0, [r3, #0]
     6c0:	6808      	ldr	r0, [r1, #0]
     6c2:	6803      	ldr	r3, [r0, #0]
     6c4:	f023 0301 	bic.w	r3, r3, #1
     6c8:	6003      	str	r3, [r0, #0]
     6ca:	4c14      	ldr	r4, [pc, #80]	; (71c <advtim_ch_up_all_pwm_gpio_with_deadzone_with_break_on_test+0xac>)
     6cc:	f884 2310 	strb.w	r2, [r4, #784]	; 0x310
     6d0:	f44f 3580 	mov.w	r5, #65536	; 0x10000
     6d4:	6025      	str	r5, [r4, #0]
     6d6:	680a      	ldr	r2, [r1, #0]
     6d8:	6813      	ldr	r3, [r2, #0]
     6da:	f043 0304 	orr.w	r3, r3, #4
     6de:	6013      	str	r3, [r2, #0]
     6e0:	680a      	ldr	r2, [r1, #0]
     6e2:	6813      	ldr	r3, [r2, #0]
     6e4:	f023 0304 	bic.w	r3, r3, #4
     6e8:	6013      	str	r3, [r2, #0]
     6ea:	f000 ffaf 	bl	164c <exit_current_test_loop>
     6ee:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     6f2:	f3bf 8f4f 	dsb	sy
     6f6:	f3bf 8f6f 	isb	sy
     6fa:	f7ff ff13 	bl	524 <advtim_deinit>
     6fe:	bd38      	pop	{r3, r4, r5, pc}
     700:	0000207c 	andeq	r2, r0, ip, ror r0
     704:	000205c2 	andeq	r0, r2, r2, asr #11
     708:	000205c4 	andeq	r0, r2, r4, asr #11
     70c:	000205c5 	andeq	r0, r2, r5, asr #11
     710:	000205c0 	andeq	r0, r2, r0, asr #11
     714:	000205c7 	andeq	r0, r2, r7, asr #11
     718:	00020550 	andeq	r0, r2, r0, asr r5
     71c:	e000e100 	and	lr, r0, r0, lsl #2

00000720 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test>:
     720:	b538      	push	{r3, r4, r5, lr}
     722:	481b      	ldr	r0, [pc, #108]	; (790 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x70>)
     724:	f000 fff4 	bl	1710 <test_printf_s>
     728:	f7ff fde4 	bl	2f4 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_init>
     72c:	2300      	movs	r3, #0
     72e:	4a19      	ldr	r2, [pc, #100]	; (794 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x74>)
     730:	8013      	strh	r3, [r2, #0]
     732:	4a19      	ldr	r2, [pc, #100]	; (798 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x78>)
     734:	7013      	strb	r3, [r2, #0]
     736:	4a19      	ldr	r2, [pc, #100]	; (79c <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x7c>)
     738:	7013      	strb	r3, [r2, #0]
     73a:	4a19      	ldr	r2, [pc, #100]	; (7a0 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x80>)
     73c:	2101      	movs	r1, #1
     73e:	7011      	strb	r1, [r2, #0]
     740:	4a18      	ldr	r2, [pc, #96]	; (7a4 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x84>)
     742:	7013      	strb	r3, [r2, #0]
     744:	4a18      	ldr	r2, [pc, #96]	; (7a8 <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x88>)
     746:	6810      	ldr	r0, [r2, #0]
     748:	6801      	ldr	r1, [r0, #0]
     74a:	f041 0101 	orr.w	r1, r1, #1
     74e:	6001      	str	r1, [r0, #0]
     750:	6810      	ldr	r0, [r2, #0]
     752:	6801      	ldr	r1, [r0, #0]
     754:	f021 0101 	bic.w	r1, r1, #1
     758:	6001      	str	r1, [r0, #0]
     75a:	4c14      	ldr	r4, [pc, #80]	; (7ac <advtim_ch_all_pwm_logic_with_deadzone_with_break_on_test+0x8c>)
     75c:	f884 3310 	strb.w	r3, [r4, #784]	; 0x310
     760:	f44f 3580 	mov.w	r5, #65536	; 0x10000
     764:	6025      	str	r5, [r4, #0]
     766:	6811      	ldr	r1, [r2, #0]
     768:	680b      	ldr	r3, [r1, #0]
     76a:	f043 0304 	orr.w	r3, r3, #4
     76e:	600b      	str	r3, [r1, #0]
     770:	6812      	ldr	r2, [r2, #0]
     772:	6813      	ldr	r3, [r2, #0]
     774:	f023 0304 	bic.w	r3, r3, #4
     778:	6013      	str	r3, [r2, #0]
     77a:	f000 ff67 	bl	164c <exit_current_test_loop>
     77e:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     782:	f3bf 8f4f 	dsb	sy
     786:	f3bf 8f6f 	isb	sy
     78a:	f7ff fecb 	bl	524 <advtim_deinit>
     78e:	bd38      	pop	{r3, r4, r5, pc}
     790:	0000207c 	andeq	r2, r0, ip, ror r0
     794:	000205c2 	andeq	r0, r2, r2, asr #11
     798:	000205c4 	andeq	r0, r2, r4, asr #11
     79c:	000205c5 	andeq	r0, r2, r5, asr #11
     7a0:	000205c0 	andeq	r0, r2, r0, asr #11
     7a4:	000205c7 	andeq	r0, r2, r7, asr #11
     7a8:	00020550 	andeq	r0, r2, r0, asr r5
     7ac:	e000e100 	and	lr, r0, r0, lsl #2

000007b0 <advtim_ch1_step_input_on_test>:
     7b0:	b538      	push	{r3, r4, r5, lr}
     7b2:	4819      	ldr	r0, [pc, #100]	; (818 <advtim_ch1_step_input_on_test+0x68>)
     7b4:	f000 ffac 	bl	1710 <test_printf_s>
     7b8:	f7ff fe28 	bl	40c <advtim_ch1_cap_step_on_init>
     7bc:	2200      	movs	r2, #0
     7be:	4b17      	ldr	r3, [pc, #92]	; (81c <advtim_ch1_step_input_on_test+0x6c>)
     7c0:	801a      	strh	r2, [r3, #0]
     7c2:	4b17      	ldr	r3, [pc, #92]	; (820 <advtim_ch1_step_input_on_test+0x70>)
     7c4:	701a      	strb	r2, [r3, #0]
     7c6:	4b17      	ldr	r3, [pc, #92]	; (824 <advtim_ch1_step_input_on_test+0x74>)
     7c8:	701a      	strb	r2, [r3, #0]
     7ca:	4b17      	ldr	r3, [pc, #92]	; (828 <advtim_ch1_step_input_on_test+0x78>)
     7cc:	6818      	ldr	r0, [r3, #0]
     7ce:	6801      	ldr	r1, [r0, #0]
     7d0:	f041 0101 	orr.w	r1, r1, #1
     7d4:	6001      	str	r1, [r0, #0]
     7d6:	6818      	ldr	r0, [r3, #0]
     7d8:	6801      	ldr	r1, [r0, #0]
     7da:	f021 0101 	bic.w	r1, r1, #1
     7de:	6001      	str	r1, [r0, #0]
     7e0:	4c12      	ldr	r4, [pc, #72]	; (82c <advtim_ch1_step_input_on_test+0x7c>)
     7e2:	f884 2311 	strb.w	r2, [r4, #785]	; 0x311
     7e6:	f44f 3500 	mov.w	r5, #131072	; 0x20000
     7ea:	6025      	str	r5, [r4, #0]
     7ec:	6819      	ldr	r1, [r3, #0]
     7ee:	680a      	ldr	r2, [r1, #0]
     7f0:	f042 0208 	orr.w	r2, r2, #8
     7f4:	600a      	str	r2, [r1, #0]
     7f6:	681a      	ldr	r2, [r3, #0]
     7f8:	6813      	ldr	r3, [r2, #0]
     7fa:	f023 0308 	bic.w	r3, r3, #8
     7fe:	6013      	str	r3, [r2, #0]
     800:	f000 ff24 	bl	164c <exit_current_test_loop>
     804:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     808:	f3bf 8f4f 	dsb	sy
     80c:	f3bf 8f6f 	isb	sy
     810:	f7ff fe88 	bl	524 <advtim_deinit>
     814:	bd38      	pop	{r3, r4, r5, pc}
     816:	bf00      	nop
     818:	0000207c 	andeq	r2, r0, ip, ror r0
     81c:	000205c2 	andeq	r0, r2, r2, asr #11
     820:	000205c4 	andeq	r0, r2, r4, asr #11
     824:	000205c5 	andeq	r0, r2, r5, asr #11
     828:	00020550 	andeq	r0, r2, r0, asr r5
     82c:	e000e100 	and	lr, r0, r0, lsl #2

00000830 <advtim_ch1_pwm_input_on_test>:
     830:	b538      	push	{r3, r4, r5, lr}
     832:	4819      	ldr	r0, [pc, #100]	; (898 <advtim_ch1_pwm_input_on_test+0x68>)
     834:	f000 ff6c 	bl	1710 <test_printf_s>
     838:	f7ff fe18 	bl	46c <advtim_ch1_cap_pwm_on_init>
     83c:	2200      	movs	r2, #0
     83e:	4b17      	ldr	r3, [pc, #92]	; (89c <advtim_ch1_pwm_input_on_test+0x6c>)
     840:	801a      	strh	r2, [r3, #0]
     842:	4b17      	ldr	r3, [pc, #92]	; (8a0 <advtim_ch1_pwm_input_on_test+0x70>)
     844:	701a      	strb	r2, [r3, #0]
     846:	4b17      	ldr	r3, [pc, #92]	; (8a4 <advtim_ch1_pwm_input_on_test+0x74>)
     848:	701a      	strb	r2, [r3, #0]
     84a:	4b17      	ldr	r3, [pc, #92]	; (8a8 <advtim_ch1_pwm_input_on_test+0x78>)
     84c:	6818      	ldr	r0, [r3, #0]
     84e:	6801      	ldr	r1, [r0, #0]
     850:	f041 0101 	orr.w	r1, r1, #1
     854:	6001      	str	r1, [r0, #0]
     856:	6818      	ldr	r0, [r3, #0]
     858:	6801      	ldr	r1, [r0, #0]
     85a:	f021 0101 	bic.w	r1, r1, #1
     85e:	6001      	str	r1, [r0, #0]
     860:	4c12      	ldr	r4, [pc, #72]	; (8ac <advtim_ch1_pwm_input_on_test+0x7c>)
     862:	f884 2311 	strb.w	r2, [r4, #785]	; 0x311
     866:	f44f 3500 	mov.w	r5, #131072	; 0x20000
     86a:	6025      	str	r5, [r4, #0]
     86c:	6819      	ldr	r1, [r3, #0]
     86e:	680a      	ldr	r2, [r1, #0]
     870:	f042 0208 	orr.w	r2, r2, #8
     874:	600a      	str	r2, [r1, #0]
     876:	681a      	ldr	r2, [r3, #0]
     878:	6813      	ldr	r3, [r2, #0]
     87a:	f023 0308 	bic.w	r3, r3, #8
     87e:	6013      	str	r3, [r2, #0]
     880:	f000 fee4 	bl	164c <exit_current_test_loop>
     884:	f8c4 5080 	str.w	r5, [r4, #128]	; 0x80
     888:	f3bf 8f4f 	dsb	sy
     88c:	f3bf 8f6f 	isb	sy
     890:	f7ff fe48 	bl	524 <advtim_deinit>
     894:	bd38      	pop	{r3, r4, r5, pc}
     896:	bf00      	nop
     898:	0000207c 	andeq	r2, r0, ip, ror r0
     89c:	000205c2 	andeq	r0, r2, r2, asr #11
     8a0:	000205c4 	andeq	r0, r2, r4, asr #11
     8a4:	000205c5 	andeq	r0, r2, r5, asr #11
     8a8:	00020550 	andeq	r0, r2, r0, asr r5
     8ac:	e000e100 	and	lr, r0, r0, lsl #2

000008b0 <advtim_ch1_encoder_direct_both_edge_on_test>:
     8b0:	b570      	push	{r4, r5, r6, lr}
     8b2:	f7ff fe0b 	bl	4cc <advtim_ch1_enc_direct_both_edge_on_init>
     8b6:	2300      	movs	r3, #0
     8b8:	4a13      	ldr	r2, [pc, #76]	; (908 <advtim_ch1_encoder_direct_both_edge_on_test+0x58>)
     8ba:	8013      	strh	r3, [r2, #0]
     8bc:	4a13      	ldr	r2, [pc, #76]	; (90c <advtim_ch1_encoder_direct_both_edge_on_test+0x5c>)
     8be:	7013      	strb	r3, [r2, #0]
     8c0:	4c13      	ldr	r4, [pc, #76]	; (910 <advtim_ch1_encoder_direct_both_edge_on_test+0x60>)
     8c2:	6821      	ldr	r1, [r4, #0]
     8c4:	680a      	ldr	r2, [r1, #0]
     8c6:	f042 0201 	orr.w	r2, r2, #1
     8ca:	600a      	str	r2, [r1, #0]
     8cc:	6821      	ldr	r1, [r4, #0]
     8ce:	680a      	ldr	r2, [r1, #0]
     8d0:	f022 0201 	bic.w	r2, r2, #1
     8d4:	600a      	str	r2, [r1, #0]
     8d6:	4d0f      	ldr	r5, [pc, #60]	; (914 <advtim_ch1_encoder_direct_both_edge_on_test+0x64>)
     8d8:	f885 3312 	strb.w	r3, [r5, #786]	; 0x312
     8dc:	f44f 2680 	mov.w	r6, #262144	; 0x40000
     8e0:	602e      	str	r6, [r5, #0]
     8e2:	6822      	ldr	r2, [r4, #0]
     8e4:	6813      	ldr	r3, [r2, #0]
     8e6:	f043 0310 	orr.w	r3, r3, #16
     8ea:	6013      	str	r3, [r2, #0]
     8ec:	f000 feae 	bl	164c <exit_current_test_loop>
     8f0:	6822      	ldr	r2, [r4, #0]
     8f2:	6813      	ldr	r3, [r2, #0]
     8f4:	f023 0310 	bic.w	r3, r3, #16
     8f8:	6013      	str	r3, [r2, #0]
     8fa:	f8c5 6080 	str.w	r6, [r5, #128]	; 0x80
     8fe:	f3bf 8f4f 	dsb	sy
     902:	f3bf 8f6f 	isb	sy
     906:	bd70      	pop	{r4, r5, r6, pc}
     908:	000205c2 	andeq	r0, r2, r2, asr #11
     90c:	000205c6 	andeq	r0, r2, r6, asr #11
     910:	00020550 	andeq	r0, r2, r0, asr r5
     914:	e000e100 	and	lr, r0, r0, lsl #2

00000918 <advtim_gen_int_reloaded_callback>:
     918:	4a1d      	ldr	r2, [pc, #116]	; (990 <advtim_gen_int_reloaded_callback+0x78>)
     91a:	8813      	ldrh	r3, [r2, #0]
     91c:	b29b      	uxth	r3, r3
     91e:	3301      	adds	r3, #1
     920:	b29b      	uxth	r3, r3
     922:	8013      	strh	r3, [r2, #0]
     924:	4b1b      	ldr	r3, [pc, #108]	; (994 <advtim_gen_int_reloaded_callback+0x7c>)
     926:	781b      	ldrb	r3, [r3, #0]
     928:	b2db      	uxtb	r3, r3
     92a:	2b01      	cmp	r3, #1
     92c:	d000      	beq.n	930 <advtim_gen_int_reloaded_callback+0x18>
     92e:	4770      	bx	lr
     930:	4611      	mov	r1, r2
     932:	8810      	ldrh	r0, [r2, #0]
     934:	4b18      	ldr	r3, [pc, #96]	; (998 <advtim_gen_int_reloaded_callback+0x80>)
     936:	681b      	ldr	r3, [r3, #0]
     938:	691a      	ldr	r2, [r3, #16]
     93a:	b292      	uxth	r2, r2
     93c:	ea42 4200 	orr.w	r2, r2, r0, lsl #16
     940:	611a      	str	r2, [r3, #16]
     942:	8808      	ldrh	r0, [r1, #0]
     944:	699a      	ldr	r2, [r3, #24]
     946:	b292      	uxth	r2, r2
     948:	ea42 4200 	orr.w	r2, r2, r0, lsl #16
     94c:	619a      	str	r2, [r3, #24]
     94e:	880a      	ldrh	r2, [r1, #0]
     950:	b292      	uxth	r2, r2
     952:	f5b2 7ff9 	cmp.w	r2, #498	; 0x1f2
     956:	d9ea      	bls.n	92e <advtim_gen_int_reloaded_callback+0x16>
     958:	4810      	ldr	r0, [pc, #64]	; (99c <advtim_gen_int_reloaded_callback+0x84>)
     95a:	7802      	ldrb	r2, [r0, #0]
     95c:	43d2      	mvns	r2, r2
     95e:	b2d1      	uxtb	r1, r2
     960:	695a      	ldr	r2, [r3, #20]
     962:	f422 5200 	bic.w	r2, r2, #8192	; 0x2000
     966:	ea42 3241 	orr.w	r2, r2, r1, lsl #13
     96a:	615a      	str	r2, [r3, #20]
     96c:	7801      	ldrb	r1, [r0, #0]
     96e:	699a      	ldr	r2, [r3, #24]
     970:	f422 4280 	bic.w	r2, r2, #16384	; 0x4000
     974:	ea42 3281 	orr.w	r2, r2, r1, lsl #14
     978:	619a      	str	r2, [r3, #24]
     97a:	4b05      	ldr	r3, [pc, #20]	; (990 <advtim_gen_int_reloaded_callback+0x78>)
     97c:	2200      	movs	r2, #0
     97e:	801a      	strh	r2, [r3, #0]
     980:	7803      	ldrb	r3, [r0, #0]
     982:	b10b      	cbz	r3, 988 <advtim_gen_int_reloaded_callback+0x70>
     984:	7002      	strb	r2, [r0, #0]
     986:	4770      	bx	lr
     988:	4b04      	ldr	r3, [pc, #16]	; (99c <advtim_gen_int_reloaded_callback+0x84>)
     98a:	2201      	movs	r2, #1
     98c:	701a      	strb	r2, [r3, #0]
     98e:	e7ce      	b.n	92e <advtim_gen_int_reloaded_callback+0x16>
     990:	000205c2 	andeq	r0, r2, r2, asr #11
     994:	000205c0 	andeq	r0, r2, r0, asr #11
     998:	00020550 	andeq	r0, r2, r0, asr r5
     99c:	000205c7 	andeq	r0, r2, r7, asr #11

000009a0 <advtim_gen_int_reloading_reaching_rcr_callback>:
     9a0:	4a03      	ldr	r2, [pc, #12]	; (9b0 <advtim_gen_int_reloading_reaching_rcr_callback+0x10>)
     9a2:	8813      	ldrh	r3, [r2, #0]
     9a4:	b29b      	uxth	r3, r3
     9a6:	3301      	adds	r3, #1
     9a8:	b29b      	uxth	r3, r3
     9aa:	8013      	strh	r3, [r2, #0]
     9ac:	4770      	bx	lr
     9ae:	bf00      	nop
     9b0:	000205c2 	andeq	r0, r2, r2, asr #11

000009b4 <advtim_gen_int_fault_detected_callback>:
     9b4:	b510      	push	{r4, lr}
     9b6:	4c08      	ldr	r4, [pc, #32]	; (9d8 <advtim_gen_int_fault_detected_callback+0x24>)
     9b8:	7823      	ldrb	r3, [r4, #0]
     9ba:	3301      	adds	r3, #1
     9bc:	b2db      	uxtb	r3, r3
     9be:	7023      	strb	r3, [r4, #0]
     9c0:	4806      	ldr	r0, [pc, #24]	; (9dc <advtim_gen_int_fault_detected_callback+0x28>)
     9c2:	f000 fea5 	bl	1710 <test_printf_s>
     9c6:	7823      	ldrb	r3, [r4, #0]
     9c8:	b2db      	uxtb	r3, r3
     9ca:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
     9ce:	6093      	str	r3, [r2, #8]
     9d0:	230e      	movs	r3, #14
     9d2:	60d3      	str	r3, [r2, #12]
     9d4:	bd10      	pop	{r4, pc}
     9d6:	bf00      	nop
     9d8:	000205c5 	andeq	r0, r2, r5, asr #11
     9dc:	00002090 	muleq	r0, r0, r0

000009e0 <advtim_cap_int_reloaded_callback>:
     9e0:	4813      	ldr	r0, [pc, #76]	; (a30 <advtim_cap_int_reloaded_callback+0x50>)
     9e2:	6802      	ldr	r2, [r0, #0]
     9e4:	6e53      	ldr	r3, [r2, #100]	; 0x64
     9e6:	0c1b      	lsrs	r3, r3, #16
     9e8:	6e92      	ldr	r2, [r2, #104]	; 0x68
     9ea:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     9ee:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     9f2:	eb03 4312 	add.w	r3, r3, r2, lsr #16
     9f6:	b2db      	uxtb	r3, r3
     9f8:	4a0e      	ldr	r2, [pc, #56]	; (a34 <advtim_cap_int_reloaded_callback+0x54>)
     9fa:	7013      	strb	r3, [r2, #0]
     9fc:	7813      	ldrb	r3, [r2, #0]
     9fe:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a02:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a06:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
     a0a:	600b      	str	r3, [r1, #0]
     a0c:	6800      	ldr	r0, [r0, #0]
     a0e:	6e43      	ldr	r3, [r0, #100]	; 0x64
     a10:	6e80      	ldr	r0, [r0, #104]	; 0x68
     a12:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a16:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a1a:	4403      	add	r3, r0
     a1c:	b2db      	uxtb	r3, r3
     a1e:	7013      	strb	r3, [r2, #0]
     a20:	7813      	ldrb	r3, [r2, #0]
     a22:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a26:	eb03 0383 	add.w	r3, r3, r3, lsl #2
     a2a:	604b      	str	r3, [r1, #4]
     a2c:	4770      	bx	lr
     a2e:	bf00      	nop
     a30:	00020550 	andeq	r0, r2, r0, asr r5
     a34:	000205c5 	andeq	r0, r2, r5, asr #11

00000a38 <advtim_cap_int_reloading_reaching_rcr_callback>:
     a38:	4a03      	ldr	r2, [pc, #12]	; (a48 <advtim_cap_int_reloading_reaching_rcr_callback+0x10>)
     a3a:	8813      	ldrh	r3, [r2, #0]
     a3c:	b29b      	uxth	r3, r3
     a3e:	3301      	adds	r3, #1
     a40:	b29b      	uxth	r3, r3
     a42:	8013      	strh	r3, [r2, #0]
     a44:	4770      	bx	lr
     a46:	bf00      	nop
     a48:	000205c2 	andeq	r0, r2, r2, asr #11

00000a4c <advtim_enc_int_reloaded_callback>:
     a4c:	4a09      	ldr	r2, [pc, #36]	; (a74 <advtim_enc_int_reloaded_callback+0x28>)
     a4e:	8813      	ldrh	r3, [r2, #0]
     a50:	b29b      	uxth	r3, r3
     a52:	3301      	adds	r3, #1
     a54:	b29b      	uxth	r3, r3
     a56:	8013      	strh	r3, [r2, #0]
     a58:	4b07      	ldr	r3, [pc, #28]	; (a78 <advtim_enc_int_reloaded_callback+0x2c>)
     a5a:	681b      	ldr	r3, [r3, #0]
     a5c:	f8d3 3084 	ldr.w	r3, [r3, #132]	; 0x84
     a60:	b29b      	uxth	r3, r3
     a62:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
     a66:	6013      	str	r3, [r2, #0]
     a68:	4b04      	ldr	r3, [pc, #16]	; (a7c <advtim_enc_int_reloaded_callback+0x30>)
     a6a:	781b      	ldrb	r3, [r3, #0]
     a6c:	b2db      	uxtb	r3, r3
     a6e:	6053      	str	r3, [r2, #4]
     a70:	4770      	bx	lr
     a72:	bf00      	nop
     a74:	000205c2 	andeq	r0, r2, r2, asr #11
     a78:	00020550 	andeq	r0, r2, r0, asr r5
     a7c:	000205c6 	andeq	r0, r2, r6, asr #11

00000a80 <advtim_enc_int_detected_callback>:
     a80:	4a02      	ldr	r2, [pc, #8]	; (a8c <advtim_enc_int_detected_callback+0xc>)
     a82:	7813      	ldrb	r3, [r2, #0]
     a84:	3301      	adds	r3, #1
     a86:	b2db      	uxtb	r3, r3
     a88:	7013      	strb	r3, [r2, #0]
     a8a:	4770      	bx	lr
     a8c:	000205c6 	andeq	r0, r2, r6, asr #11

00000a90 <advtim_testmenu>:
     a90:	b510      	push	{r4, lr}
     a92:	4c05      	ldr	r4, [pc, #20]	; (aa8 <advtim_testmenu+0x18>)
     a94:	2107      	movs	r1, #7
     a96:	4620      	mov	r0, r4
     a98:	f000 fd5a 	bl	1550 <show_testmenu>
     a9c:	2107      	movs	r1, #7
     a9e:	4620      	mov	r0, r4
     aa0:	f000 fd76 	bl	1590 <test_execute>
     aa4:	bd10      	pop	{r4, pc}
     aa6:	bf00      	nop
     aa8:	00020000 	andeq	r0, r2, r0

00000aac <drv_advtim_cap_set_config>:
     aac:	b538      	push	{r3, r4, r5, lr}
     aae:	4604      	mov	r4, r0
     ab0:	f8b0 2056 	ldrh.w	r2, [r0, #86]	; 0x56
     ab4:	f8b0 1058 	ldrh.w	r1, [r0, #88]	; 0x58
     ab8:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
     abc:	6800      	ldr	r0, [r0, #0]
     abe:	460a      	mov	r2, r1
     ac0:	3054      	adds	r0, #84	; 0x54
     ac2:	f000 fa96 	bl	ff2 <drv_check_rw_data>
     ac6:	4605      	mov	r5, r0
     ac8:	f8b4 305a 	ldrh.w	r3, [r4, #90]	; 0x5a
     acc:	f894 105c 	ldrb.w	r1, [r4, #92]	; 0x5c
     ad0:	0309      	lsls	r1, r1, #12
     ad2:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     ad6:	f894 305d 	ldrb.w	r3, [r4, #93]	; 0x5d
     ada:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     ade:	f894 3060 	ldrb.w	r3, [r4, #96]	; 0x60
     ae2:	ea41 01c3 	orr.w	r1, r1, r3, lsl #3
     ae6:	f894 3061 	ldrb.w	r3, [r4, #97]	; 0x61
     aea:	ea41 0183 	orr.w	r1, r1, r3, lsl #2
     aee:	f894 205e 	ldrb.w	r2, [r4, #94]	; 0x5e
     af2:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     af6:	f894 205f 	ldrb.w	r2, [r4, #95]	; 0x5f
     afa:	4311      	orrs	r1, r2
     afc:	6820      	ldr	r0, [r4, #0]
     afe:	460a      	mov	r2, r1
     b00:	3058      	adds	r0, #88	; 0x58
     b02:	f000 fa76 	bl	ff2 <drv_check_rw_data>
     b06:	4328      	orrs	r0, r5
     b08:	b2c0      	uxtb	r0, r0
     b0a:	bd38      	pop	{r3, r4, r5, pc}

00000b0c <drv_advtim_cap_init>:
     b0c:	b510      	push	{r4, lr}
     b0e:	4604      	mov	r4, r0
     b10:	f7ff ffcc 	bl	aac <drv_advtim_cap_set_config>
     b14:	6822      	ldr	r2, [r4, #0]
     b16:	6813      	ldr	r3, [r2, #0]
     b18:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     b1c:	6013      	str	r3, [r2, #0]
     b1e:	6822      	ldr	r2, [r4, #0]
     b20:	6813      	ldr	r3, [r2, #0]
     b22:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     b26:	6013      	str	r3, [r2, #0]
     b28:	6823      	ldr	r3, [r4, #0]
     b2a:	2203      	movs	r2, #3
     b2c:	661a      	str	r2, [r3, #96]	; 0x60
     b2e:	6823      	ldr	r3, [r4, #0]
     b30:	2200      	movs	r2, #0
     b32:	661a      	str	r2, [r3, #96]	; 0x60
     b34:	6822      	ldr	r2, [r4, #0]
     b36:	6813      	ldr	r3, [r2, #0]
     b38:	f043 0301 	orr.w	r3, r3, #1
     b3c:	6013      	str	r3, [r2, #0]
     b3e:	6822      	ldr	r2, [r4, #0]
     b40:	6813      	ldr	r3, [r2, #0]
     b42:	f023 0301 	bic.w	r3, r3, #1
     b46:	6013      	str	r3, [r2, #0]
     b48:	bd10      	pop	{r4, pc}

00000b4a <drv_advtim_cap_deinit>:
     b4a:	6802      	ldr	r2, [r0, #0]
     b4c:	6813      	ldr	r3, [r2, #0]
     b4e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
     b52:	6013      	str	r3, [r2, #0]
     b54:	6802      	ldr	r2, [r0, #0]
     b56:	6813      	ldr	r3, [r2, #0]
     b58:	f423 7300 	bic.w	r3, r3, #512	; 0x200
     b5c:	6013      	str	r3, [r2, #0]
     b5e:	6802      	ldr	r2, [r0, #0]
     b60:	2300      	movs	r3, #0
     b62:	65d3      	str	r3, [r2, #92]	; 0x5c
     b64:	6802      	ldr	r2, [r0, #0]
     b66:	2103      	movs	r1, #3
     b68:	6611      	str	r1, [r2, #96]	; 0x60
     b6a:	6802      	ldr	r2, [r0, #0]
     b6c:	6613      	str	r3, [r2, #96]	; 0x60
     b6e:	4770      	bx	lr

00000b70 <drv_advtim_cap_interrupt_handler>:
     b70:	b538      	push	{r3, r4, r5, lr}
     b72:	4604      	mov	r4, r0
     b74:	6803      	ldr	r3, [r0, #0]
     b76:	6edd      	ldr	r5, [r3, #108]	; 0x6c
     b78:	6ddb      	ldr	r3, [r3, #92]	; 0x5c
     b7a:	b2db      	uxtb	r3, r3
     b7c:	401d      	ands	r5, r3
     b7e:	f015 0f01 	tst.w	r5, #1
     b82:	d103      	bne.n	b8c <drv_advtim_cap_interrupt_handler+0x1c>
     b84:	f015 0f02 	tst.w	r5, #2
     b88:	d10b      	bne.n	ba2 <drv_advtim_cap_interrupt_handler+0x32>
     b8a:	bd38      	pop	{r3, r4, r5, pc}
     b8c:	f7ff ff28 	bl	9e0 <advtim_cap_int_reloaded_callback>
     b90:	6822      	ldr	r2, [r4, #0]
     b92:	6e13      	ldr	r3, [r2, #96]	; 0x60
     b94:	f043 0301 	orr.w	r3, r3, #1
     b98:	6613      	str	r3, [r2, #96]	; 0x60
     b9a:	6823      	ldr	r3, [r4, #0]
     b9c:	2200      	movs	r2, #0
     b9e:	661a      	str	r2, [r3, #96]	; 0x60
     ba0:	e7f0      	b.n	b84 <drv_advtim_cap_interrupt_handler+0x14>
     ba2:	4620      	mov	r0, r4
     ba4:	f7ff ff48 	bl	a38 <advtim_cap_int_reloading_reaching_rcr_callback>
     ba8:	6822      	ldr	r2, [r4, #0]
     baa:	6e13      	ldr	r3, [r2, #96]	; 0x60
     bac:	f043 0302 	orr.w	r3, r3, #2
     bb0:	6613      	str	r3, [r2, #96]	; 0x60
     bb2:	6823      	ldr	r3, [r4, #0]
     bb4:	2200      	movs	r2, #0
     bb6:	661a      	str	r2, [r3, #96]	; 0x60
     bb8:	e7e7      	b.n	b8a <drv_advtim_cap_interrupt_handler+0x1a>

00000bba <drv_advtim_enc_set_config>:
     bba:	b538      	push	{r3, r4, r5, lr}
     bbc:	4604      	mov	r4, r0
     bbe:	6e41      	ldr	r1, [r0, #100]	; 0x64
     bc0:	6800      	ldr	r0, [r0, #0]
     bc2:	460a      	mov	r2, r1
     bc4:	3070      	adds	r0, #112	; 0x70
     bc6:	f000 fa14 	bl	ff2 <drv_check_rw_data>
     bca:	4605      	mov	r5, r0
     bcc:	f894 3068 	ldrb.w	r3, [r4, #104]	; 0x68
     bd0:	f894 1069 	ldrb.w	r1, [r4, #105]	; 0x69
     bd4:	0409      	lsls	r1, r1, #16
     bd6:	ea41 7103 	orr.w	r1, r1, r3, lsl #28
     bda:	f894 306c 	ldrb.w	r3, [r4, #108]	; 0x6c
     bde:	ea41 01c3 	orr.w	r1, r1, r3, lsl #3
     be2:	f894 306d 	ldrb.w	r3, [r4, #109]	; 0x6d
     be6:	ea41 0183 	orr.w	r1, r1, r3, lsl #2
     bea:	f894 206a 	ldrb.w	r2, [r4, #106]	; 0x6a
     bee:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     bf2:	f894 206b 	ldrb.w	r2, [r4, #107]	; 0x6b
     bf6:	4311      	orrs	r1, r2
     bf8:	6820      	ldr	r0, [r4, #0]
     bfa:	460a      	mov	r2, r1
     bfc:	3074      	adds	r0, #116	; 0x74
     bfe:	f000 f9f8 	bl	ff2 <drv_check_rw_data>
     c02:	4328      	orrs	r0, r5
     c04:	b2c0      	uxtb	r0, r0
     c06:	bd38      	pop	{r3, r4, r5, pc}

00000c08 <drv_advtim_enc_init>:
     c08:	b510      	push	{r4, lr}
     c0a:	4604      	mov	r4, r0
     c0c:	f7ff ffd5 	bl	bba <drv_advtim_enc_set_config>
     c10:	6822      	ldr	r2, [r4, #0]
     c12:	6813      	ldr	r3, [r2, #0]
     c14:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     c18:	6013      	str	r3, [r2, #0]
     c1a:	6822      	ldr	r2, [r4, #0]
     c1c:	6813      	ldr	r3, [r2, #0]
     c1e:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     c22:	6013      	str	r3, [r2, #0]
     c24:	6823      	ldr	r3, [r4, #0]
     c26:	2203      	movs	r2, #3
     c28:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     c2c:	6823      	ldr	r3, [r4, #0]
     c2e:	2200      	movs	r2, #0
     c30:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     c34:	6822      	ldr	r2, [r4, #0]
     c36:	6813      	ldr	r3, [r2, #0]
     c38:	f043 0301 	orr.w	r3, r3, #1
     c3c:	6013      	str	r3, [r2, #0]
     c3e:	6822      	ldr	r2, [r4, #0]
     c40:	6813      	ldr	r3, [r2, #0]
     c42:	f023 0301 	bic.w	r3, r3, #1
     c46:	6013      	str	r3, [r2, #0]
     c48:	bd10      	pop	{r4, pc}

00000c4a <drv_advtim_enc_deinit>:
     c4a:	6802      	ldr	r2, [r0, #0]
     c4c:	6813      	ldr	r3, [r2, #0]
     c4e:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     c52:	6013      	str	r3, [r2, #0]
     c54:	6802      	ldr	r2, [r0, #0]
     c56:	6813      	ldr	r3, [r2, #0]
     c58:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
     c5c:	6013      	str	r3, [r2, #0]
     c5e:	6802      	ldr	r2, [r0, #0]
     c60:	2300      	movs	r3, #0
     c62:	67d3      	str	r3, [r2, #124]	; 0x7c
     c64:	6802      	ldr	r2, [r0, #0]
     c66:	2103      	movs	r1, #3
     c68:	f8c2 1080 	str.w	r1, [r2, #128]	; 0x80
     c6c:	6802      	ldr	r2, [r0, #0]
     c6e:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
     c72:	4770      	bx	lr

00000c74 <drv_advtim_enc_interrupt_handler>:
     c74:	b538      	push	{r3, r4, r5, lr}
     c76:	4604      	mov	r4, r0
     c78:	6803      	ldr	r3, [r0, #0]
     c7a:	f8d3 5088 	ldr.w	r5, [r3, #136]	; 0x88
     c7e:	6fdb      	ldr	r3, [r3, #124]	; 0x7c
     c80:	b2db      	uxtb	r3, r3
     c82:	401d      	ands	r5, r3
     c84:	f015 0f01 	tst.w	r5, #1
     c88:	d103      	bne.n	c92 <drv_advtim_enc_interrupt_handler+0x1e>
     c8a:	f015 0f02 	tst.w	r5, #2
     c8e:	d10e      	bne.n	cae <drv_advtim_enc_interrupt_handler+0x3a>
     c90:	bd38      	pop	{r3, r4, r5, pc}
     c92:	f7ff fedb 	bl	a4c <advtim_enc_int_reloaded_callback>
     c96:	6822      	ldr	r2, [r4, #0]
     c98:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
     c9c:	f043 0301 	orr.w	r3, r3, #1
     ca0:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
     ca4:	6823      	ldr	r3, [r4, #0]
     ca6:	2200      	movs	r2, #0
     ca8:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     cac:	e7ed      	b.n	c8a <drv_advtim_enc_interrupt_handler+0x16>
     cae:	4620      	mov	r0, r4
     cb0:	f7ff fee6 	bl	a80 <advtim_enc_int_detected_callback>
     cb4:	6822      	ldr	r2, [r4, #0]
     cb6:	f8d2 3080 	ldr.w	r3, [r2, #128]	; 0x80
     cba:	f043 0302 	orr.w	r3, r3, #2
     cbe:	f8c2 3080 	str.w	r3, [r2, #128]	; 0x80
     cc2:	6823      	ldr	r3, [r4, #0]
     cc4:	2200      	movs	r2, #0
     cc6:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
     cca:	e7e1      	b.n	c90 <drv_advtim_enc_interrupt_handler+0x1c>

00000ccc <drv_advtim_gen_set_config>:
     ccc:	b538      	push	{r3, r4, r5, lr}
     cce:	4604      	mov	r4, r0
     cd0:	8882      	ldrh	r2, [r0, #4]
     cd2:	88c1      	ldrh	r1, [r0, #6]
     cd4:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
     cd8:	6800      	ldr	r0, [r0, #0]
     cda:	460a      	mov	r2, r1
     cdc:	3004      	adds	r0, #4
     cde:	f000 f988 	bl	ff2 <drv_check_rw_data>
     ce2:	4605      	mov	r5, r0
     ce4:	8921      	ldrh	r1, [r4, #8]
     ce6:	0409      	lsls	r1, r1, #16
     ce8:	6820      	ldr	r0, [r4, #0]
     cea:	460a      	mov	r2, r1
     cec:	3008      	adds	r0, #8
     cee:	f000 f980 	bl	ff2 <drv_check_rw_data>
     cf2:	4305      	orrs	r5, r0
     cf4:	b2ed      	uxtb	r5, r5
     cf6:	7aa2      	ldrb	r2, [r4, #10]
     cf8:	7ae1      	ldrb	r1, [r4, #11]
     cfa:	ea41 0142 	orr.w	r1, r1, r2, lsl #1
     cfe:	6820      	ldr	r0, [r4, #0]
     d00:	460a      	mov	r2, r1
     d02:	300c      	adds	r0, #12
     d04:	f000 f975 	bl	ff2 <drv_check_rw_data>
     d08:	4305      	orrs	r5, r0
     d0a:	b2ed      	uxtb	r5, r5
     d0c:	89a3      	ldrh	r3, [r4, #12]
     d0e:	7d21      	ldrb	r1, [r4, #20]
     d10:	0389      	lsls	r1, r1, #14
     d12:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     d16:	7d63      	ldrb	r3, [r4, #21]
     d18:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     d1c:	7c23      	ldrb	r3, [r4, #16]
     d1e:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     d22:	7c63      	ldrb	r3, [r4, #17]
     d24:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     d28:	7ca3      	ldrb	r3, [r4, #18]
     d2a:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     d2e:	7ce3      	ldrb	r3, [r4, #19]
     d30:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     d34:	7da3      	ldrb	r3, [r4, #22]
     d36:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     d3a:	7de3      	ldrb	r3, [r4, #23]
     d3c:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     d40:	7e23      	ldrb	r3, [r4, #24]
     d42:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     d46:	7e63      	ldrb	r3, [r4, #25]
     d48:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     d4c:	7ea2      	ldrb	r2, [r4, #26]
     d4e:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     d52:	7ba2      	ldrb	r2, [r4, #14]
     d54:	4311      	orrs	r1, r2
     d56:	6820      	ldr	r0, [r4, #0]
     d58:	460a      	mov	r2, r1
     d5a:	3010      	adds	r0, #16
     d5c:	f000 f949 	bl	ff2 <drv_check_rw_data>
     d60:	4305      	orrs	r5, r0
     d62:	b2ed      	uxtb	r5, r5
     d64:	8ba3      	ldrh	r3, [r4, #28]
     d66:	f894 1024 	ldrb.w	r1, [r4, #36]	; 0x24
     d6a:	0389      	lsls	r1, r1, #14
     d6c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     d70:	f894 3025 	ldrb.w	r3, [r4, #37]	; 0x25
     d74:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     d78:	f894 3020 	ldrb.w	r3, [r4, #32]
     d7c:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     d80:	f894 3021 	ldrb.w	r3, [r4, #33]	; 0x21
     d84:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     d88:	f894 3022 	ldrb.w	r3, [r4, #34]	; 0x22
     d8c:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     d90:	f894 3023 	ldrb.w	r3, [r4, #35]	; 0x23
     d94:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     d98:	f894 3026 	ldrb.w	r3, [r4, #38]	; 0x26
     d9c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     da0:	f894 3027 	ldrb.w	r3, [r4, #39]	; 0x27
     da4:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     da8:	f894 3028 	ldrb.w	r3, [r4, #40]	; 0x28
     dac:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     db0:	f894 3029 	ldrb.w	r3, [r4, #41]	; 0x29
     db4:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     db8:	f894 202a 	ldrb.w	r2, [r4, #42]	; 0x2a
     dbc:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     dc0:	7fa2      	ldrb	r2, [r4, #30]
     dc2:	4311      	orrs	r1, r2
     dc4:	6820      	ldr	r0, [r4, #0]
     dc6:	460a      	mov	r2, r1
     dc8:	3014      	adds	r0, #20
     dca:	f000 f912 	bl	ff2 <drv_check_rw_data>
     dce:	4305      	orrs	r5, r0
     dd0:	b2ed      	uxtb	r5, r5
     dd2:	8da3      	ldrh	r3, [r4, #44]	; 0x2c
     dd4:	f894 1034 	ldrb.w	r1, [r4, #52]	; 0x34
     dd8:	0389      	lsls	r1, r1, #14
     dda:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     dde:	f894 3035 	ldrb.w	r3, [r4, #53]	; 0x35
     de2:	ea41 3143 	orr.w	r1, r1, r3, lsl #13
     de6:	f894 3030 	ldrb.w	r3, [r4, #48]	; 0x30
     dea:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     dee:	f894 3031 	ldrb.w	r3, [r4, #49]	; 0x31
     df2:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     df6:	f894 3032 	ldrb.w	r3, [r4, #50]	; 0x32
     dfa:	ea41 2183 	orr.w	r1, r1, r3, lsl #10
     dfe:	f894 3033 	ldrb.w	r3, [r4, #51]	; 0x33
     e02:	ea41 2143 	orr.w	r1, r1, r3, lsl #9
     e06:	f894 3036 	ldrb.w	r3, [r4, #54]	; 0x36
     e0a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     e0e:	f894 3037 	ldrb.w	r3, [r4, #55]	; 0x37
     e12:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     e16:	f894 3038 	ldrb.w	r3, [r4, #56]	; 0x38
     e1a:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
     e1e:	f894 3039 	ldrb.w	r3, [r4, #57]	; 0x39
     e22:	ea41 11c3 	orr.w	r1, r1, r3, lsl #7
     e26:	f894 203a 	ldrb.w	r2, [r4, #58]	; 0x3a
     e2a:	ea41 1182 	orr.w	r1, r1, r2, lsl #6
     e2e:	f894 202e 	ldrb.w	r2, [r4, #46]	; 0x2e
     e32:	4311      	orrs	r1, r2
     e34:	6820      	ldr	r0, [r4, #0]
     e36:	460a      	mov	r2, r1
     e38:	3018      	adds	r0, #24
     e3a:	f000 f8da 	bl	ff2 <drv_check_rw_data>
     e3e:	4305      	orrs	r5, r0
     e40:	b2ed      	uxtb	r5, r5
     e42:	8fa3      	ldrh	r3, [r4, #60]	; 0x3c
     e44:	f894 103f 	ldrb.w	r1, [r4, #63]	; 0x3f
     e48:	0309      	lsls	r1, r1, #12
     e4a:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     e4e:	f894 3040 	ldrb.w	r3, [r4, #64]	; 0x40
     e52:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     e56:	f894 2041 	ldrb.w	r2, [r4, #65]	; 0x41
     e5a:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     e5e:	f894 203e 	ldrb.w	r2, [r4, #62]	; 0x3e
     e62:	4311      	orrs	r1, r2
     e64:	6820      	ldr	r0, [r4, #0]
     e66:	460a      	mov	r2, r1
     e68:	301c      	adds	r0, #28
     e6a:	f000 f8c2 	bl	ff2 <drv_check_rw_data>
     e6e:	4305      	orrs	r5, r0
     e70:	b2ed      	uxtb	r5, r5
     e72:	f8b4 3042 	ldrh.w	r3, [r4, #66]	; 0x42
     e76:	7be1      	ldrb	r1, [r4, #15]
     e78:	0349      	lsls	r1, r1, #13
     e7a:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     e7e:	7fe3      	ldrb	r3, [r4, #31]
     e80:	ea41 3183 	orr.w	r1, r1, r3, lsl #14
     e84:	f894 302f 	ldrb.w	r3, [r4, #47]	; 0x2f
     e88:	ea41 31c3 	orr.w	r1, r1, r3, lsl #15
     e8c:	f894 3045 	ldrb.w	r3, [r4, #69]	; 0x45
     e90:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     e94:	f894 3046 	ldrb.w	r3, [r4, #70]	; 0x46
     e98:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     e9c:	f894 2047 	ldrb.w	r2, [r4, #71]	; 0x47
     ea0:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     ea4:	f894 2044 	ldrb.w	r2, [r4, #68]	; 0x44
     ea8:	4311      	orrs	r1, r2
     eaa:	6820      	ldr	r0, [r4, #0]
     eac:	460a      	mov	r2, r1
     eae:	3020      	adds	r0, #32
     eb0:	f000 f89f 	bl	ff2 <drv_check_rw_data>
     eb4:	4305      	orrs	r5, r0
     eb6:	b2ed      	uxtb	r5, r5
     eb8:	f8b4 3048 	ldrh.w	r3, [r4, #72]	; 0x48
     ebc:	f894 104b 	ldrb.w	r1, [r4, #75]	; 0x4b
     ec0:	0309      	lsls	r1, r1, #12
     ec2:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     ec6:	f894 304c 	ldrb.w	r3, [r4, #76]	; 0x4c
     eca:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
     ece:	f894 204d 	ldrb.w	r2, [r4, #77]	; 0x4d
     ed2:	ea41 11c2 	orr.w	r1, r1, r2, lsl #7
     ed6:	f894 204a 	ldrb.w	r2, [r4, #74]	; 0x4a
     eda:	4311      	orrs	r1, r2
     edc:	6820      	ldr	r0, [r4, #0]
     ede:	460a      	mov	r2, r1
     ee0:	3024      	adds	r0, #36	; 0x24
     ee2:	f000 f886 	bl	ff2 <drv_check_rw_data>
     ee6:	4305      	orrs	r5, r0
     ee8:	b2ed      	uxtb	r5, r5
     eea:	f894 3050 	ldrb.w	r3, [r4, #80]	; 0x50
     eee:	f894 1054 	ldrb.w	r1, [r4, #84]	; 0x54
     ef2:	0349      	lsls	r1, r1, #13
     ef4:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
     ef8:	f894 3052 	ldrb.w	r3, [r4, #82]	; 0x52
     efc:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
     f00:	f894 3053 	ldrb.w	r3, [r4, #83]	; 0x53
     f04:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
     f08:	f894 2051 	ldrb.w	r2, [r4, #81]	; 0x51
     f0c:	ea41 2182 	orr.w	r1, r1, r2, lsl #10
     f10:	f8b4 204e 	ldrh.w	r2, [r4, #78]	; 0x4e
     f14:	4311      	orrs	r1, r2
     f16:	6820      	ldr	r0, [r4, #0]
     f18:	460a      	mov	r2, r1
     f1a:	3028      	adds	r0, #40	; 0x28
     f1c:	f000 f869 	bl	ff2 <drv_check_rw_data>
     f20:	4328      	orrs	r0, r5
     f22:	b2c0      	uxtb	r0, r0
     f24:	bd38      	pop	{r3, r4, r5, pc}

00000f26 <drv_advtim_gen_init>:
     f26:	b510      	push	{r4, lr}
     f28:	4604      	mov	r4, r0
     f2a:	f7ff fecf 	bl	ccc <drv_advtim_gen_set_config>
     f2e:	6822      	ldr	r2, [r4, #0]
     f30:	6813      	ldr	r3, [r2, #0]
     f32:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     f36:	6013      	str	r3, [r2, #0]
     f38:	6822      	ldr	r2, [r4, #0]
     f3a:	6813      	ldr	r3, [r2, #0]
     f3c:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     f40:	6013      	str	r3, [r2, #0]
     f42:	6823      	ldr	r3, [r4, #0]
     f44:	2207      	movs	r2, #7
     f46:	645a      	str	r2, [r3, #68]	; 0x44
     f48:	6823      	ldr	r3, [r4, #0]
     f4a:	2200      	movs	r2, #0
     f4c:	645a      	str	r2, [r3, #68]	; 0x44
     f4e:	6822      	ldr	r2, [r4, #0]
     f50:	6813      	ldr	r3, [r2, #0]
     f52:	f043 0301 	orr.w	r3, r3, #1
     f56:	6013      	str	r3, [r2, #0]
     f58:	6822      	ldr	r2, [r4, #0]
     f5a:	6813      	ldr	r3, [r2, #0]
     f5c:	f023 0301 	bic.w	r3, r3, #1
     f60:	6013      	str	r3, [r2, #0]
     f62:	bd10      	pop	{r4, pc}

00000f64 <drv_advtim_gen_deinit>:
     f64:	6802      	ldr	r2, [r0, #0]
     f66:	6813      	ldr	r3, [r2, #0]
     f68:	f443 7380 	orr.w	r3, r3, #256	; 0x100
     f6c:	6013      	str	r3, [r2, #0]
     f6e:	6802      	ldr	r2, [r0, #0]
     f70:	6813      	ldr	r3, [r2, #0]
     f72:	f423 7380 	bic.w	r3, r3, #256	; 0x100
     f76:	6013      	str	r3, [r2, #0]
     f78:	6802      	ldr	r2, [r0, #0]
     f7a:	2300      	movs	r3, #0
     f7c:	6413      	str	r3, [r2, #64]	; 0x40
     f7e:	6802      	ldr	r2, [r0, #0]
     f80:	2107      	movs	r1, #7
     f82:	6451      	str	r1, [r2, #68]	; 0x44
     f84:	6802      	ldr	r2, [r0, #0]
     f86:	6453      	str	r3, [r2, #68]	; 0x44
     f88:	4770      	bx	lr

00000f8a <drv_advtim_gen_interrupt_handler>:
     f8a:	b538      	push	{r3, r4, r5, lr}
     f8c:	4604      	mov	r4, r0
     f8e:	6803      	ldr	r3, [r0, #0]
     f90:	6c9d      	ldr	r5, [r3, #72]	; 0x48
     f92:	6c1b      	ldr	r3, [r3, #64]	; 0x40
     f94:	b2db      	uxtb	r3, r3
     f96:	401d      	ands	r5, r3
     f98:	f015 0f04 	tst.w	r5, #4
     f9c:	d106      	bne.n	fac <drv_advtim_gen_interrupt_handler+0x22>
     f9e:	f015 0f01 	tst.w	r5, #1
     fa2:	d10e      	bne.n	fc2 <drv_advtim_gen_interrupt_handler+0x38>
     fa4:	f015 0f02 	tst.w	r5, #2
     fa8:	d117      	bne.n	fda <drv_advtim_gen_interrupt_handler+0x50>
     faa:	bd38      	pop	{r3, r4, r5, pc}
     fac:	f7ff fd02 	bl	9b4 <advtim_gen_int_fault_detected_callback>
     fb0:	6822      	ldr	r2, [r4, #0]
     fb2:	6c53      	ldr	r3, [r2, #68]	; 0x44
     fb4:	f043 0304 	orr.w	r3, r3, #4
     fb8:	6453      	str	r3, [r2, #68]	; 0x44
     fba:	6823      	ldr	r3, [r4, #0]
     fbc:	2200      	movs	r2, #0
     fbe:	645a      	str	r2, [r3, #68]	; 0x44
     fc0:	e7ed      	b.n	f9e <drv_advtim_gen_interrupt_handler+0x14>
     fc2:	4620      	mov	r0, r4
     fc4:	f7ff fca8 	bl	918 <advtim_gen_int_reloaded_callback>
     fc8:	6822      	ldr	r2, [r4, #0]
     fca:	6c53      	ldr	r3, [r2, #68]	; 0x44
     fcc:	f043 0301 	orr.w	r3, r3, #1
     fd0:	6453      	str	r3, [r2, #68]	; 0x44
     fd2:	6823      	ldr	r3, [r4, #0]
     fd4:	2200      	movs	r2, #0
     fd6:	645a      	str	r2, [r3, #68]	; 0x44
     fd8:	e7e4      	b.n	fa4 <drv_advtim_gen_interrupt_handler+0x1a>
     fda:	4620      	mov	r0, r4
     fdc:	f7ff fce0 	bl	9a0 <advtim_gen_int_reloading_reaching_rcr_callback>
     fe0:	6822      	ldr	r2, [r4, #0]
     fe2:	6c53      	ldr	r3, [r2, #68]	; 0x44
     fe4:	f043 0302 	orr.w	r3, r3, #2
     fe8:	6453      	str	r3, [r2, #68]	; 0x44
     fea:	6823      	ldr	r3, [r4, #0]
     fec:	2200      	movs	r2, #0
     fee:	645a      	str	r2, [r3, #68]	; 0x44
     ff0:	e7db      	b.n	faa <drv_advtim_gen_interrupt_handler+0x20>

00000ff2 <drv_check_rw_data>:
     ff2:	6001      	str	r1, [r0, #0]
     ff4:	6803      	ldr	r3, [r0, #0]
     ff6:	4293      	cmp	r3, r2
     ff8:	d007      	beq.n	100a <drv_check_rw_data+0x18>
     ffa:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
     ffe:	2001      	movs	r0, #1
    1000:	6018      	str	r0, [r3, #0]
    1002:	685a      	ldr	r2, [r3, #4]
    1004:	4402      	add	r2, r0
    1006:	601a      	str	r2, [r3, #0]
    1008:	4770      	bx	lr
    100a:	2000      	movs	r0, #0
    100c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1010:	6018      	str	r0, [r3, #0]
    1012:	4770      	bx	lr

00001014 <drv_uart_default_config>:
    1014:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
    1018:	6043      	str	r3, [r0, #4]
    101a:	230f      	movs	r3, #15
    101c:	7203      	strb	r3, [r0, #8]
    101e:	2300      	movs	r3, #0
    1020:	7243      	strb	r3, [r0, #9]
    1022:	7283      	strb	r3, [r0, #10]
    1024:	72c3      	strb	r3, [r0, #11]
    1026:	7303      	strb	r3, [r0, #12]
    1028:	7343      	strb	r3, [r0, #13]
    102a:	2301      	movs	r3, #1
    102c:	7383      	strb	r3, [r0, #14]
    102e:	4770      	bx	lr

00001030 <drv_uart_set_config>:
    1030:	b508      	push	{r3, lr}
    1032:	6841      	ldr	r1, [r0, #4]
    1034:	7a03      	ldrb	r3, [r0, #8]
    1036:	fb03 f201 	mul.w	r2, r3, r1
    103a:	490e      	ldr	r1, [pc, #56]	; (1074 <drv_uart_set_config+0x44>)
    103c:	fbb1 f2f2 	udiv	r2, r1, r2
    1040:	0419      	lsls	r1, r3, #16
    1042:	ea41 5102 	orr.w	r1, r1, r2, lsl #20
    1046:	7a43      	ldrb	r3, [r0, #9]
    1048:	ea41 3103 	orr.w	r1, r1, r3, lsl #12
    104c:	7a83      	ldrb	r3, [r0, #10]
    104e:	ea41 21c3 	orr.w	r1, r1, r3, lsl #11
    1052:	7ac3      	ldrb	r3, [r0, #11]
    1054:	ea41 1143 	orr.w	r1, r1, r3, lsl #5
    1058:	7b03      	ldrb	r3, [r0, #12]
    105a:	ea41 1103 	orr.w	r1, r1, r3, lsl #4
    105e:	7b42      	ldrb	r2, [r0, #13]
    1060:	ea41 0182 	orr.w	r1, r1, r2, lsl #2
    1064:	7b82      	ldrb	r2, [r0, #14]
    1066:	4311      	orrs	r1, r2
    1068:	6800      	ldr	r0, [r0, #0]
    106a:	460a      	mov	r2, r1
    106c:	3008      	adds	r0, #8
    106e:	f7ff ffc0 	bl	ff2 <drv_check_rw_data>
    1072:	bd08      	pop	{r3, pc}
    1074:	02625a00 	rsbeq	r5, r2, #0, 20

00001078 <drv_uart_init>:
    1078:	b538      	push	{r3, r4, r5, lr}
    107a:	4604      	mov	r4, r0
    107c:	2500      	movs	r5, #0
    107e:	7485      	strb	r5, [r0, #18]
    1080:	74c5      	strb	r5, [r0, #19]
    1082:	f7ff ffd5 	bl	1030 <drv_uart_set_config>
    1086:	7425      	strb	r5, [r4, #16]
    1088:	74a5      	strb	r5, [r4, #18]
    108a:	74e5      	strb	r5, [r4, #19]
    108c:	6822      	ldr	r2, [r4, #0]
    108e:	6853      	ldr	r3, [r2, #4]
    1090:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    1094:	6053      	str	r3, [r2, #4]
    1096:	6822      	ldr	r2, [r4, #0]
    1098:	6853      	ldr	r3, [r2, #4]
    109a:	f423 7380 	bic.w	r3, r3, #256	; 0x100
    109e:	6053      	str	r3, [r2, #4]
    10a0:	6822      	ldr	r2, [r4, #0]
    10a2:	6853      	ldr	r3, [r2, #4]
    10a4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    10a8:	6053      	str	r3, [r2, #4]
    10aa:	6822      	ldr	r2, [r4, #0]
    10ac:	6853      	ldr	r3, [r2, #4]
    10ae:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    10b2:	6053      	str	r3, [r2, #4]
    10b4:	6822      	ldr	r2, [r4, #0]
    10b6:	6853      	ldr	r3, [r2, #4]
    10b8:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
    10bc:	6053      	str	r3, [r2, #4]
    10be:	6822      	ldr	r2, [r4, #0]
    10c0:	6853      	ldr	r3, [r2, #4]
    10c2:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
    10c6:	6053      	str	r3, [r2, #4]
    10c8:	6822      	ldr	r2, [r4, #0]
    10ca:	6853      	ldr	r3, [r2, #4]
    10cc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    10d0:	6053      	str	r3, [r2, #4]
    10d2:	6822      	ldr	r2, [r4, #0]
    10d4:	6853      	ldr	r3, [r2, #4]
    10d6:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
    10da:	6053      	str	r3, [r2, #4]
    10dc:	6823      	ldr	r3, [r4, #0]
    10de:	f240 12ff 	movw	r2, #511	; 0x1ff
    10e2:	611a      	str	r2, [r3, #16]
    10e4:	6823      	ldr	r3, [r4, #0]
    10e6:	611d      	str	r5, [r3, #16]
    10e8:	6822      	ldr	r2, [r4, #0]
    10ea:	6853      	ldr	r3, [r2, #4]
    10ec:	f043 0301 	orr.w	r3, r3, #1
    10f0:	6053      	str	r3, [r2, #4]
    10f2:	6822      	ldr	r2, [r4, #0]
    10f4:	6853      	ldr	r3, [r2, #4]
    10f6:	f023 0301 	bic.w	r3, r3, #1
    10fa:	6053      	str	r3, [r2, #4]
    10fc:	6822      	ldr	r2, [r4, #0]
    10fe:	6853      	ldr	r3, [r2, #4]
    1100:	f043 0302 	orr.w	r3, r3, #2
    1104:	6053      	str	r3, [r2, #4]
    1106:	bd38      	pop	{r3, r4, r5, pc}

00001108 <drv_uart_putchars>:
    1108:	b410      	push	{r4}
    110a:	2300      	movs	r3, #0
    110c:	7483      	strb	r3, [r0, #18]
    110e:	f890 c012 	ldrb.w	ip, [r0, #18]
    1112:	4594      	cmp	ip, r2
    1114:	d20c      	bcs.n	1130 <drv_uart_putchars+0x28>
    1116:	6804      	ldr	r4, [r0, #0]
    1118:	6963      	ldr	r3, [r4, #20]
    111a:	0a1b      	lsrs	r3, r3, #8
    111c:	f013 0f18 	tst.w	r3, #24
    1120:	d1f5      	bne.n	110e <drv_uart_putchars+0x6>
    1122:	f10c 0301 	add.w	r3, ip, #1
    1126:	7483      	strb	r3, [r0, #18]
    1128:	f811 300c 	ldrb.w	r3, [r1, ip]
    112c:	6023      	str	r3, [r4, #0]
    112e:	e7ee      	b.n	110e <drv_uart_putchars+0x6>
    1130:	6803      	ldr	r3, [r0, #0]
    1132:	699a      	ldr	r2, [r3, #24]
    1134:	f412 7f80 	tst.w	r2, #256	; 0x100
    1138:	d0fa      	beq.n	1130 <drv_uart_putchars+0x28>
    113a:	691a      	ldr	r2, [r3, #16]
    113c:	f442 7280 	orr.w	r2, r2, #256	; 0x100
    1140:	611a      	str	r2, [r3, #16]
    1142:	6803      	ldr	r3, [r0, #0]
    1144:	2200      	movs	r2, #0
    1146:	611a      	str	r2, [r3, #16]
    1148:	bc10      	pop	{r4}
    114a:	4770      	bx	lr

0000114c <drv_uart_getchar_timeout>:
    114c:	2a00      	cmp	r2, #0
    114e:	d059      	beq.n	1204 <drv_uart_getchar_timeout+0xb8>
    1150:	b430      	push	{r4, r5}
    1152:	e00b      	b.n	116c <drv_uart_getchar_timeout+0x20>
    1154:	69db      	ldr	r3, [r3, #28]
    1156:	700b      	strb	r3, [r1, #0]
    1158:	2000      	movs	r0, #0
    115a:	e051      	b.n	1200 <drv_uart_getchar_timeout+0xb4>
    115c:	6803      	ldr	r3, [r0, #0]
    115e:	695c      	ldr	r4, [r3, #20]
    1160:	f014 0f1f 	tst.w	r4, #31
    1164:	d1f6      	bne.n	1154 <drv_uart_getchar_timeout+0x8>
    1166:	3a01      	subs	r2, #1
    1168:	2a00      	cmp	r2, #0
    116a:	d048      	beq.n	11fe <drv_uart_getchar_timeout+0xb2>
    116c:	6803      	ldr	r3, [r0, #0]
    116e:	699d      	ldr	r5, [r3, #24]
    1170:	691c      	ldr	r4, [r3, #16]
    1172:	f044 04c0 	orr.w	r4, r4, #192	; 0xc0
    1176:	611c      	str	r4, [r3, #16]
    1178:	6803      	ldr	r3, [r0, #0]
    117a:	2400      	movs	r4, #0
    117c:	611c      	str	r4, [r3, #16]
    117e:	b2ab      	uxth	r3, r5
    1180:	f015 0f40 	tst.w	r5, #64	; 0x40
    1184:	d001      	beq.n	118a <drv_uart_getchar_timeout+0x3e>
    1186:	2401      	movs	r4, #1
    1188:	7404      	strb	r4, [r0, #16]
    118a:	f013 0f80 	tst.w	r3, #128	; 0x80
    118e:	d001      	beq.n	1194 <drv_uart_getchar_timeout+0x48>
    1190:	2302      	movs	r3, #2
    1192:	7403      	strb	r3, [r0, #16]
    1194:	7c03      	ldrb	r3, [r0, #16]
    1196:	2b00      	cmp	r3, #0
    1198:	d0e0      	beq.n	115c <drv_uart_getchar_timeout+0x10>
    119a:	7a83      	ldrb	r3, [r0, #10]
    119c:	2b01      	cmp	r3, #1
    119e:	d0dd      	beq.n	115c <drv_uart_getchar_timeout+0x10>
    11a0:	2300      	movs	r3, #0
    11a2:	7403      	strb	r3, [r0, #16]
    11a4:	7483      	strb	r3, [r0, #18]
    11a6:	74c3      	strb	r3, [r0, #19]
    11a8:	6804      	ldr	r4, [r0, #0]
    11aa:	6862      	ldr	r2, [r4, #4]
    11ac:	f442 7280 	orr.w	r2, r2, #256	; 0x100
    11b0:	6062      	str	r2, [r4, #4]
    11b2:	6804      	ldr	r4, [r0, #0]
    11b4:	6862      	ldr	r2, [r4, #4]
    11b6:	f422 7280 	bic.w	r2, r2, #256	; 0x100
    11ba:	6062      	str	r2, [r4, #4]
    11bc:	6804      	ldr	r4, [r0, #0]
    11be:	6862      	ldr	r2, [r4, #4]
    11c0:	f442 7200 	orr.w	r2, r2, #512	; 0x200
    11c4:	6062      	str	r2, [r4, #4]
    11c6:	6804      	ldr	r4, [r0, #0]
    11c8:	6862      	ldr	r2, [r4, #4]
    11ca:	f422 7200 	bic.w	r2, r2, #512	; 0x200
    11ce:	6062      	str	r2, [r4, #4]
    11d0:	6804      	ldr	r4, [r0, #0]
    11d2:	6862      	ldr	r2, [r4, #4]
    11d4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
    11d8:	6062      	str	r2, [r4, #4]
    11da:	6804      	ldr	r4, [r0, #0]
    11dc:	6862      	ldr	r2, [r4, #4]
    11de:	f422 6280 	bic.w	r2, r2, #1024	; 0x400
    11e2:	6062      	str	r2, [r4, #4]
    11e4:	6804      	ldr	r4, [r0, #0]
    11e6:	6862      	ldr	r2, [r4, #4]
    11e8:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
    11ec:	6062      	str	r2, [r4, #4]
    11ee:	6800      	ldr	r0, [r0, #0]
    11f0:	6842      	ldr	r2, [r0, #4]
    11f2:	f422 6200 	bic.w	r2, r2, #2048	; 0x800
    11f6:	6042      	str	r2, [r0, #4]
    11f8:	700b      	strb	r3, [r1, #0]
    11fa:	2001      	movs	r0, #1
    11fc:	e000      	b.n	1200 <drv_uart_getchar_timeout+0xb4>
    11fe:	2002      	movs	r0, #2
    1200:	bc30      	pop	{r4, r5}
    1202:	4770      	bx	lr
    1204:	2002      	movs	r0, #2
    1206:	4770      	bx	lr

00001208 <uart_int_tx_done_callback>:
    1208:	4770      	bx	lr

0000120a <uart_int_rx_stop_callback>:
    120a:	4770      	bx	lr

0000120c <uart_int_rx_parity_error_callback>:
    120c:	4770      	bx	lr

0000120e <uart_int_rx_noise_detect_callback>:
    120e:	4770      	bx	lr

00001210 <uart_int_rx_stop_detect_callback>:
    1210:	4770      	bx	lr

00001212 <uart_int_tx_fifo_empty_callback>:
    1212:	4770      	bx	lr

00001214 <uart_int_tx_fifo_thres_callback>:
    1214:	4770      	bx	lr

00001216 <uart_int_rx_fifo_noempty_callback>:
    1216:	4770      	bx	lr

00001218 <uart_int_rx_fifo_thres_callback>:
    1218:	4770      	bx	lr

0000121a <drv_uart_interrupt_handler>:
    121a:	b538      	push	{r3, r4, r5, lr}
    121c:	4604      	mov	r4, r0
    121e:	6803      	ldr	r3, [r0, #0]
    1220:	699d      	ldr	r5, [r3, #24]
    1222:	68db      	ldr	r3, [r3, #12]
    1224:	b29b      	uxth	r3, r3
    1226:	401d      	ands	r5, r3
    1228:	f415 7f80 	tst.w	r5, #256	; 0x100
    122c:	d144      	bne.n	12b8 <drv_uart_interrupt_handler+0x9e>
    122e:	f015 0f40 	tst.w	r5, #64	; 0x40
    1232:	d00f      	beq.n	1254 <drv_uart_interrupt_handler+0x3a>
    1234:	2301      	movs	r3, #1
    1236:	7423      	strb	r3, [r4, #16]
    1238:	7aa3      	ldrb	r3, [r4, #10]
    123a:	2b01      	cmp	r3, #1
    123c:	d147      	bne.n	12ce <drv_uart_interrupt_handler+0xb4>
    123e:	4620      	mov	r0, r4
    1240:	f7ff ffe3 	bl	120a <uart_int_rx_stop_callback>
    1244:	6822      	ldr	r2, [r4, #0]
    1246:	6913      	ldr	r3, [r2, #16]
    1248:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    124c:	6113      	str	r3, [r2, #16]
    124e:	6823      	ldr	r3, [r4, #0]
    1250:	2200      	movs	r2, #0
    1252:	611a      	str	r2, [r3, #16]
    1254:	f015 0f80 	tst.w	r5, #128	; 0x80
    1258:	d00f      	beq.n	127a <drv_uart_interrupt_handler+0x60>
    125a:	2302      	movs	r3, #2
    125c:	7423      	strb	r3, [r4, #16]
    125e:	7aa3      	ldrb	r3, [r4, #10]
    1260:	2b01      	cmp	r3, #1
    1262:	d166      	bne.n	1332 <drv_uart_interrupt_handler+0x118>
    1264:	4620      	mov	r0, r4
    1266:	f7ff ffd1 	bl	120c <uart_int_rx_parity_error_callback>
    126a:	6822      	ldr	r2, [r4, #0]
    126c:	6913      	ldr	r3, [r2, #16]
    126e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1272:	6113      	str	r3, [r2, #16]
    1274:	6823      	ldr	r3, [r4, #0]
    1276:	2200      	movs	r2, #0
    1278:	611a      	str	r2, [r3, #16]
    127a:	f015 0f20 	tst.w	r5, #32
    127e:	f040 808a 	bne.w	1396 <drv_uart_interrupt_handler+0x17c>
    1282:	f015 0f10 	tst.w	r5, #16
    1286:	f040 8092 	bne.w	13ae <drv_uart_interrupt_handler+0x194>
    128a:	f015 0f01 	tst.w	r5, #1
    128e:	f040 809a 	bne.w	13c6 <drv_uart_interrupt_handler+0x1ac>
    1292:	f015 0f02 	tst.w	r5, #2
    1296:	f040 80a2 	bne.w	13de <drv_uart_interrupt_handler+0x1c4>
    129a:	f015 0f04 	tst.w	r5, #4
    129e:	f000 80c1 	beq.w	1424 <drv_uart_interrupt_handler+0x20a>
    12a2:	7ce2      	ldrb	r2, [r4, #19]
    12a4:	7e23      	ldrb	r3, [r4, #24]
    12a6:	429a      	cmp	r2, r3
    12a8:	f0c0 80ac 	bcc.w	1404 <drv_uart_interrupt_handler+0x1ea>
    12ac:	6822      	ldr	r2, [r4, #0]
    12ae:	68d3      	ldr	r3, [r2, #12]
    12b0:	f023 030c 	bic.w	r3, r3, #12
    12b4:	60d3      	str	r3, [r2, #12]
    12b6:	e0aa      	b.n	140e <drv_uart_interrupt_handler+0x1f4>
    12b8:	f7ff ffa6 	bl	1208 <uart_int_tx_done_callback>
    12bc:	6822      	ldr	r2, [r4, #0]
    12be:	6913      	ldr	r3, [r2, #16]
    12c0:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    12c4:	6113      	str	r3, [r2, #16]
    12c6:	6823      	ldr	r3, [r4, #0]
    12c8:	2200      	movs	r2, #0
    12ca:	611a      	str	r2, [r3, #16]
    12cc:	e7af      	b.n	122e <drv_uart_interrupt_handler+0x14>
    12ce:	6822      	ldr	r2, [r4, #0]
    12d0:	68d3      	ldr	r3, [r2, #12]
    12d2:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
    12d6:	60d3      	str	r3, [r2, #12]
    12d8:	2300      	movs	r3, #0
    12da:	7423      	strb	r3, [r4, #16]
    12dc:	74a3      	strb	r3, [r4, #18]
    12de:	74e3      	strb	r3, [r4, #19]
    12e0:	6822      	ldr	r2, [r4, #0]
    12e2:	6853      	ldr	r3, [r2, #4]
    12e4:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    12e8:	6053      	str	r3, [r2, #4]
    12ea:	6822      	ldr	r2, [r4, #0]
    12ec:	6853      	ldr	r3, [r2, #4]
    12ee:	f423 7380 	bic.w	r3, r3, #256	; 0x100
    12f2:	6053      	str	r3, [r2, #4]
    12f4:	6822      	ldr	r2, [r4, #0]
    12f6:	6853      	ldr	r3, [r2, #4]
    12f8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    12fc:	6053      	str	r3, [r2, #4]
    12fe:	6822      	ldr	r2, [r4, #0]
    1300:	6853      	ldr	r3, [r2, #4]
    1302:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1306:	6053      	str	r3, [r2, #4]
    1308:	6822      	ldr	r2, [r4, #0]
    130a:	6853      	ldr	r3, [r2, #4]
    130c:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
    1310:	6053      	str	r3, [r2, #4]
    1312:	6822      	ldr	r2, [r4, #0]
    1314:	6853      	ldr	r3, [r2, #4]
    1316:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
    131a:	6053      	str	r3, [r2, #4]
    131c:	6822      	ldr	r2, [r4, #0]
    131e:	6853      	ldr	r3, [r2, #4]
    1320:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    1324:	6053      	str	r3, [r2, #4]
    1326:	6822      	ldr	r2, [r4, #0]
    1328:	6853      	ldr	r3, [r2, #4]
    132a:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
    132e:	6053      	str	r3, [r2, #4]
    1330:	e785      	b.n	123e <drv_uart_interrupt_handler+0x24>
    1332:	6822      	ldr	r2, [r4, #0]
    1334:	68d3      	ldr	r3, [r2, #12]
    1336:	f023 03cc 	bic.w	r3, r3, #204	; 0xcc
    133a:	60d3      	str	r3, [r2, #12]
    133c:	2300      	movs	r3, #0
    133e:	7423      	strb	r3, [r4, #16]
    1340:	74a3      	strb	r3, [r4, #18]
    1342:	74e3      	strb	r3, [r4, #19]
    1344:	6822      	ldr	r2, [r4, #0]
    1346:	6853      	ldr	r3, [r2, #4]
    1348:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    134c:	6053      	str	r3, [r2, #4]
    134e:	6822      	ldr	r2, [r4, #0]
    1350:	6853      	ldr	r3, [r2, #4]
    1352:	f423 7380 	bic.w	r3, r3, #256	; 0x100
    1356:	6053      	str	r3, [r2, #4]
    1358:	6822      	ldr	r2, [r4, #0]
    135a:	6853      	ldr	r3, [r2, #4]
    135c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1360:	6053      	str	r3, [r2, #4]
    1362:	6822      	ldr	r2, [r4, #0]
    1364:	6853      	ldr	r3, [r2, #4]
    1366:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    136a:	6053      	str	r3, [r2, #4]
    136c:	6822      	ldr	r2, [r4, #0]
    136e:	6853      	ldr	r3, [r2, #4]
    1370:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
    1374:	6053      	str	r3, [r2, #4]
    1376:	6822      	ldr	r2, [r4, #0]
    1378:	6853      	ldr	r3, [r2, #4]
    137a:	f423 6380 	bic.w	r3, r3, #1024	; 0x400
    137e:	6053      	str	r3, [r2, #4]
    1380:	6822      	ldr	r2, [r4, #0]
    1382:	6853      	ldr	r3, [r2, #4]
    1384:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    1388:	6053      	str	r3, [r2, #4]
    138a:	6822      	ldr	r2, [r4, #0]
    138c:	6853      	ldr	r3, [r2, #4]
    138e:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
    1392:	6053      	str	r3, [r2, #4]
    1394:	e766      	b.n	1264 <drv_uart_interrupt_handler+0x4a>
    1396:	4620      	mov	r0, r4
    1398:	f7ff ff39 	bl	120e <uart_int_rx_noise_detect_callback>
    139c:	6822      	ldr	r2, [r4, #0]
    139e:	6913      	ldr	r3, [r2, #16]
    13a0:	f043 0320 	orr.w	r3, r3, #32
    13a4:	6113      	str	r3, [r2, #16]
    13a6:	6823      	ldr	r3, [r4, #0]
    13a8:	2200      	movs	r2, #0
    13aa:	611a      	str	r2, [r3, #16]
    13ac:	e769      	b.n	1282 <drv_uart_interrupt_handler+0x68>
    13ae:	4620      	mov	r0, r4
    13b0:	f7ff ff2e 	bl	1210 <uart_int_rx_stop_detect_callback>
    13b4:	6822      	ldr	r2, [r4, #0]
    13b6:	6913      	ldr	r3, [r2, #16]
    13b8:	f043 0310 	orr.w	r3, r3, #16
    13bc:	6113      	str	r3, [r2, #16]
    13be:	6823      	ldr	r3, [r4, #0]
    13c0:	2200      	movs	r2, #0
    13c2:	611a      	str	r2, [r3, #16]
    13c4:	e761      	b.n	128a <drv_uart_interrupt_handler+0x70>
    13c6:	4620      	mov	r0, r4
    13c8:	f7ff ff24 	bl	1214 <uart_int_tx_fifo_thres_callback>
    13cc:	6822      	ldr	r2, [r4, #0]
    13ce:	6913      	ldr	r3, [r2, #16]
    13d0:	f043 0301 	orr.w	r3, r3, #1
    13d4:	6113      	str	r3, [r2, #16]
    13d6:	6823      	ldr	r3, [r4, #0]
    13d8:	2200      	movs	r2, #0
    13da:	611a      	str	r2, [r3, #16]
    13dc:	e759      	b.n	1292 <drv_uart_interrupt_handler+0x78>
    13de:	4620      	mov	r0, r4
    13e0:	f7ff ff17 	bl	1212 <uart_int_tx_fifo_empty_callback>
    13e4:	6822      	ldr	r2, [r4, #0]
    13e6:	6913      	ldr	r3, [r2, #16]
    13e8:	f043 0302 	orr.w	r3, r3, #2
    13ec:	6113      	str	r3, [r2, #16]
    13ee:	6823      	ldr	r3, [r4, #0]
    13f0:	2200      	movs	r2, #0
    13f2:	611a      	str	r2, [r3, #16]
    13f4:	e751      	b.n	129a <drv_uart_interrupt_handler+0x80>
    13f6:	69d9      	ldr	r1, [r3, #28]
    13f8:	6962      	ldr	r2, [r4, #20]
    13fa:	7ce3      	ldrb	r3, [r4, #19]
    13fc:	1c58      	adds	r0, r3, #1
    13fe:	74e0      	strb	r0, [r4, #19]
    1400:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
    1404:	6823      	ldr	r3, [r4, #0]
    1406:	695a      	ldr	r2, [r3, #20]
    1408:	f012 0f1f 	tst.w	r2, #31
    140c:	d1f3      	bne.n	13f6 <drv_uart_interrupt_handler+0x1dc>
    140e:	4620      	mov	r0, r4
    1410:	f7ff ff02 	bl	1218 <uart_int_rx_fifo_thres_callback>
    1414:	6822      	ldr	r2, [r4, #0]
    1416:	6913      	ldr	r3, [r2, #16]
    1418:	f043 0304 	orr.w	r3, r3, #4
    141c:	6113      	str	r3, [r2, #16]
    141e:	6823      	ldr	r3, [r4, #0]
    1420:	2200      	movs	r2, #0
    1422:	611a      	str	r2, [r3, #16]
    1424:	f015 0f08 	tst.w	r5, #8
    1428:	d020      	beq.n	146c <drv_uart_interrupt_handler+0x252>
    142a:	7ce2      	ldrb	r2, [r4, #19]
    142c:	7e23      	ldrb	r3, [r4, #24]
    142e:	429a      	cmp	r2, r3
    1430:	d30c      	bcc.n	144c <drv_uart_interrupt_handler+0x232>
    1432:	6822      	ldr	r2, [r4, #0]
    1434:	68d3      	ldr	r3, [r2, #12]
    1436:	f023 030c 	bic.w	r3, r3, #12
    143a:	60d3      	str	r3, [r2, #12]
    143c:	e00b      	b.n	1456 <drv_uart_interrupt_handler+0x23c>
    143e:	69d9      	ldr	r1, [r3, #28]
    1440:	6962      	ldr	r2, [r4, #20]
    1442:	7ce3      	ldrb	r3, [r4, #19]
    1444:	1c58      	adds	r0, r3, #1
    1446:	74e0      	strb	r0, [r4, #19]
    1448:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
    144c:	6823      	ldr	r3, [r4, #0]
    144e:	695a      	ldr	r2, [r3, #20]
    1450:	f012 0f1f 	tst.w	r2, #31
    1454:	d1f3      	bne.n	143e <drv_uart_interrupt_handler+0x224>
    1456:	4620      	mov	r0, r4
    1458:	f7ff fedd 	bl	1216 <uart_int_rx_fifo_noempty_callback>
    145c:	6822      	ldr	r2, [r4, #0]
    145e:	6913      	ldr	r3, [r2, #16]
    1460:	f043 0308 	orr.w	r3, r3, #8
    1464:	6113      	str	r3, [r2, #16]
    1466:	6823      	ldr	r3, [r4, #0]
    1468:	2200      	movs	r2, #0
    146a:	611a      	str	r2, [r3, #16]
    146c:	bd38      	pop	{r3, r4, r5, pc}
	...

00001470 <vprintf>:
    1470:	b500      	push	{lr}
    1472:	b0a1      	sub	sp, #132	; 0x84
    1474:	460a      	mov	r2, r1
    1476:	4601      	mov	r1, r0
    1478:	4668      	mov	r0, sp
    147a:	f000 f97f 	bl	177c <vsiprintf>
    147e:	2800      	cmp	r0, #0
    1480:	dc05      	bgt.n	148e <vprintf+0x1e>
    1482:	4668      	mov	r0, sp
    1484:	f000 f95c 	bl	1740 <strlen>
    1488:	b021      	add	sp, #132	; 0x84
    148a:	f85d fb04 	ldr.w	pc, [sp], #4
    148e:	4668      	mov	r0, sp
    1490:	f000 f956 	bl	1740 <strlen>
    1494:	b2c2      	uxtb	r2, r0
    1496:	4669      	mov	r1, sp
    1498:	4801      	ldr	r0, [pc, #4]	; (14a0 <vprintf+0x30>)
    149a:	f7ff fe35 	bl	1108 <drv_uart_putchars>
    149e:	e7f0      	b.n	1482 <vprintf+0x12>
    14a0:	000205c8 	andeq	r0, r2, r8, asr #11

000014a4 <drv_uart_printf>:
    14a4:	b40f      	push	{r0, r1, r2, r3}
    14a6:	b500      	push	{lr}
    14a8:	b083      	sub	sp, #12
    14aa:	a904      	add	r1, sp, #16
    14ac:	f851 0b04 	ldr.w	r0, [r1], #4
    14b0:	9101      	str	r1, [sp, #4]
    14b2:	f7ff ffdd 	bl	1470 <vprintf>
    14b6:	b003      	add	sp, #12
    14b8:	f85d eb04 	ldr.w	lr, [sp], #4
    14bc:	b004      	add	sp, #16
    14be:	4770      	bx	lr

000014c0 <NMI_Handler>:
    14c0:	b508      	push	{r3, lr}
    14c2:	4802      	ldr	r0, [pc, #8]	; (14cc <NMI_Handler+0xc>)
    14c4:	f000 f924 	bl	1710 <test_printf_s>
    14c8:	bd08      	pop	{r3, pc}
    14ca:	bf00      	nop
    14cc:	000020a4 	andeq	r2, r0, r4, lsr #1

000014d0 <HardFault_Handler>:
    14d0:	e7fe      	b.n	14d0 <HardFault_Handler>

000014d2 <MemManage_Handler>:
    14d2:	e7fe      	b.n	14d2 <MemManage_Handler>

000014d4 <BusFault_Handler>:
    14d4:	e7fe      	b.n	14d4 <BusFault_Handler>

000014d6 <UsageFault_Handler>:
    14d6:	e7fe      	b.n	14d6 <UsageFault_Handler>

000014d8 <SVC_Handler>:
    14d8:	4770      	bx	lr

000014da <DebugMon_Handler>:
    14da:	4770      	bx	lr

000014dc <PendSV_Handler>:
    14dc:	4770      	bx	lr

000014de <SysTick_Handler>:
    14de:	4770      	bx	lr

000014e0 <Uart0_Handler>:
    14e0:	b508      	push	{r3, lr}
    14e2:	4b04      	ldr	r3, [pc, #16]	; (14f4 <Uart0_Handler+0x14>)
    14e4:	2201      	movs	r2, #1
    14e6:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    14ea:	4803      	ldr	r0, [pc, #12]	; (14f8 <Uart0_Handler+0x18>)
    14ec:	f7ff fe95 	bl	121a <drv_uart_interrupt_handler>
    14f0:	bd08      	pop	{r3, pc}
    14f2:	bf00      	nop
    14f4:	e000e100 	and	lr, r0, r0, lsl #2
    14f8:	000205c8 	andeq	r0, r2, r8, asr #11

000014fc <AdvtimGen_Handler>:
    14fc:	b508      	push	{r3, lr}
    14fe:	4b04      	ldr	r3, [pc, #16]	; (1510 <AdvtimGen_Handler+0x14>)
    1500:	f44f 3280 	mov.w	r2, #65536	; 0x10000
    1504:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    1508:	4802      	ldr	r0, [pc, #8]	; (1514 <AdvtimGen_Handler+0x18>)
    150a:	f7ff fd3e 	bl	f8a <drv_advtim_gen_interrupt_handler>
    150e:	bd08      	pop	{r3, pc}
    1510:	e000e100 	and	lr, r0, r0, lsl #2
    1514:	00020550 	andeq	r0, r2, r0, asr r5

00001518 <AdvtimCap_Handler>:
    1518:	b508      	push	{r3, lr}
    151a:	4b04      	ldr	r3, [pc, #16]	; (152c <AdvtimCap_Handler+0x14>)
    151c:	f44f 3200 	mov.w	r2, #131072	; 0x20000
    1520:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    1524:	4802      	ldr	r0, [pc, #8]	; (1530 <AdvtimCap_Handler+0x18>)
    1526:	f7ff fb23 	bl	b70 <drv_advtim_cap_interrupt_handler>
    152a:	bd08      	pop	{r3, pc}
    152c:	e000e100 	and	lr, r0, r0, lsl #2
    1530:	00020550 	andeq	r0, r2, r0, asr r5

00001534 <AdvtimEnc_Handler>:
    1534:	b508      	push	{r3, lr}
    1536:	4b04      	ldr	r3, [pc, #16]	; (1548 <AdvtimEnc_Handler+0x14>)
    1538:	f44f 2280 	mov.w	r2, #262144	; 0x40000
    153c:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    1540:	4802      	ldr	r0, [pc, #8]	; (154c <AdvtimEnc_Handler+0x18>)
    1542:	f7ff fb97 	bl	c74 <drv_advtim_enc_interrupt_handler>
    1546:	bd08      	pop	{r3, pc}
    1548:	e000e100 	and	lr, r0, r0, lsl #2
    154c:	00020550 	andeq	r0, r2, r0, asr r5

00001550 <show_testmenu>:
    1550:	b570      	push	{r4, r5, r6, lr}
    1552:	4605      	mov	r5, r0
    1554:	460e      	mov	r6, r1
    1556:	480b      	ldr	r0, [pc, #44]	; (1584 <show_testmenu+0x34>)
    1558:	f7ff ffa4 	bl	14a4 <drv_uart_printf>
    155c:	2400      	movs	r4, #0
    155e:	e00b      	b.n	1578 <show_testmenu+0x28>
    1560:	eb04 1304 	add.w	r3, r4, r4, lsl #4
    1564:	eb05 02c3 	add.w	r2, r5, r3, lsl #3
    1568:	3208      	adds	r2, #8
    156a:	f815 1033 	ldrb.w	r1, [r5, r3, lsl #3]
    156e:	4806      	ldr	r0, [pc, #24]	; (1588 <show_testmenu+0x38>)
    1570:	f7ff ff98 	bl	14a4 <drv_uart_printf>
    1574:	3401      	adds	r4, #1
    1576:	b2e4      	uxtb	r4, r4
    1578:	42b4      	cmp	r4, r6
    157a:	d3f1      	bcc.n	1560 <show_testmenu+0x10>
    157c:	4803      	ldr	r0, [pc, #12]	; (158c <show_testmenu+0x3c>)
    157e:	f7ff ff91 	bl	14a4 <drv_uart_printf>
    1582:	bd70      	pop	{r4, r5, r6, pc}
    1584:	000020a8 	andeq	r2, r0, r8, lsr #1
    1588:	000020c4 	andeq	r2, r0, r4, asr #1
    158c:	000020cc 	andeq	r2, r0, ip, asr #1

00001590 <test_execute>:
    1590:	b5f0      	push	{r4, r5, r6, r7, lr}
    1592:	b083      	sub	sp, #12
    1594:	4605      	mov	r5, r0
    1596:	460e      	mov	r6, r1
    1598:	e013      	b.n	15c2 <test_execute+0x32>
    159a:	481b      	ldr	r0, [pc, #108]	; (1608 <test_execute+0x78>)
    159c:	f7ff ff82 	bl	14a4 <drv_uart_printf>
    15a0:	b003      	add	sp, #12
    15a2:	bdf0      	pop	{r4, r5, r6, r7, pc}
    15a4:	f107 0408 	add.w	r4, r7, #8
    15a8:	4621      	mov	r1, r4
    15aa:	4818      	ldr	r0, [pc, #96]	; (160c <test_execute+0x7c>)
    15ac:	f7ff ff7a 	bl	14a4 <drv_uart_printf>
    15b0:	687b      	ldr	r3, [r7, #4]
    15b2:	4798      	blx	r3
    15b4:	4621      	mov	r1, r4
    15b6:	4816      	ldr	r0, [pc, #88]	; (1610 <test_execute+0x80>)
    15b8:	f7ff ff74 	bl	14a4 <drv_uart_printf>
    15bc:	4815      	ldr	r0, [pc, #84]	; (1614 <test_execute+0x84>)
    15be:	f7ff ff71 	bl	14a4 <drv_uart_printf>
    15c2:	2300      	movs	r3, #0
    15c4:	f88d 3007 	strb.w	r3, [sp, #7]
    15c8:	4a13      	ldr	r2, [pc, #76]	; (1618 <test_execute+0x88>)
    15ca:	f10d 0107 	add.w	r1, sp, #7
    15ce:	4813      	ldr	r0, [pc, #76]	; (161c <test_execute+0x8c>)
    15d0:	f7ff fdbc 	bl	114c <drv_uart_getchar_timeout>
    15d4:	4604      	mov	r4, r0
    15d6:	2800      	cmp	r0, #0
    15d8:	d1f3      	bne.n	15c2 <test_execute+0x32>
    15da:	f89d 1007 	ldrb.w	r1, [sp, #7]
    15de:	4810      	ldr	r0, [pc, #64]	; (1620 <test_execute+0x90>)
    15e0:	f7ff ff60 	bl	14a4 <drv_uart_printf>
    15e4:	f89d 2007 	ldrb.w	r2, [sp, #7]
    15e8:	2a51      	cmp	r2, #81	; 0x51
    15ea:	d0d6      	beq.n	159a <test_execute+0xa>
    15ec:	42b4      	cmp	r4, r6
    15ee:	d2e5      	bcs.n	15bc <test_execute+0x2c>
    15f0:	eb04 1304 	add.w	r3, r4, r4, lsl #4
    15f4:	eb05 07c3 	add.w	r7, r5, r3, lsl #3
    15f8:	f815 3033 	ldrb.w	r3, [r5, r3, lsl #3]
    15fc:	429a      	cmp	r2, r3
    15fe:	d0d1      	beq.n	15a4 <test_execute+0x14>
    1600:	3401      	adds	r4, #1
    1602:	b2e4      	uxtb	r4, r4
    1604:	e7f2      	b.n	15ec <test_execute+0x5c>
    1606:	bf00      	nop
    1608:	0000210c 	andeq	r2, r0, ip, lsl #2
    160c:	00002124 	andeq	r2, r0, r4, lsr #2
    1610:	00002134 	andeq	r2, r0, r4, lsr r1
    1614:	00002144 	andeq	r2, r0, r4, asr #2
    1618:	0003d090 	muleq	r3, r0, r0
    161c:	000205c8 	andeq	r0, r2, r8, asr #11
    1620:	000020fc 	strdeq	r2, [r0], -ip

00001624 <mcu_testmenu>:
    1624:	b510      	push	{r4, lr}
    1626:	4c05      	ldr	r4, [pc, #20]	; (163c <mcu_testmenu+0x18>)
    1628:	2102      	movs	r1, #2
    162a:	4620      	mov	r0, r4
    162c:	f7ff ff90 	bl	1550 <show_testmenu>
    1630:	2102      	movs	r1, #2
    1632:	4620      	mov	r0, r4
    1634:	f7ff ffac 	bl	1590 <test_execute>
    1638:	bd10      	pop	{r4, pc}
    163a:	bf00      	nop
    163c:	000203b8 			; <UNDEFINED> instruction: 0x000203b8

00001640 <main>:
    1640:	b508      	push	{r3, lr}
    1642:	f000 f855 	bl	16f0 <uart0_init>
    1646:	f7ff ffed 	bl	1624 <mcu_testmenu>
    164a:	e7fc      	b.n	1646 <main+0x6>

0000164c <exit_current_test_loop>:
    164c:	b500      	push	{lr}
    164e:	b083      	sub	sp, #12
    1650:	4a07      	ldr	r2, [pc, #28]	; (1670 <exit_current_test_loop+0x24>)
    1652:	f10d 0107 	add.w	r1, sp, #7
    1656:	4807      	ldr	r0, [pc, #28]	; (1674 <exit_current_test_loop+0x28>)
    1658:	f7ff fd78 	bl	114c <drv_uart_getchar_timeout>
    165c:	2800      	cmp	r0, #0
    165e:	d1f7      	bne.n	1650 <exit_current_test_loop+0x4>
    1660:	f89d 3007 	ldrb.w	r3, [sp, #7]
    1664:	2b51      	cmp	r3, #81	; 0x51
    1666:	d1f3      	bne.n	1650 <exit_current_test_loop+0x4>
    1668:	b003      	add	sp, #12
    166a:	f85d fb04 	ldr.w	pc, [sp], #4
    166e:	bf00      	nop
    1670:	0003d090 	muleq	r3, r0, r0
    1674:	000205c8 	andeq	r0, r2, r8, asr #11

00001678 <Reset_Handler>:
    1678:	490a      	ldr	r1, [pc, #40]	; (16a4 <Reset_Handler+0x2c>)
    167a:	4a0b      	ldr	r2, [pc, #44]	; (16a8 <Reset_Handler+0x30>)
    167c:	4b0b      	ldr	r3, [pc, #44]	; (16ac <Reset_Handler+0x34>)
    167e:	1a9b      	subs	r3, r3, r2
    1680:	dd03      	ble.n	168a <Reset_Handler+0x12>
    1682:	3b04      	subs	r3, #4
    1684:	58c8      	ldr	r0, [r1, r3]
    1686:	50d0      	str	r0, [r2, r3]
    1688:	dcfb      	bgt.n	1682 <Reset_Handler+0xa>
    168a:	4909      	ldr	r1, [pc, #36]	; (16b0 <Reset_Handler+0x38>)
    168c:	4a09      	ldr	r2, [pc, #36]	; (16b4 <Reset_Handler+0x3c>)
    168e:	2000      	movs	r0, #0
    1690:	4291      	cmp	r1, r2
    1692:	bfbc      	itt	lt
    1694:	f841 0b04 	strlt.w	r0, [r1], #4
    1698:	e7fa      	blt.n	1690 <Reset_Handler+0x18>
    169a:	f7ff ffd1 	bl	1640 <main>
    169e:	f000 f83b 	bl	1718 <exit>
    16a2:	21940000 	orrscs	r0, r4, r0
    16a6:	00000000 	andeq	r0, r0, r0
    16aa:	05340002 	ldreq	r0, [r4, #-2]!
    16ae:	05340002 	ldreq	r0, [r4, #-2]!
    16b2:	05f80002 	ldrbeq	r0, [r8, #2]!
    16b6:	e7fe0002 	ldrb	r0, [lr, r2]!
    16ba:	e7fe      	b.n	16ba <Reset_Handler+0x42>
    16bc:	e7fe      	b.n	16bc <Reset_Handler+0x44>
    16be:	e7fe      	b.n	16be <Reset_Handler+0x46>
    16c0:	e7fe      	b.n	16c0 <Reset_Handler+0x48>
    16c2:	e7fe      	b.n	16c2 <Reset_Handler+0x4a>
    16c4:	e7fe      	b.n	16c4 <Reset_Handler+0x4c>
    16c6:	e7fe      	b.n	16c6 <Reset_Handler+0x4e>
    16c8:	e7fe      	b.n	16c8 <Reset_Handler+0x50>
    16ca:	e7fe      	b.n	16ca <Reset_Handler+0x52>

000016cc <Uart1_Handler>:
    16cc:	e7fe      	b.n	16cc <Uart1_Handler>

000016ce <Resv2_Handler>:
    16ce:	e7fe      	b.n	16ce <Resv2_Handler>

000016d0 <Resv3_Handler>:
    16d0:	e7fe      	b.n	16d0 <Resv3_Handler>

000016d2 <EthDma_Handler>:
    16d2:	e7fe      	b.n	16d2 <EthDma_Handler>

000016d4 <Gpioa_Handler>:
    16d4:	e7fe      	b.n	16d4 <Gpioa_Handler>

000016d6 <Resv6_Handler>:
    16d6:	e7fe      	b.n	16d6 <Resv6_Handler>

000016d8 <Resv7_Handler>:
    16d8:	e7fe      	b.n	16d8 <Resv7_Handler>

000016da <Bastim_Ch0_Handler>:
    16da:	e7fe      	b.n	16da <Bastim_Ch0_Handler>

000016dc <Bastim_Ch1_Handler>:
    16dc:	e7fe      	b.n	16dc <Bastim_Ch1_Handler>

000016de <Bastim_Ch2_Handler>:
    16de:	e7fe      	b.n	16de <Bastim_Ch2_Handler>

000016e0 <Bastim_Ch3_Handler>:
    16e0:	e7fe      	b.n	16e0 <Bastim_Ch3_Handler>

000016e2 <EthSma_Handler>:
    16e2:	e7fe      	b.n	16e2 <EthSma_Handler>

000016e4 <EthTx_Handler>:
    16e4:	e7fe      	b.n	16e4 <EthTx_Handler>

000016e6 <EthRx_Handler>:
    16e6:	e7fe      	b.n	16e6 <EthRx_Handler>

000016e8 <Resv15_Handler>:
    16e8:	e7fe      	b.n	16e8 <Resv15_Handler>
    16ea:	e7fe      	b.n	16ea <Resv15_Handler+0x2>
    16ec:	e7fe      	b.n	16ec <Resv15_Handler+0x4>
    16ee:	e7fe      	b.n	16ee <Resv15_Handler+0x6>

000016f0 <uart0_init>:
    16f0:	b510      	push	{r4, lr}
    16f2:	4c05      	ldr	r4, [pc, #20]	; (1708 <uart0_init+0x18>)
    16f4:	4b05      	ldr	r3, [pc, #20]	; (170c <uart0_init+0x1c>)
    16f6:	6023      	str	r3, [r4, #0]
    16f8:	4620      	mov	r0, r4
    16fa:	f7ff fc8b 	bl	1014 <drv_uart_default_config>
    16fe:	4620      	mov	r0, r4
    1700:	f7ff fcba 	bl	1078 <drv_uart_init>
    1704:	bd10      	pop	{r4, pc}
    1706:	bf00      	nop
    1708:	000205c8 	andeq	r0, r2, r8, asr #11
    170c:	40001000 	andmi	r1, r0, r0

00001710 <test_printf_s>:
    1710:	b508      	push	{r3, lr}
    1712:	f7ff fec7 	bl	14a4 <drv_uart_printf>
    1716:	bd08      	pop	{r3, pc}

00001718 <exit>:
    1718:	b508      	push	{r3, lr}
    171a:	4b07      	ldr	r3, [pc, #28]	; (1738 <exit+0x20>)
    171c:	4604      	mov	r4, r0
    171e:	b113      	cbz	r3, 1726 <exit+0xe>
    1720:	2100      	movs	r1, #0
    1722:	f3af 8000 	nop.w
    1726:	4b05      	ldr	r3, [pc, #20]	; (173c <exit+0x24>)
    1728:	6818      	ldr	r0, [r3, #0]
    172a:	6a83      	ldr	r3, [r0, #40]	; 0x28
    172c:	b103      	cbz	r3, 1730 <exit+0x18>
    172e:	4798      	blx	r3
    1730:	4620      	mov	r0, r4
    1732:	f000 fc95 	bl	2060 <_exit>
    1736:	bf00      	nop
    1738:	00000000 	andeq	r0, r0, r0
    173c:	00002158 	andeq	r2, r0, r8, asr r1

00001740 <strlen>:
    1740:	4603      	mov	r3, r0
    1742:	f813 2b01 	ldrb.w	r2, [r3], #1
    1746:	2a00      	cmp	r2, #0
    1748:	d1fb      	bne.n	1742 <strlen+0x2>
    174a:	1a18      	subs	r0, r3, r0
    174c:	3801      	subs	r0, #1
    174e:	4770      	bx	lr

00001750 <_vsiprintf_r>:
    1750:	b500      	push	{lr}
    1752:	b09b      	sub	sp, #108	; 0x6c
    1754:	9100      	str	r1, [sp, #0]
    1756:	9104      	str	r1, [sp, #16]
    1758:	f06f 4100 	mvn.w	r1, #2147483648	; 0x80000000
    175c:	9105      	str	r1, [sp, #20]
    175e:	9102      	str	r1, [sp, #8]
    1760:	4905      	ldr	r1, [pc, #20]	; (1778 <_vsiprintf_r+0x28>)
    1762:	9103      	str	r1, [sp, #12]
    1764:	4669      	mov	r1, sp
    1766:	f000 f86f 	bl	1848 <_svfiprintf_r>
    176a:	2200      	movs	r2, #0
    176c:	9b00      	ldr	r3, [sp, #0]
    176e:	701a      	strb	r2, [r3, #0]
    1770:	b01b      	add	sp, #108	; 0x6c
    1772:	f85d fb04 	ldr.w	pc, [sp], #4
    1776:	bf00      	nop
    1778:	ffff0208 			; <UNDEFINED> instruction: 0xffff0208

0000177c <vsiprintf>:
    177c:	4613      	mov	r3, r2
    177e:	460a      	mov	r2, r1
    1780:	4601      	mov	r1, r0
    1782:	4802      	ldr	r0, [pc, #8]	; (178c <vsiprintf+0x10>)
    1784:	6800      	ldr	r0, [r0, #0]
    1786:	f7ff bfe3 	b.w	1750 <_vsiprintf_r>
    178a:	bf00      	nop
    178c:	000204c8 	andeq	r0, r2, r8, asr #9

00001790 <__ssputs_r>:
    1790:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1794:	688e      	ldr	r6, [r1, #8]
    1796:	4682      	mov	sl, r0
    1798:	429e      	cmp	r6, r3
    179a:	460c      	mov	r4, r1
    179c:	4690      	mov	r8, r2
    179e:	461f      	mov	r7, r3
    17a0:	d838      	bhi.n	1814 <__ssputs_r+0x84>
    17a2:	898a      	ldrh	r2, [r1, #12]
    17a4:	f412 6f90 	tst.w	r2, #1152	; 0x480
    17a8:	d032      	beq.n	1810 <__ssputs_r+0x80>
    17aa:	6825      	ldr	r5, [r4, #0]
    17ac:	6909      	ldr	r1, [r1, #16]
    17ae:	3301      	adds	r3, #1
    17b0:	eba5 0901 	sub.w	r9, r5, r1
    17b4:	6965      	ldr	r5, [r4, #20]
    17b6:	444b      	add	r3, r9
    17b8:	eb05 0545 	add.w	r5, r5, r5, lsl #1
    17bc:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
    17c0:	106d      	asrs	r5, r5, #1
    17c2:	429d      	cmp	r5, r3
    17c4:	bf38      	it	cc
    17c6:	461d      	movcc	r5, r3
    17c8:	0553      	lsls	r3, r2, #21
    17ca:	d531      	bpl.n	1830 <__ssputs_r+0xa0>
    17cc:	4629      	mov	r1, r5
    17ce:	f000 fb6f 	bl	1eb0 <_malloc_r>
    17d2:	4606      	mov	r6, r0
    17d4:	b950      	cbnz	r0, 17ec <__ssputs_r+0x5c>
    17d6:	230c      	movs	r3, #12
    17d8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    17dc:	f8ca 3000 	str.w	r3, [sl]
    17e0:	89a3      	ldrh	r3, [r4, #12]
    17e2:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    17e6:	81a3      	strh	r3, [r4, #12]
    17e8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    17ec:	464a      	mov	r2, r9
    17ee:	6921      	ldr	r1, [r4, #16]
    17f0:	f000 face 	bl	1d90 <memcpy>
    17f4:	89a3      	ldrh	r3, [r4, #12]
    17f6:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
    17fa:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    17fe:	81a3      	strh	r3, [r4, #12]
    1800:	6126      	str	r6, [r4, #16]
    1802:	444e      	add	r6, r9
    1804:	6026      	str	r6, [r4, #0]
    1806:	463e      	mov	r6, r7
    1808:	6165      	str	r5, [r4, #20]
    180a:	eba5 0509 	sub.w	r5, r5, r9
    180e:	60a5      	str	r5, [r4, #8]
    1810:	42be      	cmp	r6, r7
    1812:	d900      	bls.n	1816 <__ssputs_r+0x86>
    1814:	463e      	mov	r6, r7
    1816:	4632      	mov	r2, r6
    1818:	4641      	mov	r1, r8
    181a:	6820      	ldr	r0, [r4, #0]
    181c:	f000 fac6 	bl	1dac <memmove>
    1820:	68a3      	ldr	r3, [r4, #8]
    1822:	2000      	movs	r0, #0
    1824:	1b9b      	subs	r3, r3, r6
    1826:	60a3      	str	r3, [r4, #8]
    1828:	6823      	ldr	r3, [r4, #0]
    182a:	4433      	add	r3, r6
    182c:	6023      	str	r3, [r4, #0]
    182e:	e7db      	b.n	17e8 <__ssputs_r+0x58>
    1830:	462a      	mov	r2, r5
    1832:	f000 fbb1 	bl	1f98 <_realloc_r>
    1836:	4606      	mov	r6, r0
    1838:	2800      	cmp	r0, #0
    183a:	d1e1      	bne.n	1800 <__ssputs_r+0x70>
    183c:	4650      	mov	r0, sl
    183e:	6921      	ldr	r1, [r4, #16]
    1840:	f000 face 	bl	1de0 <_free_r>
    1844:	e7c7      	b.n	17d6 <__ssputs_r+0x46>
	...

00001848 <_svfiprintf_r>:
    1848:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    184c:	4698      	mov	r8, r3
    184e:	898b      	ldrh	r3, [r1, #12]
    1850:	4607      	mov	r7, r0
    1852:	061b      	lsls	r3, r3, #24
    1854:	460d      	mov	r5, r1
    1856:	4614      	mov	r4, r2
    1858:	b09d      	sub	sp, #116	; 0x74
    185a:	d50e      	bpl.n	187a <_svfiprintf_r+0x32>
    185c:	690b      	ldr	r3, [r1, #16]
    185e:	b963      	cbnz	r3, 187a <_svfiprintf_r+0x32>
    1860:	2140      	movs	r1, #64	; 0x40
    1862:	f000 fb25 	bl	1eb0 <_malloc_r>
    1866:	6028      	str	r0, [r5, #0]
    1868:	6128      	str	r0, [r5, #16]
    186a:	b920      	cbnz	r0, 1876 <_svfiprintf_r+0x2e>
    186c:	230c      	movs	r3, #12
    186e:	603b      	str	r3, [r7, #0]
    1870:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1874:	e0d1      	b.n	1a1a <_svfiprintf_r+0x1d2>
    1876:	2340      	movs	r3, #64	; 0x40
    1878:	616b      	str	r3, [r5, #20]
    187a:	2300      	movs	r3, #0
    187c:	9309      	str	r3, [sp, #36]	; 0x24
    187e:	2320      	movs	r3, #32
    1880:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
    1884:	2330      	movs	r3, #48	; 0x30
    1886:	f04f 0901 	mov.w	r9, #1
    188a:	f8cd 800c 	str.w	r8, [sp, #12]
    188e:	f8df 81a4 	ldr.w	r8, [pc, #420]	; 1a34 <_svfiprintf_r+0x1ec>
    1892:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
    1896:	4623      	mov	r3, r4
    1898:	469a      	mov	sl, r3
    189a:	f813 2b01 	ldrb.w	r2, [r3], #1
    189e:	b10a      	cbz	r2, 18a4 <_svfiprintf_r+0x5c>
    18a0:	2a25      	cmp	r2, #37	; 0x25
    18a2:	d1f9      	bne.n	1898 <_svfiprintf_r+0x50>
    18a4:	ebba 0b04 	subs.w	fp, sl, r4
    18a8:	d00b      	beq.n	18c2 <_svfiprintf_r+0x7a>
    18aa:	465b      	mov	r3, fp
    18ac:	4622      	mov	r2, r4
    18ae:	4629      	mov	r1, r5
    18b0:	4638      	mov	r0, r7
    18b2:	f7ff ff6d 	bl	1790 <__ssputs_r>
    18b6:	3001      	adds	r0, #1
    18b8:	f000 80aa 	beq.w	1a10 <_svfiprintf_r+0x1c8>
    18bc:	9a09      	ldr	r2, [sp, #36]	; 0x24
    18be:	445a      	add	r2, fp
    18c0:	9209      	str	r2, [sp, #36]	; 0x24
    18c2:	f89a 3000 	ldrb.w	r3, [sl]
    18c6:	2b00      	cmp	r3, #0
    18c8:	f000 80a2 	beq.w	1a10 <_svfiprintf_r+0x1c8>
    18cc:	2300      	movs	r3, #0
    18ce:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    18d2:	e9cd 2305 	strd	r2, r3, [sp, #20]
    18d6:	f10a 0a01 	add.w	sl, sl, #1
    18da:	9304      	str	r3, [sp, #16]
    18dc:	9307      	str	r3, [sp, #28]
    18de:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
    18e2:	931a      	str	r3, [sp, #104]	; 0x68
    18e4:	4654      	mov	r4, sl
    18e6:	2205      	movs	r2, #5
    18e8:	f814 1b01 	ldrb.w	r1, [r4], #1
    18ec:	4851      	ldr	r0, [pc, #324]	; (1a34 <_svfiprintf_r+0x1ec>)
    18ee:	f000 fa41 	bl	1d74 <memchr>
    18f2:	9a04      	ldr	r2, [sp, #16]
    18f4:	b9d8      	cbnz	r0, 192e <_svfiprintf_r+0xe6>
    18f6:	06d0      	lsls	r0, r2, #27
    18f8:	bf44      	itt	mi
    18fa:	2320      	movmi	r3, #32
    18fc:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    1900:	0711      	lsls	r1, r2, #28
    1902:	bf44      	itt	mi
    1904:	232b      	movmi	r3, #43	; 0x2b
    1906:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    190a:	f89a 3000 	ldrb.w	r3, [sl]
    190e:	2b2a      	cmp	r3, #42	; 0x2a
    1910:	d015      	beq.n	193e <_svfiprintf_r+0xf6>
    1912:	4654      	mov	r4, sl
    1914:	2000      	movs	r0, #0
    1916:	f04f 0c0a 	mov.w	ip, #10
    191a:	9a07      	ldr	r2, [sp, #28]
    191c:	4621      	mov	r1, r4
    191e:	f811 3b01 	ldrb.w	r3, [r1], #1
    1922:	3b30      	subs	r3, #48	; 0x30
    1924:	2b09      	cmp	r3, #9
    1926:	d94e      	bls.n	19c6 <_svfiprintf_r+0x17e>
    1928:	b1b0      	cbz	r0, 1958 <_svfiprintf_r+0x110>
    192a:	9207      	str	r2, [sp, #28]
    192c:	e014      	b.n	1958 <_svfiprintf_r+0x110>
    192e:	eba0 0308 	sub.w	r3, r0, r8
    1932:	fa09 f303 	lsl.w	r3, r9, r3
    1936:	4313      	orrs	r3, r2
    1938:	46a2      	mov	sl, r4
    193a:	9304      	str	r3, [sp, #16]
    193c:	e7d2      	b.n	18e4 <_svfiprintf_r+0x9c>
    193e:	9b03      	ldr	r3, [sp, #12]
    1940:	1d19      	adds	r1, r3, #4
    1942:	681b      	ldr	r3, [r3, #0]
    1944:	9103      	str	r1, [sp, #12]
    1946:	2b00      	cmp	r3, #0
    1948:	bfbb      	ittet	lt
    194a:	425b      	neglt	r3, r3
    194c:	f042 0202 	orrlt.w	r2, r2, #2
    1950:	9307      	strge	r3, [sp, #28]
    1952:	9307      	strlt	r3, [sp, #28]
    1954:	bfb8      	it	lt
    1956:	9204      	strlt	r2, [sp, #16]
    1958:	7823      	ldrb	r3, [r4, #0]
    195a:	2b2e      	cmp	r3, #46	; 0x2e
    195c:	d10c      	bne.n	1978 <_svfiprintf_r+0x130>
    195e:	7863      	ldrb	r3, [r4, #1]
    1960:	2b2a      	cmp	r3, #42	; 0x2a
    1962:	d135      	bne.n	19d0 <_svfiprintf_r+0x188>
    1964:	9b03      	ldr	r3, [sp, #12]
    1966:	3402      	adds	r4, #2
    1968:	1d1a      	adds	r2, r3, #4
    196a:	681b      	ldr	r3, [r3, #0]
    196c:	9203      	str	r2, [sp, #12]
    196e:	2b00      	cmp	r3, #0
    1970:	bfb8      	it	lt
    1972:	f04f 33ff 	movlt.w	r3, #4294967295	; 0xffffffff
    1976:	9305      	str	r3, [sp, #20]
    1978:	f8df a0bc 	ldr.w	sl, [pc, #188]	; 1a38 <_svfiprintf_r+0x1f0>
    197c:	2203      	movs	r2, #3
    197e:	4650      	mov	r0, sl
    1980:	7821      	ldrb	r1, [r4, #0]
    1982:	f000 f9f7 	bl	1d74 <memchr>
    1986:	b140      	cbz	r0, 199a <_svfiprintf_r+0x152>
    1988:	2340      	movs	r3, #64	; 0x40
    198a:	eba0 000a 	sub.w	r0, r0, sl
    198e:	fa03 f000 	lsl.w	r0, r3, r0
    1992:	9b04      	ldr	r3, [sp, #16]
    1994:	3401      	adds	r4, #1
    1996:	4303      	orrs	r3, r0
    1998:	9304      	str	r3, [sp, #16]
    199a:	f814 1b01 	ldrb.w	r1, [r4], #1
    199e:	2206      	movs	r2, #6
    19a0:	4826      	ldr	r0, [pc, #152]	; (1a3c <_svfiprintf_r+0x1f4>)
    19a2:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
    19a6:	f000 f9e5 	bl	1d74 <memchr>
    19aa:	2800      	cmp	r0, #0
    19ac:	d038      	beq.n	1a20 <_svfiprintf_r+0x1d8>
    19ae:	4b24      	ldr	r3, [pc, #144]	; (1a40 <_svfiprintf_r+0x1f8>)
    19b0:	bb1b      	cbnz	r3, 19fa <_svfiprintf_r+0x1b2>
    19b2:	9b03      	ldr	r3, [sp, #12]
    19b4:	3307      	adds	r3, #7
    19b6:	f023 0307 	bic.w	r3, r3, #7
    19ba:	3308      	adds	r3, #8
    19bc:	9303      	str	r3, [sp, #12]
    19be:	9b09      	ldr	r3, [sp, #36]	; 0x24
    19c0:	4433      	add	r3, r6
    19c2:	9309      	str	r3, [sp, #36]	; 0x24
    19c4:	e767      	b.n	1896 <_svfiprintf_r+0x4e>
    19c6:	460c      	mov	r4, r1
    19c8:	2001      	movs	r0, #1
    19ca:	fb0c 3202 	mla	r2, ip, r2, r3
    19ce:	e7a5      	b.n	191c <_svfiprintf_r+0xd4>
    19d0:	2300      	movs	r3, #0
    19d2:	f04f 0c0a 	mov.w	ip, #10
    19d6:	4619      	mov	r1, r3
    19d8:	3401      	adds	r4, #1
    19da:	9305      	str	r3, [sp, #20]
    19dc:	4620      	mov	r0, r4
    19de:	f810 2b01 	ldrb.w	r2, [r0], #1
    19e2:	3a30      	subs	r2, #48	; 0x30
    19e4:	2a09      	cmp	r2, #9
    19e6:	d903      	bls.n	19f0 <_svfiprintf_r+0x1a8>
    19e8:	2b00      	cmp	r3, #0
    19ea:	d0c5      	beq.n	1978 <_svfiprintf_r+0x130>
    19ec:	9105      	str	r1, [sp, #20]
    19ee:	e7c3      	b.n	1978 <_svfiprintf_r+0x130>
    19f0:	4604      	mov	r4, r0
    19f2:	2301      	movs	r3, #1
    19f4:	fb0c 2101 	mla	r1, ip, r1, r2
    19f8:	e7f0      	b.n	19dc <_svfiprintf_r+0x194>
    19fa:	ab03      	add	r3, sp, #12
    19fc:	9300      	str	r3, [sp, #0]
    19fe:	462a      	mov	r2, r5
    1a00:	4638      	mov	r0, r7
    1a02:	4b10      	ldr	r3, [pc, #64]	; (1a44 <_svfiprintf_r+0x1fc>)
    1a04:	a904      	add	r1, sp, #16
    1a06:	f3af 8000 	nop.w
    1a0a:	1c42      	adds	r2, r0, #1
    1a0c:	4606      	mov	r6, r0
    1a0e:	d1d6      	bne.n	19be <_svfiprintf_r+0x176>
    1a10:	89ab      	ldrh	r3, [r5, #12]
    1a12:	065b      	lsls	r3, r3, #25
    1a14:	f53f af2c 	bmi.w	1870 <_svfiprintf_r+0x28>
    1a18:	9809      	ldr	r0, [sp, #36]	; 0x24
    1a1a:	b01d      	add	sp, #116	; 0x74
    1a1c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1a20:	ab03      	add	r3, sp, #12
    1a22:	9300      	str	r3, [sp, #0]
    1a24:	462a      	mov	r2, r5
    1a26:	4638      	mov	r0, r7
    1a28:	4b06      	ldr	r3, [pc, #24]	; (1a44 <_svfiprintf_r+0x1fc>)
    1a2a:	a904      	add	r1, sp, #16
    1a2c:	f000 f87c 	bl	1b28 <_printf_i>
    1a30:	e7eb      	b.n	1a0a <_svfiprintf_r+0x1c2>
    1a32:	bf00      	nop
    1a34:	0000215c 	andeq	r2, r0, ip, asr r1
    1a38:	00002162 	andeq	r2, r0, r2, ror #2
    1a3c:	00002166 	andeq	r2, r0, r6, ror #2
    1a40:	00000000 	andeq	r0, r0, r0
    1a44:	00001791 	muleq	r0, r1, r7

00001a48 <_printf_common>:
    1a48:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1a4c:	4616      	mov	r6, r2
    1a4e:	4699      	mov	r9, r3
    1a50:	688a      	ldr	r2, [r1, #8]
    1a52:	690b      	ldr	r3, [r1, #16]
    1a54:	4607      	mov	r7, r0
    1a56:	4293      	cmp	r3, r2
    1a58:	bfb8      	it	lt
    1a5a:	4613      	movlt	r3, r2
    1a5c:	6033      	str	r3, [r6, #0]
    1a5e:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
    1a62:	460c      	mov	r4, r1
    1a64:	f8dd 8020 	ldr.w	r8, [sp, #32]
    1a68:	b10a      	cbz	r2, 1a6e <_printf_common+0x26>
    1a6a:	3301      	adds	r3, #1
    1a6c:	6033      	str	r3, [r6, #0]
    1a6e:	6823      	ldr	r3, [r4, #0]
    1a70:	0699      	lsls	r1, r3, #26
    1a72:	bf42      	ittt	mi
    1a74:	6833      	ldrmi	r3, [r6, #0]
    1a76:	3302      	addmi	r3, #2
    1a78:	6033      	strmi	r3, [r6, #0]
    1a7a:	6825      	ldr	r5, [r4, #0]
    1a7c:	f015 0506 	ands.w	r5, r5, #6
    1a80:	d106      	bne.n	1a90 <_printf_common+0x48>
    1a82:	f104 0a19 	add.w	sl, r4, #25
    1a86:	68e3      	ldr	r3, [r4, #12]
    1a88:	6832      	ldr	r2, [r6, #0]
    1a8a:	1a9b      	subs	r3, r3, r2
    1a8c:	42ab      	cmp	r3, r5
    1a8e:	dc28      	bgt.n	1ae2 <_printf_common+0x9a>
    1a90:	f894 2043 	ldrb.w	r2, [r4, #67]	; 0x43
    1a94:	1e13      	subs	r3, r2, #0
    1a96:	6822      	ldr	r2, [r4, #0]
    1a98:	bf18      	it	ne
    1a9a:	2301      	movne	r3, #1
    1a9c:	0692      	lsls	r2, r2, #26
    1a9e:	d42d      	bmi.n	1afc <_printf_common+0xb4>
    1aa0:	4649      	mov	r1, r9
    1aa2:	4638      	mov	r0, r7
    1aa4:	f104 0243 	add.w	r2, r4, #67	; 0x43
    1aa8:	47c0      	blx	r8
    1aaa:	3001      	adds	r0, #1
    1aac:	d020      	beq.n	1af0 <_printf_common+0xa8>
    1aae:	6823      	ldr	r3, [r4, #0]
    1ab0:	68e5      	ldr	r5, [r4, #12]
    1ab2:	f003 0306 	and.w	r3, r3, #6
    1ab6:	2b04      	cmp	r3, #4
    1ab8:	bf18      	it	ne
    1aba:	2500      	movne	r5, #0
    1abc:	6832      	ldr	r2, [r6, #0]
    1abe:	f04f 0600 	mov.w	r6, #0
    1ac2:	68a3      	ldr	r3, [r4, #8]
    1ac4:	bf08      	it	eq
    1ac6:	1aad      	subeq	r5, r5, r2
    1ac8:	6922      	ldr	r2, [r4, #16]
    1aca:	bf08      	it	eq
    1acc:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
    1ad0:	4293      	cmp	r3, r2
    1ad2:	bfc4      	itt	gt
    1ad4:	1a9b      	subgt	r3, r3, r2
    1ad6:	18ed      	addgt	r5, r5, r3
    1ad8:	341a      	adds	r4, #26
    1ada:	42b5      	cmp	r5, r6
    1adc:	d11a      	bne.n	1b14 <_printf_common+0xcc>
    1ade:	2000      	movs	r0, #0
    1ae0:	e008      	b.n	1af4 <_printf_common+0xac>
    1ae2:	2301      	movs	r3, #1
    1ae4:	4652      	mov	r2, sl
    1ae6:	4649      	mov	r1, r9
    1ae8:	4638      	mov	r0, r7
    1aea:	47c0      	blx	r8
    1aec:	3001      	adds	r0, #1
    1aee:	d103      	bne.n	1af8 <_printf_common+0xb0>
    1af0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1af4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    1af8:	3501      	adds	r5, #1
    1afa:	e7c4      	b.n	1a86 <_printf_common+0x3e>
    1afc:	2030      	movs	r0, #48	; 0x30
    1afe:	18e1      	adds	r1, r4, r3
    1b00:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
    1b04:	1c5a      	adds	r2, r3, #1
    1b06:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
    1b0a:	4422      	add	r2, r4
    1b0c:	3302      	adds	r3, #2
    1b0e:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
    1b12:	e7c5      	b.n	1aa0 <_printf_common+0x58>
    1b14:	2301      	movs	r3, #1
    1b16:	4622      	mov	r2, r4
    1b18:	4649      	mov	r1, r9
    1b1a:	4638      	mov	r0, r7
    1b1c:	47c0      	blx	r8
    1b1e:	3001      	adds	r0, #1
    1b20:	d0e6      	beq.n	1af0 <_printf_common+0xa8>
    1b22:	3601      	adds	r6, #1
    1b24:	e7d9      	b.n	1ada <_printf_common+0x92>
	...

00001b28 <_printf_i>:
    1b28:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
    1b2c:	7e0f      	ldrb	r7, [r1, #24]
    1b2e:	4691      	mov	r9, r2
    1b30:	2f78      	cmp	r7, #120	; 0x78
    1b32:	4680      	mov	r8, r0
    1b34:	460c      	mov	r4, r1
    1b36:	469a      	mov	sl, r3
    1b38:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    1b3a:	f101 0243 	add.w	r2, r1, #67	; 0x43
    1b3e:	d807      	bhi.n	1b50 <_printf_i+0x28>
    1b40:	2f62      	cmp	r7, #98	; 0x62
    1b42:	d80a      	bhi.n	1b5a <_printf_i+0x32>
    1b44:	2f00      	cmp	r7, #0
    1b46:	f000 80d9 	beq.w	1cfc <_printf_i+0x1d4>
    1b4a:	2f58      	cmp	r7, #88	; 0x58
    1b4c:	f000 80a4 	beq.w	1c98 <_printf_i+0x170>
    1b50:	f104 0542 	add.w	r5, r4, #66	; 0x42
    1b54:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
    1b58:	e03a      	b.n	1bd0 <_printf_i+0xa8>
    1b5a:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
    1b5e:	2b15      	cmp	r3, #21
    1b60:	d8f6      	bhi.n	1b50 <_printf_i+0x28>
    1b62:	a101      	add	r1, pc, #4	; (adr r1, 1b68 <_printf_i+0x40>)
    1b64:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    1b68:	00001bc1 	andeq	r1, r0, r1, asr #23
    1b6c:	00001bd5 	ldrdeq	r1, [r0], -r5
    1b70:	00001b51 	andeq	r1, r0, r1, asr fp
    1b74:	00001b51 	andeq	r1, r0, r1, asr fp
    1b78:	00001b51 	andeq	r1, r0, r1, asr fp
    1b7c:	00001b51 	andeq	r1, r0, r1, asr fp
    1b80:	00001bd5 	ldrdeq	r1, [r0], -r5
    1b84:	00001b51 	andeq	r1, r0, r1, asr fp
    1b88:	00001b51 	andeq	r1, r0, r1, asr fp
    1b8c:	00001b51 	andeq	r1, r0, r1, asr fp
    1b90:	00001b51 	andeq	r1, r0, r1, asr fp
    1b94:	00001ce3 	andeq	r1, r0, r3, ror #25
    1b98:	00001c05 	andeq	r1, r0, r5, lsl #24
    1b9c:	00001cc5 	andeq	r1, r0, r5, asr #25
    1ba0:	00001b51 	andeq	r1, r0, r1, asr fp
    1ba4:	00001b51 	andeq	r1, r0, r1, asr fp
    1ba8:	00001d05 	andeq	r1, r0, r5, lsl #26
    1bac:	00001b51 	andeq	r1, r0, r1, asr fp
    1bb0:	00001c05 	andeq	r1, r0, r5, lsl #24
    1bb4:	00001b51 	andeq	r1, r0, r1, asr fp
    1bb8:	00001b51 	andeq	r1, r0, r1, asr fp
    1bbc:	00001ccd 	andeq	r1, r0, sp, asr #25
    1bc0:	682b      	ldr	r3, [r5, #0]
    1bc2:	1d1a      	adds	r2, r3, #4
    1bc4:	681b      	ldr	r3, [r3, #0]
    1bc6:	602a      	str	r2, [r5, #0]
    1bc8:	f104 0542 	add.w	r5, r4, #66	; 0x42
    1bcc:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
    1bd0:	2301      	movs	r3, #1
    1bd2:	e0a4      	b.n	1d1e <_printf_i+0x1f6>
    1bd4:	6820      	ldr	r0, [r4, #0]
    1bd6:	6829      	ldr	r1, [r5, #0]
    1bd8:	0606      	lsls	r6, r0, #24
    1bda:	f101 0304 	add.w	r3, r1, #4
    1bde:	d50a      	bpl.n	1bf6 <_printf_i+0xce>
    1be0:	680e      	ldr	r6, [r1, #0]
    1be2:	602b      	str	r3, [r5, #0]
    1be4:	2e00      	cmp	r6, #0
    1be6:	da03      	bge.n	1bf0 <_printf_i+0xc8>
    1be8:	232d      	movs	r3, #45	; 0x2d
    1bea:	4276      	negs	r6, r6
    1bec:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    1bf0:	230a      	movs	r3, #10
    1bf2:	485e      	ldr	r0, [pc, #376]	; (1d6c <_printf_i+0x244>)
    1bf4:	e019      	b.n	1c2a <_printf_i+0x102>
    1bf6:	680e      	ldr	r6, [r1, #0]
    1bf8:	f010 0f40 	tst.w	r0, #64	; 0x40
    1bfc:	602b      	str	r3, [r5, #0]
    1bfe:	bf18      	it	ne
    1c00:	b236      	sxthne	r6, r6
    1c02:	e7ef      	b.n	1be4 <_printf_i+0xbc>
    1c04:	682b      	ldr	r3, [r5, #0]
    1c06:	6820      	ldr	r0, [r4, #0]
    1c08:	1d19      	adds	r1, r3, #4
    1c0a:	6029      	str	r1, [r5, #0]
    1c0c:	0601      	lsls	r1, r0, #24
    1c0e:	d501      	bpl.n	1c14 <_printf_i+0xec>
    1c10:	681e      	ldr	r6, [r3, #0]
    1c12:	e002      	b.n	1c1a <_printf_i+0xf2>
    1c14:	0646      	lsls	r6, r0, #25
    1c16:	d5fb      	bpl.n	1c10 <_printf_i+0xe8>
    1c18:	881e      	ldrh	r6, [r3, #0]
    1c1a:	2f6f      	cmp	r7, #111	; 0x6f
    1c1c:	bf0c      	ite	eq
    1c1e:	2308      	moveq	r3, #8
    1c20:	230a      	movne	r3, #10
    1c22:	4852      	ldr	r0, [pc, #328]	; (1d6c <_printf_i+0x244>)
    1c24:	2100      	movs	r1, #0
    1c26:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
    1c2a:	6865      	ldr	r5, [r4, #4]
    1c2c:	2d00      	cmp	r5, #0
    1c2e:	bfa8      	it	ge
    1c30:	6821      	ldrge	r1, [r4, #0]
    1c32:	60a5      	str	r5, [r4, #8]
    1c34:	bfa4      	itt	ge
    1c36:	f021 0104 	bicge.w	r1, r1, #4
    1c3a:	6021      	strge	r1, [r4, #0]
    1c3c:	b90e      	cbnz	r6, 1c42 <_printf_i+0x11a>
    1c3e:	2d00      	cmp	r5, #0
    1c40:	d04d      	beq.n	1cde <_printf_i+0x1b6>
    1c42:	4615      	mov	r5, r2
    1c44:	fbb6 f1f3 	udiv	r1, r6, r3
    1c48:	fb03 6711 	mls	r7, r3, r1, r6
    1c4c:	5dc7      	ldrb	r7, [r0, r7]
    1c4e:	f805 7d01 	strb.w	r7, [r5, #-1]!
    1c52:	4637      	mov	r7, r6
    1c54:	42bb      	cmp	r3, r7
    1c56:	460e      	mov	r6, r1
    1c58:	d9f4      	bls.n	1c44 <_printf_i+0x11c>
    1c5a:	2b08      	cmp	r3, #8
    1c5c:	d10b      	bne.n	1c76 <_printf_i+0x14e>
    1c5e:	6823      	ldr	r3, [r4, #0]
    1c60:	07de      	lsls	r6, r3, #31
    1c62:	d508      	bpl.n	1c76 <_printf_i+0x14e>
    1c64:	6923      	ldr	r3, [r4, #16]
    1c66:	6861      	ldr	r1, [r4, #4]
    1c68:	4299      	cmp	r1, r3
    1c6a:	bfde      	ittt	le
    1c6c:	2330      	movle	r3, #48	; 0x30
    1c6e:	f805 3c01 	strble.w	r3, [r5, #-1]
    1c72:	f105 35ff 	addle.w	r5, r5, #4294967295	; 0xffffffff
    1c76:	1b52      	subs	r2, r2, r5
    1c78:	6122      	str	r2, [r4, #16]
    1c7a:	464b      	mov	r3, r9
    1c7c:	4621      	mov	r1, r4
    1c7e:	4640      	mov	r0, r8
    1c80:	f8cd a000 	str.w	sl, [sp]
    1c84:	aa03      	add	r2, sp, #12
    1c86:	f7ff fedf 	bl	1a48 <_printf_common>
    1c8a:	3001      	adds	r0, #1
    1c8c:	d14c      	bne.n	1d28 <_printf_i+0x200>
    1c8e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1c92:	b004      	add	sp, #16
    1c94:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    1c98:	4834      	ldr	r0, [pc, #208]	; (1d6c <_printf_i+0x244>)
    1c9a:	f881 7045 	strb.w	r7, [r1, #69]	; 0x45
    1c9e:	6829      	ldr	r1, [r5, #0]
    1ca0:	6823      	ldr	r3, [r4, #0]
    1ca2:	f851 6b04 	ldr.w	r6, [r1], #4
    1ca6:	6029      	str	r1, [r5, #0]
    1ca8:	061d      	lsls	r5, r3, #24
    1caa:	d514      	bpl.n	1cd6 <_printf_i+0x1ae>
    1cac:	07df      	lsls	r7, r3, #31
    1cae:	bf44      	itt	mi
    1cb0:	f043 0320 	orrmi.w	r3, r3, #32
    1cb4:	6023      	strmi	r3, [r4, #0]
    1cb6:	b91e      	cbnz	r6, 1cc0 <_printf_i+0x198>
    1cb8:	6823      	ldr	r3, [r4, #0]
    1cba:	f023 0320 	bic.w	r3, r3, #32
    1cbe:	6023      	str	r3, [r4, #0]
    1cc0:	2310      	movs	r3, #16
    1cc2:	e7af      	b.n	1c24 <_printf_i+0xfc>
    1cc4:	6823      	ldr	r3, [r4, #0]
    1cc6:	f043 0320 	orr.w	r3, r3, #32
    1cca:	6023      	str	r3, [r4, #0]
    1ccc:	2378      	movs	r3, #120	; 0x78
    1cce:	4828      	ldr	r0, [pc, #160]	; (1d70 <_printf_i+0x248>)
    1cd0:	f884 3045 	strb.w	r3, [r4, #69]	; 0x45
    1cd4:	e7e3      	b.n	1c9e <_printf_i+0x176>
    1cd6:	0659      	lsls	r1, r3, #25
    1cd8:	bf48      	it	mi
    1cda:	b2b6      	uxthmi	r6, r6
    1cdc:	e7e6      	b.n	1cac <_printf_i+0x184>
    1cde:	4615      	mov	r5, r2
    1ce0:	e7bb      	b.n	1c5a <_printf_i+0x132>
    1ce2:	682b      	ldr	r3, [r5, #0]
    1ce4:	6826      	ldr	r6, [r4, #0]
    1ce6:	1d18      	adds	r0, r3, #4
    1ce8:	6961      	ldr	r1, [r4, #20]
    1cea:	6028      	str	r0, [r5, #0]
    1cec:	0635      	lsls	r5, r6, #24
    1cee:	681b      	ldr	r3, [r3, #0]
    1cf0:	d501      	bpl.n	1cf6 <_printf_i+0x1ce>
    1cf2:	6019      	str	r1, [r3, #0]
    1cf4:	e002      	b.n	1cfc <_printf_i+0x1d4>
    1cf6:	0670      	lsls	r0, r6, #25
    1cf8:	d5fb      	bpl.n	1cf2 <_printf_i+0x1ca>
    1cfa:	8019      	strh	r1, [r3, #0]
    1cfc:	2300      	movs	r3, #0
    1cfe:	4615      	mov	r5, r2
    1d00:	6123      	str	r3, [r4, #16]
    1d02:	e7ba      	b.n	1c7a <_printf_i+0x152>
    1d04:	682b      	ldr	r3, [r5, #0]
    1d06:	2100      	movs	r1, #0
    1d08:	1d1a      	adds	r2, r3, #4
    1d0a:	602a      	str	r2, [r5, #0]
    1d0c:	681d      	ldr	r5, [r3, #0]
    1d0e:	6862      	ldr	r2, [r4, #4]
    1d10:	4628      	mov	r0, r5
    1d12:	f000 f82f 	bl	1d74 <memchr>
    1d16:	b108      	cbz	r0, 1d1c <_printf_i+0x1f4>
    1d18:	1b40      	subs	r0, r0, r5
    1d1a:	6060      	str	r0, [r4, #4]
    1d1c:	6863      	ldr	r3, [r4, #4]
    1d1e:	6123      	str	r3, [r4, #16]
    1d20:	2300      	movs	r3, #0
    1d22:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    1d26:	e7a8      	b.n	1c7a <_printf_i+0x152>
    1d28:	462a      	mov	r2, r5
    1d2a:	4649      	mov	r1, r9
    1d2c:	4640      	mov	r0, r8
    1d2e:	6923      	ldr	r3, [r4, #16]
    1d30:	47d0      	blx	sl
    1d32:	3001      	adds	r0, #1
    1d34:	d0ab      	beq.n	1c8e <_printf_i+0x166>
    1d36:	6823      	ldr	r3, [r4, #0]
    1d38:	079b      	lsls	r3, r3, #30
    1d3a:	d413      	bmi.n	1d64 <_printf_i+0x23c>
    1d3c:	68e0      	ldr	r0, [r4, #12]
    1d3e:	9b03      	ldr	r3, [sp, #12]
    1d40:	4298      	cmp	r0, r3
    1d42:	bfb8      	it	lt
    1d44:	4618      	movlt	r0, r3
    1d46:	e7a4      	b.n	1c92 <_printf_i+0x16a>
    1d48:	2301      	movs	r3, #1
    1d4a:	4632      	mov	r2, r6
    1d4c:	4649      	mov	r1, r9
    1d4e:	4640      	mov	r0, r8
    1d50:	47d0      	blx	sl
    1d52:	3001      	adds	r0, #1
    1d54:	d09b      	beq.n	1c8e <_printf_i+0x166>
    1d56:	3501      	adds	r5, #1
    1d58:	68e3      	ldr	r3, [r4, #12]
    1d5a:	9903      	ldr	r1, [sp, #12]
    1d5c:	1a5b      	subs	r3, r3, r1
    1d5e:	42ab      	cmp	r3, r5
    1d60:	dcf2      	bgt.n	1d48 <_printf_i+0x220>
    1d62:	e7eb      	b.n	1d3c <_printf_i+0x214>
    1d64:	2500      	movs	r5, #0
    1d66:	f104 0619 	add.w	r6, r4, #25
    1d6a:	e7f5      	b.n	1d58 <_printf_i+0x230>
    1d6c:	0000216d 	andeq	r2, r0, sp, ror #2
    1d70:	0000217e 	andeq	r2, r0, lr, ror r1

00001d74 <memchr>:
    1d74:	4603      	mov	r3, r0
    1d76:	b510      	push	{r4, lr}
    1d78:	b2c9      	uxtb	r1, r1
    1d7a:	4402      	add	r2, r0
    1d7c:	4293      	cmp	r3, r2
    1d7e:	4618      	mov	r0, r3
    1d80:	d101      	bne.n	1d86 <memchr+0x12>
    1d82:	2000      	movs	r0, #0
    1d84:	e003      	b.n	1d8e <memchr+0x1a>
    1d86:	7804      	ldrb	r4, [r0, #0]
    1d88:	3301      	adds	r3, #1
    1d8a:	428c      	cmp	r4, r1
    1d8c:	d1f6      	bne.n	1d7c <memchr+0x8>
    1d8e:	bd10      	pop	{r4, pc}

00001d90 <memcpy>:
    1d90:	440a      	add	r2, r1
    1d92:	4291      	cmp	r1, r2
    1d94:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
    1d98:	d100      	bne.n	1d9c <memcpy+0xc>
    1d9a:	4770      	bx	lr
    1d9c:	b510      	push	{r4, lr}
    1d9e:	f811 4b01 	ldrb.w	r4, [r1], #1
    1da2:	4291      	cmp	r1, r2
    1da4:	f803 4f01 	strb.w	r4, [r3, #1]!
    1da8:	d1f9      	bne.n	1d9e <memcpy+0xe>
    1daa:	bd10      	pop	{r4, pc}

00001dac <memmove>:
    1dac:	4288      	cmp	r0, r1
    1dae:	b510      	push	{r4, lr}
    1db0:	eb01 0402 	add.w	r4, r1, r2
    1db4:	d902      	bls.n	1dbc <memmove+0x10>
    1db6:	4284      	cmp	r4, r0
    1db8:	4623      	mov	r3, r4
    1dba:	d807      	bhi.n	1dcc <memmove+0x20>
    1dbc:	1e43      	subs	r3, r0, #1
    1dbe:	42a1      	cmp	r1, r4
    1dc0:	d008      	beq.n	1dd4 <memmove+0x28>
    1dc2:	f811 2b01 	ldrb.w	r2, [r1], #1
    1dc6:	f803 2f01 	strb.w	r2, [r3, #1]!
    1dca:	e7f8      	b.n	1dbe <memmove+0x12>
    1dcc:	4601      	mov	r1, r0
    1dce:	4402      	add	r2, r0
    1dd0:	428a      	cmp	r2, r1
    1dd2:	d100      	bne.n	1dd6 <memmove+0x2a>
    1dd4:	bd10      	pop	{r4, pc}
    1dd6:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
    1dda:	f802 4d01 	strb.w	r4, [r2, #-1]!
    1dde:	e7f7      	b.n	1dd0 <memmove+0x24>

00001de0 <_free_r>:
    1de0:	b538      	push	{r3, r4, r5, lr}
    1de2:	4605      	mov	r5, r0
    1de4:	2900      	cmp	r1, #0
    1de6:	d040      	beq.n	1e6a <_free_r+0x8a>
    1de8:	f851 3c04 	ldr.w	r3, [r1, #-4]
    1dec:	1f0c      	subs	r4, r1, #4
    1dee:	2b00      	cmp	r3, #0
    1df0:	bfb8      	it	lt
    1df2:	18e4      	addlt	r4, r4, r3
    1df4:	f000 f910 	bl	2018 <__malloc_lock>
    1df8:	4a1c      	ldr	r2, [pc, #112]	; (1e6c <_free_r+0x8c>)
    1dfa:	6813      	ldr	r3, [r2, #0]
    1dfc:	b933      	cbnz	r3, 1e0c <_free_r+0x2c>
    1dfe:	6063      	str	r3, [r4, #4]
    1e00:	6014      	str	r4, [r2, #0]
    1e02:	4628      	mov	r0, r5
    1e04:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    1e08:	f000 b90c 	b.w	2024 <__malloc_unlock>
    1e0c:	42a3      	cmp	r3, r4
    1e0e:	d908      	bls.n	1e22 <_free_r+0x42>
    1e10:	6820      	ldr	r0, [r4, #0]
    1e12:	1821      	adds	r1, r4, r0
    1e14:	428b      	cmp	r3, r1
    1e16:	bf01      	itttt	eq
    1e18:	6819      	ldreq	r1, [r3, #0]
    1e1a:	685b      	ldreq	r3, [r3, #4]
    1e1c:	1809      	addeq	r1, r1, r0
    1e1e:	6021      	streq	r1, [r4, #0]
    1e20:	e7ed      	b.n	1dfe <_free_r+0x1e>
    1e22:	461a      	mov	r2, r3
    1e24:	685b      	ldr	r3, [r3, #4]
    1e26:	b10b      	cbz	r3, 1e2c <_free_r+0x4c>
    1e28:	42a3      	cmp	r3, r4
    1e2a:	d9fa      	bls.n	1e22 <_free_r+0x42>
    1e2c:	6811      	ldr	r1, [r2, #0]
    1e2e:	1850      	adds	r0, r2, r1
    1e30:	42a0      	cmp	r0, r4
    1e32:	d10b      	bne.n	1e4c <_free_r+0x6c>
    1e34:	6820      	ldr	r0, [r4, #0]
    1e36:	4401      	add	r1, r0
    1e38:	1850      	adds	r0, r2, r1
    1e3a:	4283      	cmp	r3, r0
    1e3c:	6011      	str	r1, [r2, #0]
    1e3e:	d1e0      	bne.n	1e02 <_free_r+0x22>
    1e40:	6818      	ldr	r0, [r3, #0]
    1e42:	685b      	ldr	r3, [r3, #4]
    1e44:	4401      	add	r1, r0
    1e46:	6011      	str	r1, [r2, #0]
    1e48:	6053      	str	r3, [r2, #4]
    1e4a:	e7da      	b.n	1e02 <_free_r+0x22>
    1e4c:	d902      	bls.n	1e54 <_free_r+0x74>
    1e4e:	230c      	movs	r3, #12
    1e50:	602b      	str	r3, [r5, #0]
    1e52:	e7d6      	b.n	1e02 <_free_r+0x22>
    1e54:	6820      	ldr	r0, [r4, #0]
    1e56:	1821      	adds	r1, r4, r0
    1e58:	428b      	cmp	r3, r1
    1e5a:	bf01      	itttt	eq
    1e5c:	6819      	ldreq	r1, [r3, #0]
    1e5e:	685b      	ldreq	r3, [r3, #4]
    1e60:	1809      	addeq	r1, r1, r0
    1e62:	6021      	streq	r1, [r4, #0]
    1e64:	6063      	str	r3, [r4, #4]
    1e66:	6054      	str	r4, [r2, #4]
    1e68:	e7cb      	b.n	1e02 <_free_r+0x22>
    1e6a:	bd38      	pop	{r3, r4, r5, pc}
    1e6c:	000205e4 	andeq	r0, r2, r4, ror #11

00001e70 <sbrk_aligned>:
    1e70:	b570      	push	{r4, r5, r6, lr}
    1e72:	4e0e      	ldr	r6, [pc, #56]	; (1eac <sbrk_aligned+0x3c>)
    1e74:	460c      	mov	r4, r1
    1e76:	6831      	ldr	r1, [r6, #0]
    1e78:	4605      	mov	r5, r0
    1e7a:	b911      	cbnz	r1, 1e82 <sbrk_aligned+0x12>
    1e7c:	f000 f8bc 	bl	1ff8 <_sbrk_r>
    1e80:	6030      	str	r0, [r6, #0]
    1e82:	4621      	mov	r1, r4
    1e84:	4628      	mov	r0, r5
    1e86:	f000 f8b7 	bl	1ff8 <_sbrk_r>
    1e8a:	1c43      	adds	r3, r0, #1
    1e8c:	d00a      	beq.n	1ea4 <sbrk_aligned+0x34>
    1e8e:	1cc4      	adds	r4, r0, #3
    1e90:	f024 0403 	bic.w	r4, r4, #3
    1e94:	42a0      	cmp	r0, r4
    1e96:	d007      	beq.n	1ea8 <sbrk_aligned+0x38>
    1e98:	1a21      	subs	r1, r4, r0
    1e9a:	4628      	mov	r0, r5
    1e9c:	f000 f8ac 	bl	1ff8 <_sbrk_r>
    1ea0:	3001      	adds	r0, #1
    1ea2:	d101      	bne.n	1ea8 <sbrk_aligned+0x38>
    1ea4:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
    1ea8:	4620      	mov	r0, r4
    1eaa:	bd70      	pop	{r4, r5, r6, pc}
    1eac:	000205e8 	andeq	r0, r2, r8, ror #11

00001eb0 <_malloc_r>:
    1eb0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1eb4:	1ccd      	adds	r5, r1, #3
    1eb6:	f025 0503 	bic.w	r5, r5, #3
    1eba:	3508      	adds	r5, #8
    1ebc:	2d0c      	cmp	r5, #12
    1ebe:	bf38      	it	cc
    1ec0:	250c      	movcc	r5, #12
    1ec2:	2d00      	cmp	r5, #0
    1ec4:	4607      	mov	r7, r0
    1ec6:	db01      	blt.n	1ecc <_malloc_r+0x1c>
    1ec8:	42a9      	cmp	r1, r5
    1eca:	d905      	bls.n	1ed8 <_malloc_r+0x28>
    1ecc:	230c      	movs	r3, #12
    1ece:	2600      	movs	r6, #0
    1ed0:	603b      	str	r3, [r7, #0]
    1ed2:	4630      	mov	r0, r6
    1ed4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1ed8:	4e2e      	ldr	r6, [pc, #184]	; (1f94 <_malloc_r+0xe4>)
    1eda:	f000 f89d 	bl	2018 <__malloc_lock>
    1ede:	6833      	ldr	r3, [r6, #0]
    1ee0:	461c      	mov	r4, r3
    1ee2:	bb34      	cbnz	r4, 1f32 <_malloc_r+0x82>
    1ee4:	4629      	mov	r1, r5
    1ee6:	4638      	mov	r0, r7
    1ee8:	f7ff ffc2 	bl	1e70 <sbrk_aligned>
    1eec:	1c43      	adds	r3, r0, #1
    1eee:	4604      	mov	r4, r0
    1ef0:	d14d      	bne.n	1f8e <_malloc_r+0xde>
    1ef2:	6834      	ldr	r4, [r6, #0]
    1ef4:	4626      	mov	r6, r4
    1ef6:	2e00      	cmp	r6, #0
    1ef8:	d140      	bne.n	1f7c <_malloc_r+0xcc>
    1efa:	6823      	ldr	r3, [r4, #0]
    1efc:	4631      	mov	r1, r6
    1efe:	4638      	mov	r0, r7
    1f00:	eb04 0803 	add.w	r8, r4, r3
    1f04:	f000 f878 	bl	1ff8 <_sbrk_r>
    1f08:	4580      	cmp	r8, r0
    1f0a:	d13a      	bne.n	1f82 <_malloc_r+0xd2>
    1f0c:	6821      	ldr	r1, [r4, #0]
    1f0e:	3503      	adds	r5, #3
    1f10:	1a6d      	subs	r5, r5, r1
    1f12:	f025 0503 	bic.w	r5, r5, #3
    1f16:	3508      	adds	r5, #8
    1f18:	2d0c      	cmp	r5, #12
    1f1a:	bf38      	it	cc
    1f1c:	250c      	movcc	r5, #12
    1f1e:	4638      	mov	r0, r7
    1f20:	4629      	mov	r1, r5
    1f22:	f7ff ffa5 	bl	1e70 <sbrk_aligned>
    1f26:	3001      	adds	r0, #1
    1f28:	d02b      	beq.n	1f82 <_malloc_r+0xd2>
    1f2a:	6823      	ldr	r3, [r4, #0]
    1f2c:	442b      	add	r3, r5
    1f2e:	6023      	str	r3, [r4, #0]
    1f30:	e00e      	b.n	1f50 <_malloc_r+0xa0>
    1f32:	6822      	ldr	r2, [r4, #0]
    1f34:	1b52      	subs	r2, r2, r5
    1f36:	d41e      	bmi.n	1f76 <_malloc_r+0xc6>
    1f38:	2a0b      	cmp	r2, #11
    1f3a:	d916      	bls.n	1f6a <_malloc_r+0xba>
    1f3c:	1961      	adds	r1, r4, r5
    1f3e:	42a3      	cmp	r3, r4
    1f40:	6025      	str	r5, [r4, #0]
    1f42:	bf18      	it	ne
    1f44:	6059      	strne	r1, [r3, #4]
    1f46:	6863      	ldr	r3, [r4, #4]
    1f48:	bf08      	it	eq
    1f4a:	6031      	streq	r1, [r6, #0]
    1f4c:	5162      	str	r2, [r4, r5]
    1f4e:	604b      	str	r3, [r1, #4]
    1f50:	4638      	mov	r0, r7
    1f52:	f104 060b 	add.w	r6, r4, #11
    1f56:	f000 f865 	bl	2024 <__malloc_unlock>
    1f5a:	f026 0607 	bic.w	r6, r6, #7
    1f5e:	1d23      	adds	r3, r4, #4
    1f60:	1af2      	subs	r2, r6, r3
    1f62:	d0b6      	beq.n	1ed2 <_malloc_r+0x22>
    1f64:	1b9b      	subs	r3, r3, r6
    1f66:	50a3      	str	r3, [r4, r2]
    1f68:	e7b3      	b.n	1ed2 <_malloc_r+0x22>
    1f6a:	6862      	ldr	r2, [r4, #4]
    1f6c:	42a3      	cmp	r3, r4
    1f6e:	bf0c      	ite	eq
    1f70:	6032      	streq	r2, [r6, #0]
    1f72:	605a      	strne	r2, [r3, #4]
    1f74:	e7ec      	b.n	1f50 <_malloc_r+0xa0>
    1f76:	4623      	mov	r3, r4
    1f78:	6864      	ldr	r4, [r4, #4]
    1f7a:	e7b2      	b.n	1ee2 <_malloc_r+0x32>
    1f7c:	4634      	mov	r4, r6
    1f7e:	6876      	ldr	r6, [r6, #4]
    1f80:	e7b9      	b.n	1ef6 <_malloc_r+0x46>
    1f82:	230c      	movs	r3, #12
    1f84:	4638      	mov	r0, r7
    1f86:	603b      	str	r3, [r7, #0]
    1f88:	f000 f84c 	bl	2024 <__malloc_unlock>
    1f8c:	e7a1      	b.n	1ed2 <_malloc_r+0x22>
    1f8e:	6025      	str	r5, [r4, #0]
    1f90:	e7de      	b.n	1f50 <_malloc_r+0xa0>
    1f92:	bf00      	nop
    1f94:	000205e4 	andeq	r0, r2, r4, ror #11

00001f98 <_realloc_r>:
    1f98:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1f9c:	4680      	mov	r8, r0
    1f9e:	4614      	mov	r4, r2
    1fa0:	460e      	mov	r6, r1
    1fa2:	b921      	cbnz	r1, 1fae <_realloc_r+0x16>
    1fa4:	4611      	mov	r1, r2
    1fa6:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    1faa:	f7ff bf81 	b.w	1eb0 <_malloc_r>
    1fae:	b92a      	cbnz	r2, 1fbc <_realloc_r+0x24>
    1fb0:	f7ff ff16 	bl	1de0 <_free_r>
    1fb4:	4625      	mov	r5, r4
    1fb6:	4628      	mov	r0, r5
    1fb8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1fbc:	f000 f838 	bl	2030 <_malloc_usable_size_r>
    1fc0:	4284      	cmp	r4, r0
    1fc2:	4607      	mov	r7, r0
    1fc4:	d802      	bhi.n	1fcc <_realloc_r+0x34>
    1fc6:	ebb4 0f50 	cmp.w	r4, r0, lsr #1
    1fca:	d812      	bhi.n	1ff2 <_realloc_r+0x5a>
    1fcc:	4621      	mov	r1, r4
    1fce:	4640      	mov	r0, r8
    1fd0:	f7ff ff6e 	bl	1eb0 <_malloc_r>
    1fd4:	4605      	mov	r5, r0
    1fd6:	2800      	cmp	r0, #0
    1fd8:	d0ed      	beq.n	1fb6 <_realloc_r+0x1e>
    1fda:	42bc      	cmp	r4, r7
    1fdc:	4622      	mov	r2, r4
    1fde:	4631      	mov	r1, r6
    1fe0:	bf28      	it	cs
    1fe2:	463a      	movcs	r2, r7
    1fe4:	f7ff fed4 	bl	1d90 <memcpy>
    1fe8:	4631      	mov	r1, r6
    1fea:	4640      	mov	r0, r8
    1fec:	f7ff fef8 	bl	1de0 <_free_r>
    1ff0:	e7e1      	b.n	1fb6 <_realloc_r+0x1e>
    1ff2:	4635      	mov	r5, r6
    1ff4:	e7df      	b.n	1fb6 <_realloc_r+0x1e>
	...

00001ff8 <_sbrk_r>:
    1ff8:	b538      	push	{r3, r4, r5, lr}
    1ffa:	2300      	movs	r3, #0
    1ffc:	4d05      	ldr	r5, [pc, #20]	; (2014 <__RAM_SIZE+0x14>)
    1ffe:	4604      	mov	r4, r0
    2000:	4608      	mov	r0, r1
    2002:	602b      	str	r3, [r5, #0]
    2004:	f000 f81e 	bl	2044 <_sbrk>
    2008:	1c43      	adds	r3, r0, #1
    200a:	d102      	bne.n	2012 <__RAM_SIZE+0x12>
    200c:	682b      	ldr	r3, [r5, #0]
    200e:	b103      	cbz	r3, 2012 <__RAM_SIZE+0x12>
    2010:	6023      	str	r3, [r4, #0]
    2012:	bd38      	pop	{r3, r4, r5, pc}
    2014:	000205ec 	andeq	r0, r2, ip, ror #11

00002018 <__malloc_lock>:
    2018:	4801      	ldr	r0, [pc, #4]	; (2020 <__malloc_lock+0x8>)
    201a:	f000 b811 	b.w	2040 <__retarget_lock_acquire_recursive>
    201e:	bf00      	nop
    2020:	000205f0 	strdeq	r0, [r2], -r0	; <UNPREDICTABLE>

00002024 <__malloc_unlock>:
    2024:	4801      	ldr	r0, [pc, #4]	; (202c <__malloc_unlock+0x8>)
    2026:	f000 b80c 	b.w	2042 <__retarget_lock_release_recursive>
    202a:	bf00      	nop
    202c:	000205f0 	strdeq	r0, [r2], -r0	; <UNPREDICTABLE>

00002030 <_malloc_usable_size_r>:
    2030:	f851 3c04 	ldr.w	r3, [r1, #-4]
    2034:	1f18      	subs	r0, r3, #4
    2036:	2b00      	cmp	r3, #0
    2038:	bfbc      	itt	lt
    203a:	580b      	ldrlt	r3, [r1, r0]
    203c:	18c0      	addlt	r0, r0, r3
    203e:	4770      	bx	lr

00002040 <__retarget_lock_acquire_recursive>:
    2040:	4770      	bx	lr

00002042 <__retarget_lock_release_recursive>:
    2042:	4770      	bx	lr

00002044 <_sbrk>:
    2044:	4a04      	ldr	r2, [pc, #16]	; (2058 <_sbrk+0x14>)
    2046:	4905      	ldr	r1, [pc, #20]	; (205c <_sbrk+0x18>)
    2048:	6813      	ldr	r3, [r2, #0]
    204a:	2b00      	cmp	r3, #0
    204c:	bf08      	it	eq
    204e:	460b      	moveq	r3, r1
    2050:	4418      	add	r0, r3
    2052:	6010      	str	r0, [r2, #0]
    2054:	4618      	mov	r0, r3
    2056:	4770      	bx	lr
    2058:	000205f4 	strdeq	r0, [r2], -r4
    205c:	000205f8 	strdeq	r0, [r2], -r8

00002060 <_exit>:
    2060:	e7fe      	b.n	2060 <_exit>
    2062:	bf00      	nop

00002064 <_init>:
    2064:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    2066:	bf00      	nop
    2068:	bcf8      	pop	{r3, r4, r5, r6, r7}
    206a:	bc08      	pop	{r3}
    206c:	469e      	mov	lr, r3
    206e:	4770      	bx	lr

00002070 <_fini>:
    2070:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    2072:	bf00      	nop
    2074:	bcf8      	pop	{r3, r4, r5, r6, r7}
    2076:	bc08      	pop	{r3}
    2078:	469e      	mov	lr, r3
    207a:	4770      	bx	lr
    207c:	73657250 	cmnvc	r5, #80, 4
    2080:	20512073 	subscs	r2, r1, r3, ror r0
    2084:	65206f74 	strvs	r6, [r0, #-3956]!	; 0xfffff08c
    2088:	2e746978 			; <UNDEFINED> instruction: 0x2e746978
    208c:	00000a0d 	andeq	r0, r0, sp, lsl #20
    2090:	6c756146 	ldfvse	f6, [r5], #-280	; 0xfffffee8
    2094:	65642074 	strbvs	r2, [r4, #-116]!	; 0xffffff8c
    2098:	74636574 	strbtvc	r6, [r3], #-1396	; 0xfffffa8c
    209c:	0d216465 	cfstrseq	mvf6, [r1, #-404]!	; 0xfffffe6c
    20a0:	0000000a 	andeq	r0, r0, sl
    20a4:	00494d4e 	subeq	r4, r9, lr, asr #26
    20a8:	5345545b 	movtpl	r5, #21595	; 0x545b
    20ac:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    20b0:	20776f68 	rsbscs	r6, r7, r8, ror #30
    20b4:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
    20b8:	6e656d20 	cdpvs	13, 6, cr6, cr5, cr0, {1}
    20bc:	2e2e2e75 	mcrcs	14, 1, r2, cr14, cr5, {3}
    20c0:	00000a0d 	andeq	r0, r0, sp, lsl #20
    20c4:	5d63255b 	cfstr64pl	mvdx2, [r3, #-364]!	; 0xfffffe94
    20c8:	00732520 	rsbseq	r2, r3, r0, lsr #10
    20cc:	5345545b 	movtpl	r5, #21595	; 0x545b
    20d0:	50205d54 	eorpl	r5, r0, r4, asr sp
    20d4:	73736572 	cmnvc	r3, #478150656	; 0x1c800000
    20d8:	79656b20 	stmdbvc	r5!, {r5, r8, r9, fp, sp, lr}^
    20dc:	206f7420 	rsbcs	r7, pc, r0, lsr #8
    20e0:	63657865 	cmnvs	r5, #6619136	; 0x650000
    20e4:	20657475 	rsbcs	r7, r5, r5, ror r4
    20e8:	2720726f 	strcs	r7, [r0, -pc, ror #4]!
    20ec:	74202751 	strtvc	r2, [r0], #-1873	; 0xfffff8af
    20f0:	7865206f 	stmdavc	r5!, {r0, r1, r2, r3, r5, r6, sp}^
    20f4:	2e2e7469 	cdpcs	4, 2, cr7, cr14, cr9, {3}
    20f8:	000a0d2e 	andeq	r0, sl, lr, lsr #26
    20fc:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    2100:	63252074 			; <UNDEFINED> instruction: 0x63252074
    2104:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    2108:	0000000a 	andeq	r0, r0, sl
    210c:	5345545b 	movtpl	r5, #21595	; 0x545b
    2110:	54205d54 	strtpl	r5, [r0], #-3412	; 0xfffff2ac
    2114:	20747365 	rsbscs	r7, r4, r5, ror #6
    2118:	73646e65 	cmnvc	r4, #1616	; 0x650
    211c:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
    2120:	000a0d0a 	andeq	r0, sl, sl, lsl #26
    2124:	5345545b 	movtpl	r5, #21595	; 0x545b
    2128:	53205d54 			; <UNDEFINED> instruction: 0x53205d54
    212c:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
    2130:	0073253a 	rsbseq	r2, r3, sl, lsr r5
    2134:	5345545b 	movtpl	r5, #21595	; 0x545b
    2138:	45205d54 	strmi	r5, [r0, #-3412]!	; 0xfffff2ac
    213c:	253a646e 	ldrcs	r6, [sl, #-1134]!	; 0xfffffb92
    2140:	00000073 	andeq	r0, r0, r3, ror r0
    2144:	75706e49 	ldrbvc	r6, [r0, #-3657]!	; 0xfffff1b7
    2148:	72652074 	rsbvc	r2, r5, #116	; 0x74
    214c:	2e726f72 	mrccs	15, 3, r6, cr2, cr2, {3}
    2150:	0a0d2e2e 	beq	34da10 <__StackTop+0x32ba10>
    2154:	00000000 	andeq	r0, r0, r0

00002158 <_global_impure_ptr>:
    2158:	000204cc 	andeq	r0, r2, ip, asr #9
    215c:	2b302d23 	blcs	c0d5f0 <__StackTop+0xbeb5f0>
    2160:	6c680020 	stclvs	0, cr0, [r8], #-128	; 0xffffff80
    2164:	6665004c 	strbtvs	r0, [r5], -ip, asr #32
    2168:	47464567 	strbmi	r4, [r6, -r7, ror #10]
    216c:	32313000 	eorscc	r3, r1, #0
    2170:	36353433 			; <UNDEFINED> instruction: 0x36353433
    2174:	41393837 	teqmi	r9, r7, lsr r8
    2178:	45444342 	strbmi	r4, [r4, #-834]	; 0xfffffcbe
    217c:	31300046 	teqcc	r0, r6, asr #32
    2180:	35343332 	ldrcc	r3, [r4, #-818]!	; 0xfffffcce
    2184:	39383736 	ldmdbcc	r8!, {r1, r2, r4, r5, r8, r9, sl, ip, sp}
    2188:	64636261 	strbtvs	r6, [r3], #-609	; 0xfffffd9f
    218c:	00006665 	andeq	r6, r0, r5, ror #12

00002190 <__EH_FRAME_BEGIN__>:
    2190:	00000000 	andeq	r0, r0, r0

Disassembly of section .data:

00020000 <g_advtim_menu>:
   20000:	00000071 	andeq	r0, r0, r1, ror r0
   20004:	00000541 	andeq	r0, r0, r1, asr #10
   20008:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   2000c:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   20010:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   20014:	206d6974 	rsbcs	r6, sp, r4, ror r9
   20018:	206c6c61 	rsbcs	r6, ip, r1, ror #24
   2001c:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   20020:	736c656e 	cmnvc	ip, #461373440	; 0x1b800000
   20024:	6d777020 	ldclvs	0, cr7, [r7, #-128]!	; 0xffffff80
   20028:	74756f20 	ldrbtvc	r6, [r5], #-3872	; 0xfffff0e0
   2002c:	20747570 	rsbscs	r7, r4, r0, ror r5
   20030:	68746977 	ldmdavs	r4!, {r0, r1, r2, r4, r5, r6, r8, fp, sp, lr}^
   20034:	61656420 	cmnvs	r5, r0, lsr #8
   20038:	6e6f7a64 	vnmulvs.f32	s15, s30, s9
   2003c:	69772065 	ldmdbvs	r7!, {r0, r2, r5, r6, sp}^
   20040:	62206874 	eorvs	r6, r0, #116, 16	; 0x740000
   20044:	6b616572 	blvs	1879614 <__StackTop+0x1857614>
   20048:	74656420 	strbtvc	r6, [r5], #-1056	; 0xfffffbe0
   2004c:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
   20050:	74206e6f 	strtvc	r6, [r0], #-3695	; 0xfffff191
   20054:	2e747365 	cdpcs	3, 7, cr7, cr4, cr5, {3}
   20058:	0a0d2e2e 	beq	36b918 <__StackTop+0x349918>
	...
   20088:	00000077 	andeq	r0, r0, r7, ror r0
   2008c:	000005c1 	andeq	r0, r0, r1, asr #11
   20090:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   20094:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   20098:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   2009c:	206d6974 	rsbcs	r6, sp, r4, ror r9
   200a0:	206c6c61 	rsbcs	r6, ip, r1, ror #24
   200a4:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   200a8:	736c656e 	cmnvc	ip, #461373440	; 0x1b800000
   200ac:	6d777020 	ldclvs	0, cr7, [r7, #-128]!	; 0xffffff80
   200b0:	69706720 	ldmdbvs	r0!, {r5, r8, r9, sl, sp, lr}^
   200b4:	756f206f 	strbvc	r2, [pc, #-111]!	; 2004d <g_advtim_menu+0x4d>
   200b8:	74757074 	ldrbtvc	r7, [r5], #-116	; 0xffffff8c
   200bc:	74697720 	strbtvc	r7, [r9], #-1824	; 0xfffff8e0
   200c0:	65642068 	strbvs	r2, [r4, #-104]!	; 0xffffff98
   200c4:	6f7a6461 	svcvs	0x007a6461
   200c8:	7720656e 	strvc	r6, [r0, -lr, ror #10]!
   200cc:	20687469 	rsbcs	r7, r8, r9, ror #8
   200d0:	61657262 	cmnvs	r5, r2, ror #4
   200d4:	6564206b 	strbvs	r2, [r4, #-107]!	; 0xffffff95
   200d8:	74636574 	strbtvc	r6, [r3], #-1396	; 0xfffffa8c
   200dc:	206e6f69 	rsbcs	r6, lr, r9, ror #30
   200e0:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
   200e4:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   200e8:	0000000a 	andeq	r0, r0, sl
	...
   20110:	00000065 	andeq	r0, r0, r5, rrx
   20114:	00000671 	andeq	r0, r0, r1, ror r6
   20118:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   2011c:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   20120:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   20124:	206d6974 	rsbcs	r6, sp, r4, ror r9
   20128:	206c6c61 	rsbcs	r6, ip, r1, ror #24
   2012c:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   20130:	736c656e 	cmnvc	ip, #461373440	; 0x1b800000
   20134:	20707520 	rsbscs	r7, r0, r0, lsr #10
   20138:	206d7770 	rsbcs	r7, sp, r0, ror r7
   2013c:	6f697067 	svcvs	0x00697067
   20140:	74756f20 	ldrbtvc	r6, [r5], #-3872	; 0xfffff0e0
   20144:	20747570 	rsbscs	r7, r4, r0, ror r5
   20148:	68746977 	ldmdavs	r4!, {r0, r1, r2, r4, r5, r6, r8, fp, sp, lr}^
   2014c:	61656420 	cmnvs	r5, r0, lsr #8
   20150:	6e6f7a64 	vnmulvs.f32	s15, s30, s9
   20154:	69772065 	ldmdbvs	r7!, {r0, r2, r5, r6, sp}^
   20158:	62206874 	eorvs	r6, r0, #116, 16	; 0x740000
   2015c:	6b616572 	blvs	187972c <__StackTop+0x185772c>
   20160:	74656420 	strbtvc	r6, [r5], #-1056	; 0xfffffbe0
   20164:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
   20168:	74206e6f 	strtvc	r6, [r0], #-3695	; 0xfffff191
   2016c:	2e747365 	cdpcs	3, 7, cr7, cr4, cr5, {3}
   20170:	0a0d2e2e 	beq	36ba30 <__StackTop+0x349a30>
	...
   20198:	00000072 	andeq	r0, r0, r2, ror r0
   2019c:	00000721 	andeq	r0, r0, r1, lsr #14
   201a0:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   201a4:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   201a8:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   201ac:	206d6974 	rsbcs	r6, sp, r4, ror r9
   201b0:	206c6c61 	rsbcs	r6, ip, r1, ror #24
   201b4:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   201b8:	736c656e 	cmnvc	ip, #461373440	; 0x1b800000
   201bc:	6d777020 	ldclvs	0, cr7, [r7, #-128]!	; 0xffffff80
   201c0:	676f6c20 	strbvs	r6, [pc, -r0, lsr #24]!
   201c4:	6f206369 	svcvs	0x00206369
   201c8:	75707475 	ldrbvc	r7, [r0, #-1141]!	; 0xfffffb8b
   201cc:	69772074 	ldmdbvs	r7!, {r2, r4, r5, r6, sp}^
   201d0:	64206874 	strtvs	r6, [r0], #-2164	; 0xfffff78c
   201d4:	7a646165 	bvc	1938770 <__StackTop+0x1916770>
   201d8:	20656e6f 	rsbcs	r6, r5, pc, ror #28
   201dc:	68746977 	ldmdavs	r4!, {r0, r1, r2, r4, r5, r6, r8, fp, sp, lr}^
   201e0:	65726220 	ldrbvs	r6, [r2, #-544]!	; 0xfffffde0
   201e4:	64206b61 	strtvs	r6, [r0], #-2913	; 0xfffff49f
   201e8:	63657465 	cmnvs	r5, #1694498816	; 0x65000000
   201ec:	6e6f6974 			; <UNDEFINED> instruction: 0x6e6f6974
   201f0:	73657420 	cmnvc	r5, #32, 8	; 0x20000000
   201f4:	2e2e2e74 	mcrcs	14, 1, r2, cr14, cr4, {3}
   201f8:	00000a0d 	andeq	r0, r0, sp, lsl #20
	...
   20220:	00000061 	andeq	r0, r0, r1, rrx
   20224:	000007b1 			; <UNDEFINED> instruction: 0x000007b1
   20228:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   2022c:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   20230:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   20234:	206d6974 	rsbcs	r6, sp, r4, ror r9
   20238:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   2023c:	316c656e 	cmncc	ip, lr, ror #10
   20240:	65747320 	ldrbvs	r7, [r4, #-800]!	; 0xfffffce0
   20244:	6e692070 	mcrvs	0, 3, r2, cr9, cr0, {3}
   20248:	20747570 	rsbscs	r7, r4, r0, ror r5
   2024c:	74706163 	ldrbtvc	r6, [r0], #-355	; 0xfffffe9d
   20250:	20657275 	rsbcs	r7, r5, r5, ror r2
   20254:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
   20258:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   2025c:	0000000a 	andeq	r0, r0, sl
	...
   202a8:	00000073 	andeq	r0, r0, r3, ror r0
   202ac:	00000831 	andeq	r0, r0, r1, lsr r8
   202b0:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   202b4:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   202b8:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   202bc:	206d6974 	rsbcs	r6, sp, r4, ror r9
   202c0:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   202c4:	316c656e 	cmncc	ip, lr, ror #10
   202c8:	6d777020 	ldclvs	0, cr7, [r7, #-128]!	; 0xffffff80
   202cc:	706e6920 	rsbvc	r6, lr, r0, lsr #18
   202d0:	63207475 			; <UNDEFINED> instruction: 0x63207475
   202d4:	75747061 	ldrbvc	r7, [r4, #-97]!	; 0xffffff9f
   202d8:	74206572 	strtvc	r6, [r0], #-1394	; 0xfffffa8e
   202dc:	2e747365 	cdpcs	3, 7, cr7, cr4, cr5, {3}
   202e0:	0a0d2e2e 	beq	36bba0 <__StackTop+0x349ba0>
	...
   20330:	00000064 	andeq	r0, r0, r4, rrx
   20334:	000008b1 			; <UNDEFINED> instruction: 0x000008b1
   20338:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   2033c:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   20340:	76646120 	strbtvc	r6, [r4], -r0, lsr #2
   20344:	206d6974 	rsbcs	r6, sp, r4, ror r9
   20348:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
   2034c:	316c656e 	cmncc	ip, lr, ror #10
   20350:	636e6520 	cmnvs	lr, #32, 10	; 0x8000000
   20354:	7265646f 	rsbvc	r6, r5, #1862270976	; 0x6f000000
   20358:	706e6920 	rsbvc	r6, lr, r0, lsr #18
   2035c:	64207475 	strtvs	r7, [r0], #-1141	; 0xfffffb8b
   20360:	63657269 	cmnvs	r5, #-1879048186	; 0x90000006
   20364:	6f622074 	svcvs	0x00622074
   20368:	65206874 	strvs	r6, [r0, #-2164]!	; 0xfffff78c
   2036c:	20656764 	rsbcs	r6, r5, r4, ror #14
   20370:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
   20374:	0d2e2e2e 	stceq	14, cr2, [lr, #-184]!	; 0xffffff48
   20378:	0000000a 	andeq	r0, r0, sl
	...

000203b8 <g_mcu_menu>:
   203b8:	00000035 	andeq	r0, r0, r5, lsr r0
   203bc:	00000a91 	muleq	r0, r1, sl
   203c0:	5644415b 			; <UNDEFINED> instruction: 0x5644415b
   203c4:	5d4d4954 	vstrpl.16	s9, [sp, #-168]	; 0xffffff58	; <UNPREDICTABLE>
   203c8:	73657420 	cmnvc	r5, #32, 8	; 0x20000000
   203cc:	656d2074 	strbvs	r2, [sp, #-116]!	; 0xffffff8c
   203d0:	0a0d756e 	beq	37d990 <__StackTop+0x35b990>
	...
   20440:	00000030 	andeq	r0, r0, r0, lsr r0
   20444:	00001625 	andeq	r1, r0, r5, lsr #12
   20448:	55434d5b 	strbpl	r4, [r3, #-3419]	; 0xfffff2a5
   2044c:	6574205d 	ldrbvs	r2, [r4, #-93]!	; 0xffffffa3
   20450:	6d207473 	cfstrsvs	mvf7, [r0, #-460]!	; 0xfffffe34
   20454:	0d756e65 	ldcleq	14, cr6, [r5, #-404]!	; 0xfffffe6c
   20458:	0000000a 	andeq	r0, r0, sl
	...

000204c8 <_impure_ptr>:
   204c8:	000204cc 	andeq	r0, r2, ip, asr #9

000204cc <impure_data>:
	...

0002052c <__frame_dummy_init_array_entry>:
   2052c:	000000b1 	strheq	r0, [r0], -r1

00020530 <__do_global_dtors_aux_fini_array_entry>:
   20530:	0000008d 	andeq	r0, r0, sp, lsl #1

Disassembly of section .bss:

00020534 <__bss_start__>:
   20534:	00000000 	andeq	r0, r0, r0

00020538 <object.0>:
	...

00020550 <hadvtim>:
	...

000205c0 <advtim_case_flag>:
	...

000205c2 <advtim_int_flag>:
	...

000205c4 <advtim_int_flag1>:
	...

000205c5 <advtim_int_flag2>:
	...

000205c6 <advtim_int_flag3>:
	...

000205c7 <advtim_temp>:
	...

000205c8 <huart0>:
	...

000205e4 <__malloc_free_list>:
   205e4:	00000000 	andeq	r0, r0, r0

000205e8 <__malloc_sbrk_start>:
   205e8:	00000000 	andeq	r0, r0, r0

000205ec <errno>:
   205ec:	00000000 	andeq	r0, r0, r0

000205f0 <__lock___malloc_recursive_mutex>:
   205f0:	00000000 	andeq	r0, r0, r0

000205f4 <heap_end.0>:
   205f4:	00000000 	andeq	r0, r0, r0

Disassembly of section .stack_dummy:

000205f8 <__HeapBase>:
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
  18:	00001718 	andeq	r1, r0, r8, lsl r7
  1c:	00000028 	andeq	r0, r0, r8, lsr #32
  20:	83080e41 	movwhi	r0, #36417	; 0x8e41
  24:	00018e02 	andeq	r8, r1, r2, lsl #28
  28:	0000000c 	andeq	r0, r0, ip
  2c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  30:	7c020001 	stcvc	0, cr0, [r2], {1}
  34:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  38:	00000018 	andeq	r0, r0, r8, lsl r0
  3c:	00000028 	andeq	r0, r0, r8, lsr #32
  40:	00001750 	andeq	r1, r0, r0, asr r7
  44:	0000002c 	andeq	r0, r0, ip, lsr #32
  48:	8e040e41 	cdphi	14, 0, cr0, cr4, cr1, {2}
  4c:	700e4101 	andvc	r4, lr, r1, lsl #2
  50:	00040e4f 	andeq	r0, r4, pc, asr #28
  54:	0000000c 	andeq	r0, r0, ip
  58:	00000028 	andeq	r0, r0, r8, lsr #32
  5c:	0000177c 	andeq	r1, r0, ip, ror r7
  60:	00000014 	andeq	r0, r0, r4, lsl r0
  64:	0000000c 	andeq	r0, r0, ip
  68:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  6c:	7c020001 	stcvc	0, cr0, [r2], {1}
  70:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  74:	00000020 	andeq	r0, r0, r0, lsr #32
  78:	00000064 	andeq	r0, r0, r4, rrx
  7c:	00001790 	muleq	r0, r0, r7
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
  cc:	00001848 	andeq	r1, r0, r8, asr #16
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
 10c:	00001a48 	andeq	r1, r0, r8, asr #20
 110:	000000de 	ldrdeq	r0, [r0], -lr
 114:	84200e42 	strthi	r0, [r0], #-3650	; 0xfffff1be
 118:	86078508 	strhi	r8, [r7], -r8, lsl #10
 11c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 120:	8a038904 	bhi	e2538 <__StackTop+0xc0538>
 124:	00018e02 	andeq	r8, r1, r2, lsl #28
 128:	00000028 	andeq	r0, r0, r8, lsr #32
 12c:	000000f4 	strdeq	r0, [r0], -r4
 130:	00001b28 	andeq	r1, r0, r8, lsr #22
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
 16c:	00001d74 	andeq	r1, r0, r4, ror sp
 170:	0000001c 	andeq	r0, r0, ip, lsl r0
 174:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 178:	00018e02 	andeq	r8, r1, r2, lsl #28
 17c:	0000000c 	andeq	r0, r0, ip
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	7c020001 	stcvc	0, cr0, [r2], {1}
 188:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 18c:	00000014 	andeq	r0, r0, r4, lsl r0
 190:	0000017c 	andeq	r0, r0, ip, ror r1
 194:	00001d90 	muleq	r0, r0, sp
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	84080e47 	strhi	r0, [r8], #-3655	; 0xfffff1b9
 1a0:	00018e02 	andeq	r8, r1, r2, lsl #28
 1a4:	0000000c 	andeq	r0, r0, ip
 1a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 1b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1b4:	00000014 	andeq	r0, r0, r4, lsl r0
 1b8:	000001a4 	andeq	r0, r0, r4, lsr #3
 1bc:	00001dac 	andeq	r1, r0, ip, lsr #27
 1c0:	00000034 	andeq	r0, r0, r4, lsr r0
 1c4:	84080e42 	strhi	r0, [r8], #-3650	; 0xfffff1be
 1c8:	00018e02 	andeq	r8, r1, r2, lsl #28
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1d4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1d8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1dc:	00000024 	andeq	r0, r0, r4, lsr #32
 1e0:	000001cc 	andeq	r0, r0, ip, asr #3
 1e4:	00001de0 	andeq	r1, r0, r0, ror #27
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
 21c:	00001e70 	andeq	r1, r0, r0, ror lr
 220:	00000040 	andeq	r0, r0, r0, asr #32
 224:	84100e41 	ldrhi	r0, [r0], #-3649	; 0xfffff1bf
 228:	86038504 	strhi	r8, [r3], -r4, lsl #10
 22c:	00018e02 	andeq	r8, r1, r2, lsl #28
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	00000204 	andeq	r0, r0, r4, lsl #4
 238:	00001eb0 			; <UNDEFINED> instruction: 0x00001eb0
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
 268:	00001f98 	muleq	r0, r8, pc	; <UNPREDICTABLE>
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
 2a4:	00001ff8 	strdeq	r1, [r0], -r8
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
 2d0:	00002018 	andeq	r2, r0, r8, lsl r0
 2d4:	0000000c 	andeq	r0, r0, ip
 2d8:	0000000c 	andeq	r0, r0, ip
 2dc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2e0:	00002024 	andeq	r2, r0, r4, lsr #32
 2e4:	0000000c 	andeq	r0, r0, ip
 2e8:	0000000c 	andeq	r0, r0, ip
 2ec:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2f0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2f4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f8:	0000000c 	andeq	r0, r0, ip
 2fc:	000002e8 	andeq	r0, r0, r8, ror #5
 300:	00002030 	andeq	r2, r0, r0, lsr r0
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
 3cc:	00002040 	andeq	r2, r0, r0, asr #32
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
 40c:	00002042 	andeq	r2, r0, r2, asr #32
 410:	00000002 	andeq	r0, r0, r2
 414:	0000000c 	andeq	r0, r0, ip
 418:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 41c:	7c020001 	stcvc	0, cr0, [r2], {1}
 420:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 424:	0000000c 	andeq	r0, r0, ip
 428:	00000414 	andeq	r0, r0, r4, lsl r4
 42c:	00002044 	andeq	r2, r0, r4, asr #32
 430:	0000001c 	andeq	r0, r0, ip, lsl r0
 434:	0000000c 	andeq	r0, r0, ip
 438:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 43c:	7c020001 	stcvc	0, cr0, [r2], {1}
 440:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 444:	0000000c 	andeq	r0, r0, ip
 448:	00000434 	andeq	r0, r0, r4, lsr r4
 44c:	00002060 	andeq	r2, r0, r0, rrx
 450:	00000002 	andeq	r0, r0, r2

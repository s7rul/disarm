
inc:	file format elf32-littlearm

Disassembly of section .text:

000000b8 <__stext>:
      b8: 0b 4c        	ldr	r4, [pc, #44]           @ 0xe8 <$d>
      ba: a6 46        	mov	lr, r4
      bc: 00 f0 ed fa  	bl	0x69a <__pre_init>      @ imm = #1498
      c0: a6 46        	mov	lr, r4
      c2: 0a 48        	ldr	r0, [pc, #40]           @ 0xec <$d+0x4>
      c4: 0a 49        	ldr	r1, [pc, #40]           @ 0xf0 <$d+0x8>
      c6: 00 22        	movs	r2, #0
      c8: 81 42        	cmp	r1, r0
      ca: 01 d0        	beq	0xd0 <__stext+0x18>     @ imm = #2
      cc: 04 c0        	stm	r0!, {r2}
      ce: fb e7        	b	0xc8 <__stext+0x10>     @ imm = #-10
      d0: 08 48        	ldr	r0, [pc, #32]           @ 0xf4 <$d+0xc>
      d2: 09 49        	ldr	r1, [pc, #36]           @ 0xf8 <$d+0x10>
      d4: 09 4a        	ldr	r2, [pc, #36]           @ 0xfc <$d+0x14>
      d6: 81 42        	cmp	r1, r0
      d8: 02 d0        	beq	0xe0 <__stext+0x28>     @ imm = #4
      da: 08 ca        	ldm	r2!, {r3}
      dc: 08 c0        	stm	r0!, {r3}
      de: fa e7        	b	0xd6 <__stext+0x1e>     @ imm = #-12
      e0: 00 b5        	push	{lr}
      e2: 00 f0 18 f8  	bl	0x116 <main>            @ imm = #48
      e6: 00 de        	udf	#0

000000e8 <$d>:
      e8:	ff ff ff ff	.word	0xffffffff
      ec:	00 00 00 20	.word	0x20000000
      f0:	08 00 00 20	.word	0x20000008
      f4:	00 00 00 20	.word	0x20000000
      f8:	00 00 00 20	.word	0x20000000
      fc:	e4 0a 00 00	.word	0x00000ae4

00000100 <inc_function>:
     100: 40 1c        	adds	r0, r0, #1
     102: 70 47        	bx	lr

00000104 <cond_function>:
     104: 0a 28        	cmp	r0, #10
     106: 02 d8        	bhi	0x10e <cond_function+0xa> @ imm = #4
     108: 01 21        	movs	r1, #1
     10a: 08 18        	adds	r0, r1, r0
     10c: 70 47        	bx	lr
     10e: 00 21        	movs	r1, #0
     110: c9 43        	mvns	r1, r1
     112: 08 18        	adds	r0, r1, r0
     114: 70 47        	bx	lr

00000116 <main>:
     116: 80 b5        	push	{r7, lr}
     118: 00 af        	add	r7, sp, #0
     11a: 00 f0 01 f8  	bl	0x120 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4> @ imm = #2
     11e: fe de        	trap

00000120 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4>:
     120: 80 b5        	push	{r7, lr}
     122: 00 af        	add	r7, sp, #0
     124: 8a b0        	sub	sp, #40
     126: 01 24        	movs	r4, #1
     128: 20 46        	mov	r0, r4
     12a: ff f7 e9 ff  	bl	0x100 <inc_function>    @ imm = #-46
     12e: 02 90        	str	r0, [sp, #8]
     130: 4b 48        	ldr	r0, [pc, #300]          @ 0x260 <$d.4>
     132: 01 90        	str	r0, [sp, #4]
     134: 02 a8        	add	r0, sp, #8
     136: 00 90        	str	r0, [sp]
     138: 00 f0 61 fb  	bl	0x7fe <__primask_r>     @ imm = #1730
     13c: 05 46        	mov	r5, r0
     13e: 25 40        	ands	r5, r4
     140: 00 f0 59 fb  	bl	0x7f6 <__cpsid>         @ imm = #1714
     144: 47 4e        	ldr	r6, [pc, #284]          @ 0x264 <$d.4+0x4>
     146: 30 68        	ldr	r0, [r6]
     148: 01 28        	cmp	r0, #1
     14a: 0c d0        	beq	0x166 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x46> @ imm = #24
     14c: 03 20        	movs	r0, #3
     14e: 06 90        	str	r0, [sp, #24]
     150: 04 20        	movs	r0, #4
     152: 05 90        	str	r0, [sp, #20]
     154: 44 48        	ldr	r0, [pc, #272]          @ 0x268 <$d.4+0x8>
     156: 04 90        	str	r0, [sp, #16]
     158: 04 a9        	add	r1, sp, #16
     15a: 20 46        	mov	r0, r4
     15c: ab be        	bkpt	#171
     15e: 41 1c        	adds	r1, r0, #1
     160: 11 d0        	beq	0x186 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x66> @ imm = #34
     162: 34 60        	str	r4, [r6]
     164: 70 60        	str	r0, [r6, #4]
     166: 30 1d        	adds	r0, r6, #4
     168: 03 90        	str	r0, [sp, #12]
     16a: 09 94        	str	r4, [sp, #36]
     16c: 68 46        	mov	r0, sp
     16e: 08 90        	str	r0, [sp, #32]
     170: 00 20        	movs	r0, #0
     172: 07 90        	str	r0, [sp, #28]
     174: 06 90        	str	r0, [sp, #24]
     176: 02 20        	movs	r0, #2
     178: 05 90        	str	r0, [sp, #20]
     17a: 3c 48        	ldr	r0, [pc, #240]          @ 0x26c <$d.4+0xc>
     17c: 04 90        	str	r0, [sp, #16]
     17e: 03 a8        	add	r0, sp, #12
     180: 04 a9        	add	r1, sp, #16
     182: 00 f0 d7 f9  	bl	0x534 <core::fmt::write::he9beb2966ab2d949> @ imm = #942
     186: 00 2d        	cmp	r5, #0
     188: 01 d1        	bne	0x18e <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x6e> @ imm = #2
     18a: 00 f0 36 fb  	bl	0x7fa <__cpsie>         @ imm = #1644
     18e: 20 46        	mov	r0, r4
     190: ff f7 b8 ff  	bl	0x104 <cond_function>   @ imm = #-144
     194: 02 90        	str	r0, [sp, #8]
     196: 32 48        	ldr	r0, [pc, #200]          @ 0x260 <$d.4>
     198: 01 90        	str	r0, [sp, #4]
     19a: 02 a8        	add	r0, sp, #8
     19c: 00 90        	str	r0, [sp]
     19e: 00 f0 2e fb  	bl	0x7fe <__primask_r>     @ imm = #1628
     1a2: 05 46        	mov	r5, r0
     1a4: 25 40        	ands	r5, r4
     1a6: 00 f0 26 fb  	bl	0x7f6 <__cpsid>         @ imm = #1612
     1aa: 30 68        	ldr	r0, [r6]
     1ac: 01 28        	cmp	r0, #1
     1ae: 0c d0        	beq	0x1ca <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xaa> @ imm = #24
     1b0: 03 20        	movs	r0, #3
     1b2: 06 90        	str	r0, [sp, #24]
     1b4: 04 20        	movs	r0, #4
     1b6: 05 90        	str	r0, [sp, #20]
     1b8: 2b 48        	ldr	r0, [pc, #172]          @ 0x268 <$d.4+0x8>
     1ba: 04 90        	str	r0, [sp, #16]
     1bc: 04 a9        	add	r1, sp, #16
     1be: 20 46        	mov	r0, r4
     1c0: ab be        	bkpt	#171
     1c2: 41 1c        	adds	r1, r0, #1
     1c4: 11 d0        	beq	0x1ea <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xca> @ imm = #34
     1c6: 34 60        	str	r4, [r6]
     1c8: 70 60        	str	r0, [r6, #4]
     1ca: 30 1d        	adds	r0, r6, #4
     1cc: 03 90        	str	r0, [sp, #12]
     1ce: 09 94        	str	r4, [sp, #36]
     1d0: 68 46        	mov	r0, sp
     1d2: 08 90        	str	r0, [sp, #32]
     1d4: 00 20        	movs	r0, #0
     1d6: 07 90        	str	r0, [sp, #28]
     1d8: 06 90        	str	r0, [sp, #24]
     1da: 02 20        	movs	r0, #2
     1dc: 05 90        	str	r0, [sp, #20]
     1de: 24 48        	ldr	r0, [pc, #144]          @ 0x270 <$d.4+0x10>
     1e0: 04 90        	str	r0, [sp, #16]
     1e2: 03 a8        	add	r0, sp, #12
     1e4: 04 a9        	add	r1, sp, #16
     1e6: 00 f0 a5 f9  	bl	0x534 <core::fmt::write::he9beb2966ab2d949> @ imm = #842
     1ea: 00 2d        	cmp	r5, #0
     1ec: 01 d1        	bne	0x1f2 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xd2> @ imm = #2
     1ee: 00 f0 04 fb  	bl	0x7fa <__cpsie>         @ imm = #1544
     1f2: 0b 20        	movs	r0, #11
     1f4: ff f7 86 ff  	bl	0x104 <cond_function>   @ imm = #-244
     1f8: 02 90        	str	r0, [sp, #8]
     1fa: 19 48        	ldr	r0, [pc, #100]          @ 0x260 <$d.4>
     1fc: 01 90        	str	r0, [sp, #4]
     1fe: 02 a8        	add	r0, sp, #8
     200: 00 90        	str	r0, [sp]
     202: 00 f0 fc fa  	bl	0x7fe <__primask_r>     @ imm = #1528
     206: 05 46        	mov	r5, r0
     208: 25 40        	ands	r5, r4
     20a: 00 f0 f4 fa  	bl	0x7f6 <__cpsid>         @ imm = #1512
     20e: 30 68        	ldr	r0, [r6]
     210: 01 28        	cmp	r0, #1
     212: 0c d0        	beq	0x22e <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x10e> @ imm = #24
     214: 03 20        	movs	r0, #3
     216: 06 90        	str	r0, [sp, #24]
     218: 04 20        	movs	r0, #4
     21a: 05 90        	str	r0, [sp, #20]
     21c: 12 48        	ldr	r0, [pc, #72]           @ 0x268 <$d.4+0x8>
     21e: 04 90        	str	r0, [sp, #16]
     220: 04 a9        	add	r1, sp, #16
     222: 20 46        	mov	r0, r4
     224: ab be        	bkpt	#171
     226: 41 1c        	adds	r1, r0, #1
     228: 11 d0        	beq	0x24e <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x12e> @ imm = #34
     22a: 34 60        	str	r4, [r6]
     22c: 70 60        	str	r0, [r6, #4]
     22e: 30 1d        	adds	r0, r6, #4
     230: 03 90        	str	r0, [sp, #12]
     232: 09 94        	str	r4, [sp, #36]
     234: 68 46        	mov	r0, sp
     236: 08 90        	str	r0, [sp, #32]
     238: 00 20        	movs	r0, #0
     23a: 07 90        	str	r0, [sp, #28]
     23c: 06 90        	str	r0, [sp, #24]
     23e: 02 20        	movs	r0, #2
     240: 05 90        	str	r0, [sp, #20]
     242: 0c 48        	ldr	r0, [pc, #48]           @ 0x274 <$d.4+0x14>
     244: 04 90        	str	r0, [sp, #16]
     246: 03 a8        	add	r0, sp, #12
     248: 04 a9        	add	r1, sp, #16
     24a: 00 f0 73 f9  	bl	0x534 <core::fmt::write::he9beb2966ab2d949> @ imm = #742
     24e: 00 2d        	cmp	r5, #0
     250: 01 d1        	bne	0x256 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x136> @ imm = #2
     252: 00 f0 d2 fa  	bl	0x7fa <__cpsie>         @ imm = #1444
     256: 18 20        	movs	r0, #24
     258: 07 49        	ldr	r1, [pc, #28]           @ 0x278 <$d.4+0x18>
     25a: ab be        	bkpt	#171
     25c: fe e7        	b	0x25c <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x13c> @ imm = #-4
     25e: c0 46        	mov	r8, r8

00000260 <$d.4>:
     260:	81 02 00 00	.word	0x00000281
     264:	00 00 00 20	.word	0x20000000
     268:	e0 0a 00 00	.word	0x00000ae0
     26c:	b8 09 00 00	.word	0x000009b8
     270:	d4 09 00 00	.word	0x000009d4
     274:	f0 09 00 00	.word	0x000009f0
     278:	26 00 02 00	.word	0x00020026

0000027c <core::ops::function::FnOnce::call_once::hfdbdf61b6267721c>:
     27c: 00 68        	ldr	r0, [r0]
     27e: fe e7        	b	0x27e <core::ops::function::FnOnce::call_once::hfdbdf61b6267721c+0x2> @ imm = #-4

00000280 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc>:
     280: f0 b5        	push	{r4, r5, r6, r7, lr}
     282: 03 af        	add	r7, sp, #12
     284: 93 b0        	sub	sp, #76
     286: 06 91        	str	r1, [sp, #24]
     288: 02 68        	ldr	r2, [r0]
     28a: 95 49        	ldr	r1, [pc, #596]          @ 0x4e0 <$d.7>
     28c: 27 25        	movs	r5, #39
     28e: 8a 42        	cmp	r2, r1
     290: 2d d3        	blo	0x2ee <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x6e> @ imm = #90
     292: 14 46        	mov	r4, r2
     294: 08 95        	str	r5, [sp, #32]
     296: 20 46        	mov	r0, r4
     298: 91 49        	ldr	r1, [pc, #580]          @ 0x4e0 <$d.7>
     29a: 00 f0 b3 fa  	bl	0x804 <__aeabi_uidiv>   @ imm = #1382
     29e: 07 90        	str	r0, [sp, #28]
     2a0: 91 49        	ldr	r1, [pc, #580]          @ 0x4e8 <$d.7+0x8>
     2a2: 41 43        	muls	r1, r0, r1
     2a4: 09 19        	adds	r1, r1, r4
     2a6: 8a b2        	uxth	r2, r1
     2a8: 92 08        	lsrs	r2, r2, #2
     2aa: 90 48        	ldr	r0, [pc, #576]          @ 0x4ec <$d.7+0xc>
     2ac: 42 43        	muls	r2, r0, r2
     2ae: 52 0c        	lsrs	r2, r2, #17
     2b0: 53 00        	lsls	r3, r2, #1
     2b2: 8f 48        	ldr	r0, [pc, #572]          @ 0x4f0 <$d.7+0x10>
     2b4: c0 5c        	ldrb	r0, [r0, r3]
     2b6: 09 ae        	add	r6, sp, #36
     2b8: 76 19        	adds	r6, r6, r5
     2ba: 35 1f        	subs	r5, r6, #4
     2bc: 28 70        	strb	r0, [r5]
     2be: 8c 48        	ldr	r0, [pc, #560]          @ 0x4f0 <$d.7+0x10>
     2c0: c0 18        	adds	r0, r0, r3
     2c2: 40 78        	ldrb	r0, [r0, #1]
     2c4: 68 70        	strb	r0, [r5, #1]
     2c6: 08 9d        	ldr	r5, [sp, #32]
     2c8: 86 48        	ldr	r0, [pc, #536]          @ 0x4e4 <$d.7+0x4>
     2ca: 42 43        	muls	r2, r0, r2
     2cc: 50 18        	adds	r0, r2, r1
     2ce: 80 b2        	uxth	r0, r0
     2d0: 40 00        	lsls	r0, r0, #1
     2d2: 87 4a        	ldr	r2, [pc, #540]          @ 0x4f0 <$d.7+0x10>
     2d4: 11 5c        	ldrb	r1, [r2, r0]
     2d6: 13 46        	mov	r3, r2
     2d8: b2 1e        	subs	r2, r6, #2
     2da: 11 70        	strb	r1, [r2]
     2dc: 18 18        	adds	r0, r3, r0
     2de: 40 78        	ldrb	r0, [r0, #1]
     2e0: 50 70        	strb	r0, [r2, #1]
     2e2: 07 9a        	ldr	r2, [sp, #28]
     2e4: 2d 1f        	subs	r5, r5, #4
     2e6: 83 48        	ldr	r0, [pc, #524]          @ 0x4f4 <$d.7+0x14>
     2e8: 84 42        	cmp	r4, r0
     2ea: 14 46        	mov	r4, r2
     2ec: d2 d8        	bhi	0x294 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x14> @ imm = #-92
     2ee: 63 2a        	cmp	r2, #99
     2f0: 23 d9        	bls	0x33a <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xba> @ imm = #70
     2f2: 90 b2        	uxth	r0, r2
     2f4: 80 08        	lsrs	r0, r0, #2
     2f6: 7d 49        	ldr	r1, [pc, #500]          @ 0x4ec <$d.7+0xc>
     2f8: 41 43        	muls	r1, r0, r1
     2fa: 49 0c        	lsrs	r1, r1, #17
     2fc: 63 20        	movs	r0, #99
     2fe: c0 43        	mvns	r0, r0
     300: 48 43        	muls	r0, r1, r0
     302: 80 18        	adds	r0, r0, r2
     304: 80 b2        	uxth	r0, r0
     306: 40 00        	lsls	r0, r0, #1
     308: 79 4a        	ldr	r2, [pc, #484]          @ 0x4f0 <$d.7+0x10>
     30a: 13 5c        	ldrb	r3, [r2, r0]
     30c: ad 1e        	subs	r5, r5, #2
     30e: 09 ac        	add	r4, sp, #36
     310: 63 55        	strb	r3, [r4, r5]
     312: 2e 46        	mov	r6, r5
     314: 63 19        	adds	r3, r4, r5
     316: 10 18        	adds	r0, r2, r0
     318: 40 78        	ldrb	r0, [r0, #1]
     31a: 58 70        	strb	r0, [r3, #1]
     31c: 0a 29        	cmp	r1, #10
     31e: 06 9d        	ldr	r5, [sp, #24]
     320: 10 d3        	blo	0x344 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xc4> @ imm = #32
     322: 48 00        	lsls	r0, r1, #1
     324: 72 49        	ldr	r1, [pc, #456]          @ 0x4f0 <$d.7+0x10>
     326: 0a 5c        	ldrb	r2, [r1, r0]
     328: b4 1e        	subs	r4, r6, #2
     32a: 09 ab        	add	r3, sp, #36
     32c: 1a 55        	strb	r2, [r3, r4]
     32e: 08 94        	str	r4, [sp, #32]
     330: 1a 19        	adds	r2, r3, r4
     332: 08 18        	adds	r0, r1, r0
     334: 40 78        	ldrb	r0, [r0, #1]
     336: 50 70        	strb	r0, [r2, #1]
     338: 09 e0        	b	0x34e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xce> @ imm = #18
     33a: 2e 46        	mov	r6, r5
     33c: 11 46        	mov	r1, r2
     33e: 0a 29        	cmp	r1, #10
     340: 06 9d        	ldr	r5, [sp, #24]
     342: ee d2        	bhs	0x322 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xa2> @ imm = #-36
     344: 72 1e        	subs	r2, r6, #1
     346: 30 31        	adds	r1, #48
     348: 09 a8        	add	r0, sp, #36
     34a: 08 92        	str	r2, [sp, #32]
     34c: 81 54        	strb	r1, [r0, r2]
     34e: 27 21        	movs	r1, #39
     350: 28 68        	ldr	r0, [r5]
     352: 01 22        	movs	r2, #1
     354: 06 46        	mov	r6, r0
     356: 05 92        	str	r2, [sp, #20]
     358: 16 40        	ands	r6, r2
     35a: 11 22        	movs	r2, #17
     35c: 13 04        	lsls	r3, r2, #16
     35e: 00 2e        	cmp	r6, #0
     360: 02 93        	str	r3, [sp, #8]
     362: 00 d0        	beq	0x366 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xe6> @ imm = #0
     364: 2b 23        	movs	r3, #43
     366: 08 9a        	ldr	r2, [sp, #32]
     368: 8c 1a        	subs	r4, r1, r2
     36a: 09 a9        	add	r1, sp, #36
     36c: 89 18        	adds	r1, r1, r2
     36e: 04 91        	str	r1, [sp, #16]
     370: 41 07        	lsls	r1, r0, #29
     372: c9 17        	asrs	r1, r1, #31
     374: 60 4a        	ldr	r2, [pc, #384]          @ 0x4f8 <$d.7+0x18>
     376: 0a 40        	ands	r2, r1
     378: 06 9d        	ldr	r5, [sp, #24]
     37a: a9 68        	ldr	r1, [r5, #8]
     37c: 00 29        	cmp	r1, #0
     37e: 19 d0        	beq	0x3b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x134> @ imm = #50
     380: 03 92        	str	r2, [sp, #12]
     382: a1 19        	adds	r1, r4, r6
     384: ea 68        	ldr	r2, [r5, #12]
     386: 8a 42        	cmp	r2, r1
     388: 1d d9        	bls	0x3c6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x146> @ imm = #58
     38a: 07 92        	str	r2, [sp, #28]
     38c: 01 94        	str	r4, [sp, #4]
     38e: 00 07        	lsls	r0, r0, #28
     390: 2a d4        	bmi	0x3e8 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x168> @ imm = #84
     392: 1d 46        	mov	r5, r3
     394: 20 20        	movs	r0, #32
     396: 06 9b        	ldr	r3, [sp, #24]
     398: 1a 5c        	ldrb	r2, [r3, r0]
     39a: 03 2a        	cmp	r2, #3
     39c: 00 d1        	bne	0x3a0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x120> @ imm = #0
     39e: 01 22        	movs	r2, #1
     3a0: 07 98        	ldr	r0, [sp, #28]
     3a2: 40 1a        	subs	r0, r0, r1
     3a4: 91 07        	lsls	r1, r2, #30
     3a6: 44 d0        	beq	0x432 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1b2> @ imm = #136
     3a8: 01 2a        	cmp	r2, #1
     3aa: 44 d1        	bne	0x436 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1b6> @ imm = #136
     3ac: 00 21        	movs	r1, #0
     3ae: 00 91        	str	r1, [sp]
     3b0: 01 46        	mov	r1, r0
     3b2: 44 e0        	b	0x43e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1be> @ imm = #136
     3b4: 28 46        	mov	r0, r5
     3b6: 19 46        	mov	r1, r3
     3b8: 00 f0 a0 f8  	bl	0x4fc <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #320
     3bc: 00 28        	cmp	r0, #0
     3be: 09 d0        	beq	0x3d4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x154> @ imm = #18
     3c0: 05 98        	ldr	r0, [sp, #20]
     3c2: 13 b0        	add	sp, #76
     3c4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     3c6: 28 46        	mov	r0, r5
     3c8: 19 46        	mov	r1, r3
     3ca: 03 9a        	ldr	r2, [sp, #12]
     3cc: 00 f0 96 f8  	bl	0x4fc <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #300
     3d0: 00 28        	cmp	r0, #0
     3d2: f5 d1        	bne	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-22
     3d4: a8 69        	ldr	r0, [r5, #24]
     3d6: e9 69        	ldr	r1, [r5, #28]
     3d8: cb 68        	ldr	r3, [r1, #12]
     3da: 04 99        	ldr	r1, [sp, #16]
     3dc: 22 46        	mov	r2, r4
     3de: 98 47        	blx	r3
     3e0: 05 90        	str	r0, [sp, #20]
     3e2: 05 98        	ldr	r0, [sp, #20]
     3e4: 13 b0        	add	sp, #76
     3e6: f0 bd        	pop	{r4, r5, r6, r7, pc}
     3e8: 20 20        	movs	r0, #32
     3ea: 06 9d        	ldr	r5, [sp, #24]
     3ec: 2c 5c        	ldrb	r4, [r5, r0]
     3ee: 01 21        	movs	r1, #1
     3f0: 05 91        	str	r1, [sp, #20]
     3f2: 29 54        	strb	r1, [r5, r0]
     3f4: 68 68        	ldr	r0, [r5, #4]
     3f6: 02 90        	str	r0, [sp, #8]
     3f8: 30 20        	movs	r0, #48
     3fa: 68 60        	str	r0, [r5, #4]
     3fc: 28 46        	mov	r0, r5
     3fe: 19 46        	mov	r1, r3
     400: 03 9a        	ldr	r2, [sp, #12]
     402: 00 f0 7b f8  	bl	0x4fc <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #246
     406: 00 28        	cmp	r0, #0
     408: da d1        	bne	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-76
     40a: 03 94        	str	r4, [sp, #12]
     40c: 28 46        	mov	r0, r5
     40e: 20 30        	adds	r0, #32
     410: 00 90        	str	r0, [sp]
     412: 08 98        	ldr	r0, [sp, #32]
     414: 07 99        	ldr	r1, [sp, #28]
     416: 40 18        	adds	r0, r0, r1
     418: 86 1b        	subs	r6, r0, r6
     41a: 26 3e        	subs	r6, #38
     41c: ac 69        	ldr	r4, [r5, #24]
     41e: ed 69        	ldr	r5, [r5, #28]
     420: 76 1e        	subs	r6, r6, #1
     422: 42 d0        	beq	0x4aa <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x22a> @ imm = #132
     424: 2a 69        	ldr	r2, [r5, #16]
     426: 30 21        	movs	r1, #48
     428: 20 46        	mov	r0, r4
     42a: 90 47        	blx	r2
     42c: 00 28        	cmp	r0, #0
     42e: f7 d0        	beq	0x420 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1a0> @ imm = #-18
     430: c6 e7        	b	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-116
     432: 00 21        	movs	r1, #0
     434: 02 e0        	b	0x43c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1bc> @ imm = #4
     436: 41 08        	lsrs	r1, r0, #1
     438: 40 1c        	adds	r0, r0, #1
     43a: 40 08        	lsrs	r0, r0, #1
     43c: 00 90        	str	r0, [sp]
     43e: 4c 1c        	adds	r4, r1, #1
     440: 5e 68        	ldr	r6, [r3, #4]
     442: 98 69        	ldr	r0, [r3, #24]
     444: 08 90        	str	r0, [sp, #32]
     446: d8 69        	ldr	r0, [r3, #28]
     448: 07 90        	str	r0, [sp, #28]
     44a: 01 20        	movs	r0, #1
     44c: 05 90        	str	r0, [sp, #20]
     44e: 64 1e        	subs	r4, r4, #1
     450: 07 d0        	beq	0x462 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1e2> @ imm = #14
     452: 07 98        	ldr	r0, [sp, #28]
     454: 02 69        	ldr	r2, [r0, #16]
     456: 08 98        	ldr	r0, [sp, #32]
     458: 31 46        	mov	r1, r6
     45a: 90 47        	blx	r2
     45c: 00 28        	cmp	r0, #0
     45e: f6 d0        	beq	0x44e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1ce> @ imm = #-20
     460: ae e7        	b	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-164
     462: 02 98        	ldr	r0, [sp, #8]
     464: 86 42        	cmp	r6, r0
     466: 01 d1        	bne	0x46c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1ec> @ imm = #2
     468: 00 21        	movs	r1, #0
     46a: 00 91        	str	r1, [sp]
     46c: 29 46        	mov	r1, r5
     46e: 03 9a        	ldr	r2, [sp, #12]
     470: 86 42        	cmp	r6, r0
     472: a5 d0        	beq	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-182
     474: 06 98        	ldr	r0, [sp, #24]
     476: 00 f0 41 f8  	bl	0x4fc <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #130
     47a: 00 28        	cmp	r0, #0
     47c: a0 d1        	bne	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-192
     47e: 07 98        	ldr	r0, [sp, #28]
     480: c3 68        	ldr	r3, [r0, #12]
     482: 08 98        	ldr	r0, [sp, #32]
     484: 04 99        	ldr	r1, [sp, #16]
     486: 01 9a        	ldr	r2, [sp, #4]
     488: 98 47        	blx	r3
     48a: 00 28        	cmp	r0, #0
     48c: 98 d1        	bne	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-208
     48e: 00 24        	movs	r4, #0
     490: 00 9d        	ldr	r5, [sp]
     492: a5 42        	cmp	r5, r4
     494: 17 d0        	beq	0x4c6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x246> @ imm = #46
     496: 07 98        	ldr	r0, [sp, #28]
     498: 02 69        	ldr	r2, [r0, #16]
     49a: 08 98        	ldr	r0, [sp, #32]
     49c: 31 46        	mov	r1, r6
     49e: 90 47        	blx	r2
     4a0: 64 1c        	adds	r4, r4, #1
     4a2: 00 28        	cmp	r0, #0
     4a4: f5 d0        	beq	0x492 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x212> @ imm = #-22
     4a6: 60 1e        	subs	r0, r4, #1
     4a8: 0e e0        	b	0x4c8 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x248> @ imm = #28
     4aa: eb 68        	ldr	r3, [r5, #12]
     4ac: 20 46        	mov	r0, r4
     4ae: 04 99        	ldr	r1, [sp, #16]
     4b0: 01 9a        	ldr	r2, [sp, #4]
     4b2: 98 47        	blx	r3
     4b4: 00 28        	cmp	r0, #0
     4b6: 06 98        	ldr	r0, [sp, #24]
     4b8: 82 d1        	bne	0x3c0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-252
     4ba: 03 99        	ldr	r1, [sp, #12]
     4bc: 00 9a        	ldr	r2, [sp]
     4be: 11 70        	strb	r1, [r2]
     4c0: 02 99        	ldr	r1, [sp, #8]
     4c2: 41 60        	str	r1, [r0, #4]
     4c4: 02 e0        	b	0x4cc <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x24c> @ imm = #4
     4c6: 28 46        	mov	r0, r5
     4c8: a8 42        	cmp	r0, r5
     4ca: 04 d3        	blo	0x4d6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x256> @ imm = #8
     4cc: 00 20        	movs	r0, #0
     4ce: 05 90        	str	r0, [sp, #20]
     4d0: 05 98        	ldr	r0, [sp, #20]
     4d2: 13 b0        	add	sp, #76
     4d4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     4d6: 01 20        	movs	r0, #1
     4d8: 05 90        	str	r0, [sp, #20]
     4da: 05 98        	ldr	r0, [sp, #20]
     4dc: 13 b0        	add	sp, #76
     4de: f0 bd        	pop	{r4, r5, r6, r7, pc}

000004e0 <$d.7>:
     4e0:	10 27 00 00	.word	0x00002710
     4e4:	9c ff 00 00	.word	0x0000ff9c
     4e8:	f0 d8 ff ff	.word	0xffffd8f0
     4ec:	7b 14 00 00	.word	0x0000147b
     4f0:	00 0a 00 00	.word	0x00000a00
     4f4:	ff e0 f5 05	.word	0x05f5e0ff
     4f8:	c8 0a 00 00	.word	0x00000ac8

000004fc <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a>:
     4fc: b0 b5        	push	{r4, r5, r7, lr}
     4fe: 02 af        	add	r7, sp, #8
     500: 14 46        	mov	r4, r2
     502: 05 46        	mov	r5, r0
     504: 11 20        	movs	r0, #17
     506: 00 04        	lsls	r0, r0, #16
     508: 81 42        	cmp	r1, r0
     50a: 07 d0        	beq	0x51c <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x20> @ imm = #14
     50c: a8 69        	ldr	r0, [r5, #24]
     50e: ea 69        	ldr	r2, [r5, #28]
     510: 12 69        	ldr	r2, [r2, #16]
     512: 90 47        	blx	r2
     514: 00 28        	cmp	r0, #0
     516: 01 d0        	beq	0x51c <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x20> @ imm = #2
     518: 01 20        	movs	r0, #1
     51a: b0 bd        	pop	{r4, r5, r7, pc}
     51c: 00 2c        	cmp	r4, #0
     51e: 06 d0        	beq	0x52e <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x32> @ imm = #12
     520: a8 69        	ldr	r0, [r5, #24]
     522: e9 69        	ldr	r1, [r5, #28]
     524: cb 68        	ldr	r3, [r1, #12]
     526: 00 22        	movs	r2, #0
     528: 21 46        	mov	r1, r4
     52a: 98 47        	blx	r3
     52c: b0 bd        	pop	{r4, r5, r7, pc}
     52e: 00 20        	movs	r0, #0
     530: b0 bd        	pop	{r4, r5, r7, pc}
     532: d4 d4        	bmi	0x4de <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x25e> @ imm = #-88

00000534 <core::fmt::write::he9beb2966ab2d949>:
     534: f0 b5        	push	{r4, r5, r6, r7, lr}
     536: 03 af        	add	r7, sp, #12
     538: 91 b0        	sub	sp, #68
     53a: 20 23        	movs	r3, #32
     53c: 08 ac        	add	r4, sp, #32
     53e: 03 22        	movs	r2, #3
     540: 07 94        	str	r4, [sp, #28]
     542: e2 54        	strb	r2, [r4, r3]
     544: 09 93        	str	r3, [sp, #36]
     546: 00 22        	movs	r2, #0
     548: 08 92        	str	r2, [sp, #32]
     54a: 51 4b        	ldr	r3, [pc, #324]          @ 0x690 <$d.10>
     54c: 0f 93        	str	r3, [sp, #60]
     54e: 0e 90        	str	r0, [sp, #56]
     550: 0c 92        	str	r2, [sp, #48]
     552: 0a 92        	str	r2, [sp, #40]
     554: 8d 68        	ldr	r5, [r1, #8]
     556: 00 2d        	cmp	r5, #0
     558: 60 d0        	beq	0x61c <core::fmt::write::he9beb2966ab2d949+0xe8> @ imm = #192
     55a: c8 68        	ldr	r0, [r1, #12]
     55c: 00 28        	cmp	r0, #0
     55e: 14 46        	mov	r4, r2
     560: 00 d1        	bne	0x564 <core::fmt::write::he9beb2966ab2d949+0x30> @ imm = #0
     562: 80 e0        	b	0x666 <core::fmt::write::he9beb2966ab2d949+0x132> @ imm = #256
     564: 02 92        	str	r2, [sp, #8]
     566: 07 9a        	ldr	r2, [sp, #28]
     568: 20 32        	adds	r2, #32
     56a: 07 92        	str	r2, [sp, #28]
     56c: 1f 22        	movs	r2, #31
     56e: d3 06        	lsls	r3, r2, #27
     570: 42 1e        	subs	r2, r0, #1
     572: 9a 43        	bics	r2, r3
     574: 52 1c        	adds	r2, r2, #1
     576: 01 92        	str	r2, [sp, #4]
     578: 40 01        	lsls	r0, r0, #5
     57a: 04 90        	str	r0, [sp, #16]
     57c: 06 91        	str	r1, [sp, #24]
     57e: 0c 68        	ldr	r4, [r1]
     580: 00 26        	movs	r6, #0
     582: 05 95        	str	r5, [sp, #20]
     584: 62 68        	ldr	r2, [r4, #4]
     586: 00 2a        	cmp	r2, #0
     588: 06 d0        	beq	0x598 <core::fmt::write::he9beb2966ab2d949+0x64> @ imm = #12
     58a: 0f 98        	ldr	r0, [sp, #60]
     58c: c3 68        	ldr	r3, [r0, #12]
     58e: 21 68        	ldr	r1, [r4]
     590: 0e 98        	ldr	r0, [sp, #56]
     592: 98 47        	blx	r3
     594: 00 28        	cmp	r0, #0
     596: 75 d1        	bne	0x684 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #234
     598: aa 19        	adds	r2, r5, r6
     59a: 10 7f        	ldrb	r0, [r2, #28]
     59c: 07 99        	ldr	r1, [sp, #28]
     59e: 08 70        	strb	r0, [r1]
     5a0: 50 68        	ldr	r0, [r2, #4]
     5a2: 09 90        	str	r0, [sp, #36]
     5a4: 90 68        	ldr	r0, [r2, #8]
     5a6: 08 90        	str	r0, [sp, #32]
     5a8: 50 69        	ldr	r0, [r2, #20]
     5aa: 93 69        	ldr	r3, [r2, #24]
     5ac: 06 99        	ldr	r1, [sp, #24]
     5ae: 09 69        	ldr	r1, [r1, #16]
     5b0: 00 25        	movs	r5, #0
     5b2: 00 28        	cmp	r0, #0
     5b4: 0d d0        	beq	0x5d2 <core::fmt::write::he9beb2966ab2d949+0x9e> @ imm = #26
     5b6: 01 28        	cmp	r0, #1
     5b8: 28 46        	mov	r0, r5
     5ba: 0b d1        	bne	0x5d4 <core::fmt::write::he9beb2966ab2d949+0xa0> @ imm = #22
     5bc: d8 00        	lsls	r0, r3, #3
     5be: 03 90        	str	r0, [sp, #12]
     5c0: 08 18        	adds	r0, r1, r0
     5c2: 40 68        	ldr	r0, [r0, #4]
     5c4: 33 4b        	ldr	r3, [pc, #204]          @ 0x694 <$d.10+0x4>
     5c6: 98 42        	cmp	r0, r3
     5c8: 28 46        	mov	r0, r5
     5ca: 03 d1        	bne	0x5d4 <core::fmt::write::he9beb2966ab2d949+0xa0> @ imm = #6
     5cc: 03 98        	ldr	r0, [sp, #12]
     5ce: 08 58        	ldr	r0, [r1, r0]
     5d0: 03 68        	ldr	r3, [r0]
     5d2: 01 20        	movs	r0, #1
     5d4: 0b 93        	str	r3, [sp, #44]
     5d6: 0a 90        	str	r0, [sp, #40]
     5d8: d0 68        	ldr	r0, [r2, #12]
     5da: 12 69        	ldr	r2, [r2, #16]
     5dc: 00 28        	cmp	r0, #0
     5de: 09 d0        	beq	0x5f4 <core::fmt::write::he9beb2966ab2d949+0xc0> @ imm = #18
     5e0: 01 28        	cmp	r0, #1
     5e2: 09 d1        	bne	0x5f8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #18
     5e4: d0 00        	lsls	r0, r2, #3
     5e6: 0a 18        	adds	r2, r1, r0
     5e8: 52 68        	ldr	r2, [r2, #4]
     5ea: 2a 4b        	ldr	r3, [pc, #168]          @ 0x694 <$d.10+0x4>
     5ec: 9a 42        	cmp	r2, r3
     5ee: 03 d1        	bne	0x5f8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #6
     5f0: 08 58        	ldr	r0, [r1, r0]
     5f2: 02 68        	ldr	r2, [r0]
     5f4: 01 25        	movs	r5, #1
     5f6: ff e7        	b	0x5f8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #-2
     5f8: 0d 92        	str	r2, [sp, #52]
     5fa: 0c 95        	str	r5, [sp, #48]
     5fc: 05 9d        	ldr	r5, [sp, #20]
     5fe: a8 59        	ldr	r0, [r5, r6]
     600: c2 00        	lsls	r2, r0, #3
     602: 88 58        	ldr	r0, [r1, r2]
     604: 89 18        	adds	r1, r1, r2
     606: 4a 68        	ldr	r2, [r1, #4]
     608: 08 a9        	add	r1, sp, #32
     60a: 90 47        	blx	r2
     60c: 00 28        	cmp	r0, #0
     60e: 39 d1        	bne	0x684 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #114
     610: 20 36        	adds	r6, #32
     612: 08 34        	adds	r4, #8
     614: 04 98        	ldr	r0, [sp, #16]
     616: b0 42        	cmp	r0, r6
     618: b4 d1        	bne	0x584 <core::fmt::write::he9beb2966ab2d949+0x50> @ imm = #-152
     61a: 21 e0        	b	0x660 <core::fmt::write::he9beb2966ab2d949+0x12c> @ imm = #66
     61c: 48 69        	ldr	r0, [r1, #20]
     61e: 00 28        	cmp	r0, #0
     620: 14 46        	mov	r4, r2
     622: 20 d0        	beq	0x666 <core::fmt::write::he9beb2966ab2d949+0x132> @ imm = #64
     624: 02 92        	str	r2, [sp, #8]
     626: 07 22        	movs	r2, #7
     628: 52 07        	lsls	r2, r2, #29
     62a: 40 1e        	subs	r0, r0, #1
     62c: 90 43        	bics	r0, r2
     62e: 46 1c        	adds	r6, r0, #1
     630: 0c 68        	ldr	r4, [r1]
     632: 06 91        	str	r1, [sp, #24]
     634: 0d 69        	ldr	r5, [r1, #16]
     636: 01 96        	str	r6, [sp, #4]
     638: 62 68        	ldr	r2, [r4, #4]
     63a: 00 2a        	cmp	r2, #0
     63c: 06 d0        	beq	0x64c <core::fmt::write::he9beb2966ab2d949+0x118> @ imm = #12
     63e: 0f 98        	ldr	r0, [sp, #60]
     640: c3 68        	ldr	r3, [r0, #12]
     642: 21 68        	ldr	r1, [r4]
     644: 0e 98        	ldr	r0, [sp, #56]
     646: 98 47        	blx	r3
     648: 00 28        	cmp	r0, #0
     64a: 1b d1        	bne	0x684 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #54
     64c: 05 cd        	ldm	r5!, {r0, r2}
     64e: 08 a9        	add	r1, sp, #32
     650: 08 3d        	subs	r5, #8
     652: 90 47        	blx	r2
     654: 00 28        	cmp	r0, #0
     656: 15 d1        	bne	0x684 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #42
     658: 08 35        	adds	r5, #8
     65a: 08 34        	adds	r4, #8
     65c: 76 1e        	subs	r6, r6, #1
     65e: eb d1        	bne	0x638 <core::fmt::write::he9beb2966ab2d949+0x104> @ imm = #-42
     660: 02 9a        	ldr	r2, [sp, #8]
     662: 06 99        	ldr	r1, [sp, #24]
     664: 01 9c        	ldr	r4, [sp, #4]
     666: 48 68        	ldr	r0, [r1, #4]
     668: 84 42        	cmp	r4, r0
     66a: 02 d2        	bhs	0x672 <core::fmt::write::he9beb2966ab2d949+0x13e> @ imm = #4
     66c: e3 00        	lsls	r3, r4, #3
     66e: 0a 68        	ldr	r2, [r1]
     670: d2 18        	adds	r2, r2, r3
     672: 84 42        	cmp	r4, r0
     674: 09 d2        	bhs	0x68a <core::fmt::write::he9beb2966ab2d949+0x156> @ imm = #18
     676: 0f 98        	ldr	r0, [sp, #60]
     678: c3 68        	ldr	r3, [r0, #12]
     67a: 06 ca        	ldm	r2, {r1, r2}
     67c: 0e 98        	ldr	r0, [sp, #56]
     67e: 98 47        	blx	r3
     680: 00 28        	cmp	r0, #0
     682: 02 d0        	beq	0x68a <core::fmt::write::he9beb2966ab2d949+0x156> @ imm = #4
     684: 01 20        	movs	r0, #1
     686: 11 b0        	add	sp, #68
     688: f0 bd        	pop	{r4, r5, r6, r7, pc}
     68a: 00 20        	movs	r0, #0
     68c: 11 b0        	add	sp, #68
     68e: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000690 <$d.10>:
     690:	c8 0a 00 00	.word	0x00000ac8
     694:	7d 02 00 00	.word	0x0000027d

00000698 <WWDG>:
     698: fe e7        	b	0x698 <WWDG>            @ imm = #-4

0000069a <__pre_init>:
     69a: 70 47        	bx	lr

0000069c <core::ptr::drop_in_place<&mut cortex_m_semihosting::hio::HostStream>::h09e14c05280b3224>:
     69c: 70 47        	bx	lr

0000069e <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967>:
     69e: f0 b5        	push	{r4, r5, r6, r7, lr}
     6a0: 03 af        	add	r7, sp, #12
     6a2: 85 b0        	sub	sp, #20
     6a4: 00 2a        	cmp	r2, #0
     6a6: 33 d0        	beq	0x710 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x72> @ imm = #102
     6a8: 15 46        	mov	r5, r2
     6aa: 0c 46        	mov	r4, r1
     6ac: 00 68        	ldr	r0, [r0]
     6ae: 00 68        	ldr	r0, [r0]
     6b0: 01 90        	str	r0, [sp, #4]
     6b2: 02 ab        	add	r3, sp, #8
     6b4: 07 c3        	stm	r3!, {r0, r1, r2}
     6b6: 05 20        	movs	r0, #5
     6b8: 02 a9        	add	r1, sp, #8
     6ba: 00 90        	str	r0, [sp]
     6bc: ab be        	bkpt	#171
     6be: 41 42        	rsbs	r1, r0, #0
     6c0: 41 41        	adcs	r1, r0
     6c2: 01 23        	movs	r3, #1
     6c4: 90 42        	cmp	r0, r2
     6c6: 1a 46        	mov	r2, r3
     6c8: 00 d8        	bhi	0x6cc <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x2e> @ imm = #0
     6ca: 00 22        	movs	r2, #0
     6cc: 0a 43        	orrs	r2, r1
     6ce: 06 d0        	beq	0x6de <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x40> @ imm = #12
     6d0: 01 20        	movs	r0, #1
     6d2: 48 40        	eors	r0, r1
     6d4: 05 b0        	add	sp, #20
     6d6: f0 bd        	pop	{r4, r5, r6, r7, pc}
     6d8: 01 2e        	cmp	r6, #1
     6da: 15 46        	mov	r5, r2
     6dc: f8 d0        	beq	0x6d0 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x32> @ imm = #-16
     6de: 02 46        	mov	r2, r0
     6e0: 01 98        	ldr	r0, [sp, #4]
     6e2: 02 90        	str	r0, [sp, #8]
     6e4: 04 92        	str	r2, [sp, #16]
     6e6: a8 1a        	subs	r0, r5, r2
     6e8: 24 18        	adds	r4, r4, r0
     6ea: 03 94        	str	r4, [sp, #12]
     6ec: 02 a9        	add	r1, sp, #8
     6ee: 00 98        	ldr	r0, [sp]
     6f0: ab be        	bkpt	#171
     6f2: 41 42        	rsbs	r1, r0, #0
     6f4: 41 41        	adcs	r1, r0
     6f6: 82 42        	cmp	r2, r0
     6f8: 04 d3        	blo	0x704 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x66> @ imm = #8
     6fa: 00 25        	movs	r5, #0
     6fc: 00 28        	cmp	r0, #0
     6fe: 1e 46        	mov	r6, r3
     700: ea d0        	beq	0x6d8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-44
     702: 03 e0        	b	0x70c <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x6e> @ imm = #6
     704: 01 25        	movs	r5, #1
     706: 00 28        	cmp	r0, #0
     708: 1e 46        	mov	r6, r3
     70a: e5 d0        	beq	0x6d8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-54
     70c: 2e 46        	mov	r6, r5
     70e: e3 e7        	b	0x6d8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-58
     710: 00 20        	movs	r0, #0
     712: 05 b0        	add	sp, #20
     714: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000716 <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2>:
     716: f0 b5        	push	{r4, r5, r6, r7, lr}
     718: 03 af        	add	r7, sp, #12
     71a: 84 b0        	sub	sp, #16
     71c: 00 68        	ldr	r0, [r0]
     71e: 00 22        	movs	r2, #0
     720: 00 92        	str	r2, [sp]
     722: 80 29        	cmp	r1, #128
     724: 03 d2        	bhs	0x72e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x18> @ imm = #6
     726: 6a 46        	mov	r2, sp
     728: 11 70        	strb	r1, [r2]
     72a: 01 24        	movs	r4, #1
     72c: 2f e0        	b	0x78e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #94
     72e: ca 0a        	lsrs	r2, r1, #11
     730: 0a d1        	bne	0x748 <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x32> @ imm = #20
     732: 3f 22        	movs	r2, #63
     734: 0a 40        	ands	r2, r1
     736: 80 32        	adds	r2, #128
     738: 6b 46        	mov	r3, sp
     73a: 5a 70        	strb	r2, [r3, #1]
     73c: 89 09        	lsrs	r1, r1, #6
     73e: c0 22        	movs	r2, #192
     740: 0a 43        	orrs	r2, r1
     742: 1a 70        	strb	r2, [r3]
     744: 02 24        	movs	r4, #2
     746: 22 e0        	b	0x78e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #68
     748: 0a 0c        	lsrs	r2, r1, #16
     74a: 0e d1        	bne	0x76a <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x54> @ imm = #28
     74c: 3f 22        	movs	r2, #63
     74e: 0a 40        	ands	r2, r1
     750: 80 32        	adds	r2, #128
     752: 6b 46        	mov	r3, sp
     754: 9a 70        	strb	r2, [r3, #2]
     756: 0a 0b        	lsrs	r2, r1, #12
     758: e0 24        	movs	r4, #224
     75a: 14 43        	orrs	r4, r2
     75c: 1c 70        	strb	r4, [r3]
     75e: 09 05        	lsls	r1, r1, #20
     760: 89 0e        	lsrs	r1, r1, #26
     762: 80 31        	adds	r1, #128
     764: 59 70        	strb	r1, [r3, #1]
     766: 03 24        	movs	r4, #3
     768: 11 e0        	b	0x78e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #34
     76a: 3f 23        	movs	r3, #63
     76c: 0b 40        	ands	r3, r1
     76e: 80 33        	adds	r3, #128
     770: 6a 46        	mov	r2, sp
     772: d3 70        	strb	r3, [r2, #3]
     774: 8b 0c        	lsrs	r3, r1, #18
     776: f0 24        	movs	r4, #240
     778: 1c 43        	orrs	r4, r3
     77a: 14 70        	strb	r4, [r2]
     77c: 0b 05        	lsls	r3, r1, #20
     77e: 9b 0e        	lsrs	r3, r3, #26
     780: 80 33        	adds	r3, #128
     782: 93 70        	strb	r3, [r2, #2]
     784: 89 03        	lsls	r1, r1, #14
     786: 89 0e        	lsrs	r1, r1, #26
     788: 80 31        	adds	r1, #128
     78a: 51 70        	strb	r1, [r2, #1]
     78c: 04 24        	movs	r4, #4
     78e: 03 68        	ldr	r3, [r0]
     790: 03 94        	str	r4, [sp, #12]
     792: 68 46        	mov	r0, sp
     794: 02 90        	str	r0, [sp, #8]
     796: 01 93        	str	r3, [sp, #4]
     798: 05 22        	movs	r2, #5
     79a: 01 a9        	add	r1, sp, #4
     79c: 10 46        	mov	r0, r2
     79e: ab be        	bkpt	#171
     7a0: 41 42        	rsbs	r1, r0, #0
     7a2: 41 41        	adcs	r1, r0
     7a4: 45 1e        	subs	r5, r0, #1
     7a6: a5 42        	cmp	r5, r4
     7a8: 10 d2        	bhs	0x7cc <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0xb6> @ imm = #32
     7aa: 6d 46        	mov	r5, sp
     7ac: 06 46        	mov	r6, r0
     7ae: 01 93        	str	r3, [sp, #4]
     7b0: 03 90        	str	r0, [sp, #12]
     7b2: 20 1a        	subs	r0, r4, r0
     7b4: 2d 18        	adds	r5, r5, r0
     7b6: 02 95        	str	r5, [sp, #8]
     7b8: 01 a9        	add	r1, sp, #4
     7ba: 10 46        	mov	r0, r2
     7bc: ab be        	bkpt	#171
     7be: 41 42        	rsbs	r1, r0, #0
     7c0: 41 41        	adcs	r1, r0
     7c2: 00 28        	cmp	r0, #0
     7c4: 02 d0        	beq	0x7cc <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0xb6> @ imm = #4
     7c6: 86 42        	cmp	r6, r0
     7c8: 34 46        	mov	r4, r6
     7ca: ef d2        	bhs	0x7ac <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x96> @ imm = #-34
     7cc: 01 20        	movs	r0, #1
     7ce: 48 40        	eors	r0, r1
     7d0: 04 b0        	add	sp, #16
     7d2: f0 bd        	pop	{r4, r5, r6, r7, pc}

000007d4 <<&mut W as core::fmt::Write>::write_fmt::hd31f7e06213b1f40>:
     7d4: b0 b5        	push	{r4, r5, r7, lr}
     7d6: 02 af        	add	r7, sp, #8
     7d8: 88 b0        	sub	sp, #32
     7da: 00 68        	ldr	r0, [r0]
     7dc: 01 90        	str	r0, [sp, #4]
     7de: 02 aa        	add	r2, sp, #8
     7e0: 10 46        	mov	r0, r2
     7e2: 38 c9        	ldm	r1!, {r3, r4, r5}
     7e4: 38 c0        	stm	r0!, {r3, r4, r5}
     7e6: 38 c9        	ldm	r1!, {r3, r4, r5}
     7e8: 38 c0        	stm	r0!, {r3, r4, r5}
     7ea: 01 a8        	add	r0, sp, #4
     7ec: 11 46        	mov	r1, r2
     7ee: ff f7 a1 fe  	bl	0x534 <core::fmt::write::he9beb2966ab2d949> @ imm = #-702
     7f2: 08 b0        	add	sp, #32
     7f4: b0 bd        	pop	{r4, r5, r7, pc}

000007f6 <__cpsid>:
     7f6: 72 b6        	cpsid i
     7f8: 70 47        	bx	lr

000007fa <__cpsie>:
     7fa: 62 b6        	cpsie i
     7fc: 70 47        	bx	lr

000007fe <__primask_r>:
     7fe: ef f3 10 80  	mrs	r0, primask
     802: 70 47        	bx	lr

00000804 <__aeabi_uidiv>:
     804: 80 b5        	push	{r7, lr}
     806: 00 af        	add	r7, sp, #0
     808: 00 f0 01 f8  	bl	0x80e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd> @ imm = #2
     80c: 80 bd        	pop	{r7, pc}

0000080e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd>:
     80e: f0 b5        	push	{r4, r5, r6, r7, lr}
     810: 03 af        	add	r7, sp, #12
     812: 83 b0        	sub	sp, #12
     814: 02 46        	mov	r2, r0
     816: 88 42        	cmp	r0, r1
     818: 03 d2        	bhs	0x822 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14> @ imm = #6
     81a: 00 20        	movs	r0, #0
     81c: 11 46        	mov	r1, r2
     81e: 03 b0        	add	sp, #12
     820: f0 bd        	pop	{r4, r5, r6, r7, pc}
     822: 15 0c        	lsrs	r5, r2, #16
     824: a9 42        	cmp	r1, r5
     826: 10 46        	mov	r0, r2
     828: 39 d9        	bls	0x89e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x90> @ imm = #114
     82a: 06 0a        	lsrs	r6, r0, #8
     82c: b1 42        	cmp	r1, r6
     82e: 3a d9        	bls	0x8a6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x98> @ imm = #116
     830: 03 09        	lsrs	r3, r0, #4
     832: 99 42        	cmp	r1, r3
     834: 3b d9        	bls	0x8ae <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xa0> @ imm = #118
     836: 01 93        	str	r3, [sp, #4]
     838: 83 08        	lsrs	r3, r0, #2
     83a: 99 42        	cmp	r1, r3
     83c: 00 d8        	bhi	0x840 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x32> @ imm = #0
     83e: 18 46        	mov	r0, r3
     840: 02 93        	str	r3, [sp, #8]
     842: 43 08        	lsrs	r3, r0, #1
     844: 01 24        	movs	r4, #1
     846: 00 20        	movs	r0, #0
     848: 99 42        	cmp	r1, r3
     84a: 23 46        	mov	r3, r4
     84c: 00 d9        	bls	0x850 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x42> @ imm = #0
     84e: 03 46        	mov	r3, r0
     850: a9 42        	cmp	r1, r5
     852: 25 46        	mov	r5, r4
     854: 00 d9        	bls	0x858 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x4a> @ imm = #0
     856: 05 46        	mov	r5, r0
     858: 00 93        	str	r3, [sp]
     85a: 2d 01        	lsls	r5, r5, #4
     85c: b1 42        	cmp	r1, r6
     85e: 26 46        	mov	r6, r4
     860: 00 d9        	bls	0x864 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x56> @ imm = #0
     862: 06 46        	mov	r6, r0
     864: f3 00        	lsls	r3, r6, #3
     866: 5d 19        	adds	r5, r3, r5
     868: 01 9b        	ldr	r3, [sp, #4]
     86a: 99 42        	cmp	r1, r3
     86c: 23 46        	mov	r3, r4
     86e: 00 d9        	bls	0x872 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x64> @ imm = #0
     870: 03 46        	mov	r3, r0
     872: 9b 00        	lsls	r3, r3, #2
     874: eb 18        	adds	r3, r5, r3
     876: 02 9d        	ldr	r5, [sp, #8]
     878: a9 42        	cmp	r1, r5
     87a: 25 46        	mov	r5, r4
     87c: 00 d9        	bls	0x880 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x72> @ imm = #0
     87e: 05 46        	mov	r5, r0
     880: 68 00        	lsls	r0, r5, #1
     882: 18 18        	adds	r0, r3, r0
     884: 00 9b        	ldr	r3, [sp]
     886: c3 18        	adds	r3, r0, r3
     888: 9c 40        	lsls	r4, r3
     88a: 0d 46        	mov	r5, r1
     88c: 9d 40        	lsls	r5, r3
     88e: 56 1b        	subs	r6, r2, r5
     890: 8e 42        	cmp	r6, r1
     892: 12 d2        	bhs	0x8ba <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xac> @ imm = #36
     894: 32 46        	mov	r2, r6
     896: 20 46        	mov	r0, r4
     898: 11 46        	mov	r1, r2
     89a: 03 b0        	add	sp, #12
     89c: f0 bd        	pop	{r4, r5, r6, r7, pc}
     89e: 28 46        	mov	r0, r5
     8a0: 06 0a        	lsrs	r6, r0, #8
     8a2: b1 42        	cmp	r1, r6
     8a4: c4 d8        	bhi	0x830 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x22> @ imm = #-120
     8a6: 30 46        	mov	r0, r6
     8a8: 03 09        	lsrs	r3, r0, #4
     8aa: 99 42        	cmp	r1, r3
     8ac: c3 d8        	bhi	0x836 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x28> @ imm = #-122
     8ae: 18 46        	mov	r0, r3
     8b0: 01 93        	str	r3, [sp, #4]
     8b2: 83 08        	lsrs	r3, r0, #2
     8b4: 99 42        	cmp	r1, r3
     8b6: c2 d9        	bls	0x83e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x30> @ imm = #-124
     8b8: c2 e7        	b	0x840 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x32> @ imm = #-124
     8ba: 00 2d        	cmp	r5, #0
     8bc: 03 d4        	bmi	0x8c6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xb8> @ imm = #6
     8be: 21 46        	mov	r1, r4
     8c0: 20 46        	mov	r0, r4
     8c2: 32 46        	mov	r2, r6
     8c4: 15 e0        	b	0x8f2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xe4> @ imm = #42
     8c6: 6d 08        	lsrs	r5, r5, #1
     8c8: 72 1b        	subs	r2, r6, r5
     8ca: 5b 1e        	subs	r3, r3, #1
     8cc: 1f 20        	movs	r0, #31
     8ce: 01 93        	str	r3, [sp, #4]
     8d0: 18 40        	ands	r0, r3
     8d2: 02 90        	str	r0, [sp, #8]
     8d4: 01 20        	movs	r0, #1
     8d6: 02 9b        	ldr	r3, [sp, #8]
     8d8: 98 40        	lsls	r0, r3
     8da: 00 2a        	cmp	r2, #0
     8dc: 02 90        	str	r0, [sp, #8]
     8de: 00 da        	bge	0x8e2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xd4> @ imm = #0
     8e0: 00 20        	movs	r0, #0
     8e2: 00 2a        	cmp	r2, #0
     8e4: 00 da        	bge	0x8e8 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xda> @ imm = #0
     8e6: 32 46        	mov	r2, r6
     8e8: 20 43        	orrs	r0, r4
     8ea: 8a 42        	cmp	r2, r1
     8ec: 02 99        	ldr	r1, [sp, #8]
     8ee: 01 9b        	ldr	r3, [sp, #4]
     8f0: 94 d3        	blo	0x81c <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xe> @ imm = #-216
     8f2: 49 1e        	subs	r1, r1, #1
     8f4: 00 2b        	cmp	r3, #0
     8f6: 10 d0        	beq	0x91a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x10c> @ imm = #32
     8f8: 03 26        	movs	r6, #3
     8fa: 1e 40        	ands	r6, r3
     8fc: 01 24        	movs	r4, #1
     8fe: 64 1b        	subs	r4, r4, r5
     900: 5d 1e        	subs	r5, r3, #1
     902: 02 95        	str	r5, [sp, #8]
     904: 00 2e        	cmp	r6, #0
     906: 0a d0        	beq	0x91e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x110> @ imm = #20
     908: 55 00        	lsls	r5, r2, #1
     90a: 2a 19        	adds	r2, r5, r4
     90c: 00 d4        	bmi	0x910 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x102> @ imm = #0
     90e: 15 46        	mov	r5, r2
     910: 01 2e        	cmp	r6, #1
     912: 08 d1        	bne	0x926 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x118> @ imm = #16
     914: 02 9e        	ldr	r6, [sp, #8]
     916: 32 46        	mov	r2, r6
     918: 14 e0        	b	0x944 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #40
     91a: 15 46        	mov	r5, r2
     91c: 14 e0        	b	0x948 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x13a> @ imm = #40
     91e: 15 46        	mov	r5, r2
     920: 1a 46        	mov	r2, r3
     922: 02 9e        	ldr	r6, [sp, #8]
     924: 0e e0        	b	0x944 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #28
     926: 6d 00        	lsls	r5, r5, #1
     928: 2a 19        	adds	r2, r5, r4
     92a: 00 d4        	bmi	0x92e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x120> @ imm = #0
     92c: 15 46        	mov	r5, r2
     92e: 02 2e        	cmp	r6, #2
     930: 02 d1        	bne	0x938 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x12a> @ imm = #4
     932: 9a 1e        	subs	r2, r3, #2
     934: 02 9e        	ldr	r6, [sp, #8]
     936: 05 e0        	b	0x944 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #10
     938: 6d 00        	lsls	r5, r5, #1
     93a: 2a 19        	adds	r2, r5, r4
     93c: 02 9e        	ldr	r6, [sp, #8]
     93e: 00 d4        	bmi	0x942 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x134> @ imm = #0
     940: 15 46        	mov	r5, r2
     942: da 1e        	subs	r2, r3, #3
     944: 03 2e        	cmp	r6, #3
     946: 0a d2        	bhs	0x95e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x150> @ imm = #20
     948: 1f 22        	movs	r2, #31
     94a: 13 40        	ands	r3, r2
     94c: 2a 46        	mov	r2, r5
     94e: da 40        	lsrs	r2, r3
     950: 29 40        	ands	r1, r5
     952: 08 43        	orrs	r0, r1
     954: 11 46        	mov	r1, r2
     956: 03 b0        	add	sp, #12
     958: f0 bd        	pop	{r4, r5, r6, r7, pc}
     95a: 12 1f        	subs	r2, r2, #4
     95c: f4 d0        	beq	0x948 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x13a> @ imm = #-24
     95e: 6d 00        	lsls	r5, r5, #1
     960: 2e 19        	adds	r6, r5, r4
     962: 09 d5        	bpl	0x978 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x16a> @ imm = #18
     964: 6d 00        	lsls	r5, r5, #1
     966: 2e 19        	adds	r6, r5, r4
     968: 0a d5        	bpl	0x980 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x172> @ imm = #20
     96a: 6d 00        	lsls	r5, r5, #1
     96c: 2e 19        	adds	r6, r5, r4
     96e: 0b d5        	bpl	0x988 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x17a> @ imm = #22
     970: 6d 00        	lsls	r5, r5, #1
     972: 2e 19        	adds	r6, r5, r4
     974: f1 d4        	bmi	0x95a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-30
     976: 0b e0        	b	0x990 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x182> @ imm = #22
     978: 35 46        	mov	r5, r6
     97a: 6d 00        	lsls	r5, r5, #1
     97c: 2e 19        	adds	r6, r5, r4
     97e: f4 d4        	bmi	0x96a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x15c> @ imm = #-24
     980: 35 46        	mov	r5, r6
     982: 6d 00        	lsls	r5, r5, #1
     984: 2e 19        	adds	r6, r5, r4
     986: f3 d4        	bmi	0x970 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x162> @ imm = #-26
     988: 35 46        	mov	r5, r6
     98a: 6d 00        	lsls	r5, r5, #1
     98c: 2e 19        	adds	r6, r5, r4
     98e: e4 d4        	bmi	0x95a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-56
     990: 35 46        	mov	r5, r6
     992: e2 e7        	b	0x95a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-60

00000994 <HardFaultTrampoline>:
     994: 70 46        	mov	r0, lr
     996: 04 21        	movs	r1, #4
     998: 08 42        	tst	r0, r1
     99a: 02 d1        	bne	0x9a2 <HardFaultTrampoline+0xe> @ imm = #4
     99c: ef f3 08 80  	mrs	r0, msp
     9a0: 02 e0        	b	0x9a8 <HardFault_>      @ imm = #4
     9a2: ef f3 09 80  	mrs	r0, psp
     9a6: ff e7        	b	0x9a8 <HardFault_>      @ imm = #-2

000009a8 <HardFault_>:
     9a8: fe e7        	b	0x9a8 <HardFault_>      @ imm = #-4
     9aa: d4 d4        	bmi	0x956 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x148> @ imm = #-88

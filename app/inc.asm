
inc:	file format elf32-littlearm

Disassembly of section .text:

000000b8 <__stext>:
      b8: 0b 4c        	ldr	r4, [pc, #44]           @ 0xe8 <$d>
      ba: a6 46        	mov	lr, r4
      bc: 00 f0 65 fb  	bl	0x78a <__pre_init>      @ imm = #1738
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
      e2: 00 f0 26 f8  	bl	0x132 <main>            @ imm = #76
      e6: 00 de        	udf	#0

000000e8 <$d>:
      e8:	ff ff ff ff	.word	0xffffffff
      ec:	00 00 00 20	.word	0x20000000
      f0:	08 00 00 20	.word	0x20000008
      f4:	00 00 00 20	.word	0x20000000
      f8:	00 00 00 20	.word	0x20000000
      fc:	14 0c 00 00	.word	0x00000c14

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

00000116 <cond_function2>:
     116: b0 b5        	push	{r4, r5, r7, lr}
     118: 02 af        	add	r7, sp, #8
     11a: 0c 46        	mov	r4, r1
     11c: 05 46        	mov	r5, r0
     11e: 05 21        	movs	r1, #5
     120: 00 f0 e8 fb  	bl	0x8f4 <__aeabi_uidiv>   @ imm = #2000
     124: a5 42        	cmp	r5, r4
     126: 01 d8        	bhi	0x12c <cond_function2+0x16> @ imm = #2
     128: 20 1a        	subs	r0, r4, r0
     12a: b0 bd        	pop	{r4, r5, r7, pc}
     12c: 60 00        	lsls	r0, r4, #1
     12e: 40 19        	adds	r0, r0, r5
     130: b0 bd        	pop	{r4, r5, r7, pc}

00000132 <main>:
     132: 80 b5        	push	{r7, lr}
     134: 00 af        	add	r7, sp, #0
     136: 00 f0 01 f8  	bl	0x13c <inc::__cortex_m_rt_main::h2ce682e83d39bdf4> @ imm = #2
     13a: fe de        	trap

0000013c <inc::__cortex_m_rt_main::h2ce682e83d39bdf4>:
     13c: 80 b5        	push	{r7, lr}
     13e: 00 af        	add	r7, sp, #0
     140: 8a b0        	sub	sp, #40
     142: 01 24        	movs	r4, #1
     144: 20 46        	mov	r0, r4
     146: ff f7 db ff  	bl	0x100 <inc_function>    @ imm = #-74
     14a: 02 90        	str	r0, [sp, #8]
     14c: 7e 48        	ldr	r0, [pc, #504]          @ 0x348 <$d.5>
     14e: 01 90        	str	r0, [sp, #4]
     150: 02 a8        	add	r0, sp, #8
     152: 00 90        	str	r0, [sp]
     154: 00 f0 cb fb  	bl	0x8ee <__primask_r>     @ imm = #1942
     158: 05 46        	mov	r5, r0
     15a: 25 40        	ands	r5, r4
     15c: 00 f0 c3 fb  	bl	0x8e6 <__cpsid>         @ imm = #1926
     160: 7a 4e        	ldr	r6, [pc, #488]          @ 0x34c <$d.5+0x4>
     162: 30 68        	ldr	r0, [r6]
     164: 01 28        	cmp	r0, #1
     166: 0c d0        	beq	0x182 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x46> @ imm = #24
     168: 03 20        	movs	r0, #3
     16a: 06 90        	str	r0, [sp, #24]
     16c: 04 20        	movs	r0, #4
     16e: 05 90        	str	r0, [sp, #20]
     170: 77 48        	ldr	r0, [pc, #476]          @ 0x350 <$d.5+0x8>
     172: 04 90        	str	r0, [sp, #16]
     174: 04 a9        	add	r1, sp, #16
     176: 20 46        	mov	r0, r4
     178: ab be        	bkpt	#171
     17a: 41 1c        	adds	r1, r0, #1
     17c: 11 d0        	beq	0x1a2 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x66> @ imm = #34
     17e: 34 60        	str	r4, [r6]
     180: 70 60        	str	r0, [r6, #4]
     182: 30 1d        	adds	r0, r6, #4
     184: 03 90        	str	r0, [sp, #12]
     186: 09 94        	str	r4, [sp, #36]
     188: 68 46        	mov	r0, sp
     18a: 08 90        	str	r0, [sp, #32]
     18c: 00 20        	movs	r0, #0
     18e: 07 90        	str	r0, [sp, #28]
     190: 06 90        	str	r0, [sp, #24]
     192: 02 20        	movs	r0, #2
     194: 05 90        	str	r0, [sp, #20]
     196: 6f 48        	ldr	r0, [pc, #444]          @ 0x354 <$d.5+0xc>
     198: 04 90        	str	r0, [sp, #16]
     19a: 03 a8        	add	r0, sp, #12
     19c: 04 a9        	add	r1, sp, #16
     19e: 00 f0 41 fa  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #1154
     1a2: 00 2d        	cmp	r5, #0
     1a4: 01 d1        	bne	0x1aa <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x6e> @ imm = #2
     1a6: 00 f0 a0 fb  	bl	0x8ea <__cpsie>         @ imm = #1856
     1aa: 20 46        	mov	r0, r4
     1ac: ff f7 aa ff  	bl	0x104 <cond_function>   @ imm = #-172
     1b0: 02 90        	str	r0, [sp, #8]
     1b2: 65 48        	ldr	r0, [pc, #404]          @ 0x348 <$d.5>
     1b4: 01 90        	str	r0, [sp, #4]
     1b6: 02 a8        	add	r0, sp, #8
     1b8: 00 90        	str	r0, [sp]
     1ba: 00 f0 98 fb  	bl	0x8ee <__primask_r>     @ imm = #1840
     1be: 05 46        	mov	r5, r0
     1c0: 25 40        	ands	r5, r4
     1c2: 00 f0 90 fb  	bl	0x8e6 <__cpsid>         @ imm = #1824
     1c6: 30 68        	ldr	r0, [r6]
     1c8: 01 28        	cmp	r0, #1
     1ca: 0c d0        	beq	0x1e6 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xaa> @ imm = #24
     1cc: 03 20        	movs	r0, #3
     1ce: 06 90        	str	r0, [sp, #24]
     1d0: 04 20        	movs	r0, #4
     1d2: 05 90        	str	r0, [sp, #20]
     1d4: 5e 48        	ldr	r0, [pc, #376]          @ 0x350 <$d.5+0x8>
     1d6: 04 90        	str	r0, [sp, #16]
     1d8: 04 a9        	add	r1, sp, #16
     1da: 20 46        	mov	r0, r4
     1dc: ab be        	bkpt	#171
     1de: 41 1c        	adds	r1, r0, #1
     1e0: 11 d0        	beq	0x206 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xca> @ imm = #34
     1e2: 34 60        	str	r4, [r6]
     1e4: 70 60        	str	r0, [r6, #4]
     1e6: 30 1d        	adds	r0, r6, #4
     1e8: 03 90        	str	r0, [sp, #12]
     1ea: 09 94        	str	r4, [sp, #36]
     1ec: 68 46        	mov	r0, sp
     1ee: 08 90        	str	r0, [sp, #32]
     1f0: 00 20        	movs	r0, #0
     1f2: 07 90        	str	r0, [sp, #28]
     1f4: 06 90        	str	r0, [sp, #24]
     1f6: 02 20        	movs	r0, #2
     1f8: 05 90        	str	r0, [sp, #20]
     1fa: 57 48        	ldr	r0, [pc, #348]          @ 0x358 <$d.5+0x10>
     1fc: 04 90        	str	r0, [sp, #16]
     1fe: 03 a8        	add	r0, sp, #12
     200: 04 a9        	add	r1, sp, #16
     202: 00 f0 0f fa  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #1054
     206: 00 2d        	cmp	r5, #0
     208: 01 d1        	bne	0x20e <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0xd2> @ imm = #2
     20a: 00 f0 6e fb  	bl	0x8ea <__cpsie>         @ imm = #1756
     20e: 0b 20        	movs	r0, #11
     210: ff f7 78 ff  	bl	0x104 <cond_function>   @ imm = #-272
     214: 02 90        	str	r0, [sp, #8]
     216: 4c 48        	ldr	r0, [pc, #304]          @ 0x348 <$d.5>
     218: 01 90        	str	r0, [sp, #4]
     21a: 02 a8        	add	r0, sp, #8
     21c: 00 90        	str	r0, [sp]
     21e: 00 f0 66 fb  	bl	0x8ee <__primask_r>     @ imm = #1740
     222: 05 46        	mov	r5, r0
     224: 25 40        	ands	r5, r4
     226: 00 f0 5e fb  	bl	0x8e6 <__cpsid>         @ imm = #1724
     22a: 30 68        	ldr	r0, [r6]
     22c: 01 28        	cmp	r0, #1
     22e: 0c d0        	beq	0x24a <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x10e> @ imm = #24
     230: 03 20        	movs	r0, #3
     232: 06 90        	str	r0, [sp, #24]
     234: 04 20        	movs	r0, #4
     236: 05 90        	str	r0, [sp, #20]
     238: 45 48        	ldr	r0, [pc, #276]          @ 0x350 <$d.5+0x8>
     23a: 04 90        	str	r0, [sp, #16]
     23c: 04 a9        	add	r1, sp, #16
     23e: 20 46        	mov	r0, r4
     240: ab be        	bkpt	#171
     242: 41 1c        	adds	r1, r0, #1
     244: 11 d0        	beq	0x26a <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x12e> @ imm = #34
     246: 34 60        	str	r4, [r6]
     248: 70 60        	str	r0, [r6, #4]
     24a: 30 1d        	adds	r0, r6, #4
     24c: 03 90        	str	r0, [sp, #12]
     24e: 09 94        	str	r4, [sp, #36]
     250: 68 46        	mov	r0, sp
     252: 08 90        	str	r0, [sp, #32]
     254: 00 20        	movs	r0, #0
     256: 07 90        	str	r0, [sp, #28]
     258: 06 90        	str	r0, [sp, #24]
     25a: 02 20        	movs	r0, #2
     25c: 05 90        	str	r0, [sp, #20]
     25e: 3f 48        	ldr	r0, [pc, #252]          @ 0x35c <$d.5+0x14>
     260: 04 90        	str	r0, [sp, #16]
     262: 03 a8        	add	r0, sp, #12
     264: 04 a9        	add	r1, sp, #16
     266: 00 f0 dd f9  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #954
     26a: 00 2d        	cmp	r5, #0
     26c: 01 d1        	bne	0x272 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x136> @ imm = #2
     26e: 00 f0 3c fb  	bl	0x8ea <__cpsie>         @ imm = #1656
     272: 0b 21        	movs	r1, #11
     274: 20 46        	mov	r0, r4
     276: ff f7 4e ff  	bl	0x116 <cond_function2>  @ imm = #-356
     27a: 02 90        	str	r0, [sp, #8]
     27c: 32 48        	ldr	r0, [pc, #200]          @ 0x348 <$d.5>
     27e: 01 90        	str	r0, [sp, #4]
     280: 02 a8        	add	r0, sp, #8
     282: 00 90        	str	r0, [sp]
     284: 00 f0 33 fb  	bl	0x8ee <__primask_r>     @ imm = #1638
     288: 05 46        	mov	r5, r0
     28a: 25 40        	ands	r5, r4
     28c: 00 f0 2b fb  	bl	0x8e6 <__cpsid>         @ imm = #1622
     290: 30 68        	ldr	r0, [r6]
     292: 01 28        	cmp	r0, #1
     294: 0c d0        	beq	0x2b0 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x174> @ imm = #24
     296: 03 20        	movs	r0, #3
     298: 06 90        	str	r0, [sp, #24]
     29a: 04 20        	movs	r0, #4
     29c: 05 90        	str	r0, [sp, #20]
     29e: 2c 48        	ldr	r0, [pc, #176]          @ 0x350 <$d.5+0x8>
     2a0: 04 90        	str	r0, [sp, #16]
     2a2: 04 a9        	add	r1, sp, #16
     2a4: 20 46        	mov	r0, r4
     2a6: ab be        	bkpt	#171
     2a8: 41 1c        	adds	r1, r0, #1
     2aa: 11 d0        	beq	0x2d0 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x194> @ imm = #34
     2ac: 34 60        	str	r4, [r6]
     2ae: 70 60        	str	r0, [r6, #4]
     2b0: 30 1d        	adds	r0, r6, #4
     2b2: 03 90        	str	r0, [sp, #12]
     2b4: 09 94        	str	r4, [sp, #36]
     2b6: 68 46        	mov	r0, sp
     2b8: 08 90        	str	r0, [sp, #32]
     2ba: 00 20        	movs	r0, #0
     2bc: 07 90        	str	r0, [sp, #28]
     2be: 06 90        	str	r0, [sp, #24]
     2c0: 02 20        	movs	r0, #2
     2c2: 05 90        	str	r0, [sp, #20]
     2c4: 26 48        	ldr	r0, [pc, #152]          @ 0x360 <$d.5+0x18>
     2c6: 04 90        	str	r0, [sp, #16]
     2c8: 03 a8        	add	r0, sp, #12
     2ca: 04 a9        	add	r1, sp, #16
     2cc: 00 f0 aa f9  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #852
     2d0: 00 2d        	cmp	r5, #0
     2d2: 01 d1        	bne	0x2d8 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x19c> @ imm = #2
     2d4: 00 f0 09 fb  	bl	0x8ea <__cpsie>         @ imm = #1554
     2d8: 0b 20        	movs	r0, #11
     2da: 21 46        	mov	r1, r4
     2dc: ff f7 1b ff  	bl	0x116 <cond_function2>  @ imm = #-458
     2e0: 02 90        	str	r0, [sp, #8]
     2e2: 19 48        	ldr	r0, [pc, #100]          @ 0x348 <$d.5>
     2e4: 01 90        	str	r0, [sp, #4]
     2e6: 02 a8        	add	r0, sp, #8
     2e8: 00 90        	str	r0, [sp]
     2ea: 00 f0 00 fb  	bl	0x8ee <__primask_r>     @ imm = #1536
     2ee: 05 46        	mov	r5, r0
     2f0: 25 40        	ands	r5, r4
     2f2: 00 f0 f8 fa  	bl	0x8e6 <__cpsid>         @ imm = #1520
     2f6: 30 68        	ldr	r0, [r6]
     2f8: 01 28        	cmp	r0, #1
     2fa: 0c d0        	beq	0x316 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x1da> @ imm = #24
     2fc: 03 20        	movs	r0, #3
     2fe: 06 90        	str	r0, [sp, #24]
     300: 04 20        	movs	r0, #4
     302: 05 90        	str	r0, [sp, #20]
     304: 12 48        	ldr	r0, [pc, #72]           @ 0x350 <$d.5+0x8>
     306: 04 90        	str	r0, [sp, #16]
     308: 04 a9        	add	r1, sp, #16
     30a: 20 46        	mov	r0, r4
     30c: ab be        	bkpt	#171
     30e: 41 1c        	adds	r1, r0, #1
     310: 11 d0        	beq	0x336 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x1fa> @ imm = #34
     312: 34 60        	str	r4, [r6]
     314: 70 60        	str	r0, [r6, #4]
     316: 30 1d        	adds	r0, r6, #4
     318: 03 90        	str	r0, [sp, #12]
     31a: 09 94        	str	r4, [sp, #36]
     31c: 68 46        	mov	r0, sp
     31e: 08 90        	str	r0, [sp, #32]
     320: 00 20        	movs	r0, #0
     322: 07 90        	str	r0, [sp, #28]
     324: 06 90        	str	r0, [sp, #24]
     326: 02 20        	movs	r0, #2
     328: 05 90        	str	r0, [sp, #20]
     32a: 0e 48        	ldr	r0, [pc, #56]           @ 0x364 <$d.5+0x1c>
     32c: 04 90        	str	r0, [sp, #16]
     32e: 03 a8        	add	r0, sp, #12
     330: 04 a9        	add	r1, sp, #16
     332: 00 f0 77 f9  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #750
     336: 00 2d        	cmp	r5, #0
     338: 01 d1        	bne	0x33e <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x202> @ imm = #2
     33a: 00 f0 d6 fa  	bl	0x8ea <__cpsie>         @ imm = #1452
     33e: 18 20        	movs	r0, #24
     340: 09 49        	ldr	r1, [pc, #36]           @ 0x368 <$d.5+0x20>
     342: ab be        	bkpt	#171
     344: fe e7        	b	0x344 <inc::__cortex_m_rt_main::h2ce682e83d39bdf4+0x208> @ imm = #-4
     346: c0 46        	mov	r8, r8

00000348 <$d.5>:
     348:	71 03 00 00	.word	0x00000371
     34c:	00 00 00 20	.word	0x20000000
     350:	10 0c 00 00	.word	0x00000c10
     354:	a8 0a 00 00	.word	0x00000aa8
     358:	c4 0a 00 00	.word	0x00000ac4
     35c:	e0 0a 00 00	.word	0x00000ae0
     360:	00 0b 00 00	.word	0x00000b00
     364:	20 0b 00 00	.word	0x00000b20
     368:	26 00 02 00	.word	0x00020026

0000036c <core::ops::function::FnOnce::call_once::hfdbdf61b6267721c>:
     36c: 00 68        	ldr	r0, [r0]
     36e: fe e7        	b	0x36e <core::ops::function::FnOnce::call_once::hfdbdf61b6267721c+0x2> @ imm = #-4

00000370 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc>:
     370: f0 b5        	push	{r4, r5, r6, r7, lr}
     372: 03 af        	add	r7, sp, #12
     374: 93 b0        	sub	sp, #76
     376: 06 91        	str	r1, [sp, #24]
     378: 02 68        	ldr	r2, [r0]
     37a: 95 49        	ldr	r1, [pc, #596]          @ 0x5d0 <$d.8>
     37c: 27 25        	movs	r5, #39
     37e: 8a 42        	cmp	r2, r1
     380: 2d d3        	blo	0x3de <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x6e> @ imm = #90
     382: 14 46        	mov	r4, r2
     384: 08 95        	str	r5, [sp, #32]
     386: 20 46        	mov	r0, r4
     388: 91 49        	ldr	r1, [pc, #580]          @ 0x5d0 <$d.8>
     38a: 00 f0 b3 fa  	bl	0x8f4 <__aeabi_uidiv>   @ imm = #1382
     38e: 07 90        	str	r0, [sp, #28]
     390: 91 49        	ldr	r1, [pc, #580]          @ 0x5d8 <$d.8+0x8>
     392: 41 43        	muls	r1, r0, r1
     394: 09 19        	adds	r1, r1, r4
     396: 8a b2        	uxth	r2, r1
     398: 92 08        	lsrs	r2, r2, #2
     39a: 90 48        	ldr	r0, [pc, #576]          @ 0x5dc <$d.8+0xc>
     39c: 42 43        	muls	r2, r0, r2
     39e: 52 0c        	lsrs	r2, r2, #17
     3a0: 53 00        	lsls	r3, r2, #1
     3a2: 8f 48        	ldr	r0, [pc, #572]          @ 0x5e0 <$d.8+0x10>
     3a4: c0 5c        	ldrb	r0, [r0, r3]
     3a6: 09 ae        	add	r6, sp, #36
     3a8: 76 19        	adds	r6, r6, r5
     3aa: 35 1f        	subs	r5, r6, #4
     3ac: 28 70        	strb	r0, [r5]
     3ae: 8c 48        	ldr	r0, [pc, #560]          @ 0x5e0 <$d.8+0x10>
     3b0: c0 18        	adds	r0, r0, r3
     3b2: 40 78        	ldrb	r0, [r0, #1]
     3b4: 68 70        	strb	r0, [r5, #1]
     3b6: 08 9d        	ldr	r5, [sp, #32]
     3b8: 86 48        	ldr	r0, [pc, #536]          @ 0x5d4 <$d.8+0x4>
     3ba: 42 43        	muls	r2, r0, r2
     3bc: 50 18        	adds	r0, r2, r1
     3be: 80 b2        	uxth	r0, r0
     3c0: 40 00        	lsls	r0, r0, #1
     3c2: 87 4a        	ldr	r2, [pc, #540]          @ 0x5e0 <$d.8+0x10>
     3c4: 11 5c        	ldrb	r1, [r2, r0]
     3c6: 13 46        	mov	r3, r2
     3c8: b2 1e        	subs	r2, r6, #2
     3ca: 11 70        	strb	r1, [r2]
     3cc: 18 18        	adds	r0, r3, r0
     3ce: 40 78        	ldrb	r0, [r0, #1]
     3d0: 50 70        	strb	r0, [r2, #1]
     3d2: 07 9a        	ldr	r2, [sp, #28]
     3d4: 2d 1f        	subs	r5, r5, #4
     3d6: 83 48        	ldr	r0, [pc, #524]          @ 0x5e4 <$d.8+0x14>
     3d8: 84 42        	cmp	r4, r0
     3da: 14 46        	mov	r4, r2
     3dc: d2 d8        	bhi	0x384 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x14> @ imm = #-92
     3de: 63 2a        	cmp	r2, #99
     3e0: 23 d9        	bls	0x42a <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xba> @ imm = #70
     3e2: 90 b2        	uxth	r0, r2
     3e4: 80 08        	lsrs	r0, r0, #2
     3e6: 7d 49        	ldr	r1, [pc, #500]          @ 0x5dc <$d.8+0xc>
     3e8: 41 43        	muls	r1, r0, r1
     3ea: 49 0c        	lsrs	r1, r1, #17
     3ec: 63 20        	movs	r0, #99
     3ee: c0 43        	mvns	r0, r0
     3f0: 48 43        	muls	r0, r1, r0
     3f2: 80 18        	adds	r0, r0, r2
     3f4: 80 b2        	uxth	r0, r0
     3f6: 40 00        	lsls	r0, r0, #1
     3f8: 79 4a        	ldr	r2, [pc, #484]          @ 0x5e0 <$d.8+0x10>
     3fa: 13 5c        	ldrb	r3, [r2, r0]
     3fc: ad 1e        	subs	r5, r5, #2
     3fe: 09 ac        	add	r4, sp, #36
     400: 63 55        	strb	r3, [r4, r5]
     402: 2e 46        	mov	r6, r5
     404: 63 19        	adds	r3, r4, r5
     406: 10 18        	adds	r0, r2, r0
     408: 40 78        	ldrb	r0, [r0, #1]
     40a: 58 70        	strb	r0, [r3, #1]
     40c: 0a 29        	cmp	r1, #10
     40e: 06 9d        	ldr	r5, [sp, #24]
     410: 10 d3        	blo	0x434 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xc4> @ imm = #32
     412: 48 00        	lsls	r0, r1, #1
     414: 72 49        	ldr	r1, [pc, #456]          @ 0x5e0 <$d.8+0x10>
     416: 0a 5c        	ldrb	r2, [r1, r0]
     418: b4 1e        	subs	r4, r6, #2
     41a: 09 ab        	add	r3, sp, #36
     41c: 1a 55        	strb	r2, [r3, r4]
     41e: 08 94        	str	r4, [sp, #32]
     420: 1a 19        	adds	r2, r3, r4
     422: 08 18        	adds	r0, r1, r0
     424: 40 78        	ldrb	r0, [r0, #1]
     426: 50 70        	strb	r0, [r2, #1]
     428: 09 e0        	b	0x43e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xce> @ imm = #18
     42a: 2e 46        	mov	r6, r5
     42c: 11 46        	mov	r1, r2
     42e: 0a 29        	cmp	r1, #10
     430: 06 9d        	ldr	r5, [sp, #24]
     432: ee d2        	bhs	0x412 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xa2> @ imm = #-36
     434: 72 1e        	subs	r2, r6, #1
     436: 30 31        	adds	r1, #48
     438: 09 a8        	add	r0, sp, #36
     43a: 08 92        	str	r2, [sp, #32]
     43c: 81 54        	strb	r1, [r0, r2]
     43e: 27 21        	movs	r1, #39
     440: 28 68        	ldr	r0, [r5]
     442: 01 22        	movs	r2, #1
     444: 06 46        	mov	r6, r0
     446: 05 92        	str	r2, [sp, #20]
     448: 16 40        	ands	r6, r2
     44a: 11 22        	movs	r2, #17
     44c: 13 04        	lsls	r3, r2, #16
     44e: 00 2e        	cmp	r6, #0
     450: 02 93        	str	r3, [sp, #8]
     452: 00 d0        	beq	0x456 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0xe6> @ imm = #0
     454: 2b 23        	movs	r3, #43
     456: 08 9a        	ldr	r2, [sp, #32]
     458: 8c 1a        	subs	r4, r1, r2
     45a: 09 a9        	add	r1, sp, #36
     45c: 89 18        	adds	r1, r1, r2
     45e: 04 91        	str	r1, [sp, #16]
     460: 41 07        	lsls	r1, r0, #29
     462: c9 17        	asrs	r1, r1, #31
     464: 60 4a        	ldr	r2, [pc, #384]          @ 0x5e8 <$d.8+0x18>
     466: 0a 40        	ands	r2, r1
     468: 06 9d        	ldr	r5, [sp, #24]
     46a: a9 68        	ldr	r1, [r5, #8]
     46c: 00 29        	cmp	r1, #0
     46e: 19 d0        	beq	0x4a4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x134> @ imm = #50
     470: 03 92        	str	r2, [sp, #12]
     472: a1 19        	adds	r1, r4, r6
     474: ea 68        	ldr	r2, [r5, #12]
     476: 8a 42        	cmp	r2, r1
     478: 1d d9        	bls	0x4b6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x146> @ imm = #58
     47a: 07 92        	str	r2, [sp, #28]
     47c: 01 94        	str	r4, [sp, #4]
     47e: 00 07        	lsls	r0, r0, #28
     480: 2a d4        	bmi	0x4d8 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x168> @ imm = #84
     482: 1d 46        	mov	r5, r3
     484: 20 20        	movs	r0, #32
     486: 06 9b        	ldr	r3, [sp, #24]
     488: 1a 5c        	ldrb	r2, [r3, r0]
     48a: 03 2a        	cmp	r2, #3
     48c: 00 d1        	bne	0x490 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x120> @ imm = #0
     48e: 01 22        	movs	r2, #1
     490: 07 98        	ldr	r0, [sp, #28]
     492: 40 1a        	subs	r0, r0, r1
     494: 91 07        	lsls	r1, r2, #30
     496: 44 d0        	beq	0x522 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1b2> @ imm = #136
     498: 01 2a        	cmp	r2, #1
     49a: 44 d1        	bne	0x526 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1b6> @ imm = #136
     49c: 00 21        	movs	r1, #0
     49e: 00 91        	str	r1, [sp]
     4a0: 01 46        	mov	r1, r0
     4a2: 44 e0        	b	0x52e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1be> @ imm = #136
     4a4: 28 46        	mov	r0, r5
     4a6: 19 46        	mov	r1, r3
     4a8: 00 f0 a0 f8  	bl	0x5ec <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #320
     4ac: 00 28        	cmp	r0, #0
     4ae: 09 d0        	beq	0x4c4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x154> @ imm = #18
     4b0: 05 98        	ldr	r0, [sp, #20]
     4b2: 13 b0        	add	sp, #76
     4b4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     4b6: 28 46        	mov	r0, r5
     4b8: 19 46        	mov	r1, r3
     4ba: 03 9a        	ldr	r2, [sp, #12]
     4bc: 00 f0 96 f8  	bl	0x5ec <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #300
     4c0: 00 28        	cmp	r0, #0
     4c2: f5 d1        	bne	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-22
     4c4: a8 69        	ldr	r0, [r5, #24]
     4c6: e9 69        	ldr	r1, [r5, #28]
     4c8: cb 68        	ldr	r3, [r1, #12]
     4ca: 04 99        	ldr	r1, [sp, #16]
     4cc: 22 46        	mov	r2, r4
     4ce: 98 47        	blx	r3
     4d0: 05 90        	str	r0, [sp, #20]
     4d2: 05 98        	ldr	r0, [sp, #20]
     4d4: 13 b0        	add	sp, #76
     4d6: f0 bd        	pop	{r4, r5, r6, r7, pc}
     4d8: 20 20        	movs	r0, #32
     4da: 06 9d        	ldr	r5, [sp, #24]
     4dc: 2c 5c        	ldrb	r4, [r5, r0]
     4de: 01 21        	movs	r1, #1
     4e0: 05 91        	str	r1, [sp, #20]
     4e2: 29 54        	strb	r1, [r5, r0]
     4e4: 68 68        	ldr	r0, [r5, #4]
     4e6: 02 90        	str	r0, [sp, #8]
     4e8: 30 20        	movs	r0, #48
     4ea: 68 60        	str	r0, [r5, #4]
     4ec: 28 46        	mov	r0, r5
     4ee: 19 46        	mov	r1, r3
     4f0: 03 9a        	ldr	r2, [sp, #12]
     4f2: 00 f0 7b f8  	bl	0x5ec <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #246
     4f6: 00 28        	cmp	r0, #0
     4f8: da d1        	bne	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-76
     4fa: 03 94        	str	r4, [sp, #12]
     4fc: 28 46        	mov	r0, r5
     4fe: 20 30        	adds	r0, #32
     500: 00 90        	str	r0, [sp]
     502: 08 98        	ldr	r0, [sp, #32]
     504: 07 99        	ldr	r1, [sp, #28]
     506: 40 18        	adds	r0, r0, r1
     508: 86 1b        	subs	r6, r0, r6
     50a: 26 3e        	subs	r6, #38
     50c: ac 69        	ldr	r4, [r5, #24]
     50e: ed 69        	ldr	r5, [r5, #28]
     510: 76 1e        	subs	r6, r6, #1
     512: 42 d0        	beq	0x59a <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x22a> @ imm = #132
     514: 2a 69        	ldr	r2, [r5, #16]
     516: 30 21        	movs	r1, #48
     518: 20 46        	mov	r0, r4
     51a: 90 47        	blx	r2
     51c: 00 28        	cmp	r0, #0
     51e: f7 d0        	beq	0x510 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1a0> @ imm = #-18
     520: c6 e7        	b	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-116
     522: 00 21        	movs	r1, #0
     524: 02 e0        	b	0x52c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1bc> @ imm = #4
     526: 41 08        	lsrs	r1, r0, #1
     528: 40 1c        	adds	r0, r0, #1
     52a: 40 08        	lsrs	r0, r0, #1
     52c: 00 90        	str	r0, [sp]
     52e: 4c 1c        	adds	r4, r1, #1
     530: 5e 68        	ldr	r6, [r3, #4]
     532: 98 69        	ldr	r0, [r3, #24]
     534: 08 90        	str	r0, [sp, #32]
     536: d8 69        	ldr	r0, [r3, #28]
     538: 07 90        	str	r0, [sp, #28]
     53a: 01 20        	movs	r0, #1
     53c: 05 90        	str	r0, [sp, #20]
     53e: 64 1e        	subs	r4, r4, #1
     540: 07 d0        	beq	0x552 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1e2> @ imm = #14
     542: 07 98        	ldr	r0, [sp, #28]
     544: 02 69        	ldr	r2, [r0, #16]
     546: 08 98        	ldr	r0, [sp, #32]
     548: 31 46        	mov	r1, r6
     54a: 90 47        	blx	r2
     54c: 00 28        	cmp	r0, #0
     54e: f6 d0        	beq	0x53e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1ce> @ imm = #-20
     550: ae e7        	b	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-164
     552: 02 98        	ldr	r0, [sp, #8]
     554: 86 42        	cmp	r6, r0
     556: 01 d1        	bne	0x55c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x1ec> @ imm = #2
     558: 00 21        	movs	r1, #0
     55a: 00 91        	str	r1, [sp]
     55c: 29 46        	mov	r1, r5
     55e: 03 9a        	ldr	r2, [sp, #12]
     560: 86 42        	cmp	r6, r0
     562: a5 d0        	beq	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-182
     564: 06 98        	ldr	r0, [sp, #24]
     566: 00 f0 41 f8  	bl	0x5ec <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a> @ imm = #130
     56a: 00 28        	cmp	r0, #0
     56c: a0 d1        	bne	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-192
     56e: 07 98        	ldr	r0, [sp, #28]
     570: c3 68        	ldr	r3, [r0, #12]
     572: 08 98        	ldr	r0, [sp, #32]
     574: 04 99        	ldr	r1, [sp, #16]
     576: 01 9a        	ldr	r2, [sp, #4]
     578: 98 47        	blx	r3
     57a: 00 28        	cmp	r0, #0
     57c: 98 d1        	bne	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-208
     57e: 00 24        	movs	r4, #0
     580: 00 9d        	ldr	r5, [sp]
     582: a5 42        	cmp	r5, r4
     584: 17 d0        	beq	0x5b6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x246> @ imm = #46
     586: 07 98        	ldr	r0, [sp, #28]
     588: 02 69        	ldr	r2, [r0, #16]
     58a: 08 98        	ldr	r0, [sp, #32]
     58c: 31 46        	mov	r1, r6
     58e: 90 47        	blx	r2
     590: 64 1c        	adds	r4, r4, #1
     592: 00 28        	cmp	r0, #0
     594: f5 d0        	beq	0x582 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x212> @ imm = #-22
     596: 60 1e        	subs	r0, r4, #1
     598: 0e e0        	b	0x5b8 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x248> @ imm = #28
     59a: eb 68        	ldr	r3, [r5, #12]
     59c: 20 46        	mov	r0, r4
     59e: 04 99        	ldr	r1, [sp, #16]
     5a0: 01 9a        	ldr	r2, [sp, #4]
     5a2: 98 47        	blx	r3
     5a4: 00 28        	cmp	r0, #0
     5a6: 06 98        	ldr	r0, [sp, #24]
     5a8: 82 d1        	bne	0x4b0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x140> @ imm = #-252
     5aa: 03 99        	ldr	r1, [sp, #12]
     5ac: 00 9a        	ldr	r2, [sp]
     5ae: 11 70        	strb	r1, [r2]
     5b0: 02 99        	ldr	r1, [sp, #8]
     5b2: 41 60        	str	r1, [r0, #4]
     5b4: 02 e0        	b	0x5bc <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x24c> @ imm = #4
     5b6: 28 46        	mov	r0, r5
     5b8: a8 42        	cmp	r0, r5
     5ba: 04 d3        	blo	0x5c6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x256> @ imm = #8
     5bc: 00 20        	movs	r0, #0
     5be: 05 90        	str	r0, [sp, #20]
     5c0: 05 98        	ldr	r0, [sp, #20]
     5c2: 13 b0        	add	sp, #76
     5c4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     5c6: 01 20        	movs	r0, #1
     5c8: 05 90        	str	r0, [sp, #20]
     5ca: 05 98        	ldr	r0, [sp, #20]
     5cc: 13 b0        	add	sp, #76
     5ce: f0 bd        	pop	{r4, r5, r6, r7, pc}

000005d0 <$d.8>:
     5d0:	10 27 00 00	.word	0x00002710
     5d4:	9c ff 00 00	.word	0x0000ff9c
     5d8:	f0 d8 ff ff	.word	0xffffd8f0
     5dc:	7b 14 00 00	.word	0x0000147b
     5e0:	30 0b 00 00	.word	0x00000b30
     5e4:	ff e0 f5 05	.word	0x05f5e0ff
     5e8:	f8 0b 00 00	.word	0x00000bf8

000005ec <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a>:
     5ec: b0 b5        	push	{r4, r5, r7, lr}
     5ee: 02 af        	add	r7, sp, #8
     5f0: 14 46        	mov	r4, r2
     5f2: 05 46        	mov	r5, r0
     5f4: 11 20        	movs	r0, #17
     5f6: 00 04        	lsls	r0, r0, #16
     5f8: 81 42        	cmp	r1, r0
     5fa: 07 d0        	beq	0x60c <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x20> @ imm = #14
     5fc: a8 69        	ldr	r0, [r5, #24]
     5fe: ea 69        	ldr	r2, [r5, #28]
     600: 12 69        	ldr	r2, [r2, #16]
     602: 90 47        	blx	r2
     604: 00 28        	cmp	r0, #0
     606: 01 d0        	beq	0x60c <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x20> @ imm = #2
     608: 01 20        	movs	r0, #1
     60a: b0 bd        	pop	{r4, r5, r7, pc}
     60c: 00 2c        	cmp	r4, #0
     60e: 06 d0        	beq	0x61e <core::fmt::Formatter::pad_integral::write_prefix::h97a383d13138fa8a+0x32> @ imm = #12
     610: a8 69        	ldr	r0, [r5, #24]
     612: e9 69        	ldr	r1, [r5, #28]
     614: cb 68        	ldr	r3, [r1, #12]
     616: 00 22        	movs	r2, #0
     618: 21 46        	mov	r1, r4
     61a: 98 47        	blx	r3
     61c: b0 bd        	pop	{r4, r5, r7, pc}
     61e: 00 20        	movs	r0, #0
     620: b0 bd        	pop	{r4, r5, r7, pc}
     622: d4 d4        	bmi	0x5ce <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::hb2b5d6cd3462e0cc+0x25e> @ imm = #-88

00000624 <core::fmt::write::he9beb2966ab2d949>:
     624: f0 b5        	push	{r4, r5, r6, r7, lr}
     626: 03 af        	add	r7, sp, #12
     628: 91 b0        	sub	sp, #68
     62a: 20 23        	movs	r3, #32
     62c: 08 ac        	add	r4, sp, #32
     62e: 03 22        	movs	r2, #3
     630: 07 94        	str	r4, [sp, #28]
     632: e2 54        	strb	r2, [r4, r3]
     634: 09 93        	str	r3, [sp, #36]
     636: 00 22        	movs	r2, #0
     638: 08 92        	str	r2, [sp, #32]
     63a: 51 4b        	ldr	r3, [pc, #324]          @ 0x780 <$d.11>
     63c: 0f 93        	str	r3, [sp, #60]
     63e: 0e 90        	str	r0, [sp, #56]
     640: 0c 92        	str	r2, [sp, #48]
     642: 0a 92        	str	r2, [sp, #40]
     644: 8d 68        	ldr	r5, [r1, #8]
     646: 00 2d        	cmp	r5, #0
     648: 60 d0        	beq	0x70c <core::fmt::write::he9beb2966ab2d949+0xe8> @ imm = #192
     64a: c8 68        	ldr	r0, [r1, #12]
     64c: 00 28        	cmp	r0, #0
     64e: 14 46        	mov	r4, r2
     650: 00 d1        	bne	0x654 <core::fmt::write::he9beb2966ab2d949+0x30> @ imm = #0
     652: 80 e0        	b	0x756 <core::fmt::write::he9beb2966ab2d949+0x132> @ imm = #256
     654: 02 92        	str	r2, [sp, #8]
     656: 07 9a        	ldr	r2, [sp, #28]
     658: 20 32        	adds	r2, #32
     65a: 07 92        	str	r2, [sp, #28]
     65c: 1f 22        	movs	r2, #31
     65e: d3 06        	lsls	r3, r2, #27
     660: 42 1e        	subs	r2, r0, #1
     662: 9a 43        	bics	r2, r3
     664: 52 1c        	adds	r2, r2, #1
     666: 01 92        	str	r2, [sp, #4]
     668: 40 01        	lsls	r0, r0, #5
     66a: 04 90        	str	r0, [sp, #16]
     66c: 06 91        	str	r1, [sp, #24]
     66e: 0c 68        	ldr	r4, [r1]
     670: 00 26        	movs	r6, #0
     672: 05 95        	str	r5, [sp, #20]
     674: 62 68        	ldr	r2, [r4, #4]
     676: 00 2a        	cmp	r2, #0
     678: 06 d0        	beq	0x688 <core::fmt::write::he9beb2966ab2d949+0x64> @ imm = #12
     67a: 0f 98        	ldr	r0, [sp, #60]
     67c: c3 68        	ldr	r3, [r0, #12]
     67e: 21 68        	ldr	r1, [r4]
     680: 0e 98        	ldr	r0, [sp, #56]
     682: 98 47        	blx	r3
     684: 00 28        	cmp	r0, #0
     686: 75 d1        	bne	0x774 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #234
     688: aa 19        	adds	r2, r5, r6
     68a: 10 7f        	ldrb	r0, [r2, #28]
     68c: 07 99        	ldr	r1, [sp, #28]
     68e: 08 70        	strb	r0, [r1]
     690: 50 68        	ldr	r0, [r2, #4]
     692: 09 90        	str	r0, [sp, #36]
     694: 90 68        	ldr	r0, [r2, #8]
     696: 08 90        	str	r0, [sp, #32]
     698: 50 69        	ldr	r0, [r2, #20]
     69a: 93 69        	ldr	r3, [r2, #24]
     69c: 06 99        	ldr	r1, [sp, #24]
     69e: 09 69        	ldr	r1, [r1, #16]
     6a0: 00 25        	movs	r5, #0
     6a2: 00 28        	cmp	r0, #0
     6a4: 0d d0        	beq	0x6c2 <core::fmt::write::he9beb2966ab2d949+0x9e> @ imm = #26
     6a6: 01 28        	cmp	r0, #1
     6a8: 28 46        	mov	r0, r5
     6aa: 0b d1        	bne	0x6c4 <core::fmt::write::he9beb2966ab2d949+0xa0> @ imm = #22
     6ac: d8 00        	lsls	r0, r3, #3
     6ae: 03 90        	str	r0, [sp, #12]
     6b0: 08 18        	adds	r0, r1, r0
     6b2: 40 68        	ldr	r0, [r0, #4]
     6b4: 33 4b        	ldr	r3, [pc, #204]          @ 0x784 <$d.11+0x4>
     6b6: 98 42        	cmp	r0, r3
     6b8: 28 46        	mov	r0, r5
     6ba: 03 d1        	bne	0x6c4 <core::fmt::write::he9beb2966ab2d949+0xa0> @ imm = #6
     6bc: 03 98        	ldr	r0, [sp, #12]
     6be: 08 58        	ldr	r0, [r1, r0]
     6c0: 03 68        	ldr	r3, [r0]
     6c2: 01 20        	movs	r0, #1
     6c4: 0b 93        	str	r3, [sp, #44]
     6c6: 0a 90        	str	r0, [sp, #40]
     6c8: d0 68        	ldr	r0, [r2, #12]
     6ca: 12 69        	ldr	r2, [r2, #16]
     6cc: 00 28        	cmp	r0, #0
     6ce: 09 d0        	beq	0x6e4 <core::fmt::write::he9beb2966ab2d949+0xc0> @ imm = #18
     6d0: 01 28        	cmp	r0, #1
     6d2: 09 d1        	bne	0x6e8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #18
     6d4: d0 00        	lsls	r0, r2, #3
     6d6: 0a 18        	adds	r2, r1, r0
     6d8: 52 68        	ldr	r2, [r2, #4]
     6da: 2a 4b        	ldr	r3, [pc, #168]          @ 0x784 <$d.11+0x4>
     6dc: 9a 42        	cmp	r2, r3
     6de: 03 d1        	bne	0x6e8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #6
     6e0: 08 58        	ldr	r0, [r1, r0]
     6e2: 02 68        	ldr	r2, [r0]
     6e4: 01 25        	movs	r5, #1
     6e6: ff e7        	b	0x6e8 <core::fmt::write::he9beb2966ab2d949+0xc4> @ imm = #-2
     6e8: 0d 92        	str	r2, [sp, #52]
     6ea: 0c 95        	str	r5, [sp, #48]
     6ec: 05 9d        	ldr	r5, [sp, #20]
     6ee: a8 59        	ldr	r0, [r5, r6]
     6f0: c2 00        	lsls	r2, r0, #3
     6f2: 88 58        	ldr	r0, [r1, r2]
     6f4: 89 18        	adds	r1, r1, r2
     6f6: 4a 68        	ldr	r2, [r1, #4]
     6f8: 08 a9        	add	r1, sp, #32
     6fa: 90 47        	blx	r2
     6fc: 00 28        	cmp	r0, #0
     6fe: 39 d1        	bne	0x774 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #114
     700: 20 36        	adds	r6, #32
     702: 08 34        	adds	r4, #8
     704: 04 98        	ldr	r0, [sp, #16]
     706: b0 42        	cmp	r0, r6
     708: b4 d1        	bne	0x674 <core::fmt::write::he9beb2966ab2d949+0x50> @ imm = #-152
     70a: 21 e0        	b	0x750 <core::fmt::write::he9beb2966ab2d949+0x12c> @ imm = #66
     70c: 48 69        	ldr	r0, [r1, #20]
     70e: 00 28        	cmp	r0, #0
     710: 14 46        	mov	r4, r2
     712: 20 d0        	beq	0x756 <core::fmt::write::he9beb2966ab2d949+0x132> @ imm = #64
     714: 02 92        	str	r2, [sp, #8]
     716: 07 22        	movs	r2, #7
     718: 52 07        	lsls	r2, r2, #29
     71a: 40 1e        	subs	r0, r0, #1
     71c: 90 43        	bics	r0, r2
     71e: 46 1c        	adds	r6, r0, #1
     720: 0c 68        	ldr	r4, [r1]
     722: 06 91        	str	r1, [sp, #24]
     724: 0d 69        	ldr	r5, [r1, #16]
     726: 01 96        	str	r6, [sp, #4]
     728: 62 68        	ldr	r2, [r4, #4]
     72a: 00 2a        	cmp	r2, #0
     72c: 06 d0        	beq	0x73c <core::fmt::write::he9beb2966ab2d949+0x118> @ imm = #12
     72e: 0f 98        	ldr	r0, [sp, #60]
     730: c3 68        	ldr	r3, [r0, #12]
     732: 21 68        	ldr	r1, [r4]
     734: 0e 98        	ldr	r0, [sp, #56]
     736: 98 47        	blx	r3
     738: 00 28        	cmp	r0, #0
     73a: 1b d1        	bne	0x774 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #54
     73c: 05 cd        	ldm	r5!, {r0, r2}
     73e: 08 a9        	add	r1, sp, #32
     740: 08 3d        	subs	r5, #8
     742: 90 47        	blx	r2
     744: 00 28        	cmp	r0, #0
     746: 15 d1        	bne	0x774 <core::fmt::write::he9beb2966ab2d949+0x150> @ imm = #42
     748: 08 35        	adds	r5, #8
     74a: 08 34        	adds	r4, #8
     74c: 76 1e        	subs	r6, r6, #1
     74e: eb d1        	bne	0x728 <core::fmt::write::he9beb2966ab2d949+0x104> @ imm = #-42
     750: 02 9a        	ldr	r2, [sp, #8]
     752: 06 99        	ldr	r1, [sp, #24]
     754: 01 9c        	ldr	r4, [sp, #4]
     756: 48 68        	ldr	r0, [r1, #4]
     758: 84 42        	cmp	r4, r0
     75a: 02 d2        	bhs	0x762 <core::fmt::write::he9beb2966ab2d949+0x13e> @ imm = #4
     75c: e3 00        	lsls	r3, r4, #3
     75e: 0a 68        	ldr	r2, [r1]
     760: d2 18        	adds	r2, r2, r3
     762: 84 42        	cmp	r4, r0
     764: 09 d2        	bhs	0x77a <core::fmt::write::he9beb2966ab2d949+0x156> @ imm = #18
     766: 0f 98        	ldr	r0, [sp, #60]
     768: c3 68        	ldr	r3, [r0, #12]
     76a: 06 ca        	ldm	r2, {r1, r2}
     76c: 0e 98        	ldr	r0, [sp, #56]
     76e: 98 47        	blx	r3
     770: 00 28        	cmp	r0, #0
     772: 02 d0        	beq	0x77a <core::fmt::write::he9beb2966ab2d949+0x156> @ imm = #4
     774: 01 20        	movs	r0, #1
     776: 11 b0        	add	sp, #68
     778: f0 bd        	pop	{r4, r5, r6, r7, pc}
     77a: 00 20        	movs	r0, #0
     77c: 11 b0        	add	sp, #68
     77e: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000780 <$d.11>:
     780:	f8 0b 00 00	.word	0x00000bf8
     784:	6d 03 00 00	.word	0x0000036d

00000788 <WWDG>:
     788: fe e7        	b	0x788 <WWDG>            @ imm = #-4

0000078a <__pre_init>:
     78a: 70 47        	bx	lr

0000078c <core::ptr::drop_in_place<&mut cortex_m_semihosting::hio::HostStream>::h09e14c05280b3224>:
     78c: 70 47        	bx	lr

0000078e <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967>:
     78e: f0 b5        	push	{r4, r5, r6, r7, lr}
     790: 03 af        	add	r7, sp, #12
     792: 85 b0        	sub	sp, #20
     794: 00 2a        	cmp	r2, #0
     796: 33 d0        	beq	0x800 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x72> @ imm = #102
     798: 15 46        	mov	r5, r2
     79a: 0c 46        	mov	r4, r1
     79c: 00 68        	ldr	r0, [r0]
     79e: 00 68        	ldr	r0, [r0]
     7a0: 01 90        	str	r0, [sp, #4]
     7a2: 02 ab        	add	r3, sp, #8
     7a4: 07 c3        	stm	r3!, {r0, r1, r2}
     7a6: 05 20        	movs	r0, #5
     7a8: 02 a9        	add	r1, sp, #8
     7aa: 00 90        	str	r0, [sp]
     7ac: ab be        	bkpt	#171
     7ae: 41 42        	rsbs	r1, r0, #0
     7b0: 41 41        	adcs	r1, r0
     7b2: 01 23        	movs	r3, #1
     7b4: 90 42        	cmp	r0, r2
     7b6: 1a 46        	mov	r2, r3
     7b8: 00 d8        	bhi	0x7bc <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x2e> @ imm = #0
     7ba: 00 22        	movs	r2, #0
     7bc: 0a 43        	orrs	r2, r1
     7be: 06 d0        	beq	0x7ce <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x40> @ imm = #12
     7c0: 01 20        	movs	r0, #1
     7c2: 48 40        	eors	r0, r1
     7c4: 05 b0        	add	sp, #20
     7c6: f0 bd        	pop	{r4, r5, r6, r7, pc}
     7c8: 01 2e        	cmp	r6, #1
     7ca: 15 46        	mov	r5, r2
     7cc: f8 d0        	beq	0x7c0 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x32> @ imm = #-16
     7ce: 02 46        	mov	r2, r0
     7d0: 01 98        	ldr	r0, [sp, #4]
     7d2: 02 90        	str	r0, [sp, #8]
     7d4: 04 92        	str	r2, [sp, #16]
     7d6: a8 1a        	subs	r0, r5, r2
     7d8: 24 18        	adds	r4, r4, r0
     7da: 03 94        	str	r4, [sp, #12]
     7dc: 02 a9        	add	r1, sp, #8
     7de: 00 98        	ldr	r0, [sp]
     7e0: ab be        	bkpt	#171
     7e2: 41 42        	rsbs	r1, r0, #0
     7e4: 41 41        	adcs	r1, r0
     7e6: 82 42        	cmp	r2, r0
     7e8: 04 d3        	blo	0x7f4 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x66> @ imm = #8
     7ea: 00 25        	movs	r5, #0
     7ec: 00 28        	cmp	r0, #0
     7ee: 1e 46        	mov	r6, r3
     7f0: ea d0        	beq	0x7c8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-44
     7f2: 03 e0        	b	0x7fc <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x6e> @ imm = #6
     7f4: 01 25        	movs	r5, #1
     7f6: 00 28        	cmp	r0, #0
     7f8: 1e 46        	mov	r6, r3
     7fa: e5 d0        	beq	0x7c8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-54
     7fc: 2e 46        	mov	r6, r5
     7fe: e3 e7        	b	0x7c8 <<&mut W as core::fmt::Write>::write_str::h03f409bf3c95f967+0x3a> @ imm = #-58
     800: 00 20        	movs	r0, #0
     802: 05 b0        	add	sp, #20
     804: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000806 <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2>:
     806: f0 b5        	push	{r4, r5, r6, r7, lr}
     808: 03 af        	add	r7, sp, #12
     80a: 84 b0        	sub	sp, #16
     80c: 00 68        	ldr	r0, [r0]
     80e: 00 22        	movs	r2, #0
     810: 00 92        	str	r2, [sp]
     812: 80 29        	cmp	r1, #128
     814: 03 d2        	bhs	0x81e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x18> @ imm = #6
     816: 6a 46        	mov	r2, sp
     818: 11 70        	strb	r1, [r2]
     81a: 01 24        	movs	r4, #1
     81c: 2f e0        	b	0x87e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #94
     81e: ca 0a        	lsrs	r2, r1, #11
     820: 0a d1        	bne	0x838 <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x32> @ imm = #20
     822: 3f 22        	movs	r2, #63
     824: 0a 40        	ands	r2, r1
     826: 80 32        	adds	r2, #128
     828: 6b 46        	mov	r3, sp
     82a: 5a 70        	strb	r2, [r3, #1]
     82c: 89 09        	lsrs	r1, r1, #6
     82e: c0 22        	movs	r2, #192
     830: 0a 43        	orrs	r2, r1
     832: 1a 70        	strb	r2, [r3]
     834: 02 24        	movs	r4, #2
     836: 22 e0        	b	0x87e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #68
     838: 0a 0c        	lsrs	r2, r1, #16
     83a: 0e d1        	bne	0x85a <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x54> @ imm = #28
     83c: 3f 22        	movs	r2, #63
     83e: 0a 40        	ands	r2, r1
     840: 80 32        	adds	r2, #128
     842: 6b 46        	mov	r3, sp
     844: 9a 70        	strb	r2, [r3, #2]
     846: 0a 0b        	lsrs	r2, r1, #12
     848: e0 24        	movs	r4, #224
     84a: 14 43        	orrs	r4, r2
     84c: 1c 70        	strb	r4, [r3]
     84e: 09 05        	lsls	r1, r1, #20
     850: 89 0e        	lsrs	r1, r1, #26
     852: 80 31        	adds	r1, #128
     854: 59 70        	strb	r1, [r3, #1]
     856: 03 24        	movs	r4, #3
     858: 11 e0        	b	0x87e <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x78> @ imm = #34
     85a: 3f 23        	movs	r3, #63
     85c: 0b 40        	ands	r3, r1
     85e: 80 33        	adds	r3, #128
     860: 6a 46        	mov	r2, sp
     862: d3 70        	strb	r3, [r2, #3]
     864: 8b 0c        	lsrs	r3, r1, #18
     866: f0 24        	movs	r4, #240
     868: 1c 43        	orrs	r4, r3
     86a: 14 70        	strb	r4, [r2]
     86c: 0b 05        	lsls	r3, r1, #20
     86e: 9b 0e        	lsrs	r3, r3, #26
     870: 80 33        	adds	r3, #128
     872: 93 70        	strb	r3, [r2, #2]
     874: 89 03        	lsls	r1, r1, #14
     876: 89 0e        	lsrs	r1, r1, #26
     878: 80 31        	adds	r1, #128
     87a: 51 70        	strb	r1, [r2, #1]
     87c: 04 24        	movs	r4, #4
     87e: 03 68        	ldr	r3, [r0]
     880: 03 94        	str	r4, [sp, #12]
     882: 68 46        	mov	r0, sp
     884: 02 90        	str	r0, [sp, #8]
     886: 01 93        	str	r3, [sp, #4]
     888: 05 22        	movs	r2, #5
     88a: 01 a9        	add	r1, sp, #4
     88c: 10 46        	mov	r0, r2
     88e: ab be        	bkpt	#171
     890: 41 42        	rsbs	r1, r0, #0
     892: 41 41        	adcs	r1, r0
     894: 45 1e        	subs	r5, r0, #1
     896: a5 42        	cmp	r5, r4
     898: 10 d2        	bhs	0x8bc <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0xb6> @ imm = #32
     89a: 6d 46        	mov	r5, sp
     89c: 06 46        	mov	r6, r0
     89e: 01 93        	str	r3, [sp, #4]
     8a0: 03 90        	str	r0, [sp, #12]
     8a2: 20 1a        	subs	r0, r4, r0
     8a4: 2d 18        	adds	r5, r5, r0
     8a6: 02 95        	str	r5, [sp, #8]
     8a8: 01 a9        	add	r1, sp, #4
     8aa: 10 46        	mov	r0, r2
     8ac: ab be        	bkpt	#171
     8ae: 41 42        	rsbs	r1, r0, #0
     8b0: 41 41        	adcs	r1, r0
     8b2: 00 28        	cmp	r0, #0
     8b4: 02 d0        	beq	0x8bc <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0xb6> @ imm = #4
     8b6: 86 42        	cmp	r6, r0
     8b8: 34 46        	mov	r4, r6
     8ba: ef d2        	bhs	0x89c <<&mut W as core::fmt::Write>::write_char::h2600d683bcf226b2+0x96> @ imm = #-34
     8bc: 01 20        	movs	r0, #1
     8be: 48 40        	eors	r0, r1
     8c0: 04 b0        	add	sp, #16
     8c2: f0 bd        	pop	{r4, r5, r6, r7, pc}

000008c4 <<&mut W as core::fmt::Write>::write_fmt::hd31f7e06213b1f40>:
     8c4: b0 b5        	push	{r4, r5, r7, lr}
     8c6: 02 af        	add	r7, sp, #8
     8c8: 88 b0        	sub	sp, #32
     8ca: 00 68        	ldr	r0, [r0]
     8cc: 01 90        	str	r0, [sp, #4]
     8ce: 02 aa        	add	r2, sp, #8
     8d0: 10 46        	mov	r0, r2
     8d2: 38 c9        	ldm	r1!, {r3, r4, r5}
     8d4: 38 c0        	stm	r0!, {r3, r4, r5}
     8d6: 38 c9        	ldm	r1!, {r3, r4, r5}
     8d8: 38 c0        	stm	r0!, {r3, r4, r5}
     8da: 01 a8        	add	r0, sp, #4
     8dc: 11 46        	mov	r1, r2
     8de: ff f7 a1 fe  	bl	0x624 <core::fmt::write::he9beb2966ab2d949> @ imm = #-702
     8e2: 08 b0        	add	sp, #32
     8e4: b0 bd        	pop	{r4, r5, r7, pc}

000008e6 <__cpsid>:
     8e6: 72 b6        	cpsid i
     8e8: 70 47        	bx	lr

000008ea <__cpsie>:
     8ea: 62 b6        	cpsie i
     8ec: 70 47        	bx	lr

000008ee <__primask_r>:
     8ee: ef f3 10 80  	mrs	r0, primask
     8f2: 70 47        	bx	lr

000008f4 <__aeabi_uidiv>:
     8f4: 80 b5        	push	{r7, lr}
     8f6: 00 af        	add	r7, sp, #0
     8f8: 00 f0 01 f8  	bl	0x8fe <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd> @ imm = #2
     8fc: 80 bd        	pop	{r7, pc}

000008fe <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd>:
     8fe: f0 b5        	push	{r4, r5, r6, r7, lr}
     900: 03 af        	add	r7, sp, #12
     902: 83 b0        	sub	sp, #12
     904: 02 46        	mov	r2, r0
     906: 88 42        	cmp	r0, r1
     908: 03 d2        	bhs	0x912 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14> @ imm = #6
     90a: 00 20        	movs	r0, #0
     90c: 11 46        	mov	r1, r2
     90e: 03 b0        	add	sp, #12
     910: f0 bd        	pop	{r4, r5, r6, r7, pc}
     912: 15 0c        	lsrs	r5, r2, #16
     914: a9 42        	cmp	r1, r5
     916: 10 46        	mov	r0, r2
     918: 39 d9        	bls	0x98e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x90> @ imm = #114
     91a: 06 0a        	lsrs	r6, r0, #8
     91c: b1 42        	cmp	r1, r6
     91e: 3a d9        	bls	0x996 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x98> @ imm = #116
     920: 03 09        	lsrs	r3, r0, #4
     922: 99 42        	cmp	r1, r3
     924: 3b d9        	bls	0x99e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xa0> @ imm = #118
     926: 01 93        	str	r3, [sp, #4]
     928: 83 08        	lsrs	r3, r0, #2
     92a: 99 42        	cmp	r1, r3
     92c: 00 d8        	bhi	0x930 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x32> @ imm = #0
     92e: 18 46        	mov	r0, r3
     930: 02 93        	str	r3, [sp, #8]
     932: 43 08        	lsrs	r3, r0, #1
     934: 01 24        	movs	r4, #1
     936: 00 20        	movs	r0, #0
     938: 99 42        	cmp	r1, r3
     93a: 23 46        	mov	r3, r4
     93c: 00 d9        	bls	0x940 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x42> @ imm = #0
     93e: 03 46        	mov	r3, r0
     940: a9 42        	cmp	r1, r5
     942: 25 46        	mov	r5, r4
     944: 00 d9        	bls	0x948 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x4a> @ imm = #0
     946: 05 46        	mov	r5, r0
     948: 00 93        	str	r3, [sp]
     94a: 2d 01        	lsls	r5, r5, #4
     94c: b1 42        	cmp	r1, r6
     94e: 26 46        	mov	r6, r4
     950: 00 d9        	bls	0x954 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x56> @ imm = #0
     952: 06 46        	mov	r6, r0
     954: f3 00        	lsls	r3, r6, #3
     956: 5d 19        	adds	r5, r3, r5
     958: 01 9b        	ldr	r3, [sp, #4]
     95a: 99 42        	cmp	r1, r3
     95c: 23 46        	mov	r3, r4
     95e: 00 d9        	bls	0x962 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x64> @ imm = #0
     960: 03 46        	mov	r3, r0
     962: 9b 00        	lsls	r3, r3, #2
     964: eb 18        	adds	r3, r5, r3
     966: 02 9d        	ldr	r5, [sp, #8]
     968: a9 42        	cmp	r1, r5
     96a: 25 46        	mov	r5, r4
     96c: 00 d9        	bls	0x970 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x72> @ imm = #0
     96e: 05 46        	mov	r5, r0
     970: 68 00        	lsls	r0, r5, #1
     972: 18 18        	adds	r0, r3, r0
     974: 00 9b        	ldr	r3, [sp]
     976: c3 18        	adds	r3, r0, r3
     978: 9c 40        	lsls	r4, r3
     97a: 0d 46        	mov	r5, r1
     97c: 9d 40        	lsls	r5, r3
     97e: 56 1b        	subs	r6, r2, r5
     980: 8e 42        	cmp	r6, r1
     982: 12 d2        	bhs	0x9aa <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xac> @ imm = #36
     984: 32 46        	mov	r2, r6
     986: 20 46        	mov	r0, r4
     988: 11 46        	mov	r1, r2
     98a: 03 b0        	add	sp, #12
     98c: f0 bd        	pop	{r4, r5, r6, r7, pc}
     98e: 28 46        	mov	r0, r5
     990: 06 0a        	lsrs	r6, r0, #8
     992: b1 42        	cmp	r1, r6
     994: c4 d8        	bhi	0x920 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x22> @ imm = #-120
     996: 30 46        	mov	r0, r6
     998: 03 09        	lsrs	r3, r0, #4
     99a: 99 42        	cmp	r1, r3
     99c: c3 d8        	bhi	0x926 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x28> @ imm = #-122
     99e: 18 46        	mov	r0, r3
     9a0: 01 93        	str	r3, [sp, #4]
     9a2: 83 08        	lsrs	r3, r0, #2
     9a4: 99 42        	cmp	r1, r3
     9a6: c2 d9        	bls	0x92e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x30> @ imm = #-124
     9a8: c2 e7        	b	0x930 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x32> @ imm = #-124
     9aa: 00 2d        	cmp	r5, #0
     9ac: 03 d4        	bmi	0x9b6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xb8> @ imm = #6
     9ae: 21 46        	mov	r1, r4
     9b0: 20 46        	mov	r0, r4
     9b2: 32 46        	mov	r2, r6
     9b4: 15 e0        	b	0x9e2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xe4> @ imm = #42
     9b6: 6d 08        	lsrs	r5, r5, #1
     9b8: 72 1b        	subs	r2, r6, r5
     9ba: 5b 1e        	subs	r3, r3, #1
     9bc: 1f 20        	movs	r0, #31
     9be: 01 93        	str	r3, [sp, #4]
     9c0: 18 40        	ands	r0, r3
     9c2: 02 90        	str	r0, [sp, #8]
     9c4: 01 20        	movs	r0, #1
     9c6: 02 9b        	ldr	r3, [sp, #8]
     9c8: 98 40        	lsls	r0, r3
     9ca: 00 2a        	cmp	r2, #0
     9cc: 02 90        	str	r0, [sp, #8]
     9ce: 00 da        	bge	0x9d2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xd4> @ imm = #0
     9d0: 00 20        	movs	r0, #0
     9d2: 00 2a        	cmp	r2, #0
     9d4: 00 da        	bge	0x9d8 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xda> @ imm = #0
     9d6: 32 46        	mov	r2, r6
     9d8: 20 43        	orrs	r0, r4
     9da: 8a 42        	cmp	r2, r1
     9dc: 02 99        	ldr	r1, [sp, #8]
     9de: 01 9b        	ldr	r3, [sp, #4]
     9e0: 94 d3        	blo	0x90c <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0xe> @ imm = #-216
     9e2: 49 1e        	subs	r1, r1, #1
     9e4: 00 2b        	cmp	r3, #0
     9e6: 10 d0        	beq	0xa0a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x10c> @ imm = #32
     9e8: 03 26        	movs	r6, #3
     9ea: 1e 40        	ands	r6, r3
     9ec: 01 24        	movs	r4, #1
     9ee: 64 1b        	subs	r4, r4, r5
     9f0: 5d 1e        	subs	r5, r3, #1
     9f2: 02 95        	str	r5, [sp, #8]
     9f4: 00 2e        	cmp	r6, #0
     9f6: 0a d0        	beq	0xa0e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x110> @ imm = #20
     9f8: 55 00        	lsls	r5, r2, #1
     9fa: 2a 19        	adds	r2, r5, r4
     9fc: 00 d4        	bmi	0xa00 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x102> @ imm = #0
     9fe: 15 46        	mov	r5, r2
     a00: 01 2e        	cmp	r6, #1
     a02: 08 d1        	bne	0xa16 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x118> @ imm = #16
     a04: 02 9e        	ldr	r6, [sp, #8]
     a06: 32 46        	mov	r2, r6
     a08: 14 e0        	b	0xa34 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #40
     a0a: 15 46        	mov	r5, r2
     a0c: 14 e0        	b	0xa38 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x13a> @ imm = #40
     a0e: 15 46        	mov	r5, r2
     a10: 1a 46        	mov	r2, r3
     a12: 02 9e        	ldr	r6, [sp, #8]
     a14: 0e e0        	b	0xa34 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #28
     a16: 6d 00        	lsls	r5, r5, #1
     a18: 2a 19        	adds	r2, r5, r4
     a1a: 00 d4        	bmi	0xa1e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x120> @ imm = #0
     a1c: 15 46        	mov	r5, r2
     a1e: 02 2e        	cmp	r6, #2
     a20: 02 d1        	bne	0xa28 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x12a> @ imm = #4
     a22: 9a 1e        	subs	r2, r3, #2
     a24: 02 9e        	ldr	r6, [sp, #8]
     a26: 05 e0        	b	0xa34 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x136> @ imm = #10
     a28: 6d 00        	lsls	r5, r5, #1
     a2a: 2a 19        	adds	r2, r5, r4
     a2c: 02 9e        	ldr	r6, [sp, #8]
     a2e: 00 d4        	bmi	0xa32 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x134> @ imm = #0
     a30: 15 46        	mov	r5, r2
     a32: da 1e        	subs	r2, r3, #3
     a34: 03 2e        	cmp	r6, #3
     a36: 0a d2        	bhs	0xa4e <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x150> @ imm = #20
     a38: 1f 22        	movs	r2, #31
     a3a: 13 40        	ands	r3, r2
     a3c: 2a 46        	mov	r2, r5
     a3e: da 40        	lsrs	r2, r3
     a40: 29 40        	ands	r1, r5
     a42: 08 43        	orrs	r0, r1
     a44: 11 46        	mov	r1, r2
     a46: 03 b0        	add	sp, #12
     a48: f0 bd        	pop	{r4, r5, r6, r7, pc}
     a4a: 12 1f        	subs	r2, r2, #4
     a4c: f4 d0        	beq	0xa38 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x13a> @ imm = #-24
     a4e: 6d 00        	lsls	r5, r5, #1
     a50: 2e 19        	adds	r6, r5, r4
     a52: 09 d5        	bpl	0xa68 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x16a> @ imm = #18
     a54: 6d 00        	lsls	r5, r5, #1
     a56: 2e 19        	adds	r6, r5, r4
     a58: 0a d5        	bpl	0xa70 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x172> @ imm = #20
     a5a: 6d 00        	lsls	r5, r5, #1
     a5c: 2e 19        	adds	r6, r5, r4
     a5e: 0b d5        	bpl	0xa78 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x17a> @ imm = #22
     a60: 6d 00        	lsls	r5, r5, #1
     a62: 2e 19        	adds	r6, r5, r4
     a64: f1 d4        	bmi	0xa4a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-30
     a66: 0b e0        	b	0xa80 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x182> @ imm = #22
     a68: 35 46        	mov	r5, r6
     a6a: 6d 00        	lsls	r5, r5, #1
     a6c: 2e 19        	adds	r6, r5, r4
     a6e: f4 d4        	bmi	0xa5a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x15c> @ imm = #-24
     a70: 35 46        	mov	r5, r6
     a72: 6d 00        	lsls	r5, r5, #1
     a74: 2e 19        	adds	r6, r5, r4
     a76: f3 d4        	bmi	0xa60 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x162> @ imm = #-26
     a78: 35 46        	mov	r5, r6
     a7a: 6d 00        	lsls	r5, r5, #1
     a7c: 2e 19        	adds	r6, r5, r4
     a7e: e4 d4        	bmi	0xa4a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-56
     a80: 35 46        	mov	r5, r6
     a82: e2 e7        	b	0xa4a <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x14c> @ imm = #-60

00000a84 <HardFaultTrampoline>:
     a84: 70 46        	mov	r0, lr
     a86: 04 21        	movs	r1, #4
     a88: 08 42        	tst	r0, r1
     a8a: 02 d1        	bne	0xa92 <HardFaultTrampoline+0xe> @ imm = #4
     a8c: ef f3 08 80  	mrs	r0, msp
     a90: 02 e0        	b	0xa98 <HardFault_>      @ imm = #4
     a92: ef f3 09 80  	mrs	r0, psp
     a96: ff e7        	b	0xa98 <HardFault_>      @ imm = #-2

00000a98 <HardFault_>:
     a98: fe e7        	b	0xa98 <HardFault_>      @ imm = #-4
     a9a: d4 d4        	bmi	0xa46 <compiler_builtins::int::specialized_div_rem::u32_div_rem::h3b6f635e3a820bbd+0x148> @ imm = #-88

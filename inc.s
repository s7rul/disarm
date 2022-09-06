
app/target/thumbv6m-none-eabi/release/examples/inc:	file format elf32-littlearm

Disassembly of section .text:

000000b8 <__stext>:
      b8: 0b 4c        	ldr	r4, [pc, #44]           @ 0xe8 <$d>
      ba: a6 46        	mov	lr, r4
      bc: 00 f0 7d fa  	bl	0x5ba <__pre_init>      @ imm = #1274
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
      e2: 00 f0 0f f8  	bl	0x104 <main>            @ imm = #30
      e6: 00 de        	udf	#0

000000e8 <$d>:
      e8:	ff ff ff ff	.word	0xffffffff
      ec:	00 00 00 20	.word	0x20000000
      f0:	08 00 00 20	.word	0x20000008
      f4:	00 00 00 20	.word	0x20000000
      f8:	00 00 00 20	.word	0x20000000
      fc:	cc 09 00 00	.word	0x000009cc

00000100 <inc_function>:
     100: 40 1c        	adds	r0, r0, #1
     102: 70 47        	bx	lr

00000104 <main>:
     104: 80 b5        	push	{r7, lr}
     106: 00 af        	add	r7, sp, #0
     108: 00 f0 02 f8  	bl	0x110 <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E> @ imm = #4
     10c: fe de        	trap
     10e: d4 d4        	bmi	0xba <__stext+0x2>      @ imm = #-88

00000110 <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E>:
     110: 80 b5        	push	{r7, lr}
     112: 00 af        	add	r7, sp, #0
     114: 8a b0        	sub	sp, #40
     116: 01 25        	movs	r5, #1
     118: 28 46        	mov	r0, r5
     11a: ff f7 f1 ff  	bl	0x100 <inc_function>    @ imm = #-30
     11e: 02 90        	str	r0, [sp, #8]
     120: 19 48        	ldr	r0, [pc, #100]          @ 0x188 <$d.3>
     122: 01 90        	str	r0, [sp, #4]
     124: 02 a8        	add	r0, sp, #8
     126: 00 90        	str	r0, [sp]
     128: 00 f0 f9 fa  	bl	0x71e <__primask_r>     @ imm = #1522
     12c: 04 46        	mov	r4, r0
     12e: 2c 40        	ands	r4, r5
     130: 00 f0 f1 fa  	bl	0x716 <__cpsid>         @ imm = #1506
     134: 15 4a        	ldr	r2, [pc, #84]           @ 0x18c <$d.3+0x4>
     136: 10 68        	ldr	r0, [r2]
     138: 01 28        	cmp	r0, #1
     13a: 0c d0        	beq	0x156 <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E+0x46> @ imm = #24
     13c: 03 20        	movs	r0, #3
     13e: 06 90        	str	r0, [sp, #24]
     140: 04 20        	movs	r0, #4
     142: 05 90        	str	r0, [sp, #20]
     144: 12 48        	ldr	r0, [pc, #72]           @ 0x190 <$d.3+0x8>
     146: 04 90        	str	r0, [sp, #16]
     148: 04 a9        	add	r1, sp, #16
     14a: 28 46        	mov	r0, r5
     14c: ab be        	bkpt	#171
     14e: 41 1c        	adds	r1, r0, #1
     150: 11 d0        	beq	0x176 <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E+0x66> @ imm = #34
     152: 15 60        	str	r5, [r2]
     154: 50 60        	str	r0, [r2, #4]
     156: 10 1d        	adds	r0, r2, #4
     158: 03 90        	str	r0, [sp, #12]
     15a: 09 95        	str	r5, [sp, #36]
     15c: 68 46        	mov	r0, sp
     15e: 08 90        	str	r0, [sp, #32]
     160: 00 20        	movs	r0, #0
     162: 07 90        	str	r0, [sp, #28]
     164: 06 90        	str	r0, [sp, #24]
     166: 02 20        	movs	r0, #2
     168: 05 90        	str	r0, [sp, #20]
     16a: 0a 48        	ldr	r0, [pc, #40]           @ 0x194 <$d.3+0xc>
     16c: 04 90        	str	r0, [sp, #16]
     16e: 03 a8        	add	r0, sp, #12
     170: 04 a9        	add	r1, sp, #16
     172: 00 f0 6f f9  	bl	0x454 <_ZN4core3fmt5write17he9beb2966ab2d949E> @ imm = #734
     176: 00 2c        	cmp	r4, #0
     178: 01 d1        	bne	0x17e <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E+0x6e> @ imm = #2
     17a: 00 f0 ce fa  	bl	0x71a <__cpsie>         @ imm = #1436
     17e: 18 20        	movs	r0, #24
     180: 05 49        	ldr	r1, [pc, #20]           @ 0x198 <$d.3+0x10>
     182: ab be        	bkpt	#171
     184: fe e7        	b	0x184 <_ZN3inc18__cortex_m_rt_main17h2ce682e83d39bdf4E+0x74> @ imm = #-4
     186: c0 46        	mov	r8, r8

00000188 <$d.3>:
     188:	a1 01 00 00	.word	0x000001a1
     18c:	00 00 00 20	.word	0x20000000
     190:	c8 09 00 00	.word	0x000009c8
     194:	d8 08 00 00	.word	0x000008d8
     198:	26 00 02 00	.word	0x00020026

0000019c <_ZN4core3ops8function6FnOnce9call_once17hfdbdf61b6267721cE>:
     19c: 00 68        	ldr	r0, [r0]
     19e: fe e7        	b	0x19e <_ZN4core3ops8function6FnOnce9call_once17hfdbdf61b6267721cE+0x2> @ imm = #-4

000001a0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE>:
     1a0: f0 b5        	push	{r4, r5, r6, r7, lr}
     1a2: 03 af        	add	r7, sp, #12
     1a4: 93 b0        	sub	sp, #76
     1a6: 06 91        	str	r1, [sp, #24]
     1a8: 02 68        	ldr	r2, [r0]
     1aa: 95 49        	ldr	r1, [pc, #596]          @ 0x400 <$d.6>
     1ac: 27 25        	movs	r5, #39
     1ae: 8a 42        	cmp	r2, r1
     1b0: 2d d3        	blo	0x20e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x6e> @ imm = #90
     1b2: 14 46        	mov	r4, r2
     1b4: 08 95        	str	r5, [sp, #32]
     1b6: 20 46        	mov	r0, r4
     1b8: 91 49        	ldr	r1, [pc, #580]          @ 0x400 <$d.6>
     1ba: 00 f0 b3 fa  	bl	0x724 <__aeabi_uidiv>   @ imm = #1382
     1be: 07 90        	str	r0, [sp, #28]
     1c0: 91 49        	ldr	r1, [pc, #580]          @ 0x408 <$d.6+0x8>
     1c2: 41 43        	muls	r1, r0, r1
     1c4: 09 19        	adds	r1, r1, r4
     1c6: 8a b2        	uxth	r2, r1
     1c8: 92 08        	lsrs	r2, r2, #2
     1ca: 90 48        	ldr	r0, [pc, #576]          @ 0x40c <$d.6+0xc>
     1cc: 42 43        	muls	r2, r0, r2
     1ce: 52 0c        	lsrs	r2, r2, #17
     1d0: 53 00        	lsls	r3, r2, #1
     1d2: 8f 48        	ldr	r0, [pc, #572]          @ 0x410 <$d.6+0x10>
     1d4: c0 5c        	ldrb	r0, [r0, r3]
     1d6: 09 ae        	add	r6, sp, #36
     1d8: 76 19        	adds	r6, r6, r5
     1da: 35 1f        	subs	r5, r6, #4
     1dc: 28 70        	strb	r0, [r5]
     1de: 8c 48        	ldr	r0, [pc, #560]          @ 0x410 <$d.6+0x10>
     1e0: c0 18        	adds	r0, r0, r3
     1e2: 40 78        	ldrb	r0, [r0, #1]
     1e4: 68 70        	strb	r0, [r5, #1]
     1e6: 08 9d        	ldr	r5, [sp, #32]
     1e8: 86 48        	ldr	r0, [pc, #536]          @ 0x404 <$d.6+0x4>
     1ea: 42 43        	muls	r2, r0, r2
     1ec: 50 18        	adds	r0, r2, r1
     1ee: 80 b2        	uxth	r0, r0
     1f0: 40 00        	lsls	r0, r0, #1
     1f2: 87 4a        	ldr	r2, [pc, #540]          @ 0x410 <$d.6+0x10>
     1f4: 11 5c        	ldrb	r1, [r2, r0]
     1f6: 13 46        	mov	r3, r2
     1f8: b2 1e        	subs	r2, r6, #2
     1fa: 11 70        	strb	r1, [r2]
     1fc: 18 18        	adds	r0, r3, r0
     1fe: 40 78        	ldrb	r0, [r0, #1]
     200: 50 70        	strb	r0, [r2, #1]
     202: 07 9a        	ldr	r2, [sp, #28]
     204: 2d 1f        	subs	r5, r5, #4
     206: 83 48        	ldr	r0, [pc, #524]          @ 0x414 <$d.6+0x14>
     208: 84 42        	cmp	r4, r0
     20a: 14 46        	mov	r4, r2
     20c: d2 d8        	bhi	0x1b4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x14> @ imm = #-92
     20e: 63 2a        	cmp	r2, #99
     210: 23 d9        	bls	0x25a <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0xba> @ imm = #70
     212: 90 b2        	uxth	r0, r2
     214: 80 08        	lsrs	r0, r0, #2
     216: 7d 49        	ldr	r1, [pc, #500]          @ 0x40c <$d.6+0xc>
     218: 41 43        	muls	r1, r0, r1
     21a: 49 0c        	lsrs	r1, r1, #17
     21c: 63 20        	movs	r0, #99
     21e: c0 43        	mvns	r0, r0
     220: 48 43        	muls	r0, r1, r0
     222: 80 18        	adds	r0, r0, r2
     224: 80 b2        	uxth	r0, r0
     226: 40 00        	lsls	r0, r0, #1
     228: 79 4a        	ldr	r2, [pc, #484]          @ 0x410 <$d.6+0x10>
     22a: 13 5c        	ldrb	r3, [r2, r0]
     22c: ad 1e        	subs	r5, r5, #2
     22e: 09 ac        	add	r4, sp, #36
     230: 63 55        	strb	r3, [r4, r5]
     232: 2e 46        	mov	r6, r5
     234: 63 19        	adds	r3, r4, r5
     236: 10 18        	adds	r0, r2, r0
     238: 40 78        	ldrb	r0, [r0, #1]
     23a: 58 70        	strb	r0, [r3, #1]
     23c: 0a 29        	cmp	r1, #10
     23e: 06 9d        	ldr	r5, [sp, #24]
     240: 10 d3        	blo	0x264 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0xc4> @ imm = #32
     242: 48 00        	lsls	r0, r1, #1
     244: 72 49        	ldr	r1, [pc, #456]          @ 0x410 <$d.6+0x10>
     246: 0a 5c        	ldrb	r2, [r1, r0]
     248: b4 1e        	subs	r4, r6, #2
     24a: 09 ab        	add	r3, sp, #36
     24c: 1a 55        	strb	r2, [r3, r4]
     24e: 08 94        	str	r4, [sp, #32]
     250: 1a 19        	adds	r2, r3, r4
     252: 08 18        	adds	r0, r1, r0
     254: 40 78        	ldrb	r0, [r0, #1]
     256: 50 70        	strb	r0, [r2, #1]
     258: 09 e0        	b	0x26e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0xce> @ imm = #18
     25a: 2e 46        	mov	r6, r5
     25c: 11 46        	mov	r1, r2
     25e: 0a 29        	cmp	r1, #10
     260: 06 9d        	ldr	r5, [sp, #24]
     262: ee d2        	bhs	0x242 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0xa2> @ imm = #-36
     264: 72 1e        	subs	r2, r6, #1
     266: 30 31        	adds	r1, #48
     268: 09 a8        	add	r0, sp, #36
     26a: 08 92        	str	r2, [sp, #32]
     26c: 81 54        	strb	r1, [r0, r2]
     26e: 27 21        	movs	r1, #39
     270: 28 68        	ldr	r0, [r5]
     272: 01 22        	movs	r2, #1
     274: 06 46        	mov	r6, r0
     276: 05 92        	str	r2, [sp, #20]
     278: 16 40        	ands	r6, r2
     27a: 11 22        	movs	r2, #17
     27c: 13 04        	lsls	r3, r2, #16
     27e: 00 2e        	cmp	r6, #0
     280: 02 93        	str	r3, [sp, #8]
     282: 00 d0        	beq	0x286 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0xe6> @ imm = #0
     284: 2b 23        	movs	r3, #43
     286: 08 9a        	ldr	r2, [sp, #32]
     288: 8c 1a        	subs	r4, r1, r2
     28a: 09 a9        	add	r1, sp, #36
     28c: 89 18        	adds	r1, r1, r2
     28e: 04 91        	str	r1, [sp, #16]
     290: 41 07        	lsls	r1, r0, #29
     292: c9 17        	asrs	r1, r1, #31
     294: 60 4a        	ldr	r2, [pc, #384]          @ 0x418 <$d.6+0x18>
     296: 0a 40        	ands	r2, r1
     298: 06 9d        	ldr	r5, [sp, #24]
     29a: a9 68        	ldr	r1, [r5, #8]
     29c: 00 29        	cmp	r1, #0
     29e: 19 d0        	beq	0x2d4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x134> @ imm = #50
     2a0: 03 92        	str	r2, [sp, #12]
     2a2: a1 19        	adds	r1, r4, r6
     2a4: ea 68        	ldr	r2, [r5, #12]
     2a6: 8a 42        	cmp	r2, r1
     2a8: 1d d9        	bls	0x2e6 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x146> @ imm = #58
     2aa: 07 92        	str	r2, [sp, #28]
     2ac: 01 94        	str	r4, [sp, #4]
     2ae: 00 07        	lsls	r0, r0, #28
     2b0: 2a d4        	bmi	0x308 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x168> @ imm = #84
     2b2: 1d 46        	mov	r5, r3
     2b4: 20 20        	movs	r0, #32
     2b6: 06 9b        	ldr	r3, [sp, #24]
     2b8: 1a 5c        	ldrb	r2, [r3, r0]
     2ba: 03 2a        	cmp	r2, #3
     2bc: 00 d1        	bne	0x2c0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x120> @ imm = #0
     2be: 01 22        	movs	r2, #1
     2c0: 07 98        	ldr	r0, [sp, #28]
     2c2: 40 1a        	subs	r0, r0, r1
     2c4: 91 07        	lsls	r1, r2, #30
     2c6: 44 d0        	beq	0x352 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1b2> @ imm = #136
     2c8: 01 2a        	cmp	r2, #1
     2ca: 44 d1        	bne	0x356 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1b6> @ imm = #136
     2cc: 00 21        	movs	r1, #0
     2ce: 00 91        	str	r1, [sp]
     2d0: 01 46        	mov	r1, r0
     2d2: 44 e0        	b	0x35e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1be> @ imm = #136
     2d4: 28 46        	mov	r0, r5
     2d6: 19 46        	mov	r1, r3
     2d8: 00 f0 a0 f8  	bl	0x41c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE> @ imm = #320
     2dc: 00 28        	cmp	r0, #0
     2de: 09 d0        	beq	0x2f4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x154> @ imm = #18
     2e0: 05 98        	ldr	r0, [sp, #20]
     2e2: 13 b0        	add	sp, #76
     2e4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     2e6: 28 46        	mov	r0, r5
     2e8: 19 46        	mov	r1, r3
     2ea: 03 9a        	ldr	r2, [sp, #12]
     2ec: 00 f0 96 f8  	bl	0x41c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE> @ imm = #300
     2f0: 00 28        	cmp	r0, #0
     2f2: f5 d1        	bne	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-22
     2f4: a8 69        	ldr	r0, [r5, #24]
     2f6: e9 69        	ldr	r1, [r5, #28]
     2f8: cb 68        	ldr	r3, [r1, #12]
     2fa: 04 99        	ldr	r1, [sp, #16]
     2fc: 22 46        	mov	r2, r4
     2fe: 98 47        	blx	r3
     300: 05 90        	str	r0, [sp, #20]
     302: 05 98        	ldr	r0, [sp, #20]
     304: 13 b0        	add	sp, #76
     306: f0 bd        	pop	{r4, r5, r6, r7, pc}
     308: 20 20        	movs	r0, #32
     30a: 06 9d        	ldr	r5, [sp, #24]
     30c: 2c 5c        	ldrb	r4, [r5, r0]
     30e: 01 21        	movs	r1, #1
     310: 05 91        	str	r1, [sp, #20]
     312: 29 54        	strb	r1, [r5, r0]
     314: 68 68        	ldr	r0, [r5, #4]
     316: 02 90        	str	r0, [sp, #8]
     318: 30 20        	movs	r0, #48
     31a: 68 60        	str	r0, [r5, #4]
     31c: 28 46        	mov	r0, r5
     31e: 19 46        	mov	r1, r3
     320: 03 9a        	ldr	r2, [sp, #12]
     322: 00 f0 7b f8  	bl	0x41c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE> @ imm = #246
     326: 00 28        	cmp	r0, #0
     328: da d1        	bne	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-76
     32a: 03 94        	str	r4, [sp, #12]
     32c: 28 46        	mov	r0, r5
     32e: 20 30        	adds	r0, #32
     330: 00 90        	str	r0, [sp]
     332: 08 98        	ldr	r0, [sp, #32]
     334: 07 99        	ldr	r1, [sp, #28]
     336: 40 18        	adds	r0, r0, r1
     338: 86 1b        	subs	r6, r0, r6
     33a: 26 3e        	subs	r6, #38
     33c: ac 69        	ldr	r4, [r5, #24]
     33e: ed 69        	ldr	r5, [r5, #28]
     340: 76 1e        	subs	r6, r6, #1
     342: 42 d0        	beq	0x3ca <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x22a> @ imm = #132
     344: 2a 69        	ldr	r2, [r5, #16]
     346: 30 21        	movs	r1, #48
     348: 20 46        	mov	r0, r4
     34a: 90 47        	blx	r2
     34c: 00 28        	cmp	r0, #0
     34e: f7 d0        	beq	0x340 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1a0> @ imm = #-18
     350: c6 e7        	b	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-116
     352: 00 21        	movs	r1, #0
     354: 02 e0        	b	0x35c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1bc> @ imm = #4
     356: 41 08        	lsrs	r1, r0, #1
     358: 40 1c        	adds	r0, r0, #1
     35a: 40 08        	lsrs	r0, r0, #1
     35c: 00 90        	str	r0, [sp]
     35e: 4c 1c        	adds	r4, r1, #1
     360: 5e 68        	ldr	r6, [r3, #4]
     362: 98 69        	ldr	r0, [r3, #24]
     364: 08 90        	str	r0, [sp, #32]
     366: d8 69        	ldr	r0, [r3, #28]
     368: 07 90        	str	r0, [sp, #28]
     36a: 01 20        	movs	r0, #1
     36c: 05 90        	str	r0, [sp, #20]
     36e: 64 1e        	subs	r4, r4, #1
     370: 07 d0        	beq	0x382 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1e2> @ imm = #14
     372: 07 98        	ldr	r0, [sp, #28]
     374: 02 69        	ldr	r2, [r0, #16]
     376: 08 98        	ldr	r0, [sp, #32]
     378: 31 46        	mov	r1, r6
     37a: 90 47        	blx	r2
     37c: 00 28        	cmp	r0, #0
     37e: f6 d0        	beq	0x36e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1ce> @ imm = #-20
     380: ae e7        	b	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-164
     382: 02 98        	ldr	r0, [sp, #8]
     384: 86 42        	cmp	r6, r0
     386: 01 d1        	bne	0x38c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x1ec> @ imm = #2
     388: 00 21        	movs	r1, #0
     38a: 00 91        	str	r1, [sp]
     38c: 29 46        	mov	r1, r5
     38e: 03 9a        	ldr	r2, [sp, #12]
     390: 86 42        	cmp	r6, r0
     392: a5 d0        	beq	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-182
     394: 06 98        	ldr	r0, [sp, #24]
     396: 00 f0 41 f8  	bl	0x41c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE> @ imm = #130
     39a: 00 28        	cmp	r0, #0
     39c: a0 d1        	bne	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-192
     39e: 07 98        	ldr	r0, [sp, #28]
     3a0: c3 68        	ldr	r3, [r0, #12]
     3a2: 08 98        	ldr	r0, [sp, #32]
     3a4: 04 99        	ldr	r1, [sp, #16]
     3a6: 01 9a        	ldr	r2, [sp, #4]
     3a8: 98 47        	blx	r3
     3aa: 00 28        	cmp	r0, #0
     3ac: 98 d1        	bne	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-208
     3ae: 00 24        	movs	r4, #0
     3b0: 00 9d        	ldr	r5, [sp]
     3b2: a5 42        	cmp	r5, r4
     3b4: 17 d0        	beq	0x3e6 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x246> @ imm = #46
     3b6: 07 98        	ldr	r0, [sp, #28]
     3b8: 02 69        	ldr	r2, [r0, #16]
     3ba: 08 98        	ldr	r0, [sp, #32]
     3bc: 31 46        	mov	r1, r6
     3be: 90 47        	blx	r2
     3c0: 64 1c        	adds	r4, r4, #1
     3c2: 00 28        	cmp	r0, #0
     3c4: f5 d0        	beq	0x3b2 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x212> @ imm = #-22
     3c6: 60 1e        	subs	r0, r4, #1
     3c8: 0e e0        	b	0x3e8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x248> @ imm = #28
     3ca: eb 68        	ldr	r3, [r5, #12]
     3cc: 20 46        	mov	r0, r4
     3ce: 04 99        	ldr	r1, [sp, #16]
     3d0: 01 9a        	ldr	r2, [sp, #4]
     3d2: 98 47        	blx	r3
     3d4: 00 28        	cmp	r0, #0
     3d6: 06 98        	ldr	r0, [sp, #24]
     3d8: 82 d1        	bne	0x2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x140> @ imm = #-252
     3da: 03 99        	ldr	r1, [sp, #12]
     3dc: 00 9a        	ldr	r2, [sp]
     3de: 11 70        	strb	r1, [r2]
     3e0: 02 99        	ldr	r1, [sp, #8]
     3e2: 41 60        	str	r1, [r0, #4]
     3e4: 02 e0        	b	0x3ec <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x24c> @ imm = #4
     3e6: 28 46        	mov	r0, r5
     3e8: a8 42        	cmp	r0, r5
     3ea: 04 d3        	blo	0x3f6 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x256> @ imm = #8
     3ec: 00 20        	movs	r0, #0
     3ee: 05 90        	str	r0, [sp, #20]
     3f0: 05 98        	ldr	r0, [sp, #20]
     3f2: 13 b0        	add	sp, #76
     3f4: f0 bd        	pop	{r4, r5, r6, r7, pc}
     3f6: 01 20        	movs	r0, #1
     3f8: 05 90        	str	r0, [sp, #20]
     3fa: 05 98        	ldr	r0, [sp, #20]
     3fc: 13 b0        	add	sp, #76
     3fe: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000400 <$d.6>:
     400:	10 27 00 00	.word	0x00002710
     404:	9c ff 00 00	.word	0x0000ff9c
     408:	f0 d8 ff ff	.word	0xffffd8f0
     40c:	7b 14 00 00	.word	0x0000147b
     410:	e8 08 00 00	.word	0x000008e8
     414:	ff e0 f5 05	.word	0x05f5e0ff
     418:	b0 09 00 00	.word	0x000009b0

0000041c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE>:
     41c: b0 b5        	push	{r4, r5, r7, lr}
     41e: 02 af        	add	r7, sp, #8
     420: 14 46        	mov	r4, r2
     422: 05 46        	mov	r5, r0
     424: 11 20        	movs	r0, #17
     426: 00 04        	lsls	r0, r0, #16
     428: 81 42        	cmp	r1, r0
     42a: 07 d0        	beq	0x43c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE+0x20> @ imm = #14
     42c: a8 69        	ldr	r0, [r5, #24]
     42e: ea 69        	ldr	r2, [r5, #28]
     430: 12 69        	ldr	r2, [r2, #16]
     432: 90 47        	blx	r2
     434: 00 28        	cmp	r0, #0
     436: 01 d0        	beq	0x43c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE+0x20> @ imm = #2
     438: 01 20        	movs	r0, #1
     43a: b0 bd        	pop	{r4, r5, r7, pc}
     43c: 00 2c        	cmp	r4, #0
     43e: 06 d0        	beq	0x44e <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h97a383d13138fa8aE+0x32> @ imm = #12
     440: a8 69        	ldr	r0, [r5, #24]
     442: e9 69        	ldr	r1, [r5, #28]
     444: cb 68        	ldr	r3, [r1, #12]
     446: 00 22        	movs	r2, #0
     448: 21 46        	mov	r1, r4
     44a: 98 47        	blx	r3
     44c: b0 bd        	pop	{r4, r5, r7, pc}
     44e: 00 20        	movs	r0, #0
     450: b0 bd        	pop	{r4, r5, r7, pc}
     452: d4 d4        	bmi	0x3fe <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hb2b5d6cd3462e0ccE+0x25e> @ imm = #-88

00000454 <_ZN4core3fmt5write17he9beb2966ab2d949E>:
     454: f0 b5        	push	{r4, r5, r6, r7, lr}
     456: 03 af        	add	r7, sp, #12
     458: 91 b0        	sub	sp, #68
     45a: 20 23        	movs	r3, #32
     45c: 08 ac        	add	r4, sp, #32
     45e: 03 22        	movs	r2, #3
     460: 07 94        	str	r4, [sp, #28]
     462: e2 54        	strb	r2, [r4, r3]
     464: 09 93        	str	r3, [sp, #36]
     466: 00 22        	movs	r2, #0
     468: 08 92        	str	r2, [sp, #32]
     46a: 51 4b        	ldr	r3, [pc, #324]          @ 0x5b0 <$d.9>
     46c: 0f 93        	str	r3, [sp, #60]
     46e: 0e 90        	str	r0, [sp, #56]
     470: 0c 92        	str	r2, [sp, #48]
     472: 0a 92        	str	r2, [sp, #40]
     474: 8d 68        	ldr	r5, [r1, #8]
     476: 00 2d        	cmp	r5, #0
     478: 60 d0        	beq	0x53c <_ZN4core3fmt5write17he9beb2966ab2d949E+0xe8> @ imm = #192
     47a: c8 68        	ldr	r0, [r1, #12]
     47c: 00 28        	cmp	r0, #0
     47e: 14 46        	mov	r4, r2
     480: 00 d1        	bne	0x484 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x30> @ imm = #0
     482: 80 e0        	b	0x586 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x132> @ imm = #256
     484: 02 92        	str	r2, [sp, #8]
     486: 07 9a        	ldr	r2, [sp, #28]
     488: 20 32        	adds	r2, #32
     48a: 07 92        	str	r2, [sp, #28]
     48c: 1f 22        	movs	r2, #31
     48e: d3 06        	lsls	r3, r2, #27
     490: 42 1e        	subs	r2, r0, #1
     492: 9a 43        	bics	r2, r3
     494: 52 1c        	adds	r2, r2, #1
     496: 01 92        	str	r2, [sp, #4]
     498: 40 01        	lsls	r0, r0, #5
     49a: 04 90        	str	r0, [sp, #16]
     49c: 06 91        	str	r1, [sp, #24]
     49e: 0c 68        	ldr	r4, [r1]
     4a0: 00 26        	movs	r6, #0
     4a2: 05 95        	str	r5, [sp, #20]
     4a4: 62 68        	ldr	r2, [r4, #4]
     4a6: 00 2a        	cmp	r2, #0
     4a8: 06 d0        	beq	0x4b8 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x64> @ imm = #12
     4aa: 0f 98        	ldr	r0, [sp, #60]
     4ac: c3 68        	ldr	r3, [r0, #12]
     4ae: 21 68        	ldr	r1, [r4]
     4b0: 0e 98        	ldr	r0, [sp, #56]
     4b2: 98 47        	blx	r3
     4b4: 00 28        	cmp	r0, #0
     4b6: 75 d1        	bne	0x5a4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x150> @ imm = #234
     4b8: aa 19        	adds	r2, r5, r6
     4ba: 10 7f        	ldrb	r0, [r2, #28]
     4bc: 07 99        	ldr	r1, [sp, #28]
     4be: 08 70        	strb	r0, [r1]
     4c0: 50 68        	ldr	r0, [r2, #4]
     4c2: 09 90        	str	r0, [sp, #36]
     4c4: 90 68        	ldr	r0, [r2, #8]
     4c6: 08 90        	str	r0, [sp, #32]
     4c8: 50 69        	ldr	r0, [r2, #20]
     4ca: 93 69        	ldr	r3, [r2, #24]
     4cc: 06 99        	ldr	r1, [sp, #24]
     4ce: 09 69        	ldr	r1, [r1, #16]
     4d0: 00 25        	movs	r5, #0
     4d2: 00 28        	cmp	r0, #0
     4d4: 0d d0        	beq	0x4f2 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x9e> @ imm = #26
     4d6: 01 28        	cmp	r0, #1
     4d8: 28 46        	mov	r0, r5
     4da: 0b d1        	bne	0x4f4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xa0> @ imm = #22
     4dc: d8 00        	lsls	r0, r3, #3
     4de: 03 90        	str	r0, [sp, #12]
     4e0: 08 18        	adds	r0, r1, r0
     4e2: 40 68        	ldr	r0, [r0, #4]
     4e4: 33 4b        	ldr	r3, [pc, #204]          @ 0x5b4 <$d.9+0x4>
     4e6: 98 42        	cmp	r0, r3
     4e8: 28 46        	mov	r0, r5
     4ea: 03 d1        	bne	0x4f4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xa0> @ imm = #6
     4ec: 03 98        	ldr	r0, [sp, #12]
     4ee: 08 58        	ldr	r0, [r1, r0]
     4f0: 03 68        	ldr	r3, [r0]
     4f2: 01 20        	movs	r0, #1
     4f4: 0b 93        	str	r3, [sp, #44]
     4f6: 0a 90        	str	r0, [sp, #40]
     4f8: d0 68        	ldr	r0, [r2, #12]
     4fa: 12 69        	ldr	r2, [r2, #16]
     4fc: 00 28        	cmp	r0, #0
     4fe: 09 d0        	beq	0x514 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xc0> @ imm = #18
     500: 01 28        	cmp	r0, #1
     502: 09 d1        	bne	0x518 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xc4> @ imm = #18
     504: d0 00        	lsls	r0, r2, #3
     506: 0a 18        	adds	r2, r1, r0
     508: 52 68        	ldr	r2, [r2, #4]
     50a: 2a 4b        	ldr	r3, [pc, #168]          @ 0x5b4 <$d.9+0x4>
     50c: 9a 42        	cmp	r2, r3
     50e: 03 d1        	bne	0x518 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xc4> @ imm = #6
     510: 08 58        	ldr	r0, [r1, r0]
     512: 02 68        	ldr	r2, [r0]
     514: 01 25        	movs	r5, #1
     516: ff e7        	b	0x518 <_ZN4core3fmt5write17he9beb2966ab2d949E+0xc4> @ imm = #-2
     518: 0d 92        	str	r2, [sp, #52]
     51a: 0c 95        	str	r5, [sp, #48]
     51c: 05 9d        	ldr	r5, [sp, #20]
     51e: a8 59        	ldr	r0, [r5, r6]
     520: c2 00        	lsls	r2, r0, #3
     522: 88 58        	ldr	r0, [r1, r2]
     524: 89 18        	adds	r1, r1, r2
     526: 4a 68        	ldr	r2, [r1, #4]
     528: 08 a9        	add	r1, sp, #32
     52a: 90 47        	blx	r2
     52c: 00 28        	cmp	r0, #0
     52e: 39 d1        	bne	0x5a4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x150> @ imm = #114
     530: 20 36        	adds	r6, #32
     532: 08 34        	adds	r4, #8
     534: 04 98        	ldr	r0, [sp, #16]
     536: b0 42        	cmp	r0, r6
     538: b4 d1        	bne	0x4a4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x50> @ imm = #-152
     53a: 21 e0        	b	0x580 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x12c> @ imm = #66
     53c: 48 69        	ldr	r0, [r1, #20]
     53e: 00 28        	cmp	r0, #0
     540: 14 46        	mov	r4, r2
     542: 20 d0        	beq	0x586 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x132> @ imm = #64
     544: 02 92        	str	r2, [sp, #8]
     546: 07 22        	movs	r2, #7
     548: 52 07        	lsls	r2, r2, #29
     54a: 40 1e        	subs	r0, r0, #1
     54c: 90 43        	bics	r0, r2
     54e: 46 1c        	adds	r6, r0, #1
     550: 0c 68        	ldr	r4, [r1]
     552: 06 91        	str	r1, [sp, #24]
     554: 0d 69        	ldr	r5, [r1, #16]
     556: 01 96        	str	r6, [sp, #4]
     558: 62 68        	ldr	r2, [r4, #4]
     55a: 00 2a        	cmp	r2, #0
     55c: 06 d0        	beq	0x56c <_ZN4core3fmt5write17he9beb2966ab2d949E+0x118> @ imm = #12
     55e: 0f 98        	ldr	r0, [sp, #60]
     560: c3 68        	ldr	r3, [r0, #12]
     562: 21 68        	ldr	r1, [r4]
     564: 0e 98        	ldr	r0, [sp, #56]
     566: 98 47        	blx	r3
     568: 00 28        	cmp	r0, #0
     56a: 1b d1        	bne	0x5a4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x150> @ imm = #54
     56c: 05 cd        	ldm	r5!, {r0, r2}
     56e: 08 a9        	add	r1, sp, #32
     570: 08 3d        	subs	r5, #8
     572: 90 47        	blx	r2
     574: 00 28        	cmp	r0, #0
     576: 15 d1        	bne	0x5a4 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x150> @ imm = #42
     578: 08 35        	adds	r5, #8
     57a: 08 34        	adds	r4, #8
     57c: 76 1e        	subs	r6, r6, #1
     57e: eb d1        	bne	0x558 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x104> @ imm = #-42
     580: 02 9a        	ldr	r2, [sp, #8]
     582: 06 99        	ldr	r1, [sp, #24]
     584: 01 9c        	ldr	r4, [sp, #4]
     586: 48 68        	ldr	r0, [r1, #4]
     588: 84 42        	cmp	r4, r0
     58a: 02 d2        	bhs	0x592 <_ZN4core3fmt5write17he9beb2966ab2d949E+0x13e> @ imm = #4
     58c: e3 00        	lsls	r3, r4, #3
     58e: 0a 68        	ldr	r2, [r1]
     590: d2 18        	adds	r2, r2, r3
     592: 84 42        	cmp	r4, r0
     594: 09 d2        	bhs	0x5aa <_ZN4core3fmt5write17he9beb2966ab2d949E+0x156> @ imm = #18
     596: 0f 98        	ldr	r0, [sp, #60]
     598: c3 68        	ldr	r3, [r0, #12]
     59a: 06 ca        	ldm	r2, {r1, r2}
     59c: 0e 98        	ldr	r0, [sp, #56]
     59e: 98 47        	blx	r3
     5a0: 00 28        	cmp	r0, #0
     5a2: 02 d0        	beq	0x5aa <_ZN4core3fmt5write17he9beb2966ab2d949E+0x156> @ imm = #4
     5a4: 01 20        	movs	r0, #1
     5a6: 11 b0        	add	sp, #68
     5a8: f0 bd        	pop	{r4, r5, r6, r7, pc}
     5aa: 00 20        	movs	r0, #0
     5ac: 11 b0        	add	sp, #68
     5ae: f0 bd        	pop	{r4, r5, r6, r7, pc}

000005b0 <$d.9>:
     5b0:	b0 09 00 00	.word	0x000009b0
     5b4:	9d 01 00 00	.word	0x0000019d

000005b8 <WWDG>:
     5b8: fe e7        	b	0x5b8 <WWDG>            @ imm = #-4

000005ba <__pre_init>:
     5ba: 70 47        	bx	lr

000005bc <_ZN4core3ptr70drop_in_place$LT$$RF$mut$u20$cortex_m_semihosting..hio..HostStream$GT$17h09e14c05280b3224E>:
     5bc: 70 47        	bx	lr

000005be <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E>:
     5be: f0 b5        	push	{r4, r5, r6, r7, lr}
     5c0: 03 af        	add	r7, sp, #12
     5c2: 85 b0        	sub	sp, #20
     5c4: 00 2a        	cmp	r2, #0
     5c6: 33 d0        	beq	0x630 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x72> @ imm = #102
     5c8: 15 46        	mov	r5, r2
     5ca: 0c 46        	mov	r4, r1
     5cc: 00 68        	ldr	r0, [r0]
     5ce: 00 68        	ldr	r0, [r0]
     5d0: 01 90        	str	r0, [sp, #4]
     5d2: 02 ab        	add	r3, sp, #8
     5d4: 07 c3        	stm	r3!, {r0, r1, r2}
     5d6: 05 20        	movs	r0, #5
     5d8: 02 a9        	add	r1, sp, #8
     5da: 00 90        	str	r0, [sp]
     5dc: ab be        	bkpt	#171
     5de: 41 42        	rsbs	r1, r0, #0
     5e0: 41 41        	adcs	r1, r0
     5e2: 01 23        	movs	r3, #1
     5e4: 90 42        	cmp	r0, r2
     5e6: 1a 46        	mov	r2, r3
     5e8: 00 d8        	bhi	0x5ec <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x2e> @ imm = #0
     5ea: 00 22        	movs	r2, #0
     5ec: 0a 43        	orrs	r2, r1
     5ee: 06 d0        	beq	0x5fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x40> @ imm = #12
     5f0: 01 20        	movs	r0, #1
     5f2: 48 40        	eors	r0, r1
     5f4: 05 b0        	add	sp, #20
     5f6: f0 bd        	pop	{r4, r5, r6, r7, pc}
     5f8: 01 2e        	cmp	r6, #1
     5fa: 15 46        	mov	r5, r2
     5fc: f8 d0        	beq	0x5f0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x32> @ imm = #-16
     5fe: 02 46        	mov	r2, r0
     600: 01 98        	ldr	r0, [sp, #4]
     602: 02 90        	str	r0, [sp, #8]
     604: 04 92        	str	r2, [sp, #16]
     606: a8 1a        	subs	r0, r5, r2
     608: 24 18        	adds	r4, r4, r0
     60a: 03 94        	str	r4, [sp, #12]
     60c: 02 a9        	add	r1, sp, #8
     60e: 00 98        	ldr	r0, [sp]
     610: ab be        	bkpt	#171
     612: 41 42        	rsbs	r1, r0, #0
     614: 41 41        	adcs	r1, r0
     616: 82 42        	cmp	r2, r0
     618: 04 d3        	blo	0x624 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x66> @ imm = #8
     61a: 00 25        	movs	r5, #0
     61c: 00 28        	cmp	r0, #0
     61e: 1e 46        	mov	r6, r3
     620: ea d0        	beq	0x5f8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x3a> @ imm = #-44
     622: 03 e0        	b	0x62c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x6e> @ imm = #6
     624: 01 25        	movs	r5, #1
     626: 00 28        	cmp	r0, #0
     628: 1e 46        	mov	r6, r3
     62a: e5 d0        	beq	0x5f8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x3a> @ imm = #-54
     62c: 2e 46        	mov	r6, r5
     62e: e3 e7        	b	0x5f8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h03f409bf3c95f967E+0x3a> @ imm = #-58
     630: 00 20        	movs	r0, #0
     632: 05 b0        	add	sp, #20
     634: f0 bd        	pop	{r4, r5, r6, r7, pc}

00000636 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E>:
     636: f0 b5        	push	{r4, r5, r6, r7, lr}
     638: 03 af        	add	r7, sp, #12
     63a: 84 b0        	sub	sp, #16
     63c: 00 68        	ldr	r0, [r0]
     63e: 00 22        	movs	r2, #0
     640: 00 92        	str	r2, [sp]
     642: 80 29        	cmp	r1, #128
     644: 03 d2        	bhs	0x64e <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x18> @ imm = #6
     646: 6a 46        	mov	r2, sp
     648: 11 70        	strb	r1, [r2]
     64a: 01 24        	movs	r4, #1
     64c: 2f e0        	b	0x6ae <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x78> @ imm = #94
     64e: ca 0a        	lsrs	r2, r1, #11
     650: 0a d1        	bne	0x668 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x32> @ imm = #20
     652: 3f 22        	movs	r2, #63
     654: 0a 40        	ands	r2, r1
     656: 80 32        	adds	r2, #128
     658: 6b 46        	mov	r3, sp
     65a: 5a 70        	strb	r2, [r3, #1]
     65c: 89 09        	lsrs	r1, r1, #6
     65e: c0 22        	movs	r2, #192
     660: 0a 43        	orrs	r2, r1
     662: 1a 70        	strb	r2, [r3]
     664: 02 24        	movs	r4, #2
     666: 22 e0        	b	0x6ae <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x78> @ imm = #68
     668: 0a 0c        	lsrs	r2, r1, #16
     66a: 0e d1        	bne	0x68a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x54> @ imm = #28
     66c: 3f 22        	movs	r2, #63
     66e: 0a 40        	ands	r2, r1
     670: 80 32        	adds	r2, #128
     672: 6b 46        	mov	r3, sp
     674: 9a 70        	strb	r2, [r3, #2]
     676: 0a 0b        	lsrs	r2, r1, #12
     678: e0 24        	movs	r4, #224
     67a: 14 43        	orrs	r4, r2
     67c: 1c 70        	strb	r4, [r3]
     67e: 09 05        	lsls	r1, r1, #20
     680: 89 0e        	lsrs	r1, r1, #26
     682: 80 31        	adds	r1, #128
     684: 59 70        	strb	r1, [r3, #1]
     686: 03 24        	movs	r4, #3
     688: 11 e0        	b	0x6ae <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x78> @ imm = #34
     68a: 3f 23        	movs	r3, #63
     68c: 0b 40        	ands	r3, r1
     68e: 80 33        	adds	r3, #128
     690: 6a 46        	mov	r2, sp
     692: d3 70        	strb	r3, [r2, #3]
     694: 8b 0c        	lsrs	r3, r1, #18
     696: f0 24        	movs	r4, #240
     698: 1c 43        	orrs	r4, r3
     69a: 14 70        	strb	r4, [r2]
     69c: 0b 05        	lsls	r3, r1, #20
     69e: 9b 0e        	lsrs	r3, r3, #26
     6a0: 80 33        	adds	r3, #128
     6a2: 93 70        	strb	r3, [r2, #2]
     6a4: 89 03        	lsls	r1, r1, #14
     6a6: 89 0e        	lsrs	r1, r1, #26
     6a8: 80 31        	adds	r1, #128
     6aa: 51 70        	strb	r1, [r2, #1]
     6ac: 04 24        	movs	r4, #4
     6ae: 03 68        	ldr	r3, [r0]
     6b0: 03 94        	str	r4, [sp, #12]
     6b2: 68 46        	mov	r0, sp
     6b4: 02 90        	str	r0, [sp, #8]
     6b6: 01 93        	str	r3, [sp, #4]
     6b8: 05 22        	movs	r2, #5
     6ba: 01 a9        	add	r1, sp, #4
     6bc: 10 46        	mov	r0, r2
     6be: ab be        	bkpt	#171
     6c0: 41 42        	rsbs	r1, r0, #0
     6c2: 41 41        	adcs	r1, r0
     6c4: 45 1e        	subs	r5, r0, #1
     6c6: a5 42        	cmp	r5, r4
     6c8: 10 d2        	bhs	0x6ec <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0xb6> @ imm = #32
     6ca: 6d 46        	mov	r5, sp
     6cc: 06 46        	mov	r6, r0
     6ce: 01 93        	str	r3, [sp, #4]
     6d0: 03 90        	str	r0, [sp, #12]
     6d2: 20 1a        	subs	r0, r4, r0
     6d4: 2d 18        	adds	r5, r5, r0
     6d6: 02 95        	str	r5, [sp, #8]
     6d8: 01 a9        	add	r1, sp, #4
     6da: 10 46        	mov	r0, r2
     6dc: ab be        	bkpt	#171
     6de: 41 42        	rsbs	r1, r0, #0
     6e0: 41 41        	adcs	r1, r0
     6e2: 00 28        	cmp	r0, #0
     6e4: 02 d0        	beq	0x6ec <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0xb6> @ imm = #4
     6e6: 86 42        	cmp	r6, r0
     6e8: 34 46        	mov	r4, r6
     6ea: ef d2        	bhs	0x6cc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h2600d683bcf226b2E+0x96> @ imm = #-34
     6ec: 01 20        	movs	r0, #1
     6ee: 48 40        	eors	r0, r1
     6f0: 04 b0        	add	sp, #16
     6f2: f0 bd        	pop	{r4, r5, r6, r7, pc}

000006f4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hd31f7e06213b1f40E>:
     6f4: b0 b5        	push	{r4, r5, r7, lr}
     6f6: 02 af        	add	r7, sp, #8
     6f8: 88 b0        	sub	sp, #32
     6fa: 00 68        	ldr	r0, [r0]
     6fc: 01 90        	str	r0, [sp, #4]
     6fe: 02 aa        	add	r2, sp, #8
     700: 10 46        	mov	r0, r2
     702: 38 c9        	ldm	r1!, {r3, r4, r5}
     704: 38 c0        	stm	r0!, {r3, r4, r5}
     706: 38 c9        	ldm	r1!, {r3, r4, r5}
     708: 38 c0        	stm	r0!, {r3, r4, r5}
     70a: 01 a8        	add	r0, sp, #4
     70c: 11 46        	mov	r1, r2
     70e: ff f7 a1 fe  	bl	0x454 <_ZN4core3fmt5write17he9beb2966ab2d949E> @ imm = #-702
     712: 08 b0        	add	sp, #32
     714: b0 bd        	pop	{r4, r5, r7, pc}

00000716 <__cpsid>:
     716: 72 b6        	cpsid i
     718: 70 47        	bx	lr

0000071a <__cpsie>:
     71a: 62 b6        	cpsie i
     71c: 70 47        	bx	lr

0000071e <__primask_r>:
     71e: ef f3 10 80  	mrs	r0, primask
     722: 70 47        	bx	lr

00000724 <__aeabi_uidiv>:
     724: 80 b5        	push	{r7, lr}
     726: 00 af        	add	r7, sp, #0
     728: 00 f0 01 f8  	bl	0x72e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE> @ imm = #2
     72c: 80 bd        	pop	{r7, pc}

0000072e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE>:
     72e: f0 b5        	push	{r4, r5, r6, r7, lr}
     730: 03 af        	add	r7, sp, #12
     732: 83 b0        	sub	sp, #12
     734: 02 46        	mov	r2, r0
     736: 88 42        	cmp	r0, r1
     738: 03 d2        	bhs	0x742 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x14> @ imm = #6
     73a: 00 20        	movs	r0, #0
     73c: 11 46        	mov	r1, r2
     73e: 03 b0        	add	sp, #12
     740: f0 bd        	pop	{r4, r5, r6, r7, pc}
     742: 15 0c        	lsrs	r5, r2, #16
     744: a9 42        	cmp	r1, r5
     746: 10 46        	mov	r0, r2
     748: 39 d9        	bls	0x7be <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x90> @ imm = #114
     74a: 06 0a        	lsrs	r6, r0, #8
     74c: b1 42        	cmp	r1, r6
     74e: 3a d9        	bls	0x7c6 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x98> @ imm = #116
     750: 03 09        	lsrs	r3, r0, #4
     752: 99 42        	cmp	r1, r3
     754: 3b d9        	bls	0x7ce <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xa0> @ imm = #118
     756: 01 93        	str	r3, [sp, #4]
     758: 83 08        	lsrs	r3, r0, #2
     75a: 99 42        	cmp	r1, r3
     75c: 00 d8        	bhi	0x760 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x32> @ imm = #0
     75e: 18 46        	mov	r0, r3
     760: 02 93        	str	r3, [sp, #8]
     762: 43 08        	lsrs	r3, r0, #1
     764: 01 24        	movs	r4, #1
     766: 00 20        	movs	r0, #0
     768: 99 42        	cmp	r1, r3
     76a: 23 46        	mov	r3, r4
     76c: 00 d9        	bls	0x770 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x42> @ imm = #0
     76e: 03 46        	mov	r3, r0
     770: a9 42        	cmp	r1, r5
     772: 25 46        	mov	r5, r4
     774: 00 d9        	bls	0x778 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x4a> @ imm = #0
     776: 05 46        	mov	r5, r0
     778: 00 93        	str	r3, [sp]
     77a: 2d 01        	lsls	r5, r5, #4
     77c: b1 42        	cmp	r1, r6
     77e: 26 46        	mov	r6, r4
     780: 00 d9        	bls	0x784 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x56> @ imm = #0
     782: 06 46        	mov	r6, r0
     784: f3 00        	lsls	r3, r6, #3
     786: 5d 19        	adds	r5, r3, r5
     788: 01 9b        	ldr	r3, [sp, #4]
     78a: 99 42        	cmp	r1, r3
     78c: 23 46        	mov	r3, r4
     78e: 00 d9        	bls	0x792 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x64> @ imm = #0
     790: 03 46        	mov	r3, r0
     792: 9b 00        	lsls	r3, r3, #2
     794: eb 18        	adds	r3, r5, r3
     796: 02 9d        	ldr	r5, [sp, #8]
     798: a9 42        	cmp	r1, r5
     79a: 25 46        	mov	r5, r4
     79c: 00 d9        	bls	0x7a0 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x72> @ imm = #0
     79e: 05 46        	mov	r5, r0
     7a0: 68 00        	lsls	r0, r5, #1
     7a2: 18 18        	adds	r0, r3, r0
     7a4: 00 9b        	ldr	r3, [sp]
     7a6: c3 18        	adds	r3, r0, r3
     7a8: 9c 40        	lsls	r4, r3
     7aa: 0d 46        	mov	r5, r1
     7ac: 9d 40        	lsls	r5, r3
     7ae: 56 1b        	subs	r6, r2, r5
     7b0: 8e 42        	cmp	r6, r1
     7b2: 12 d2        	bhs	0x7da <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xac> @ imm = #36
     7b4: 32 46        	mov	r2, r6
     7b6: 20 46        	mov	r0, r4
     7b8: 11 46        	mov	r1, r2
     7ba: 03 b0        	add	sp, #12
     7bc: f0 bd        	pop	{r4, r5, r6, r7, pc}
     7be: 28 46        	mov	r0, r5
     7c0: 06 0a        	lsrs	r6, r0, #8
     7c2: b1 42        	cmp	r1, r6
     7c4: c4 d8        	bhi	0x750 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x22> @ imm = #-120
     7c6: 30 46        	mov	r0, r6
     7c8: 03 09        	lsrs	r3, r0, #4
     7ca: 99 42        	cmp	r1, r3
     7cc: c3 d8        	bhi	0x756 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x28> @ imm = #-122
     7ce: 18 46        	mov	r0, r3
     7d0: 01 93        	str	r3, [sp, #4]
     7d2: 83 08        	lsrs	r3, r0, #2
     7d4: 99 42        	cmp	r1, r3
     7d6: c2 d9        	bls	0x75e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x30> @ imm = #-124
     7d8: c2 e7        	b	0x760 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x32> @ imm = #-124
     7da: 00 2d        	cmp	r5, #0
     7dc: 03 d4        	bmi	0x7e6 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xb8> @ imm = #6
     7de: 21 46        	mov	r1, r4
     7e0: 20 46        	mov	r0, r4
     7e2: 32 46        	mov	r2, r6
     7e4: 15 e0        	b	0x812 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xe4> @ imm = #42
     7e6: 6d 08        	lsrs	r5, r5, #1
     7e8: 72 1b        	subs	r2, r6, r5
     7ea: 5b 1e        	subs	r3, r3, #1
     7ec: 1f 20        	movs	r0, #31
     7ee: 01 93        	str	r3, [sp, #4]
     7f0: 18 40        	ands	r0, r3
     7f2: 02 90        	str	r0, [sp, #8]
     7f4: 01 20        	movs	r0, #1
     7f6: 02 9b        	ldr	r3, [sp, #8]
     7f8: 98 40        	lsls	r0, r3
     7fa: 00 2a        	cmp	r2, #0
     7fc: 02 90        	str	r0, [sp, #8]
     7fe: 00 da        	bge	0x802 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xd4> @ imm = #0
     800: 00 20        	movs	r0, #0
     802: 00 2a        	cmp	r2, #0
     804: 00 da        	bge	0x808 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xda> @ imm = #0
     806: 32 46        	mov	r2, r6
     808: 20 43        	orrs	r0, r4
     80a: 8a 42        	cmp	r2, r1
     80c: 02 99        	ldr	r1, [sp, #8]
     80e: 01 9b        	ldr	r3, [sp, #4]
     810: 94 d3        	blo	0x73c <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0xe> @ imm = #-216
     812: 49 1e        	subs	r1, r1, #1
     814: 00 2b        	cmp	r3, #0
     816: 10 d0        	beq	0x83a <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x10c> @ imm = #32
     818: 03 26        	movs	r6, #3
     81a: 1e 40        	ands	r6, r3
     81c: 01 24        	movs	r4, #1
     81e: 64 1b        	subs	r4, r4, r5
     820: 5d 1e        	subs	r5, r3, #1
     822: 02 95        	str	r5, [sp, #8]
     824: 00 2e        	cmp	r6, #0
     826: 0a d0        	beq	0x83e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x110> @ imm = #20
     828: 55 00        	lsls	r5, r2, #1
     82a: 2a 19        	adds	r2, r5, r4
     82c: 00 d4        	bmi	0x830 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x102> @ imm = #0
     82e: 15 46        	mov	r5, r2
     830: 01 2e        	cmp	r6, #1
     832: 08 d1        	bne	0x846 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x118> @ imm = #16
     834: 02 9e        	ldr	r6, [sp, #8]
     836: 32 46        	mov	r2, r6
     838: 14 e0        	b	0x864 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x136> @ imm = #40
     83a: 15 46        	mov	r5, r2
     83c: 14 e0        	b	0x868 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x13a> @ imm = #40
     83e: 15 46        	mov	r5, r2
     840: 1a 46        	mov	r2, r3
     842: 02 9e        	ldr	r6, [sp, #8]
     844: 0e e0        	b	0x864 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x136> @ imm = #28
     846: 6d 00        	lsls	r5, r5, #1
     848: 2a 19        	adds	r2, r5, r4
     84a: 00 d4        	bmi	0x84e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x120> @ imm = #0
     84c: 15 46        	mov	r5, r2
     84e: 02 2e        	cmp	r6, #2
     850: 02 d1        	bne	0x858 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x12a> @ imm = #4
     852: 9a 1e        	subs	r2, r3, #2
     854: 02 9e        	ldr	r6, [sp, #8]
     856: 05 e0        	b	0x864 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x136> @ imm = #10
     858: 6d 00        	lsls	r5, r5, #1
     85a: 2a 19        	adds	r2, r5, r4
     85c: 02 9e        	ldr	r6, [sp, #8]
     85e: 00 d4        	bmi	0x862 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x134> @ imm = #0
     860: 15 46        	mov	r5, r2
     862: da 1e        	subs	r2, r3, #3
     864: 03 2e        	cmp	r6, #3
     866: 0a d2        	bhs	0x87e <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x150> @ imm = #20
     868: 1f 22        	movs	r2, #31
     86a: 13 40        	ands	r3, r2
     86c: 2a 46        	mov	r2, r5
     86e: da 40        	lsrs	r2, r3
     870: 29 40        	ands	r1, r5
     872: 08 43        	orrs	r0, r1
     874: 11 46        	mov	r1, r2
     876: 03 b0        	add	sp, #12
     878: f0 bd        	pop	{r4, r5, r6, r7, pc}
     87a: 12 1f        	subs	r2, r2, #4
     87c: f4 d0        	beq	0x868 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x13a> @ imm = #-24
     87e: 6d 00        	lsls	r5, r5, #1
     880: 2e 19        	adds	r6, r5, r4
     882: 09 d5        	bpl	0x898 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x16a> @ imm = #18
     884: 6d 00        	lsls	r5, r5, #1
     886: 2e 19        	adds	r6, r5, r4
     888: 0a d5        	bpl	0x8a0 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x172> @ imm = #20
     88a: 6d 00        	lsls	r5, r5, #1
     88c: 2e 19        	adds	r6, r5, r4
     88e: 0b d5        	bpl	0x8a8 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x17a> @ imm = #22
     890: 6d 00        	lsls	r5, r5, #1
     892: 2e 19        	adds	r6, r5, r4
     894: f1 d4        	bmi	0x87a <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x14c> @ imm = #-30
     896: 0b e0        	b	0x8b0 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x182> @ imm = #22
     898: 35 46        	mov	r5, r6
     89a: 6d 00        	lsls	r5, r5, #1
     89c: 2e 19        	adds	r6, r5, r4
     89e: f4 d4        	bmi	0x88a <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x15c> @ imm = #-24
     8a0: 35 46        	mov	r5, r6
     8a2: 6d 00        	lsls	r5, r5, #1
     8a4: 2e 19        	adds	r6, r5, r4
     8a6: f3 d4        	bmi	0x890 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x162> @ imm = #-26
     8a8: 35 46        	mov	r5, r6
     8aa: 6d 00        	lsls	r5, r5, #1
     8ac: 2e 19        	adds	r6, r5, r4
     8ae: e4 d4        	bmi	0x87a <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x14c> @ imm = #-56
     8b0: 35 46        	mov	r5, r6
     8b2: e2 e7        	b	0x87a <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x14c> @ imm = #-60

000008b4 <HardFaultTrampoline>:
     8b4: 70 46        	mov	r0, lr
     8b6: 04 21        	movs	r1, #4
     8b8: 08 42        	tst	r0, r1
     8ba: 02 d1        	bne	0x8c2 <HardFaultTrampoline+0xe> @ imm = #4
     8bc: ef f3 08 80  	mrs	r0, msp
     8c0: 02 e0        	b	0x8c8 <HardFault_>      @ imm = #4
     8c2: ef f3 09 80  	mrs	r0, psp
     8c6: ff e7        	b	0x8c8 <HardFault_>      @ imm = #-2

000008c8 <HardFault_>:
;     loop {
     8c8: fe e7        	b	0x8c8 <HardFault_>      @ imm = #-4
     8ca: d4 d4        	bmi	0x876 <_ZN17compiler_builtins3int19specialized_div_rem11u32_div_rem17h3b6f635e3a820bbdE+0x148> @ imm = #-88


inc:	file format elf32-littlearm

Disassembly of section .text:

000000b8 <__stext>:
      b8: 2400         	movs	r4, #0
      ba: 43e4         	mvns	r4, r4
      bc: 46a6         	mov	lr, r4
      be: f000 fb4e    	bl	0x75e <__pre_init>      @ imm = #1692
      c2: 46a6         	mov	lr, r4
      c4: 4809         	ldr	r0, [pc, #36]           @ 0xec <$d.21>
      c6: 490a         	ldr	r1, [pc, #40]           @ 0xf0 <$d.21+0x4>
      c8: 2200         	movs	r2, #0
      ca: 4281         	cmp	r1, r0
      cc: d001         	beq	0xd2 <__stext+0x1a>     @ imm = #2
      ce: c004         	stm	r0!, {r2}
      d0: e7fb         	b	0xca <__stext+0x12>     @ imm = #-10
      d2: 4808         	ldr	r0, [pc, #32]           @ 0xf4 <$d.21+0x8>
      d4: 4908         	ldr	r1, [pc, #32]           @ 0xf8 <$d.21+0xc>
      d6: 4a09         	ldr	r2, [pc, #36]           @ 0xfc <$d.21+0x10>
      d8: 4281         	cmp	r1, r0
      da: d002         	beq	0xe2 <__stext+0x2a>     @ imm = #4
      dc: ca08         	ldm	r2!, {r3}
      de: c008         	stm	r0!, {r3}
      e0: e7fa         	b	0xd8 <__stext+0x20>     @ imm = #-12
      e2: b500         	push	{lr}
      e4: f000 f825    	bl	0x132 <main>            @ imm = #74
      e8: de00         	udf	#0
      ea: 0000         	movs	r0, r0

000000ec <$d.21>:
      ec: 00 00 00 20  	.word	0x20000000
      f0: 08 00 00 20  	.word	0x20000008
      f4: 00 00 00 20  	.word	0x20000000
      f8: 00 00 00 20  	.word	0x20000000
      fc: e8 0b 00 00  	.word	0x00000be8

00000100 <inc_function>:
     100: 1c40         	adds	r0, r0, #1
     102: 4770         	bx	lr

00000104 <cond_function>:
     104: 280a         	cmp	r0, #10
     106: d802         	bhi	0x10e <cond_function+0xa> @ imm = #4
     108: 2101         	movs	r1, #1
     10a: 1808         	adds	r0, r1, r0
     10c: 4770         	bx	lr
     10e: 2100         	movs	r1, #0
     110: 43c9         	mvns	r1, r1
     112: 1808         	adds	r0, r1, r0
     114: 4770         	bx	lr

00000116 <cond_function2>:
     116: b5b0         	push	{r4, r5, r7, lr}
     118: af02         	add	r7, sp, #8
     11a: 460c         	mov	r4, r1
     11c: 4605         	mov	r5, r0
     11e: 2105         	movs	r1, #5
     120: f000 fbd2    	bl	0x8c8 <__aeabi_uidiv>   @ imm = #1956
     124: 42a5         	cmp	r5, r4
     126: d801         	bhi	0x12c <cond_function2+0x16> @ imm = #2
     128: 1a20         	subs	r0, r4, r0
     12a: bdb0         	pop	{r4, r5, r7, pc}
     12c: 0060         	lsls	r0, r4, #1
     12e: 1940         	adds	r0, r0, r5
     130: bdb0         	pop	{r4, r5, r7, pc}

00000132 <main>:
     132: b580         	push	{r7, lr}
     134: af00         	add	r7, sp, #0
     136: f000 f801    	bl	0x13c <inc::__cortex_m_rt_main::h11ef4a6c36885f4c> @ imm = #2
     13a: defe         	trap

0000013c <inc::__cortex_m_rt_main::h11ef4a6c36885f4c>:
     13c: b580         	push	{r7, lr}
     13e: af00         	add	r7, sp, #0
     140: b08a         	sub	sp, #40
     142: 2401         	movs	r4, #1
     144: 4620         	mov	r0, r4
     146: f7ff ffdb    	bl	0x100 <inc_function>    @ imm = #-74
     14a: 9002         	str	r0, [sp, #8]
     14c: 487b         	ldr	r0, [pc, #492]          @ 0x33c <$d.7>
     14e: 9001         	str	r0, [sp, #4]
     150: a802         	add	r0, sp, #8
     152: 9000         	str	r0, [sp]
     154: f000 fbb5    	bl	0x8c2 <__primask_r>     @ imm = #1898
     158: 4605         	mov	r5, r0
     15a: 4025         	ands	r5, r4
     15c: f000 fbad    	bl	0x8ba <__cpsid>         @ imm = #1882
     160: 4e77         	ldr	r6, [pc, #476]          @ 0x340 <$d.7+0x4>
     162: 6830         	ldr	r0, [r6]
     164: 2801         	cmp	r0, #1
     166: d00c         	beq	0x182 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x46> @ imm = #24
     168: 2003         	movs	r0, #3
     16a: 9006         	str	r0, [sp, #24]
     16c: 2004         	movs	r0, #4
     16e: 9005         	str	r0, [sp, #20]
     170: 4874         	ldr	r0, [pc, #464]          @ 0x344 <$d.7+0x8>
     172: 9004         	str	r0, [sp, #16]
     174: a904         	add	r1, sp, #16
     176: 4620         	mov	r0, r4
     178: beab         	bkpt	#171
     17a: 1c41         	adds	r1, r0, #1
     17c: d010         	beq	0x1a0 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x64> @ imm = #32
     17e: 6034         	str	r4, [r6]
     180: 6070         	str	r0, [r6, #4]
     182: 1d30         	adds	r0, r6, #4
     184: 9003         	str	r0, [sp, #12]
     186: 9409         	str	r4, [sp, #36]
     188: 4668         	mov	r0, sp
     18a: 9008         	str	r0, [sp, #32]
     18c: 2002         	movs	r0, #2
     18e: 9007         	str	r0, [sp, #28]
     190: 486d         	ldr	r0, [pc, #436]          @ 0x348 <$d.7+0xc>
     192: 9006         	str	r0, [sp, #24]
     194: 2000         	movs	r0, #0
     196: 9004         	str	r0, [sp, #16]
     198: a803         	add	r0, sp, #12
     19a: a904         	add	r1, sp, #16
     19c: f000 fa30    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #1120
     1a0: 2d00         	cmp	r5, #0
     1a2: d101         	bne	0x1a8 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x6c> @ imm = #2
     1a4: f000 fb8b    	bl	0x8be <__cpsie>         @ imm = #1814
     1a8: 4620         	mov	r0, r4
     1aa: f7ff ffab    	bl	0x104 <cond_function>   @ imm = #-170
     1ae: 9002         	str	r0, [sp, #8]
     1b0: 4862         	ldr	r0, [pc, #392]          @ 0x33c <$d.7>
     1b2: 9001         	str	r0, [sp, #4]
     1b4: a802         	add	r0, sp, #8
     1b6: 9000         	str	r0, [sp]
     1b8: f000 fb83    	bl	0x8c2 <__primask_r>     @ imm = #1798
     1bc: 4605         	mov	r5, r0
     1be: 4025         	ands	r5, r4
     1c0: f000 fb7b    	bl	0x8ba <__cpsid>         @ imm = #1782
     1c4: 6830         	ldr	r0, [r6]
     1c6: 2801         	cmp	r0, #1
     1c8: d00c         	beq	0x1e4 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0xa8> @ imm = #24
     1ca: 2003         	movs	r0, #3
     1cc: 9006         	str	r0, [sp, #24]
     1ce: 2004         	movs	r0, #4
     1d0: 9005         	str	r0, [sp, #20]
     1d2: 485c         	ldr	r0, [pc, #368]          @ 0x344 <$d.7+0x8>
     1d4: 9004         	str	r0, [sp, #16]
     1d6: a904         	add	r1, sp, #16
     1d8: 4620         	mov	r0, r4
     1da: beab         	bkpt	#171
     1dc: 1c41         	adds	r1, r0, #1
     1de: d010         	beq	0x202 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0xc6> @ imm = #32
     1e0: 6034         	str	r4, [r6]
     1e2: 6070         	str	r0, [r6, #4]
     1e4: 1d30         	adds	r0, r6, #4
     1e6: 9003         	str	r0, [sp, #12]
     1e8: 9409         	str	r4, [sp, #36]
     1ea: 4668         	mov	r0, sp
     1ec: 9008         	str	r0, [sp, #32]
     1ee: 2002         	movs	r0, #2
     1f0: 9007         	str	r0, [sp, #28]
     1f2: 4856         	ldr	r0, [pc, #344]          @ 0x34c <$d.7+0x10>
     1f4: 9006         	str	r0, [sp, #24]
     1f6: 2000         	movs	r0, #0
     1f8: 9004         	str	r0, [sp, #16]
     1fa: a803         	add	r0, sp, #12
     1fc: a904         	add	r1, sp, #16
     1fe: f000 f9ff    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #1022
     202: 2d00         	cmp	r5, #0
     204: d101         	bne	0x20a <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0xce> @ imm = #2
     206: f000 fb5a    	bl	0x8be <__cpsie>         @ imm = #1716
     20a: 200b         	movs	r0, #11
     20c: f7ff ff7a    	bl	0x104 <cond_function>   @ imm = #-268
     210: 9002         	str	r0, [sp, #8]
     212: 484a         	ldr	r0, [pc, #296]          @ 0x33c <$d.7>
     214: 9001         	str	r0, [sp, #4]
     216: a802         	add	r0, sp, #8
     218: 9000         	str	r0, [sp]
     21a: f000 fb52    	bl	0x8c2 <__primask_r>     @ imm = #1700
     21e: 4605         	mov	r5, r0
     220: 4025         	ands	r5, r4
     222: f000 fb4a    	bl	0x8ba <__cpsid>         @ imm = #1684
     226: 6830         	ldr	r0, [r6]
     228: 2801         	cmp	r0, #1
     22a: d00c         	beq	0x246 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x10a> @ imm = #24
     22c: 2003         	movs	r0, #3
     22e: 9006         	str	r0, [sp, #24]
     230: 2004         	movs	r0, #4
     232: 9005         	str	r0, [sp, #20]
     234: 4843         	ldr	r0, [pc, #268]          @ 0x344 <$d.7+0x8>
     236: 9004         	str	r0, [sp, #16]
     238: a904         	add	r1, sp, #16
     23a: 4620         	mov	r0, r4
     23c: beab         	bkpt	#171
     23e: 1c41         	adds	r1, r0, #1
     240: d010         	beq	0x264 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x128> @ imm = #32
     242: 6034         	str	r4, [r6]
     244: 6070         	str	r0, [r6, #4]
     246: 1d30         	adds	r0, r6, #4
     248: 9003         	str	r0, [sp, #12]
     24a: 9409         	str	r4, [sp, #36]
     24c: 4668         	mov	r0, sp
     24e: 9008         	str	r0, [sp, #32]
     250: 2002         	movs	r0, #2
     252: 9007         	str	r0, [sp, #28]
     254: 483e         	ldr	r0, [pc, #248]          @ 0x350 <$d.7+0x14>
     256: 9006         	str	r0, [sp, #24]
     258: 2000         	movs	r0, #0
     25a: 9004         	str	r0, [sp, #16]
     25c: a803         	add	r0, sp, #12
     25e: a904         	add	r1, sp, #16
     260: f000 f9ce    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #924
     264: 2d00         	cmp	r5, #0
     266: d101         	bne	0x26c <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x130> @ imm = #2
     268: f000 fb29    	bl	0x8be <__cpsie>         @ imm = #1618
     26c: 210b         	movs	r1, #11
     26e: 4620         	mov	r0, r4
     270: f7ff ff51    	bl	0x116 <cond_function2>  @ imm = #-350
     274: 9002         	str	r0, [sp, #8]
     276: 4831         	ldr	r0, [pc, #196]          @ 0x33c <$d.7>
     278: 9001         	str	r0, [sp, #4]
     27a: a802         	add	r0, sp, #8
     27c: 9000         	str	r0, [sp]
     27e: f000 fb20    	bl	0x8c2 <__primask_r>     @ imm = #1600
     282: 4605         	mov	r5, r0
     284: 4025         	ands	r5, r4
     286: f000 fb18    	bl	0x8ba <__cpsid>         @ imm = #1584
     28a: 6830         	ldr	r0, [r6]
     28c: 2801         	cmp	r0, #1
     28e: d00c         	beq	0x2aa <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x16e> @ imm = #24
     290: 2003         	movs	r0, #3
     292: 9006         	str	r0, [sp, #24]
     294: 2004         	movs	r0, #4
     296: 9005         	str	r0, [sp, #20]
     298: 482a         	ldr	r0, [pc, #168]          @ 0x344 <$d.7+0x8>
     29a: 9004         	str	r0, [sp, #16]
     29c: a904         	add	r1, sp, #16
     29e: 4620         	mov	r0, r4
     2a0: beab         	bkpt	#171
     2a2: 1c41         	adds	r1, r0, #1
     2a4: d010         	beq	0x2c8 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x18c> @ imm = #32
     2a6: 6034         	str	r4, [r6]
     2a8: 6070         	str	r0, [r6, #4]
     2aa: 1d30         	adds	r0, r6, #4
     2ac: 9003         	str	r0, [sp, #12]
     2ae: 9409         	str	r4, [sp, #36]
     2b0: 4668         	mov	r0, sp
     2b2: 9008         	str	r0, [sp, #32]
     2b4: 2002         	movs	r0, #2
     2b6: 9007         	str	r0, [sp, #28]
     2b8: 4826         	ldr	r0, [pc, #152]          @ 0x354 <$d.7+0x18>
     2ba: 9006         	str	r0, [sp, #24]
     2bc: 2000         	movs	r0, #0
     2be: 9004         	str	r0, [sp, #16]
     2c0: a803         	add	r0, sp, #12
     2c2: a904         	add	r1, sp, #16
     2c4: f000 f99c    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #824
     2c8: 2d00         	cmp	r5, #0
     2ca: d101         	bne	0x2d0 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x194> @ imm = #2
     2cc: f000 faf7    	bl	0x8be <__cpsie>         @ imm = #1518
     2d0: 200b         	movs	r0, #11
     2d2: 4621         	mov	r1, r4
     2d4: f7ff ff1f    	bl	0x116 <cond_function2>  @ imm = #-450
     2d8: 9002         	str	r0, [sp, #8]
     2da: 4818         	ldr	r0, [pc, #96]           @ 0x33c <$d.7>
     2dc: 9001         	str	r0, [sp, #4]
     2de: a802         	add	r0, sp, #8
     2e0: 9000         	str	r0, [sp]
     2e2: f000 faee    	bl	0x8c2 <__primask_r>     @ imm = #1500
     2e6: 4605         	mov	r5, r0
     2e8: 4025         	ands	r5, r4
     2ea: f000 fae6    	bl	0x8ba <__cpsid>         @ imm = #1484
     2ee: 6830         	ldr	r0, [r6]
     2f0: 2801         	cmp	r0, #1
     2f2: d00c         	beq	0x30e <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x1d2> @ imm = #24
     2f4: 2003         	movs	r0, #3
     2f6: 9006         	str	r0, [sp, #24]
     2f8: 2004         	movs	r0, #4
     2fa: 9005         	str	r0, [sp, #20]
     2fc: 4811         	ldr	r0, [pc, #68]           @ 0x344 <$d.7+0x8>
     2fe: 9004         	str	r0, [sp, #16]
     300: a904         	add	r1, sp, #16
     302: 4620         	mov	r0, r4
     304: beab         	bkpt	#171
     306: 1c41         	adds	r1, r0, #1
     308: d010         	beq	0x32c <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x1f0> @ imm = #32
     30a: 6034         	str	r4, [r6]
     30c: 6070         	str	r0, [r6, #4]
     30e: 1d30         	adds	r0, r6, #4
     310: 9003         	str	r0, [sp, #12]
     312: 9409         	str	r4, [sp, #36]
     314: 4668         	mov	r0, sp
     316: 9008         	str	r0, [sp, #32]
     318: 2002         	movs	r0, #2
     31a: 9007         	str	r0, [sp, #28]
     31c: 480e         	ldr	r0, [pc, #56]           @ 0x358 <$d.7+0x1c>
     31e: 9006         	str	r0, [sp, #24]
     320: 2000         	movs	r0, #0
     322: 9004         	str	r0, [sp, #16]
     324: a803         	add	r0, sp, #12
     326: a904         	add	r1, sp, #16
     328: f000 f96a    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #724
     32c: 2d00         	cmp	r5, #0
     32e: d101         	bne	0x334 <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x1f8> @ imm = #2
     330: f000 fac5    	bl	0x8be <__cpsie>         @ imm = #1418
     334: 2018         	movs	r0, #24
     336: 4909         	ldr	r1, [pc, #36]           @ 0x35c <$d.7+0x20>
     338: beab         	bkpt	#171
     33a: e7fe         	b	0x33a <inc::__cortex_m_rt_main::h11ef4a6c36885f4c+0x1fe> @ imm = #-4

0000033c <$d.7>:
     33c: 65 03 00 00  	.word	0x00000365
     340: 00 00 00 20  	.word	0x20000000
     344: e4 0b 00 00  	.word	0x00000be4
     348: 7c 0a 00 00  	.word	0x00000a7c
     34c: 98 0a 00 00  	.word	0x00000a98
     350: b4 0a 00 00  	.word	0x00000ab4
     354: d4 0a 00 00  	.word	0x00000ad4
     358: f4 0a 00 00  	.word	0x00000af4
     35c: 26 00 02 00  	.word	0x00020026

00000360 <core::ops::function::FnOnce::call_once::h5654401cc15e01ff>:
     360: 6800         	ldr	r0, [r0]
     362: e7fe         	b	0x362 <core::ops::function::FnOnce::call_once::h5654401cc15e01ff+0x2> @ imm = #-4

00000364 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252>:
     364: b5f0         	push	{r4, r5, r6, r7, lr}
     366: af03         	add	r7, sp, #12
     368: b095         	sub	sp, #84
     36a: 9107         	str	r1, [sp, #28]
     36c: 6802         	ldr	r2, [r0]
     36e: 498d         	ldr	r1, [pc, #564]          @ 0x5a4 <$d.10>
     370: 2527         	movs	r5, #39
     372: 428a         	cmp	r2, r1
     374: d32d         	blo	0x3d2 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x6e> @ imm = #90
     376: 4614         	mov	r4, r2
     378: 950a         	str	r5, [sp, #40]
     37a: 4620         	mov	r0, r4
     37c: 4989         	ldr	r1, [pc, #548]          @ 0x5a4 <$d.10>
     37e: f000 faa3    	bl	0x8c8 <__aeabi_uidiv>   @ imm = #1350
     382: 9009         	str	r0, [sp, #36]
     384: 4989         	ldr	r1, [pc, #548]          @ 0x5ac <$d.10+0x8>
     386: 4341         	muls	r1, r0, r1
     388: 1909         	adds	r1, r1, r4
     38a: b28a         	uxth	r2, r1
     38c: 0892         	lsrs	r2, r2, #2
     38e: 4888         	ldr	r0, [pc, #544]          @ 0x5b0 <$d.10+0xc>
     390: 4342         	muls	r2, r0, r2
     392: 0c52         	lsrs	r2, r2, #17
     394: 0053         	lsls	r3, r2, #1
     396: 4887         	ldr	r0, [pc, #540]          @ 0x5b4 <$d.10+0x10>
     398: 5cc0         	ldrb	r0, [r0, r3]
     39a: ae0b         	add	r6, sp, #44
     39c: 1976         	adds	r6, r6, r5
     39e: 1f35         	subs	r5, r6, #4
     3a0: 7028         	strb	r0, [r5]
     3a2: 4884         	ldr	r0, [pc, #528]          @ 0x5b4 <$d.10+0x10>
     3a4: 18c0         	adds	r0, r0, r3
     3a6: 7840         	ldrb	r0, [r0, #1]
     3a8: 7068         	strb	r0, [r5, #1]
     3aa: 9d0a         	ldr	r5, [sp, #40]
     3ac: 487e         	ldr	r0, [pc, #504]          @ 0x5a8 <$d.10+0x4>
     3ae: 4342         	muls	r2, r0, r2
     3b0: 1850         	adds	r0, r2, r1
     3b2: b280         	uxth	r0, r0
     3b4: 0040         	lsls	r0, r0, #1
     3b6: 4a7f         	ldr	r2, [pc, #508]          @ 0x5b4 <$d.10+0x10>
     3b8: 5c11         	ldrb	r1, [r2, r0]
     3ba: 4613         	mov	r3, r2
     3bc: 1eb2         	subs	r2, r6, #2
     3be: 7011         	strb	r1, [r2]
     3c0: 1818         	adds	r0, r3, r0
     3c2: 7840         	ldrb	r0, [r0, #1]
     3c4: 7050         	strb	r0, [r2, #1]
     3c6: 9a09         	ldr	r2, [sp, #36]
     3c8: 1f2d         	subs	r5, r5, #4
     3ca: 487b         	ldr	r0, [pc, #492]          @ 0x5b8 <$d.10+0x14>
     3cc: 4284         	cmp	r4, r0
     3ce: 4614         	mov	r4, r2
     3d0: d8d2         	bhi	0x378 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x14> @ imm = #-92
     3d2: 2a63         	cmp	r2, #99
     3d4: d922         	bls	0x41c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0xb8> @ imm = #68
     3d6: b290         	uxth	r0, r2
     3d8: 0880         	lsrs	r0, r0, #2
     3da: 4975         	ldr	r1, [pc, #468]          @ 0x5b0 <$d.10+0xc>
     3dc: 4341         	muls	r1, r0, r1
     3de: 0c49         	lsrs	r1, r1, #17
     3e0: 2063         	movs	r0, #99
     3e2: 43c0         	mvns	r0, r0
     3e4: 4348         	muls	r0, r1, r0
     3e6: 1880         	adds	r0, r0, r2
     3e8: b280         	uxth	r0, r0
     3ea: 0040         	lsls	r0, r0, #1
     3ec: 4a71         	ldr	r2, [pc, #452]          @ 0x5b4 <$d.10+0x10>
     3ee: 5c13         	ldrb	r3, [r2, r0]
     3f0: 1ead         	subs	r5, r5, #2
     3f2: ac0b         	add	r4, sp, #44
     3f4: 5563         	strb	r3, [r4, r5]
     3f6: 462e         	mov	r6, r5
     3f8: 1963         	adds	r3, r4, r5
     3fa: 1810         	adds	r0, r2, r0
     3fc: 7840         	ldrb	r0, [r0, #1]
     3fe: 7058         	strb	r0, [r3, #1]
     400: 290a         	cmp	r1, #10
     402: 9d07         	ldr	r5, [sp, #28]
     404: d30f         	blo	0x426 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0xc2> @ imm = #30
     406: 0048         	lsls	r0, r1, #1
     408: 496a         	ldr	r1, [pc, #424]          @ 0x5b4 <$d.10+0x10>
     40a: 5c0a         	ldrb	r2, [r1, r0]
     40c: 1eb6         	subs	r6, r6, #2
     40e: ab0b         	add	r3, sp, #44
     410: 559a         	strb	r2, [r3, r6]
     412: 199a         	adds	r2, r3, r6
     414: 1808         	adds	r0, r1, r0
     416: 7840         	ldrb	r0, [r0, #1]
     418: 7050         	strb	r0, [r2, #1]
     41a: e008         	b	0x42e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0xca> @ imm = #16
     41c: 462e         	mov	r6, r5
     41e: 4611         	mov	r1, r2
     420: 290a         	cmp	r1, #10
     422: 9d07         	ldr	r5, [sp, #28]
     424: d2ef         	bhs	0x406 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0xa2> @ imm = #-34
     426: 1e76         	subs	r6, r6, #1
     428: 3130         	adds	r1, #48
     42a: a80b         	add	r0, sp, #44
     42c: 5581         	strb	r1, [r0, r6]
     42e: 2127         	movs	r1, #39
     430: 69a8         	ldr	r0, [r5, #24]
     432: 2201         	movs	r2, #1
     434: 4604         	mov	r4, r0
     436: 9209         	str	r2, [sp, #36]
     438: 4014         	ands	r4, r2
     43a: 2211         	movs	r2, #17
     43c: 0412         	lsls	r2, r2, #16
     43e: 2c00         	cmp	r4, #0
     440: 9205         	str	r2, [sp, #20]
     442: 9208         	str	r2, [sp, #32]
     444: d001         	beq	0x44a <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0xe6> @ imm = #2
     446: 222b         	movs	r2, #43
     448: 9208         	str	r2, [sp, #32]
     44a: 1b8b         	subs	r3, r1, r6
     44c: a90b         	add	r1, sp, #44
     44e: 1989         	adds	r1, r1, r6
     450: 9106         	str	r1, [sp, #24]
     452: 0741         	lsls	r1, r0, #29
     454: 17c9         	asrs	r1, r1, #31
     456: 4a59         	ldr	r2, [pc, #356]          @ 0x5bc <$d.10+0x18>
     458: 400a         	ands	r2, r1
     45a: 68a9         	ldr	r1, [r5, #8]
     45c: 2900         	cmp	r1, #0
     45e: d018         	beq	0x492 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x12e> @ imm = #48
     460: 9604         	str	r6, [sp, #16]
     462: 461e         	mov	r6, r3
     464: 191b         	adds	r3, r3, r4
     466: 68e9         	ldr	r1, [r5, #12]
     468: 910a         	str	r1, [sp, #40]
     46a: 4299         	cmp	r1, r3
     46c: d912         	bls	0x494 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x130> @ imm = #36
     46e: 9203         	str	r2, [sp, #12]
     470: 0700         	lsls	r0, r0, #28
     472: 9602         	str	r6, [sp, #8]
     474: d421         	bmi	0x4ba <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x156> @ imm = #66
     476: 2020         	movs	r0, #32
     478: 5c2a         	ldrb	r2, [r5, r0]
     47a: 2a03         	cmp	r2, #3
     47c: d100         	bne	0x480 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x11c> @ imm = #0
     47e: 2201         	movs	r2, #1
     480: 980a         	ldr	r0, [sp, #40]
     482: 1ac0         	subs	r0, r0, r3
     484: 0791         	lsls	r1, r2, #30
     486: d03f         	beq	0x508 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1a4> @ imm = #126
     488: 2a01         	cmp	r2, #1
     48a: d140         	bne	0x50e <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1aa> @ imm = #128
     48c: 2100         	movs	r1, #0
     48e: 9104         	str	r1, [sp, #16]
     490: e042         	b	0x518 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1b4> @ imm = #132
     492: 461e         	mov	r6, r3
     494: 682c         	ldr	r4, [r5]
     496: 686d         	ldr	r5, [r5, #4]
     498: 4620         	mov	r0, r4
     49a: 4629         	mov	r1, r5
     49c: 4613         	mov	r3, r2
     49e: 9a08         	ldr	r2, [sp, #32]
     4a0: f000 f88e    	bl	0x5c0 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca> @ imm = #284
     4a4: 2800         	cmp	r0, #0
     4a6: d105         	bne	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #10
     4a8: 68eb         	ldr	r3, [r5, #12]
     4aa: 4620         	mov	r0, r4
     4ac: 9906         	ldr	r1, [sp, #24]
     4ae: 4632         	mov	r2, r6
     4b0: 4798         	blx	r3
     4b2: 9009         	str	r0, [sp, #36]
     4b4: 9809         	ldr	r0, [sp, #36]
     4b6: b015         	add	sp, #84
     4b8: bdf0         	pop	{r4, r5, r6, r7, pc}
     4ba: 2020         	movs	r0, #32
     4bc: 5c29         	ldrb	r1, [r5, r0]
     4be: 9101         	str	r1, [sp, #4]
     4c0: 2101         	movs	r1, #1
     4c2: 9109         	str	r1, [sp, #36]
     4c4: 5429         	strb	r1, [r5, r0]
     4c6: 69e8         	ldr	r0, [r5, #28]
     4c8: 9000         	str	r0, [sp]
     4ca: 2030         	movs	r0, #48
     4cc: 61e8         	str	r0, [r5, #28]
     4ce: 6828         	ldr	r0, [r5]
     4d0: 462e         	mov	r6, r5
     4d2: 686d         	ldr	r5, [r5, #4]
     4d4: 9005         	str	r0, [sp, #20]
     4d6: 4629         	mov	r1, r5
     4d8: 9a08         	ldr	r2, [sp, #32]
     4da: 9b03         	ldr	r3, [sp, #12]
     4dc: f000 f870    	bl	0x5c0 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca> @ imm = #224
     4e0: 2800         	cmp	r0, #0
     4e2: d1e7         	bne	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-50
     4e4: 4630         	mov	r0, r6
     4e6: 3020         	adds	r0, #32
     4e8: 9008         	str	r0, [sp, #32]
     4ea: 980a         	ldr	r0, [sp, #40]
     4ec: 9904         	ldr	r1, [sp, #16]
     4ee: 1808         	adds	r0, r1, r0
     4f0: 1b04         	subs	r4, r0, r4
     4f2: 3c26         	subs	r4, #38
     4f4: 9e05         	ldr	r6, [sp, #20]
     4f6: 1e64         	subs	r4, r4, #1
     4f8: d03f         	beq	0x57a <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x216> @ imm = #126
     4fa: 692a         	ldr	r2, [r5, #16]
     4fc: 2130         	movs	r1, #48
     4fe: 4630         	mov	r0, r6
     500: 4790         	blx	r2
     502: 2800         	cmp	r0, #0
     504: d0f7         	beq	0x4f6 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x192> @ imm = #-18
     506: e7d5         	b	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-86
     508: 9004         	str	r0, [sp, #16]
     50a: 4610         	mov	r0, r2
     50c: e004         	b	0x518 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1b4> @ imm = #8
     50e: 0841         	lsrs	r1, r0, #1
     510: 1c40         	adds	r0, r0, #1
     512: 0840         	lsrs	r0, r0, #1
     514: 9004         	str	r0, [sp, #16]
     516: 4608         	mov	r0, r1
     518: 1c45         	adds	r5, r0, #1
     51a: 9807         	ldr	r0, [sp, #28]
     51c: 69c1         	ldr	r1, [r0, #28]
     51e: 910a         	str	r1, [sp, #40]
     520: c850         	ldm	r0!, {r4, r6}
     522: 2001         	movs	r0, #1
     524: 9009         	str	r0, [sp, #36]
     526: 1e6d         	subs	r5, r5, #1
     528: d006         	beq	0x538 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1d4> @ imm = #12
     52a: 6932         	ldr	r2, [r6, #16]
     52c: 4620         	mov	r0, r4
     52e: 990a         	ldr	r1, [sp, #40]
     530: 4790         	blx	r2
     532: 2800         	cmp	r0, #0
     534: d0f7         	beq	0x526 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1c2> @ imm = #-18
     536: e7bd         	b	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-134
     538: 9805         	ldr	r0, [sp, #20]
     53a: 990a         	ldr	r1, [sp, #40]
     53c: 4281         	cmp	r1, r0
     53e: d0b9         	beq	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-142
     540: 4620         	mov	r0, r4
     542: 4631         	mov	r1, r6
     544: 9a08         	ldr	r2, [sp, #32]
     546: 9b03         	ldr	r3, [sp, #12]
     548: f000 f83a    	bl	0x5c0 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca> @ imm = #116
     54c: 2800         	cmp	r0, #0
     54e: d1b1         	bne	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-158
     550: 68f3         	ldr	r3, [r6, #12]
     552: 4620         	mov	r0, r4
     554: 9906         	ldr	r1, [sp, #24]
     556: 9a02         	ldr	r2, [sp, #8]
     558: 4798         	blx	r3
     55a: 2800         	cmp	r0, #0
     55c: d1aa         	bne	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-172
     55e: 2500         	movs	r5, #0
     560: 9904         	ldr	r1, [sp, #16]
     562: 42a9         	cmp	r1, r5
     564: d017         	beq	0x596 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x232> @ imm = #46
     566: 6932         	ldr	r2, [r6, #16]
     568: 4620         	mov	r0, r4
     56a: 990a         	ldr	r1, [sp, #40]
     56c: 4790         	blx	r2
     56e: 9904         	ldr	r1, [sp, #16]
     570: 1c6d         	adds	r5, r5, #1
     572: 2800         	cmp	r0, #0
     574: d0f5         	beq	0x562 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x1fe> @ imm = #-22
     576: 1e68         	subs	r0, r5, #1
     578: e00e         	b	0x598 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x234> @ imm = #28
     57a: 68eb         	ldr	r3, [r5, #12]
     57c: 4630         	mov	r0, r6
     57e: 9906         	ldr	r1, [sp, #24]
     580: 9a02         	ldr	r2, [sp, #8]
     582: 4798         	blx	r3
     584: 2800         	cmp	r0, #0
     586: d195         	bne	0x4b4 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x150> @ imm = #-214
     588: 9801         	ldr	r0, [sp, #4]
     58a: 9908         	ldr	r1, [sp, #32]
     58c: 7008         	strb	r0, [r1]
     58e: 9807         	ldr	r0, [sp, #28]
     590: 9900         	ldr	r1, [sp]
     592: 61c1         	str	r1, [r0, #28]
     594: e002         	b	0x59c <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x238> @ imm = #4
     596: 4608         	mov	r0, r1
     598: 4288         	cmp	r0, r1
     59a: d301         	blo	0x5a0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x23c> @ imm = #2
     59c: 2000         	movs	r0, #0
     59e: e788         	b	0x4b2 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x14e> @ imm = #-240
     5a0: 2001         	movs	r0, #1
     5a2: e786         	b	0x4b2 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt::had6ea584fda2d252+0x14e> @ imm = #-244

000005a4 <$d.10>:
     5a4: 10 27 00 00  	.word	0x00002710
     5a8: 9c ff 00 00  	.word	0x0000ff9c
     5ac: f0 d8 00 00  	.word	0x0000d8f0
     5b0: 7b 14 00 00  	.word	0x0000147b
     5b4: 04 0b 00 00  	.word	0x00000b04
     5b8: ff e0 f5 05  	.word	0x05f5e0ff
     5bc: cc 0b 00 00  	.word	0x00000bcc

000005c0 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca>:
     5c0: b5f0         	push	{r4, r5, r6, r7, lr}
     5c2: af03         	add	r7, sp, #12
     5c4: b081         	sub	sp, #4
     5c6: 461c         	mov	r4, r3
     5c8: 460e         	mov	r6, r1
     5ca: 4605         	mov	r5, r0
     5cc: 2011         	movs	r0, #17
     5ce: 0400         	lsls	r0, r0, #16
     5d0: 4282         	cmp	r2, r0
     5d2: d008         	beq	0x5e6 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca+0x26> @ imm = #16
     5d4: 6933         	ldr	r3, [r6, #16]
     5d6: 4628         	mov	r0, r5
     5d8: 4611         	mov	r1, r2
     5da: 4798         	blx	r3
     5dc: 2800         	cmp	r0, #0
     5de: d002         	beq	0x5e6 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca+0x26> @ imm = #4
     5e0: 2001         	movs	r0, #1
     5e2: b001         	add	sp, #4
     5e4: bdf0         	pop	{r4, r5, r6, r7, pc}
     5e6: 2c00         	cmp	r4, #0
     5e8: d006         	beq	0x5f8 <core::fmt::Formatter::pad_integral::write_prefix::he320a72aeba9a6ca+0x38> @ imm = #12
     5ea: 68f3         	ldr	r3, [r6, #12]
     5ec: 2200         	movs	r2, #0
     5ee: 4628         	mov	r0, r5
     5f0: 4621         	mov	r1, r4
     5f2: 4798         	blx	r3
     5f4: b001         	add	sp, #4
     5f6: bdf0         	pop	{r4, r5, r6, r7, pc}
     5f8: 2000         	movs	r0, #0
     5fa: b001         	add	sp, #4
     5fc: bdf0         	pop	{r4, r5, r6, r7, pc}
     5fe: d4d4         	bmi	0x5aa <$d.10+0x6>       @ imm = #-88

00000600 <core::fmt::write::h151b551c1a01ac04>:
     600: b5f0         	push	{r4, r5, r6, r7, lr}
     602: af03         	add	r7, sp, #12
     604: b08f         	sub	sp, #60
     606: 2320         	movs	r3, #32
     608: ac06         	add	r4, sp, #24
     60a: 2203         	movs	r2, #3
     60c: 9405         	str	r4, [sp, #20]
     60e: 54e2         	strb	r2, [r4, r3]
     610: 930d         	str	r3, [sp, #52]
     612: 2300         	movs	r3, #0
     614: 930c         	str	r3, [sp, #48]
     616: 930a         	str	r3, [sp, #40]
     618: 9308         	str	r3, [sp, #32]
     61a: 4a4e         	ldr	r2, [pc, #312]          @ 0x754 <$d.13>
     61c: 9207         	str	r2, [sp, #28]
     61e: 9006         	str	r0, [sp, #24]
     620: 680d         	ldr	r5, [r1]
     622: 2d00         	cmp	r5, #0
     624: d05d         	beq	0x6e2 <core::fmt::write::h151b551c1a01ac04+0xe2> @ imm = #186
     626: 6848         	ldr	r0, [r1, #4]
     628: 2800         	cmp	r0, #0
     62a: d07e         	beq	0x72a <core::fmt::write::h151b551c1a01ac04+0x12a> @ imm = #252
     62c: 9a05         	ldr	r2, [sp, #20]
     62e: 3220         	adds	r2, #32
     630: 9205         	str	r2, [sp, #20]
     632: 221f         	movs	r2, #31
     634: 06d3         	lsls	r3, r2, #27
     636: 1e42         	subs	r2, r0, #1
     638: 439a         	bics	r2, r3
     63a: 1c52         	adds	r2, r2, #1
     63c: 9200         	str	r2, [sp]
     63e: 0140         	lsls	r0, r0, #5
     640: 9002         	str	r0, [sp, #8]
     642: 9104         	str	r1, [sp, #16]
     644: 688c         	ldr	r4, [r1, #8]
     646: 2600         	movs	r6, #0
     648: 9503         	str	r5, [sp, #12]
     64a: 6862         	ldr	r2, [r4, #4]
     64c: 2a00         	cmp	r2, #0
     64e: d006         	beq	0x65e <core::fmt::write::h151b551c1a01ac04+0x5e> @ imm = #12
     650: 9807         	ldr	r0, [sp, #28]
     652: 68c3         	ldr	r3, [r0, #12]
     654: 6821         	ldr	r1, [r4]
     656: 9806         	ldr	r0, [sp, #24]
     658: 4798         	blx	r3
     65a: 2800         	cmp	r0, #0
     65c: d174         	bne	0x748 <core::fmt::write::h151b551c1a01ac04+0x148> @ imm = #232
     65e: 19aa         	adds	r2, r5, r6
     660: 7f10         	ldrb	r0, [r2, #28]
     662: 9905         	ldr	r1, [sp, #20]
     664: 7008         	strb	r0, [r1]
     666: 6990         	ldr	r0, [r2, #24]
     668: 900d         	str	r0, [sp, #52]
     66a: 6950         	ldr	r0, [r2, #20]
     66c: 900c         	str	r0, [sp, #48]
     66e: 68d0         	ldr	r0, [r2, #12]
     670: 6913         	ldr	r3, [r2, #16]
     672: 9904         	ldr	r1, [sp, #16]
     674: 6909         	ldr	r1, [r1, #16]
     676: 2500         	movs	r5, #0
     678: 2800         	cmp	r0, #0
     67a: d00d         	beq	0x698 <core::fmt::write::h151b551c1a01ac04+0x98> @ imm = #26
     67c: 2801         	cmp	r0, #1
     67e: 4628         	mov	r0, r5
     680: d10b         	bne	0x69a <core::fmt::write::h151b551c1a01ac04+0x9a> @ imm = #22
     682: 00d8         	lsls	r0, r3, #3
     684: 1808         	adds	r0, r1, r0
     686: 9001         	str	r0, [sp, #4]
     688: 6840         	ldr	r0, [r0, #4]
     68a: 4b33         	ldr	r3, [pc, #204]          @ 0x758 <$d.13+0x4>
     68c: 4298         	cmp	r0, r3
     68e: 4628         	mov	r0, r5
     690: d103         	bne	0x69a <core::fmt::write::h151b551c1a01ac04+0x9a> @ imm = #6
     692: 9801         	ldr	r0, [sp, #4]
     694: 6800         	ldr	r0, [r0]
     696: 6803         	ldr	r3, [r0]
     698: 2001         	movs	r0, #1
     69a: 9309         	str	r3, [sp, #36]
     69c: 9008         	str	r0, [sp, #32]
     69e: 6850         	ldr	r0, [r2, #4]
     6a0: 6892         	ldr	r2, [r2, #8]
     6a2: 2800         	cmp	r0, #0
     6a4: d009         	beq	0x6ba <core::fmt::write::h151b551c1a01ac04+0xba> @ imm = #18
     6a6: 2801         	cmp	r0, #1
     6a8: d109         	bne	0x6be <core::fmt::write::h151b551c1a01ac04+0xbe> @ imm = #18
     6aa: 00d0         	lsls	r0, r2, #3
     6ac: 1808         	adds	r0, r1, r0
     6ae: 6842         	ldr	r2, [r0, #4]
     6b0: 4b29         	ldr	r3, [pc, #164]          @ 0x758 <$d.13+0x4>
     6b2: 429a         	cmp	r2, r3
     6b4: d103         	bne	0x6be <core::fmt::write::h151b551c1a01ac04+0xbe> @ imm = #6
     6b6: 6800         	ldr	r0, [r0]
     6b8: 6802         	ldr	r2, [r0]
     6ba: 2501         	movs	r5, #1
     6bc: e7ff         	b	0x6be <core::fmt::write::h151b551c1a01ac04+0xbe> @ imm = #-2
     6be: 920b         	str	r2, [sp, #44]
     6c0: 950a         	str	r5, [sp, #40]
     6c2: 9d03         	ldr	r5, [sp, #12]
     6c4: 59a8         	ldr	r0, [r5, r6]
     6c6: 00c2         	lsls	r2, r0, #3
     6c8: 5888         	ldr	r0, [r1, r2]
     6ca: 1889         	adds	r1, r1, r2
     6cc: 684a         	ldr	r2, [r1, #4]
     6ce: a906         	add	r1, sp, #24
     6d0: 4790         	blx	r2
     6d2: 2800         	cmp	r0, #0
     6d4: d138         	bne	0x748 <core::fmt::write::h151b551c1a01ac04+0x148> @ imm = #112
     6d6: 3620         	adds	r6, #32
     6d8: 3408         	adds	r4, #8
     6da: 9802         	ldr	r0, [sp, #8]
     6dc: 42b0         	cmp	r0, r6
     6de: d1b4         	bne	0x64a <core::fmt::write::h151b551c1a01ac04+0x4a> @ imm = #-152
     6e0: e021         	b	0x726 <core::fmt::write::h151b551c1a01ac04+0x126> @ imm = #66
     6e2: 6948         	ldr	r0, [r1, #20]
     6e4: 2800         	cmp	r0, #0
     6e6: d020         	beq	0x72a <core::fmt::write::h151b551c1a01ac04+0x12a> @ imm = #64
     6e8: 690c         	ldr	r4, [r1, #16]
     6ea: 2207         	movs	r2, #7
     6ec: 0753         	lsls	r3, r2, #29
     6ee: 1e42         	subs	r2, r0, #1
     6f0: 439a         	bics	r2, r3
     6f2: 1c52         	adds	r2, r2, #1
     6f4: 9200         	str	r2, [sp]
     6f6: 00c5         	lsls	r5, r0, #3
     6f8: 9104         	str	r1, [sp, #16]
     6fa: 688e         	ldr	r6, [r1, #8]
     6fc: 6872         	ldr	r2, [r6, #4]
     6fe: 2a00         	cmp	r2, #0
     700: d006         	beq	0x710 <core::fmt::write::h151b551c1a01ac04+0x110> @ imm = #12
     702: 9807         	ldr	r0, [sp, #28]
     704: 68c3         	ldr	r3, [r0, #12]
     706: 6831         	ldr	r1, [r6]
     708: 9806         	ldr	r0, [sp, #24]
     70a: 4798         	blx	r3
     70c: 2800         	cmp	r0, #0
     70e: d11b         	bne	0x748 <core::fmt::write::h151b551c1a01ac04+0x148> @ imm = #54
     710: cc05         	ldm	r4!, {r0, r2}
     712: a906         	add	r1, sp, #24
     714: 3c08         	subs	r4, #8
     716: 4790         	blx	r2
     718: 2800         	cmp	r0, #0
     71a: d115         	bne	0x748 <core::fmt::write::h151b551c1a01ac04+0x148> @ imm = #42
     71c: 3408         	adds	r4, #8
     71e: 3d08         	subs	r5, #8
     720: 3608         	adds	r6, #8
     722: 2d00         	cmp	r5, #0
     724: d1ea         	bne	0x6fc <core::fmt::write::h151b551c1a01ac04+0xfc> @ imm = #-44
     726: 9904         	ldr	r1, [sp, #16]
     728: 9b00         	ldr	r3, [sp]
     72a: 68c8         	ldr	r0, [r1, #12]
     72c: 4283         	cmp	r3, r0
     72e: d20e         	bhs	0x74e <core::fmt::write::h151b551c1a01ac04+0x14e> @ imm = #28
     730: 460a         	mov	r2, r1
     732: 00d8         	lsls	r0, r3, #3
     734: 6892         	ldr	r2, [r2, #8]
     736: 5811         	ldr	r1, [r2, r0]
     738: 1810         	adds	r0, r2, r0
     73a: 6842         	ldr	r2, [r0, #4]
     73c: 9807         	ldr	r0, [sp, #28]
     73e: 68c3         	ldr	r3, [r0, #12]
     740: 9806         	ldr	r0, [sp, #24]
     742: 4798         	blx	r3
     744: 2800         	cmp	r0, #0
     746: d002         	beq	0x74e <core::fmt::write::h151b551c1a01ac04+0x14e> @ imm = #4
     748: 2001         	movs	r0, #1
     74a: b00f         	add	sp, #60
     74c: bdf0         	pop	{r4, r5, r6, r7, pc}
     74e: 2000         	movs	r0, #0
     750: b00f         	add	sp, #60
     752: bdf0         	pop	{r4, r5, r6, r7, pc}

00000754 <$d.13>:
     754: cc 0b 00 00  	.word	0x00000bcc
     758: 61 03 00 00  	.word	0x00000361

0000075c <WWDG>:
     75c: e7fe         	b	0x75c <WWDG>            @ imm = #-4

0000075e <__pre_init>:
     75e: 4770         	bx	lr

00000760 <core::ptr::drop_in_place<&mut cortex_m_semihosting::hio::HostStream>::h655d08a39c91d1ae>:
     760: 4770         	bx	lr

00000762 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603>:
     762: b5f0         	push	{r4, r5, r6, r7, lr}
     764: af03         	add	r7, sp, #12
     766: b085         	sub	sp, #20
     768: 2a00         	cmp	r2, #0
     76a: d033         	beq	0x7d4 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x72> @ imm = #102
     76c: 4615         	mov	r5, r2
     76e: 460c         	mov	r4, r1
     770: 6800         	ldr	r0, [r0]
     772: 6800         	ldr	r0, [r0]
     774: 9001         	str	r0, [sp, #4]
     776: ab02         	add	r3, sp, #8
     778: c307         	stm	r3!, {r0, r1, r2}
     77a: 2005         	movs	r0, #5
     77c: a902         	add	r1, sp, #8
     77e: 9000         	str	r0, [sp]
     780: beab         	bkpt	#171
     782: 4241         	rsbs	r1, r0, #0
     784: 4141         	adcs	r1, r0
     786: 2301         	movs	r3, #1
     788: 4290         	cmp	r0, r2
     78a: 461a         	mov	r2, r3
     78c: d800         	bhi	0x790 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x2e> @ imm = #0
     78e: 2200         	movs	r2, #0
     790: 430a         	orrs	r2, r1
     792: d006         	beq	0x7a2 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x40> @ imm = #12
     794: 2001         	movs	r0, #1
     796: 4048         	eors	r0, r1
     798: b005         	add	sp, #20
     79a: bdf0         	pop	{r4, r5, r6, r7, pc}
     79c: 2e01         	cmp	r6, #1
     79e: 4615         	mov	r5, r2
     7a0: d0f8         	beq	0x794 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x32> @ imm = #-16
     7a2: 4602         	mov	r2, r0
     7a4: 9801         	ldr	r0, [sp, #4]
     7a6: 9002         	str	r0, [sp, #8]
     7a8: 9204         	str	r2, [sp, #16]
     7aa: 1aa8         	subs	r0, r5, r2
     7ac: 1824         	adds	r4, r4, r0
     7ae: 9403         	str	r4, [sp, #12]
     7b0: a902         	add	r1, sp, #8
     7b2: 9800         	ldr	r0, [sp]
     7b4: beab         	bkpt	#171
     7b6: 4241         	rsbs	r1, r0, #0
     7b8: 4141         	adcs	r1, r0
     7ba: 4282         	cmp	r2, r0
     7bc: d304         	blo	0x7c8 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x66> @ imm = #8
     7be: 2500         	movs	r5, #0
     7c0: 2800         	cmp	r0, #0
     7c2: 461e         	mov	r6, r3
     7c4: d0ea         	beq	0x79c <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x3a> @ imm = #-44
     7c6: e003         	b	0x7d0 <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x6e> @ imm = #6
     7c8: 2501         	movs	r5, #1
     7ca: 2800         	cmp	r0, #0
     7cc: 461e         	mov	r6, r3
     7ce: d0e5         	beq	0x79c <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x3a> @ imm = #-54
     7d0: 462e         	mov	r6, r5
     7d2: e7e3         	b	0x79c <<&mut W as core::fmt::Write>::write_str::h98e271708a6b2603+0x3a> @ imm = #-58
     7d4: 2000         	movs	r0, #0
     7d6: b005         	add	sp, #20
     7d8: bdf0         	pop	{r4, r5, r6, r7, pc}

000007da <<&mut W as core::fmt::Write>::write_char::h9d14628470428668>:
     7da: b5f0         	push	{r4, r5, r6, r7, lr}
     7dc: af03         	add	r7, sp, #12
     7de: b084         	sub	sp, #16
     7e0: 6800         	ldr	r0, [r0]
     7e2: 6803         	ldr	r3, [r0]
     7e4: 2000         	movs	r0, #0
     7e6: 9000         	str	r0, [sp]
     7e8: 2980         	cmp	r1, #128
     7ea: d203         	bhs	0x7f4 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x1a> @ imm = #6
     7ec: 4668         	mov	r0, sp
     7ee: 7001         	strb	r1, [r0]
     7f0: 2401         	movs	r4, #1
     7f2: e02f         	b	0x854 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x7a> @ imm = #94
     7f4: 0ac8         	lsrs	r0, r1, #11
     7f6: d10a         	bne	0x80e <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x34> @ imm = #20
     7f8: 203f         	movs	r0, #63
     7fa: 4008         	ands	r0, r1
     7fc: 3080         	adds	r0, #128
     7fe: 466a         	mov	r2, sp
     800: 7050         	strb	r0, [r2, #1]
     802: 0988         	lsrs	r0, r1, #6
     804: 21c0         	movs	r1, #192
     806: 4301         	orrs	r1, r0
     808: 7011         	strb	r1, [r2]
     80a: 2402         	movs	r4, #2
     80c: e022         	b	0x854 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x7a> @ imm = #68
     80e: 0c08         	lsrs	r0, r1, #16
     810: d10e         	bne	0x830 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x56> @ imm = #28
     812: 203f         	movs	r0, #63
     814: 4008         	ands	r0, r1
     816: 3080         	adds	r0, #128
     818: 466a         	mov	r2, sp
     81a: 7090         	strb	r0, [r2, #2]
     81c: 0b08         	lsrs	r0, r1, #12
     81e: 24e0         	movs	r4, #224
     820: 4304         	orrs	r4, r0
     822: 7014         	strb	r4, [r2]
     824: 0508         	lsls	r0, r1, #20
     826: 0e80         	lsrs	r0, r0, #26
     828: 3080         	adds	r0, #128
     82a: 7050         	strb	r0, [r2, #1]
     82c: 2403         	movs	r4, #3
     82e: e011         	b	0x854 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x7a> @ imm = #34
     830: 223f         	movs	r2, #63
     832: 400a         	ands	r2, r1
     834: 3280         	adds	r2, #128
     836: 4668         	mov	r0, sp
     838: 70c2         	strb	r2, [r0, #3]
     83a: 050a         	lsls	r2, r1, #20
     83c: 0e92         	lsrs	r2, r2, #26
     83e: 3280         	adds	r2, #128
     840: 7082         	strb	r2, [r0, #2]
     842: 038a         	lsls	r2, r1, #14
     844: 0e92         	lsrs	r2, r2, #26
     846: 3280         	adds	r2, #128
     848: 7042         	strb	r2, [r0, #1]
     84a: 02c9         	lsls	r1, r1, #11
     84c: 0f49         	lsrs	r1, r1, #29
     84e: 31f0         	adds	r1, #240
     850: 7001         	strb	r1, [r0]
     852: 2404         	movs	r4, #4
     854: 9403         	str	r4, [sp, #12]
     856: 4668         	mov	r0, sp
     858: 9002         	str	r0, [sp, #8]
     85a: 9301         	str	r3, [sp, #4]
     85c: 2205         	movs	r2, #5
     85e: a901         	add	r1, sp, #4
     860: 4610         	mov	r0, r2
     862: beab         	bkpt	#171
     864: 4241         	rsbs	r1, r0, #0
     866: 4141         	adcs	r1, r0
     868: 1e45         	subs	r5, r0, #1
     86a: 42a5         	cmp	r5, r4
     86c: d210         	bhs	0x890 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0xb6> @ imm = #32
     86e: 466d         	mov	r5, sp
     870: 4606         	mov	r6, r0
     872: 9301         	str	r3, [sp, #4]
     874: 9003         	str	r0, [sp, #12]
     876: 1a20         	subs	r0, r4, r0
     878: 182d         	adds	r5, r5, r0
     87a: 9502         	str	r5, [sp, #8]
     87c: a901         	add	r1, sp, #4
     87e: 4610         	mov	r0, r2
     880: beab         	bkpt	#171
     882: 4241         	rsbs	r1, r0, #0
     884: 4141         	adcs	r1, r0
     886: 2800         	cmp	r0, #0
     888: d002         	beq	0x890 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0xb6> @ imm = #4
     88a: 4286         	cmp	r6, r0
     88c: 4634         	mov	r4, r6
     88e: d2ef         	bhs	0x870 <<&mut W as core::fmt::Write>::write_char::h9d14628470428668+0x96> @ imm = #-34
     890: 2001         	movs	r0, #1
     892: 4048         	eors	r0, r1
     894: b004         	add	sp, #16
     896: bdf0         	pop	{r4, r5, r6, r7, pc}

00000898 <<&mut W as core::fmt::Write>::write_fmt::h25aff5505ef532b7>:
     898: b5b0         	push	{r4, r5, r7, lr}
     89a: af02         	add	r7, sp, #8
     89c: b088         	sub	sp, #32
     89e: 6800         	ldr	r0, [r0]
     8a0: 9001         	str	r0, [sp, #4]
     8a2: aa02         	add	r2, sp, #8
     8a4: 4610         	mov	r0, r2
     8a6: c938         	ldm	r1!, {r3, r4, r5}
     8a8: c038         	stm	r0!, {r3, r4, r5}
     8aa: c938         	ldm	r1!, {r3, r4, r5}
     8ac: c038         	stm	r0!, {r3, r4, r5}
     8ae: a801         	add	r0, sp, #4
     8b0: 4611         	mov	r1, r2
     8b2: f7ff fea5    	bl	0x600 <core::fmt::write::h151b551c1a01ac04> @ imm = #-694
     8b6: b008         	add	sp, #32
     8b8: bdb0         	pop	{r4, r5, r7, pc}

000008ba <__cpsid>:
     8ba: b672         	cpsid i
     8bc: 4770         	bx	lr

000008be <__cpsie>:
     8be: b662         	cpsie i
     8c0: 4770         	bx	lr

000008c2 <__primask_r>:
     8c2: f3ef 8010    	mrs	r0, primask
     8c6: 4770         	bx	lr

000008c8 <__aeabi_uidiv>:
     8c8: b580         	push	{r7, lr}
     8ca: af00         	add	r7, sp, #0
     8cc: f000 f801    	bl	0x8d2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33> @ imm = #2
     8d0: bd80         	pop	{r7, pc}

000008d2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33>:
     8d2: b5f0         	push	{r4, r5, r6, r7, lr}
     8d4: af03         	add	r7, sp, #12
     8d6: b083         	sub	sp, #12
     8d8: 4602         	mov	r2, r0
     8da: 4288         	cmp	r0, r1
     8dc: d203         	bhs	0x8e6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x14> @ imm = #6
     8de: 2000         	movs	r0, #0
     8e0: 4611         	mov	r1, r2
     8e2: b003         	add	sp, #12
     8e4: bdf0         	pop	{r4, r5, r6, r7, pc}
     8e6: 0c15         	lsrs	r5, r2, #16
     8e8: 42a9         	cmp	r1, r5
     8ea: 4610         	mov	r0, r2
     8ec: d939         	bls	0x962 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x90> @ imm = #114
     8ee: 0a06         	lsrs	r6, r0, #8
     8f0: 42b1         	cmp	r1, r6
     8f2: d93a         	bls	0x96a <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x98> @ imm = #116
     8f4: 0903         	lsrs	r3, r0, #4
     8f6: 4299         	cmp	r1, r3
     8f8: d93b         	bls	0x972 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xa0> @ imm = #118
     8fa: 9301         	str	r3, [sp, #4]
     8fc: 0883         	lsrs	r3, r0, #2
     8fe: 4299         	cmp	r1, r3
     900: d800         	bhi	0x904 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x32> @ imm = #0
     902: 4618         	mov	r0, r3
     904: 9302         	str	r3, [sp, #8]
     906: 0843         	lsrs	r3, r0, #1
     908: 2401         	movs	r4, #1
     90a: 2000         	movs	r0, #0
     90c: 4299         	cmp	r1, r3
     90e: 4623         	mov	r3, r4
     910: d900         	bls	0x914 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x42> @ imm = #0
     912: 4603         	mov	r3, r0
     914: 42a9         	cmp	r1, r5
     916: 4625         	mov	r5, r4
     918: d900         	bls	0x91c <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x4a> @ imm = #0
     91a: 4605         	mov	r5, r0
     91c: 9300         	str	r3, [sp]
     91e: 012d         	lsls	r5, r5, #4
     920: 42b1         	cmp	r1, r6
     922: 4626         	mov	r6, r4
     924: d900         	bls	0x928 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x56> @ imm = #0
     926: 4606         	mov	r6, r0
     928: 00f3         	lsls	r3, r6, #3
     92a: 195d         	adds	r5, r3, r5
     92c: 9b01         	ldr	r3, [sp, #4]
     92e: 4299         	cmp	r1, r3
     930: 4623         	mov	r3, r4
     932: d900         	bls	0x936 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x64> @ imm = #0
     934: 4603         	mov	r3, r0
     936: 009b         	lsls	r3, r3, #2
     938: 18eb         	adds	r3, r5, r3
     93a: 9d02         	ldr	r5, [sp, #8]
     93c: 42a9         	cmp	r1, r5
     93e: 4625         	mov	r5, r4
     940: d900         	bls	0x944 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x72> @ imm = #0
     942: 4605         	mov	r5, r0
     944: 0068         	lsls	r0, r5, #1
     946: 1818         	adds	r0, r3, r0
     948: 9b00         	ldr	r3, [sp]
     94a: 18c3         	adds	r3, r0, r3
     94c: 409c         	lsls	r4, r3
     94e: 460d         	mov	r5, r1
     950: 409d         	lsls	r5, r3
     952: 1b56         	subs	r6, r2, r5
     954: 428e         	cmp	r6, r1
     956: d212         	bhs	0x97e <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xac> @ imm = #36
     958: 4632         	mov	r2, r6
     95a: 4620         	mov	r0, r4
     95c: 4611         	mov	r1, r2
     95e: b003         	add	sp, #12
     960: bdf0         	pop	{r4, r5, r6, r7, pc}
     962: 4628         	mov	r0, r5
     964: 0a06         	lsrs	r6, r0, #8
     966: 42b1         	cmp	r1, r6
     968: d8c4         	bhi	0x8f4 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x22> @ imm = #-120
     96a: 4630         	mov	r0, r6
     96c: 0903         	lsrs	r3, r0, #4
     96e: 4299         	cmp	r1, r3
     970: d8c3         	bhi	0x8fa <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x28> @ imm = #-122
     972: 4618         	mov	r0, r3
     974: 9301         	str	r3, [sp, #4]
     976: 0883         	lsrs	r3, r0, #2
     978: 4299         	cmp	r1, r3
     97a: d9c2         	bls	0x902 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x30> @ imm = #-124
     97c: e7c2         	b	0x904 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x32> @ imm = #-124
     97e: 2d00         	cmp	r5, #0
     980: d403         	bmi	0x98a <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xb8> @ imm = #6
     982: 4621         	mov	r1, r4
     984: 4620         	mov	r0, r4
     986: 4632         	mov	r2, r6
     988: e015         	b	0x9b6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xe4> @ imm = #42
     98a: 086d         	lsrs	r5, r5, #1
     98c: 1b72         	subs	r2, r6, r5
     98e: 1e5b         	subs	r3, r3, #1
     990: 201f         	movs	r0, #31
     992: 9301         	str	r3, [sp, #4]
     994: 4018         	ands	r0, r3
     996: 9002         	str	r0, [sp, #8]
     998: 2001         	movs	r0, #1
     99a: 9b02         	ldr	r3, [sp, #8]
     99c: 4098         	lsls	r0, r3
     99e: 2a00         	cmp	r2, #0
     9a0: 9002         	str	r0, [sp, #8]
     9a2: da00         	bge	0x9a6 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xd4> @ imm = #0
     9a4: 2000         	movs	r0, #0
     9a6: 2a00         	cmp	r2, #0
     9a8: da00         	bge	0x9ac <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xda> @ imm = #0
     9aa: 4632         	mov	r2, r6
     9ac: 4320         	orrs	r0, r4
     9ae: 428a         	cmp	r2, r1
     9b0: 9902         	ldr	r1, [sp, #8]
     9b2: 9b01         	ldr	r3, [sp, #4]
     9b4: d394         	blo	0x8e0 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0xe> @ imm = #-216
     9b6: 1e49         	subs	r1, r1, #1
     9b8: 2b00         	cmp	r3, #0
     9ba: d010         	beq	0x9de <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x10c> @ imm = #32
     9bc: 2603         	movs	r6, #3
     9be: 401e         	ands	r6, r3
     9c0: 2401         	movs	r4, #1
     9c2: 1b64         	subs	r4, r4, r5
     9c4: 1e5d         	subs	r5, r3, #1
     9c6: 9502         	str	r5, [sp, #8]
     9c8: 2e00         	cmp	r6, #0
     9ca: d00a         	beq	0x9e2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x110> @ imm = #20
     9cc: 0055         	lsls	r5, r2, #1
     9ce: 1962         	adds	r2, r4, r5
     9d0: d400         	bmi	0x9d4 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x102> @ imm = #0
     9d2: 4615         	mov	r5, r2
     9d4: 2e01         	cmp	r6, #1
     9d6: d108         	bne	0x9ea <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x118> @ imm = #16
     9d8: 9e02         	ldr	r6, [sp, #8]
     9da: 4632         	mov	r2, r6
     9dc: e014         	b	0xa08 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x136> @ imm = #40
     9de: 4615         	mov	r5, r2
     9e0: e014         	b	0xa0c <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x13a> @ imm = #40
     9e2: 4615         	mov	r5, r2
     9e4: 461a         	mov	r2, r3
     9e6: 9e02         	ldr	r6, [sp, #8]
     9e8: e00e         	b	0xa08 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x136> @ imm = #28
     9ea: 006d         	lsls	r5, r5, #1
     9ec: 1962         	adds	r2, r4, r5
     9ee: d400         	bmi	0x9f2 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x120> @ imm = #0
     9f0: 4615         	mov	r5, r2
     9f2: 2e02         	cmp	r6, #2
     9f4: d102         	bne	0x9fc <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x12a> @ imm = #4
     9f6: 1e9a         	subs	r2, r3, #2
     9f8: 9e02         	ldr	r6, [sp, #8]
     9fa: e005         	b	0xa08 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x136> @ imm = #10
     9fc: 006d         	lsls	r5, r5, #1
     9fe: 1962         	adds	r2, r4, r5
     a00: 9e02         	ldr	r6, [sp, #8]
     a02: d400         	bmi	0xa06 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x134> @ imm = #0
     a04: 4615         	mov	r5, r2
     a06: 1eda         	subs	r2, r3, #3
     a08: 2e03         	cmp	r6, #3
     a0a: d20a         	bhs	0xa22 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x150> @ imm = #20
     a0c: 221f         	movs	r2, #31
     a0e: 4013         	ands	r3, r2
     a10: 462a         	mov	r2, r5
     a12: 40da         	lsrs	r2, r3
     a14: 4029         	ands	r1, r5
     a16: 4308         	orrs	r0, r1
     a18: 4611         	mov	r1, r2
     a1a: b003         	add	sp, #12
     a1c: bdf0         	pop	{r4, r5, r6, r7, pc}
     a1e: 1f12         	subs	r2, r2, #4
     a20: d0f4         	beq	0xa0c <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x13a> @ imm = #-24
     a22: 006d         	lsls	r5, r5, #1
     a24: 1966         	adds	r6, r4, r5
     a26: d509         	bpl	0xa3c <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x16a> @ imm = #18
     a28: 006d         	lsls	r5, r5, #1
     a2a: 1966         	adds	r6, r4, r5
     a2c: d50a         	bpl	0xa44 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x172> @ imm = #20
     a2e: 006d         	lsls	r5, r5, #1
     a30: 1966         	adds	r6, r4, r5
     a32: d50b         	bpl	0xa4c <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x17a> @ imm = #22
     a34: 006d         	lsls	r5, r5, #1
     a36: 1966         	adds	r6, r4, r5
     a38: d4f1         	bmi	0xa1e <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x14c> @ imm = #-30
     a3a: e00b         	b	0xa54 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x182> @ imm = #22
     a3c: 4635         	mov	r5, r6
     a3e: 006d         	lsls	r5, r5, #1
     a40: 1966         	adds	r6, r4, r5
     a42: d4f4         	bmi	0xa2e <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x15c> @ imm = #-24
     a44: 4635         	mov	r5, r6
     a46: 006d         	lsls	r5, r5, #1
     a48: 1966         	adds	r6, r4, r5
     a4a: d4f3         	bmi	0xa34 <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x162> @ imm = #-26
     a4c: 4635         	mov	r5, r6
     a4e: 006d         	lsls	r5, r5, #1
     a50: 1966         	adds	r6, r4, r5
     a52: d4e4         	bmi	0xa1e <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x14c> @ imm = #-56
     a54: 4635         	mov	r5, r6
     a56: e7e2         	b	0xa1e <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x14c> @ imm = #-60

00000a58 <HardFaultTrampoline>:
     a58: 4670         	mov	r0, lr
     a5a: 2104         	movs	r1, #4
     a5c: 4208         	tst	r0, r1
     a5e: d102         	bne	0xa66 <HardFaultTrampoline+0xe> @ imm = #4
     a60: f3ef 8008    	mrs	r0, msp
     a64: e002         	b	0xa6c <HardFault_>      @ imm = #4
     a66: f3ef 8009    	mrs	r0, psp
     a6a: e7ff         	b	0xa6c <HardFault_>      @ imm = #-2

00000a6c <HardFault_>:
     a6c: e7fe         	b	0xa6c <HardFault_>      @ imm = #-4
     a6e: d4d4         	bmi	0xa1a <compiler_builtins::int::specialized_div_rem::u32_div_rem::hb434f7fcf1efcc33+0x148> @ imm = #-88

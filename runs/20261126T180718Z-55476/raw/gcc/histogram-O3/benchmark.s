	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x1, L1
	add	x1, x0, x1
	.p2align 5,,15
L3:
	ldrb	w3, [x0], 1
	lsl	x3, x3, 2
	ldr	w4, [x2, x3]
	add	w4, w4, 1
	str	w4, [x2, x3]
	cmp	x0, x1
	bne	L3
L1:
	ret
LFE4:
	.cstring
	.align	3
l.str.1:
	.ascii "PASS histogram n=%zu buckets=%d checksum=%llu\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB5:
	sub	sp, sp, #576
LCFI0:
	stp	x29, x30, [sp, 32]
LCFI1:
	add	x29, sp, 32
LCFI2:
	cmp	w0, 1
	ble	L10
	ldr	x0, [x1, 8]
	mov	w2, 10
	mov	x1, 0
	bl	_strtoul
	mov	x2, 16959
	sub	x1, x0, #1
	movk	x2, 0xf, lsl 16
	cmp	x1, x2
	bhi	L24
	stp	x0, x1, [x29, 16]
	bl	_malloc
	mov	x8, x0
	cbz	x0, L12
	movi	v31.4s, 0
	add	x3, x29, 288
	add	x4, x29, 32
	stp	q31, q31, [x4]
	stp	q31, q31, [x3]
	stp	q31, q31, [x4, 32]
	stp	q31, q31, [x3, 32]
	stp	q31, q31, [x4, 64]
	stp	q31, q31, [x3, 64]
	stp	q31, q31, [x4, 96]
	stp	q31, q31, [x3, 96]
	stp	q31, q31, [x4, 128]
	stp	q31, q31, [x3, 128]
	stp	q31, q31, [x4, 160]
	stp	q31, q31, [x3, 160]
	stp	q31, q31, [x4, 192]
	stp	q31, q31, [x3, 192]
	stp	q31, q31, [x4, 224]
	stp	q31, q31, [x3, 224]
	ldp	x9, x1, [x29, 16]
	cmp	x1, 14
	bls	L25
L22:
	adrp	x5, lC3@PAGE
	adrp	x0, lC0@PAGE
	movi	v23.16b, 0x25
	adrp	x1, lC2@PAGE
	movi	v22.16b, 0x3f
	and	x2, x9, 68719476720
	ldr	q29, [x5, #lC3@PAGEOFF]
	adrp	x5, lC4@PAGE
	ldr	q28, [x5, #lC4@PAGEOFF]
	adrp	x5, lC5@PAGE
	ldr	q27, [x5, #lC5@PAGEOFF]
	adrp	x5, lC6@PAGE
	ldr	q26, [x5, #lC6@PAGEOFF]
	adrp	x5, lC7@PAGE
	ldr	q25, [x5, #lC7@PAGEOFF]
	adrp	x5, lC8@PAGE
	ldr	q24, [x5, #lC8@PAGEOFF]
	adrp	x5, lC9@PAGE
	ldr	q21, [x5, #lC9@PAGEOFF]
	ldr	q30, [x1, #lC2@PAGEOFF]
	mov	x1, x8
	ldr	q31, [x0, #lC0@PAGEOFF]
	add	x0, x2, x8
	.p2align 5,,15
L14:
	add	v3.2d, v31.2d, v30.2d
	add	v2.2d, v31.2d, v29.2d
	add	v18.2d, v31.2d, v28.2d
	add	v1.2d, v31.2d, v27.2d
	add	v20.2d, v31.2d, v26.2d
	add	v0.2d, v31.2d, v25.2d
	add	v17.2d, v31.2d, v24.2d
	uzp1	v3.4s, v31.4s, v3.4s
	uzp1	v18.4s, v2.4s, v18.4s
	uzp1	v20.4s, v1.4s, v20.4s
	uzp1	v17.4s, v0.4s, v17.4s
	add	v31.2d, v31.2d, v21.2d
	uzp1	v18.8h, v3.8h, v18.8h
	uzp1	v17.8h, v20.8h, v17.8h
	shrn	v19.8b, v18.8h, 4
	shrn2	v19.16b, v17.8h, 4
	uzp1	v17.16b, v18.16b, v17.16b
	mul	v17.16b, v17.16b, v23.16b
	eor	v17.16b, v19.16b, v17.16b
	and	v17.16b, v17.16b, v22.16b
	str	q17, [x1], 16
	cmp	x0, x1
	bne	L14
	cmp	x9, x2
	beq	L15
L13:
	mov	w0, 37
	add	x5, x2, 1
	umull	x0, w2, w0
	eor	x1, x0, x2, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x2]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 37
	add	x6, x2, 2
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x6, x9
	bcs	L15
	add	x1, x0, 74
	add	x5, x2, 3
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 111
	add	x6, x2, 4
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x9, x6
	bls	L15
	add	x1, x0, 148
	add	x5, x2, 5
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 185
	add	x6, x2, 6
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x6, x9
	bcs	L15
	add	x1, x0, 222
	add	x5, x2, 7
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x5, x9
	bcs	L15
	add	x1, x0, 259
	add	x6, x2, 8
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x9, x6
	bls	L15
	add	x1, x0, 296
	add	x5, x2, 9
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 333
	add	x6, x2, 10
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x9, x6
	bls	L15
	add	x1, x0, 370
	add	x5, x2, 11
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 407
	add	x6, x2, 12
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x9, x6
	bls	L15
	add	x1, x0, 444
	add	x5, x2, 13
	eor	x1, x1, x6, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x6]
	cmp	x9, x5
	bls	L15
	add	x1, x0, 481
	add	x2, x2, 14
	eor	x1, x1, x5, lsr 4
	and	w1, w1, 63
	strb	w1, [x8, x5]
	cmp	x9, x2
	bls	L15
	add	x0, x0, 518
	eor	x0, x0, x2, lsr 4
	and	w0, w0, 63
	strb	w0, [x8, x2]
	.p2align 5,,15
L15:
	mov	x6, x8
	add	x7, x9, x8
	mov	x5, x8
	.p2align 5,,15
L18:
	ldrb	w1, [x5], 1
	lsl	x1, x1, 2
	ldr	w2, [x4, x1]
	add	w2, w2, 1
	str	w2, [x4, x1]
	cmp	x7, x5
	bne	L18
	.p2align 5,,15
L19:
	ldrb	w1, [x6], 1
	lsl	x1, x1, 2
	ldr	w2, [x3, x1]
	add	w2, w2, 1
	str	w2, [x3, x1]
	cmp	x7, x6
	bne	L19
	mov	x5, 0
	mov	x1, 1
	b	L21
	.p2align 2,,3
L20:
	cmp	x1, 65
	beq	L34
L21:
	add	x2, x4, x1, lsl 2
	add	x6, x3, x1, lsl 2
	ldr	w2, [x2, -4]
	ldr	w6, [x6, -4]
	umaddl	x5, w2, w1, x5
	add	x1, x1, 1
	cmp	w2, w6
	beq	L20
	mov	x0, x8
	bl	_free
	mov	w0, 4
L9:
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 576
LCFI3:
	ret
L10:
LCFI4:
	mov	x0, 32768
	bl	_malloc
	mov	x8, x0
	cbz	x0, L12
	movi	v31.4s, 0
	add	x3, x29, 288
	add	x4, x29, 32
	mov	x9, 32768
	stp	q31, q31, [x4]
	stp	q31, q31, [x3]
	stp	q31, q31, [x4, 32]
	stp	q31, q31, [x3, 32]
	stp	q31, q31, [x4, 64]
	stp	q31, q31, [x3, 64]
	stp	q31, q31, [x4, 96]
	stp	q31, q31, [x3, 96]
	stp	q31, q31, [x4, 128]
	stp	q31, q31, [x3, 128]
	stp	q31, q31, [x4, 160]
	stp	q31, q31, [x3, 160]
	stp	q31, q31, [x4, 192]
	stp	q31, q31, [x3, 192]
	stp	q31, q31, [x4, 224]
	stp	q31, q31, [x3, 224]
	b	L22
L24:
	mov	w0, 2
	b	L9
L34:
	mov	w1, 64
	adrp	x0, l.str.1@PAGE
	str	x9, [sp]
	add	x0, x0, l.str.1@PAGEOFF;
	str	x5, [sp, 16]
	str	w1, [sp, 8]
	str	x8, [x29, 24]
	bl	_printf
	ldr	x0, [x29, 24]
	bl	_free
	mov	w0, 0
	b	L9
L25:
	mov	x2, 0
	b	L13
L12:
	mov	w0, 3
	b	L9
LFE5:
	.literal16
	.align	4
lC0:
	.quad	0
	.quad	1
	.align	4
lC2:
	.quad	2
	.quad	2
	.align	4
lC3:
	.quad	4
	.quad	4
	.align	4
lC4:
	.quad	6
	.quad	6
	.align	4
lC5:
	.quad	8
	.quad	8
	.align	4
lC6:
	.quad	10
	.quad	10
	.align	4
lC7:
	.quad	12
	.quad	12
	.align	4
lC8:
	.quad	14
	.quad	14
	.align	4
lC9:
	.quad	16
	.quad	16
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x3
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB4-.
	.set L$set$2,LFE4-LFB4
	.quad L$set$2
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB5-.
	.set L$set$4,LFE5-LFB5
	.quad L$set$4
	.uleb128 0
	.byte	0x4
	.set L$set$5,LCFI0-LFB5
	.long L$set$5
	.byte	0xe
	.uleb128 0x240
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0x9d
	.uleb128 0x44
	.byte	0x9e
	.uleb128 0x43
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x220
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xb
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

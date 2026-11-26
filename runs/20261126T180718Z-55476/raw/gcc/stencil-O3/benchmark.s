	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cmp	x2, 2
	bls	L18
	sub	x14, x2, #2
	add	x4, x0, 4
	stp	x29, x30, [sp, -32]!
LCFI0:
	add	x5, x1, 4
	lsr	x12, x14, 2
	add	x4, x4, x2, lsl 2
	lsl	x15, x2, 1
	add	x5, x5, x2, lsl 2
	lsl	x10, x12, 4
	mov	x13, 0
	lsl	x12, x12, 2
	add	x15, x15, 1
	mov	x11, 0
	sub	x16, x2, #3
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI1:
	.p2align 5,,15
L3:
	add	x30, x2, x13
	cmp	x16, 2
	bls	L11
	mov	x17, x12
L9:
	sub	x9, x4, x2, lsl 2
	sub	x8, x4, #4
	add	x7, x4, 4
	add	x6, x4, x2, lsl 2
	mov	x3, 0
	.p2align 5,,15
L7:
	ldr	q2, [x9, x3]
	ldr	q1, [x4, x3]
	ldr	q0, [x6, x3]
	ldr	q30, [x8, x3]
	add	v1.4s, v2.4s, v1.4s
	ldr	q31, [x7, x3]
	add	v0.4s, v1.4s, v0.4s
	add	v30.4s, v0.4s, v30.4s
	add	v31.4s, v30.4s, v31.4s
	str	q31, [x5, x3]
	add	x3, x3, 16
	cmp	x3, x10
	bne	L7
	cmp	x14, x12
	beq	L4
	mov	x4, x13
	add	x3, x12, 1
	mov	x13, x30
L10:
	sub	x7, x2, x17
	cmp	x7, 3
	beq	L5
	add	x8, x17, x30
	add	x19, x4, x17
	add	x9, x8, 1
	add	x19, x0, x19, lsl 2
	add	x4, x4, x15
	lsl	x9, x9, 2
	add	x4, x4, x17
	lsl	x4, x4, 2
	lsl	x8, x8, 2
	ldr	d4, [x0, x9]
	add	x17, x0, x8
	sub	x7, x7, #2
	and	x20, x7, -2
	ldr	d5, [x19, 4]
	ldr	d3, [x0, x4]
	ldr	d28, [x0, x8]
	add	v4.2s, v5.2s, v4.2s
	ldr	d29, [x17, 8]
	add	v3.2s, v4.2s, v3.2s
	add	v28.2s, v3.2s, v28.2s
	add	v29.2s, v28.2s, v29.2s
	str	d29, [x1, x9]
	tbz	x7, 0, L6
	add	x3, x3, x20
L5:
	add	x3, x3, x30
	lsl	x7, x3, 2
	sub	x4, x3, x2
	ldr	w8, [x0, x7]
	add	x17, x2, x3
	sub	x9, x3, #1
	add	x3, x3, 1
	ldr	w4, [x0, x4, lsl 2]
	ldr	w17, [x0, x17, lsl 2]
	ldr	w9, [x0, x9, lsl 2]
	add	w4, w4, w8
	ldr	w8, [x0, x3, lsl 2]
	add	w3, w4, w17
	add	w3, w3, w9
	add	w3, w3, w8
	str	w3, [x1, x7]
L6:
	add	x11, x11, 1
	add	x5, x5, x2, lsl 2
	mov	x4, x6
	cmp	x14, x11
	bne	L3
L1:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
LCFI2:
	ret
	.p2align 2,,3
L4:
LCFI3:
	add	x11, x11, 1
	cmp	x14, x11
	beq	L1
	mov	x13, x30
	add	x5, x5, x2, lsl 2
	mov	x4, x6
	add	x30, x2, x30
	b	L9
	.p2align 2,,3
L11:
	add	x6, x4, x2, lsl 2
	mov	x17, 0
	mov	x4, x13
	mov	x3, 1
	mov	x13, x30
	b	L10
L18:
LCFI4:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS stencil side=%zu checksum=%lld\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB5:
	sub	sp, sp, #64
LCFI5:
	stp	x29, x30, [sp, 16]
LCFI6:
	add	x29, sp, 16
LCFI7:
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
LCFI8:
	cmp	w0, 1
	ble	L55
	mov	w2, 10
	ldr	x0, [x1, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x20, x0
	sub	x0, x0, #3
	cmp	x0, 1021
	bhi	L75
L23:
	umull	x22, w20, w20
	ubfiz	x0, x22, 2, 32
	bl	_malloc
	mov	x19, x0
	mov	x1, 4
	mov	x0, x22
	bl	_calloc
	cmp	x19, 0
	mov	x1, 0
	ccmp	x0, 0, 4, ne
	mov	x21, x0
	beq	L68
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	.p2align 5,,15
L25:
	umulh	x3, x1, x0
	lsr	x3, x3, 2
	add	x2, x3, x3, lsl 1
	add	x2, x3, x2, lsl 2
	sub	x2, x1, x2
	str	w2, [x19, x1, lsl 2]
	add	x1, x1, 1
	cmp	x1, x22
	bne	L25
	ubfiz	x9, x20, 2, 32
	sub	x13, x20, #2
	ubfx	x11, x13, 2, 32
	add	x2, x19, x9
	add	x3, x21, x9
	lsl	x8, x11, 4
	mov	x12, 0
	mov	w10, 0
	add	x2, x2, 4
	add	x3, x3, 4
	lsl	x11, x11, 2
	sub	w14, w20, #2
	sub	x16, x20, #3
	mov	x15, 1
	add	x15, x15, w20, uxtw 1
	.p2align 5,,15
L34:
	add	x17, x20, x12
	cmp	x16, 2
	bls	L58
	mov	x30, x11
L33:
	sub	x7, x2, x9
	add	x4, x2, x9
	mov	x1, 0
	sub	x6, x2, #4
	add	x5, x2, 4
	.p2align 5,,15
L30:
	ldr	q2, [x2, x1]
	ldr	q1, [x7, x1]
	ldr	q0, [x4, x1]
	ldr	q30, [x6, x1]
	add	v1.4s, v2.4s, v1.4s
	ldr	q31, [x5, x1]
	add	v0.4s, v1.4s, v0.4s
	add	v30.4s, v0.4s, v30.4s
	add	v31.4s, v30.4s, v31.4s
	str	q31, [x3, x1]
	add	x1, x1, 16
	cmp	x8, x1
	bne	L30
	cmp	x11, x13
	beq	L27
	mov	x1, x12
	add	x2, x11, 1
	mov	x12, x17
L37:
	sub	x0, x20, x30
	cmp	x0, 3
	beq	L28
	add	x5, x30, x17
	add	x6, x1, 1
	add	w7, w5, 1
	add	w6, w6, w30
	lsl	x7, x7, 2
	lsl	x6, x6, 2
	add	x1, x30, x1
	ubfiz	x5, x5, 2, 32
	ldr	d5, [x19, x6]
	add	w1, w1, w15
	add	x30, x19, x5
	lsl	x1, x1, 2
	sub	x0, x0, #2
	ldr	d4, [x19, x7]
	and	x6, x0, -2
	ldr	d3, [x19, x1]
	ldr	d28, [x19, x5]
	add	v4.2s, v5.2s, v4.2s
	ldr	d29, [x30, 8]
	add	v3.2s, v4.2s, v3.2s
	add	v28.2s, v3.2s, v28.2s
	add	v29.2s, v28.2s, v29.2s
	str	d29, [x21, x7]
	tbz	x0, 0, L29
	add	x2, x2, x6
L28:
	add	x0, x17, x2
	add	w2, w17, w2
	lsl	x2, x2, 2
	sub	x17, x0, x20
	add	w6, w20, w0
	sub	w5, w0, #1
	ldr	w7, [x19, x2]
	add	w1, w0, 1
	ldr	w0, [x19, x17, lsl 2]
	ldr	w6, [x19, x6, lsl 2]
	ldr	w5, [x19, x5, lsl 2]
	add	w0, w0, w7
	ldr	w1, [x19, x1, lsl 2]
	add	w0, w0, w6
	add	w0, w0, w5
	add	w0, w0, w1
	str	w0, [x21, x2]
L29:
	add	w10, w10, 1
	mov	x2, x4
	add	x3, x3, x9
	cmp	w14, w10
	bne	L34
L32:
	sub	x0, x20, #1
	cmp	x0, 6
	bls	L76
	movi	v29.4s, 0
	mov	x0, 0
	and	x2, x20, 17179869180
	b	L47
	.p2align 2,,3
L45:
	add	x0, x0, 4
	saddw2	v29.2d, v28.2d, v30.4s
	cmp	x2, x0
	beq	L77
L47:
	ubfiz	x1, x0, 2, 32
	ldr	q30, [x21, x1]
	cmtst	v31.4s, v30.4s, v30.4s
	saddw	v28.2d, v29.2d, v30.2s
	umaxp	v31.4s, v31.4s, v31.4s
	fmov	x1, d31
	cbz	x1, L45
	addp	d31, v29.2d
	mov	x2, x0
	fmov	x8, d31
L46:
	ldr	w0, [x21, w2, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 1
	cmp	x20, x0
	bls	L48
L53:
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 2
	cmp	x20, x0
	bls	L48
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 3
	cmp	x20, x0
	bls	L48
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 4
	cmp	x0, x20
	bcs	L48
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 5
	cmp	x20, x0
	bls	L48
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x0, x2, 6
	cmp	x20, x0
	bls	L48
	ldr	w0, [x21, w0, uxtw 2]
	cbnz	w0, L40
	add	x2, x2, 7
	cmp	x20, x2
	bls	L48
	ldr	w0, [x21, w2, uxtw 2]
	cbnz	w0, L40
L48:
	mov	x9, 20165
	mov	x13, 1
	movk	x9, 0xc4ec, lsl 16
	mov	x12, 0
	movk	x9, 0xec4e, lsl 32
	movk	x9, 0x4ec4, lsl 48
	.p2align 5,,15
L74:
	mov	x14, x12
	add	x13, x13, 1
	add	x12, x20, x12
	cmp	x20, x13
	cset	w3, hi
	mov	x1, 0
	mov	x0, x12
	b	L43
	.p2align 2,,3
L38:
	ldr	w22, [x21, x0, lsl 2]
	add	x1, x1, 1
	add	x0, x0, 1
	cbnz	w22, L40
	cmp	x1, x20
	beq	L78
L43:
	cmp	x1, 0
	ccmp	w3, 0, 4, ne
	beq	L38
L54:
	umulh	x3, x0, x9
	add	x2, x14, x1
	add	x5, x0, 1
	add	x1, x1, 1
	add	x4, x20, x0
	umulh	x7, x2, x9
	sub	x15, x0, #1
	umulh	x6, x5, x9
	lsr	x3, x3, 2
	cmp	x20, x1
	bls	L39
	lsr	x7, x7, 2
	umulh	x10, x15, x9
	lsr	x6, x6, 2
	add	x22, x7, x7, lsl 1
	ldr	w16, [x21, x0, lsl 2]
	umulh	x11, x4, x9
	add	x17, x3, x3, lsl 1
	lsr	x10, x10, 2
	add	x7, x7, x22, lsl 2
	add	x3, x3, x17, lsl 2
	lsr	x11, x11, 2
	add	x22, x6, x6, lsl 1
	sub	x2, x2, x7
	add	x17, x11, x11, lsl 1
	sub	x3, x0, x3
	mov	x0, x5
	add	x7, x10, x10, lsl 1
	add	w2, w2, w3
	add	x22, x6, x22, lsl 2
	add	x3, x11, x17, lsl 2
	add	x6, x10, x7, lsl 2
	sub	x5, x5, x22
	sub	x3, x4, x3
	add	w2, w2, w5
	sub	x15, x15, x6
	add	w3, w3, w15
	add	w2, w2, w3
	add	x8, x8, w2, sxtw
	cmp	w2, w16
	beq	L54
	.p2align 5,,15
L40:
	mov	x0, x19
	mov	w22, 4
	bl	_free
	mov	x0, x21
	bl	_free
L22:
	mov	w0, w22
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
LCFI9:
	ret
	.p2align 2,,3
L27:
LCFI10:
	add	w10, w10, 1
	cmp	w10, w14
	beq	L32
	mov	x12, x17
	mov	x2, x4
	add	x3, x3, x9
	add	x17, x20, x17
	b	L33
	.p2align 2,,3
L58:
	mov	x1, x12
	add	x4, x2, x9
	mov	x30, 0
	mov	x12, x17
	mov	x2, 1
	b	L37
L55:
	mov	x20, 256
	b	L23
L75:
	mov	w22, 2
	b	L22
	.p2align 2,,3
L39:
	ldr	w0, [x21, w0, uxtw 2]
	cbz	w0, L74
	b	L40
L78:
	cmp	x20, x13
	bne	L74
	adrp	x0, l.str.0@PAGE
	stp	x1, x8, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	mov	x0, x19
	bl	_free
	mov	x0, x21
	bl	_free
	b	L22
L76:
	ldr	w0, [x21]
	cbnz	w0, L40
	mov	x8, 0
	mov	x2, 0
	mov	x0, 1
	b	L53
L68:
	mov	x0, x19
	mov	w22, 3
	bl	_free
	mov	x0, x21
	bl	_free
	b	L22
L77:
	addp	d31, v29.2d
	fmov	x8, d31
	cmp	x20, x2
	bne	L46
	b	L48
LFE5:
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
	.byte	0x4
	.set L$set$3,LCFI0-LFB4
	.long L$set$3
	.byte	0xe
	.uleb128 0x20
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0x93
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x1
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xa
	.byte	0xde
	.byte	0xdd
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xb
	.byte	0x4
	.set L$set$7,LCFI4-LCFI3
	.long L$set$7
	.byte	0xe
	.uleb128 0
	.byte	0xd3
	.byte	0xd4
	.byte	0xdd
	.byte	0xde
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$8,LEFDE3-LASFDE3
	.long L$set$8
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB5-.
	.set L$set$9,LFE5-LFB5
	.quad L$set$9
	.uleb128 0
	.byte	0x4
	.set L$set$10,LCFI5-LFB5
	.long L$set$10
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x30
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0x93
	.uleb128 0x4
	.byte	0x94
	.uleb128 0x3
	.byte	0x95
	.uleb128 0x2
	.byte	0x96
	.uleb128 0x1
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0xa
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xb
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x2, L1
	sub	x3, x2, #1
	cmp	x3, 2
	mov	x3, 0
	bls	L3
	movi	v31.4s, 0x32
	movi	v30.4s, 0x3
	lsr	x5, x2, 2
	lsl	x4, x5, 4
	.p2align 5,,15
L4:
	ldr	q29, [x0, x3]
	cmgt	v28.4s, v29.4s, v31.4s
	add	v27.4s, v29.4s, v29.4s
	add	v29.4s, v29.4s, v30.4s
	bit	v29.16b, v27.16b, v28.16b
	str	q29, [x1, x3]
	add	x3, x3, 16
	cmp	x3, x4
	bne	L4
	lsl	x3, x5, 2
	cmp	x2, x3
	beq	L1
L3:
	lsl	x5, x3, 2
	ldr	w4, [x0, x5]
	cmp	w4, 51
	lsl	w7, w4, 1
	add	w4, w4, 3
	csel	w4, w4, w7, lt
	str	w4, [x1, x5]
	add	x4, x3, 1
	cmp	x2, x4
	bls	L1
	add	x6, x5, 4
	add	x3, x3, 2
	ldr	w4, [x0, x6]
	cmp	w4, 51
	lsl	w7, w4, 1
	add	w4, w4, 3
	csel	w4, w4, w7, lt
	str	w4, [x1, x6]
	cmp	x2, x3
	bls	L1
	add	x5, x5, 8
	ldr	w0, [x0, x5]
	cmp	w0, 50
	add	w2, w0, 3
	lsl	w0, w0, 1
	csel	w0, w0, w2, gt
	str	w0, [x1, x5]
L1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS conditional n=%zu checksum=%lld\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB5:
	sub	sp, sp, #64
LCFI0:
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
LCFI2:
	stp	x19, x20, [sp, 32]
LCFI3:
	cmp	w0, 1
	ble	L35
	mov	w2, 10
	ldr	x0, [x1, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x1, 16959
	mov	x20, x0
	movk	x1, 0xf, lsl 16
	sub	x0, x0, #1
	cmp	x0, x1
	bhi	L44
L19:
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	mov	x19, x0
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	cmp	x19, 0
	mov	x6, x0
	ccmp	x0, 0, 4, ne
	beq	L37
	mov	x2, 0
	mov	x0, 101
	.p2align 5,,15
L21:
	udiv	x3, x2, x0
	mov	x8, x2
	add	x1, x3, x3, lsl 2
	add	x1, x1, x1, lsl 2
	add	x1, x3, x1, lsl 2
	sub	x1, x2, x1
	str	w1, [x19, x2, lsl 2]
	add	x2, x2, 1
	cmp	x20, x2
	bne	L21
	cmp	x8, 2
	bls	L38
	movi	v31.4s, 0x32
	movi	v30.4s, 0x3
	ubfx	x3, x2, 2, 32
	mov	x1, 0
	lsl	x0, x3, 4
	.p2align 5,,15
L23:
	ldr	q29, [x19, x1]
	cmgt	v28.4s, v29.4s, v31.4s
	add	v27.4s, v29.4s, v29.4s
	add	v29.4s, v29.4s, v30.4s
	bit	v29.16b, v27.16b, v28.16b
	str	q29, [x6, x1]
	add	x1, x1, 16
	cmp	x0, x1
	bne	L23
	lsl	x0, x3, 2
	cmp	x2, x0
	beq	L24
L22:
	ubfiz	x3, x0, 2, 32
	ldr	w1, [x19, x3]
	cmp	w1, 51
	lsl	w5, w1, 1
	add	w1, w1, 3
	csel	w1, w1, w5, lt
	str	w1, [x6, x3]
	add	x1, x0, 1
	cmp	x2, x1
	bls	L24
	add	x4, x3, 4
	add	x0, x0, 2
	ldr	w1, [x19, x4]
	cmp	w1, 51
	lsl	w5, w1, 1
	add	w1, w1, 3
	csel	w1, w1, w5, lt
	str	w1, [x6, x4]
	cmp	x2, x0
	bls	L24
	add	x3, x3, 8
	ldr	w0, [x19, x3]
	cmp	w0, 50
	add	w1, w0, 3
	lsl	w0, w0, 1
	csel	w0, w0, w1, gt
	str	w0, [x6, x3]
L24:
	mov	x4, 0
	mov	x7, 0
	mov	x9, 101
	b	L34
	.p2align 2,,3
L40:
	add	x4, x4, 1
L34:
	udiv	x3, x4, x9
	ldr	w5, [x6, x4, lsl 2]
	add	x7, x7, w5, sxtw
	add	x1, x3, x3, lsl 2
	add	x1, x1, x1, lsl 2
	add	x1, x3, x1, lsl 2
	sub	x1, x4, x1
	cmp	x1, 51
	lsl	w0, w1, 1
	add	w1, w1, 3
	csel	w1, w1, w0, cc
	cmp	w5, w1
	bne	L39
	cmp	x8, x4
	bne	L40
	adrp	x0, l.str.0@PAGE
	stp	x2, x7, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	str	x6, [x29, 40]
	bl	_printf
	mov	x0, x19
	bl	_free
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 0
L18:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 64
LCFI4:
	ret
L39:
LCFI5:
	mov	w0, 4
	b	L18
L35:
	mov	x20, 32768
	b	L19
L44:
	mov	w0, 2
	b	L18
L38:
	mov	x0, 0
	b	L22
L37:
	mov	w0, 3
	b	L18
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
	.uleb128 0x40
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x30
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x93
	.uleb128 0x4
	.byte	0x94
	.uleb128 0x3
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xa
	.byte	0xd3
	.byte	0xd4
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xb
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

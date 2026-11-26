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
	bls	L9
	movi	v31.4s, 0x32
	movi	v30.4s, 0x3
	lsr	x4, x2, 2
	lsl	x5, x4, 4
	mov	x3, 0
	.p2align 5,,15
L4:
	ldr	q29, [x0, x3]
	cmgt	v28.4s, v29.4s, v31.4s
	add	v27.4s, v29.4s, v29.4s
	add	v29.4s, v29.4s, v30.4s
	bit	v29.16b, v27.16b, v28.16b
	str	q29, [x1, x3]
	add	x3, x3, 16
	cmp	x5, x3
	bne	L4
	lsl	x3, x4, 2
	cmp	x2, x3
	beq	L1
L7:
	ldr	w5, [x0, x3, lsl 2]
	add	w6, w5, 3
	lsl	w4, w5, 1
	cmp	w5, 50
	csel	w4, w4, w6, gt
	str	w4, [x1, x3, lsl 2]
	add	x3, x3, 1
	cmp	x2, x3
	bhi	L7
L1:
	ret
L9:
	mov	x3, 0
	b	L7
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
	cmp	w0, 1
LCFI3:
	ble	L30
	mov	x3, x1
	mov	w2, 10
	ldr	x0, [x3, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x20, x0
	sub	x1, x0, #1
	mov	x0, 16959
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bhi	L41
	str	x21, [x29, 32]
LCFI4:
L17:
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	mov	x19, x0
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	cmp	x19, 0
	mov	x21, x0
	ccmp	x0, 0, 4, ne
	beq	L32
	mov	x2, 0
	mov	x0, 101
	.p2align 5,,15
L19:
	udiv	x3, x2, x0
	mov	x7, x2
	add	x1, x3, x3, lsl 2
	add	x1, x1, x1, lsl 2
	add	x1, x3, x1, lsl 2
	sub	x1, x2, x1
	str	w1, [x19, x2, lsl 2]
	add	x2, x2, 1
	cmp	x20, x2
	bne	L19
	cmp	x7, 2
	bls	L33
	movi	v31.4s, 0x32
	movi	v30.4s, 0x3
	ubfx	x0, x2, 2, 32
	lsl	x3, x0, 4
	mov	x1, 0
	.p2align 5,,15
L21:
	ldr	q29, [x19, x1]
	cmgt	v28.4s, v29.4s, v31.4s
	add	v27.4s, v29.4s, v29.4s
	add	v29.4s, v29.4s, v30.4s
	bit	v29.16b, v27.16b, v28.16b
	str	q29, [x21, x1]
	add	x1, x1, 16
	cmp	x3, x1
	bne	L21
	lsl	x0, x0, 2
	cmp	x2, x0
	beq	L22
L25:
	ldr	w3, [x19, x0, lsl 2]
	add	w4, w3, 3
	lsl	w1, w3, 1
	cmp	w3, 50
	csel	w1, w1, w4, gt
	str	w1, [x21, x0, lsl 2]
	add	x0, x0, 1
	cmp	x2, x0
	bhi	L25
L22:
	mov	x3, 0
	mov	x0, 0
	mov	x8, 101
	b	L29
	.p2align 2,,3
L35:
	add	x3, x3, 1
L29:
	udiv	x4, x3, x8
	add	x1, x4, x4, lsl 2
	add	x1, x1, x1, lsl 2
	add	x1, x4, x1, lsl 2
	sub	x1, x3, x1
	add	w4, w1, 3
	lsl	w6, w1, 1
	cmp	x1, 51
	csel	w1, w4, w6, cc
	ldr	w4, [x21, x3, lsl 2]
	cmp	w4, w1
	bne	L34
	add	x0, x0, w4, sxtw
	cmp	x7, x3
	bne	L35
	stp	x2, x0, [sp]
	adrp	x0, l.str.0@PAGE
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	mov	x0, x19
	bl	_free
	mov	x0, x21
	bl	_free
	ldr	x21, [x29, 32]
LCFI5:
	mov	w0, 0
L16:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 64
LCFI6:
	ret
L34:
LCFI7:
	ldr	x21, [x29, 32]
LCFI8:
	mov	w0, 4
	b	L16
L30:
	mov	x20, 32768
	str	x21, [x29, 32]
LCFI9:
	b	L17
L41:
LCFI10:
	mov	w0, 2
	b	L16
L33:
LCFI11:
	mov	x0, 0
	b	L25
L32:
	ldr	x21, [x29, 32]
LCFI12:
	mov	w0, 3
	b	L16
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
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xd5
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0xd3
	.byte	0xd4
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x30
	.byte	0x93
	.uleb128 0x4
	.byte	0x94
	.uleb128 0x3
	.byte	0x95
	.uleb128 0x2
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xd5
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xd5
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xd5
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x3, L1
	sub	x4, x3, #1
	cmp	x4, 2
	mov	x4, 0
	bls	L3
	lsr	x6, x3, 2
	lsl	x5, x6, 4
	.p2align 5,,15
L4:
	ldr	q31, [x0, x4]
	ldr	q30, [x1, x4]
	add	v30.4s, v31.4s, v30.4s
	str	q30, [x2, x4]
	add	x4, x4, 16
	cmp	x5, x4
	bne	L4
	lsl	x4, x6, 2
	cmp	x3, x4
	beq	L1
L3:
	lsl	x5, x4, 2
	add	x6, x4, 1
	ldr	w7, [x0, x5]
	ldr	w8, [x1, x5]
	add	w7, w7, w8
	str	w7, [x2, x5]
	cmp	x3, x6
	bls	L1
	add	x6, x5, 4
	add	x4, x4, 2
	ldr	w7, [x0, x6]
	ldr	w8, [x1, x6]
	add	w7, w7, w8
	str	w7, [x2, x6]
	cmp	x3, x4
	bls	L1
	add	x5, x5, 8
	ldr	w1, [x1, x5]
	ldr	w0, [x0, x5]
	add	w1, w1, w0
	str	w1, [x2, x5]
L1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS vector_add n=%zu checksum=%lld\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB5:
	sub	sp, sp, #80
LCFI0:
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
LCFI2:
	str	x21, [sp, 48]
	cmp	w0, 1
LCFI3:
	ble	L19
	ldr	x0, [x1, 8]
	mov	w2, 10
	mov	x1, 0
	bl	_strtoul
	mov	x1, 16959
	mov	x21, x0
	movk	x1, 0xf, lsl 16
	sub	x0, x0, #1
	cmp	x0, x1
	bhi	L29
	stp	x19, x20, [x29, 16]
LCFI4:
L12:
	ubfiz	x0, x21, 2, 32
	bl	_malloc
	mov	x20, x0
	ubfiz	x0, x21, 2, 32
	bl	_malloc
	mov	x19, x0
	ubfiz	x0, x21, 2, 32
	bl	_malloc
	cmp	x20, 0
	mov	x7, x0
	ccmp	x19, 0, 4, ne
	ccmp	x0, 0, 4, ne
	beq	L21
	mov	x1, 0
	mov	x5, 97
	mov	x0, 31
	.p2align 5,,15
L14:
	udiv	x2, x1, x5
	mov	x9, x1
	udiv	x4, x1, x0
	add	x3, x2, x2, lsl 1
	add	x3, x2, x3, lsl 5
	lsl	x2, x4, 5
	sub	x3, x1, x3
	sub	x2, x2, x4
	sub	x2, x1, x2
	str	w3, [x20, x1, lsl 2]
	str	w2, [x19, x1, lsl 2]
	add	x1, x1, 1
	cmp	x21, x1
	bne	L14
	cmp	x9, 2
	bls	L22
	ubfx	x3, x1, 2, 32
	mov	x2, 0
	lsl	x0, x3, 4
	.p2align 5,,15
L16:
	ldr	q31, [x20, x2]
	ldr	q30, [x19, x2]
	add	v30.4s, v31.4s, v30.4s
	str	q30, [x7, x2]
	add	x2, x2, 16
	cmp	x0, x2
	bne	L16
	lsl	x0, x3, 2
	cmp	x1, x0
	beq	L17
L15:
	ubfiz	x2, x0, 2, 32
	add	x3, x0, 1
	ldr	w4, [x20, x2]
	ldr	w5, [x19, x2]
	add	w4, w4, w5
	str	w4, [x7, x2]
	cmp	x1, x3
	bls	L17
	add	x3, x2, 4
	add	x0, x0, 2
	ldr	w4, [x20, x3]
	ldr	w5, [x19, x3]
	add	w4, w4, w5
	str	w4, [x7, x3]
	cmp	x1, x0
	bls	L17
	add	x2, x2, 8
	ldr	w0, [x19, x2]
	ldr	w3, [x20, x2]
	add	w0, w0, w3
	str	w0, [x7, x2]
L17:
	mov	x3, 0
	mov	x8, 0
	mov	x10, 97
	mov	x0, 31
	b	L18
	.p2align 2,,3
L24:
	add	x3, x3, 1
L18:
	udiv	x4, x3, x10
	ldr	w5, [x7, x3, lsl 2]
	add	x8, x8, w5, sxtw
	udiv	x6, x3, x0
	add	x2, x4, x4, lsl 1
	add	x2, x4, x2, lsl 5
	lsl	x4, x6, 5
	sub	x2, x3, x2
	sub	x4, x4, x6
	sub	x4, x3, x4
	add	w2, w2, w4
	cmp	w5, w2
	bne	L23
	cmp	x9, x3
	bne	L24
	adrp	x0, l.str.0@PAGE
	stp	x1, x8, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	str	x7, [x29, 56]
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	ldr	x0, [x29, 56]
	bl	_free
	ldp	x19, x20, [x29, 16]
LCFI5:
	mov	w0, 0
L11:
	ldp	x29, x30, [sp, 16]
	ldr	x21, [sp, 48]
	add	sp, sp, 80
LCFI6:
	ret
L23:
LCFI7:
	ldp	x19, x20, [x29, 16]
LCFI8:
	mov	w0, 4
	b	L11
L19:
	mov	x21, 32768
	stp	x19, x20, [x29, 16]
LCFI9:
	b	L12
L29:
LCFI10:
	mov	w0, 2
	b	L11
L22:
LCFI11:
	mov	x0, 0
	b	L15
L21:
	ldp	x19, x20, [x29, 16]
LCFI12:
	mov	w0, 3
	b	L11
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
	.uleb128 0x50
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x40
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x95
	.uleb128 0x4
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0x94
	.uleb128 0x5
	.byte	0x93
	.uleb128 0x6
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xd4
	.byte	0xd3
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0xd5
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
	.uleb128 0x40
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x95
	.uleb128 0x4
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xd4
	.byte	0xd3
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0x94
	.uleb128 0x5
	.byte	0x93
	.uleb128 0x6
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xd3
	.byte	0xd4
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xd4
	.byte	0xd3
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

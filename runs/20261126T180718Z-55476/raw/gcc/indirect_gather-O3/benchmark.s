	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x3, L1
	mov	x5, 0
	.p2align 5,,15
L3:
	ldr	x4, [x1, x5, lsl 3]
	ldr	w4, [x0, x4, lsl 2]
	add	w4, w4, w4, lsl 1
	add	w4, w4, 1
	str	w4, [x2, x5, lsl 2]
	add	x5, x5, 1
	cmp	x3, x5
	bne	L3
L1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS indirect_gather n=%zu checksum=%lld\12\0"
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
	ble	L16
	mov	w2, 10
	ldr	x0, [x1, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x1, 16959
	mov	x20, x0
	movk	x1, 0xf, lsl 16
	sub	x0, x0, #1
	cmp	x0, x1
	bhi	L24
	stp	x21, x22, [x29, 32]
LCFI4:
L10:
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	mov	x22, x0
	ubfiz	x0, x20, 3, 32
	bl	_malloc
	mov	x19, x0
	ubfiz	x0, x20, 2, 32
	bl	_malloc
	cmp	x22, 0
	mov	x21, x0
	ccmp	x19, 0, 4, ne
	ccmp	x0, 0, 4, ne
	beq	L25
	mov	x0, 0
	mov	x2, 0
	mov	x7, 101
	.p2align 5,,15
L12:
	udiv	x4, x2, x7
	mov	x6, x2
	eor	x5, x0, x2, lsr 3
	add	x0, x0, 73
	udiv	x3, x5, x20
	add	x1, x4, x4, lsl 2
	add	x1, x1, x1, lsl 2
	add	x1, x4, x1, lsl 2
	msub	x3, x3, x20, x5
	sub	x1, x2, x1
	str	w1, [x22, x2, lsl 2]
	str	x3, [x19, x2, lsl 3]
	add	x2, x2, 1
	cmp	x20, x2
	bne	L12
	mov	x3, 0
	mov	x4, x2
	.p2align 5,,15
L13:
	ldr	x0, [x19, x3, lsl 3]
	ldr	w1, [x22, x0, lsl 2]
	add	w1, w1, w1, lsl 1
	add	w1, w1, 1
	str	w1, [x21, x3, lsl 2]
	add	x3, x3, 1
	cmp	x4, x3
	bne	L13
	mov	x4, 0
	mov	x7, 0
	mov	x8, 101
	b	L15
	.p2align 2,,3
L19:
	add	x4, x4, 1
L15:
	ldr	x1, [x19, x4, lsl 3]
	ldr	w0, [x21, x4, lsl 2]
	add	x7, x7, w0, sxtw
	udiv	x5, x1, x8
	add	x3, x5, x5, lsl 2
	add	x3, x3, x3, lsl 2
	add	x3, x5, x3, lsl 2
	sub	x1, x1, x3
	add	w1, w1, w1, lsl 1
	add	w1, w1, 1
	cmp	w0, w1
	bne	L26
	cmp	x6, x4
	bne	L19
	adrp	x0, l.str.0@PAGE
	stp	x2, x7, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	mov	x0, x22
	bl	_free
	mov	x0, x19
	bl	_free
	mov	x0, x21
	bl	_free
	ldp	x21, x22, [x29, 32]
LCFI5:
	mov	w0, 0
L9:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 64
LCFI6:
	ret
L26:
LCFI7:
	mov	x0, x22
	bl	_free
	mov	x0, x19
	bl	_free
	mov	x0, x21
	bl	_free
	mov	w0, 4
	ldp	x21, x22, [x29, 32]
LCFI8:
	b	L9
L16:
	mov	x20, 32768
	stp	x21, x22, [x29, 32]
LCFI9:
	b	L10
L24:
LCFI10:
	mov	w0, 2
	b	L9
L25:
LCFI11:
	mov	x0, x22
	bl	_free
	mov	x0, x19
	bl	_free
	mov	x0, x21
	bl	_free
	mov	w0, 3
	ldp	x21, x22, [x29, 32]
LCFI12:
	b	L9
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
	.byte	0x96
	.uleb128 0x1
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xd6
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
	.byte	0x96
	.uleb128 0x1
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xd6
	.byte	0xd5
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0x96
	.uleb128 0x1
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xd5
	.byte	0xd6
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0x95
	.uleb128 0x2
	.byte	0x96
	.uleb128 0x1
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xd6
	.byte	0xd5
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

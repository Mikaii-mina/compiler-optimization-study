	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cmp	x2, 2
	bls	L1
	add	x4, x0, 4
	add	x6, x1, 4
	sub	x14, x2, #2
	add	x4, x4, x2, lsl 2
	mov	x11, x2
	lsr	x13, x14, 2
	add	x6, x6, x2, lsl 2
	mov	x12, 0
	lsl	x10, x13, 4
	sub	x15, x2, #3
	lsl	x13, x13, 2
	.p2align 5,,15
L3:
	cmp	x15, 2
	bls	L18
L9:
	sub	x9, x4, x2, lsl 2
	sub	x8, x4, #4
	add	x5, x4, 4
	add	x7, x4, x2, lsl 2
	mov	x3, 0
	.p2align 5,,15
L7:
	ldr	q2, [x9, x3]
	ldr	q1, [x4, x3]
	ldr	q0, [x7, x3]
	ldr	q30, [x8, x3]
	add	v1.4s, v2.4s, v1.4s
	ldr	q31, [x5, x3]
	add	v0.4s, v1.4s, v0.4s
	add	v30.4s, v0.4s, v30.4s
	add	v31.4s, v30.4s, v31.4s
	str	q31, [x6, x3]
	add	x3, x3, 16
	cmp	x10, x3
	bne	L7
	cmp	x14, x13
	beq	L4
	add	x5, x13, 2
	add	x3, x13, 1
L5:
	add	x3, x11, x3
	lsl	x8, x3, 2
	sub	x4, x3, x2
	ldr	w9, [x0, x8]
	ldr	w4, [x0, x4, lsl 2]
	add	w4, w4, w9
	add	x9, x2, x3
	ldr	w9, [x0, x9, lsl 2]
	add	w4, w4, w9
	sub	x9, x3, #1
	ldr	w9, [x0, x9, lsl 2]
	add	x3, x3, 1
	ldr	w3, [x0, x3, lsl 2]
	add	w4, w4, w9
	add	w3, w4, w3
	str	w3, [x1, x8]
	mov	x3, x5
	add	x5, x5, 1
	cmp	x5, x2
	bcc	L5
	add	x12, x12, 1
	add	x6, x6, x2, lsl 2
	add	x11, x11, x2
	mov	x4, x7
	cmp	x12, x14
	bne	L3
L1:
	ret
	.p2align 2,,3
L4:
	add	x12, x12, 1
	add	x6, x6, x2, lsl 2
	add	x11, x11, x2
	cmp	x12, x14
	beq	L1
	mov	x4, x7
	b	L9
	.p2align 2,,3
L18:
	add	x7, x4, x2, lsl 2
	mov	x3, 1
	mov	x5, 2
	b	L5
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
LCFI0:
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
LCFI2:
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
LCFI3:
	cmp	w0, 1
	ble	L33
	mov	x3, x1
	mov	w2, 10
	ldr	x0, [x3, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x19, x0
	sub	x0, x0, #3
	cmp	x0, 1021
	bhi	L48
L20:
	umull	x22, w19, w19
	ubfiz	x0, x22, 2, 32
	bl	_malloc
	mov	x21, x0
	mov	x1, 4
	mov	x0, x22
	bl	_calloc
	cmp	x21, 0
	mov	x20, x0
	ccmp	x0, 0, 4, ne
	mov	x3, 0
	beq	L45
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	.p2align 5,,15
L22:
	umulh	x5, x3, x0
	lsr	x5, x5, 2
	add	x4, x5, x5, lsl 1
	add	x4, x5, x4, lsl 2
	sub	x4, x3, x4
	str	w4, [x21, x3, lsl 2]
	add	x3, x3, 1
	cmp	x3, x22
	bne	L22
	mov	x2, x19
	mov	x1, x20
	mov	x0, x21
	bl	_kernel
	mov	x6, 20165
	neg	x10, x19
	movk	x6, 0xc4ec, lsl 16
	mov	x5, 0
	movk	x6, 0xec4e, lsl 32
	mov	x9, 0
	movk	x6, 0x4ec4, lsl 48
L23:
	add	x12, x19, x10
	mov	x3, 0
	mov	x4, x12
	add	x11, x5, 1
	cmp	x11, x19
	cset	w7, cc
	.p2align 5,,15
L29:
	cbz	x5, L24
L32:
	cmp	x3, 0
	ccmp	w7, 0, 4, ne
	bne	L49
L24:
	ldr	w22, [x20, x4, lsl 2]
	cbnz	w22, L26
	add	x3, x3, 1
	add	x4, x4, 1
	cmp	x3, x19
	bne	L29
	cmp	x11, x3
	bne	L31
	adrp	x0, l.str.0@PAGE
	stp	x11, x9, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	mov	x0, x21
	bl	_free
	mov	x0, x20
	bl	_free
	b	L19
	.p2align 2,,3
L49:
	add	x8, x3, 1
	cmp	x19, x8
	bls	L25
	add	x3, x10, x3
	add	x14, x4, 1
	ldr	w13, [x20, x4, lsl 2]
	umulh	x0, x3, x6
	lsr	x0, x0, 2
	add	x1, x0, x0, lsl 1
	add	x0, x0, x1, lsl 2
	umulh	x1, x4, x6
	sub	x3, x3, x0
	lsr	x1, x1, 2
	add	x0, x1, x1, lsl 1
	add	x0, x1, x0, lsl 2
	umulh	x1, x14, x6
	sub	x0, x4, x0
	add	w3, w3, w0
	lsr	x1, x1, 2
	add	x0, x1, x1, lsl 1
	add	x0, x1, x0, lsl 2
	add	x1, x4, x19
	sub	x4, x4, #1
	sub	x0, x14, x0
	add	w3, w3, w0
	umulh	x0, x1, x6
	lsr	x0, x0, 2
	add	x2, x0, x0, lsl 1
	add	x0, x0, x2, lsl 2
	umulh	x2, x4, x6
	sub	x1, x1, x0
	lsr	x2, x2, 2
	add	x0, x2, x2, lsl 1
	add	x0, x2, x0, lsl 2
	sub	x4, x4, x0
	add	w1, w1, w4
	add	w3, w3, w1
	cmp	w13, w3
	bne	L26
	mov	x3, x8
	mov	x4, x14
	add	x9, x9, w13, sxtw
	b	L32
	.p2align 2,,3
L25:
	ldr	w0, [x20, w4, uxtw 2]
	cbnz	w0, L26
L31:
	mov	x10, x12
	mov	x5, x11
	b	L23
	.p2align 2,,3
L26:
	mov	x0, x21
	mov	w22, 4
	bl	_free
	mov	x0, x20
	bl	_free
L19:
	mov	w0, w22
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	add	sp, sp, 64
LCFI4:
	ret
L33:
LCFI5:
	mov	x19, 256
	b	L20
L48:
	mov	w22, 2
	b	L19
L45:
	mov	x0, x21
	mov	w22, 3
	bl	_free
	mov	x0, x20
	bl	_free
	b	L19
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
	.byte	0x95
	.uleb128 0x2
	.byte	0x96
	.uleb128 0x1
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
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
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xb
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

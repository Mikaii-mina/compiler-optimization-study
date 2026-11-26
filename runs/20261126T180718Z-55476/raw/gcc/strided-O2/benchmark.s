	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x2, L1
	add	x2, x2, x2, lsl 1
	mov	x3, 0
	lsl	x4, x2, 2
	.p2align 5,,15
L3:
	ldr	w2, [x0, x3]
	lsl	w2, w2, 1
	add	w2, w2, 1
	str	w2, [x1, x3]
	add	x3, x3, 12
	cmp	x4, x3
	bne	L3
L1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS strided n=%zu stride=%d checksum=%lld\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB5:
	sub	sp, sp, #96
LCFI0:
	stp	x29, x30, [sp, 32]
LCFI1:
	add	x29, sp, 32
LCFI2:
	str	x23, [sp, 80]
	cmp	w0, 1
LCFI3:
	ble	L17
	mov	x3, x1
	mov	w2, 10
	ldr	x0, [x3, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x23, x0
	sub	x1, x0, #1
	mov	x0, 16959
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bhi	L27
	stp	x19, x20, [x29, 16]
LCFI4:
	stp	x21, x22, [x29, 32]
LCFI5:
L10:
	mov	w22, 12
	ubfiz	x21, x23, 1, 32
	add	x21, x21, w23, uxtw
	umull	x22, w23, w22
	mov	x0, x22
	bl	_malloc
	mov	x20, x0
	mov	x1, 4
	mov	x0, x21
	bl	_calloc
	cmp	x20, 0
	mov	x19, x0
	ccmp	x0, 0, 4, ne
	mov	x1, 0
	mov	x0, 97
	beq	L28
	.p2align 5,,15
L12:
	udiv	x3, x1, x0
	add	x2, x3, x3, lsl 1
	add	x2, x3, x2, lsl 5
	sub	x2, x1, x2
	str	w2, [x20, x1, lsl 2]
	add	x1, x1, 1
	cmp	x21, x1
	bne	L12
	mov	x2, 0
	.p2align 5,,15
L13:
	ldr	w1, [x20, x2]
	lsl	w1, w1, 1
	add	w1, w1, 1
	str	w1, [x19, x2]
	add	x2, x2, 12
	cmp	x22, x2
	bne	L13
	mov	x5, -6148914691236517206
	mov	x2, 0
	mov	x3, 0
	movk	x5, 0xaaab, lsl 0
	mov	x0, 6148914691236517205
	mov	x6, 97
	.p2align 5,,15
L16:
	mul	x4, x2, x5
	mov	w1, 0
	cmp	x4, x0
	bhi	L14
	udiv	x4, x2, x6
	add	x1, x4, x4, lsl 1
	add	x1, x4, x1, lsl 5
	sub	x1, x2, x1
	lsl	w1, w1, 1
	add	w1, w1, 1
L14:
	ldr	w4, [x19, x2, lsl 2]
	cmp	w4, w1
	bne	L29
	add	x2, x2, 1
	add	x3, x3, w1, sxtw
	cmp	x21, x2
	bne	L16
	mov	w0, 3
	str	x23, [sp]
	str	x3, [sp, 16]
	str	w0, [sp, 8]
	adrp	x0, l.str.0@PAGE
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	ldp	x19, x20, [x29, 16]
LCFI6:
	mov	w0, 0
	ldp	x21, x22, [x29, 32]
LCFI7:
L9:
	ldp	x29, x30, [sp, 32]
	ldr	x23, [sp, 80]
	add	sp, sp, 96
LCFI8:
	ret
L29:
LCFI9:
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	mov	w0, 4
	ldp	x19, x20, [x29, 16]
LCFI10:
	ldp	x21, x22, [x29, 32]
LCFI11:
	b	L9
L17:
	mov	x23, 32768
	stp	x19, x20, [x29, 16]
LCFI12:
	stp	x21, x22, [x29, 32]
LCFI13:
	b	L10
L27:
LCFI14:
	mov	w0, 2
	b	L9
L28:
LCFI15:
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	mov	w0, 3
	ldp	x19, x20, [x29, 16]
LCFI16:
	ldp	x21, x22, [x29, 32]
LCFI17:
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
	.uleb128 0x60
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
	.byte	0x97
	.uleb128 0x2
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
	.byte	0x96
	.uleb128 0x3
	.byte	0x95
	.uleb128 0x4
	.byte	0x4
	.set L$set$11,LCFI6-LCFI5
	.long L$set$11
	.byte	0xd4
	.byte	0xd3
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xd6
	.byte	0xd5
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xd7
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x40
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x95
	.uleb128 0x4
	.byte	0x96
	.uleb128 0x3
	.byte	0x97
	.uleb128 0x2
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xd4
	.byte	0xd3
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0xd6
	.byte	0xd5
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0x94
	.uleb128 0x5
	.byte	0x93
	.uleb128 0x6
	.byte	0x4
	.set L$set$18,LCFI13-LCFI12
	.long L$set$18
	.byte	0x96
	.uleb128 0x3
	.byte	0x95
	.uleb128 0x4
	.byte	0x4
	.set L$set$19,LCFI14-LCFI13
	.long L$set$19
	.byte	0xd3
	.byte	0xd4
	.byte	0xd5
	.byte	0xd6
	.byte	0x4
	.set L$set$20,LCFI15-LCFI14
	.long L$set$20
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x95
	.uleb128 0x4
	.byte	0x96
	.uleb128 0x3
	.byte	0x4
	.set L$set$21,LCFI16-LCFI15
	.long L$set$21
	.byte	0xd4
	.byte	0xd3
	.byte	0x4
	.set L$set$22,LCFI17-LCFI16
	.long L$set$22
	.byte	0xd6
	.byte	0xd5
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

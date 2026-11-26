	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x1, L4
	add	x1, x0, x1, lsl 2
	mov	x2, x0
	mov	w0, 0
	.p2align 5,,15
L3:
	ldr	w3, [x2], 4
	add	w0, w0, w3
	cmp	x2, x1
	bne	L3
	ret
	.p2align 2,,3
L4:
	mov	w0, 0
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS reduction n=%zu checksum=%d\12\0"
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
	ble	L13
	mov	x3, x1
	mov	w2, 10
	ldr	x0, [x3, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x19, x0
	sub	x1, x0, #1
	mov	x0, 16959
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bhi	L23
	str	x21, [x29, 32]
LCFI4:
L8:
	ubfiz	x21, x19, 2, 32
	mov	x0, x21
	bl	_malloc
	mov	x20, x0
	cbz	x0, L15
	mov	x0, -1085102592571150096
	mov	x2, 0
	movk	x0, 0xf0f1, lsl 0
	.p2align 5,,15
L10:
	umulh	x1, x2, x0
	and	x3, x1, -16
	add	x1, x3, x1, lsr 4
	sub	x1, x2, x1
	str	w1, [x20, x2, lsl 2]
	add	x2, x2, 1
	cmp	x2, x19
	bne	L10
	mov	x1, x20
	add	x0, x21, x20
	mov	w4, 0
	.p2align 5,,15
L11:
	ldr	w2, [x1], 4
	add	w4, w4, w2
	cmp	x0, x1
	bne	L11
	mov	x0, -1085102592571150096
	mov	x2, 0
	mov	w3, 0
	movk	x0, 0xf0f1, lsl 0
	.p2align 5,,15
L12:
	umulh	x1, x2, x0
	and	x5, x1, -16
	add	x1, x5, x1, lsr 4
	sub	x1, x2, x1
	add	x2, x2, 1
	add	w3, w3, w1
	cmp	x2, x19
	bne	L12
	mov	w0, 4
	cmp	w3, w4
	bne	L22
	adrp	x0, l.str.0@PAGE
	str	x2, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	str	w3, [sp, 8]
	bl	_printf
	mov	x0, x20
	bl	_free
	ldr	x21, [x29, 32]
LCFI5:
	mov	w0, 0
L7:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 64
LCFI6:
	ret
L22:
LCFI7:
	ldr	x21, [x29, 32]
LCFI8:
	b	L7
L13:
	mov	x19, 32768
	str	x21, [x29, 32]
LCFI9:
	b	L8
L23:
LCFI10:
	mov	w0, 2
	b	L7
L15:
LCFI11:
	ldr	x21, [x29, 32]
LCFI12:
	mov	w0, 3
	b	L7
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

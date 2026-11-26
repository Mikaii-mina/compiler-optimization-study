	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB4:
	cbz	x1, L5
	sub	x2, x1, #1
	cmp	x2, 2
	bls	L6
	lsr	x4, x1, 2
	movi	v31.4s, 0
	mov	x2, x0
	add	x3, x0, x4, lsl 4
	.p2align 5,,15
L4:
	ldr	q30, [x2], 16
	add	v31.4s, v30.4s, v31.4s
	cmp	x3, x2
	bne	L4
	addv	s31, v31.4s
	lsl	x3, x4, 2
	fmov	w2, s31
	cmp	x1, x3
	beq	L1
L3:
	ldr	w5, [x0, x3, lsl 2]
	add	x4, x3, 1
	add	w2, w2, w5
	cmp	x1, x4
	bls	L1
	add	x0, x0, x3, lsl 2
	add	x3, x3, 2
	ldr	w4, [x0, 4]
	add	w2, w2, w4
	cmp	x1, x3
	bls	L1
	ldr	w0, [x0, 8]
	add	w2, w2, w0
L1:
	mov	w0, w2
	ret
	.p2align 2,,3
L5:
	mov	w2, 0
	mov	w0, w2
	ret
L6:
	mov	x3, 0
	mov	w2, 0
	b	L3
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
	sub	sp, sp, #48
LCFI0:
	stp	x29, x30, [sp, 16]
LCFI1:
	add	x29, sp, 16
LCFI2:
	stp	x19, x20, [sp, 32]
LCFI3:
	cmp	w0, 1
	ble	L17
	mov	w2, 10
	ldr	x0, [x1, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x1, 16959
	mov	x19, x0
	movk	x1, 0xf, lsl 16
	sub	x0, x0, #1
	cmp	x0, x1
	bhi	L26
L10:
	ubfiz	x0, x19, 2, 32
	bl	_malloc
	mov	x20, x0
	cbz	x0, L19
	mov	x0, -1085102592571150096
	mov	x2, 0
	movk	x0, 0xf0f1, lsl 0
	.p2align 5,,15
L12:
	umulh	x1, x2, x0
	and	x3, x1, -16
	add	x1, x3, x1, lsr 4
	sub	x1, x2, x1
	str	w1, [x20, x2, lsl 2]
	add	x2, x2, 1
	cmp	x2, x19
	bne	L12
	sub	x0, x19, #1
	cmp	x0, 2
	bls	L20
	movi	v31.4s, 0
	mov	x1, x20
	lsr	x0, x19, 2
	add	x2, x20, w0, uxtw 4
	.p2align 5,,15
L14:
	ldr	q30, [x1], 16
	add	v31.4s, v30.4s, v31.4s
	cmp	x2, x1
	bne	L14
	addv	s31, v31.4s
	ubfiz	x0, x0, 2, 32
	fmov	w3, s31
	cmp	x19, x0
	beq	L15
L13:
	ldr	w2, [x20, w0, uxtw 2]
	add	x1, x0, 1
	add	w3, w3, w2
	cmp	x19, x1
	bls	L15
	add	x1, x20, w0, uxtw 2
	ldr	w2, [x1, 4]
	add	x0, x0, 2
	add	w3, w3, w2
	cmp	x19, x0
	bls	L15
	ldr	w0, [x1, 8]
	add	w3, w3, w0
L15:
	mov	x0, -1085102592571150096
	mov	x2, 0
	mov	w4, 0
	movk	x0, 0xf0f1, lsl 0
	.p2align 5,,15
L16:
	umulh	x1, x2, x0
	and	x5, x1, -16
	add	x1, x5, x1, lsr 4
	sub	x1, x2, x1
	add	x2, x2, 1
	add	w4, w4, w1
	cmp	x2, x19
	bne	L16
	mov	w0, 4
	cmp	w4, w3
	beq	L27
L9:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 48
LCFI4:
	ret
L27:
LCFI5:
	adrp	x0, l.str.0@PAGE
	str	x2, [sp]
	add	x0, x0, l.str.0@PAGEOFF;
	str	w4, [sp, 8]
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	w0, 0
	b	L9
L17:
	mov	x19, 32768
	b	L10
L26:
	mov	w0, 2
	b	L9
L20:
	mov	w3, 0
	mov	x0, 0
	b	L13
L19:
	mov	w0, 3
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
	.uleb128 0x30
	.byte	0x4
	.set L$set$6,LCFI1-LCFI0
	.long L$set$6
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$7,LCFI2-LCFI1
	.long L$set$7
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x20
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x93
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x1
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

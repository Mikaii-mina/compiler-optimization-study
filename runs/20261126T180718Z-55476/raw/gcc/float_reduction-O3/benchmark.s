	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.p2align 5,,15
	.globl _kernel
_kernel:
LFB23:
	movi	v0.2s, #0
	cbz	x1, L1
	add	x1, x0, x1, lsl 2
	.p2align 5,,15
L3:
	ldr	s31, [x0], 4
	fadd	s0, s0, s31
	cmp	x1, x0
	bne	L3
L1:
	ret
LFE23:
	.cstring
	.align	3
l.str.1:
	.ascii "PASS float_reduction n=%zu sum=%.9g reference=%.9g\12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 5,,15
	.globl _main
_main:
LFB24:
	sub	sp, sp, #80
LCFI0:
	stp	x29, x30, [sp, 32]
LCFI1:
	add	x29, sp, 32
LCFI2:
	stp	x19, x20, [sp, 48]
LCFI3:
	cmp	w0, 1
	ble	L17
	mov	w2, 10
	ldr	x0, [x1, 8]
	mov	x1, 0
	bl	_strtoul
	mov	x1, 16959
	mov	x20, x0
	movk	x1, 0xf, lsl 16
	sub	x0, x0, #1
	cmp	x0, x1
	bhi	L26
L8:
	ubfiz	x19, x20, 2, 32
	mov	x0, x19
	bl	_malloc
	mov	x4, x0
	cbz	x0, L19
	fmov	s31, 1.0e+0
	mov	x0, -1085102592571150096
	mov	x2, 0
	movk	x0, 0xf0f1, lsl 0
	.p2align 5,,15
L10:
	umulh	x1, x2, x0
	and	x3, x1, -16
	add	x1, x3, x1, lsr 4
	sub	x1, x2, x1
	add	x1, x1, 1
	scvtf	s30, x1
	fdiv	s30, s31, s30
	str	s30, [x4, x2, lsl 2]
	add	x2, x2, 1
	cmp	x2, x20
	bne	L10
	movi	v30.2s, #0
	add	x3, x19, x4
	mov	x1, x4
	mov	x2, x4
	.p2align 5,,15
L11:
	ldr	s31, [x2], 4
	fadd	s30, s30, s31
	cmp	x3, x2
	bne	L11
	movi	d29, #0
	.p2align 5,,15
L12:
	ldr	s31, [x1], 4
	fcvt	d31, s31
	fadd	d29, d29, d31
	cmp	x3, x1
	bne	L12
	fcmp	s30, s30
	beq	L27
L13:
	mov	x0, x4
	bl	_free
	mov	w0, 4
L7:
	ldp	x29, x30, [sp, 32]
	ldp	x19, x20, [sp, 48]
	add	sp, sp, 80
LCFI4:
	ret
L27:
LCFI5:
	mov	w0, 2139095039
	fabs	s28, s30
	fmov	s31, w0
	fcmp	s28, s31
	ble	L20
	b	L13
L20:
	adrp	x0, lC0@PAGE
	fcvt	d30, s30
	fmov	d28, 1.0e+0
	fabs	d31, d29
	fmaxnm	d31, d31, d28
	ldr	d27, [x0, #lC0@PAGEOFF]
	fabd	d28, d30, d29
	fmul	d31, d31, d27
	fcmpe	d28, d31
	bgt	L13
	adrp	x0, l.str.1@PAGE
	str	x20, [sp]
	add	x0, x0, l.str.1@PAGEOFF;
	stp	d30, d29, [sp, 8]
	str	x4, [x29, 40]
	bl	_printf
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 0
	b	L7
L17:
	mov	x20, 32768
	b	L8
L26:
	mov	w0, 2
	b	L7
L19:
	mov	w0, 3
	b	L7
LFE24:
	.literal8
	.align	3
lC0:
	.long	-755914244
	.long	1062232653
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
	.quad	LFB23-.
	.set L$set$2,LFE23-LFB23
	.quad L$set$2
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB24-.
	.set L$set$4,LFE24-LFB24
	.quad L$set$4
	.uleb128 0
	.byte	0x4
	.set L$set$5,LCFI0-LFB24
	.long L$set$5
	.byte	0xe
	.uleb128 0x50
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

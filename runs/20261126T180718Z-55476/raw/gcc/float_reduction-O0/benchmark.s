	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.globl _kernel
_kernel:
LFB23:
	sub	sp, sp, #32
LCFI0:
	str	x0, [sp, 8]
	str	x1, [sp]
	str	wzr, [sp, 28]
	str	xzr, [sp, 16]
	b	L2
L3:
	ldr	x0, [sp, 16]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	s31, [x0]
	ldr	s30, [sp, 28]
	fadd	s31, s30, s31
	str	s31, [sp, 28]
	ldr	x0, [sp, 16]
	add	x0, x0, 1
	str	x0, [sp, 16]
L2:
	ldr	x1, [sp, 16]
	ldr	x0, [sp]
	cmp	x1, x0
	bcc	L3
	ldr	s31, [sp, 28]
	fmov	s0, s31
	add	sp, sp, 32
LCFI1:
	ret
LFE23:
	.cstring
	.align	3
l.str.1:
	.ascii "PASS float_reduction n=%zu sum=%.9g reference=%.9g\12\0"
	.text
	.align	2
	.globl _main
_main:
LFB24:
	sub	sp, sp, #144
LCFI2:
	stp	x29, x30, [sp, 32]
LCFI3:
	add	x29, sp, 32
LCFI4:
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	ldr	w0, [x29, 28]
	cmp	w0, 1
	ble	L6
	ldr	x0, [x29, 16]
	add	x0, x0, 8
	ldr	x0, [x0]
	mov	w2, 10
	mov	x1, 0
	bl	_strtoul
	str	x0, [x29, 104]
	b	L7
L6:
	mov	x0, 32768
	str	x0, [x29, 104]
L7:
	ldr	x0, [x29, 104]
	cmp	x0, 0
	beq	L8
	ldr	x1, [x29, 104]
	mov	x0, 16960
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bls	L9
L8:
	mov	w0, 2
	b	L10
L9:
	ldr	x0, [x29, 104]
	lsl	x0, x0, 2
	bl	_malloc
	str	x0, [x29, 72]
	ldr	x0, [x29, 72]
	cmp	x0, 0
	bne	L11
	mov	w0, 3
	b	L10
L11:
	str	xzr, [x29, 96]
	b	L12
L13:
	ldr	x2, [x29, 96]
	mov	x0, -1085102592571150096
	movk	x0, 0xf0f1, lsl 0
	umulh	x0, x2, x0
	lsr	x1, x0, 4
	mov	x0, x1
	lsl	x0, x0, 4
	add	x0, x0, x1
	sub	x1, x2, x0
	add	x0, x1, 1
	ucvtf	s31, x0
	ldr	x0, [x29, 96]
	lsl	x0, x0, 2
	ldr	x1, [x29, 72]
	add	x0, x1, x0
	fmov	s30, 1.0e+0
	fdiv	s31, s30, s31
	str	s31, [x0]
	ldr	x0, [x29, 96]
	add	x0, x0, 1
	str	x0, [x29, 96]
L12:
	ldr	x1, [x29, 96]
	ldr	x0, [x29, 104]
	cmp	x1, x0
	bcc	L13
	ldr	x1, [x29, 104]
	ldr	x0, [x29, 72]
	bl	_kernel
	str	s0, [x29, 68]
	str	xzr, [x29, 88]
	str	xzr, [x29, 80]
	b	L14
L15:
	ldr	x0, [x29, 80]
	lsl	x0, x0, 2
	ldr	x1, [x29, 72]
	add	x0, x1, x0
	ldr	s31, [x0]
	fcvt	d31, s31
	ldr	d30, [x29, 88]
	fadd	d31, d30, d31
	str	d31, [x29, 88]
	ldr	x0, [x29, 80]
	add	x0, x0, 1
	str	x0, [x29, 80]
L14:
	ldr	x1, [x29, 80]
	ldr	x0, [x29, 104]
	cmp	x1, x0
	bcc	L15
	ldr	s31, [x29, 68]
	fcvt	d30, s31
	ldr	d31, [x29, 88]
	fsub	d31, d30, d31
	fabs	d31, d31
	str	d31, [x29, 56]
	ldr	d31, [x29, 88]
	fabs	d31, d31
	fmov	d1, 1.0e+0
	fmov	d0, d31
	bl	_fmax
	fmov	d30, d0
	adrp	x0, lC0@PAGE
	add	x0, x0, lC0@PAGEOFF;
	ldr	d31, [x0]
	fmul	d31, d30, d31
	str	d31, [x29, 48]
	ldr	s31, [x29, 68]
	str	s31, [x29, 44]
	ldr	s30, [x29, 44]
	ldr	s31, [x29, 44]
	fcmp	s30, s31
	bne	L16
	ldr	s31, [x29, 44]
	fabs	s31, s31
	mov	w0, 2139095039
	fmov	s30, w0
	fcmp	s31, s30
	ble	L23
	b	L16
L23:
	mov	w0, 1
	b	L18
L16:
	mov	w0, 0
L18:
	nop
	cmp	w0, 0
	beq	L20
	ldr	d30, [x29, 56]
	ldr	d31, [x29, 48]
	fcmpe	d30, d31
	bgt	L20
	b	L24
L20:
	ldr	x0, [x29, 72]
	bl	_free
	mov	w0, 4
	b	L10
L24:
	ldr	s31, [x29, 68]
	fcvt	d31, s31
	ldr	d30, [x29, 88]
	str	d30, [sp, 16]
	str	d31, [sp, 8]
	ldr	x0, [x29, 104]
	str	x0, [sp]
	adrp	x0, l.str.1@PAGE
	add	x0, x0, l.str.1@PAGEOFF;
	bl	_printf
	ldr	x0, [x29, 72]
	bl	_free
	mov	w0, 0
L10:
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 144
LCFI5:
	ret
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
	.byte	0x4
	.set L$set$3,LCFI0-LFB23
	.long L$set$3
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$5,LEFDE3-LASFDE3
	.long L$set$5
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB24-.
	.set L$set$6,LFE24-LFB24
	.quad L$set$6
	.uleb128 0
	.byte	0x4
	.set L$set$7,LCFI2-LFB24
	.long L$set$7
	.byte	0xe
	.uleb128 0x90
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x9d
	.uleb128 0xe
	.byte	0x9e
	.uleb128 0xd
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x70
	.byte	0x4
	.set L$set$10,LCFI5-LCFI4
	.long L$set$10
	.byte	0xdd
	.byte	0xde
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LEFDE3:
	.ident	"GCC: (Homebrew GCC 16.2.0) 16.2.0"
	.subsections_via_symbols

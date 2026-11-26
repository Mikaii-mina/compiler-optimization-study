	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.globl _kernel
_kernel:
LFB4:
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
	ldr	w0, [x0]
	ldr	w1, [sp, 28]
	add	w0, w1, w0
	str	w0, [sp, 28]
	ldr	x0, [sp, 16]
	add	x0, x0, 1
	str	x0, [sp, 16]
L2:
	ldr	x1, [sp, 16]
	ldr	x0, [sp]
	cmp	x1, x0
	bcc	L3
	ldr	w0, [sp, 28]
	add	sp, sp, 32
LCFI1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS reduction n=%zu checksum=%d\12\0"
	.text
	.align	2
	.globl _main
_main:
LFB5:
	sub	sp, sp, #96
LCFI2:
	stp	x29, x30, [sp, 16]
LCFI3:
	add	x29, sp, 16
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
	str	x0, [x29, 72]
	b	L7
L6:
	mov	x0, 32768
	str	x0, [x29, 72]
L7:
	ldr	x0, [x29, 72]
	cmp	x0, 0
	beq	L8
	ldr	x1, [x29, 72]
	mov	x0, 16960
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bls	L9
L8:
	mov	w0, 2
	b	L10
L9:
	ldr	x0, [x29, 72]
	lsl	x0, x0, 2
	bl	_malloc
	str	x0, [x29, 40]
	ldr	x0, [x29, 40]
	cmp	x0, 0
	bne	L11
	mov	w0, 3
	b	L10
L11:
	str	xzr, [x29, 64]
	b	L12
L13:
	ldr	x2, [x29, 64]
	mov	x0, -1085102592571150096
	movk	x0, 0xf0f1, lsl 0
	umulh	x0, x2, x0
	lsr	x1, x0, 4
	mov	x0, x1
	lsl	x0, x0, 4
	add	x0, x0, x1
	sub	x1, x2, x0
	ldr	x0, [x29, 64]
	lsl	x0, x0, 2
	ldr	x2, [x29, 40]
	add	x0, x2, x0
	str	w1, [x0]
	ldr	x0, [x29, 64]
	add	x0, x0, 1
	str	x0, [x29, 64]
L12:
	ldr	x1, [x29, 64]
	ldr	x0, [x29, 72]
	cmp	x1, x0
	bcc	L13
	ldr	x1, [x29, 72]
	ldr	x0, [x29, 40]
	bl	_kernel
	str	w0, [x29, 36]
	str	wzr, [x29, 60]
	str	xzr, [x29, 48]
	b	L14
L15:
	ldr	x2, [x29, 48]
	mov	x0, -1085102592571150096
	movk	x0, 0xf0f1, lsl 0
	umulh	x0, x2, x0
	lsr	x1, x0, 4
	mov	x0, x1
	lsl	x0, x0, 4
	add	x0, x0, x1
	sub	x1, x2, x0
	ldr	w0, [x29, 60]
	add	w0, w0, w1
	str	w0, [x29, 60]
	ldr	x0, [x29, 48]
	add	x0, x0, 1
	str	x0, [x29, 48]
L14:
	ldr	x1, [x29, 48]
	ldr	x0, [x29, 72]
	cmp	x1, x0
	bcc	L15
	ldr	w1, [x29, 36]
	ldr	w0, [x29, 60]
	cmp	w1, w0
	beq	L16
	mov	w0, 4
	b	L10
L16:
	ldr	w0, [x29, 36]
	str	w0, [sp, 8]
	ldr	x0, [x29, 72]
	str	x0, [sp]
	adrp	x0, l.str.0@PAGE
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 0
L10:
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 96
LCFI5:
	ret
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
	.byte	0x4
	.set L$set$3,LCFI0-LFB4
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
	.quad	LFB5-.
	.set L$set$6,LFE5-LFB5
	.quad L$set$6
	.uleb128 0
	.byte	0x4
	.set L$set$7,LCFI2-LFB5
	.long L$set$7
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x9d
	.uleb128 0xa
	.byte	0x9e
	.uleb128 0x9
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x50
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

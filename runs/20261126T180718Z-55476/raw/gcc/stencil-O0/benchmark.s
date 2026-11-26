	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.globl _kernel
_kernel:
LFB4:
	sub	sp, sp, #64
LCFI0:
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	mov	x0, 1
	str	x0, [sp, 56]
	b	L2
L5:
	mov	x0, 1
	str	x0, [sp, 48]
	b	L3
L4:
	ldr	x1, [sp, 56]
	ldr	x0, [sp, 8]
	mul	x0, x1, x0
	ldr	x1, [sp, 48]
	add	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	x2, [sp, 40]
	ldr	x0, [sp, 8]
	sub	x0, x2, x0
	lsl	x0, x0, 2
	ldr	x2, [sp, 24]
	add	x0, x2, x0
	ldr	w0, [x0]
	add	w1, w1, w0
	ldr	x2, [sp, 40]
	ldr	x0, [sp, 8]
	add	x0, x2, x0
	lsl	x0, x0, 2
	ldr	x2, [sp, 24]
	add	x0, x2, x0
	ldr	w0, [x0]
	add	w1, w1, w0
	ldr	x0, [sp, 40]
	lsl	x0, x0, 2
	sub	x0, x0, #4
	ldr	x2, [sp, 24]
	add	x0, x2, x0
	ldr	w0, [x0]
	add	w2, w1, w0
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	x0, [sp, 40]
	lsl	x0, x0, 2
	ldr	x3, [sp, 16]
	add	x0, x3, x0
	add	w1, w2, w1
	str	w1, [x0]
	ldr	x0, [sp, 48]
	add	x0, x0, 1
	str	x0, [sp, 48]
L3:
	ldr	x0, [sp, 48]
	add	x0, x0, 1
	ldr	x1, [sp, 8]
	cmp	x1, x0
	bhi	L4
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	str	x0, [sp, 56]
L2:
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	ldr	x1, [sp, 8]
	cmp	x1, x0
	bhi	L5
	nop
	nop
	add	sp, sp, 64
LCFI1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS stencil side=%zu checksum=%lld\12\0"
	.text
	.align	2
	.globl _main
_main:
LFB5:
	sub	sp, sp, #128
LCFI2:
	stp	x29, x30, [sp, 16]
LCFI3:
	add	x29, sp, 16
LCFI4:
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	ldr	w0, [x29, 28]
	cmp	w0, 1
	ble	L7
	ldr	x0, [x29, 16]
	add	x0, x0, 8
	ldr	x0, [x0]
	mov	w2, 10
	mov	x1, 0
	bl	_strtoul
	str	x0, [x29, 104]
	b	L8
L7:
	mov	x0, 256
	str	x0, [x29, 104]
L8:
	ldr	x0, [x29, 104]
	cmp	x0, 2
	bls	L9
	ldr	x0, [x29, 104]
	cmp	x0, 1024
	bls	L10
L9:
	mov	w0, 2
	b	L11
L10:
	ldr	x0, [x29, 104]
	mul	x0, x0, x0
	str	x0, [x29, 56]
	ldr	x0, [x29, 56]
	lsl	x0, x0, 2
	bl	_malloc
	str	x0, [x29, 48]
	mov	x1, 4
	ldr	x0, [x29, 56]
	bl	_calloc
	str	x0, [x29, 40]
	ldr	x0, [x29, 48]
	cmp	x0, 0
	beq	L12
	ldr	x0, [x29, 40]
	cmp	x0, 0
	bne	L13
L12:
	ldr	x0, [x29, 48]
	bl	_free
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 3
	b	L11
L13:
	str	xzr, [x29, 96]
	b	L14
L15:
	ldr	x2, [x29, 96]
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	ldr	x0, [x29, 96]
	lsl	x0, x0, 2
	ldr	x2, [x29, 48]
	add	x0, x2, x0
	str	w1, [x0]
	ldr	x0, [x29, 96]
	add	x0, x0, 1
	str	x0, [x29, 96]
L14:
	ldr	x1, [x29, 96]
	ldr	x0, [x29, 56]
	cmp	x1, x0
	bcc	L15
	ldr	x2, [x29, 104]
	ldr	x1, [x29, 40]
	ldr	x0, [x29, 48]
	bl	_kernel
	str	xzr, [x29, 88]
	str	xzr, [x29, 80]
	b	L16
L21:
	str	xzr, [x29, 72]
	b	L17
L20:
	ldr	x1, [x29, 80]
	ldr	x0, [x29, 104]
	mul	x0, x1, x0
	ldr	x1, [x29, 72]
	add	x0, x1, x0
	str	x0, [x29, 32]
	str	wzr, [x29, 68]
	ldr	x0, [x29, 80]
	cmp	x0, 0
	beq	L18
	ldr	x0, [x29, 80]
	add	x0, x0, 1
	ldr	x1, [x29, 104]
	cmp	x1, x0
	bls	L18
	ldr	x0, [x29, 72]
	cmp	x0, 0
	beq	L18
	ldr	x0, [x29, 72]
	add	x0, x0, 1
	ldr	x1, [x29, 104]
	cmp	x1, x0
	bls	L18
	ldr	x2, [x29, 32]
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	mov	w3, w1
	ldr	x1, [x29, 32]
	ldr	x0, [x29, 104]
	sub	x2, x1, x0
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	mov	w0, w1
	add	w3, w3, w0
	ldr	x1, [x29, 32]
	ldr	x0, [x29, 104]
	add	x2, x1, x0
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	mov	w0, w1
	add	w3, w3, w0
	ldr	x0, [x29, 32]
	sub	x2, x0, #1
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	mov	w0, w1
	add	w3, w3, w0
	ldr	x0, [x29, 32]
	add	x2, x0, 1
	mov	x0, 20165
	movk	x0, 0xc4ec, lsl 16
	movk	x0, 0xec4e, lsl 32
	movk	x0, 0x4ec4, lsl 48
	umulh	x0, x2, x0
	lsr	x1, x0, 2
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	sub	x1, x2, x0
	mov	w0, w1
	add	w0, w3, w0
	str	w0, [x29, 68]
L18:
	ldr	x0, [x29, 32]
	lsl	x0, x0, 2
	ldr	x1, [x29, 40]
	add	x0, x1, x0
	ldr	w0, [x0]
	ldr	w1, [x29, 68]
	cmp	w1, w0
	beq	L19
	ldr	x0, [x29, 48]
	bl	_free
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 4
	b	L11
L19:
	ldr	x0, [x29, 32]
	lsl	x0, x0, 2
	ldr	x1, [x29, 40]
	add	x0, x1, x0
	ldr	w0, [x0]
	sxtw	x0, w0
	ldr	x1, [x29, 88]
	add	x0, x1, x0
	str	x0, [x29, 88]
	ldr	x0, [x29, 72]
	add	x0, x0, 1
	str	x0, [x29, 72]
L17:
	ldr	x1, [x29, 72]
	ldr	x0, [x29, 104]
	cmp	x1, x0
	bcc	L20
	ldr	x0, [x29, 80]
	add	x0, x0, 1
	str	x0, [x29, 80]
L16:
	ldr	x1, [x29, 80]
	ldr	x0, [x29, 104]
	cmp	x1, x0
	bcc	L21
	ldr	x0, [x29, 88]
	str	x0, [sp, 8]
	ldr	x0, [x29, 104]
	str	x0, [sp]
	adrp	x0, l.str.0@PAGE
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	ldr	x0, [x29, 48]
	bl	_free
	ldr	x0, [x29, 40]
	bl	_free
	mov	w0, 0
L11:
	ldp	x29, x30, [sp, 16]
	add	sp, sp, 128
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
	.uleb128 0x40
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
	.uleb128 0x80
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

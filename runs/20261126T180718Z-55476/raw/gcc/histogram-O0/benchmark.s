	.arch armv8.5-a
	.build_version macos,  26, 0
	.text
	.align	2
	.globl _kernel
_kernel:
LFB4:
	sub	sp, sp, #48
LCFI0:
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	str	xzr, [sp, 40]
	b	L2
L3:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	and	x0, x0, 255
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w1, [x0]
	add	w1, w1, 1
	str	w1, [x0]
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
L2:
	ldr	x1, [sp, 40]
	ldr	x0, [sp, 16]
	cmp	x1, x0
	bcc	L3
	nop
	nop
	add	sp, sp, 48
LCFI1:
	ret
LFE4:
	.cstring
	.align	3
l.str.0:
	.ascii "PASS histogram n=%zu buckets=%d checksum=%llu\12\0"
	.text
	.align	2
	.globl _main
_main:
LFB5:
	sub	sp, sp, #624
LCFI2:
	stp	x29, x30, [sp, 32]
LCFI3:
	add	x29, sp, 32
LCFI4:
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	ldr	w0, [x29, 28]
	cmp	w0, 1
	ble	L5
	ldr	x0, [x29, 16]
	add	x0, x0, 8
	ldr	x0, [x0]
	mov	w2, 10
	mov	x1, 0
	bl	_strtoul
	str	x0, [x29, 584]
	b	L6
L5:
	mov	x0, 32768
	str	x0, [x29, 584]
L6:
	ldr	x0, [x29, 584]
	cmp	x0, 0
	beq	L7
	ldr	x1, [x29, 584]
	mov	x0, 16960
	movk	x0, 0xf, lsl 16
	cmp	x1, x0
	bls	L8
L7:
	mov	w0, 2
	b	L18
L8:
	ldr	x0, [x29, 584]
	bl	_malloc
	str	x0, [x29, 544]
	ldr	x0, [x29, 544]
	cmp	x0, 0
	bne	L10
	mov	w0, 3
	b	L18
L10:
	add	x0, x29, 288
	movi	v31.4s, 0
	str	q31, [x0]
	str	q31, [x0, 16]
	str	q31, [x0, 32]
	str	q31, [x0, 48]
	str	q31, [x0, 64]
	str	q31, [x0, 80]
	str	q31, [x0, 96]
	str	q31, [x0, 112]
	str	q31, [x0, 128]
	str	q31, [x0, 144]
	str	q31, [x0, 160]
	str	q31, [x0, 176]
	str	q31, [x0, 192]
	str	q31, [x0, 208]
	str	q31, [x0, 224]
	str	q31, [x0, 240]
	add	x0, x29, 32
	movi	v31.4s, 0
	str	q31, [x0]
	str	q31, [x0, 16]
	str	q31, [x0, 32]
	str	q31, [x0, 48]
	str	q31, [x0, 64]
	str	q31, [x0, 80]
	str	q31, [x0, 96]
	str	q31, [x0, 112]
	str	q31, [x0, 128]
	str	q31, [x0, 144]
	str	q31, [x0, 160]
	str	q31, [x0, 176]
	str	q31, [x0, 192]
	str	q31, [x0, 208]
	str	q31, [x0, 224]
	str	q31, [x0, 240]
	str	xzr, [x29, 576]
	b	L11
L12:
	ldr	x1, [x29, 576]
	mov	x0, x1
	lsl	x0, x0, 3
	add	x0, x0, x1
	lsl	x0, x0, 2
	add	x1, x0, x1
	ldr	x0, [x29, 576]
	lsr	x0, x0, 4
	eor	x0, x1, x0
	and	w1, w0, 255
	ldr	x2, [x29, 544]
	ldr	x0, [x29, 576]
	add	x0, x2, x0
	and	w1, w1, 63
	and	w1, w1, 255
	strb	w1, [x0]
	ldr	x0, [x29, 576]
	add	x0, x0, 1
	str	x0, [x29, 576]
L11:
	ldr	x1, [x29, 576]
	ldr	x0, [x29, 584]
	cmp	x1, x0
	bcc	L12
	add	x0, x29, 288
	mov	x2, x0
	ldr	x1, [x29, 584]
	ldr	x0, [x29, 544]
	bl	_kernel
	str	xzr, [x29, 568]
	b	L13
L14:
	ldr	x1, [x29, 544]
	ldr	x0, [x29, 568]
	add	x0, x1, x0
	ldrb	w0, [x0]
	mov	w3, w0
	sxtw	x0, w3
	lsl	x0, x0, 2
	add	x1, x29, 32
	ldr	w0, [x1, x0]
	add	w2, w0, 1
	sxtw	x0, w3
	lsl	x0, x0, 2
	add	x1, x29, 32
	str	w2, [x1, x0]
	ldr	x0, [x29, 568]
	add	x0, x0, 1
	str	x0, [x29, 568]
L13:
	ldr	x1, [x29, 568]
	ldr	x0, [x29, 584]
	cmp	x1, x0
	bcc	L14
	str	xzr, [x29, 560]
	str	xzr, [x29, 552]
	b	L15
L17:
	ldr	x0, [x29, 552]
	lsl	x0, x0, 2
	add	x1, x29, 288
	ldr	w1, [x1, x0]
	ldr	x0, [x29, 552]
	lsl	x0, x0, 2
	add	x2, x29, 32
	ldr	w0, [x2, x0]
	cmp	w1, w0
	beq	L16
	ldr	x0, [x29, 544]
	bl	_free
	mov	w0, 4
	b	L18
L16:
	ldr	x0, [x29, 552]
	add	x1, x0, 1
	ldr	x0, [x29, 552]
	lsl	x0, x0, 2
	add	x2, x29, 288
	ldr	w0, [x2, x0]
	uxtw	x0, w0
	mul	x0, x1, x0
	ldr	x1, [x29, 560]
	add	x0, x1, x0
	str	x0, [x29, 560]
	ldr	x0, [x29, 552]
	add	x0, x0, 1
	str	x0, [x29, 552]
L15:
	ldr	x0, [x29, 552]
	cmp	x0, 63
	bls	L17
	ldr	x0, [x29, 560]
	str	x0, [sp, 16]
	mov	w0, 64
	str	w0, [sp, 8]
	ldr	x0, [x29, 584]
	str	x0, [sp]
	adrp	x0, l.str.0@PAGE
	add	x0, x0, l.str.0@PAGEOFF;
	bl	_printf
	ldr	x0, [x29, 544]
	bl	_free
	mov	w0, 0
L18:
	ldp	x29, x30, [sp, 32]
	add	sp, sp, 624
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
	.uleb128 0x30
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
	.uleb128 0x270
	.byte	0x4
	.set L$set$8,LCFI3-LCFI2
	.long L$set$8
	.byte	0x9d
	.uleb128 0x4a
	.byte	0x9e
	.uleb128 0x49
	.byte	0x4
	.set L$set$9,LCFI4-LCFI3
	.long L$set$9
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x250
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

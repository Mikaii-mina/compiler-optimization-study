	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x3, LBB0_8
; %bb.1:
	cmp	x3, #4
	b.hs	LBB0_3
; %bb.2:
	mov	x8, #0                          ; =0x0
	b	LBB0_6
LBB0_3:
	and	x8, x3, #0xfffffffffffffffc
	add	x9, x1, #16
	movi.4s	v0, #3
	mov	x10, x2
	mov	x11, x8
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldp	x12, x13, [x9, #-16]
	ldp	x14, x15, [x9], #32
	add	x13, x0, x13, lsl #2
	add	x14, x0, x14, lsl #2
	add	x15, x0, x15, lsl #2
	ldr	s1, [x0, x12, lsl #2]
	ld1.s	{ v1 }[1], [x13]
	ld1.s	{ v1 }[2], [x14]
	ld1.s	{ v1 }[3], [x15]
	movi.4s	v2, #1
	mla.4s	v2, v1, v0
	str	q2, [x10], #16
	subs	x11, x11, #4
	b.ne	LBB0_4
; %bb.5:
	cmp	x3, x8
	b.eq	LBB0_8
LBB0_6:
	sub	x9, x3, x8
	add	x10, x2, x8, lsl #2
	add	x8, x1, x8, lsl #3
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x8], #8
	ldr	w11, [x0, x11, lsl #2]
	add	w11, w11, w11, lsl #1
	add	w11, w11, #1
	str	w11, [x10], #4
	subs	x9, x9, #1
	b.ne	LBB0_7
LBB0_8:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cmp	w0, #2
	b.lt	LBB1_3
; %bb.1:
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoul
	mov	x19, x0
	mov	x8, #-16961                     ; =0xffffffffffffbdbf
	movk	x8, #65520, lsl #16
	add	x9, x8, #1
	add	x8, x0, x8
	cmp	x8, x9
	b.hs	LBB1_4
; %bb.2:
	mov	w22, #2                         ; =0x2
	mov	x0, x22
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	lsl	x21, x19, #2
	mov	x0, x21
	bl	_malloc
	mov	x22, x0
	lsl	x0, x19, #3
	bl	_malloc
	mov	x20, x0
	mov	x0, x21
	bl	_malloc
	mov	x21, x0
	mov	x0, x22
	mov	w22, #3                         ; =0x3
	cbz	x0, LBB1_26
; %bb.5:
	cbz	x20, LBB1_26
; %bb.6:
	cbz	x21, LBB1_26
; %bb.7:
	mov	x8, #44773                      ; =0xaee5
	movk	x8, #11679, lsl #16
	movk	x8, #34390, lsl #32
	movk	x8, #17519, lsl #48
	cmp	x19, #4
	b.hs	LBB1_9
; %bb.8:
	mov	x9, #0                          ; =0x0
	b	LBB1_12
LBB1_9:
	mov	x10, #0                         ; =0x0
	and	x9, x19, #0xfffffffffffffffc
	add	x11, x0, #8
	add	x12, x20, #16
	mov	w13, #3                         ; =0x3
	mov	w14, #219                       ; =0xdb
	mov	w15, #2                         ; =0x2
	mov	w16, #1                         ; =0x1
	mov	w17, #101                       ; =0x65
	mov	w1, #-101                       ; =0xffffff9b
LBB1_10:                                ; =>This Inner Loop Header: Depth=1
	umulh	x2, x13, x8
	sub	x3, x13, x2
	add	x2, x2, x3, lsr #1
	lsr	x2, x2, #6
	umulh	x3, x10, x8
	sub	x4, x10, x3
	add	x3, x3, x4, lsr #1
	lsr	x3, x3, #6
	umulh	x4, x15, x8
	sub	x5, x15, x4
	add	x4, x4, x5, lsr #1
	lsr	x4, x4, #6
	umulh	x5, x16, x8
	sub	x6, x16, x5
	add	x5, x5, x6, lsr #1
	lsr	x5, x5, #6
	madd	w3, w3, w1, w10
	msub	w5, w5, w17, w10
	add	w5, w5, #1
	msub	w4, w4, w17, w10
	add	w4, w4, #2
	msub	w2, w2, w17, w10
	add	w2, w2, #3
	stp	w3, w5, [x11, #-8]
	stp	w4, w2, [x11], #16
	sub	x2, x14, #219
	sub	x3, x14, #146
	sub	x4, x14, #73
	lsr	x5, x10, #3
	eor	x2, x2, x5
	eor	x3, x3, x5
	eor	x4, x4, x5
	eor	x5, x14, x5
	udiv	x6, x2, x19
	msub	x2, x6, x19, x2
	udiv	x6, x3, x19
	msub	x3, x6, x19, x3
	udiv	x6, x4, x19
	msub	x4, x6, x19, x4
	udiv	x6, x5, x19
	msub	x5, x6, x19, x5
	stp	x2, x3, [x12, #-16]
	add	x10, x10, #4
	add	x13, x13, #4
	add	x14, x14, #292
	add	x15, x15, #4
	stp	x4, x5, [x12], #32
	add	x16, x16, #4
	cmp	x9, x10
	b.ne	LBB1_10
; %bb.11:
	cmp	x19, x9
	b.eq	LBB1_14
LBB1_12:
	mov	w10, #73                        ; =0x49
	mul	x10, x9, x10
	mov	w11, #-101                      ; =0xffffff9b
LBB1_13:                                ; =>This Inner Loop Header: Depth=1
	umulh	x12, x9, x8
	sub	x13, x9, x12
	add	x12, x12, x13, lsr #1
	lsr	x12, x12, #6
	madd	w12, w12, w11, w9
	str	w12, [x0, x9, lsl #2]
	eor	x12, x10, x9, lsr #3
	udiv	x13, x12, x19
	msub	x12, x13, x19, x12
	str	x12, [x20, x9, lsl #3]
	add	x9, x9, #1
	add	x10, x10, #73
	cmp	x19, x9
	b.ne	LBB1_13
LBB1_14:
	cmp	x19, #4
	b.hs	LBB1_16
; %bb.15:
	mov	x9, #0                          ; =0x0
	b	LBB1_19
LBB1_16:
	and	x9, x19, #0xfffffffffffffffc
	add	x10, x20, #16
	movi.4s	v0, #3
	mov	x11, x21
	mov	x12, x9
LBB1_17:                                ; =>This Inner Loop Header: Depth=1
	ldp	x13, x14, [x10, #-16]
	ldp	x15, x16, [x10], #32
	add	x14, x0, x14, lsl #2
	add	x15, x0, x15, lsl #2
	add	x16, x0, x16, lsl #2
	ldr	s1, [x0, x13, lsl #2]
	ld1.s	{ v1 }[1], [x14]
	ld1.s	{ v1 }[2], [x15]
	ld1.s	{ v1 }[3], [x16]
	movi.4s	v2, #1
	mla.4s	v2, v1, v0
	str	q2, [x11], #16
	subs	x12, x12, #4
	b.ne	LBB1_17
; %bb.18:
	cmp	x19, x9
	b.eq	LBB1_21
LBB1_19:
	sub	x10, x19, x9
	add	x11, x21, x9, lsl #2
	add	x9, x20, x9, lsl #3
LBB1_20:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x9], #8
	ldr	w12, [x0, x12, lsl #2]
	add	w12, w12, w12, lsl #1
	add	w12, w12, #1
	str	w12, [x11], #4
	subs	x10, x10, #1
	b.ne	LBB1_20
LBB1_21:
	mov	x10, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	mov	w11, #101                       ; =0x65
LBB1_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x20, x10, lsl #3]
	umulh	x13, x12, x8
	sub	x14, x12, x13
	add	x13, x13, x14, lsr #1
	lsr	x13, x13, #6
	msub	w12, w13, w11, w12
	add	w12, w12, w12, lsl #1
	add	w12, w12, #1
	ldr	w13, [x21, x10, lsl #2]
	cmp	w13, w12
	b.ne	LBB1_25
; %bb.23:                               ;   in Loop: Header=BB1_22 Depth=1
	add	x9, x9, w12, uxtw
	add	x10, x10, #1
	cmp	x19, x10
	b.ne	LBB1_22
; %bb.24:
	stp	x19, x9, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x19
	mov	w22, #0                         ; =0x0
	b	LBB1_26
LBB1_25:
	mov	w22, #4                         ; =0x4
LBB1_26:
	bl	_free
	mov	x0, x20
	bl	_free
	mov	x0, x21
	bl	_free
	mov	x0, x22
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS indirect_gather n=%zu checksum=%lld\n"

.subsections_via_symbols

	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB0_3
; %bb.1:
	cmp	x1, #3
	b.hi	LBB0_4
; %bb.2:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB0_13
LBB0_3:
	mov	w8, #0                          ; =0x0
	mov	x0, x8
	ret
LBB0_4:
	cmp	x1, #16
	b.hs	LBB0_6
; %bb.5:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB0_10
LBB0_6:
	and	x9, x1, #0xfffffffffffffff0
	add	x8, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x10, x9
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q4, q5, [x8, #-32]
	ldp	q6, q7, [x8], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	subs	x10, x10, #16
	b.ne	LBB0_7
; %bb.8:
	add.4s	v0, v1, v0
	add.4s	v0, v2, v0
	add.4s	v0, v3, v0
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x1, x9
	b.eq	LBB0_15
; %bb.9:
	tst	x1, #0xc
	b.eq	LBB0_13
LBB0_10:
	mov	x10, x9
	and	x9, x1, #0xfffffffffffffffc
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w8
	sub	x8, x10, x9
	add	x10, x0, x10, lsl #2
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	add.4s	v0, v1, v0
	adds	x8, x8, #4
	b.ne	LBB0_11
; %bb.12:
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x1, x9
	b.eq	LBB0_15
LBB0_13:
	sub	x10, x1, x9
	add	x9, x0, x9, lsl #2
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x9], #4
	add	w8, w11, w8
	subs	x10, x10, #1
	b.ne	LBB0_14
LBB0_15:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
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
	mov	w0, #2                          ; =0x2
	b	LBB1_37
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	lsl	x0, x19, #2
	bl	_malloc
	cbz	x0, LBB1_7
; %bb.5:
	cmp	x19, #4
	b.hs	LBB1_8
; %bb.6:
	mov	x8, #0                          ; =0x0
	b	LBB1_11
LBB1_7:
	mov	w0, #3                          ; =0x3
	b	LBB1_37
LBB1_8:
	mov	x9, #0                          ; =0x0
	and	x8, x19, #0xfffffffffffffffc
	add	x10, x0, #8
	mov	w11, #3                         ; =0x3
	mov	w12, #2                         ; =0x2
	mov	w13, #1                         ; =0x1
	mov	x14, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x14, #61681
	mov	x15, x8
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x16, x11, x14
	lsr	x16, x16, #4
	add	w16, w16, w16, lsl #4
	sub	w16, w11, w16
	umulh	x17, x12, x14
	lsr	x17, x17, #4
	add	w17, w17, w17, lsl #4
	sub	w17, w12, w17
	umulh	x1, x9, x14
	lsr	x1, x1, #4
	add	w1, w1, w1, lsl #4
	sub	w1, w9, w1
	umulh	x2, x13, x14
	lsr	x2, x2, #4
	add	w2, w2, w2, lsl #4
	sub	w2, w13, w2
	stp	w1, w2, [x10, #-8]
	add	x9, x9, #4
	add	x11, x11, #4
	stp	w17, w16, [x10], #16
	add	x12, x12, #4
	add	x13, x13, #4
	subs	x15, x15, #4
	b.ne	LBB1_9
; %bb.10:
	cmp	x19, x8
	b.eq	LBB1_13
LBB1_11:
	sub	x9, x19, x8
	add	x10, x0, x8, lsl #2
	mov	x11, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x11, #61681
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	umulh	x12, x8, x11
	lsr	x12, x12, #4
	add	w12, w12, w12, lsl #4
	sub	w12, w8, w12
	str	w12, [x10], #4
	add	x8, x8, #1
	subs	x9, x9, #1
	b.ne	LBB1_12
LBB1_13:
	cmp	x19, #3
	b.hi	LBB1_15
; %bb.14:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB1_24
LBB1_15:
	cmp	x19, #16
	b.hs	LBB1_17
; %bb.16:
	mov	x9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB1_21
LBB1_17:
	and	x9, x19, #0xfffffffffffffff0
	add	x8, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x10, x9
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB1_18:                                ; =>This Inner Loop Header: Depth=1
	ldp	q4, q5, [x8, #-32]
	ldp	q6, q7, [x8], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	subs	x10, x10, #16
	b.ne	LBB1_18
; %bb.19:
	add.4s	v0, v1, v0
	add.4s	v0, v2, v0
	add.4s	v0, v3, v0
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x19, x9
	b.eq	LBB1_26
; %bb.20:
	tst	x19, #0xc
	b.eq	LBB1_24
LBB1_21:
	mov	x10, x9
	and	x9, x19, #0xfffffffffffffffc
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w8
	sub	x8, x10, x9
	add	x10, x0, x10, lsl #2
LBB1_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	add.4s	v0, v1, v0
	adds	x8, x8, #4
	b.ne	LBB1_22
; %bb.23:
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x19, x9
	b.eq	LBB1_26
LBB1_24:
	sub	x10, x19, x9
	add	x9, x0, x9, lsl #2
LBB1_25:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x9], #4
	add	w8, w11, w8
	subs	x10, x10, #1
	b.ne	LBB1_25
LBB1_26:
	cmp	x19, #4
	b.hs	LBB1_28
; %bb.27:
	mov	x9, #0                          ; =0x0
	mov	w10, #0                         ; =0x0
	b	LBB1_31
LBB1_28:
	mov	x13, #0                         ; =0x0
	mov	w15, #0                         ; =0x0
	mov	w17, #0                         ; =0x0
	mov	w1, #0                          ; =0x0
	mov	w2, #0                          ; =0x0
	and	x9, x19, #0xfffffffffffffffc
	mov	w10, #-10                       ; =0xfffffff6
	mov	x16, #-1                        ; =0xffffffffffffffff
	mov	x14, #-2                        ; =0xfffffffffffffffe
	mov	x12, #-3                        ; =0xfffffffffffffffd
	mov	x11, #-4                        ; =0xfffffffffffffffc
	mov	w3, #3                          ; =0x3
	mov	w4, #2                          ; =0x2
	mov	w5, #1                          ; =0x1
	mov	x6, #-1085102592571150096       ; =0xf0f0f0f0f0f0f0f0
	movk	x6, #61681
LBB1_29:                                ; =>This Inner Loop Header: Depth=1
	umulh	x7, x3, x6
	lsr	x7, x7, #4
	add	w23, w7, w7, lsl #4
	umulh	x7, x4, x6
	lsr	x7, x7, #4
	add	w24, w7, w7, lsl #4
	umulh	x7, x5, x6
	lsr	x7, x7, #4
	add	w25, w7, w7, lsl #4
	umulh	x7, x13, x6
	lsr	x7, x7, #4
	add	w26, w7, w7, lsl #4
	mov	x7, x2
	mov	x20, x1
	mov	x21, x17
	mov	x22, x15
	add	w15, w13, w15
	sub	w15, w15, w26
	add	w17, w13, w17
	sub	w17, w17, w25
	add	w17, w17, #1
	add	w1, w13, w1
	sub	w1, w1, w24
	add	w1, w1, #2
	add	w2, w13, w2
	sub	w2, w2, w23
	add	w2, w2, #3
	add	x13, x13, #4
	add	w10, w10, #16
	add	x16, x16, #4
	add	x14, x14, #4
	add	x12, x12, #4
	add	x11, x11, #4
	add	x3, x3, #4
	add	x4, x4, #4
	add	x5, x5, #4
	cmp	x9, x13
	b.ne	LBB1_29
; %bb.30:
	add	w13, w21, w22
	add	w15, w20, w7
	add	w13, w13, w15
	mov	x15, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x15, #61681
	umulh	x16, x16, x15
	lsr	x16, x16, #4
	add	w16, w16, w16, lsl #4
	umulh	x14, x14, x15
	lsr	x14, x14, #4
	add	w14, w14, w14, lsl #4
	sub	w10, w10, w16
	sub	w10, w10, w14
	umulh	x12, x12, x15
	lsr	x12, x12, #4
	add	w12, w12, w12, lsl #4
	umulh	x11, x11, x15
	lsr	x11, x11, #4
	add	w11, w11, w11, lsl #4
	sub	w10, w10, w12
	sub	w10, w10, w11
	add	w10, w10, w13
	cmp	x19, x9
	b.eq	LBB1_34
LBB1_31:
	sub	x12, x19, x9
	sub	x11, x9, #1
	mov	x13, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x13, #61681
LBB1_32:                                ; =>This Inner Loop Header: Depth=1
	umulh	x14, x9, x13
	lsr	x14, x14, #4
	add	w15, w14, w14, lsl #4
	mov	x14, x10
	sub	w10, w9, w15
	add	w10, w14, w10
	add	x9, x9, #1
	add	x11, x11, #1
	subs	x12, x12, #1
	b.ne	LBB1_32
; %bb.33:
	mov	x9, #-1085102592571150096       ; =0xf0f0f0f0f0f0f0f0
	movk	x9, #61681
	umulh	x9, x11, x9
	lsr	x9, x9, #4
	add	w9, w9, w9, lsl #4
	sub	w9, w11, w9
	add	w10, w9, w14
LBB1_34:
	cmp	w8, w10
	b.ne	LBB1_36
; %bb.35:
	stp	x19, x8, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x19
	bl	_free
	mov	w0, #0                          ; =0x0
	b	LBB1_37
LBB1_36:
	mov	w0, #4                          ; =0x4
LBB1_37:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS reduction n=%zu checksum=%d\n"

.subsections_via_symbols

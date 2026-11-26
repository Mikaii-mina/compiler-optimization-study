	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cmp	x2, #3
	b.lo	LBB0_7
; %bb.1:
	sub	x10, x2, #2
	cmp	x10, #3
	b.hi	LBB0_8
; %bb.2:
	lsl	x8, x2, #2
	add	x9, x8, #4
	add	x10, x0, x9
	ldr	w11, [x0, #4]
	ldp	w12, w13, [x10]
	add	w11, w11, w12
	ldr	w12, [x10, x8]
	ldur	w10, [x10, #-4]
	add	w10, w12, w10
	add	w10, w11, w10
	add	w10, w10, w13
	str	w10, [x1, x9]
	cmp	x2, #3
	b.eq	LBB0_7
; %bb.3:
	add	x9, x8, #8
	add	x10, x0, x9
	ldr	w11, [x0, #8]
	ldp	w12, w13, [x10]
	add	w11, w11, w12
	ldr	w12, [x10, x8]
	ldur	w10, [x10, #-4]
	add	w10, w12, w10
	add	w10, w11, w10
	add	w10, w10, w13
	str	w10, [x1, x9]
	cmp	x2, #4
	b.eq	LBB0_5
; %bb.4:
	add	x9, x8, #12
	add	x10, x0, x9
	ldr	w11, [x0, #12]
	ldp	w12, w13, [x10]
	add	w11, w11, w12
	ldr	w8, [x10, x8]
	ldur	w10, [x10, #-4]
	add	w8, w8, w10
	add	w8, w11, w8
	add	w8, w8, w13
	str	w8, [x1, x9]
	cmp	x2, #3
	b.eq	LBB0_7
LBB0_5:
	lsl	x8, x2, #1
	mov	w9, #1                          ; =0x1
	bfi	x9, x2, #1, #62
	lsl	x10, x9, #2
	sub	x9, x9, x2
	ldr	w9, [x0, x9, lsl #2]
	add	x11, x0, x10
	ldp	w12, w13, [x11]
	add	w9, w9, w12
	ldr	w12, [x11, x2, lsl #2]
	ldur	w11, [x11, #-4]
	add	w11, w12, w11
	add	w9, w9, w11
	add	w9, w9, w13
	str	w9, [x1, x10]
	add	x9, x8, #2
	lsl	x10, x9, #2
	add	x11, x0, x10
	sub	x9, x9, x2
	ldr	w9, [x0, x9, lsl #2]
	ldp	w12, w13, [x11]
	add	w9, w9, w12
	ldr	w12, [x11, x2, lsl #2]
	ldur	w11, [x11, #-4]
	add	w11, w12, w11
	add	w9, w9, w11
	add	w9, w9, w13
	str	w9, [x1, x10]
	cmp	x2, #4
	b.eq	LBB0_7
; %bb.6:
	add	x8, x8, #3
	lsl	x9, x8, #2
	sub	x8, x8, x2
	ldr	w8, [x0, x8, lsl #2]
	add	x10, x0, x9
	ldp	w11, w12, [x10]
	add	w8, w8, w11
	ldr	w11, [x10, x2, lsl #2]
	ldur	w10, [x10, #-4]
	add	w10, w11, w10
	add	w8, w8, w10
	add	w8, w8, w12
	str	w8, [x1, x9]
	add	x8, x2, x2, lsl #1
	add	x9, x8, #1
	lsl	x10, x9, #2
	sub	x9, x9, x2
	ldr	w9, [x0, x9, lsl #2]
	add	x11, x0, x10
	ldp	w12, w13, [x11]
	add	w9, w9, w12
	ldr	w12, [x11, x2, lsl #2]
	ldur	w11, [x11, #-4]
	add	w11, w12, w11
	add	w9, w9, w11
	add	w9, w9, w13
	str	w9, [x1, x10]
	add	x9, x8, #2
	lsl	x10, x9, #2
	sub	x9, x9, x2
	ldr	w9, [x0, x9, lsl #2]
	add	x11, x0, x10
	ldp	w12, w13, [x11]
	add	w9, w9, w12
	ldr	w12, [x11, x2, lsl #2]
	ldur	w11, [x11, #-4]
	add	w11, w12, w11
	add	w9, w9, w11
	add	w9, w9, w13
	str	w9, [x1, x10]
	add	x8, x8, #3
	lsl	x9, x8, #2
	sub	x8, x8, x2
	ldr	w8, [x0, x8, lsl #2]
	add	x10, x0, x9
	ldp	w11, w12, [x10]
	add	w8, w8, w11
	ldr	w11, [x10, x2, lsl #2]
	ldur	w10, [x10, #-4]
	add	w10, w11, w10
	add	w8, w8, w10
	add	w8, w8, w12
	str	w8, [x1, x9]
LBB0_7:
	ret
LBB0_8:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 112
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	and	x8, x10, #0xfffffffffffffffc
	orr	x9, x8, #0x2
	cmp	x10, #16
	b.hs	LBB0_14
; %bb.9:
	cmp	x10, x8
	b.ne	LBB0_24
; %bb.10:
	lsl	x9, x2, #2
	add	x10, x1, #4
	add	x11, x0, #4
	lsl	x12, x2, #3
	mov	w13, #2                         ; =0x2
LBB0_11:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_12 Depth 2
	mov	x14, x11
	mov	x15, x10
	mov	x16, x8
LBB0_12:                                ;   Parent Loop BB0_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x17, x14, x9
	ldr	q0, [x17]
	ldr	q1, [x14]
	add.4s	v0, v1, v0
	ldr	q1, [x14, x12]
	ldur	q2, [x17, #-4]
	add.4s	v1, v1, v2
	add.4s	v0, v0, v1
	ldur	q1, [x17, #4]
	add.4s	v0, v0, v1
	str	q0, [x15, x9]
	add	x15, x15, #16
	add	x14, x14, #16
	subs	x16, x16, #4
	b.ne	LBB0_12
; %bb.13:                               ;   in Loop: Header=BB0_11 Depth=1
	add	x13, x13, #1
	add	x10, x10, x9
	add	x11, x11, x9
	cmp	x13, x2
	b.ne	LBB0_11
	b	LBB0_30
LBB0_14:
	mov	x11, #0                         ; =0x0
	and	x12, x10, #0xfffffffffffffff0
	orr	x13, x12, #0x2
	orr	x14, x12, #0x1
	and	x15, x10, #0xc
	orr	x16, x8, #0x1
	str	x16, [sp, #8]                   ; 8-byte Folded Spill
	lsl	x17, x2, #2
	add	x7, x17, x1
	add	x3, x7, #36
	lsl	x21, x2, #3
	add	x4, x21, x0
	add	x4, x4, #52
	add	x5, x0, x17
	lsl	x6, x10, #2
	and	x6, x6, #0xffffffffffffffc0
	add	x7, x7, #4
	add	x19, x0, #4
	sub	x20, x8, x12
	add	x21, x19, x21
	mov	w23, #1                         ; =0x1
	mov	w25, #2                         ; =0x2
	mov	x22, x5
	b	LBB0_16
LBB0_15:                                ;   in Loop: Header=BB0_16 Depth=1
	add	x25, x23, #1
	add	x11, x11, x17
	add	x7, x7, x17
	add	x19, x19, x17
	add	x21, x21, x17
	add	x22, x22, x17
	cmp	x25, x2
	b.eq	LBB0_30
LBB0_16:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_17 Depth 2
                                        ;     Child Loop BB0_21 Depth 2
                                        ;     Child Loop BB0_23 Depth 2
	mul	x24, x23, x2
	mov	x23, x25
	mov	x25, x12
	mov	x26, x11
LBB0_17:                                ;   Parent Loop BB0_16 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x27, x5, x26
	ldur	q0, [x27, #4]
	ldur	q1, [x27, #20]
	ldur	q2, [x27, #36]
	ldur	q3, [x27, #52]
	add	x28, x0, x26
	ldur	q4, [x28, #4]
	ldur	q5, [x28, #20]
	ldur	q6, [x28, #36]
	ldur	q7, [x28, #52]
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add	x28, x4, x26
	ldp	q4, q5, [x28, #-48]
	ldp	q6, q7, [x28, #-16]
	ldp	q16, q17, [x27]
	ldp	q18, q19, [x27, #32]
	add.4s	v4, v4, v16
	add.4s	v0, v0, v4
	add.4s	v4, v5, v17
	add.4s	v1, v1, v4
	add.4s	v4, v6, v18
	add.4s	v2, v2, v4
	add.4s	v4, v7, v19
	add.4s	v3, v3, v4
	ldur	q4, [x27, #8]
	ldur	q5, [x27, #24]
	ldur	q6, [x27, #40]
	ldur	q7, [x27, #56]
	add.4s	v0, v0, v4
	add.4s	v1, v1, v5
	add.4s	v2, v2, v6
	add.4s	v3, v3, v7
	add	x27, x3, x26
	stp	q0, q1, [x27, #-32]
	stp	q2, q3, [x27]
	add	x26, x26, #64
	subs	x25, x25, #16
	b.ne	LBB0_17
; %bb.18:                               ;   in Loop: Header=BB0_16 Depth=1
	cmp	x10, x12
	b.eq	LBB0_15
; %bb.19:                               ;   in Loop: Header=BB0_16 Depth=1
	mov	x25, x13
	mov	x26, x14
	cbz	x15, LBB0_23
; %bb.20:                               ;   in Loop: Header=BB0_16 Depth=1
	mov	x25, x22
	mov	x26, x21
	mov	x27, x20
	mov	x28, x19
	mov	x30, x7
LBB0_21:                                ;   Parent Loop BB0_16 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x16, x25, x6
	ldur	q0, [x16, #4]
	ldr	q1, [x28, x6]
	add.4s	v0, v1, v0
	ldr	q1, [x26, x6]
	ldr	q2, [x16]
	add.4s	v1, v1, v2
	add.4s	v0, v0, v1
	ldur	q1, [x16, #8]
	add.4s	v0, v0, v1
	str	q0, [x30, x6]
	add	x30, x30, #16
	add	x28, x28, #16
	add	x26, x26, #16
	add	x25, x25, #16
	subs	x27, x27, #4
	b.ne	LBB0_21
; %bb.22:                               ;   in Loop: Header=BB0_16 Depth=1
	mov	x25, x9
	ldr	x26, [sp, #8]                   ; 8-byte Folded Reload
	cmp	x10, x8
	b.eq	LBB0_15
LBB0_23:                                ;   Parent Loop BB0_16 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x16, x26, x24
	sub	x26, x16, x2
	lsl	x16, x16, #2
	add	x27, x0, x16
	ldr	w26, [x0, x26, lsl #2]
	ldp	w28, w30, [x27]
	add	w26, w26, w28
	ldr	w28, [x27, x2, lsl #2]
	ldur	w27, [x27, #-4]
	add	w27, w28, w27
	add	w26, w26, w27
	add	w26, w26, w30
	str	w26, [x1, x16]
	mov	x26, x25
	add	x25, x25, #1
	cmp	x2, x25
	b.ne	LBB0_23
	b	LBB0_15
LBB0_24:
	lsl	x11, x2, #2
	add	x12, x1, #4
	add	x13, x0, #4
	lsl	x14, x2, #3
	lsl	x10, x10, #2
	and	x10, x10, #0xfffffffffffffff0
	add	x17, x11, #4
	add	x15, x1, x17
	add	x16, x13, x14
	add	x17, x0, x17
	mov	w0, #2                          ; =0x2
LBB0_25:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_26 Depth 2
                                        ;     Child Loop BB0_28 Depth 2
	mov	x1, x13
	mov	x3, x12
	mov	x4, x8
LBB0_26:                                ;   Parent Loop BB0_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x5, x1, x11
	ldr	q0, [x5]
	ldr	q1, [x1]
	add.4s	v0, v1, v0
	ldr	q1, [x1, x14]
	ldur	q2, [x5, #-4]
	add.4s	v1, v1, v2
	add.4s	v0, v0, v1
	ldur	q1, [x5, #4]
	add.4s	v0, v0, v1
	str	q0, [x3, x11]
	add	x3, x3, #16
	add	x1, x1, #16
	subs	x4, x4, #4
	b.ne	LBB0_26
; %bb.27:                               ;   in Loop: Header=BB0_25 Depth=1
	mov	x1, x17
	mov	x3, x16
	mov	x4, x13
	mov	x5, x15
	mov	x6, x9
LBB0_28:                                ;   Parent Loop BB0_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w7, [x4, x10]
	add	x19, x1, x10
	ldp	w20, w21, [x19]
	add	w7, w7, w20
	ldr	w20, [x3, x10]
	ldur	w19, [x19, #-4]
	add	w19, w20, w19
	add	w7, w7, w19
	add	w7, w7, w21
	str	w7, [x5, x10]
	add	x6, x6, #1
	add	x5, x5, #4
	add	x4, x4, #4
	add	x3, x3, #4
	add	x1, x1, #4
	cmp	x2, x6
	b.ne	LBB0_28
; %bb.29:                               ;   in Loop: Header=BB0_25 Depth=1
	add	x0, x0, #1
	add	x12, x12, x11
	add	x13, x13, x11
	add	x15, x15, x11
	add	x16, x16, x11
	add	x17, x17, x11
	cmp	x0, x2
	b.ne	LBB0_25
LBB0_30:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	cmp	w0, #2
	b.lt	LBB1_3
; %bb.1:
	ldr	x0, [x1, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoul
	mov	x20, x0
	sub	x8, x0, #1025
	cmn	x8, #1022
	b.hs	LBB1_4
; %bb.2:
	mov	w20, #2                         ; =0x2
	b	LBB1_35
LBB1_3:
	mov	w20, #256                       ; =0x100
LBB1_4:
	mul	x21, x20, x20
	lsl	x0, x21, #2
	bl	_malloc
	mov	x22, x0
	mov	x0, x21
	mov	w1, #4                          ; =0x4
	bl	_calloc
	mov	x19, x0
	mov	x0, x22
	cmp	x22, #0
	ccmp	x19, #0, #4, ne
	b.ne	LBB1_6
; %bb.5:
	mov	w20, #3                         ; =0x3
	b	LBB1_34
LBB1_6:
	mov	x10, #0                         ; =0x0
	and	x9, x21, #0x7ffffffffffffffc
	add	x11, x0, #8
	mov	w12, #3                         ; =0x3
	mov	w13, #2                         ; =0x2
	mov	w14, #1                         ; =0x1
	mov	x8, #20165                      ; =0x4ec5
	movk	x8, #50412, lsl #16
	movk	x8, #60494, lsl #32
	movk	x8, #20164, lsl #48
	mov	w15, #13                        ; =0xd
	mov	x16, x9
LBB1_7:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x17, x12, x8
	lsr	x17, x17, #2
	msub	w17, w17, w15, w12
	umulh	x1, x13, x8
	lsr	x1, x1, #2
	msub	w1, w1, w15, w13
	umulh	x2, x10, x8
	lsr	x2, x2, #2
	msub	w2, w2, w15, w10
	umulh	x3, x14, x8
	lsr	x3, x3, #2
	msub	w3, w3, w15, w14
	stp	w2, w3, [x11, #-8]
	add	x10, x10, #4
	add	x12, x12, #4
	stp	w1, w17, [x11], #16
	add	x13, x13, #4
	add	x14, x14, #4
	subs	x16, x16, #4
	b.ne	LBB1_7
; %bb.8:
	subs	x10, x21, x9
	b.eq	LBB1_11
; %bb.9:
	lsr	x11, x21, #2
	add	x11, x0, x11, lsl #4
	mov	w12, #13                        ; =0xd
LBB1_10:                                ; =>This Inner Loop Header: Depth=1
	umulh	x13, x9, x8
	lsr	x13, x13, #2
	msub	w13, w13, w12, w9
	str	w13, [x11], #4
	add	x9, x9, #1
	subs	x10, x10, #1
	b.ne	LBB1_10
LBB1_11:
	sub	x10, x20, #2
	lsl	x9, x20, #2
	cmp	x10, #4
	b.hs	LBB1_36
; %bb.12:
	mov	x11, #0                         ; =0x0
	add	x14, x9, #4
	add	x12, x19, x14
	add	x13, x0, #4
	add	x14, x0, x14
	add	x15, x13, x20, lsl #3
	mov	w16, #2                         ; =0x2
LBB1_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_14 Depth 2
	mov	x17, x11
	mov	x1, x10
LBB1_14:                                ;   Parent Loop BB1_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x2, x14, x17
	ldr	w3, [x13, x17]
	ldp	w4, w5, [x2]
	add	w3, w3, w4
	ldr	w4, [x15, x17]
	ldur	w2, [x2, #-4]
	add	w2, w4, w2
	add	w2, w3, w2
	add	w2, w2, w5
	str	w2, [x12, x17]
	add	x17, x17, #4
	subs	x1, x1, #1
	b.ne	LBB1_14
; %bb.15:                               ;   in Loop: Header=BB1_13 Depth=1
	add	x16, x16, #1
	add	x11, x11, x9
	cmp	x16, x20
	b.ne	LBB1_13
LBB1_16:
	mov	x11, #0                         ; =0x0
	mov	x12, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	sub	x13, x20, #1
	add	x14, x20, #1
	mov	w15, #1                         ; =0x1
	sub	x16, x15, x20
	mov	w17, #5                         ; =0x5
	mov	w1, #2                          ; =0x2
	mov	w2, #13                         ; =0xd
	mov	x3, x19
	add	w4, w20, w20, lsl #2
LBB1_17:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_22 Depth 2
                                        ;     Child Loop BB1_26 Depth 2
                                        ;     Child Loop BB1_29 Depth 2
	mov	x5, x20
	cbz	x12, LBB1_28
; %bb.18:                               ;   in Loop: Header=BB1_17 Depth=1
	mov	x6, x3
	cmp	x12, x13
	b.hs	LBB1_22
; %bb.19:                               ;   in Loop: Header=BB1_17 Depth=1
	mul	x5, x12, x20
	ldr	w5, [x19, x5, lsl #2]
	cbnz	w5, LBB1_33
; %bb.20:                               ;   in Loop: Header=BB1_17 Depth=1
	cmp	x20, #1
	b.eq	LBB1_31
; %bb.21:                               ;   in Loop: Header=BB1_17 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x6, x11
	mov	x7, x15
	mov	x21, x1
	mov	x22, x16
	mov	x23, x14
	mov	x24, x17
	b	LBB1_26
LBB1_22:                                ;   Parent Loop BB1_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w7, [x6], #4
	cbnz	w7, LBB1_33
; %bb.23:                               ;   in Loop: Header=BB1_22 Depth=2
	subs	x5, x5, #1
	b.ne	LBB1_22
	b	LBB1_31
LBB1_24:                                ;   in Loop: Header=BB1_26 Depth=2
	mov	w25, #0                         ; =0x0
	add	x26, x3, x5, lsl #2
	ldr	w26, [x26, #4]
	cmp	w26, w25
	b.ne	LBB1_33
LBB1_25:                                ;   in Loop: Header=BB1_26 Depth=2
	add	x10, x10, w25, uxtw
	add	w24, w24, #5
	add	x23, x23, #1
	add	x22, x22, #1
	add	x21, x21, #1
	add	x7, x7, #1
	add	x6, x6, #1
	add	x5, x5, #1
	cmp	x13, x5
	b.eq	LBB1_31
LBB1_26:                                ;   Parent Loop BB1_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x25, x5, #2
	cmp	x25, x20
	b.hs	LBB1_24
; %bb.27:                               ;   in Loop: Header=BB1_26 Depth=2
	umulh	x25, x23, x8
	lsr	x25, x25, #2
	msub	w25, w25, w2, w24
	umulh	x26, x22, x8
	lsr	x26, x26, #2
	msub	w25, w26, w2, w25
	umulh	x26, x21, x8
	lsr	x26, x26, #2
	msub	w25, w26, w2, w25
	umulh	x26, x7, x8
	lsr	x26, x26, #2
	msub	w25, w26, w2, w25
	umulh	x26, x6, x8
	lsr	x26, x26, #2
	msub	w25, w26, w2, w25
	add	x26, x3, x5, lsl #2
	ldr	w26, [x26, #4]
	cmp	w26, w25
	b.eq	LBB1_25
	b	LBB1_33
LBB1_28:                                ;   in Loop: Header=BB1_17 Depth=1
	mov	x6, x19
LBB1_29:                                ;   Parent Loop BB1_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w7, [x6], #4
	cbnz	w7, LBB1_33
; %bb.30:                               ;   in Loop: Header=BB1_29 Depth=2
	subs	x5, x5, #1
	b.ne	LBB1_29
LBB1_31:                                ;   in Loop: Header=BB1_17 Depth=1
	add	x12, x12, #1
	add	x3, x3, x9
	add	w17, w17, w4
	add	x14, x14, x20
	add	x16, x16, x20
	add	x1, x1, x20
	add	x15, x15, x20
	add	x11, x11, x20
	cmp	x12, x20
	b.ne	LBB1_17
; %bb.32:
	stp	x20, x10, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x20, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x20
	mov	w20, #0                         ; =0x0
	b	LBB1_34
LBB1_33:
	mov	w20, #4                         ; =0x4
LBB1_34:
	bl	_free
	mov	x0, x19
	bl	_free
LBB1_35:
	mov	x0, x20
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB1_36:
	mov	x11, #0                         ; =0x0
	and	x12, x10, #0xfffffffffffffff0
	and	x13, x10, #0xc
	and	x14, x10, #0xfffffffffffffffc
	add	x15, x9, x19
	add	x15, x15, #36
	lsl	x4, x20, #3
	add	x16, x4, x0
	add	x16, x16, #52
	add	x17, x0, x9
	add	x1, x20, #1
	neg	x2, x14
	add	x3, x0, #4
	add	x4, x3, x4
	mov	w5, #2                          ; =0x2
	mov	w6, #1                          ; =0x1
	b	LBB1_38
LBB1_37:                                ;   in Loop: Header=BB1_38 Depth=1
	add	x5, x5, #1
	add	x11, x11, x9
	add	x1, x1, x20
	add	x6, x6, x20
	add	x3, x3, x9
	add	x4, x4, x9
	cmp	x5, x20
	b.eq	LBB1_16
LBB1_38:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_41 Depth 2
                                        ;     Child Loop BB1_45 Depth 2
                                        ;     Child Loop BB1_48 Depth 2
	cmp	x10, #16
	b.hs	LBB1_40
; %bb.39:                               ;   in Loop: Header=BB1_38 Depth=1
	mov	x22, #0                         ; =0x0
	b	LBB1_44
LBB1_40:                                ;   in Loop: Header=BB1_38 Depth=1
	mov	x7, x11
	mov	x21, x12
LBB1_41:                                ;   Parent Loop BB1_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x22, x17, x7
	ldur	q0, [x22, #4]
	ldur	q1, [x22, #20]
	ldur	q2, [x22, #36]
	ldur	q3, [x22, #52]
	add	x23, x0, x7
	ldur	q4, [x23, #4]
	ldur	q5, [x23, #20]
	ldur	q6, [x23, #36]
	ldur	q7, [x23, #52]
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add	x23, x16, x7
	ldp	q4, q5, [x23, #-48]
	ldp	q6, q7, [x23, #-16]
	ldp	q16, q17, [x22]
	ldp	q18, q19, [x22, #32]
	add.4s	v4, v4, v16
	add.4s	v0, v0, v4
	add.4s	v4, v5, v17
	add.4s	v1, v1, v4
	add.4s	v4, v6, v18
	add.4s	v2, v2, v4
	add.4s	v4, v7, v19
	add.4s	v3, v3, v4
	ldur	q4, [x22, #8]
	ldur	q5, [x22, #24]
	ldur	q6, [x22, #40]
	ldur	q7, [x22, #56]
	add.4s	v0, v0, v4
	add.4s	v1, v1, v5
	add.4s	v2, v2, v6
	add.4s	v3, v3, v7
	add	x22, x15, x7
	stp	q0, q1, [x22, #-32]
	stp	q2, q3, [x22]
	add	x7, x7, #64
	subs	x21, x21, #16
	b.ne	LBB1_41
; %bb.42:                               ;   in Loop: Header=BB1_38 Depth=1
	cmp	x10, x12
	b.eq	LBB1_37
; %bb.43:                               ;   in Loop: Header=BB1_38 Depth=1
	mov	x22, x12
	mov	x23, x12
	cbz	x13, LBB1_47
LBB1_44:                                ;   in Loop: Header=BB1_38 Depth=1
	add	x7, x22, x1
	lsl	x23, x7, #2
	add	x7, x19, x23
	add	x21, x22, x6
	add	x21, x0, x21, lsl #2
	add	x22, x2, x22
	add	x23, x0, x23
LBB1_45:                                ;   Parent Loop BB1_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q0, [x23]
	ldr	q1, [x21], #16
	add.4s	v0, v1, v0
	ldr	q1, [x23, x9]
	ldur	q2, [x23, #-4]
	add.4s	v1, v1, v2
	ldur	q2, [x23, #4]
	add.4s	v0, v0, v2
	add.4s	v0, v0, v1
	str	q0, [x7], #16
	add	x23, x23, #16
	adds	x22, x22, #4
	b.ne	LBB1_45
; %bb.46:                               ;   in Loop: Header=BB1_38 Depth=1
	mov	x23, x14
	cmp	x10, x14
	b.eq	LBB1_37
LBB1_47:                                ;   in Loop: Header=BB1_38 Depth=1
	mov	x7, #0                          ; =0x0
	add	x21, x23, x1
	lsl	x24, x21, #2
	add	x21, x19, x24
	lsl	x25, x23, #2
	add	x22, x3, x25
	sub	x23, x10, x23
	add	x24, x0, x24
	add	x25, x4, x25
LBB1_48:                                ;   Parent Loop BB1_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x26, x24, x7
	ldr	w27, [x22, x7]
	ldp	w28, w30, [x26]
	add	w27, w27, w28
	ldr	w28, [x25, x7]
	ldur	w26, [x26, #-4]
	add	w26, w28, w26
	add	w26, w27, w26
	add	w26, w26, w30
	str	w26, [x21, x7]
	add	x7, x7, #4
	subs	x23, x23, #1
	b.ne	LBB1_48
	b	LBB1_37
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS stencil side=%zu checksum=%lld\n"

.subsections_via_symbols

	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cmp	x2, #3
	b.lo	LBB0_17
; %bb.1:
	stp	x28, x27, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	mov	x8, #0                          ; =0x0
	sub	x9, x2, #2
	and	x10, x9, #0xfffffffffffffff0
	orr	x11, x10, #0x2
	orr	x12, x10, #0x1
	and	x13, x9, #0xc
	and	x14, x9, #0xfffffffffffffffc
	orr	x15, x14, #0x2
	orr	x16, x14, #0x1
	lsl	x17, x2, #2
	add	x3, x17, x1
	add	x3, x3, #36
	add	x4, x0, x2, lsl #3
	add	x4, x4, #52
	add	x5, x0, x17
	add	x6, x2, #1
	neg	x7, x14
	mov	w22, #2                         ; =0x2
	mov	w19, #1                         ; =0x1
	mov	w20, #1                         ; =0x1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x22, x20, #1
	add	x8, x8, x17
	add	x6, x6, x2
	add	x19, x19, x2
	cmp	x22, x2
	b.eq	LBB0_16
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_8 Depth 2
                                        ;     Child Loop BB0_12 Depth 2
                                        ;     Child Loop BB0_15 Depth 2
	mov	x21, x20
	mov	x20, x22
	cmp	x9, #3
	b.hi	LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	w22, #2                         ; =0x2
	mov	w23, #1                         ; =0x1
	b	LBB0_14
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	x9, #16
	b.hs	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x24, #0                         ; =0x0
	b	LBB0_11
LBB0_7:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	x22, x8
	mov	x23, x10
LBB0_8:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x24, x5, x22
	ldur	q0, [x24, #4]
	ldur	q1, [x24, #20]
	ldur	q2, [x24, #36]
	ldur	q3, [x24, #52]
	add	x25, x0, x22
	ldur	q4, [x25, #4]
	ldur	q5, [x25, #20]
	ldur	q6, [x25, #36]
	ldur	q7, [x25, #52]
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add	x25, x4, x22
	ldp	q4, q5, [x25, #-48]
	ldp	q6, q7, [x25, #-16]
	ldp	q16, q17, [x24]
	ldp	q18, q19, [x24, #32]
	add.4s	v4, v4, v16
	add.4s	v0, v0, v4
	add.4s	v4, v5, v17
	add.4s	v1, v1, v4
	add.4s	v4, v6, v18
	add.4s	v2, v2, v4
	add.4s	v4, v7, v19
	add.4s	v3, v3, v4
	ldur	q4, [x24, #8]
	ldur	q5, [x24, #24]
	ldur	q6, [x24, #40]
	ldur	q7, [x24, #56]
	add.4s	v0, v0, v4
	add.4s	v1, v1, v5
	add.4s	v2, v2, v6
	add.4s	v3, v3, v7
	add	x24, x3, x22
	stp	q0, q1, [x24, #-32]
	stp	q2, q3, [x24]
	add	x22, x22, #64
	subs	x23, x23, #16
	b.ne	LBB0_8
; %bb.9:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	x9, x10
	b.eq	LBB0_2
; %bb.10:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x22, x11
	mov	x23, x12
	mov	x24, x10
	cbz	x13, LBB0_14
LBB0_11:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x22, x24, x6
	lsl	x25, x22, #2
	add	x22, x1, x25
	add	x23, x24, x19
	add	x23, x0, x23, lsl #2
	add	x24, x7, x24
	add	x25, x0, x25
LBB0_12:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q0, [x25]
	ldr	q1, [x23], #16
	add.4s	v0, v1, v0
	ldr	q1, [x25, x17]
	ldur	q2, [x25, #-4]
	add.4s	v1, v1, v2
	ldur	q2, [x25, #4]
	add.4s	v0, v0, v2
	add.4s	v0, v0, v1
	str	q0, [x22], #16
	add	x25, x25, #16
	adds	x24, x24, #4
	b.ne	LBB0_12
; %bb.13:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	x22, x15
	mov	x23, x16
	cmp	x9, x14
	b.eq	LBB0_2
LBB0_14:                                ;   in Loop: Header=BB0_3 Depth=1
	mul	x21, x21, x2
LBB0_15:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x23, x23, x21
	sub	x24, x23, x2
	lsl	x23, x23, #2
	add	x25, x0, x23
	ldr	w24, [x0, x24, lsl #2]
	ldp	w26, w27, [x25]
	add	w24, w24, w26
	ldr	w26, [x25, x2, lsl #2]
	ldur	w25, [x25, #-4]
	add	w25, w26, w25
	add	w24, w24, w25
	add	w24, w24, w27
	str	w24, [x1, x23]
	mov	x23, x22
	add	x22, x22, #1
	cmp	x2, x22
	b.ne	LBB0_15
	b	LBB0_2
LBB0_16:
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #80             ; 16-byte Folded Reload
LBB0_17:
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
	b	LBB1_41
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
	b	LBB1_40
LBB1_6:
	mov	x8, #20165                      ; =0x4ec5
	movk	x8, #50412, lsl #16
	movk	x8, #60494, lsl #32
	movk	x8, #20164, lsl #48
	cmp	x21, #4
	b.hs	LBB1_8
; %bb.7:
	mov	x9, #0                          ; =0x0
	b	LBB1_11
LBB1_8:
	mov	x10, #0                         ; =0x0
	and	x9, x21, #0x7ffffffffffffffc
	add	x11, x0, #8
	mov	w12, #3                         ; =0x3
	mov	w13, #2                         ; =0x2
	mov	w14, #1                         ; =0x1
	mov	w15, #13                        ; =0xd
	mov	x16, x9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x17, x12, x8
	lsr	x17, x17, #2
	msub	w17, w17, w15, w12
	umulh	x1, x10, x8
	lsr	x1, x1, #2
	msub	w1, w1, w15, w10
	umulh	x2, x13, x8
	lsr	x2, x2, #2
	msub	w2, w2, w15, w13
	umulh	x3, x14, x8
	lsr	x3, x3, #2
	msub	w3, w3, w15, w14
	stp	w1, w3, [x11, #-8]
	add	x10, x10, #4
	add	x12, x12, #4
	stp	w2, w17, [x11], #16
	add	x13, x13, #4
	add	x14, x14, #4
	subs	x16, x16, #4
	b.ne	LBB1_9
; %bb.10:
	cmp	x21, x9
	b.eq	LBB1_13
LBB1_11:
	sub	x10, x21, x9
	add	x11, x0, x9, lsl #2
	mov	w12, #13                        ; =0xd
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	umulh	x13, x9, x8
	lsr	x13, x13, #2
	msub	w13, w13, w12, w9
	str	w13, [x11], #4
	add	x9, x9, #1
	subs	x10, x10, #1
	b.ne	LBB1_12
LBB1_13:
	mov	x10, #0                         ; =0x0
	sub	x11, x20, #2
	and	x12, x11, #0xfffffffffffffff0
	orr	x13, x12, #0x2
	orr	x14, x12, #0x1
	and	x15, x11, #0xc
	and	x16, x11, #0xfffffffffffffffc
	orr	x17, x16, #0x2
	orr	x1, x16, #0x1
	lsl	x9, x20, #2
	add	x2, x9, x19
	add	x2, x2, #36
	add	x3, x0, x20, lsl #3
	add	x3, x3, #52
	add	x4, x0, x9
	add	x5, x20, #1
	neg	x6, x16
	mov	w23, #2                         ; =0x2
	mov	w7, #1                          ; =0x1
	mov	w21, #1                         ; =0x1
	b	LBB1_15
LBB1_14:                                ;   in Loop: Header=BB1_15 Depth=1
	add	x23, x21, #1
	add	x10, x10, x9
	add	x5, x5, x20
	add	x7, x7, x20
	cmp	x23, x20
	b.eq	LBB1_28
LBB1_15:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_20 Depth 2
                                        ;     Child Loop BB1_24 Depth 2
                                        ;     Child Loop BB1_27 Depth 2
	mov	x22, x21
	mov	x21, x23
	cmp	x11, #4
	b.hs	LBB1_17
; %bb.16:                               ;   in Loop: Header=BB1_15 Depth=1
	mov	w23, #2                         ; =0x2
	mov	w24, #1                         ; =0x1
	b	LBB1_26
LBB1_17:                                ;   in Loop: Header=BB1_15 Depth=1
	cmp	x11, #16
	b.hs	LBB1_19
; %bb.18:                               ;   in Loop: Header=BB1_15 Depth=1
	mov	x25, #0                         ; =0x0
	b	LBB1_23
LBB1_19:                                ;   in Loop: Header=BB1_15 Depth=1
	mov	x23, x10
	mov	x24, x12
LBB1_20:                                ;   Parent Loop BB1_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x25, x4, x23
	ldur	q0, [x25, #4]
	ldur	q1, [x25, #20]
	ldur	q2, [x25, #36]
	ldur	q3, [x25, #52]
	add	x26, x0, x23
	ldur	q4, [x26, #4]
	ldur	q5, [x26, #20]
	ldur	q6, [x26, #36]
	ldur	q7, [x26, #52]
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add	x26, x3, x23
	ldp	q4, q5, [x26, #-48]
	ldp	q6, q7, [x26, #-16]
	ldp	q16, q17, [x25]
	ldp	q18, q19, [x25, #32]
	add.4s	v4, v4, v16
	add.4s	v0, v0, v4
	add.4s	v4, v5, v17
	add.4s	v1, v1, v4
	add.4s	v4, v6, v18
	add.4s	v2, v2, v4
	add.4s	v4, v7, v19
	add.4s	v3, v3, v4
	ldur	q4, [x25, #8]
	ldur	q5, [x25, #24]
	ldur	q6, [x25, #40]
	ldur	q7, [x25, #56]
	add.4s	v0, v0, v4
	add.4s	v1, v1, v5
	add.4s	v2, v2, v6
	add.4s	v3, v3, v7
	add	x25, x2, x23
	stp	q0, q1, [x25, #-32]
	stp	q2, q3, [x25]
	add	x23, x23, #64
	subs	x24, x24, #16
	b.ne	LBB1_20
; %bb.21:                               ;   in Loop: Header=BB1_15 Depth=1
	cmp	x11, x12
	b.eq	LBB1_14
; %bb.22:                               ;   in Loop: Header=BB1_15 Depth=1
	mov	x25, x12
	mov	x23, x13
	mov	x24, x14
	cbz	x15, LBB1_26
LBB1_23:                                ;   in Loop: Header=BB1_15 Depth=1
	add	x23, x25, x5
	lsl	x26, x23, #2
	add	x23, x19, x26
	add	x24, x25, x7
	add	x24, x0, x24, lsl #2
	add	x25, x6, x25
	add	x26, x0, x26
LBB1_24:                                ;   Parent Loop BB1_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	q0, [x26]
	ldr	q1, [x24], #16
	add.4s	v0, v1, v0
	ldr	q1, [x26, x9]
	ldur	q2, [x26, #-4]
	add.4s	v1, v1, v2
	ldur	q2, [x26, #4]
	add.4s	v0, v0, v2
	add.4s	v0, v0, v1
	str	q0, [x23], #16
	add	x26, x26, #16
	adds	x25, x25, #4
	b.ne	LBB1_24
; %bb.25:                               ;   in Loop: Header=BB1_15 Depth=1
	mov	x23, x17
	mov	x24, x1
	cmp	x11, x16
	b.eq	LBB1_14
LBB1_26:                                ;   in Loop: Header=BB1_15 Depth=1
	mul	x22, x22, x20
LBB1_27:                                ;   Parent Loop BB1_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x24, x24, x22
	sub	x25, x24, x20
	lsl	x24, x24, #2
	add	x26, x0, x24
	ldr	w25, [x0, x25, lsl #2]
	ldp	w27, w28, [x26]
	add	w25, w25, w27
	ldr	w27, [x26, x20, lsl #2]
	ldur	w26, [x26, #-4]
	add	w26, w27, w26
	add	w25, w25, w26
	add	w25, w25, w28
	str	w25, [x19, x24]
	mov	x24, x23
	add	x23, x23, #1
	cmp	x20, x23
	b.ne	LBB1_27
	b	LBB1_14
LBB1_28:
	mov	x11, #0                         ; =0x0
	mov	x12, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	sub	x13, x20, #1
	add	x14, x20, #1
	mov	w15, #1                         ; =0x1
	sub	x16, x15, x20
	add	x17, x19, #4
	mov	w1, #5                          ; =0x5
	mov	w2, #2                          ; =0x2
	mov	w3, #13                         ; =0xd
	add	w4, w20, w20, lsl #2
	b	LBB1_30
LBB1_29:                                ;   in Loop: Header=BB1_30 Depth=1
	add	x12, x12, #1
	add	w1, w1, w4
	add	x14, x14, x20
	add	x16, x16, x20
	add	x2, x2, x20
	add	x15, x15, x20
	add	x11, x11, x20
	add	x17, x17, x9
	cmp	x12, x20
	b.eq	LBB1_42
LBB1_30:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_33 Depth 2
	mul	x5, x12, x20
	ldr	w5, [x19, x5, lsl #2]
	cbnz	w5, LBB1_39
; %bb.31:                               ;   in Loop: Header=BB1_30 Depth=1
	cmp	x20, #1
	b.eq	LBB1_29
; %bb.32:                               ;   in Loop: Header=BB1_30 Depth=1
	mov	x5, #0                          ; =0x0
	mov	x6, x11
	mov	x7, x15
	mov	x21, x2
	mov	x22, x16
	mov	x23, x14
	mov	x24, x1
LBB1_33:                                ;   Parent Loop BB1_30 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w25, #0                         ; =0x0
	cbz	x12, LBB1_37
; %bb.34:                               ;   in Loop: Header=BB1_33 Depth=2
	cmp	x12, x13
	b.hs	LBB1_37
; %bb.35:                               ;   in Loop: Header=BB1_33 Depth=2
	add	x26, x5, #2
	cmp	x26, x20
	b.hs	LBB1_37
; %bb.36:                               ;   in Loop: Header=BB1_33 Depth=2
	umulh	x25, x23, x8
	lsr	x25, x25, #2
	msub	w25, w25, w3, w24
	umulh	x26, x22, x8
	lsr	x26, x26, #2
	msub	w25, w26, w3, w25
	umulh	x26, x21, x8
	lsr	x26, x26, #2
	msub	w25, w26, w3, w25
	umulh	x26, x7, x8
	lsr	x26, x26, #2
	msub	w25, w26, w3, w25
	umulh	x26, x6, x8
	lsr	x26, x26, #2
	msub	w25, w26, w3, w25
LBB1_37:                                ;   in Loop: Header=BB1_33 Depth=2
	ldr	w26, [x17, x5, lsl #2]
	cmp	w26, w25
	b.ne	LBB1_39
; %bb.38:                               ;   in Loop: Header=BB1_33 Depth=2
	add	x10, x10, w25, uxtw
	add	x5, x5, #1
	add	w24, w24, #5
	add	x23, x23, #1
	add	x22, x22, #1
	add	x21, x21, #1
	add	x7, x7, #1
	add	x6, x6, #1
	cmp	x13, x5
	b.ne	LBB1_33
	b	LBB1_29
LBB1_39:
	mov	w20, #4                         ; =0x4
LBB1_40:
	bl	_free
	mov	x0, x19
	bl	_free
LBB1_41:
	mov	x0, x20
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB1_42:
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
	b	LBB1_40
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS stencil side=%zu checksum=%lld\n"

.subsections_via_symbols

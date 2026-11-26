	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x3, LBB0_14
; %bb.1:
	cmp	x3, #3
	b.hi	LBB0_3
; %bb.2:
	mov	x8, #0                          ; =0x0
	b	LBB0_12
LBB0_3:
	cmp	x3, #16
	b.hs	LBB0_5
; %bb.4:
	mov	x8, #0                          ; =0x0
	b	LBB0_9
LBB0_5:
	and	x8, x3, #0xfffffffffffffff0
	add	x9, x0, #32
	add	x10, x1, #32
	add	x11, x2, #32
	mov	x12, x8
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x9, #-32]
	ldp	q2, q3, [x9], #64
	ldp	q4, q5, [x10, #-32]
	ldp	q6, q7, [x10], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	stp	q0, q1, [x11, #-32]
	stp	q2, q3, [x11], #64
	subs	x12, x12, #16
	b.ne	LBB0_6
; %bb.7:
	cmp	x3, x8
	b.eq	LBB0_14
; %bb.8:
	tst	x3, #0xc
	b.eq	LBB0_12
LBB0_9:
	mov	x10, x8
	and	x8, x3, #0xfffffffffffffffc
	sub	x9, x10, x8
	lsl	x12, x10, #2
	add	x10, x2, x12
	add	x11, x1, x12
	add	x12, x0, x12
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x12], #16
	ldr	q1, [x11], #16
	add.4s	v0, v1, v0
	str	q0, [x10], #16
	adds	x9, x9, #4
	b.ne	LBB0_10
; %bb.11:
	cmp	x3, x8
	b.eq	LBB0_14
LBB0_12:
	sub	x9, x3, x8
	lsl	x11, x8, #2
	add	x8, x2, x11
	add	x10, x1, x11
	add	x11, x0, x11
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x11], #4
	ldr	w13, [x10], #4
	add	w12, w13, w12
	str	w12, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB0_13
LBB0_14:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
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
	mov	w8, #2                          ; =0x2
	b	LBB1_32
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	lsl	x22, x19, #2
	mov	x0, x22
	bl	_malloc
	mov	x20, x0
	mov	x0, x22
	bl	_malloc
	mov	x21, x0
	mov	x0, x22
	bl	_malloc
	mov	w8, #3                          ; =0x3
	cbz	x20, LBB1_32
; %bb.5:
	cbz	x21, LBB1_32
; %bb.6:
	cbz	x0, LBB1_32
; %bb.7:
	mov	x8, #16913                      ; =0x4211
	movk	x8, #8456, lsl #16
	movk	x8, #4228, lsl #32
	movk	x8, #2114, lsl #48
	mov	x9, #20945                      ; =0x51d1
	movk	x9, #12161, lsl #16
	movk	x9, #32430, lsl #32
	movk	x9, #20944, lsl #48
	cmp	x19, #4
	b.hs	LBB1_9
; %bb.8:
	mov	x10, #0                         ; =0x0
	b	LBB1_12
LBB1_9:
	mov	x11, #0                         ; =0x0
	and	x10, x19, #0xfffffffffffffffc
	add	x12, x20, #8
	add	x13, x21, #8
	mov	w14, #3                         ; =0x3
	mov	w15, #2                         ; =0x2
	mov	w16, #1                         ; =0x1
	mov	w17, #97                        ; =0x61
	mov	w1, #-97                        ; =0xffffff9f
LBB1_10:                                ; =>This Inner Loop Header: Depth=1
	umulh	x2, x14, x9
	sub	x3, x14, x2
	add	x2, x2, x3, lsr #1
	umulh	x3, x14, x8
	sub	x4, x14, x3
	add	x3, x3, x4, lsr #1
	umulh	x4, x11, x9
	sub	x5, x11, x4
	add	x4, x4, x5, lsr #1
	umulh	x5, x15, x9
	sub	x6, x15, x5
	add	x5, x5, x6, lsr #1
	umulh	x6, x15, x8
	sub	x7, x15, x6
	add	x6, x6, x7, lsr #1
	umulh	x7, x11, x8
	sub	x22, x11, x7
	add	x7, x7, x22, lsr #1
	lsr	x7, x7, #4
	sub	w7, w7, w7, lsl #5
	umulh	x22, x16, x9
	sub	x23, x16, x22
	add	x22, x22, x23, lsr #1
	umulh	x23, x16, x8
	sub	x24, x16, x23
	add	x23, x23, x24, lsr #1
	lsr	x2, x2, #6
	lsr	x3, x3, #4
	lsr	x4, x4, #6
	lsr	x5, x5, #6
	lsr	x6, x6, #4
	lsr	x22, x22, #6
	lsr	x23, x23, #4
	madd	w4, w4, w1, w11
	msub	w22, w22, w17, w11
	add	w22, w22, #1
	msub	w5, w5, w17, w11
	add	w5, w5, #2
	msub	w2, w2, w17, w11
	add	w2, w2, #3
	stp	w4, w22, [x12, #-8]
	stp	w5, w2, [x12], #16
	add	w2, w11, w7
	sub	w4, w23, w23, lsl #5
	add	w4, w11, w4
	add	w4, w4, #1
	sub	w5, w6, w6, lsl #5
	add	w5, w11, w5
	add	w5, w5, #2
	sub	w3, w3, w3, lsl #5
	add	w3, w11, w3
	add	w3, w3, #3
	stp	w2, w4, [x13, #-8]
	stp	w5, w3, [x13], #16
	add	x11, x11, #4
	add	x14, x14, #4
	add	x15, x15, #4
	add	x16, x16, #4
	cmp	x10, x11
	b.ne	LBB1_10
; %bb.11:
	cmp	x19, x10
	b.eq	LBB1_14
LBB1_12:
	sub	x11, x19, x10
	lsl	x13, x10, #2
	add	x12, x21, x13
	add	x13, x20, x13
	mov	w14, #97                        ; =0x61
LBB1_13:                                ; =>This Inner Loop Header: Depth=1
	umulh	x15, x10, x8
	sub	x16, x10, x15
	add	x15, x15, x16, lsr #1
	lsr	x15, x15, #4
	sub	w15, w15, w15, lsl #5
	add	w15, w10, w15
	umulh	x16, x10, x9
	sub	x17, x10, x16
	add	x16, x16, x17, lsr #1
	lsr	x16, x16, #6
	msub	w16, w16, w14, w10
	str	w16, [x13], #4
	str	w15, [x12], #4
	add	x10, x10, #1
	subs	x11, x11, #1
	b.ne	LBB1_13
LBB1_14:
	cmp	x19, #4
	b.hs	LBB1_16
; %bb.15:
	mov	x10, #0                         ; =0x0
	b	LBB1_25
LBB1_16:
	cmp	x19, #16
	b.hs	LBB1_18
; %bb.17:
	mov	x10, #0                         ; =0x0
	b	LBB1_22
LBB1_18:
	and	x10, x19, #0xfffffffffffffff0
	add	x11, x20, #32
	add	x12, x21, #32
	add	x13, x0, #32
	mov	x14, x10
LBB1_19:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x11, #-32]
	ldp	q2, q3, [x11], #64
	ldp	q4, q5, [x12, #-32]
	ldp	q6, q7, [x12], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	subs	x14, x14, #16
	b.ne	LBB1_19
; %bb.20:
	cmp	x19, x10
	b.eq	LBB1_27
; %bb.21:
	tst	x19, #0xc
	b.eq	LBB1_25
LBB1_22:
	mov	x12, x10
	and	x10, x19, #0xfffffffffffffffc
	sub	x11, x12, x10
	lsl	x14, x12, #2
	add	x12, x0, x14
	add	x13, x21, x14
	add	x14, x20, x14
LBB1_23:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x14], #16
	ldr	q1, [x13], #16
	add.4s	v0, v1, v0
	str	q0, [x12], #16
	adds	x11, x11, #4
	b.ne	LBB1_23
; %bb.24:
	cmp	x19, x10
	b.eq	LBB1_27
LBB1_25:
	sub	x11, x19, x10
	lsl	x13, x10, #2
	add	x10, x0, x13
	add	x12, x21, x13
	add	x13, x20, x13
LBB1_26:                                ; =>This Inner Loop Header: Depth=1
	ldr	w14, [x13], #4
	ldr	w15, [x12], #4
	add	w14, w15, w14
	str	w14, [x10], #4
	subs	x11, x11, #1
	b.ne	LBB1_26
LBB1_27:
	mov	x11, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	mov	w12, #-2                        ; =0xfffffffe
	mov	x13, #-1                        ; =0xffffffffffffffff
	mov	w14, #97                        ; =0x61
LBB1_28:                                ; =>This Inner Loop Header: Depth=1
	ldr	w15, [x0, x11, lsl #2]
	add	w12, w12, #2
	add	x13, x13, #1
	umulh	x16, x13, x8
	sub	x17, x13, x16
	add	x16, x16, x17, lsr #1
	lsr	x16, x16, #4
	sub	w16, w16, w16, lsl #5
	add	w16, w12, w16
	umulh	x17, x13, x9
	sub	x1, x13, x17
	add	x17, x17, x1, lsr #1
	lsr	x17, x17, #6
	msub	w16, w17, w14, w16
	cmp	w16, w15
	b.ne	LBB1_31
; %bb.29:                               ;   in Loop: Header=BB1_28 Depth=1
	add	x11, x11, #1
	add	x10, x10, x15
	cmp	x19, x11
	b.ne	LBB1_28
; %bb.30:
	stp	x19, x10, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	x0, x21
	bl	_free
	mov	x0, x19
	bl	_free
	mov	w8, #0                          ; =0x0
	b	LBB1_32
LBB1_31:
	mov	w8, #4                          ; =0x4
LBB1_32:
	mov	x0, x8
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS vector_add n=%zu checksum=%lld\n"

.subsections_via_symbols

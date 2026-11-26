	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB0_14
; %bb.1:
	cmp	x2, #3
	b.hi	LBB0_3
; %bb.2:
	mov	x8, #0                          ; =0x0
	b	LBB0_12
LBB0_3:
	cmp	x2, #16
	b.hs	LBB0_5
; %bb.4:
	mov	x8, #0                          ; =0x0
	b	LBB0_9
LBB0_5:
	and	x8, x2, #0xfffffffffffffff0
	add	x9, x0, #32
	add	x10, x1, #32
	movi.4s	v0, #50
	movi.4s	v1, #3
	mov	x11, x8
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x9, #-32]
	ldp	q4, q5, [x9], #64
	cmgt.4s	v6, v2, v0
	cmgt.4s	v7, v3, v0
	cmgt.4s	v16, v4, v0
	cmgt.4s	v17, v5, v0
	add.4s	v18, v2, v2
	add.4s	v19, v3, v3
	add.4s	v20, v4, v4
	add.4s	v21, v5, v5
	add.4s	v2, v2, v1
	add.4s	v3, v3, v1
	add.4s	v4, v4, v1
	add.4s	v5, v5, v1
	bit.16b	v2, v18, v6
	bit.16b	v3, v19, v7
	bit.16b	v4, v20, v16
	stp	q2, q3, [x10, #-32]
	mov.16b	v2, v17
	bsl.16b	v2, v21, v5
	stp	q4, q2, [x10], #64
	subs	x11, x11, #16
	b.ne	LBB0_6
; %bb.7:
	cmp	x2, x8
	b.eq	LBB0_14
; %bb.8:
	tst	x2, #0xc
	b.eq	LBB0_12
LBB0_9:
	mov	x10, x8
	and	x8, x2, #0xfffffffffffffffc
	sub	x9, x10, x8
	lsl	x11, x10, #2
	add	x10, x1, x11
	add	x11, x0, x11
	movi.4s	v0, #50
	movi.4s	v1, #3
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x11], #16
	cmgt.4s	v3, v2, v0
	add.4s	v4, v2, v2
	add.4s	v2, v2, v1
	bit.16b	v2, v4, v3
	str	q2, [x10], #16
	adds	x9, x9, #4
	b.ne	LBB0_10
; %bb.11:
	cmp	x2, x8
	b.eq	LBB0_14
LBB0_12:
	lsl	x10, x8, #2
	add	x9, x1, x10
	sub	x8, x2, x8
	add	x10, x0, x10
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x10], #4
	lsl	w12, w11, #1
	add	w13, w11, #3
	cmp	w11, #50
	csel	w11, w12, w13, gt
	str	w11, [x9], #4
	subs	x8, x8, #1
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
	mov	w8, #2                          ; =0x2
	b	LBB1_31
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	lsl	x21, x19, #2
	mov	x0, x21
	bl	_malloc
	mov	x20, x0
	mov	x0, x21
	bl	_malloc
	mov	w8, #3                          ; =0x3
	cbz	x20, LBB1_31
; %bb.5:
	cbz	x0, LBB1_31
; %bb.6:
	mov	x8, #44773                      ; =0xaee5
	movk	x8, #11679, lsl #16
	movk	x8, #34390, lsl #32
	movk	x8, #17519, lsl #48
	cmp	x19, #4
	b.hs	LBB1_8
; %bb.7:
	mov	x9, #0                          ; =0x0
	b	LBB1_11
LBB1_8:
	mov	x10, #0                         ; =0x0
	and	x9, x19, #0xfffffffffffffffc
	add	x11, x20, #8
	mov	w12, #3                         ; =0x3
	mov	w13, #2                         ; =0x2
	mov	w14, #1                         ; =0x1
	mov	w15, #101                       ; =0x65
	mov	x16, x9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x17, x12, x8
	sub	x1, x12, x17
	add	x17, x17, x1, lsr #1
	lsr	x17, x17, #6
	msub	w17, w17, w15, w12
	umulh	x1, x13, x8
	sub	x2, x13, x1
	add	x1, x1, x2, lsr #1
	lsr	x1, x1, #6
	msub	w1, w1, w15, w13
	umulh	x2, x10, x8
	sub	x3, x10, x2
	add	x2, x2, x3, lsr #1
	lsr	x2, x2, #6
	msub	w2, w2, w15, w10
	umulh	x3, x14, x8
	sub	x4, x14, x3
	add	x3, x3, x4, lsr #1
	lsr	x3, x3, #6
	msub	w3, w3, w15, w14
	stp	w2, w3, [x11, #-8]
	add	x10, x10, #4
	add	x12, x12, #4
	stp	w1, w17, [x11], #16
	add	x13, x13, #4
	add	x14, x14, #4
	subs	x16, x16, #4
	b.ne	LBB1_9
; %bb.10:
	cmp	x19, x9
	b.eq	LBB1_13
LBB1_11:
	sub	x10, x19, x9
	add	x11, x20, x9, lsl #2
	mov	w12, #101                       ; =0x65
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	umulh	x13, x9, x8
	sub	x14, x9, x13
	add	x13, x13, x14, lsr #1
	lsr	x13, x13, #6
	msub	w13, w13, w12, w9
	add	x9, x9, #1
	str	w13, [x11], #4
	subs	x10, x10, #1
	b.ne	LBB1_12
LBB1_13:
	cmp	x19, #4
	b.hs	LBB1_15
; %bb.14:
	mov	x9, #0                          ; =0x0
	b	LBB1_24
LBB1_15:
	cmp	x19, #16
	b.hs	LBB1_17
; %bb.16:
	mov	x9, #0                          ; =0x0
	b	LBB1_21
LBB1_17:
	and	x9, x19, #0xfffffffffffffff0
	add	x10, x20, #32
	add	x11, x0, #32
	movi.4s	v0, #50
	movi.4s	v1, #3
	mov	x12, x9
LBB1_18:                                ; =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x10, #-32]
	ldp	q4, q5, [x10], #64
	cmgt.4s	v6, v2, v0
	cmgt.4s	v7, v3, v0
	cmgt.4s	v16, v4, v0
	cmgt.4s	v17, v5, v0
	add.4s	v18, v2, v2
	add.4s	v19, v3, v3
	add.4s	v20, v4, v4
	add.4s	v21, v5, v5
	add.4s	v2, v2, v1
	add.4s	v3, v3, v1
	add.4s	v4, v4, v1
	add.4s	v5, v5, v1
	bit.16b	v2, v18, v6
	bit.16b	v3, v19, v7
	bit.16b	v4, v20, v16
	stp	q2, q3, [x11, #-32]
	mov.16b	v2, v17
	bsl.16b	v2, v21, v5
	stp	q4, q2, [x11], #64
	subs	x12, x12, #16
	b.ne	LBB1_18
; %bb.19:
	cmp	x19, x9
	b.eq	LBB1_26
; %bb.20:
	tst	x19, #0xc
	b.eq	LBB1_24
LBB1_21:
	mov	x11, x9
	and	x9, x19, #0xfffffffffffffffc
	sub	x10, x11, x9
	lsl	x12, x11, #2
	add	x11, x0, x12
	add	x12, x20, x12
	movi.4s	v0, #50
	movi.4s	v1, #3
LBB1_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x12], #16
	cmgt.4s	v3, v2, v0
	add.4s	v4, v2, v2
	add.4s	v2, v2, v1
	bit.16b	v2, v4, v3
	str	q2, [x11], #16
	adds	x10, x10, #4
	b.ne	LBB1_22
; %bb.23:
	cmp	x19, x9
	b.eq	LBB1_26
LBB1_24:
	sub	x10, x19, x9
	lsl	x11, x9, #2
	add	x9, x0, x11
	add	x11, x20, x11
LBB1_25:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x11], #4
	lsl	w13, w12, #1
	add	w14, w12, #3
	cmp	w12, #50
	csel	w12, w13, w14, gt
	str	w12, [x9], #4
	subs	x10, x10, #1
	b.ne	LBB1_25
LBB1_26:
	mov	w10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	mov	x12, #-101                      ; =0xffffffffffffff9b
	mov	w13, #202                       ; =0xca
	mov	w14, #101                       ; =0x65
LBB1_27:                                ; =>This Inner Loop Header: Depth=1
	umulh	x15, x11, x8
	sub	x16, x11, x15
	add	x15, x15, x16, lsr #1
	lsr	x15, x15, #6
	msub	w16, w15, w13, w10
	madd	x17, x15, x12, x11
	msub	w15, w15, w14, w11
	add	w15, w15, #3
	cmp	x17, #50
	csel	w15, w16, w15, hi
	ldr	w16, [x0, x11, lsl #2]
	cmp	w16, w15
	b.ne	LBB1_30
; %bb.28:                               ;   in Loop: Header=BB1_27 Depth=1
	add	x9, x9, w15, uxtw
	add	x11, x11, #1
	add	w10, w10, #2
	cmp	x19, x11
	b.ne	LBB1_27
; %bb.29:
	stp	x19, x9, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x20
	bl	_free
	mov	x0, x19
	bl	_free
	mov	w8, #0                          ; =0x0
	b	LBB1_31
LBB1_30:
	mov	w8, #4                          ; =0x4
LBB1_31:
	mov	x0, x8
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
	.asciz	"PASS conditional n=%zu checksum=%lld\n"

.subsections_via_symbols

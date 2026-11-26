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
	mov	x8, #0                          ; =0x0
	movi.2d	v0, #0000000000000000
	b	LBB0_13
LBB0_3:
	movi.2d	v0, #0000000000000000
	ret
LBB0_4:
	cmp	x1, #16
	b.hs	LBB0_6
; %bb.5:
	mov	x8, #0                          ; =0x0
	movi.2d	v0, #0000000000000000
	b	LBB0_10
LBB0_6:
	and	x8, x1, #0xfffffffffffffff0
	add	x9, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x10, x8
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x9, #-32]
	mov	s3, v1[3]
	mov	s4, v1[2]
	mov	s5, v1[1]
	mov	s6, v2[3]
	mov	s7, v2[2]
	mov	s16, v2[1]
	ldp	q17, q18, [x9], #64
	mov	s19, v17[3]
	mov	s20, v17[2]
	mov	s21, v17[1]
	mov	s22, v18[3]
	mov	s23, v18[2]
	mov	s24, v18[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s16
	fadd	s0, s0, s7
	fadd	s0, s0, s6
	fadd	s0, s0, s17
	fadd	s0, s0, s21
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s18
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s22
	subs	x10, x10, #16
	b.ne	LBB0_7
; %bb.8:
	cmp	x1, x8
	b.eq	LBB0_15
; %bb.9:
	tst	x1, #0xc
	b.eq	LBB0_13
LBB0_10:
	mov	x10, x8
	and	x8, x1, #0xfffffffffffffffc
	sub	x9, x10, x8
	add	x10, x0, x10, lsl #2
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	adds	x9, x9, #4
	b.ne	LBB0_11
; %bb.12:
	cmp	x1, x8
	b.eq	LBB0_15
LBB0_13:
	sub	x9, x1, x8
	add	x8, x0, x8, lsl #2
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x8], #4
	fadd	s0, s0, s1
	subs	x9, x9, #1
	b.ne	LBB0_14
LBB0_15:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
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
	mov	w19, #2                         ; =0x2
	b	LBB1_44
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
	mov	w19, #3                         ; =0x3
	b	LBB1_44
LBB1_8:
	mov	x9, #0                          ; =0x0
	and	x8, x19, #0xfffffffffffffffc
	add	x10, x0, #8
	mov	w11, #4                         ; =0x4
	mov	w12, #3                         ; =0x3
	mov	w13, #2                         ; =0x2
	mov	w14, #1                         ; =0x1
	mov	x15, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x15, #61681
	fmov	s0, #1.00000000
	mov	x16, x8
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x17, x12, x15
	lsr	x17, x17, #4
	add	x17, x17, x17, lsl #4
	umulh	x1, x13, x15
	lsr	x1, x1, #4
	add	x1, x1, x1, lsl #4
	sub	x1, x12, x1
	umulh	x2, x9, x15
	lsr	x2, x2, #4
	add	x2, x2, x2, lsl #4
	sub	x2, x14, x2
	umulh	x3, x14, x15
	lsr	x3, x3, #4
	add	x3, x3, x3, lsl #4
	sub	x3, x13, x3
	ucvtf	s1, x2
	ucvtf	s2, x3
	ucvtf	s3, x1
	sub	x17, x11, x17
	ucvtf	s4, x17
	fdiv	s1, s0, s1
	fdiv	s2, s0, s2
	fdiv	s3, s0, s3
	fdiv	s4, s0, s4
	stp	s1, s2, [x10, #-8]
	add	x9, x9, #4
	add	x11, x11, #4
	add	x12, x12, #4
	stp	s3, s4, [x10], #16
	add	x13, x13, #4
	add	x14, x14, #4
	subs	x16, x16, #4
	b.ne	LBB1_9
; %bb.10:
	cmp	x19, x8
	b.eq	LBB1_13
LBB1_11:
	sub	x9, x19, x8
	add	x10, x8, #1
	mov	x11, #-1085102592571150096      ; =0xf0f0f0f0f0f0f0f0
	movk	x11, #61681
	fmov	s0, #1.00000000
	add	x12, x0, x8, lsl #2
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	umulh	x13, x8, x11
	lsr	x13, x13, #4
	add	x13, x13, x13, lsl #4
	sub	x13, x10, x13
	ucvtf	s1, x13
	fdiv	s1, s0, s1
	str	s1, [x12], #4
	add	x8, x8, #1
	add	x10, x10, #1
	subs	x9, x9, #1
	b.ne	LBB1_12
LBB1_13:
	cmp	x19, #3
	b.hi	LBB1_15
; %bb.14:
	mov	x8, #0                          ; =0x0
	movi.2d	v0, #0000000000000000
	b	LBB1_24
LBB1_15:
	cmp	x19, #16
	b.hs	LBB1_17
; %bb.16:
	mov	x8, #0                          ; =0x0
	movi.2d	v0, #0000000000000000
	b	LBB1_21
LBB1_17:
	and	x8, x19, #0xfffffffffffffff0
	add	x9, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x10, x8
LBB1_18:                                ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x9, #-32]
	mov	s3, v1[3]
	mov	s4, v1[2]
	mov	s5, v1[1]
	mov	s6, v2[3]
	mov	s7, v2[2]
	mov	s16, v2[1]
	ldp	q17, q18, [x9], #64
	mov	s19, v17[3]
	mov	s20, v17[2]
	mov	s21, v17[1]
	mov	s22, v18[3]
	mov	s23, v18[2]
	mov	s24, v18[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s16
	fadd	s0, s0, s7
	fadd	s0, s0, s6
	fadd	s0, s0, s17
	fadd	s0, s0, s21
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s18
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s22
	subs	x10, x10, #16
	b.ne	LBB1_18
; %bb.19:
	cmp	x19, x8
	b.eq	LBB1_26
; %bb.20:
	tst	x19, #0xc
	b.eq	LBB1_24
LBB1_21:
	mov	x10, x8
	and	x8, x19, #0xfffffffffffffffc
	sub	x9, x10, x8
	add	x10, x0, x10, lsl #2
LBB1_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10], #16
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	adds	x9, x9, #4
	b.ne	LBB1_22
; %bb.23:
	cmp	x19, x8
	b.eq	LBB1_26
LBB1_24:
	sub	x9, x19, x8
	add	x8, x0, x8, lsl #2
LBB1_25:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x8], #4
	fadd	s0, s0, s1
	subs	x9, x9, #1
	b.ne	LBB1_25
LBB1_26:
	cmp	x19, #3
	b.hi	LBB1_28
; %bb.27:
	mov	x8, #0                          ; =0x0
	movi.2d	v1, #0000000000000000
	b	LBB1_37
LBB1_28:
	cmp	x19, #16
	b.hs	LBB1_30
; %bb.29:
	mov	x8, #0                          ; =0x0
	movi.2d	v1, #0000000000000000
	b	LBB1_34
LBB1_30:
	and	x8, x19, #0xfffffffffffffff0
	add	x9, x0, #32
	movi.2d	v1, #0000000000000000
	mov	x10, x8
LBB1_31:                                ; =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x9, #-32]
	ldp	q4, q5, [x9], #64
	fcvtl2	v6.2d, v2.4s
	mov	d7, v6[1]
	fcvtl	v2.2d, v2.2s
	mov	d16, v2[1]
	fcvtl2	v17.2d, v3.4s
	mov	d18, v17[1]
	fcvtl	v3.2d, v3.2s
	mov	d19, v3[1]
	fcvtl2	v20.2d, v4.4s
	mov	d21, v20[1]
	fcvtl	v4.2d, v4.2s
	mov	d22, v4[1]
	fcvtl2	v23.2d, v5.4s
	mov	d24, v23[1]
	fcvtl	v5.2d, v5.2s
	mov	d25, v5[1]
	fadd	d1, d1, d2
	fadd	d1, d1, d16
	fadd	d1, d1, d6
	fadd	d1, d1, d7
	fadd	d1, d1, d3
	fadd	d1, d1, d19
	fadd	d1, d1, d17
	fadd	d1, d1, d18
	fadd	d1, d1, d4
	fadd	d1, d1, d22
	fadd	d1, d1, d20
	fadd	d1, d1, d21
	fadd	d1, d1, d5
	fadd	d1, d1, d25
	fadd	d1, d1, d23
	fadd	d1, d1, d24
	subs	x10, x10, #16
	b.ne	LBB1_31
; %bb.32:
	cmp	x19, x8
	b.eq	LBB1_39
; %bb.33:
	tst	x19, #0xc
	b.eq	LBB1_37
LBB1_34:
	mov	x10, x8
	and	x8, x19, #0xfffffffffffffffc
	sub	x9, x10, x8
	add	x10, x0, x10, lsl #2
LBB1_35:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x10], #16
	fcvtl2	v3.2d, v2.4s
	mov	d4, v3[1]
	fcvtl	v2.2d, v2.2s
	mov	d5, v2[1]
	fadd	d1, d1, d2
	fadd	d1, d1, d5
	fadd	d1, d1, d3
	fadd	d1, d1, d4
	adds	x9, x9, #4
	b.ne	LBB1_35
; %bb.36:
	cmp	x19, x8
	b.eq	LBB1_39
LBB1_37:
	sub	x9, x19, x8
	add	x8, x0, x8, lsl #2
LBB1_38:                                ; =>This Inner Loop Header: Depth=1
	ldr	s2, [x8], #4
	fcvt	d2, s2
	fadd	d1, d1, d2
	subs	x9, x9, #1
	b.ne	LBB1_38
LBB1_39:
	fmov	w8, s0
	and	w8, w8, #0x7fffffff
	mov	w9, #2139095039                 ; =0x7f7fffff
	cmp	w8, w9
	b.gt	LBB1_41
; %bb.40:
	fcvt	d0, s0
	fabs	d2, d1
	fmov	d3, #1.00000000
	fmaxnm	d2, d2, d3
	mov	x8, #43516                      ; =0xa9fc
	movk	x8, #54001, lsl #16
	movk	x8, #25165, lsl #32
	movk	x8, #16208, lsl #48
	fmov	d3, x8
	fmul	d2, d2, d3
	fabd	d3, d0, d1
	fcmp	d3, d2
	b.le	LBB1_42
LBB1_41:
	mov	w19, #4                         ; =0x4
	b	LBB1_43
LBB1_42:
	stp	d0, d1, [sp, #8]
	str	x19, [sp]
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x19
	mov	w19, #0                         ; =0x0
LBB1_43:
	bl	_free
LBB1_44:
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS float_reduction n=%zu sum=%.9g reference=%.9g\n"

.subsections_via_symbols

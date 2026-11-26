	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	movi.2d	v0, #0000000000000000
	str	s0, [sp, #12]
	str	xzr, [sp]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [sp]
	ldr	s1, [x8, x9, lsl #2]
	ldr	s0, [sp, #12]
	fadd	s0, s0, s1
	str	s0, [sp, #12]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	ldr	s0, [sp, #12]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-24]
	stur	w0, [x29, #-28]
	stur	x1, [x29, #-40]
	ldur	w8, [x29, #-28]
	subs	w8, w8, #1
	b.le	LBB1_2
	b	LBB1_1
LBB1_1:
	ldur	x8, [x29, #-40]
	ldr	x0, [x8, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoul
	str	x0, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_2:
	mov	x8, #32768                      ; =0x8000
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_3:
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-48]
	ldur	x8, [x29, #-48]
	subs	x8, x8, #1
	b.lo	LBB1_5
	b	LBB1_4
LBB1_4:
	ldur	x8, [x29, #-48]
	mov	x9, #16960                      ; =0x4240
	movk	x9, #15, lsl #16
	subs	x8, x8, x9
	b.ls	LBB1_6
	b	LBB1_5
LBB1_5:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-24]
	b	LBB1_30
LBB1_6:
	ldur	x8, [x29, #-48]
	lsl	x0, x8, #2
	bl	_malloc
	stur	x0, [x29, #-56]
	ldur	x8, [x29, #-56]
	cbnz	x8, LBB1_8
	b	LBB1_7
LBB1_7:
	mov	w8, #3                          ; =0x3
	stur	w8, [x29, #-24]
	b	LBB1_30
LBB1_8:
	stur	xzr, [x29, #-64]
	b	LBB1_9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-64]
	ldur	x9, [x29, #-48]
	subs	x8, x8, x9
	b.hs	LBB1_12
	b	LBB1_10
LBB1_10:                                ;   in Loop: Header=BB1_9 Depth=1
	ldur	x8, [x29, #-64]
	mov	x10, #17                        ; =0x11
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	add	x8, x8, #1
	ucvtf	s1, x8
	fmov	s0, #1.00000000
	fdiv	s0, s0, s1
	ldur	x8, [x29, #-56]
	ldur	x9, [x29, #-64]
	str	s0, [x8, x9, lsl #2]
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_9 Depth=1
	ldur	x8, [x29, #-64]
	add	x8, x8, #1
	stur	x8, [x29, #-64]
	b	LBB1_9
LBB1_12:
	ldur	x0, [x29, #-56]
	ldur	x1, [x29, #-48]
	bl	_kernel
	stur	s0, [x29, #-68]
	movi.2d	v0, #0000000000000000
	str	d0, [sp, #80]
	str	xzr, [sp, #72]
	b	LBB1_13
LBB1_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #72]
	ldur	x9, [x29, #-48]
	subs	x8, x8, x9
	b.hs	LBB1_16
	b	LBB1_14
LBB1_14:                                ;   in Loop: Header=BB1_13 Depth=1
	ldur	x8, [x29, #-56]
	ldr	x9, [sp, #72]
	ldr	s0, [x8, x9, lsl #2]
	fcvt	d1, s0
	ldr	d0, [sp, #80]
	fadd	d0, d0, d1
	str	d0, [sp, #80]
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #72]
	add	x8, x8, #1
	str	x8, [sp, #72]
	b	LBB1_13
LBB1_16:
	ldur	s0, [x29, #-68]
	fcvt	d0, s0
	ldr	d1, [sp, #80]
	fabd	d0, d0, d1
	str	d0, [sp, #64]
	ldr	d0, [sp, #80]
	fabs	d1, d0
	fmov	d0, #1.00000000
	fmaxnm	d1, d0, d1
	mov	x8, #43516                      ; =0xa9fc
	movk	x8, #54001, lsl #16
	movk	x8, #25165, lsl #32
	movk	x8, #16208, lsl #48
	fmov	d0, x8
	fmul	d0, d0, d1
	str	d0, [sp, #56]
	mov	w8, #1                          ; =0x1
	tbz	w8, #0, LBB1_20
	b	LBB1_17
LBB1_17:
	ldur	s0, [x29, #-68]
	stur	s0, [x29, #-20]
	ldur	s0, [x29, #-20]
	ldur	s1, [x29, #-20]
	mov	w8, #0                          ; =0x0
	fcmp	s0, s1
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	b.ne	LBB1_19
	b	LBB1_18
LBB1_18:
	ldur	s0, [x29, #-20]
	fabs	s0, s0
	mov	w8, #2139095040                 ; =0x7f800000
	fmov	s1, w8
	fcmp	s0, s1
	cset	w8, ne
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	b	LBB1_19
LBB1_19:
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB1_27
	b	LBB1_28
LBB1_20:
	mov	w8, #0                          ; =0x0
	tbz	w8, #0, LBB1_24
	b	LBB1_21
LBB1_21:
	ldur	s0, [x29, #-68]
	fcvt	d0, s0
	stur	d0, [x29, #-16]
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-16]
	mov	w8, #0                          ; =0x0
	fcmp	d0, d1
	str	w8, [sp, #40]                   ; 4-byte Folded Spill
	b.ne	LBB1_23
	b	LBB1_22
LBB1_22:
	ldur	d0, [x29, #-16]
	fabs	d0, d0
	mov	x8, #9218868437227405312        ; =0x7ff0000000000000
	fmov	d1, x8
	fcmp	d0, d1
	cset	w8, ne
	str	w8, [sp, #40]                   ; 4-byte Folded Spill
	b	LBB1_23
LBB1_23:
	ldr	w8, [sp, #40]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB1_27
	b	LBB1_28
LBB1_24:
	ldur	s0, [x29, #-68]
	fcvt	d0, s0
	stur	d0, [x29, #-8]
	ldur	d0, [x29, #-8]
	ldur	d1, [x29, #-8]
	mov	w8, #0                          ; =0x0
	fcmp	d0, d1
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	b.ne	LBB1_26
	b	LBB1_25
LBB1_25:
	ldur	d0, [x29, #-8]
	fabs	d0, d0
	mov	x8, #9218868437227405312        ; =0x7ff0000000000000
	fmov	d1, x8
	fcmp	d0, d1
	cset	w8, ne
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	b	LBB1_26
LBB1_26:
	ldr	w8, [sp, #36]                   ; 4-byte Folded Reload
	tbz	w8, #0, LBB1_28
	b	LBB1_27
LBB1_27:
	ldr	d0, [sp, #64]
	ldr	d1, [sp, #56]
	fcmp	d0, d1
	b.le	LBB1_29
	b	LBB1_28
LBB1_28:
	ldur	x0, [x29, #-56]
	bl	_free
	mov	w8, #4                          ; =0x4
	stur	w8, [x29, #-24]
	b	LBB1_30
LBB1_29:
	ldur	x9, [x29, #-48]
	ldur	s0, [x29, #-68]
	fcvt	d1, s0
	ldr	d0, [sp, #80]
	mov	x8, sp
	str	x9, [x8]
	str	d1, [x8, #8]
	str	d0, [x8, #16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-56]
	bl	_free
	stur	wzr, [x29, #-24]
	b	LBB1_30
LBB1_30:
	ldur	w0, [x29, #-24]
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS float_reduction n=%zu sum=%.9g reference=%.9g\n"

.subsections_via_symbols

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
	str	wzr, [sp, #12]
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
	ldr	w9, [x8, x9, lsl #2]
	ldr	w8, [sp, #12]
	add	w8, w8, w9
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #1
	b.le	LBB1_2
	b	LBB1_1
LBB1_1:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	mov	x1, #0                          ; =0x0
	mov	w2, #10                         ; =0xa
	bl	_strtoul
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_2:
	mov	x8, #32768                      ; =0x8000
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_3:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-24]
	ldur	x8, [x29, #-24]
	subs	x8, x8, #1
	b.lo	LBB1_5
	b	LBB1_4
LBB1_4:
	ldur	x8, [x29, #-24]
	mov	x9, #16960                      ; =0x4240
	movk	x9, #15, lsl #16
	subs	x8, x8, x9
	b.ls	LBB1_6
	b	LBB1_5
LBB1_5:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-4]
	b	LBB1_19
LBB1_6:
	ldur	x8, [x29, #-24]
	lsl	x0, x8, #2
	bl	_malloc
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	cbnz	x8, LBB1_8
	b	LBB1_7
LBB1_7:
	mov	w8, #3                          ; =0x3
	stur	w8, [x29, #-4]
	b	LBB1_19
LBB1_8:
	str	xzr, [sp, #40]
	b	LBB1_9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_12
	b	LBB1_10
LBB1_10:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	x8, [sp, #40]
	mov	x10, #17                        ; =0x11
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	ldur	x9, [x29, #-32]
	ldr	x10, [sp, #40]
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [x9, x10, lsl #2]
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #1
	str	x8, [sp, #40]
	b	LBB1_9
LBB1_12:
	ldur	x0, [x29, #-32]
	ldur	x1, [x29, #-24]
	bl	_kernel
	str	w0, [sp, #36]
	str	wzr, [sp, #32]
	str	xzr, [sp, #24]
	b	LBB1_13
LBB1_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_16
	b	LBB1_14
LBB1_14:                                ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #24]
	mov	x10, #17                        ; =0x11
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	mov	x9, x8
	ldr	w8, [sp, #32]
	add	w8, w8, w9
	str	w8, [sp, #32]
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #24]
	add	x8, x8, #1
	str	x8, [sp, #24]
	b	LBB1_13
LBB1_16:
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #32]
	subs	w8, w8, w9
	b.eq	LBB1_18
	b	LBB1_17
LBB1_17:
	mov	w8, #4                          ; =0x4
	stur	w8, [x29, #-4]
	b	LBB1_19
LBB1_18:
	ldur	x10, [x29, #-24]
	ldr	w8, [sp, #36]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-32]
	bl	_free
	stur	wzr, [x29, #-4]
	b	LBB1_19
LBB1_19:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS reduction n=%zu checksum=%d\n"

.subsections_via_symbols

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
	str	x2, [sp, #8]
	str	xzr, [sp]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	ldr	x9, [sp, #8]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [sp]
	mov	x11, #3                         ; =0x3
	mul	x9, x9, x11
	ldr	w8, [x8, x9, lsl #2]
	lsl	w8, w8, #1
	add	w8, w8, #1
	ldr	x9, [sp, #16]
	ldr	x10, [sp]
	mul	x10, x10, x11
	str	w8, [x9, x10, lsl #2]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
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
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_2:
	mov	x8, #32768                      ; =0x8000
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_3:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
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
	b	LBB1_23
LBB1_6:
	ldur	x8, [x29, #-24]
	mov	x9, #3                          ; =0x3
	mul	x8, x8, x9
	stur	x8, [x29, #-32]
	ldur	x8, [x29, #-32]
	lsl	x0, x8, #2
	bl	_malloc
	stur	x0, [x29, #-40]
	ldur	x0, [x29, #-32]
	mov	x1, #4                          ; =0x4
	bl	_calloc
	stur	x0, [x29, #-48]
	ldur	x8, [x29, #-40]
	cbz	x8, LBB1_8
	b	LBB1_7
LBB1_7:
	ldur	x8, [x29, #-48]
	cbnz	x8, LBB1_9
	b	LBB1_8
LBB1_8:
	ldur	x0, [x29, #-40]
	bl	_free
	ldur	x0, [x29, #-48]
	bl	_free
	mov	w8, #3                          ; =0x3
	stur	w8, [x29, #-4]
	b	LBB1_23
LBB1_9:
	stur	xzr, [x29, #-56]
	b	LBB1_10
LBB1_10:                                ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-56]
	ldur	x9, [x29, #-32]
	subs	x8, x8, x9
	b.hs	LBB1_13
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_10 Depth=1
	ldur	x8, [x29, #-56]
	mov	x10, #97                        ; =0x61
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	ldur	x9, [x29, #-40]
	ldur	x10, [x29, #-56]
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [x9, x10, lsl #2]
	b	LBB1_12
LBB1_12:                                ;   in Loop: Header=BB1_10 Depth=1
	ldur	x8, [x29, #-56]
	add	x8, x8, #1
	stur	x8, [x29, #-56]
	b	LBB1_10
LBB1_13:
	ldur	x0, [x29, #-40]
	ldur	x1, [x29, #-48]
	ldur	x2, [x29, #-24]
	bl	_kernel
	str	xzr, [sp, #64]
	str	xzr, [sp, #56]
	b	LBB1_14
LBB1_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #56]
	ldur	x9, [x29, #-32]
	subs	x8, x8, x9
	b.hs	LBB1_22
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	x8, [sp, #56]
	mov	x10, #3                         ; =0x3
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	cbnz	x8, LBB1_17
	b	LBB1_16
LBB1_16:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	x8, [sp, #56]
	mov	x10, #97                        ; =0x61
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	lsl	w8, w8, #1
	add	w8, w8, #1
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	b	LBB1_18
LBB1_17:                                ;   in Loop: Header=BB1_14 Depth=1
	mov	w8, #0                          ; =0x0
	str	w8, [sp, #36]                   ; 4-byte Folded Spill
	b	LBB1_18
LBB1_18:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	w8, [sp, #36]                   ; 4-byte Folded Reload
	str	w8, [sp, #52]
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #56]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #52]
	subs	w8, w8, w9
	b.eq	LBB1_20
	b	LBB1_19
LBB1_19:
	ldur	x0, [x29, #-40]
	bl	_free
	ldur	x0, [x29, #-48]
	bl	_free
	mov	w8, #4                          ; =0x4
	stur	w8, [x29, #-4]
	b	LBB1_23
LBB1_20:                                ;   in Loop: Header=BB1_14 Depth=1
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #56]
	ldrsw	x9, [x8, x9, lsl #2]
	ldr	x8, [sp, #64]
	add	x8, x8, x9
	str	x8, [sp, #64]
	b	LBB1_21
LBB1_21:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	str	x8, [sp, #56]
	b	LBB1_14
LBB1_22:
	ldur	x10, [x29, #-24]
	ldr	x8, [sp, #64]
	mov	x9, sp
	str	x10, [x9]
	mov	x10, #3                         ; =0x3
	str	x10, [x9, #8]
	str	x8, [x9, #16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-40]
	bl	_free
	ldur	x0, [x29, #-48]
	bl	_free
	stur	wzr, [x29, #-4]
	b	LBB1_23
LBB1_23:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS strided n=%zu stride=%d checksum=%lld\n"

.subsections_via_symbols

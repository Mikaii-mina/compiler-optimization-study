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
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x9, [sp, #8]
	ldr	x8, [sp, #24]
	ldr	x10, [sp]
	ldrb	w8, [x8, x10]
	mov	x10, x8
	ldr	w8, [x9, x10, lsl #2]
	add	w8, w8, #1
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
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #640
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	wzr, [sp, #116]
	str	w0, [sp, #112]
	str	x1, [sp, #104]
	ldr	w8, [sp, #112]
	subs	w8, w8, #1
	b.le	LBB1_2
	b	LBB1_1
LBB1_1:
	ldr	x8, [sp, #104]
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
	str	x8, [sp, #96]
	ldr	x8, [sp, #96]
	subs	x8, x8, #1
	b.lo	LBB1_5
	b	LBB1_4
LBB1_4:
	ldr	x8, [sp, #96]
	mov	x9, #16960                      ; =0x4240
	movk	x9, #15, lsl #16
	subs	x8, x8, x9
	b.ls	LBB1_6
	b	LBB1_5
LBB1_5:
	mov	w8, #2                          ; =0x2
	str	w8, [sp, #116]
	b	LBB1_23
LBB1_6:
	ldr	x8, [sp, #96]
	lsr	x0, x8, #0
	bl	_malloc
	str	x0, [sp, #88]
	ldr	x8, [sp, #88]
	cbnz	x8, LBB1_8
	b	LBB1_7
LBB1_7:
	mov	w8, #3                          ; =0x3
	str	w8, [sp, #116]
	b	LBB1_23
LBB1_8:
	add	x0, sp, #376
	mov	x2, #256                        ; =0x100
	str	x2, [sp, #40]                   ; 8-byte Folded Spill
	mov	w1, #0                          ; =0x0
	str	w1, [sp, #36]                   ; 4-byte Folded Spill
	bl	_memset
	ldr	w1, [sp, #36]                   ; 4-byte Folded Reload
	ldr	x2, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, sp, #120
	bl	_memset
	str	xzr, [sp, #80]
	b	LBB1_9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #80]
	ldr	x9, [sp, #96]
	subs	x8, x8, x9
	b.hs	LBB1_12
	b	LBB1_10
LBB1_10:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	x8, [sp, #80]
	mov	x9, #37                         ; =0x25
	mul	x8, x8, x9
	ldr	x9, [sp, #80]
	eor	x8, x8, x9, lsr #4
	mov	x10, #64                        ; =0x40
	udiv	x9, x8, x10
	mul	x9, x9, x10
	subs	x8, x8, x9
	ldr	x9, [sp, #88]
	ldr	x10, [sp, #80]
                                        ; kill: def $w8 killed $w8 killed $x8
	strb	w8, [x9, x10]
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_9 Depth=1
	ldr	x8, [sp, #80]
	add	x8, x8, #1
	str	x8, [sp, #80]
	b	LBB1_9
LBB1_12:
	ldr	x0, [sp, #88]
	ldr	x1, [sp, #96]
	add	x2, sp, #376
	bl	_kernel
	str	xzr, [sp, #72]
	b	LBB1_13
LBB1_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #72]
	ldr	x9, [sp, #96]
	subs	x8, x8, x9
	b.hs	LBB1_16
	b	LBB1_14
LBB1_14:                                ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #88]
	ldr	x9, [sp, #72]
	ldrb	w8, [x8, x9]
	mov	x10, x8
	add	x9, sp, #120
	ldr	w8, [x9, x10, lsl #2]
	add	w8, w8, #1
	str	w8, [x9, x10, lsl #2]
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_13 Depth=1
	ldr	x8, [sp, #72]
	add	x8, x8, #1
	str	x8, [sp, #72]
	b	LBB1_13
LBB1_16:
	str	xzr, [sp, #64]
	str	xzr, [sp, #56]
	b	LBB1_17
LBB1_17:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #56]
	subs	x8, x8, #64
	b.hs	LBB1_22
	b	LBB1_18
LBB1_18:                                ;   in Loop: Header=BB1_17 Depth=1
	ldr	x9, [sp, #56]
	add	x8, sp, #376
	ldr	w8, [x8, x9, lsl #2]
	ldr	x10, [sp, #56]
	add	x9, sp, #120
	ldr	w9, [x9, x10, lsl #2]
	subs	w8, w8, w9
	b.eq	LBB1_20
	b	LBB1_19
LBB1_19:
	ldr	x0, [sp, #88]
	bl	_free
	mov	w8, #4                          ; =0x4
	str	w8, [sp, #116]
	b	LBB1_23
LBB1_20:                                ;   in Loop: Header=BB1_17 Depth=1
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	ldr	x10, [sp, #56]
	add	x9, sp, #376
	ldr	w9, [x9, x10, lsl #2]
                                        ; kill: def $x9 killed $w9
	mul	x9, x8, x9
	ldr	x8, [sp, #64]
	add	x8, x8, x9
	str	x8, [sp, #64]
	b	LBB1_21
LBB1_21:                                ;   in Loop: Header=BB1_17 Depth=1
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	str	x8, [sp, #56]
	b	LBB1_17
LBB1_22:
	ldr	x10, [sp, #96]
	ldr	x8, [sp, #64]
	mov	x9, sp
	str	x10, [x9]
	mov	x10, #64                        ; =0x40
	str	x10, [x9, #8]
	str	x8, [x9, #16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #88]
	bl	_free
	str	wzr, [sp, #116]
	b	LBB1_23
LBB1_23:
	ldr	w8, [sp, #116]
	str	w8, [sp, #32]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB1_25
	b	LBB1_24
LBB1_24:
	bl	___stack_chk_fail
LBB1_25:
	ldr	w0, [sp, #32]                   ; 4-byte Folded Reload
	add	sp, sp, #640
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS histogram n=%zu buckets=%d checksum=%llu\n"

.subsections_via_symbols

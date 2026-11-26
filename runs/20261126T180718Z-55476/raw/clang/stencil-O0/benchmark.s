	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	mov	x8, #1                          ; =0x1
	str	x8, [sp, #16]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	b.hs	LBB0_8
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	mov	x8, #1                          ; =0x1
	str	x8, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	ldr	x9, [sp, #24]
	subs	x8, x8, x9
	b.hs	LBB0_6
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #24]
	mul	x8, x8, x9
	ldr	x9, [sp, #8]
	add	x8, x8, x9
	str	x8, [sp]
	ldr	x8, [sp, #40]
	ldr	x9, [sp]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #40]
	ldr	x10, [sp]
	ldr	x11, [sp, #24]
	subs	x10, x10, x11
	ldr	w9, [x9, x10, lsl #2]
	add	w8, w8, w9
	ldr	x9, [sp, #40]
	ldr	x10, [sp]
	ldr	x11, [sp, #24]
	add	x10, x10, x11
	ldr	w9, [x9, x10, lsl #2]
	add	w8, w8, w9
	ldr	x9, [sp, #40]
	ldr	x10, [sp]
	subs	x10, x10, #1
	ldr	w9, [x9, x10, lsl #2]
	add	w8, w8, w9
	ldr	x9, [sp, #40]
	ldr	x10, [sp]
	add	x10, x10, #1
	ldr	w9, [x9, x10, lsl #2]
	add	w8, w8, w9
	ldr	x9, [sp, #32]
	ldr	x10, [sp]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB0_3
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #16]
	add	x8, x8, #1
	str	x8, [sp, #16]
	b	LBB0_1
LBB0_8:
	add	sp, sp, #48
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
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_2:
	mov	x8, #256                        ; =0x100
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	b	LBB1_3
LBB1_3:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-24]
	ldur	x8, [x29, #-24]
	subs	x8, x8, #3
	b.lo	LBB1_5
	b	LBB1_4
LBB1_4:
	ldur	x8, [x29, #-24]
	subs	x8, x8, #1024
	b.ls	LBB1_6
	b	LBB1_5
LBB1_5:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-4]
	b	LBB1_29
LBB1_6:
	ldur	x8, [x29, #-24]
	ldur	x9, [x29, #-24]
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
	b	LBB1_29
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
	mov	x10, #13                        ; =0xd
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
LBB1_14:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_16 Depth 2
	ldr	x8, [sp, #56]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_28
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_14 Depth=1
	str	xzr, [sp, #48]
	b	LBB1_16
LBB1_16:                                ;   Parent Loop BB1_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #48]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_26
	b	LBB1_17
LBB1_17:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #56]
	ldur	x9, [x29, #-24]
	mul	x8, x8, x9
	ldr	x9, [sp, #48]
	add	x8, x8, x9
	str	x8, [sp, #40]
	str	wzr, [sp, #36]
	ldr	x8, [sp, #56]
	subs	x8, x8, #0
	b.ls	LBB1_22
	b	LBB1_18
LBB1_18:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_22
	b	LBB1_19
LBB1_19:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #48]
	subs	x8, x8, #0
	b.ls	LBB1_22
	b	LBB1_20
LBB1_20:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #48]
	add	x8, x8, #1
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.hs	LBB1_22
	b	LBB1_21
LBB1_21:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #40]
	mov	x11, #13                        ; =0xd
	str	x11, [sp, #16]                  ; 8-byte Folded Spill
	udiv	x9, x8, x11
	mul	x9, x9, x11
	subs	x8, x8, x9
	ldr	x9, [sp, #40]
	ldur	x10, [x29, #-24]
	subs	x9, x9, x10
	udiv	x10, x9, x11
	mul	x10, x10, x11
	subs	x9, x9, x10
	add	x8, x8, x9
	ldr	x9, [sp, #40]
	ldur	x10, [x29, #-24]
	add	x9, x9, x10
	udiv	x10, x9, x11
	mul	x10, x10, x11
	subs	x9, x9, x10
	add	x8, x8, x9
	ldr	x9, [sp, #40]
	subs	x9, x9, #1
	udiv	x10, x9, x11
	mul	x10, x10, x11
	subs	x9, x9, x10
	add	x8, x8, x9
	ldr	x9, [sp, #40]
	add	x9, x9, #1
	udiv	x10, x9, x11
	mul	x10, x10, x11
	subs	x9, x9, x10
	add	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [sp, #36]
	b	LBB1_22
LBB1_22:                                ;   in Loop: Header=BB1_16 Depth=2
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #40]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	b.eq	LBB1_24
	b	LBB1_23
LBB1_23:
	ldur	x0, [x29, #-40]
	bl	_free
	ldur	x0, [x29, #-48]
	bl	_free
	mov	w8, #4                          ; =0x4
	stur	w8, [x29, #-4]
	b	LBB1_29
LBB1_24:                                ;   in Loop: Header=BB1_16 Depth=2
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #40]
	ldrsw	x9, [x8, x9, lsl #2]
	ldr	x8, [sp, #64]
	add	x8, x8, x9
	str	x8, [sp, #64]
	b	LBB1_25
LBB1_25:                                ;   in Loop: Header=BB1_16 Depth=2
	ldr	x8, [sp, #48]
	add	x8, x8, #1
	str	x8, [sp, #48]
	b	LBB1_16
LBB1_26:                                ;   in Loop: Header=BB1_14 Depth=1
	b	LBB1_27
LBB1_27:                                ;   in Loop: Header=BB1_14 Depth=1
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	str	x8, [sp, #56]
	b	LBB1_14
LBB1_28:
	ldur	x10, [x29, #-24]
	ldr	x8, [sp, #64]
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-40]
	bl	_free
	ldur	x0, [x29, #-48]
	bl	_free
	stur	wzr, [x29, #-4]
	b	LBB1_29
LBB1_29:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS stencil side=%zu checksum=%lld\n"

.subsections_via_symbols

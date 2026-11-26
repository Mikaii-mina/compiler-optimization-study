	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB0_2
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x0], #1
	ldr	w9, [x2, x8, lsl #2]
	add	w9, w9, #1
	str	w9, [x2, x8, lsl #2]
	subs	x1, x1, #1
	b.ne	LBB0_1
LBB0_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #560
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
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
	b	LBB1_23
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	mov	x0, x19
	bl	_malloc
	cbz	x0, LBB1_7
; %bb.5:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #512]
	stp	q0, q0, [sp, #480]
	stp	q0, q0, [sp, #448]
	stp	q0, q0, [sp, #416]
	stp	q0, q0, [sp, #384]
	stp	q0, q0, [sp, #352]
	stp	q0, q0, [sp, #320]
	stp	q0, q0, [sp, #288]
	stp	q0, q0, [sp, #256]
	stp	q0, q0, [sp, #224]
	stp	q0, q0, [sp, #192]
	stp	q0, q0, [sp, #160]
	stp	q0, q0, [sp, #128]
	stp	q0, q0, [sp, #96]
	stp	q0, q0, [sp, #64]
	stp	q0, q0, [sp, #32]
	cmp	x19, #4
	b.hs	LBB1_8
; %bb.6:
	mov	x8, #0                          ; =0x0
	b	LBB1_11
LBB1_7:
	mov	w19, #3                         ; =0x3
	b	LBB1_23
LBB1_8:
	mov	x9, #0                          ; =0x0
	and	x8, x19, #0xfffffffffffffffc
	mov	w10, #111                       ; =0x6f
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	sub	w11, w10, #111
	sub	w12, w10, #74
	sub	w13, w10, #37
	lsr	x14, x9, #4
	eor	w11, w11, w14
	eor	w12, w12, w14
	eor	w13, w13, w14
	eor	w14, w10, w14
	and	w11, w11, #0x3f
	and	w12, w12, #0x3f
	and	w13, w13, #0x3f
	and	w14, w14, #0x3f
	add	x15, x0, x9
	strb	w11, [x15]
	strb	w12, [x15, #1]
	strb	w13, [x15, #2]
	strb	w14, [x15, #3]
	add	x9, x9, #4
	add	x10, x10, #148
	cmp	x8, x9
	b.ne	LBB1_9
; %bb.10:
	cmp	x19, x8
	b.eq	LBB1_13
LBB1_11:
	mov	w9, #37                         ; =0x25
	mul	x9, x8, x9
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	eor	w10, w9, w8, lsr #4
	and	w10, w10, #0x3f
	strb	w10, [x0, x8]
	add	x8, x8, #1
	add	x9, x9, #37
	cmp	x19, x8
	b.ne	LBB1_12
LBB1_13:
	mov	x8, #0                          ; =0x0
	add	x9, sp, #288
LBB1_14:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x0, x8]
	ldr	w11, [x9, x10, lsl #2]
	add	w11, w11, #1
	str	w11, [x9, x10, lsl #2]
	add	x8, x8, #1
	cmp	x19, x8
	b.ne	LBB1_14
; %bb.15:
	mov	x8, #0                          ; =0x0
	add	x9, sp, #32
LBB1_16:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x0, x8]
	ldr	w11, [x9, x10, lsl #2]
	add	w11, w11, #1
	str	w11, [x9, x10, lsl #2]
	add	x8, x8, #1
	cmp	x19, x8
	b.ne	LBB1_16
; %bb.17:
	mov	x9, #0                          ; =0x0
	mov	x8, #0                          ; =0x0
	add	x10, sp, #288
	add	x11, sp, #32
LBB1_18:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10, x9, lsl #2]
	ldr	w13, [x11, x9, lsl #2]
	cmp	w12, w13
	b.ne	LBB1_21
; %bb.19:                               ;   in Loop: Header=BB1_18 Depth=1
	add	x9, x9, #1
	madd	x8, x9, x12, x8
	cmp	x9, #64
	b.ne	LBB1_18
; %bb.20:
	str	x8, [sp, #16]
	mov	w8, #64                         ; =0x40
	stp	x19, x8, [sp]
Lloh3:
	adrp	x8, l_.str@PAGE
Lloh4:
	add	x8, x8, l_.str@PAGEOFF
	mov	x19, x0
	mov	x0, x8
	bl	_printf
	mov	x0, x19
	mov	w19, #0                         ; =0x0
	b	LBB1_22
LBB1_21:
	mov	w19, #4                         ; =0x4
LBB1_22:
	bl	_free
LBB1_23:
	ldur	x8, [x29, #-24]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB1_25
; %bb.24:
	mov	x0, x19
	add	sp, sp, #560
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_25:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS histogram n=%zu buckets=%d checksum=%llu\n"

.subsections_via_symbols

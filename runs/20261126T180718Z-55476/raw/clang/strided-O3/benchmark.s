	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_kernel                         ; -- Begin function kernel
	.p2align	2
_kernel:                                ; @kernel
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB0_8
; %bb.1:
	cmp	x2, #4
	b.hs	LBB0_3
; %bb.2:
	mov	x8, #0                          ; =0x0
	b	LBB0_6
LBB0_3:
	and	x8, x2, #0xfffffffffffffffc
	add	x9, x1, #24
	add	x10, x0, #24
	mov	w11, #1                         ; =0x1
	mov	x12, x8
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w13, [x10, #-24]
	ldur	w14, [x10, #-12]
	ldr	w15, [x10]
	orr	w13, w11, w13, lsl #1
	ldr	w16, [x10, #12]
	orr	w14, w11, w14, lsl #1
	orr	w15, w11, w15, lsl #1
	stur	w13, [x9, #-24]
	stur	w14, [x9, #-12]
	orr	w13, w11, w16, lsl #1
	str	w15, [x9]
	str	w13, [x9, #12]
	add	x9, x9, #48
	add	x10, x10, #48
	subs	x12, x12, #4
	b.ne	LBB0_4
; %bb.5:
	cmp	x2, x8
	b.eq	LBB0_8
LBB0_6:
	sub	x9, x2, x8
	add	x8, x8, x8, lsl #1
	lsl	x10, x8, #2
	add	x8, x1, x10
	add	x10, x0, x10
	mov	w11, #1                         ; =0x1
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x10], #12
	orr	w12, w11, w12, lsl #1
	str	w12, [x8], #12
	subs	x9, x9, #1
	b.ne	LBB0_7
LBB0_8:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
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
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB1_3:
	mov	w19, #32768                     ; =0x8000
LBB1_4:
	add	x21, x19, x19, lsl #1
	lsl	x0, x21, #2
	bl	_malloc
	mov	x22, x0
	mov	x0, x21
	mov	w1, #4                          ; =0x4
	bl	_calloc
	mov	x20, x0
	cmp	x22, #0
	ccmp	x0, #0, #4, ne
	b.ne	LBB1_6
; %bb.5:
	mov	w19, #3                         ; =0x3
	b	LBB1_25
LBB1_6:
	mov	x8, #20945                      ; =0x51d1
	movk	x8, #12161, lsl #16
	movk	x8, #32430, lsl #32
	movk	x8, #20944, lsl #48
	cmp	x19, #2
	b.hs	LBB1_8
; %bb.7:
	mov	x9, #0                          ; =0x0
	b	LBB1_11
LBB1_8:
	mov	x10, #0                         ; =0x0
	and	x9, x21, #0x7ffffffffffffffc
	add	x11, x22, #8
	mov	w12, #3                         ; =0x3
	mov	w13, #2                         ; =0x2
	mov	w14, #1                         ; =0x1
	mov	w15, #97                        ; =0x61
	mov	x16, x9
LBB1_9:                                 ; =>This Inner Loop Header: Depth=1
	umulh	x17, x12, x8
	sub	x1, x12, x17
	add	x17, x17, x1, lsr #1
	lsr	x17, x17, #6
	msub	w17, w17, w15, w12
	umulh	x1, x10, x8
	sub	x2, x10, x1
	add	x1, x1, x2, lsr #1
	lsr	x1, x1, #6
	msub	w1, w1, w15, w10
	umulh	x2, x13, x8
	sub	x3, x13, x2
	add	x2, x2, x3, lsr #1
	lsr	x2, x2, #6
	msub	w2, w2, w15, w13
	umulh	x3, x14, x8
	sub	x4, x14, x3
	add	x3, x3, x4, lsr #1
	lsr	x3, x3, #6
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
	sub	x10, x9, x21
	add	x11, x22, x9, lsl #2
	mov	w12, #97                        ; =0x61
LBB1_12:                                ; =>This Inner Loop Header: Depth=1
	umulh	x13, x9, x8
	sub	x14, x9, x13
	add	x13, x13, x14, lsr #1
	lsr	x13, x13, #6
	msub	w13, w13, w12, w9
	add	x9, x9, #1
	str	w13, [x11], #4
	adds	x10, x10, #1
	b.lo	LBB1_12
LBB1_13:
	cmp	x19, #4
	b.hs	LBB1_15
; %bb.14:
	mov	x9, #0                          ; =0x0
	b	LBB1_18
LBB1_15:
	and	x9, x19, #0xfffffffffffffffc
	add	x10, x20, #24
	add	x11, x22, #24
	mov	w12, #1                         ; =0x1
	mov	x13, x9
LBB1_16:                                ; =>This Inner Loop Header: Depth=1
	ldur	w14, [x11, #-24]
	ldur	w15, [x11, #-12]
	ldr	w16, [x11]
	orr	w14, w12, w14, lsl #1
	ldr	w17, [x11, #12]
	orr	w15, w12, w15, lsl #1
	orr	w16, w12, w16, lsl #1
	stur	w14, [x10, #-24]
	stur	w15, [x10, #-12]
	orr	w14, w12, w17, lsl #1
	str	w16, [x10]
	str	w14, [x10, #12]
	add	x10, x10, #48
	add	x11, x11, #48
	subs	x13, x13, #4
	b.ne	LBB1_16
; %bb.17:
	cmp	x19, x9
	b.eq	LBB1_20
LBB1_18:
	sub	x10, x19, x9
	add	x9, x9, x9, lsl #1
	lsl	x11, x9, #2
	add	x9, x20, x11
	add	x11, x22, x11
	mov	w12, #1                         ; =0x1
LBB1_19:                                ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x11], #12
	orr	w13, w12, w13, lsl #1
	str	w13, [x9], #12
	subs	x10, x10, #1
	b.ne	LBB1_19
LBB1_20:
	mov	x10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	mov	w12, #1                         ; =0x1
	mov	w13, #194                       ; =0xc2
	mov	x14, #-6148914691236517206      ; =0xaaaaaaaaaaaaaaaa
	movk	x14, #43691
	mov	x15, x20
LBB1_21:                                ; =>This Inner Loop Header: Depth=1
	umulh	x16, x11, x8
	sub	x17, x11, x16
	add	x16, x16, x17, lsr #1
	lsr	x16, x16, #6
	msub	w16, w16, w13, w12
	umulh	x17, x11, x14
	lsr	x17, x17, #1
	add	x17, x17, x17, lsl #1
	cmn	x10, x17
	csel	w16, wzr, w16, ne
	ldr	w17, [x15], #4
	cmp	w17, w16
	b.ne	LBB1_24
; %bb.22:                               ;   in Loop: Header=BB1_21 Depth=1
	add	x9, x9, w16, uxtw
	add	x11, x11, #1
	add	w12, w12, #2
	sub	x10, x10, #1
	sub	x21, x21, #1
	cbnz	x21, LBB1_21
; %bb.23:
	mov	w8, #3                          ; =0x3
	stp	x8, x9, [sp, #8]
	str	x19, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w19, #0                         ; =0x0
	b	LBB1_25
LBB1_24:
	mov	w19, #4                         ; =0x4
LBB1_25:
	mov	x0, x22
	bl	_free
	mov	x0, x20
	bl	_free
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"PASS strided n=%zu stride=%d checksum=%lld\n"

.subsections_via_symbols

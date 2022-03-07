	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m4
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	fpv4-sp-d16
	.eabi_attribute	27, 1	@ Tag_ABI_HardFP_use
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"Regexp.c"
	.p2align	2                               @ -- Begin function match
	.type	match,%function
	.code	32                              @ @match
match:
.Lfunc_begin0:
	.file	1 "/home/isak/Documents/xj/klee-fork/klee/examples/regexp" "Regexp.c"
	.loc	1 34 0                          @ Regexp.c:34:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: match:re <- $r0
	.save	{r4, r5, r11, lr}
	push	{r4, r5, r11, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r5, -12
	.cfi_offset r4, -16
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.cfi_def_cfa r11, 8
	mov	r4, r0
.Ltmp0:
	@DEBUG_VALUE: match:re <- $r4
	.loc	1 35 7 prologue_end             @ Regexp.c:35:7
	ldrb	r0, [r0]
.Ltmp1:
	.loc	1 35 7 is_stmt 0                @ Regexp.c:35:7
	cmp	r0, #94
	@DEBUG_VALUE: match:text <- undef
	bne	.LBB0_2
.Ltmp2:
@ %bb.1:                                @ %.customlabel0
	@DEBUG_VALUE: match:re <- $r4
	.loc	1 36 12 is_stmt 1               @ Regexp.c:36:12
	ldr	r1, .LCPI0_0
	.loc	1 36 24 is_stmt 0               @ Regexp.c:36:24
	add	r0, r4, #1
	.loc	1 36 12                         @ Regexp.c:36:12
	pop	{r4, r5, r11, lr}
.Ltmp3:
	@DEBUG_VALUE: match:re <- [DW_OP_LLVM_entry_value 1] $r0
	b	matchhere
.Ltmp4:
.LBB0_2:                                @ %.preheader.preheader
	@DEBUG_VALUE: match:re <- $r4
	.loc	1 0 12                          @ Regexp.c:0:12
	ldr	r5, .LCPI0_0
.Ltmp5:
.LBB0_3:                                @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: match:re <- $r4
	@DEBUG_VALUE: match:text <- $r5
	.loc	1 38 9 is_stmt 1                @ Regexp.c:38:9
	mov	r0, r4
	mov	r1, r5
	bl	matchhere
.Ltmp6:
	.loc	1 38 9 is_stmt 0                @ Regexp.c:38:9
	cmp	r0, #0
	bne	.LBB0_5
.Ltmp7:
@ %bb.4:                                @ %.customlabel1
                                        @   in Loop: Header=BB0_3 Depth=1
	@DEBUG_VALUE: match:text <- $r5
	@DEBUG_VALUE: match:re <- $r4
	.loc	1 40 12 is_stmt 1               @ Regexp.c:40:12
	ldrb	r0, [r5], #1
.Ltmp8:
	@DEBUG_VALUE: match:text <- $r5
	.loc	1 40 3 is_stmt 0                @ Regexp.c:40:3
	cmp	r0, #0
	bne	.LBB0_3
.Ltmp9:
.LBB0_5:                                @ %.loopexit
	@DEBUG_VALUE: match:text <- $r5
	@DEBUG_VALUE: match:re <- $r4
	.loc	1 42 1 is_stmt 1                @ Regexp.c:42:1
	pop	{r4, r5, r11, lr}
.Ltmp10:
	@DEBUG_VALUE: match:re <- [DW_OP_LLVM_entry_value 1] $r0
	mov	pc, lr
.Ltmp11:
	.p2align	2
@ %bb.6:
	.loc	1 0 1 is_stmt 0                 @ Regexp.c:0:1
.LCPI0_0:
	.long	.L.str.1
.Lfunc_end0:
	.size	match, .Lfunc_end0-match
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function matchhere
	.type	matchhere,%function
	.code	32                              @ @matchhere
matchhere:
.Lfunc_begin1:
	.loc	1 22 0 is_stmt 1                @ Regexp.c:22:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: matchhere:re <- $r0
	@DEBUG_VALUE: matchhere:text <- $r1
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
.Ltmp12:
	.loc	1 23 7 prologue_end             @ Regexp.c:23:7
	ldrb	r2, [r0]
	mov	r12, r1
.Ltmp13:
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 0 7 is_stmt 0                 @ Regexp.c:0:7
	mov	r1, r0
.Ltmp14:
	@DEBUG_VALUE: matchhere:re <- $r1
	mov	r0, #0
.Ltmp15:
	.loc	1 23 7                          @ Regexp.c:23:7
	cmp	r2, #0
	beq	.LBB1_7
.Ltmp16:
@ %bb.1:                                @ %.lr.ph.preheader
	@DEBUG_VALUE: matchhere:re <- $r1
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 25 7 is_stmt 1                @ Regexp.c:25:7
	add	lr, r1, #1
.Ltmp17:
.LBB1_2:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: matchhere:re <- [DW_OP_LLVM_arg 0, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 25 7 is_stmt 0                @ Regexp.c:25:7
	ldrb	r3, [lr]
.Ltmp18:
	.loc	1 25 7                          @ Regexp.c:25:7
	cmp	r3, #42
	beq	.LBB1_8
.Ltmp19:
@ %bb.3:                                @ %.customlabel1
                                        @   in Loop: Header=BB1_2 Depth=1
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 27 20 is_stmt 1               @ Regexp.c:27:20
	cmp	r2, #36
	cmpeq	r3, #0
	beq	.LBB1_9
.Ltmp20:
@ %bb.4:                                @ %.customlabel3
                                        @   in Loop: Header=BB1_2 Depth=1
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 29 7                          @ Regexp.c:29:7
	ldrb	r1, [r12]
	.loc	1 29 19 is_stmt 0               @ Regexp.c:29:19
	cmp	r1, #0
	beq	.LBB1_7
.Ltmp21:
@ %bb.5:                                @ %.customlabel4
                                        @   in Loop: Header=BB1_2 Depth=1
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 0 19                          @ Regexp.c:0:19
	subs	r1, r2, r1
	movne	r1, #1
	.loc	1 29 28                         @ Regexp.c:29:28
	subs	r2, r2, #46
	movne	r2, #1
	@DEBUG_VALUE: matchhere:text <- $r12
.Ltmp22:
	@DEBUG_VALUE: matchhere:re <- [DW_OP_LLVM_arg 0, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	1 29 34                         @ Regexp.c:29:34
	tst	r2, r1
	bne	.LBB1_7
.Ltmp23:
@ %bb.6:                                @ %.customlabel4
                                        @   in Loop: Header=BB1_2 Depth=1
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 0 34                          @ Regexp.c:0:34
	add	lr, lr, #1
	add	r12, r12, #1
.Ltmp24:
	.loc	1 29 34                         @ Regexp.c:29:34
	cmp	r3, #0
	mov	r2, r3
	bne	.LBB1_2
.Ltmp25:
.LBB1_7:                                @ %.loopexit
	.loc	1 32 1 is_stmt 1                @ Regexp.c:32:1
	pop	{r11, lr}
	mov	pc, lr
.LBB1_8:                                @ %.customlabel0
.Ltmp26:
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 26 22                         @ Regexp.c:26:22
	ldrsb	r0, [lr, #-1]
	.loc	1 26 12 is_stmt 0               @ Regexp.c:26:12
	add	r1, lr, #1
	mov	r2, r12
	pop	{r11, lr}
	b	matchstar
.Ltmp27:
.LBB1_9:                                @ %.customlabel2
	@DEBUG_VALUE: matchhere:text <- $r12
	.loc	1 28 12 is_stmt 1               @ Regexp.c:28:12
	ldrb	r0, [r12]
	.loc	1 28 18 is_stmt 0               @ Regexp.c:28:18
	rsbs	r1, r0, #0
	adc	r0, r0, r1
.Ltmp28:
	.loc	1 32 1 is_stmt 1                @ Regexp.c:32:1
	pop	{r11, lr}
	mov	pc, lr
.Ltmp29:
.Lfunc_end1:
	.size	matchhere, .Lfunc_end1-matchhere
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	main                            @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	32                              @ @main
main:
.Lfunc_begin2:
	.loc	1 51 0                          @ Regexp.c:51:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r10, -12
	.cfi_offset r4, -16
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.cfi_def_cfa r11, 8
	.pad	#16
	sub	sp, sp, #16
.Ltmp30:
	.loc	1 56 3 prologue_end             @ Regexp.c:56:3
	ldr	r0, .LCPI2_0
	add	r4, sp, #9
	mov	r2, #7
	mov	r3, #0
	str	r0, [sp]
	mov	r0, r4
	bl	klee_make_symbolic
	.loc	1 59 3                          @ Regexp.c:59:3
	mov	r0, r4
	bl	match
	.loc	1 61 3                          @ Regexp.c:61:3
	mov	r0, #0
	sub	sp, r11, #8
	pop	{r4, r10, r11, lr}
	mov	pc, lr
.Ltmp31:
	.p2align	2
@ %bb.1:
	.loc	1 0 3 is_stmt 0                 @ Regexp.c:0:3
.LCPI2_0:
	.long	.L.str
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function matchstar
	.type	matchstar,%function
	.code	32                              @ @matchstar
matchstar:
.Lfunc_begin3:
	.loc	1 14 0 is_stmt 1                @ Regexp.c:14:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: matchstar:c <- $r0
	@DEBUG_VALUE: matchstar:re <- $r1
	@DEBUG_VALUE: matchstar:text <- $r2
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r10, -12
	.cfi_offset r6, -16
	.cfi_offset r5, -20
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.cfi_def_cfa r11, 8
	mov	r4, r2
.Ltmp32:
	@DEBUG_VALUE: matchstar:text <- $r4
	@DEBUG_VALUE: matchstar:text <- $r4
	mov	r5, r1
.Ltmp33:
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:c <- $r0
	.loc	1 15 3 prologue_end             @ Regexp.c:15:3
	cmp	r0, #46
	bne	.LBB3_4
.Ltmp34:
.LBB3_1:                                @ %.split.us
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 16 9                          @ Regexp.c:16:9
	mov	r0, r5
.Ltmp35:
	@DEBUG_VALUE: matchstar:c <- [DW_OP_LLVM_entry_value 1] $r0
	mov	r1, r4
	bl	matchhere
.Ltmp36:
	.loc	1 16 9 is_stmt 0                @ Regexp.c:16:9
	cmp	r0, #0
	bne	.LBB3_9
.Ltmp37:
@ %bb.2:                                @ %.customlabel0
                                        @   in Loop: Header=BB3_1 Depth=1
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 18 12 is_stmt 1               @ Regexp.c:18:12
	ldrb	r0, [r4]
	.loc	1 18 26 is_stmt 0               @ Regexp.c:18:26
	cmp	r0, #0
	beq	.LBB3_10
.Ltmp38:
@ %bb.3:                                @ %.customlabel1
                                        @   in Loop: Header=BB3_1 Depth=1
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 18 35                         @ Regexp.c:18:35
	add	r4, r4, #1
.Ltmp39:
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 0 35                          @ Regexp.c:0:35
	b	.LBB3_1
.Ltmp40:
.LBB3_4:
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	@DEBUG_VALUE: matchstar:c <- $r0
	mov	r6, r0
.Ltmp41:
	@DEBUG_VALUE: matchstar:c <- $r6
	@DEBUG_VALUE: matchstar:c <- $r6
.LBB3_5:                                @ %..split_crit_edge
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: matchstar:c <- $r6
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 16 9 is_stmt 1                @ Regexp.c:16:9
	mov	r0, r5
	mov	r1, r4
	bl	matchhere
.Ltmp42:
	.loc	1 16 9 is_stmt 0                @ Regexp.c:16:9
	cmp	r0, #0
	bne	.LBB3_9
.Ltmp43:
@ %bb.6:                                @ %.customlabel2
                                        @   in Loop: Header=BB3_5 Depth=1
	@DEBUG_VALUE: matchstar:c <- $r6
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 18 12 is_stmt 1               @ Regexp.c:18:12
	ldrsb	r1, [r4]
	mov	r0, #0
	.loc	1 18 26 is_stmt 0               @ Regexp.c:18:26
	cmp	r1, #0
	beq	.LBB3_8
.Ltmp44:
@ %bb.7:                                @ %.customlabel3
                                        @   in Loop: Header=BB3_5 Depth=1
	@DEBUG_VALUE: matchstar:c <- $r6
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 18 35                         @ Regexp.c:18:35
	add	r4, r4, #1
.Ltmp45:
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 18 3                          @ Regexp.c:18:3
	cmp	r1, r6
	beq	.LBB3_5
.Ltmp46:
.LBB3_8:                                @ %.critedge
	@DEBUG_VALUE: matchstar:c <- $r6
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 20 1 is_stmt 1                @ Regexp.c:20:1
	pop	{r4, r5, r6, r10, r11, lr}
.Ltmp47:
	@DEBUG_VALUE: matchstar:c <- [DW_OP_LLVM_entry_value 1] $r0
	@DEBUG_VALUE: matchstar:re <- [DW_OP_LLVM_entry_value 1] $r1
	mov	pc, lr
.Ltmp48:
.LBB3_9:
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 0 1 is_stmt 0                 @ Regexp.c:0:1
	mov	r0, #1
	.loc	1 20 1                          @ Regexp.c:20:1
	pop	{r4, r5, r6, r10, r11, lr}
.Ltmp49:
	@DEBUG_VALUE: matchstar:re <- [DW_OP_LLVM_entry_value 1] $r1
	mov	pc, lr
.Ltmp50:
.LBB3_10:
	@DEBUG_VALUE: matchstar:re <- $r5
	@DEBUG_VALUE: matchstar:text <- $r4
	.loc	1 0 1                           @ Regexp.c:0:1
	mov	r0, #0
	.loc	1 20 1                          @ Regexp.c:20:1
	pop	{r4, r5, r6, r10, r11, lr}
.Ltmp51:
	@DEBUG_VALUE: matchstar:re <- [DW_OP_LLVM_entry_value 1] $r1
	@DEBUG_VALUE: matchstar:re <- [DW_OP_LLVM_entry_value 1] $r1
	mov	pc, lr
.Ltmp52:
.Lfunc_end3:
	.size	matchstar, .Lfunc_end3-matchstar
	.cfi_endproc
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"re"
	.size	.L.str, 3

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"hello"
	.size	.L.str.1, 6

	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp3-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	80                              @ DW_OP_reg0
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp11-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	80                              @ DW_OP_reg0
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Lfunc_begin1-.Lfunc_begin0
	.long	.Ltmp14-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp14-.Lfunc_begin0
	.long	.Ltmp17-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc3:
	.long	.Lfunc_begin1-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp13-.Lfunc_begin0
	.long	.Ltmp24-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	92                              @ DW_OP_reg12
	.long	.Ltmp26-.Lfunc_begin0
	.long	.Lfunc_end1-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	92                              @ DW_OP_reg12
	.long	0
	.long	0
.Ldebug_loc4:
	.long	.Lfunc_begin3-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp35-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	80                              @ DW_OP_reg0
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp40-.Lfunc_begin0
	.long	.Ltmp41-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp41-.Lfunc_begin0
	.long	.Ltmp47-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	86                              @ DW_OP_reg6
	.long	.Ltmp47-.Lfunc_begin0
	.long	.Ltmp48-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	80                              @ DW_OP_reg0
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc5:
	.long	.Lfunc_begin3-.Lfunc_begin0
	.long	.Ltmp33-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp33-.Lfunc_begin0
	.long	.Ltmp47-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	.Ltmp47-.Lfunc_begin0
	.long	.Ltmp48-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp48-.Lfunc_begin0
	.long	.Ltmp49-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	.Ltmp49-.Lfunc_begin0
	.long	.Ltmp50-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp50-.Lfunc_begin0
	.long	.Ltmp51-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	.Ltmp51-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc6:
	.long	.Lfunc_begin3-.Lfunc_begin0
	.long	.Ltmp32-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp47-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	.Ltmp48-.Lfunc_begin0
	.long	.Ltmp49-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	.Ltmp50-.Lfunc_begin0
	.long	.Ltmp51-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	0
	.long	0
	.section	.debug_abbrev,"",%progbits
	.byte	1                               @ Abbreviation Code
	.byte	17                              @ DW_TAG_compile_unit
	.byte	1                               @ DW_CHILDREN_yes
	.byte	37                              @ DW_AT_producer
	.byte	14                              @ DW_FORM_strp
	.byte	19                              @ DW_AT_language
	.byte	5                               @ DW_FORM_data2
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	16                              @ DW_AT_stmt_list
	.byte	23                              @ DW_FORM_sec_offset
	.byte	27                              @ DW_AT_comp_dir
	.byte	14                              @ DW_FORM_strp
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	2                               @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	23                              @ DW_FORM_sec_offset
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	4                               @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	39                              @ DW_AT_prototyped
	.byte	25                              @ DW_FORM_flag_present
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
	.byte	36                              @ DW_TAG_base_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	62                              @ DW_AT_encoding
	.byte	11                              @ DW_FORM_data1
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	8                               @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	10                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
	.byte	36                              @ DW_TAG_base_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.byte	62                              @ DW_AT_encoding
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	0                               @ EOM(3)
	.section	.debug_info,"",%progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 @ Length of Unit
.Ldebug_info_start0:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0x111 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0x34 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string3                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	34                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	245                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x3b:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    @ DW_AT_location
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	34                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x4a:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1                    @ DW_AT_location
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	34                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	4                               @ Abbrev [4] 0x5a:0x34 DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string5                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	22                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	245                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x6f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2                    @ DW_AT_location
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	22                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x7e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc3                    @ DW_AT_location
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	22                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x8e:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	51                              @ DW_AT_decl_line
	.long	245                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	6                               @ Abbrev [6] 0xa3:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	9
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	53                              @ DW_AT_decl_line
	.long	264                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	4                               @ Abbrev [4] 0xb2:0x43 DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	245                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xc7:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4                    @ DW_AT_location
	.long	.Linfo_string12                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	245                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xd6:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5                    @ DW_AT_location
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xe5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6                    @ DW_AT_location
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	252                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0xf5:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0xfc:0x5 DW_TAG_pointer_type
	.long	257                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x101:0x7 DW_TAG_base_type
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	6                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	9                               @ Abbrev [9] 0x108:0xc DW_TAG_array_type
	.long	257                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x10d:0x6 DW_TAG_subrange_type
	.long	276                             @ DW_AT_type
	.byte	7                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x114:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55" @ string offset=0
.Linfo_string1:
	.asciz	"Regexp.c"                      @ string offset=83
.Linfo_string2:
	.asciz	"/home/isak/Documents/xj/klee-fork/klee/examples/regexp" @ string offset=92
.Linfo_string3:
	.asciz	"match"                         @ string offset=147
.Linfo_string4:
	.asciz	"int"                           @ string offset=153
.Linfo_string5:
	.asciz	"matchhere"                     @ string offset=157
.Linfo_string6:
	.asciz	"main"                          @ string offset=167
.Linfo_string7:
	.asciz	"matchstar"                     @ string offset=172
.Linfo_string8:
	.asciz	"re"                            @ string offset=182
.Linfo_string9:
	.asciz	"char"                          @ string offset=185
.Linfo_string10:
	.asciz	"text"                          @ string offset=190
.Linfo_string11:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=195
.Linfo_string12:
	.asciz	"c"                             @ string offset=215
	.ident	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
	.section	.debug_line,"",%progbits
.Lline_table_start0:

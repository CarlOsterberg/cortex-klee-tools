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
	.file	"sort.c"
	.p2align	2                               @ -- Begin function bubble_sort
	.type	bubble_sort,%function
	.code	32                              @ @bubble_sort
bubble_sort:
.Lfunc_begin0:
	.file	1 "/home/isak/Documents/xj/klee-fork/klee/examples/sort" "sort.c"
	.loc	1 21 0                          @ sort.c:21:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:                                @ %.lr.ph
	@DEBUG_VALUE: bubble_sort:array <- $r0
	@DEBUG_VALUE: bubble_sort:nelem <- 4
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
.Ltmp0:
	@DEBUG_VALUE: done <- 1
	@DEBUG_VALUE: i <- 0
	.loc	1 26 24 prologue_end            @ sort.c:26:24
	ldr	r12, [r0]
	mov	r3, #0
	mov	lr, #0
	b	.LBB0_3
.Ltmp1:
.LBB0_1:                                @   in Loop: Header=BB0_3 Depth=1
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r3
	@DEBUG_VALUE: bubble_sort:nelem <- 4
	@DEBUG_VALUE: bubble_sort:array <- $r0
	@DEBUG_VALUE: t <- $r2
	.loc	1 28 24                         @ sort.c:28:24
	ldr	r12, [r0, r3, lsl #2]
	.loc	1 28 22 is_stmt 0               @ sort.c:28:22
	str	r12, [r0, r1, lsl #2]
	.loc	1 29 18 is_stmt 1               @ sort.c:29:18
	str	r2, [r0, r3, lsl #2]
.Ltmp2:
	@DEBUG_VALUE: done <- 0
.LBB0_2:                                @   in Loop: Header=BB0_3 Depth=1
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r3
	@DEBUG_VALUE: bubble_sort:nelem <- 4
	@DEBUG_VALUE: bubble_sort:array <- $r0
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r1
	.loc	1 25 32                         @ sort.c:25:32
	eor	r2, r1, #3
	mov	r3, r1
.Ltmp3:
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r3
	orrs	r2, r2, lr
.Ltmp4:
	.loc	1 36 1                          @ sort.c:36:1
	popeq	{r11, lr}
	moveq	pc, lr
.Ltmp5:
.LBB0_3:                                @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: bubble_sort:nelem <- 4
	@DEBUG_VALUE: bubble_sort:array <- $r0
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r3
	.loc	1 25 41                         @ sort.c:25:41
	adds	r1, r3, #1
.Ltmp6:
	.loc	1 26 11                         @ sort.c:26:11
	ldr	r2, [r0, r1, lsl #2]
.Ltmp7:
	.loc	1 25 41                         @ sort.c:25:41
	adc	lr, lr, #0
.Ltmp8:
	.loc	1 26 11                         @ sort.c:26:11
	cmp	r2, r12
	blt	.LBB0_1
.Ltmp9:
@ %bb.4:                                @   in Loop: Header=BB0_3 Depth=1
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r3
	@DEBUG_VALUE: bubble_sort:nelem <- 4
	@DEBUG_VALUE: bubble_sort:array <- $r0
	.loc	1 0 11 is_stmt 0                @ sort.c:0:11
	mov	r12, r2
	b	.LBB0_2
.Lfunc_end0:
	.size	bubble_sort, .Lfunc_end0-bubble_sort
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function insertion_sort
	.type	insertion_sort,%function
	.code	32                              @ @insertion_sort
insertion_sort:
.Lfunc_begin1:
	.loc	1 38 0 is_stmt 1                @ sort.c:38:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: insertion_sort:array <- $r0
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r7, -12
	.cfi_offset r6, -16
	.cfi_offset r5, -20
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.cfi_def_cfa r11, 8
	mov	r4, r0
.Ltmp10:
	@DEBUG_VALUE: insertion_sort:array <- $r4
	@DEBUG_VALUE: insertion_sort:nelem <- 4
	@DEBUG_VALUE: insertion_sort:array <- $r4
	.loc	1 39 15 prologue_end            @ sort.c:39:15
	mov	r0, #16
	mov	r1, #0
	mov	r6, #0
	bl	malloc
	mov	r5, r0
	@DEBUG_VALUE: i <- 0
.Ltmp11:
	@DEBUG_VALUE: insertion_sort:temp <- $r5
	.loc	1 0 15 is_stmt 0                @ sort.c:0:15
	mov	r7, #0
.Ltmp12:
.LBB1_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: insertion_sort:temp <- $r5
	@DEBUG_VALUE: insertion_sort:nelem <- 4
	@DEBUG_VALUE: insertion_sort:array <- $r4
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r6
	.loc	1 42 29 is_stmt 1               @ sort.c:42:29
	ldr	r2, [r4, r6, lsl #2]
	.loc	1 42 5 is_stmt 0                @ sort.c:42:5
	mov	r0, r5
	mov	r1, r6
	bl	insert_ordered
	.loc	1 41 36 is_stmt 1               @ sort.c:41:36
	adds	r6, r6, #1
.Ltmp13:
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 0 32] $r6
	adc	r7, r7, #0
.Ltmp14:
	@DEBUG_VALUE: i <- [DW_OP_LLVM_fragment 32 32] $r7
	.loc	1 41 26 is_stmt 0               @ sort.c:41:26
	eor	r0, r6, #4
	orrs	r0, r0, r7
.Ltmp15:
	.loc	1 41 3                          @ sort.c:41:3
	bne	.LBB1_1
.Ltmp16:
@ %bb.2:                                @ %._crit_edge
	@DEBUG_VALUE: insertion_sort:temp <- $r5
	@DEBUG_VALUE: insertion_sort:nelem <- 4
	@DEBUG_VALUE: insertion_sort:array <- $r4
	.loc	1 44 3 is_stmt 1                @ sort.c:44:3
	mov	r0, r4
	mov	r1, r5
	mov	r2, #16
	mov	r3, #0
	bl	memcpy
	.loc	1 45 3                          @ sort.c:45:3
	mov	r0, r5
	pop	{r4, r5, r6, r7, r11, lr}
.Ltmp17:
	b	free
.Ltmp18:
.Lfunc_end1:
	.size	insertion_sort, .Lfunc_end1-insertion_sort
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function insert_ordered
	.type	insert_ordered,%function
	.code	32                              @ @insert_ordered
insert_ordered:
.Lfunc_begin2:
	.loc	1 8 0                           @ sort.c:8:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: insert_ordered:array <- $r0
	@DEBUG_VALUE: insert_ordered:nelem <- $r1
	@DEBUG_VALUE: insert_ordered:item <- $r2
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r7, -12
	.cfi_offset r6, -16
	.cfi_offset r5, -20
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.cfi_def_cfa r11, 8
	mov	r4, r2
.Ltmp19:
	@DEBUG_VALUE: insert_ordered:item <- $r4
	@DEBUG_VALUE: insert_ordered:item <- $r4
	mov	r6, r0
.Ltmp20:
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:i <- 0
	@DEBUG_VALUE: insert_ordered:array <- $r6
	mov	r7, #0
.Ltmp21:
	.loc	1 11 3 prologue_end             @ sort.c:11:3
	cmp	r1, #0
	beq	.LBB2_5
.Ltmp22:
.LBB2_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:item <- $r4
	@DEBUG_VALUE: insert_ordered:nelem <- $r1
	@DEBUG_VALUE: insert_ordered:i <- $r7
	.loc	1 12 16                         @ sort.c:12:16
	mov	r5, r6
	ldr	r0, [r5, r7, lsl #2]!
.Ltmp23:
	.loc	1 12 9 is_stmt 0                @ sort.c:12:9
	cmp	r0, r4
	bgt	.LBB2_4
.Ltmp24:
@ %bb.2:                                @   in Loop: Header=BB2_1 Depth=1
	@DEBUG_VALUE: insert_ordered:i <- $r7
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:item <- $r4
	@DEBUG_VALUE: insert_ordered:nelem <- $r1
	.loc	1 11 22 is_stmt 1               @ sort.c:11:22
	add	r7, r7, #1
.Ltmp25:
	@DEBUG_VALUE: insert_ordered:i <- $r7
	.loc	1 11 3 is_stmt 0                @ sort.c:11:3
	cmp	r1, r7
	bne	.LBB2_1
.Ltmp26:
@ %bb.3:                                @ %..loopexit_crit_edge
	@DEBUG_VALUE: insert_ordered:i <- $r7
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:item <- $r4
	@DEBUG_VALUE: insert_ordered:nelem <- $r1
	.loc	1 0 3                           @ sort.c:0:3
	mov	r7, r1
.Ltmp27:
	@DEBUG_VALUE: insert_ordered:nelem <- $r7
	b	.LBB2_5
.Ltmp28:
.LBB2_4:
	@DEBUG_VALUE: insert_ordered:i <- $r7
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:item <- $r4
	@DEBUG_VALUE: insert_ordered:nelem <- $r1
	.loc	1 13 16 is_stmt 1               @ sort.c:13:16
	add	r0, r6, r7, lsl #2
	.loc	1 13 63 is_stmt 0               @ sort.c:13:63
	sub	r1, r1, r7
.Ltmp29:
	@DEBUG_VALUE: insert_ordered:nelem <- [DW_OP_LLVM_entry_value 1] $r1
	.loc	1 13 16                         @ sort.c:13:16
	add	r0, r0, #4
	.loc	1 13 54                         @ sort.c:13:54
	lsl	r2, r1, #2
	lsr	r3, r1, #30
	.loc	1 13 7                          @ sort.c:13:7
	mov	r1, r5
	bl	memmove
.Ltmp30:
.LBB2_5:                                @ %.loopexit
	@DEBUG_VALUE: insert_ordered:array <- $r6
	@DEBUG_VALUE: insert_ordered:item <- $r4
	.loc	1 18 12 is_stmt 1               @ sort.c:18:12
	str	r4, [r6, r7, lsl #2]
	.loc	1 19 1                          @ sort.c:19:1
	pop	{r4, r5, r6, r7, r11, lr}
.Ltmp31:
	@DEBUG_VALUE: insert_ordered:item <- [DW_OP_LLVM_entry_value 1] $r2
	mov	pc, lr
.Ltmp32:
.Lfunc_end2:
	.size	insert_ordered, .Lfunc_end2-insert_ordered
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function test
	.type	test,%function
	.code	32                              @ @test
test:
.Lfunc_begin3:
	.loc	1 48 0                          @ sort.c:48:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: test:array <- $r0
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r7, -12
	.cfi_offset r6, -16
	.cfi_offset r5, -20
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.cfi_def_cfa r11, 8
	.pad	#8
	sub	sp, sp, #8
	mov	r6, r0
.Ltmp33:
	@DEBUG_VALUE: test:array <- $r6
	@DEBUG_VALUE: test:nelem <- 4
	@DEBUG_VALUE: test:array <- $r6
	.loc	1 49 16 prologue_end            @ sort.c:49:16
	mov	r0, #16
	mov	r1, #0
	bl	malloc
	mov	r4, r0
.Ltmp34:
	@DEBUG_VALUE: test:temp1 <- $r4
	.loc	1 50 16                         @ sort.c:50:16
	mov	r0, #16
	mov	r1, #0
	bl	malloc
	mov	r5, r0
.Ltmp35:
	@DEBUG_VALUE: test:temp2 <- $r5
	.loc	1 53 40                         @ sort.c:53:40
	ldr	r0, [r6, #12]
	.loc	1 53 10 is_stmt 0               @ sort.c:53:10
	ldm	r6, {r1, r2, r3}
	.loc	1 52 3 is_stmt 1                @ sort.c:52:3
	str	r0, [sp]
	ldr	r0, .LCPI3_0
	bl	printf
	.loc	1 55 3                          @ sort.c:55:3
	mov	r0, r4
	mov	r1, r6
	mov	r2, #16
	mov	r3, #0
	bl	memcpy
	.loc	1 56 3                          @ sort.c:56:3
	mov	r0, r5
	mov	r1, r6
	mov	r2, #16
	mov	r3, #0
	bl	memcpy
	.loc	1 58 3                          @ sort.c:58:3
	mov	r0, r4
	bl	insertion_sort
	.loc	1 59 3                          @ sort.c:59:3
	mov	r0, r5
	bl	bubble_sort
	.loc	1 62 40                         @ sort.c:62:40
	ldr	r0, [r4, #12]
	.loc	1 62 10 is_stmt 0               @ sort.c:62:10
	ldr	r6, [r4]
.Ltmp36:
	.loc	1 62 20                         @ sort.c:62:20
	ldmib	r4, {r2, r3}
	.loc	1 61 3 is_stmt 1                @ sort.c:61:3
	str	r0, [sp]
	ldr	r0, .LCPI3_1
	mov	r1, r6
	bl	printf
	.loc	1 65 40                         @ sort.c:65:40
	ldr	r0, [r5, #12]
	.loc	1 65 10 is_stmt 0               @ sort.c:65:10
	ldr	r7, [r5]
	.loc	1 65 20                         @ sort.c:65:20
	ldmib	r5, {r2, r3}
	.loc	1 64 3 is_stmt 1                @ sort.c:64:3
	str	r0, [sp]
	ldr	r0, .LCPI3_2
	mov	r1, r7
	bl	printf
	mov	r0, #1
	@DEBUG_VALUE: i <- 0
.Ltmp37:
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	.loc	1 68 5                          @ sort.c:68:5
	cmp	r6, r7
	bne	.LBB3_3
.Ltmp38:
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	@DEBUG_VALUE: test:temp2 <- $r5
	@DEBUG_VALUE: test:temp1 <- $r4
	@DEBUG_VALUE: test:nelem <- 4
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	.loc	1 67 3                          @ sort.c:67:3
	cmp	r0, #4
	beq	.LBB3_4
.Ltmp39:
@ %bb.2:                                @ %._crit_edge3
                                        @   in Loop: Header=BB3_1 Depth=1
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	@DEBUG_VALUE: test:temp2 <- $r5
	@DEBUG_VALUE: test:temp1 <- $r4
	@DEBUG_VALUE: test:nelem <- 4
	.loc	1 68 5                          @ sort.c:68:5
	ldr	r7, [r5, r0, lsl #2]
	ldr	r6, [r4, r0, lsl #2]
.Ltmp40:
	.loc	1 67 3                          @ sort.c:67:3
	add	r0, r0, #1
.Ltmp41:
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	.loc	1 68 5                          @ sort.c:68:5
	cmp	r6, r7
	beq	.LBB3_1
.Ltmp42:
.LBB3_3:
	@DEBUG_VALUE: i <- [DW_OP_consts 1, DW_OP_minus, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $r0
	@DEBUG_VALUE: test:temp2 <- $r5
	@DEBUG_VALUE: test:temp1 <- $r4
	@DEBUG_VALUE: test:nelem <- 4
	.loc	1 68 5 is_stmt 0                @ sort.c:68:5
	ldr	r0, .LCPI3_3
.Ltmp43:
	ldr	r1, .LCPI3_4
	ldr	r3, .LCPI3_5
	mov	r2, #68
	bl	__assert_fail
.Ltmp44:
.LBB3_4:                                @ %._crit_edge
	@DEBUG_VALUE: test:temp2 <- $r5
	@DEBUG_VALUE: test:temp1 <- $r4
	@DEBUG_VALUE: test:nelem <- 4
	.loc	1 70 3 is_stmt 1                @ sort.c:70:3
	mov	r0, r4
	bl	free
	.loc	1 71 3                          @ sort.c:71:3
	mov	r0, r5
	sub	sp, r11, #16
	pop	{r4, r5, r6, r7, r11, lr}
.Ltmp45:
	b	free
.Ltmp46:
	.p2align	2
@ %bb.5:
	.loc	1 0 3 is_stmt 0                 @ sort.c:0:3
.LCPI3_0:
	.long	.L.str
.LCPI3_1:
	.long	.L.str.1
.LCPI3_2:
	.long	.L.str.2
.LCPI3_3:
	.long	.L.str.3
.LCPI3_4:
	.long	.L.str.4
.LCPI3_5:
	.long	.L__PRETTY_FUNCTION__.test
.Lfunc_end3:
	.size	test, .Lfunc_end3-test
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	main                            @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	32                              @ @main
main:
.Lfunc_begin4:
	.loc	1 74 0 is_stmt 1                @ sort.c:74:0
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
	.pad	#32
	sub	sp, sp, #32
	bic	sp, sp, #15
.Ltmp47:
	.loc	1 75 7 prologue_end             @ sort.c:75:7
	ldr	r1, .LCPI4_0
	add	r4, sp, #16
	mov	r2, #16
	mov	r3, #0
	mov	r0, r4
	bl	memcpy
	.loc	1 77 3                          @ sort.c:77:3
	ldr	r0, .LCPI4_1
	mov	r2, #16
	mov	r3, #0
	str	r0, [sp]
	mov	r0, r4
	bl	klee_make_symbolic
	.loc	1 78 3                          @ sort.c:78:3
	mov	r0, r4
	bl	test
	.loc	1 80 3                          @ sort.c:80:3
	mov	r0, #0
	sub	sp, r11, #8
	pop	{r4, r10, r11, lr}
	mov	pc, lr
.Ltmp48:
	.p2align	2
@ %bb.1:
	.loc	1 0 3 is_stmt 0                 @ sort.c:0:3
.LCPI4_0:
	.long	.L__const.main.input
.LCPI4_1:
	.long	.L.str.5
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	memcpy                          @ -- Begin function memcpy
	.p2align	2
	.type	memcpy,%function
	.code	32                              @ @memcpy
memcpy:
.Lfunc_begin5:
	.file	2 "/home/isak/Documents/xj/klee-fork/klee" "runtime/Freestanding/memcpy.c"
	.loc	2 12 0 is_stmt 1                @ runtime/Freestanding/memcpy.c:12:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: memcpy:destaddr <- $r0
	@DEBUG_VALUE: memcpy:srcaddr <- $r1
	@DEBUG_VALUE: memcpy:len <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
.Ltmp49:
	@DEBUG_VALUE: memcpy:dest <- $r0
	@DEBUG_VALUE: memcpy:src <- $r1
	.loc	2 16 16 prologue_end            @ runtime/Freestanding/memcpy.c:16:16
	orrs	r12, r2, r3
.Ltmp50:
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 0 32] $r2
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 32 32] $r3
	.loc	2 16 3 is_stmt 0                @ runtime/Freestanding/memcpy.c:16:3
	beq	.LBB5_3
.Ltmp51:
@ %bb.1:                                @ %.lr.ph.preheader
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 0 32] $r2
	@DEBUG_VALUE: memcpy:src <- $r1
	@DEBUG_VALUE: memcpy:dest <- $r0
	@DEBUG_VALUE: memcpy:srcaddr <- $r1
	@DEBUG_VALUE: memcpy:destaddr <- $r0
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 0 32] $r2
	.loc	2 0 3                           @ runtime/Freestanding/memcpy.c:0:3
	mov	r12, r0
.Ltmp52:
.LBB5_2:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: memcpy:src <- $r1
	@DEBUG_VALUE: memcpy:destaddr <- $r0
	@DEBUG_VALUE: memcpy:dest <- $r12
	@DEBUG_VALUE: memcpy:src <- $r1
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 0 32] $r2
	.loc	2 17 15 is_stmt 1               @ runtime/Freestanding/memcpy.c:17:15
	ldrb	lr, [r1], #1
.Ltmp53:
	@DEBUG_VALUE: memcpy:srcaddr <- [DW_OP_LLVM_entry_value 1] $r1
	@DEBUG_VALUE: memcpy:src <- $r1
	.loc	2 16 13                         @ runtime/Freestanding/memcpy.c:16:13
	subs	r2, r2, #1
.Ltmp54:
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 0 32] $r2
	sbc	r3, r3, #0
.Ltmp55:
	@DEBUG_VALUE: memcpy:len <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memcpy:len <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	.loc	2 17 13                         @ runtime/Freestanding/memcpy.c:17:13
	strb	lr, [r12], #1
.Ltmp56:
	@DEBUG_VALUE: memcpy:dest <- $r12
	.loc	2 16 16                         @ runtime/Freestanding/memcpy.c:16:16
	orrs	lr, r2, r3
	.loc	2 16 3 is_stmt 0                @ runtime/Freestanding/memcpy.c:16:3
	bne	.LBB5_2
.Ltmp57:
.LBB5_3:                                @ %._crit_edge
	@DEBUG_VALUE: memcpy:src <- $r1
	@DEBUG_VALUE: memcpy:destaddr <- $r0
	.loc	2 18 3 is_stmt 1                @ runtime/Freestanding/memcpy.c:18:3
	pop	{r11, lr}
	mov	pc, lr
.Ltmp58:
.Lfunc_end5:
	.size	memcpy, .Lfunc_end5-memcpy
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	memmove                         @ -- Begin function memmove
	.p2align	2
	.type	memmove,%function
	.code	32                              @ @memmove
memmove:
.Lfunc_begin6:
	.file	3 "/home/isak/Documents/xj/klee-fork/klee" "runtime/Freestanding/memmove.c"
	.loc	3 12 0                          @ runtime/Freestanding/memmove.c:12:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
.Ltmp59:
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:b <- $r1
	.loc	3 16 7 prologue_end             @ runtime/Freestanding/memmove.c:16:7
	cmp	r1, r0
	beq	.LBB6_8
.Ltmp60:
@ %bb.1:
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	.loc	3 19 7                          @ runtime/Freestanding/memmove.c:19:7
	bls	.LBB6_5
.Ltmp61:
@ %bb.2:                                @ %.preheader
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:count <- undef
	.loc	3 20 5                          @ runtime/Freestanding/memmove.c:20:5
	orrs	r12, r2, r3
.Ltmp62:
	@DEBUG_VALUE: memmove:count <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	beq	.LBB6_8
.Ltmp63:
@ %bb.3:                                @ %.lr.ph.preheader
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	.loc	3 0 5 is_stmt 0                 @ runtime/Freestanding/memmove.c:0:5
	mov	r12, r0
.Ltmp64:
.LBB6_4:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:a <- $r12
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	.loc	3 21 14 is_stmt 1               @ runtime/Freestanding/memmove.c:21:14
	ldrb	lr, [r1], #1
.Ltmp65:
	@DEBUG_VALUE: memmove:src <- [DW_OP_LLVM_entry_value 1] $r1
	@DEBUG_VALUE: memmove:b <- $r1
	.loc	3 20 17                         @ runtime/Freestanding/memmove.c:20:17
	subs	r2, r2, #1
.Ltmp66:
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	sbc	r3, r3, #0
.Ltmp67:
	@DEBUG_VALUE: memmove:count <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	.loc	3 21 12                         @ runtime/Freestanding/memmove.c:21:12
	strb	lr, [r12], #1
.Ltmp68:
	@DEBUG_VALUE: memmove:a <- $r12
	.loc	3 20 5                          @ runtime/Freestanding/memmove.c:20:5
	orrs	lr, r2, r3
	bne	.LBB6_4
	b	.LBB6_8
.Ltmp69:
.LBB6_5:
	@DEBUG_VALUE: memmove:b <- $r1
	@DEBUG_VALUE: memmove:a <- $r0
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 1, DW_OP_minus, DW_OP_constu 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	@DEBUG_VALUE: memmove:b <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_constu 1, DW_OP_minus, DW_OP_constu 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	@DEBUG_VALUE: memmove:count <- undef
	.loc	3 25 5                          @ runtime/Freestanding/memmove.c:25:5
	orrs	r12, r2, r3
.Ltmp70:
	@DEBUG_VALUE: memmove:count <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	beq	.LBB6_8
.Ltmp71:
@ %bb.6:                                @ %.lr.ph16
	@DEBUG_VALUE: memmove:src <- $r1
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:b <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	3 24 7                          @ runtime/Freestanding/memmove.c:24:7
	sub	lr, r2, #1
.Ltmp72:
	@DEBUG_VALUE: memmove:a <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 1, DW_OP_constu 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value] undef
	.loc	3 23 7                          @ runtime/Freestanding/memmove.c:23:7
	add	r12, r0, lr
.Ltmp73:
	@DEBUG_VALUE: memmove:a <- $r12
	.loc	3 24 7                          @ runtime/Freestanding/memmove.c:24:7
	add	lr, r1, lr
.Ltmp74:
	@DEBUG_VALUE: memmove:b <- $lr
.LBB6_7:                                @ =>This Inner Loop Header: Depth=1
	@DEBUG_VALUE: memmove:b <- $lr
	@DEBUG_VALUE: memmove:a <- $r12
	@DEBUG_VALUE: memmove:dst <- $r0
	@DEBUG_VALUE: memmove:a <- $r12
	@DEBUG_VALUE: memmove:b <- $lr
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	.loc	3 26 14                         @ runtime/Freestanding/memmove.c:26:14
	ldrb	r1, [lr], #-1
.Ltmp75:
	@DEBUG_VALUE: memmove:src <- [DW_OP_LLVM_entry_value 1] $r1
	@DEBUG_VALUE: memmove:b <- $lr
	.loc	3 25 17                         @ runtime/Freestanding/memmove.c:25:17
	subs	r2, r2, #1
.Ltmp76:
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 0 32] $r2
	sbc	r3, r3, #0
.Ltmp77:
	@DEBUG_VALUE: memmove:count <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] undef
	@DEBUG_VALUE: memmove:count <- [DW_OP_LLVM_fragment 32 32] $r3
	.loc	3 26 12                         @ runtime/Freestanding/memmove.c:26:12
	strb	r1, [r12], #-1
.Ltmp78:
	@DEBUG_VALUE: memmove:a <- $r12
	.loc	3 25 5                          @ runtime/Freestanding/memmove.c:25:5
	orrs	r1, r2, r3
	bne	.LBB6_7
.Ltmp79:
.LBB6_8:                                @ %.loopexit
	@DEBUG_VALUE: memmove:dst <- $r0
	.loc	3 30 1                          @ runtime/Freestanding/memmove.c:30:1
	pop	{r11, lr}
	mov	pc, lr
.Ltmp80:
.Lfunc_end6:
	.size	memmove, .Lfunc_end6-memmove
	.cfi_endproc
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"input: [%d, %d, %d, %d]\n"
	.size	.L.str, 25

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"insertion_sort: [%d, %d, %d, %d]\n"
	.size	.L.str.1, 34

	.type	.L.str.2,%object                @ @.str.2
.L.str.2:
	.asciz	"bubble_sort   : [%d, %d, %d, %d]\n"
	.size	.L.str.2, 34

	.type	.L.str.3,%object                @ @.str.3
.L.str.3:
	.asciz	"temp1[i] == temp2[i]"
	.size	.L.str.3, 21

	.type	.L.str.4,%object                @ @.str.4
.L.str.4:
	.asciz	"sort.c"
	.size	.L.str.4, 7

	.type	.L__PRETTY_FUNCTION__.test,%object @ @__PRETTY_FUNCTION__.test
.L__PRETTY_FUNCTION__.test:
	.asciz	"void test(int *, unsigned int)"
	.size	.L__PRETTY_FUNCTION__.test, 31

	.type	.L__const.main.input,%object    @ @__const.main.input
	.section	.rodata.cst16,"aM",%progbits,16
	.p2align	4
.L__const.main.input:
	.long	4                               @ 0x4
	.long	3                               @ 0x3
	.long	2                               @ 0x2
	.long	1                               @ 0x1
	.size	.L__const.main.input, 16

	.type	.L.str.5,%object                @ @.str.5
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.5:
	.asciz	"input"
	.size	.L.str.5, 6

	.file	4 "/usr/lib/llvm-13/lib/clang/13.0.1/include" "stddef.h"
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp1-.Lfunc_begin0
	.short	2                               @ Loc expr size
	.byte	48                              @ DW_OP_lit0
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp1-.Lfunc_begin0
	.long	.Ltmp2-.Lfunc_begin0
	.short	3                               @ Loc expr size
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp2-.Lfunc_begin0
	.long	.Ltmp3-.Lfunc_begin0
	.short	3                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp3-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.short	3                               @ Loc expr size
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Lfunc_begin1-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp17-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Ltmp12-.Lfunc_begin0
	.long	.Ltmp14-.Lfunc_begin0
	.short	3                               @ Loc expr size
	.byte	86                              @ DW_OP_reg6
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp14-.Lfunc_begin0
	.long	.Ltmp16-.Lfunc_begin0
	.short	6                               @ Loc expr size
	.byte	86                              @ DW_OP_reg6
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	87                              @ DW_OP_reg7
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	0
	.long	0
.Ldebug_loc3:
	.long	.Ltmp11-.Lfunc_begin0
	.long	.Ltmp17-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc4:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp20-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp20-.Lfunc_begin0
	.long	.Ltmp31-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	86                              @ DW_OP_reg6
	.long	0
	.long	0
.Ldebug_loc5:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp27-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp27-.Lfunc_begin0
	.long	.Ltmp28-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	87                              @ DW_OP_reg7
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp29-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp29-.Lfunc_begin0
	.long	.Ltmp30-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc6:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp19-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.long	.Ltmp19-.Lfunc_begin0
	.long	.Ltmp31-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	.Ltmp31-.Lfunc_begin0
	.long	.Lfunc_end2-.Lfunc_begin0
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	82                              @ DW_OP_reg2
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc7:
	.long	.Ltmp20-.Lfunc_begin0
	.long	.Ltmp22-.Lfunc_begin0
	.short	2                               @ Loc expr size
	.byte	48                              @ DW_OP_lit0
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp22-.Lfunc_begin0
	.long	.Ltmp27-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	87                              @ DW_OP_reg7
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp30-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	87                              @ DW_OP_reg7
	.long	0
	.long	0
.Ldebug_loc8:
	.long	.Lfunc_begin3-.Lfunc_begin0
	.long	.Ltmp33-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp33-.Lfunc_begin0
	.long	.Ltmp36-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	86                              @ DW_OP_reg6
	.long	0
	.long	0
.Ldebug_loc9:
	.long	.Ltmp34-.Lfunc_begin0
	.long	.Ltmp45-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	84                              @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc10:
	.long	.Ltmp35-.Lfunc_begin0
	.long	.Ltmp45-.Lfunc_begin0
	.short	1                               @ Loc expr size
	.byte	85                              @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc11:
	.long	.Ltmp37-.Lfunc_begin0
	.long	.Ltmp43-.Lfunc_begin0
	.short	9                               @ Loc expr size
	.byte	112                             @ DW_OP_breg0
	.byte	0                               @ 0
	.byte	17                              @ DW_OP_consts
	.byte	1                               @ 1
	.byte	28                              @ DW_OP_minus
	.byte	17                              @ DW_OP_consts
	.byte	1                               @ 1
	.byte	34                              @ DW_OP_plus
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc12:
	.long	.Lfunc_begin5-.Lfunc_begin5
	.long	.Ltmp52-.Lfunc_begin5
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp53-.Lfunc_begin5
	.long	.Ltmp57-.Lfunc_begin5
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc13:
	.long	.Ltmp50-.Lfunc_begin5
	.long	.Ltmp55-.Lfunc_begin5
	.short	6                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	0
	.long	0
.Ldebug_loc14:
	.long	.Ltmp49-.Lfunc_begin5
	.long	.Ltmp52-.Lfunc_begin5
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp52-.Lfunc_begin5
	.long	.Ltmp57-.Lfunc_begin5
	.short	1                               @ Loc expr size
	.byte	92                              @ DW_OP_reg12
	.long	0
	.long	0
.Ldebug_loc15:
	.long	.Lfunc_begin6-.Lfunc_begin6
	.long	.Ltmp64-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp65-.Lfunc_begin6
	.long	.Ltmp69-.Lfunc_begin6
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	.Ltmp69-.Lfunc_begin6
	.long	.Ltmp74-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp75-.Lfunc_begin6
	.long	.Ltmp79-.Lfunc_begin6
	.short	4                               @ Loc expr size
	.byte	243                             @ DW_OP_GNU_entry_value
	.byte	1                               @ 1
	.byte	81                              @ DW_OP_reg1
	.byte	159                             @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc16:
	.long	.Lfunc_begin6-.Lfunc_begin6
	.long	.Ltmp61-.Lfunc_begin6
	.short	6                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp64-.Lfunc_begin6
	.long	.Ltmp67-.Lfunc_begin6
	.short	6                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp67-.Lfunc_begin6
	.long	.Ltmp69-.Lfunc_begin6
	.short	5                               @ Loc expr size
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp74-.Lfunc_begin6
	.long	.Ltmp77-.Lfunc_begin6
	.short	6                               @ Loc expr size
	.byte	82                              @ DW_OP_reg2
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	.Ltmp77-.Lfunc_begin6
	.long	.Ltmp79-.Lfunc_begin6
	.short	5                               @ Loc expr size
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.byte	83                              @ DW_OP_reg3
	.byte	147                             @ DW_OP_piece
	.byte	4                               @ 4
	.long	0
	.long	0
.Ldebug_loc17:
	.long	.Ltmp59-.Lfunc_begin6
	.long	.Ltmp64-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	80                              @ DW_OP_reg0
	.long	.Ltmp64-.Lfunc_begin6
	.long	.Ltmp69-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	92                              @ DW_OP_reg12
	.long	.Ltmp73-.Lfunc_begin6
	.long	.Ltmp79-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	92                              @ DW_OP_reg12
	.long	0
	.long	0
.Ldebug_loc18:
	.long	.Ltmp59-.Lfunc_begin6
	.long	.Ltmp69-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	81                              @ DW_OP_reg1
	.long	.Ltmp74-.Lfunc_begin6
	.long	.Ltmp79-.Lfunc_begin6
	.short	1                               @ Loc expr size
	.byte	94                              @ DW_OP_reg14
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
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
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
	.byte	4                               @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
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
	.byte	5                               @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	85                              @ DW_AT_ranges
	.byte	23                              @ DW_FORM_sec_offset
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	28                              @ DW_AT_const_value
	.byte	13                              @ DW_FORM_sdata
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
	.byte	52                              @ DW_TAG_variable
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
	.byte	8                               @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
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
	.byte	10                              @ Abbreviation Code
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
	.byte	11                              @ Abbreviation Code
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
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	12                              @ Abbreviation Code
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
	.byte	13                              @ Abbreviation Code
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
	.byte	14                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	15                              @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	17                              @ Abbreviation Code
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
	.byte	18                              @ Abbreviation Code
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
	.byte	19                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	38                              @ DW_TAG_const_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	21                              @ Abbreviation Code
	.byte	22                              @ DW_TAG_typedef
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	22                              @ Abbreviation Code
	.byte	38                              @ DW_TAG_const_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	23                              @ Abbreviation Code
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
	.byte	16                              @ DW_FORM_ref_addr
	.byte	63                              @ DW_AT_external
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	24                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
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
	.byte	16                              @ DW_FORM_ref_addr
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	25                              @ Abbreviation Code
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
	.byte	16                              @ DW_FORM_ref_addr
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	26                              @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
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
	.byte	16                              @ DW_FORM_ref_addr
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
	.byte	1                               @ Abbrev [1] 0xb:0x1d6 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0x69 DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x37:0xd DW_TAG_formal_parameter
	.byte	1                               @ DW_AT_location
	.byte	80
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x44:0xc DW_TAG_formal_parameter
	.byte	4                               @ DW_AT_const_value
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x50:0x3e DW_TAG_lexical_block
	.long	.Ldebug_ranges1                 @ DW_AT_ranges
	.byte	6                               @ Abbrev [6] 0x55:0xc DW_TAG_variable
	.byte	1                               @ DW_AT_const_value
	.long	.Linfo_string17                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	23                              @ DW_AT_decl_line
	.long	442                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x61:0x2c DW_TAG_lexical_block
	.long	.Ldebug_ranges0                 @ DW_AT_ranges
	.byte	7                               @ Abbrev [7] 0x66:0xf DW_TAG_variable
	.long	.Ldebug_loc0                    @ DW_AT_location
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	25                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x75:0x17 DW_TAG_lexical_block
	.long	.Ltmp1                          @ DW_AT_low_pc
	.long	.Ltmp2-.Ltmp1                   @ DW_AT_high_pc
	.byte	9                               @ Abbrev [9] 0x7e:0xd DW_TAG_variable
	.byte	1                               @ DW_AT_location
	.byte	82
	.long	.Linfo_string19                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	27                              @ DW_AT_decl_line
	.long	442                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x8f:0x55 DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	10                              @ Abbrev [10] 0xa0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1                    @ DW_AT_location
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0xaf:0xc DW_TAG_formal_parameter
	.byte	4                               @ DW_AT_const_value
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0xbb:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    @ DW_AT_location
	.long	.Linfo_string20                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	39                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0xca:0x19 DW_TAG_lexical_block
	.long	.Ltmp12                         @ DW_AT_low_pc
	.long	.Ltmp16-.Ltmp12                 @ DW_AT_high_pc
	.byte	7                               @ Abbrev [7] 0xd3:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    @ DW_AT_location
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	41                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0xe4:0x4e DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.byte	10                              @ Abbrev [10] 0xf5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4                    @ DW_AT_location
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x104:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5                    @ DW_AT_location
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x113:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc6                    @ DW_AT_location
	.long	.Linfo_string21                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	442                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x122:0xf DW_TAG_variable
	.long	.Ldebug_loc7                    @ DW_AT_location
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	9                               @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x132:0x64 DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	10                              @ Abbrev [10] 0x143:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc8                    @ DW_AT_location
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x152:0xc DW_TAG_formal_parameter
	.byte	4                               @ DW_AT_const_value
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x15e:0xf DW_TAG_variable
	.long	.Ldebug_loc9                    @ DW_AT_location
	.long	.Linfo_string22                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x16d:0xf DW_TAG_variable
	.long	.Ldebug_loc10                   @ DW_AT_location
	.long	.Linfo_string23                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.long	449                             @ DW_AT_type
	.byte	8                               @ Abbrev [8] 0x17c:0x19 DW_TAG_lexical_block
	.long	.Ltmp37                         @ DW_AT_low_pc
	.long	.Ltmp44-.Ltmp37                 @ DW_AT_high_pc
	.byte	7                               @ Abbrev [7] 0x185:0xf DW_TAG_variable
	.long	.Ldebug_loc11                   @ DW_AT_location
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	67                              @ DW_AT_decl_line
	.long	454                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	12                              @ Abbrev [12] 0x196:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin4                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.long	442                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	9                               @ Abbrev [9] 0x1ab:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string24                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	75                              @ DW_AT_decl_line
	.long	461                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	13                              @ Abbrev [13] 0x1ba:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	14                              @ Abbrev [14] 0x1c1:0x5 DW_TAG_pointer_type
	.long	442                             @ DW_AT_type
	.byte	13                              @ Abbrev [13] 0x1c6:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	15                              @ Abbrev [15] 0x1cd:0xc DW_TAG_array_type
	.long	442                             @ DW_AT_type
	.byte	16                              @ Abbrev [16] 0x1d2:0x6 DW_TAG_subrange_type
	.long	473                             @ DW_AT_type
	.byte	4                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	17                              @ Abbrev [17] 0x1d9:0x7 DW_TAG_base_type
	.long	.Linfo_string25                 @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
.Lcu_begin1:
	.long	.Ldebug_info_end1-.Ldebug_info_start1 @ Length of Unit
.Ldebug_info_start1:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0xa8 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string3                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string4                  @ DW_AT_comp_dir
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	18                              @ Abbrev [18] 0x26:0x5d DW_TAG_subprogram
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string12                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	131                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x3b:0xd DW_TAG_formal_parameter
	.byte	1                               @ DW_AT_location
	.byte	80
	.long	.Linfo_string26                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	131                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x48:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc12                   @ DW_AT_location
	.long	.Linfo_string27                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	132                             @ DW_AT_type
	.byte	10                              @ Abbrev [10] 0x57:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc13                   @ DW_AT_location
	.long	.Linfo_string28                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	138                             @ DW_AT_type
	.byte	7                               @ Abbrev [7] 0x66:0xf DW_TAG_variable
	.long	.Ldebug_loc14                   @ DW_AT_location
	.long	.Linfo_string31                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	13                              @ DW_AT_decl_line
	.long	156                             @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0x75:0xd DW_TAG_variable
	.byte	1                               @ DW_AT_location
	.byte	81
	.long	.Linfo_string33                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	168                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	19                              @ Abbrev [19] 0x83:0x1 DW_TAG_pointer_type
	.byte	14                              @ Abbrev [14] 0x84:0x5 DW_TAG_pointer_type
	.long	137                             @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x89:0x1 DW_TAG_const_type
	.byte	21                              @ Abbrev [21] 0x8a:0xb DW_TAG_typedef
	.long	149                             @ DW_AT_type
	.long	.Linfo_string30                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	46                              @ DW_AT_decl_line
	.byte	13                              @ Abbrev [13] 0x95:0x7 DW_TAG_base_type
	.long	.Linfo_string29                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	8                               @ DW_AT_byte_size
	.byte	14                              @ Abbrev [14] 0x9c:0x5 DW_TAG_pointer_type
	.long	161                             @ DW_AT_type
	.byte	13                              @ Abbrev [13] 0xa1:0x7 DW_TAG_base_type
	.long	.Linfo_string32                 @ DW_AT_name
	.byte	6                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	14                              @ Abbrev [14] 0xa8:0x5 DW_TAG_pointer_type
	.long	173                             @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0xad:0x5 DW_TAG_const_type
	.long	161                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end1:
.Lcu_begin2:
	.long	.Ldebug_info_end2-.Ldebug_info_start2 @ Length of Unit
.Ldebug_info_start2:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0x7b DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string5                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string4                  @ DW_AT_comp_dir
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	23                              @ Abbrev [23] 0x26:0x5f DW_TAG_subprogram
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string13                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	.debug_info+612                 @ DW_AT_type
                                        @ DW_AT_external
	.byte	24                              @ Abbrev [24] 0x3b:0xd DW_TAG_formal_parameter
	.byte	1                               @ DW_AT_location
	.byte	80
	.long	.Linfo_string34                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+612                 @ DW_AT_type
	.byte	25                              @ Abbrev [25] 0x48:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc15                   @ DW_AT_location
	.long	.Linfo_string33                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+613                 @ DW_AT_type
	.byte	25                              @ Abbrev [25] 0x57:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc16                   @ DW_AT_location
	.long	.Linfo_string35                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+619                 @ DW_AT_type
	.byte	26                              @ Abbrev [26] 0x66:0xf DW_TAG_variable
	.long	.Ldebug_loc17                   @ DW_AT_location
	.long	.Linfo_string36                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	13                              @ DW_AT_decl_line
	.long	.debug_info+637                 @ DW_AT_type
	.byte	26                              @ Abbrev [26] 0x75:0xf DW_TAG_variable
	.long	.Ldebug_loc18                   @ DW_AT_location
	.long	.Linfo_string37                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	.debug_info+649                 @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end2:
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.long	0
	.long	0
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55" @ string offset=0
.Linfo_string1:
	.asciz	"sort.c"                        @ string offset=83
.Linfo_string2:
	.asciz	"/home/isak/Documents/xj/klee-fork/klee/examples/sort" @ string offset=90
.Linfo_string3:
	.asciz	"/home/isak/Documents/xj/klee-fork/klee/runtime/Freestanding/memcpy.c" @ string offset=143
.Linfo_string4:
	.asciz	"/home/isak/Documents/xj/klee-fork/klee/build/runtime/Freestanding" @ string offset=212
.Linfo_string5:
	.asciz	"/home/isak/Documents/xj/klee-fork/klee/runtime/Freestanding/memmove.c" @ string offset=278
.Linfo_string6:
	.asciz	"bubble_sort"                   @ string offset=348
.Linfo_string7:
	.asciz	"insertion_sort"                @ string offset=360
.Linfo_string8:
	.asciz	"insert_ordered"                @ string offset=375
.Linfo_string9:
	.asciz	"test"                          @ string offset=390
.Linfo_string10:
	.asciz	"main"                          @ string offset=395
.Linfo_string11:
	.asciz	"int"                           @ string offset=400
.Linfo_string12:
	.asciz	"memcpy"                        @ string offset=404
.Linfo_string13:
	.asciz	"memmove"                       @ string offset=411
.Linfo_string14:
	.asciz	"array"                         @ string offset=419
.Linfo_string15:
	.asciz	"nelem"                         @ string offset=425
.Linfo_string16:
	.asciz	"unsigned int"                  @ string offset=431
.Linfo_string17:
	.asciz	"done"                          @ string offset=444
.Linfo_string18:
	.asciz	"i"                             @ string offset=449
.Linfo_string19:
	.asciz	"t"                             @ string offset=451
.Linfo_string20:
	.asciz	"temp"                          @ string offset=453
.Linfo_string21:
	.asciz	"item"                          @ string offset=458
.Linfo_string22:
	.asciz	"temp1"                         @ string offset=463
.Linfo_string23:
	.asciz	"temp2"                         @ string offset=469
.Linfo_string24:
	.asciz	"input"                         @ string offset=475
.Linfo_string25:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=481
.Linfo_string26:
	.asciz	"destaddr"                      @ string offset=501
.Linfo_string27:
	.asciz	"srcaddr"                       @ string offset=510
.Linfo_string28:
	.asciz	"len"                           @ string offset=518
.Linfo_string29:
	.asciz	"long unsigned int"             @ string offset=522
.Linfo_string30:
	.asciz	"size_t"                        @ string offset=540
.Linfo_string31:
	.asciz	"dest"                          @ string offset=547
.Linfo_string32:
	.asciz	"char"                          @ string offset=552
.Linfo_string33:
	.asciz	"src"                           @ string offset=557
.Linfo_string34:
	.asciz	"dst"                           @ string offset=561
.Linfo_string35:
	.asciz	"count"                         @ string offset=565
.Linfo_string36:
	.asciz	"a"                             @ string offset=571
.Linfo_string37:
	.asciz	"b"                             @ string offset=573
	.ident	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55"
	.ident	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55"
	.ident	"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
	.section	.debug_line,"",%progbits
.Lline_table_start0:

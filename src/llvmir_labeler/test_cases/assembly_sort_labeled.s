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
	.globl	bubble_sort                     @ -- Begin function bubble_sort
	.p2align	2
	.type	bubble_sort,%function
	.code	32                              @ @bubble_sort
bubble_sort:
.Lfunc_begin0:
	.file	1 "/home/isak/Documents/xj/klee-fork/klee/examples/sort" "sort.c"
	.loc	1 21 0                          @ sort.c:21:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:
	.pad	#24
	sub	sp, sp, #24
	.cfi_def_cfa_offset 24
	str	r0, [sp, #16]
	mov	r0, #1
	str	r1, [sp, #12]
.Ltmp0:
	.loc	1 23 9 prologue_end             @ sort.c:23:9
	str	r0, [sp, #8]
	mov	r0, #0
.Ltmp1:
	.loc	1 25 19                         @ sort.c:25:19
	str	r0, [sp, #4]
	b	.LBB0_2
.LBB0_1:                                @ %.customlabel3
                                        @   in Loop: Header=BB0_2 Depth=1
.Ltmp2:
	.loc	1 25 41 is_stmt 0               @ sort.c:25:41
	ldr	r1, [sp, #4]
	add	r1, r1, #1
	str	r1, [sp, #4]
.LBB0_2:                                @ %.customlabel0
                                        @ =>This Inner Loop Header: Depth=1
	.loc	1 25 26                         @ sort.c:25:26
	ldr	r1, [sp, #4]
	.loc	1 25 34                         @ sort.c:25:34
	ldr	r2, [sp, #12]
	.loc	1 25 28                         @ sort.c:25:28
	add	r1, r1, #1
.Ltmp3:
	.loc	1 25 5                          @ sort.c:25:5
	cmp	r1, r2
.Ltmp4:
	.loc	1 36 1 is_stmt 1                @ sort.c:36:1
	addhs	sp, sp, #24
	movhs	pc, lr
.LBB0_3:                                @ %.customlabel1
                                        @   in Loop: Header=BB0_2 Depth=1
.Ltmp5:
	.loc	1 26 17                         @ sort.c:26:17
	ldr	r1, [sp, #4]
	.loc	1 26 11 is_stmt 0               @ sort.c:26:11
	ldr	r2, [sp, #16]
	.loc	1 26 24                         @ sort.c:26:24
	ldr	r1, [r2, r1, lsl #2]!
	.loc	1 26 11                         @ sort.c:26:11
	ldr	r2, [r2, #4]
.Ltmp6:
	.loc	1 26 11                         @ sort.c:26:11
	cmp	r2, r1
	bge	.LBB0_1
@ %bb.4:                                @ %.customlabel2
                                        @   in Loop: Header=BB0_2 Depth=1
.Ltmp7:
	.loc	1 27 23 is_stmt 1               @ sort.c:27:23
	ldr	r1, [sp, #4]
	.loc	1 27 17 is_stmt 0               @ sort.c:27:17
	ldr	r2, [sp, #16]
	.loc	1 30 14 is_stmt 1               @ sort.c:30:14
	str	r0, [sp, #8]
	.loc	1 28 24                         @ sort.c:28:24
	ldr	r1, [r2, r1, lsl #2]!
	.loc	1 27 17                         @ sort.c:27:17
	ldr	r3, [r2, #4]
	.loc	1 29 18                         @ sort.c:29:18
	str	r3, [r2]
	.loc	1 27 13                         @ sort.c:27:13
	str	r3, [sp]
	.loc	1 28 22                         @ sort.c:28:22
	str	r1, [r2, #4]
	b	.LBB0_1
.Ltmp8:
.Lfunc_end0:
	.size	bubble_sort, .Lfunc_end0-bubble_sort
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	insertion_sort                  @ -- Begin function insertion_sort
	.p2align	2
	.type	insertion_sort,%function
	.code	32                              @ @insertion_sort
insertion_sort:
.Lfunc_begin1:
	.loc	1 38 0                          @ sort.c:38:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
	.pad	#24
	sub	sp, sp, #24
	str	r0, [r11, #-8]
	str	r1, [sp, #12]
.Ltmp9:
	.loc	1 39 36 prologue_end            @ sort.c:39:36
	lsl	r0, r1, #2
	lsr	r1, r1, #30
	.loc	1 39 15 is_stmt 0               @ sort.c:39:15
	bl	malloc
	.loc	1 39 8                          @ sort.c:39:8
	str	r0, [sp, #8]
	mov	r0, #0
.LBB1_1:                                @ %.customlabel0
                                        @ =>This Inner Loop Header: Depth=1
.Ltmp10:
	.loc	1 0 0                           @ sort.c:0:0
	str	r0, [sp, #4]
.Ltmp11:
	.loc	1 41 29 is_stmt 1               @ sort.c:41:29
	ldr	r0, [sp, #12]
	.loc	1 41 24 is_stmt 0               @ sort.c:41:24
	ldr	r1, [sp, #4]
.Ltmp12:
	.loc	1 41 3                          @ sort.c:41:3
	cmp	r1, r0
	beq	.LBB1_3
@ %bb.2:                                @ %.customlabel1
                                        @   in Loop: Header=BB1_1 Depth=1
.Ltmp13:
	.loc	1 42 26 is_stmt 1               @ sort.c:42:26
	ldr	r1, [sp, #4]
	.loc	1 42 29 is_stmt 0               @ sort.c:42:29
	ldr	r0, [r11, #-8]
	ldr	r2, [r0, r1, lsl #2]
	.loc	1 42 20                         @ sort.c:42:20
	ldr	r0, [sp, #8]
	.loc	1 42 5                          @ sort.c:42:5
	bl	insert_ordered
	.loc	1 41 36 is_stmt 1               @ sort.c:41:36
	ldr	r0, [sp, #4]
	add	r0, r0, #1
	b	.LBB1_1
.Ltmp14:
.LBB1_3:                                @ %.customlabel2
	.loc	1 44 40                         @ sort.c:44:40
	ldr	r3, [sp, #12]
	.loc	1 44 17 is_stmt 0               @ sort.c:44:17
	ldr	r1, [sp, #8]
	.loc	1 44 10                         @ sort.c:44:10
	ldr	r0, [r11, #-8]
	.loc	1 44 38                         @ sort.c:44:38
	lsl	r2, r3, #2
	lsr	r3, r3, #30
	.loc	1 44 3                          @ sort.c:44:3
	bl	memcpy
	.loc	1 45 8 is_stmt 1                @ sort.c:45:8
	ldr	r0, [sp, #8]
	.loc	1 45 3 is_stmt 0                @ sort.c:45:3
	bl	free
	.loc	1 46 1 is_stmt 1                @ sort.c:46:1
	mov	sp, r11
	pop	{r11, lr}
	mov	pc, lr
.Ltmp15:
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
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.setfp	r11, sp
	mov	r11, sp
	.cfi_def_cfa_register r11
	.pad	#24
	sub	sp, sp, #24
	str	r0, [r11, #-8]
	mov	r0, #0
	str	r1, [sp, #12]
	str	r2, [sp, #8]
.LBB2_1:                                @ %.customlabel0
                                        @ =>This Inner Loop Header: Depth=1
.Ltmp16:
	.loc	1 0 0 prologue_end              @ sort.c:0:0
	str	r0, [sp, #4]
.Ltmp17:
	.loc	1 11 15                         @ sort.c:11:15
	ldr	r0, [sp, #12]
	.loc	1 11 10 is_stmt 0               @ sort.c:11:10
	ldr	r1, [sp, #4]
.Ltmp18:
	.loc	1 11 3                          @ sort.c:11:3
	cmp	r1, r0
	beq	.LBB2_5
@ %bb.2:                                @ %.customlabel1
                                        @   in Loop: Header=BB2_1 Depth=1
.Ltmp19:
	.loc	1 12 22 is_stmt 1               @ sort.c:12:22
	ldr	r0, [sp, #4]
	.loc	1 12 16 is_stmt 0               @ sort.c:12:16
	ldr	r1, [r11, #-8]
	ldr	r0, [r1, r0, lsl #2]
	.loc	1 12 9                          @ sort.c:12:9
	ldr	r1, [sp, #8]
.Ltmp20:
	.loc	1 12 9                          @ sort.c:12:9
	cmp	r1, r0
	blt	.LBB2_4
.Ltmp21:
@ %bb.3:                                @ %.customlabel3
                                        @   in Loop: Header=BB2_1 Depth=1
	.loc	1 11 22 is_stmt 1               @ sort.c:11:22
	ldr	r0, [sp, #4]
	add	r0, r0, #1
	b	.LBB2_1
.LBB2_4:                                @ %.customlabel2
.Ltmp22:
	.loc	1 13 22                         @ sort.c:13:22
	ldr	r2, [sp, #4]
	.loc	1 13 57 is_stmt 0               @ sort.c:13:57
	ldr	r3, [sp, #12]
	.loc	1 13 16                         @ sort.c:13:16
	ldr	r0, [r11, #-8]
	.loc	1 13 29                         @ sort.c:13:29
	add	r1, r0, r2, lsl #2
	.loc	1 13 63                         @ sort.c:13:63
	sub	r3, r3, r2
	.loc	1 13 54                         @ sort.c:13:54
	lsl	r2, r3, #2
	.loc	1 13 16                         @ sort.c:13:16
	add	r0, r1, #4
	.loc	1 13 54                         @ sort.c:13:54
	lsr	r3, r3, #30
	.loc	1 13 7                          @ sort.c:13:7
	bl	memmove
.Ltmp23:
.LBB2_5:                                @ %.customlabel4
	.loc	1 18 9 is_stmt 1                @ sort.c:18:9
	ldr	r0, [sp, #4]
	.loc	1 18 3 is_stmt 0                @ sort.c:18:3
	ldr	r1, [r11, #-8]
	.loc	1 18 14                         @ sort.c:18:14
	ldr	r2, [sp, #8]
	.loc	1 18 12                         @ sort.c:18:12
	str	r2, [r1, r0, lsl #2]
	.loc	1 19 1 is_stmt 1                @ sort.c:19:1
	mov	sp, r11
	pop	{r11, lr}
	mov	pc, lr
.Ltmp24:
.Lfunc_end2:
	.size	insert_ordered, .Lfunc_end2-insert_ordered
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	test                            @ -- Begin function test
	.p2align	2
	.type	test,%function
	.code	32                              @ @test
test:
.Lfunc_begin3:
	.loc	1 48 0                          @ sort.c:48:0
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
	str	r0, [r11, #-16]
	str	r1, [sp, #20]
.Ltmp25:
	.loc	1 49 38 prologue_end            @ sort.c:49:38
	lsl	r0, r1, #2
	lsr	r1, r1, #30
	.loc	1 49 16 is_stmt 0               @ sort.c:49:16
	bl	malloc
	.loc	1 50 40 is_stmt 1               @ sort.c:50:40
	ldr	r1, [sp, #20]
	.loc	1 49 8                          @ sort.c:49:8
	str	r0, [sp, #16]
	.loc	1 50 38                         @ sort.c:50:38
	lsl	r0, r1, #2
	lsr	r1, r1, #30
	.loc	1 50 16 is_stmt 0               @ sort.c:50:16
	bl	malloc
	.loc	1 50 8                          @ sort.c:50:8
	str	r0, [sp, #8]
	.loc	1 55 10 is_stmt 1               @ sort.c:55:10
	ldr	r0, [sp, #16]
	.loc	1 55 17 is_stmt 0               @ sort.c:55:17
	ldr	r1, [r11, #-16]
	.loc	1 55 3                          @ sort.c:55:3
	mov	r2, #16
	mov	r3, #0
	mov	r4, #0
	bl	memcpy
	.loc	1 56 10 is_stmt 1               @ sort.c:56:10
	ldr	r0, [sp, #8]
	.loc	1 56 17 is_stmt 0               @ sort.c:56:17
	ldr	r1, [r11, #-16]
	.loc	1 56 3                          @ sort.c:56:3
	mov	r2, #16
	mov	r3, #0
	bl	memcpy
	.loc	1 58 18 is_stmt 1               @ sort.c:58:18
	ldr	r0, [sp, #16]
	.loc	1 58 3 is_stmt 0                @ sort.c:58:3
	mov	r1, #4
	bl	insertion_sort
	.loc	1 59 15 is_stmt 1               @ sort.c:59:15
	ldr	r0, [sp, #8]
	.loc	1 59 3 is_stmt 0                @ sort.c:59:3
	mov	r1, #4
	bl	bubble_sort
.Ltmp26:
	.loc	1 67 17 is_stmt 1               @ sort.c:67:17
	str	r4, [sp, #4]
.LBB3_1:                                @ %.customlabel0
                                        @ =>This Inner Loop Header: Depth=1
.Ltmp27:
	.loc	1 67 29 is_stmt 0               @ sort.c:67:29
	ldr	r0, [sp, #20]
	.loc	1 67 24                         @ sort.c:67:24
	ldr	r1, [sp, #4]
.Ltmp28:
	.loc	1 67 3                          @ sort.c:67:3
	cmp	r1, r0
	beq	.LBB3_4
@ %bb.2:                                @ %.customlabel1
                                        @   in Loop: Header=BB3_1 Depth=1
.Ltmp29:
	.loc	1 68 5 is_stmt 1                @ sort.c:68:5
	ldmib	sp, {r0, r1}
	ldr	r2, [sp, #16]
	ldr	r1, [r1, r0, lsl #2]
	ldr	r0, [r2, r0, lsl #2]
.Ltmp30:
	.loc	1 68 5 is_stmt 0                @ sort.c:68:5
	cmp	r0, r1
	bne	.LBB3_5
.Ltmp31:
@ %bb.3:                                @ %.customlabel3
                                        @   in Loop: Header=BB3_1 Depth=1
	.loc	1 67 36 is_stmt 1               @ sort.c:67:36
	ldr	r0, [sp, #4]
	add	r0, r0, #1
	str	r0, [sp, #4]
	b	.LBB3_1
.Ltmp32:
.LBB3_4:                                @ %.customlabel4
	.loc	1 70 8                          @ sort.c:70:8
	ldr	r0, [sp, #16]
	.loc	1 70 3 is_stmt 0                @ sort.c:70:3
	bl	free
	.loc	1 71 8 is_stmt 1                @ sort.c:71:8
	ldr	r0, [sp, #8]
	.loc	1 71 3 is_stmt 0                @ sort.c:71:3
	bl	free
	.loc	1 72 1 is_stmt 1                @ sort.c:72:1
	sub	sp, r11, #8
	pop	{r4, r10, r11, lr}
	mov	pc, lr
.LBB3_5:                                @ %.customlabel2
.Ltmp33:
	.loc	1 68 5                          @ sort.c:68:5
	ldr	r0, .LCPI3_0
	ldr	r1, .LCPI3_1
	ldr	r3, .LCPI3_2
	mov	r2, #68
	bl	__assert_fail
.Ltmp34:
	.p2align	2
@ %bb.6:
	.loc	1 0 5 is_stmt 0                 @ sort.c:0:5
.LCPI3_0:
	.long	.L.str
.LCPI3_1:
	.long	.L.str.1
.LCPI3_2:
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
	.pad	#48
	sub	sp, sp, #48
	bic	sp, sp, #15
.Ltmp35:
	.loc	1 75 7 prologue_end             @ sort.c:75:7
	ldr	r1, .LCPI4_0
	mov	r0, #0
	add	r4, sp, #16
	mov	r2, #16
	mov	r3, #0
	str	r0, [sp, #44]
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
	mov	r1, #4
	bl	test
	.loc	1 80 3                          @ sort.c:80:3
	mov	r0, #0
	sub	sp, r11, #8
	pop	{r4, r10, r11, lr}
	mov	pc, lr
.Ltmp36:
	.p2align	2
@ %bb.1:
	.loc	1 0 3 is_stmt 0                 @ sort.c:0:3
.LCPI4_0:
	.long	.L__const.main.input
.LCPI4_1:
	.long	.L.str.2
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
	.pad	#40
	sub	sp, sp, #40
	.cfi_def_cfa_offset 40
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	str	r1, [sp, #24]
	str	r0, [sp, #32]
.Ltmp37:
	.loc	2 13 9 prologue_end             @ runtime/Freestanding/memcpy.c:13:9
	str	r0, [sp, #8]
	.loc	2 14 15                         @ runtime/Freestanding/memcpy.c:14:15
	str	r1, [sp]
.LBB5_1:                                @ %.customlabel0
                                        @ =>This Inner Loop Header: Depth=1
	.loc	2 16 13                         @ runtime/Freestanding/memcpy.c:16:13
	ldr	r0, [sp, #16]
	ldr	r1, [sp, #20]
	subs	r2, r0, #1
	str	r2, [sp, #16]
	sbc	r2, r1, #0
	.loc	2 16 16 is_stmt 0               @ runtime/Freestanding/memcpy.c:16:16
	orrs	r0, r0, r1
	.loc	2 16 13                         @ runtime/Freestanding/memcpy.c:16:13
	str	r2, [sp, #20]
	.loc	2 16 3                          @ runtime/Freestanding/memcpy.c:16:3
	beq	.LBB5_3
@ %bb.2:                                @ %.customlabel1
                                        @   in Loop: Header=BB5_1 Depth=1
	.loc	2 17 19 is_stmt 1               @ runtime/Freestanding/memcpy.c:17:19
	ldr	r0, [sp]
	.loc	2 17 15 is_stmt 0               @ runtime/Freestanding/memcpy.c:17:15
	ldrb	r1, [r0], #1
	.loc	2 17 19                         @ runtime/Freestanding/memcpy.c:17:19
	str	r0, [sp]
	.loc	2 17 10                         @ runtime/Freestanding/memcpy.c:17:10
	ldr	r0, [sp, #8]
	.loc	2 17 13                         @ runtime/Freestanding/memcpy.c:17:13
	strb	r1, [r0], #1
	.loc	2 17 10                         @ runtime/Freestanding/memcpy.c:17:10
	str	r0, [sp, #8]
	b	.LBB5_1
.LBB5_3:                                @ %.customlabel2
	.loc	2 18 10 is_stmt 1               @ runtime/Freestanding/memcpy.c:18:10
	ldr	r0, [sp, #32]
	.loc	2 18 3 is_stmt 0                @ runtime/Freestanding/memcpy.c:18:3
	add	sp, sp, #40
	mov	pc, lr
.Ltmp38:
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
	.loc	3 12 0 is_stmt 1                @ runtime/Freestanding/memmove.c:12:0
	.fnstart
	.cfi_startproc
@ %bb.0:
	.pad	#48
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
.Ltmp39:
	.loc	3 16 7 prologue_end             @ runtime/Freestanding/memmove.c:16:7
	cmp	r1, r0
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	str	r1, [sp, #24]
	str	r0, [sp, #32]
	.loc	3 13 9                          @ runtime/Freestanding/memmove.c:13:9
	str	r0, [sp, #8]
	.loc	3 14 15                         @ runtime/Freestanding/memmove.c:14:15
	str	r1, [sp]
	.loc	3 16 7                          @ runtime/Freestanding/memmove.c:16:7
	beq	.LBB6_8
@ %bb.1:                                @ %.customlabel1
.Ltmp40:
	.loc	3 19 13                         @ runtime/Freestanding/memmove.c:19:13
	ldr	r0, [sp, #32]
	.loc	3 19 7 is_stmt 0                @ runtime/Freestanding/memmove.c:19:7
	ldr	r1, [sp, #24]
.Ltmp41:
	.loc	3 19 7                          @ runtime/Freestanding/memmove.c:19:7
	cmp	r1, r0
	bls	.LBB6_5
@ %bb.2:                                @ %.customlabel2.preheader
	.loc	3 0 7                           @ runtime/Freestanding/memmove.c:0:7
	mov	r0, #0
.LBB6_3:                                @ %.customlabel2
                                        @ =>This Inner Loop Header: Depth=1
.Ltmp42:
	.loc	3 20 17 is_stmt 1               @ runtime/Freestanding/memmove.c:20:17
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #20]
	subs	r1, r1, #1
	str	r1, [sp, #16]
	sbcs	r1, r2, #0
	str	r1, [sp, #20]
	adc	r1, r0, #0
	.loc	3 20 5 is_stmt 0                @ runtime/Freestanding/memmove.c:20:5
	cmp	r1, #1
	bne	.LBB6_8
@ %bb.4:                                @ %.customlabel3
                                        @   in Loop: Header=BB6_3 Depth=1
	.loc	3 21 16 is_stmt 1               @ runtime/Freestanding/memmove.c:21:16
	ldr	r1, [sp]
	.loc	3 21 14 is_stmt 0               @ runtime/Freestanding/memmove.c:21:14
	ldrb	r2, [r1], #1
	.loc	3 21 16                         @ runtime/Freestanding/memmove.c:21:16
	str	r1, [sp]
	.loc	3 21 9                          @ runtime/Freestanding/memmove.c:21:9
	ldr	r1, [sp, #8]
	.loc	3 21 12                         @ runtime/Freestanding/memmove.c:21:12
	strb	r2, [r1], #1
	.loc	3 21 9                          @ runtime/Freestanding/memmove.c:21:9
	str	r1, [sp, #8]
	b	.LBB6_3
.Ltmp43:
.LBB6_5:                                @ %.customlabel4
	.loc	3 23 7 is_stmt 1                @ runtime/Freestanding/memmove.c:23:7
	ldr	r0, [sp, #8]
	.loc	3 23 10 is_stmt 0               @ runtime/Freestanding/memmove.c:23:10
	ldr	r1, [sp, #16]
	.loc	3 23 7                          @ runtime/Freestanding/memmove.c:23:7
	add	r0, r1, r0
	sub	r0, r0, #1
	str	r0, [sp, #8]
	.loc	3 24 7 is_stmt 1                @ runtime/Freestanding/memmove.c:24:7
	ldr	r0, [sp]
	add	r0, r1, r0
	sub	r0, r0, #1
	str	r0, [sp]
	mov	r0, #0
.LBB6_6:                                @ %.customlabel5
                                        @ =>This Inner Loop Header: Depth=1
	.loc	3 25 17                         @ runtime/Freestanding/memmove.c:25:17
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #20]
	subs	r1, r1, #1
	str	r1, [sp, #16]
	sbcs	r1, r2, #0
	str	r1, [sp, #20]
	adc	r1, r0, #0
	.loc	3 25 5 is_stmt 0                @ runtime/Freestanding/memmove.c:25:5
	cmp	r1, #1
	bne	.LBB6_8
@ %bb.7:                                @ %.customlabel6
                                        @   in Loop: Header=BB6_6 Depth=1
	.loc	3 26 16 is_stmt 1               @ runtime/Freestanding/memmove.c:26:16
	ldr	r1, [sp]
	.loc	3 26 14 is_stmt 0               @ runtime/Freestanding/memmove.c:26:14
	ldrb	r2, [r1], #-1
	.loc	3 26 16                         @ runtime/Freestanding/memmove.c:26:16
	str	r1, [sp]
	.loc	3 26 9                          @ runtime/Freestanding/memmove.c:26:9
	ldr	r1, [sp, #8]
	.loc	3 26 12                         @ runtime/Freestanding/memmove.c:26:12
	strb	r2, [r1], #-1
	.loc	3 26 9                          @ runtime/Freestanding/memmove.c:26:9
	str	r1, [sp, #8]
	b	.LBB6_6
.Ltmp44:
.LBB6_8:                                @ %.customlabel7
	.loc	3 0 0                           @ runtime/Freestanding/memmove.c:0:0
	ldr	r0, [sp, #32]
	str	r0, [sp, #40]
	.loc	3 30 1 is_stmt 1                @ runtime/Freestanding/memmove.c:30:1
	ldr	r0, [sp, #40]
	add	sp, sp, #48
	mov	pc, lr
.Ltmp45:
.Lfunc_end6:
	.size	memmove, .Lfunc_end6-memmove
	.cfi_endproc
	.fnend
                                        @ -- End function
	.type	.L.str,%object                  @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"temp1[i] == temp2[i]"
	.size	.L.str, 21

	.type	.L.str.1,%object                @ @.str.1
.L.str.1:
	.asciz	"sort.c"
	.size	.L.str.1, 7

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

	.type	.L.str.2,%object                @ @.str.2
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str.2:
	.asciz	"input"
	.size	.L.str.2, 6

	.file	4 "/usr/lib/llvm-13/lib/clang/13.0.1/include" "stddef.h"
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
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	85                              @ DW_AT_ranges
	.byte	23                              @ DW_FORM_sec_offset
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
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
	.byte	6                               @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	7                               @ Abbreviation Code
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
	.byte	8                               @ Abbreviation Code
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
	.byte	9                               @ Abbreviation Code
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
	.byte	10                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	12                              @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	13                              @ Abbreviation Code
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
	.byte	14                              @ Abbreviation Code
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
	.byte	15                              @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
	.byte	38                              @ DW_TAG_const_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	17                              @ Abbreviation Code
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
	.byte	18                              @ Abbreviation Code
	.byte	38                              @ DW_TAG_const_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	19                              @ Abbreviation Code
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
	.byte	20                              @ Abbreviation Code
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
	.byte	21                              @ Abbreviation Code
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
	.byte	1                               @ Abbrev [1] 0xb:0x1d0 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0x6e DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x37:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x45:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	12
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	21                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x53:0x40 DW_TAG_lexical_block
	.long	.Ldebug_ranges1                 @ DW_AT_ranges
	.byte	5                               @ Abbrev [5] 0x58:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string17                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	23                              @ DW_AT_decl_line
	.long	436                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x66:0x2c DW_TAG_lexical_block
	.long	.Ldebug_ranges0                 @ DW_AT_ranges
	.byte	5                               @ Abbrev [5] 0x6b:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	4
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	25                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	6                               @ Abbrev [6] 0x79:0x18 DW_TAG_lexical_block
	.long	.Ltmp7                          @ DW_AT_low_pc
	.long	.Ltmp8-.Ltmp7                   @ DW_AT_high_pc
	.byte	5                               @ Abbrev [5] 0x82:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	0
	.long	.Linfo_string19                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	27                              @ DW_AT_decl_line
	.long	436                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x94:0x54 DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0xa5:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0xb3:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	12
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	38                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0xc1:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string20                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	39                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	6                               @ Abbrev [6] 0xcf:0x18 DW_TAG_lexical_block
	.long	.Ltmp10                         @ DW_AT_low_pc
	.long	.Ltmp14-.Ltmp10                 @ DW_AT_high_pc
	.byte	5                               @ Abbrev [5] 0xd8:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	4
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	41                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	7                               @ Abbrev [7] 0xe8:0x4a DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.byte	3                               @ Abbrev [3] 0xf9:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x107:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	12
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x115:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string21                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	8                               @ DW_AT_decl_line
	.long	436                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x123:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	4
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	9                               @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	2                               @ Abbrev [2] 0x132:0x5e DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x143:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x151:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	20
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	48                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x15f:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string22                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	49                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x16d:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string23                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	50                              @ DW_AT_decl_line
	.long	443                             @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x17b:0x14 DW_TAG_lexical_block
	.long	.Ldebug_ranges2                 @ DW_AT_ranges
	.byte	5                               @ Abbrev [5] 0x180:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	4
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	67                              @ DW_AT_decl_line
	.long	448                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x190:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin4                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	74                              @ DW_AT_decl_line
	.long	436                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	5                               @ Abbrev [5] 0x1a5:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string24                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	75                              @ DW_AT_decl_line
	.long	455                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	9                               @ Abbrev [9] 0x1b4:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	10                              @ Abbrev [10] 0x1bb:0x5 DW_TAG_pointer_type
	.long	436                             @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0x1c0:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	11                              @ Abbrev [11] 0x1c7:0xc DW_TAG_array_type
	.long	436                             @ DW_AT_type
	.byte	12                              @ Abbrev [12] 0x1cc:0x6 DW_TAG_subrange_type
	.long	467                             @ DW_AT_type
	.byte	4                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	13                              @ Abbrev [13] 0x1d3:0x7 DW_TAG_base_type
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
	.byte	1                               @ Abbrev [1] 0xb:0xa7 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string3                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string4                  @ DW_AT_comp_dir
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	14                              @ Abbrev [14] 0x26:0x5c DW_TAG_subprogram
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string12                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	130                             @ DW_AT_type
                                        @ DW_AT_external
	.byte	3                               @ Abbrev [3] 0x3b:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	32
	.long	.Linfo_string26                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	130                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x49:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	24
	.long	.Linfo_string27                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	131                             @ DW_AT_type
	.byte	3                               @ Abbrev [3] 0x57:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string28                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	137                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x65:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string31                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	13                              @ DW_AT_decl_line
	.long	155                             @ DW_AT_type
	.byte	5                               @ Abbrev [5] 0x73:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	0
	.long	.Linfo_string33                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	167                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	15                              @ Abbrev [15] 0x82:0x1 DW_TAG_pointer_type
	.byte	10                              @ Abbrev [10] 0x83:0x5 DW_TAG_pointer_type
	.long	136                             @ DW_AT_type
	.byte	16                              @ Abbrev [16] 0x88:0x1 DW_TAG_const_type
	.byte	17                              @ Abbrev [17] 0x89:0xb DW_TAG_typedef
	.long	148                             @ DW_AT_type
	.long	.Linfo_string30                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.byte	46                              @ DW_AT_decl_line
	.byte	9                               @ Abbrev [9] 0x94:0x7 DW_TAG_base_type
	.long	.Linfo_string29                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	8                               @ DW_AT_byte_size
	.byte	10                              @ Abbrev [10] 0x9b:0x5 DW_TAG_pointer_type
	.long	160                             @ DW_AT_type
	.byte	9                               @ Abbrev [9] 0xa0:0x7 DW_TAG_base_type
	.long	.Linfo_string32                 @ DW_AT_name
	.byte	6                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	10                              @ Abbrev [10] 0xa7:0x5 DW_TAG_pointer_type
	.long	172                             @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0xac:0x5 DW_TAG_const_type
	.long	160                             @ DW_AT_type
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end1:
.Lcu_begin2:
	.long	.Ldebug_info_end2-.Ldebug_info_start2 @ Length of Unit
.Ldebug_info_start2:
	.short	4                               @ DWARF version number
	.long	.debug_abbrev                   @ Offset Into Abbrev. Section
	.byte	4                               @ Address Size (in bytes)
	.byte	1                               @ Abbrev [1] 0xb:0x78 DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	12                              @ DW_AT_language
	.long	.Linfo_string5                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string4                  @ DW_AT_comp_dir
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	19                              @ Abbrev [19] 0x26:0x5c DW_TAG_subprogram
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	91
	.long	.Linfo_string13                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
                                        @ DW_AT_prototyped
	.long	.debug_info+605                 @ DW_AT_type
                                        @ DW_AT_external
	.byte	20                              @ Abbrev [20] 0x3b:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	32
	.long	.Linfo_string34                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+605                 @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x49:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	24
	.long	.Linfo_string33                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+606                 @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x57:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	16
	.long	.Linfo_string35                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	12                              @ DW_AT_decl_line
	.long	.debug_info+612                 @ DW_AT_type
	.byte	21                              @ Abbrev [21] 0x65:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	8
	.long	.Linfo_string36                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	13                              @ DW_AT_decl_line
	.long	.debug_info+630                 @ DW_AT_type
	.byte	21                              @ Abbrev [21] 0x73:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	125
	.byte	0
	.long	.Linfo_string37                 @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.byte	14                              @ DW_AT_decl_line
	.long	.debug_info+642                 @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end2:
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.long	.Ltmp1-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Ltmp26-.Lfunc_begin0
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp33-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
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

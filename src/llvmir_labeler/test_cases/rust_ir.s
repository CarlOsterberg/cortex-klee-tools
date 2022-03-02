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
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"1qy0s3krhxnn7fkb"
	.p2align	2                               @ -- Begin function _ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E
	.type	_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E,%function
	.code	32                              @ @_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E
_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E:
.Lfunc_begin0:
	.file	1 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common" "backtrace.rs"
	.loc	1 119 0                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs:119:0
	.fnstart
	.cfi_sections .debug_frame
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#24
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	str	r0, [sp, #8]
.Ltmp6:
	.loc	1 123 18 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs:123:18
	bl	_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E
.Ltmp0:
.Ltmp7:
	.loc	1 126 5                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs:126:5
	bl	_ZN4core4hint9black_box17hecf72d9b21525f67E
.Ltmp8:
.Ltmp1:
@ %bb.1:                                @ %bb2
	.loc	1 129 2                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs:129:2
	add	sp, sp, #24
	pop	{r11, lr}
	mov	pc, lr
.Ltmp9:
.LBB0_2:                                @ %cleanup
.Ltmp2:
	.loc	1 0 2 is_stmt 0                 @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs:0:2
	str	r1, [sp, #20]
	str	r0, [sp, #16]
	bl	_Unwind_Resume
.Lfunc_end0:
	.size	_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E, .Lfunc_end0-_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E
	.cfi_endproc
	.globl	rust_eh_personality
	.personality rust_eh_personality
	.handlerdata
	.p2align	2
GCC_except_table0:
.Lexception0:
	.byte	255                             @ @LPStart Encoding = omit
	.byte	255                             @ @TType Encoding = omit
	.byte	1                               @ Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    @ >> Call Site 1 <<
	.uleb128 .Ltmp0-.Lfunc_begin0           @   Call between .Lfunc_begin0 and .Ltmp0
	.byte	0                               @     has no landing pad
	.byte	0                               @   On action: cleanup
	.uleb128 .Ltmp0-.Lfunc_begin0           @ >> Call Site 2 <<
	.uleb128 .Ltmp1-.Ltmp0                  @   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           @     jumps to .Ltmp2
	.byte	0                               @   On action: cleanup
	.uleb128 .Ltmp1-.Lfunc_begin0           @ >> Call Site 3 <<
	.uleb128 .Lfunc_end0-.Ltmp1             @   Call between .Ltmp1 and .Lfunc_end0
	.byte	0                               @     has no landing pad
	.byte	0                               @   On action: cleanup
.Lcst_end0:
	.p2align	2
	.fnend
                                        @ -- End function
	.hidden	_ZN3std2rt10lang_start17h95c4eabd28917cccE @ -- Begin function _ZN3std2rt10lang_start17h95c4eabd28917cccE
	.globl	_ZN3std2rt10lang_start17h95c4eabd28917cccE
	.p2align	2
	.type	_ZN3std2rt10lang_start17h95c4eabd28917cccE,%function
	.code	32                              @ @_ZN3std2rt10lang_start17h95c4eabd28917cccE
_ZN3std2rt10lang_start17h95c4eabd28917cccE:
.Lfunc_begin1:
	.file	2 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src" "rt.rs"
	.loc	2 140 0 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:140:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#48
	sub	sp, sp, #48
	.cfi_def_cfa_offset 56
	str	r0, [sp, #24]
.Ltmp10:
	.loc	2 146 10 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:146:10
	str	r0, [sp, #16]
	ldr	r0, [sp, #56]
	.loc	2 145 17                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:145:17
	ldr	r1, .LCPI1_0
	str	r3, [sp, #36]
	str	r2, [sp, #32]
	str	r0, [sp]
	add	r0, sp, #16
	bl	_ZN3std2rt19lang_start_internal17hd15a47be08101c28E
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	.loc	2 145 12 is_stmt 0              @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:145:12
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #12]
	str	r1, [sp, #44]
	str	r0, [sp, #40]
	.loc	2 151 2 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:151:2
	add	sp, sp, #48
	pop	{r11, lr}
	mov	pc, lr
.Ltmp11:
	.p2align	2
@ %bb.1:
	.loc	2 0 2 is_stmt 0                 @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:0:2
.LCPI1_0:
	.long	.Lvtable.0
.Lfunc_end1:
	.size	_ZN3std2rt10lang_start17h95c4eabd28917cccE, .Lfunc_end1-_ZN3std2rt10lang_start17h95c4eabd28917cccE
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E
	.type	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E,%function
	.code	32                              @ @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E"
_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E:
.Lfunc_begin2:
	.loc	2 146 0 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:146:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	str	r0, [sp]
.Ltmp12:
	.loc	2 146 77 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:146:77
	ldr	r0, [r0]
	.loc	2 146 18 is_stmt 0              @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:146:18
	bl	_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E
	bl	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E
	.loc	2 146 91                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs:146:91
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.Ltmp13:
.Lfunc_end2:
	.size	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E, .Lfunc_end2-_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE
	.type	_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE,%function
	.code	32                              @ @_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE
_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE:
.Lfunc_begin3:
	.file	3 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys/unix/process" "process_common.rs"
	.loc	3 474 0 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys/unix/process/process_common.rs:474:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp]
.Ltmp14:
	.loc	3 475 9 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys/unix/process/process_common.rs:475:9
	ldrb	r0, [r0]
	.loc	3 476 6                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys/unix/process/process_common.rs:476:6
	add	sp, sp, #8
	mov	pc, lr
.Ltmp15:
.Lfunc_end3:
	.size	_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE, .Lfunc_end3-_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E
	.type	_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E,%function
	.code	32                              @ @_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E
_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E:
.Lfunc_begin4:
	.file	4 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt" "mod.rs"
	.loc	4 361 0                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:361:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.cfi_offset r7, -12
	.cfi_offset r6, -16
	.cfi_offset r5, -20
	.cfi_offset r4, -24
	.pad	#56
	sub	sp, sp, #56
	.cfi_def_cfa_offset 80
	ldr	r4, [sp, #88]
	ldr	r12, [sp, #92]
	ldr	lr, [sp, #80]
	str	r3, [sp, #36]
	str	r2, [sp, #32]
	str	r1, [sp, #24]
.Ltmp16:
	.loc	4 362 12 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:362:12
	subs	r5, r2, r4
	str	r12, [sp, #52]
	str	r4, [sp, #48]
	str	lr, [sp, #40]
	sbcs	r5, r3, r12
	bhs	.LBB4_2
@ %bb.1:                                @ %bb1
	.loc	4 0 12 is_stmt 0                @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:0:12
	mov	r5, #1
	.loc	4 362 12                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:362:12
	strb	r5, [sp, #7]
	b	.LBB4_3
.LBB4_2:                                @ %bb2
	.loc	4 362 56                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:362:56
	adds	r5, r4, #1
	mov	r7, #0
	adc	r6, r12, #0
	.loc	4 362 41                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:362:41
	subs	r5, r5, r2
	sbcs	r5, r6, r3
	movlo	r7, #1
	.loc	4 362 12                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:362:12
	strb	r7, [sp, #7]
.LBB4_3:                                @ %bb3
	ldrb	r5, [sp, #7]
	tst	r5, #1
	.loc	4 365 9 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:365:9
	streq	r4, [r0, #40]
	ldreq	r4, [sp, #16]
	streq	r1, [r0]
	addeq	r1, r0, #24
	ldreq	r5, [sp, #20]
	streq	r2, [r0, #8]
	streq	r3, [r0, #12]
	streq	r12, [r0, #44]
	stmeq	r1, {r4, r5, lr}
	moveq	r1, #0
	streq	r1, [r0, #16]
	.loc	4 365 34 is_stmt 0              @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:365:34
	streq	r1, [sp, #8]
	.loc	4 366 6 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:366:6
	addeq	sp, sp, #56
	popeq	{r4, r5, r6, r7, r11, lr}
	moveq	pc, lr
.LBB4_4:                                @ %bb4
	.loc	4 363 13                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:363:13
	ldr	r0, .LCPI4_0
	mov	r2, #12
	mov	r3, #0
	str	r0, [sp]
	ldr	r0, .LCPI4_1
	bl	_ZN4core9panicking5panic17h0ba7146865b2f9d6E
.Ltmp17:
	.p2align	2
@ %bb.5:
	.loc	4 0 13 is_stmt 0                @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs:0:13
.LCPI4_0:
	.long	.Lalloc35
.LCPI4_1:
	.long	.Lalloc33
.Lfunc_end4:
	.size	_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E, .Lfunc_end4-_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E
	.type	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E,%function
	.code	32                              @ @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E"
_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E:
.Lfunc_begin5:
	.file	5 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops" "function.rs"
	.loc	5 227 0 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#16
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	str	r0, [sp, #8]
.Ltmp18:
	.loc	5 227 5 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:5
	ldr	r0, [r0]
	bl	_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE
	add	sp, sp, #16
	pop	{r11, lr}
	mov	pc, lr
.Ltmp19:
.Lfunc_end5:
	.size	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E, .Lfunc_end5-_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE
	.type	_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE,%function
	.code	32                              @ @_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE
_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE:
.Lfunc_begin6:
	.loc	5 227 0                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#16
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	str	r0, [sp]
.Ltmp3:
	mov	r0, sp
.Ltmp20:
	.loc	5 227 5 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:5
	bl	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E
.Ltmp4:
@ %bb.1:                                @ %bb1
	add	sp, sp, #16
	pop	{r11, lr}
	mov	pc, lr
.Ltmp21:
.LBB6_2:                                @ %cleanup
.Ltmp5:
	.loc	5 0 5 is_stmt 0                 @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:0:5
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	bl	_Unwind_Resume
.Lfunc_end6:
	.size	_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE, .Lfunc_end6-_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE
	.cfi_endproc
	.globl	rust_eh_personality
	.personality rust_eh_personality
	.handlerdata
	.p2align	2
GCC_except_table6:
.Lexception1:
	.byte	255                             @ @LPStart Encoding = omit
	.byte	255                             @ @TType Encoding = omit
	.byte	1                               @ Call site Encoding = uleb128
	.uleb128 .Lcst_end1-.Lcst_begin1
.Lcst_begin1:
	.uleb128 .Ltmp3-.Lfunc_begin6           @ >> Call Site 1 <<
	.uleb128 .Ltmp4-.Ltmp3                  @   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin6           @     jumps to .Ltmp5
	.byte	0                               @   On action: cleanup
	.uleb128 .Ltmp4-.Lfunc_begin6           @ >> Call Site 2 <<
	.uleb128 .Lfunc_end6-.Ltmp4             @   Call between .Ltmp4 and .Lfunc_end6
	.byte	0                               @     has no landing pad
	.byte	0                               @   On action: cleanup
.Lcst_end1:
	.p2align	2
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E
	.type	_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E,%function
	.code	32                              @ @_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E
_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E:
.Lfunc_begin7:
	.loc	5 227 0 is_stmt 1               @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#16
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	str	r0, [sp, #8]
.Ltmp22:
	.loc	5 227 5 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs:227:5
	mov	lr, pc
	mov	pc, r0
	add	sp, sp, #16
	pop	{r11, lr}
	mov	pc, lr
.Ltmp23:
.Lfunc_end7:
	.size	_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E, .Lfunc_end7-_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E
	.type	_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E,%function
	.code	32                              @ @"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E"
_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E:
.Lfunc_begin8:
	.file	6 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ptr" "mod.rs"
	.loc	6 188 0                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ptr/mod.rs:188:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp], #8
.Ltmp24:
	.loc	6 188 1 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ptr/mod.rs:188:1
	mov	pc, lr
.Ltmp25:
.Lfunc_end8:
	.size	_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E, .Lfunc_end8-_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN4core4hint9black_box17hecf72d9b21525f67E
	.type	_ZN4core4hint9black_box17hecf72d9b21525f67E,%function
	.code	32                              @ @_ZN4core4hint9black_box17hecf72d9b21525f67E
_ZN4core4hint9black_box17hecf72d9b21525f67E:
.Lfunc_begin9:
	.file	7 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src" "hint.rs"
	.loc	7 157 0                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/hint.rs:157:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.pad	#4
	sub	sp, sp, #4
	.cfi_def_cfa_offset 4
.Ltmp26:
	.loc	7 158 5 prologue_end            @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/hint.rs:158:5
	@APP
	@NO_APP
	.loc	7 159 2                         @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/hint.rs:159:2
	add	sp, sp, #4
	mov	pc, lr
.Ltmp27:
.Lfunc_end9:
	.size	_ZN4core4hint9black_box17hecf72d9b21525f67E, .Lfunc_end9-_ZN4core4hint9black_box17hecf72d9b21525f67E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E
	.type	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E,%function
	.code	32                              @ @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E"
_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E:
.Lfunc_begin10:
	.file	8 "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src" "process.rs"
	.loc	8 2019 0                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2019:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
.Ltmp28:
	.loc	8 2020 9 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2020:9
	mov	r0, #0
	bl	_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E
	.loc	8 2021 6                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2021:6
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.Ltmp29:
.Lfunc_end10:
	.size	_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E, .Lfunc_end10-_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E
	.type	_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E,%function
	.code	32                              @ @"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E"
_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E:
.Lfunc_begin11:
	.loc	8 2053 0                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2053:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	strb	r0, [sp, #7]
	add	r0, sp, #7
.Ltmp30:
	.loc	8 2054 9 prologue_end           @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2054:9
	bl	_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE
	.loc	8 2055 6                        @ /rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs:2055:6
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
.Ltmp31:
.Lfunc_end11:
	.size	_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E, .Lfunc_end11-_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E
	.cfi_endproc
	.fnend
                                        @ -- End function
	.p2align	2                               @ -- Begin function _ZN10helloworld4main17h2d296a82238a34ebE
	.type	_ZN10helloworld4main17h2d296a82238a34ebE,%function
	.code	32                              @ @_ZN10helloworld4main17h2d296a82238a34ebE
_ZN10helloworld4main17h2d296a82238a34ebE:
.Lfunc_begin12:
	.file	9 "/home/carlosterberg/helloworld" "src/main.rs"
	.loc	9 1 0                           @ src/main.rs:1:0
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %start
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#64
	sub	sp, sp, #64
	.cfi_def_cfa_offset 72
	mov	r0, #0
.Ltmp32:
	.loc	9 2 5 prologue_end              @ src/main.rs:2:5
	ldr	r1, .LCPI12_1
	mov	r2, #1
	mov	r3, #0
	str	r0, [sp, #8]
	str	r0, [sp, #12]
	ldr	r0, .LCPI12_0
	str	r0, [sp]
	add	r0, sp, #16
	bl	_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E
	add	r0, sp, #16
	bl	_ZN3std2io5stdio6_print17hd9c9dbd31aa97d70E
	.loc	9 3 2                           @ src/main.rs:3:2
	add	sp, sp, #64
	pop	{r11, lr}
	mov	pc, lr
.Ltmp33:
	.p2align	2
@ %bb.1:
	.loc	9 0 2 is_stmt 0                 @ src/main.rs:0:2
.LCPI12_0:
	.long	.Lalloc5
.LCPI12_1:
	.long	.Lalloc3
.Lfunc_end12:
	.size	_ZN10helloworld4main17h2d296a82238a34ebE, .Lfunc_end12-_ZN10helloworld4main17h2d296a82238a34ebE
	.cfi_endproc
	.fnend
                                        @ -- End function
	.globl	main                            @ -- Begin function main
	.p2align	2
	.type	main,%function
	.code	32                              @ @main
main:
.Lfunc_begin13:
	.fnstart
	.cfi_startproc
@ %bb.0:                                @ %top
	.save	{r11, lr}
	push	{r11, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset lr, -4
	.cfi_offset r11, -8
	.pad	#8
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	mov	r2, r0
	ldr	r0, .LCPI13_0
	asr	r3, r2, #31
	ldrb	r0, [r0]
	str	r1, [sp]
	ldr	r0, .LCPI13_1
	bl	_ZN3std2rt10lang_start17h95c4eabd28917cccE
	add	sp, sp, #8
	pop	{r11, lr}
	mov	pc, lr
	.p2align	2
@ %bb.1:
.LCPI13_0:
	.long	__rustc_debug_gdb_scripts_section__
.LCPI13_1:
	.long	_ZN10helloworld4main17h2d296a82238a34ebE
.Lfunc_end13:
	.size	main, .Lfunc_end13-main
	.cfi_endproc
	.fnend
                                        @ -- End function
	.type	.Lvtable.0,%object              @ @vtable.0
	.section	.rodata,"a",%progbits
	.p2align	3
.Lvtable.0:
	.long	_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E
	.asciz	"\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.long	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E
	.long	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E
	.long	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E
	.size	.Lvtable.0, 32

	.type	.Lalloc33,%object               @ @alloc33
.Lalloc33:
	.ascii	"invalid args"
	.size	.Lalloc33, 12

	.type	.Lalloc34,%object               @ @alloc34
.Lalloc34:
	.ascii	"/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs"
	.size	.Lalloc34, 75

	.type	.Lalloc35,%object               @ @alloc35
	.p2align	3
.Lalloc35:
	.long	.Lalloc34
	.asciz	"K\000\000\000\000\000\000\000k\001\000\000\r\000\000"
	.size	.Lalloc35, 20

	.type	.Lalloc2,%object                @ @alloc2
.Lalloc2:
	.ascii	"Hello, world!\n"
	.size	.Lalloc2, 14

	.type	.Lalloc3,%object                @ @alloc3
	.p2align	3
.Lalloc3:
	.long	.Lalloc2
	.asciz	"\016\000\000\000\000\000\000"
	.size	.Lalloc3, 12

	.type	.Lalloc5,%object                @ @alloc5
	.p2align	3
.Lalloc5:
	.size	.Lalloc5, 0

	.type	__rustc_debug_gdb_scripts_section__,%object @ @__rustc_debug_gdb_scripts_section__
	.section	.debug_gdb_scripts,"aMS",%progbits,1,unique,1
	.weak	__rustc_debug_gdb_scripts_section__
__rustc_debug_gdb_scripts_section__:
	.asciz	"\001gdb_load_rust_pretty_printers.py"
	.size	__rustc_debug_gdb_scripts_section__, 34

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
	.ascii	"\264B"                         @ DW_AT_GNU_pubnames
	.byte	25                              @ DW_FORM_flag_present
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	2                               @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	3                               @ Abbreviation Code
	.byte	1                               @ DW_TAG_array_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	4                               @ Abbreviation Code
	.byte	33                              @ DW_TAG_subrange_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	34                              @ DW_AT_lower_bound
	.byte	13                              @ DW_FORM_sdata
	.byte	55                              @ DW_AT_count
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	5                               @ Abbreviation Code
	.byte	15                              @ DW_TAG_pointer_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	51                              @ DW_AT_address_class
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	6                               @ Abbreviation Code
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
	.byte	7                               @ Abbreviation Code
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
	.byte	8                               @ Abbreviation Code
	.byte	57                              @ DW_TAG_namespace
	.byte	1                               @ DW_CHILDREN_yes
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	9                               @ Abbreviation Code
	.byte	4                               @ DW_TAG_enumeration_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	109                             @ DW_AT_enum_class
	.byte	25                              @ DW_FORM_flag_present
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	10                              @ Abbreviation Code
	.byte	40                              @ DW_TAG_enumerator
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	28                              @ DW_AT_const_value
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	11                              @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	12                              @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	13                              @ Abbreviation Code
	.byte	51                              @ DW_TAG_variant_part
	.byte	1                               @ DW_CHILDREN_yes
	.byte	21                              @ DW_AT_discr
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	14                              @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	52                              @ DW_AT_artificial
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	15                              @ Abbreviation Code
	.byte	25                              @ DW_TAG_variant
	.byte	1                               @ DW_CHILDREN_yes
	.byte	22                              @ DW_AT_discr_value
	.byte	11                              @ DW_FORM_data1
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	16                              @ Abbreviation Code
	.byte	19                              @ DW_TAG_structure_type
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	11                              @ DW_AT_byte_size
	.byte	11                              @ DW_FORM_data1
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	17                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	110                             @ DW_AT_linkage_name
	.byte	14                              @ DW_FORM_strp
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	18                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	5                               @ DW_FORM_data2
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	19                              @ Abbreviation Code
	.byte	25                              @ DW_TAG_variant
	.byte	1                               @ DW_CHILDREN_yes
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	20                              @ Abbreviation Code
	.byte	47                              @ DW_TAG_template_type_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	21                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	110                             @ DW_AT_linkage_name
	.byte	14                              @ DW_FORM_strp
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
	.byte	22                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
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
	.byte	110                             @ DW_AT_linkage_name
	.byte	14                              @ DW_FORM_strp
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
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
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	25                              @ Abbreviation Code
	.byte	11                              @ DW_TAG_lexical_block
	.byte	1                               @ DW_CHILDREN_yes
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	26                              @ Abbreviation Code
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
	.byte	27                              @ Abbreviation Code
	.byte	52                              @ DW_TAG_variable
	.byte	0                               @ DW_CHILDREN_no
	.byte	2                               @ DW_AT_location
	.byte	24                              @ DW_FORM_exprloc
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	28                              @ Abbreviation Code
	.byte	21                              @ DW_TAG_subroutine_type
	.byte	1                               @ DW_CHILDREN_yes
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	29                              @ Abbreviation Code
	.byte	5                               @ DW_TAG_formal_parameter
	.byte	0                               @ DW_CHILDREN_no
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	30                              @ Abbreviation Code
	.byte	13                              @ DW_TAG_member
	.byte	0                               @ DW_CHILDREN_no
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	73                              @ DW_AT_type
	.byte	19                              @ DW_FORM_ref4
	.ascii	"\210\001"                      @ DW_AT_alignment
	.byte	15                              @ DW_FORM_udata
	.byte	56                              @ DW_AT_data_member_location
	.byte	11                              @ DW_FORM_data1
	.byte	52                              @ DW_AT_artificial
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	31                              @ Abbreviation Code
	.byte	46                              @ DW_TAG_subprogram
	.byte	0                               @ DW_CHILDREN_no
	.byte	17                              @ DW_AT_low_pc
	.byte	1                               @ DW_FORM_addr
	.byte	18                              @ DW_AT_high_pc
	.byte	6                               @ DW_FORM_data4
	.byte	64                              @ DW_AT_frame_base
	.byte	24                              @ DW_FORM_exprloc
	.byte	110                             @ DW_AT_linkage_name
	.byte	14                              @ DW_FORM_strp
	.byte	3                               @ DW_AT_name
	.byte	14                              @ DW_FORM_strp
	.byte	58                              @ DW_AT_decl_file
	.byte	11                              @ DW_FORM_data1
	.byte	59                              @ DW_AT_decl_line
	.byte	11                              @ DW_FORM_data1
	.byte	106                             @ DW_AT_main_subprogram
	.byte	25                              @ DW_FORM_flag_present
	.byte	0                               @ EOM(1)
	.byte	0                               @ EOM(2)
	.byte	32                              @ Abbreviation Code
	.byte	21                              @ DW_TAG_subroutine_type
	.byte	0                               @ DW_CHILDREN_no
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
	.byte	1                               @ Abbrev [1] 0xb:0x7ae DW_TAG_compile_unit
	.long	.Linfo_string0                  @ DW_AT_producer
	.short	28                              @ DW_AT_language
	.long	.Linfo_string1                  @ DW_AT_name
	.long	.Lline_table_start0             @ DW_AT_stmt_list
	.long	.Linfo_string2                  @ DW_AT_comp_dir
                                        @ DW_AT_GNU_pubnames
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end12-.Lfunc_begin0      @ DW_AT_high_pc
	.byte	2                               @ Abbrev [2] 0x26:0xf DW_TAG_variable
	.long	.Linfo_string3                  @ DW_AT_name
	.long	53                              @ DW_AT_type
	.byte	5                               @ DW_AT_location
	.byte	3
	.long	.Lvtable.0
	.byte	3                               @ Abbrev [3] 0x35:0xd DW_TAG_array_type
	.long	66                              @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x3a:0x7 DW_TAG_subrange_type
	.long	86                              @ DW_AT_type
	.byte	0                               @ DW_AT_lower_bound
	.byte	6                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x42:0xd DW_TAG_pointer_type
	.long	79                              @ DW_AT_type
	.long	.Linfo_string5                  @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	6                               @ Abbrev [6] 0x4f:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	0                               @ DW_AT_byte_size
	.byte	7                               @ Abbrev [7] 0x56:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	7                               @ DW_AT_encoding
	.byte	8                               @ Abbrev [8] 0x5d:0x3de DW_TAG_namespace
	.long	.Linfo_string7                  @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x62:0x1c9 DW_TAG_namespace
	.long	.Linfo_string8                  @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x67:0xf9 DW_TAG_namespace
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x6c:0xf3 DW_TAG_namespace
	.long	.Linfo_string10                 @ DW_AT_name
	.byte	9                               @ Abbrev [9] 0x71:0x24 DW_TAG_enumeration_type
	.long	1083                            @ DW_AT_type
                                        @ DW_AT_enum_class
	.long	.Linfo_string16                 @ DW_AT_name
	.byte	1                               @ DW_AT_byte_size
	.byte	1                               @ DW_AT_alignment
	.byte	10                              @ Abbrev [10] 0x7c:0x6 DW_TAG_enumerator
	.long	.Linfo_string12                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	10                              @ Abbrev [10] 0x82:0x6 DW_TAG_enumerator
	.long	.Linfo_string13                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	10                              @ Abbrev [10] 0x88:0x6 DW_TAG_enumerator
	.long	.Linfo_string14                 @ DW_AT_name
	.byte	2                               @ DW_AT_const_value
	.byte	10                              @ Abbrev [10] 0x8e:0x6 DW_TAG_enumerator
	.long	.Linfo_string15                 @ DW_AT_name
	.byte	3                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x95:0x1e DW_TAG_structure_type
	.long	.Linfo_string56                 @ DW_AT_name
	.byte	56                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x9c:0xb DW_TAG_member
	.long	.Linfo_string42                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0xa7:0xb DW_TAG_member
	.long	.Linfo_string43                 @ DW_AT_name
	.long	179                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0xb3:0x3f DW_TAG_structure_type
	.long	.Linfo_string55                 @ DW_AT_name
	.byte	48                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0xba:0xb DW_TAG_member
	.long	.Linfo_string44                 @ DW_AT_name
	.long	1694                            @ DW_AT_type
	.byte	4                               @ DW_AT_alignment
	.byte	32                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0xc5:0xb DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	113                             @ DW_AT_type
	.byte	1                               @ DW_AT_alignment
	.byte	40                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0xd0:0xb DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	1701                            @ DW_AT_type
	.byte	4                               @ DW_AT_alignment
	.byte	36                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0xdb:0xb DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	242                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0xe6:0xb DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	242                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	16                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0xf2:0x6c DW_TAG_structure_type
	.long	.Linfo_string53                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	13                              @ Abbrev [13] 0xf9:0x37 DW_TAG_variant_part
	.long	254                             @ DW_AT_discr
	.byte	14                              @ Abbrev [14] 0xfe:0x7 DW_TAG_member
	.long	1644                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
                                        @ DW_AT_artificial
	.byte	15                              @ Abbrev [15] 0x105:0xe DW_TAG_variant
	.byte	0                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x107:0xb DW_TAG_member
	.long	.Linfo_string50                 @ DW_AT_name
	.long	304                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	15                              @ Abbrev [15] 0x113:0xe DW_TAG_variant
	.byte	1                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x115:0xb DW_TAG_member
	.long	.Linfo_string51                 @ DW_AT_name
	.long	323                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	15                              @ Abbrev [15] 0x121:0xe DW_TAG_variant
	.byte	2                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x123:0xb DW_TAG_member
	.long	.Linfo_string52                 @ DW_AT_name
	.long	342                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x130:0x13 DW_TAG_structure_type
	.long	.Linfo_string50                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x137:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x143:0x13 DW_TAG_structure_type
	.long	.Linfo_string51                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x14a:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	16                              @ Abbrev [16] 0x156:0x7 DW_TAG_structure_type
	.long	.Linfo_string52                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x160:0x62 DW_TAG_structure_type
	.long	.Linfo_string80                 @ DW_AT_name
	.byte	48                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x167:0xb DW_TAG_member
	.long	.Linfo_string31                 @ DW_AT_name
	.long	1551                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x172:0xb DW_TAG_member
	.long	.Linfo_string8                  @ DW_AT_name
	.long	590                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	16                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x17d:0xb DW_TAG_member
	.long	.Linfo_string62                 @ DW_AT_name
	.long	1708                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	32                              @ DW_AT_data_member_location
	.byte	17                              @ Abbrev [17] 0x188:0x39 DW_TAG_subprogram
	.long	.Lfunc_begin4                   @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string101                @ DW_AT_linkage_name
	.long	.Linfo_string102                @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.short	361                             @ DW_AT_decl_line
	.long	352                             @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0x1a2:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	24
	.long	.Linfo_string31                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.short	361                             @ DW_AT_decl_line
	.long	1551                            @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0x1b1:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	40
	.long	.Linfo_string62                 @ DW_AT_name
	.byte	4                               @ DW_AT_decl_file
	.short	361                             @ DW_AT_decl_line
	.long	1708                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x1c2:0x1e DW_TAG_structure_type
	.long	.Linfo_string77                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x1c9:0xb DW_TAG_member
	.long	.Linfo_string63                 @ DW_AT_name
	.long	1751                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x1d4:0xb DW_TAG_member
	.long	.Linfo_string66                 @ DW_AT_name
	.long	1771                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x1e0:0x4a DW_TAG_structure_type
	.long	.Linfo_string74                 @ DW_AT_name
	.byte	64                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x1e7:0xb DW_TAG_member
	.long	.Linfo_string47                 @ DW_AT_name
	.long	1701                            @ DW_AT_type
	.byte	4                               @ DW_AT_alignment
	.byte	48                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x1f2:0xb DW_TAG_member
	.long	.Linfo_string44                 @ DW_AT_name
	.long	1694                            @ DW_AT_type
	.byte	4                               @ DW_AT_alignment
	.byte	52                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x1fd:0xb DW_TAG_member
	.long	.Linfo_string46                 @ DW_AT_name
	.long	113                             @ DW_AT_type
	.byte	1                               @ DW_AT_alignment
	.byte	56                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x208:0xb DW_TAG_member
	.long	.Linfo_string54                 @ DW_AT_name
	.long	683                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x213:0xb DW_TAG_member
	.long	.Linfo_string49                 @ DW_AT_name
	.long	683                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	16                              @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x21e:0xb DW_TAG_member
	.long	.Linfo_string68                 @ DW_AT_name
	.long	1813                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	32                              @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x22b:0x1e DW_TAG_namespace
	.long	.Linfo_string17                 @ DW_AT_name
	.byte	9                               @ Abbrev [9] 0x230:0x18 DW_TAG_enumeration_type
	.long	1083                            @ DW_AT_type
                                        @ DW_AT_enum_class
	.long	.Linfo_string20                 @ DW_AT_name
	.byte	1                               @ DW_AT_byte_size
	.byte	1                               @ DW_AT_alignment
	.byte	10                              @ Abbrev [10] 0x23b:0x6 DW_TAG_enumerator
	.long	.Linfo_string18                 @ DW_AT_name
	.byte	0                               @ DW_AT_const_value
	.byte	10                              @ Abbrev [10] 0x241:0x6 DW_TAG_enumerator
	.long	.Linfo_string19                 @ DW_AT_name
	.byte	1                               @ DW_AT_const_value
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x249:0xc1 DW_TAG_namespace
	.long	.Linfo_string39                 @ DW_AT_name
	.byte	11                              @ Abbrev [11] 0x24e:0x5d DW_TAG_structure_type
	.long	.Linfo_string61                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	13                              @ Abbrev [13] 0x255:0x28 DW_TAG_variant_part
	.long	602                             @ DW_AT_discr
	.byte	14                              @ Abbrev [14] 0x25a:0x7 DW_TAG_member
	.long	1644                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
                                        @ DW_AT_artificial
	.byte	15                              @ Abbrev [15] 0x261:0xe DW_TAG_variant
	.byte	0                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x263:0xb DW_TAG_member
	.long	.Linfo_string41                 @ DW_AT_name
	.long	637                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	19                              @ Abbrev [19] 0x26f:0xd DW_TAG_variant
	.byte	12                              @ Abbrev [12] 0x270:0xb DW_TAG_member
	.long	.Linfo_string60                 @ DW_AT_name
	.long	654                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x27d:0x11 DW_TAG_structure_type
	.long	.Linfo_string41                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	20                              @ Abbrev [20] 0x284:0x9 DW_TAG_template_type_parameter
	.long	1651                            @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x28e:0x1c DW_TAG_structure_type
	.long	.Linfo_string60                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	20                              @ Abbrev [20] 0x295:0x9 DW_TAG_template_type_parameter
	.long	1651                            @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	12                              @ Abbrev [12] 0x29e:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1651                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x2ab:0x5e DW_TAG_structure_type
	.long	.Linfo_string67                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	13                              @ Abbrev [13] 0x2b2:0x29 DW_TAG_variant_part
	.long	695                             @ DW_AT_discr
	.byte	14                              @ Abbrev [14] 0x2b7:0x7 DW_TAG_member
	.long	1644                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
                                        @ DW_AT_artificial
	.byte	15                              @ Abbrev [15] 0x2be:0xe DW_TAG_variant
	.byte	0                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x2c0:0xb DW_TAG_member
	.long	.Linfo_string41                 @ DW_AT_name
	.long	731                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	15                              @ Abbrev [15] 0x2cc:0xe DW_TAG_variant
	.byte	1                               @ DW_AT_discr_value
	.byte	12                              @ Abbrev [12] 0x2ce:0xb DW_TAG_member
	.long	.Linfo_string60                 @ DW_AT_name
	.long	748                             @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x2db:0x11 DW_TAG_structure_type
	.long	.Linfo_string41                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	20                              @ Abbrev [20] 0x2e2:0x9 DW_TAG_template_type_parameter
	.long	1637                            @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x2ec:0x1c DW_TAG_structure_type
	.long	.Linfo_string60                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	20                              @ Abbrev [20] 0x2f3:0x9 DW_TAG_template_type_parameter
	.long	1637                            @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	12                              @ Abbrev [12] 0x2fc:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x30a:0xce DW_TAG_namespace
	.long	.Linfo_string81                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x30f:0xc8 DW_TAG_namespace
	.long	.Linfo_string82                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x314:0xc2 DW_TAG_namespace
	.long	.Linfo_string83                 @ DW_AT_name
	.byte	21                              @ Abbrev [21] 0x319:0x40 DW_TAG_subprogram
	.long	.Lfunc_begin5                   @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string107                @ DW_AT_linkage_name
	.long	.Linfo_string108                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x332:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	8
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	1963                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x33c:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x346:0x9 DW_TAG_template_type_parameter
	.long	1323                            @ DW_AT_type
	.long	.Linfo_string105                @ DW_AT_name
	.byte	20                              @ Abbrev [20] 0x34f:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string106                @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	21                              @ Abbrev [21] 0x359:0x40 DW_TAG_subprogram
	.long	.Lfunc_begin6                   @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string109                @ DW_AT_linkage_name
	.long	.Linfo_string108                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x372:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	1323                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x37c:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x386:0x9 DW_TAG_template_type_parameter
	.long	1323                            @ DW_AT_type
	.long	.Linfo_string105                @ DW_AT_name
	.byte	20                              @ Abbrev [20] 0x38f:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string106                @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	23                              @ Abbrev [23] 0x399:0x3c DW_TAG_subprogram
	.long	.Lfunc_begin7                   @ DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string110                @ DW_AT_linkage_name
	.long	.Linfo_string111                @ DW_AT_name
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.byte	22                              @ Abbrev [22] 0x3ae:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	8
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	1909                            @ DW_AT_type
	.byte	22                              @ Abbrev [22] 0x3b8:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.byte	5                               @ DW_AT_decl_file
	.byte	227                             @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x3c2:0x9 DW_TAG_template_type_parameter
	.long	1909                            @ DW_AT_type
	.long	.Linfo_string105                @ DW_AT_name
	.byte	20                              @ Abbrev [20] 0x3cb:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string106                @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x3d8:0x2f DW_TAG_namespace
	.long	.Linfo_string84                 @ DW_AT_name
	.byte	23                              @ Abbrev [23] 0x3dd:0x29 DW_TAG_subprogram
	.long	.Lfunc_begin8                   @ DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string112                @ DW_AT_linkage_name
	.long	.Linfo_string113                @ DW_AT_name
	.byte	6                               @ DW_AT_decl_file
	.byte	188                             @ DW_AT_decl_line
	.byte	22                              @ Abbrev [22] 0x3f2:0xa DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.byte	6                               @ DW_AT_decl_file
	.byte	188                             @ DW_AT_decl_line
	.long	1963                            @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x3fc:0x9 DW_TAG_template_type_parameter
	.long	1323                            @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x407:0x33 DW_TAG_namespace
	.long	.Linfo_string85                 @ DW_AT_name
	.byte	23                              @ Abbrev [23] 0x40c:0x2d DW_TAG_subprogram
	.long	.Lfunc_begin9                   @ DW_AT_low_pc
	.long	.Lfunc_end9-.Lfunc_begin9       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string114                @ DW_AT_linkage_name
	.long	.Linfo_string115                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.byte	157                             @ DW_AT_decl_line
	.byte	24                              @ Abbrev [24] 0x421:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string127                @ DW_AT_name
	.byte	7                               @ DW_AT_decl_file
	.byte	157                             @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x42f:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	6                               @ Abbrev [6] 0x43b:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	1                               @ DW_AT_byte_size
	.byte	8                               @ Abbrev [8] 0x442:0x1cd DW_TAG_namespace
	.long	.Linfo_string21                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x447:0x5a DW_TAG_namespace
	.long	.Linfo_string22                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x44c:0x54 DW_TAG_namespace
	.long	.Linfo_string23                 @ DW_AT_name
	.byte	23                              @ Abbrev [23] 0x451:0x4e DW_TAG_subprogram
	.long	.Lfunc_begin0                   @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string91                 @ DW_AT_linkage_name
	.long	.Linfo_string92                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	119                             @ DW_AT_decl_line
	.byte	24                              @ Abbrev [24] 0x466:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string120                @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	119                             @ DW_AT_decl_line
	.long	1909                            @ DW_AT_type
	.byte	25                              @ Abbrev [25] 0x474:0x18 DW_TAG_lexical_block
	.long	.Ltmp7                          @ DW_AT_low_pc
	.long	.Ltmp8-.Ltmp7                   @ DW_AT_high_pc
	.byte	26                              @ Abbrev [26] 0x47d:0xe DW_TAG_variable
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string17                 @ DW_AT_name
	.byte	1                               @ DW_AT_decl_file
	.byte	123                             @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	20                              @ Abbrev [20] 0x48c:0x9 DW_TAG_template_type_parameter
	.long	1909                            @ DW_AT_type
	.long	.Linfo_string90                 @ DW_AT_name
	.byte	20                              @ Abbrev [20] 0x495:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x4a1:0x9f DW_TAG_namespace
	.long	.Linfo_string9                  @ DW_AT_name
	.byte	21                              @ Abbrev [21] 0x4a6:0x4d DW_TAG_subprogram
	.long	.Lfunc_begin1                   @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string93                 @ DW_AT_linkage_name
	.long	.Linfo_string94                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	140                             @ DW_AT_decl_line
	.long	1923                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0x4bf:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	24
	.long	.Linfo_string103                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	141                             @ DW_AT_decl_line
	.long	1909                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0x4cd:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	32
	.long	.Linfo_string121                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	142                             @ DW_AT_decl_line
	.long	1923                            @ DW_AT_type
	.byte	24                              @ Abbrev [24] 0x4db:0xe DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	56
	.long	.Linfo_string122                @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	143                             @ DW_AT_decl_line
	.long	1937                            @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x4e9:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x4f3:0x4c DW_TAG_namespace
	.long	.Linfo_string24                 @ DW_AT_name
	.byte	21                              @ Abbrev [21] 0x4f8:0x33 DW_TAG_subprogram
	.long	.Lfunc_begin2                   @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string96                 @ DW_AT_linkage_name
	.long	.Linfo_string97                 @ DW_AT_name
	.byte	2                               @ DW_AT_decl_file
	.byte	146                             @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	27                              @ Abbrev [27] 0x511:0x10 DW_TAG_variable
	.byte	3                               @ DW_AT_location
	.byte	145
	.byte	0
	.byte	6
	.long	.Linfo_string103                @ DW_AT_name
	.byte	1                               @ DW_AT_alignment
	.byte	2                               @ DW_AT_decl_file
	.byte	141                             @ DW_AT_decl_line
	.long	1909                            @ DW_AT_type
	.byte	20                              @ Abbrev [20] 0x521:0x9 DW_TAG_template_type_parameter
	.long	79                              @ DW_AT_type
	.long	.Linfo_string59                 @ DW_AT_name
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x52b:0x13 DW_TAG_structure_type
	.long	.Linfo_string104                @ DW_AT_name
	.byte	8                               @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x532:0xb DW_TAG_member
	.long	.Linfo_string103                @ DW_AT_name
	.long	1909                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x540:0x55 DW_TAG_namespace
	.long	.Linfo_string25                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x545:0x4f DW_TAG_namespace
	.long	.Linfo_string26                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x54a:0x49 DW_TAG_namespace
	.long	.Linfo_string27                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x54f:0x43 DW_TAG_namespace
	.long	.Linfo_string28                 @ DW_AT_name
	.byte	11                              @ Abbrev [11] 0x554:0x3d DW_TAG_structure_type
	.long	.Linfo_string30                 @ DW_AT_name
	.byte	1                               @ DW_AT_byte_size
	.byte	1                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x55b:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1083                            @ DW_AT_type
	.byte	1                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	17                              @ Abbrev [17] 0x566:0x2a DW_TAG_subprogram
	.long	.Lfunc_begin3                   @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string99                 @ DW_AT_linkage_name
	.long	.Linfo_string100                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	474                             @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0x580:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string124                @ DW_AT_name
	.byte	3                               @ DW_AT_decl_file
	.short	474                             @ DW_AT_decl_line
	.long	1950                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x595:0x79 DW_TAG_namespace
	.long	.Linfo_string27                 @ DW_AT_name
	.byte	8                               @ Abbrev [8] 0x59a:0x30 DW_TAG_namespace
	.long	.Linfo_string86                 @ DW_AT_name
	.byte	17                              @ Abbrev [17] 0x59f:0x2a DW_TAG_subprogram
	.long	.Lfunc_begin10                  @ DW_AT_low_pc
	.long	.Lfunc_end10-.Lfunc_begin10     @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string116                @ DW_AT_linkage_name
	.long	.Linfo_string117                @ DW_AT_name
	.byte	8                               @ DW_AT_decl_file
	.short	2019                            @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0x5b9:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string124                @ DW_AT_name
	.byte	8                               @ DW_AT_decl_file
	.short	2019                            @ DW_AT_decl_line
	.long	79                              @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x5ca:0x30 DW_TAG_namespace
	.long	.Linfo_string87                 @ DW_AT_name
	.byte	17                              @ Abbrev [17] 0x5cf:0x2a DW_TAG_subprogram
	.long	.Lfunc_begin11                  @ DW_AT_low_pc
	.long	.Lfunc_end11-.Lfunc_begin11     @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string118                @ DW_AT_linkage_name
	.long	.Linfo_string117                @ DW_AT_name
	.byte	8                               @ DW_AT_decl_file
	.short	2053                            @ DW_AT_decl_line
	.long	1930                            @ DW_AT_type
	.byte	18                              @ Abbrev [18] 0x5e9:0xf DW_TAG_formal_parameter
	.byte	2                               @ DW_AT_location
	.byte	145
	.byte	7
	.long	.Linfo_string124                @ DW_AT_name
	.byte	8                               @ DW_AT_decl_file
	.short	2053                            @ DW_AT_decl_line
	.long	1530                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x5fa:0x13 DW_TAG_structure_type
	.long	.Linfo_string30                 @ DW_AT_name
	.byte	1                               @ DW_AT_byte_size
	.byte	1                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x601:0xb DW_TAG_member
	.long	.Linfo_string29                 @ DW_AT_name
	.long	1364                            @ DW_AT_type
	.byte	1                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	0                               @ End Of Children Mark
	.byte	11                              @ Abbrev [11] 0x60f:0x1e DW_TAG_structure_type
	.long	.Linfo_string38                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x616:0xb DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	1581                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x621:0xb DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x62d:0xd DW_TAG_pointer_type
	.long	1594                            @ DW_AT_type
	.long	.Linfo_string37                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	11                              @ Abbrev [11] 0x63a:0x1e DW_TAG_structure_type
	.long	.Linfo_string36                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x641:0xb DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	1624                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x64c:0xb DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x658:0xd DW_TAG_pointer_type
	.long	1083                            @ DW_AT_type
	.long	.Linfo_string33                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	6                               @ Abbrev [6] 0x665:0x7 DW_TAG_base_type
	.long	.Linfo_string35                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	8                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x66c:0x7 DW_TAG_base_type
	.long	.Linfo_string40                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	8                               @ DW_AT_byte_size
	.byte	11                              @ Abbrev [11] 0x673:0x1e DW_TAG_structure_type
	.long	.Linfo_string58                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x67a:0xb DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	1681                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x685:0xb DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x691:0xd DW_TAG_pointer_type
	.long	149                             @ DW_AT_type
	.long	.Linfo_string57                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	6                               @ Abbrev [6] 0x69e:0x7 DW_TAG_base_type
	.long	.Linfo_string45                 @ DW_AT_name
	.byte	8                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x6a5:0x7 DW_TAG_base_type
	.long	.Linfo_string48                 @ DW_AT_name
	.byte	7                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	11                              @ Abbrev [11] 0x6ac:0x1e DW_TAG_structure_type
	.long	.Linfo_string79                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	12                              @ Abbrev [12] 0x6b3:0xb DW_TAG_member
	.long	.Linfo_string32                 @ DW_AT_name
	.long	1738                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
	.byte	12                              @ Abbrev [12] 0x6be:0xb DW_TAG_member
	.long	.Linfo_string34                 @ DW_AT_name
	.long	1637                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x6ca:0xd DW_TAG_pointer_type
	.long	450                             @ DW_AT_type
	.long	.Linfo_string78                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	5                               @ Abbrev [5] 0x6d7:0xd DW_TAG_pointer_type
	.long	1764                            @ DW_AT_type
	.long	.Linfo_string65                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	16                              @ Abbrev [16] 0x6e4:0x7 DW_TAG_structure_type
	.long	.Linfo_string64                 @ DW_AT_name
	.byte	0                               @ DW_AT_byte_size
	.byte	1                               @ DW_AT_alignment
	.byte	5                               @ Abbrev [5] 0x6eb:0xd DW_TAG_pointer_type
	.long	1784                            @ DW_AT_type
	.long	.Linfo_string76                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	28                              @ Abbrev [28] 0x6f8:0x10 DW_TAG_subroutine_type
	.long	560                             @ DW_AT_type
	.byte	29                              @ Abbrev [29] 0x6fd:0x5 DW_TAG_formal_parameter
	.long	1751                            @ DW_AT_type
	.byte	29                              @ Abbrev [29] 0x702:0x5 DW_TAG_formal_parameter
	.long	1800                            @ DW_AT_type
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x708:0xd DW_TAG_pointer_type
	.long	480                             @ DW_AT_type
	.long	.Linfo_string75                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	11                              @ Abbrev [11] 0x715:0x1e DW_TAG_structure_type
	.long	.Linfo_string73                 @ DW_AT_name
	.byte	16                              @ DW_AT_byte_size
	.byte	8                               @ DW_AT_alignment
	.byte	30                              @ Abbrev [30] 0x71c:0xb DW_TAG_member
	.long	.Linfo_string69                 @ DW_AT_name
	.long	1843                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	0                               @ DW_AT_data_member_location
                                        @ DW_AT_artificial
	.byte	30                              @ Abbrev [30] 0x727:0xb DW_TAG_member
	.long	.Linfo_string71                 @ DW_AT_name
	.long	1856                            @ DW_AT_type
	.byte	8                               @ DW_AT_alignment
	.byte	8                               @ DW_AT_data_member_location
                                        @ DW_AT_artificial
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x733:0xd DW_TAG_pointer_type
	.long	1083                            @ DW_AT_type
	.long	.Linfo_string70                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	5                               @ Abbrev [5] 0x740:0xd DW_TAG_pointer_type
	.long	1869                            @ DW_AT_type
	.long	.Linfo_string72                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	3                               @ Abbrev [3] 0x74d:0xd DW_TAG_array_type
	.long	1637                            @ DW_AT_type
	.byte	4                               @ Abbrev [4] 0x752:0x7 DW_TAG_subrange_type
	.long	86                              @ DW_AT_type
	.byte	0                               @ DW_AT_lower_bound
	.byte	3                               @ DW_AT_count
	.byte	0                               @ End Of Children Mark
	.byte	8                               @ Abbrev [8] 0x75a:0x1b DW_TAG_namespace
	.long	.Linfo_string88                 @ DW_AT_name
	.byte	31                              @ Abbrev [31] 0x75f:0x15 DW_TAG_subprogram
	.long	.Lfunc_begin12                  @ DW_AT_low_pc
	.long	.Lfunc_end12-.Lfunc_begin12     @ DW_AT_high_pc
	.byte	1                               @ DW_AT_frame_base
	.byte	93
	.long	.Linfo_string119                @ DW_AT_linkage_name
	.long	.Linfo_string103                @ DW_AT_name
	.byte	9                               @ DW_AT_decl_file
	.byte	1                               @ DW_AT_decl_line
                                        @ DW_AT_main_subprogram
	.byte	0                               @ End Of Children Mark
	.byte	5                               @ Abbrev [5] 0x775:0xd DW_TAG_pointer_type
	.long	1922                            @ DW_AT_type
	.long	.Linfo_string89                 @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	32                              @ Abbrev [32] 0x782:0x1 DW_TAG_subroutine_type
	.byte	6                               @ Abbrev [6] 0x783:0x7 DW_TAG_base_type
	.long	.Linfo_string95                 @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	8                               @ DW_AT_byte_size
	.byte	6                               @ Abbrev [6] 0x78a:0x7 DW_TAG_base_type
	.long	.Linfo_string98                 @ DW_AT_name
	.byte	5                               @ DW_AT_encoding
	.byte	4                               @ DW_AT_byte_size
	.byte	5                               @ Abbrev [5] 0x791:0xd DW_TAG_pointer_type
	.long	1624                            @ DW_AT_type
	.long	.Linfo_string123                @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	5                               @ Abbrev [5] 0x79e:0xd DW_TAG_pointer_type
	.long	1364                            @ DW_AT_type
	.long	.Linfo_string125                @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	5                               @ Abbrev [5] 0x7ab:0xd DW_TAG_pointer_type
	.long	1323                            @ DW_AT_type
	.long	.Linfo_string126                @ DW_AT_name
	.long	0                               @ DW_AT_address_class
	.byte	0                               @ End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"clang LLVM (rustc version 1.57.0 (f1edd0429 2021-11-29))" @ string offset=0
.Linfo_string1:
	.asciz	"src/main.rs"                   @ string offset=57
.Linfo_string2:
	.asciz	"/home/carlosterberg/helloworld" @ string offset=69
.Linfo_string3:
	.asciz	"<std::rt::lang_start::{closure#0} as core::ops::function::Fn<()>>::{vtable}" @ string offset=100
.Linfo_string4:
	.asciz	"()"                            @ string offset=176
.Linfo_string5:
	.asciz	"*const ()"                     @ string offset=179
.Linfo_string6:
	.asciz	"__ARRAY_SIZE_TYPE__"           @ string offset=189
.Linfo_string7:
	.asciz	"core"                          @ string offset=209
.Linfo_string8:
	.asciz	"fmt"                           @ string offset=214
.Linfo_string9:
	.asciz	"rt"                            @ string offset=218
.Linfo_string10:
	.asciz	"v1"                            @ string offset=221
.Linfo_string11:
	.asciz	"u8"                            @ string offset=224
.Linfo_string12:
	.asciz	"Left"                          @ string offset=227
.Linfo_string13:
	.asciz	"Right"                         @ string offset=232
.Linfo_string14:
	.asciz	"Center"                        @ string offset=238
.Linfo_string15:
	.asciz	"Unknown"                       @ string offset=245
.Linfo_string16:
	.asciz	"Alignment"                     @ string offset=253
.Linfo_string17:
	.asciz	"result"                        @ string offset=263
.Linfo_string18:
	.asciz	"Ok"                            @ string offset=270
.Linfo_string19:
	.asciz	"Err"                           @ string offset=273
.Linfo_string20:
	.asciz	"Result"                        @ string offset=277
.Linfo_string21:
	.asciz	"std"                           @ string offset=284
.Linfo_string22:
	.asciz	"sys_common"                    @ string offset=288
.Linfo_string23:
	.asciz	"backtrace"                     @ string offset=299
.Linfo_string24:
	.asciz	"lang_start"                    @ string offset=309
.Linfo_string25:
	.asciz	"sys"                           @ string offset=320
.Linfo_string26:
	.asciz	"unix"                          @ string offset=324
.Linfo_string27:
	.asciz	"process"                       @ string offset=329
.Linfo_string28:
	.asciz	"process_common"                @ string offset=337
.Linfo_string29:
	.asciz	"__0"                           @ string offset=352
.Linfo_string30:
	.asciz	"ExitCode"                      @ string offset=356
.Linfo_string31:
	.asciz	"pieces"                        @ string offset=365
.Linfo_string32:
	.asciz	"data_ptr"                      @ string offset=372
.Linfo_string33:
	.asciz	"*const u8"                     @ string offset=381
.Linfo_string34:
	.asciz	"length"                        @ string offset=391
.Linfo_string35:
	.asciz	"usize"                         @ string offset=398
.Linfo_string36:
	.asciz	"&str"                          @ string offset=404
.Linfo_string37:
	.asciz	"*const &str"                   @ string offset=409
.Linfo_string38:
	.asciz	"&[&str]"                       @ string offset=421
.Linfo_string39:
	.asciz	"option"                        @ string offset=429
.Linfo_string40:
	.asciz	"u64"                           @ string offset=436
.Linfo_string41:
	.asciz	"None"                          @ string offset=440
.Linfo_string42:
	.asciz	"position"                      @ string offset=445
.Linfo_string43:
	.asciz	"format"                        @ string offset=454
.Linfo_string44:
	.asciz	"fill"                          @ string offset=461
.Linfo_string45:
	.asciz	"char"                          @ string offset=466
.Linfo_string46:
	.asciz	"align"                         @ string offset=471
.Linfo_string47:
	.asciz	"flags"                         @ string offset=477
.Linfo_string48:
	.asciz	"u32"                           @ string offset=483
.Linfo_string49:
	.asciz	"precision"                     @ string offset=487
.Linfo_string50:
	.asciz	"Is"                            @ string offset=497
.Linfo_string51:
	.asciz	"Param"                         @ string offset=500
.Linfo_string52:
	.asciz	"Implied"                       @ string offset=506
.Linfo_string53:
	.asciz	"Count"                         @ string offset=514
.Linfo_string54:
	.asciz	"width"                         @ string offset=520
.Linfo_string55:
	.asciz	"FormatSpec"                    @ string offset=526
.Linfo_string56:
	.asciz	"Argument"                      @ string offset=537
.Linfo_string57:
	.asciz	"*const Argument"               @ string offset=546
.Linfo_string58:
	.asciz	"&[core::fmt::rt::v1::Argument]" @ string offset=562
.Linfo_string59:
	.asciz	"T"                             @ string offset=593
.Linfo_string60:
	.asciz	"Some"                          @ string offset=595
.Linfo_string61:
	.asciz	"Option<&[core::fmt::rt::v1::Argument]>" @ string offset=600
.Linfo_string62:
	.asciz	"args"                          @ string offset=639
.Linfo_string63:
	.asciz	"value"                         @ string offset=644
.Linfo_string64:
	.asciz	"Opaque"                        @ string offset=650
.Linfo_string65:
	.asciz	"&Opaque"                       @ string offset=657
.Linfo_string66:
	.asciz	"formatter"                     @ string offset=665
.Linfo_string67:
	.asciz	"Option<usize>"                 @ string offset=675
.Linfo_string68:
	.asciz	"buf"                           @ string offset=689
.Linfo_string69:
	.asciz	"pointer"                       @ string offset=693
.Linfo_string70:
	.asciz	"*mut u8"                       @ string offset=701
.Linfo_string71:
	.asciz	"vtable"                        @ string offset=709
.Linfo_string72:
	.asciz	"&[usize; 3]"                   @ string offset=716
.Linfo_string73:
	.asciz	"&mut dyn core::fmt::Write"     @ string offset=728
.Linfo_string74:
	.asciz	"Formatter"                     @ string offset=754
.Linfo_string75:
	.asciz	"&mut Formatter"                @ string offset=764
.Linfo_string76:
	.asciz	"fn(&core::fmt::::Opaque, &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error>" @ string offset=779
.Linfo_string77:
	.asciz	"ArgumentV1"                    @ string offset=877
.Linfo_string78:
	.asciz	"*const ArgumentV1"             @ string offset=888
.Linfo_string79:
	.asciz	"&[core::fmt::ArgumentV1]"      @ string offset=906
.Linfo_string80:
	.asciz	"Arguments"                     @ string offset=931
.Linfo_string81:
	.asciz	"ops"                           @ string offset=941
.Linfo_string82:
	.asciz	"function"                      @ string offset=945
.Linfo_string83:
	.asciz	"FnOnce"                        @ string offset=954
.Linfo_string84:
	.asciz	"ptr"                           @ string offset=961
.Linfo_string85:
	.asciz	"hint"                          @ string offset=965
.Linfo_string86:
	.asciz	"{impl#48}"                     @ string offset=970
.Linfo_string87:
	.asciz	"{impl#52}"                     @ string offset=980
.Linfo_string88:
	.asciz	"helloworld"                    @ string offset=990
.Linfo_string89:
	.asciz	"fn()"                          @ string offset=1001
.Linfo_string90:
	.asciz	"F"                             @ string offset=1006
.Linfo_string91:
	.asciz	"_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E" @ string offset=1008
.Linfo_string92:
	.asciz	"__rust_begin_short_backtrace<fn(), ()>" @ string offset=1088
.Linfo_string93:
	.asciz	"_ZN3std2rt10lang_start17h95c4eabd28917cccE" @ string offset=1127
.Linfo_string94:
	.asciz	"lang_start<()>"                @ string offset=1170
.Linfo_string95:
	.asciz	"isize"                         @ string offset=1185
.Linfo_string96:
	.asciz	"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E" @ string offset=1191
.Linfo_string97:
	.asciz	"{closure#0}<()>"               @ string offset=1264
.Linfo_string98:
	.asciz	"i32"                           @ string offset=1280
.Linfo_string99:
	.asciz	"_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE" @ string offset=1284
.Linfo_string100:
	.asciz	"as_i32"                        @ string offset=1361
.Linfo_string101:
	.asciz	"_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E" @ string offset=1368
.Linfo_string102:
	.asciz	"new_v1"                        @ string offset=1418
.Linfo_string103:
	.asciz	"main"                          @ string offset=1425
.Linfo_string104:
	.asciz	"{closure#0}"                   @ string offset=1430
.Linfo_string105:
	.asciz	"Self"                          @ string offset=1442
.Linfo_string106:
	.asciz	"Args"                          @ string offset=1447
.Linfo_string107:
	.asciz	"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E" @ string offset=1452
.Linfo_string108:
	.asciz	"call_once<std::rt::lang_start::{closure#0}, ()>" @ string offset=1543
.Linfo_string109:
	.asciz	"_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE" @ string offset=1591
.Linfo_string110:
	.asciz	"_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E" @ string offset=1650
.Linfo_string111:
	.asciz	"call_once<fn(), ()>"           @ string offset=1709
.Linfo_string112:
	.asciz	"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E" @ string offset=1729
.Linfo_string113:
	.asciz	"drop_in_place<std::rt::lang_start::{closure#0}>" @ string offset=1849
.Linfo_string114:
	.asciz	"_ZN4core4hint9black_box17hecf72d9b21525f67E" @ string offset=1897
.Linfo_string115:
	.asciz	"black_box<()>"                 @ string offset=1941
.Linfo_string116:
	.asciz	"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E" @ string offset=1955
.Linfo_string117:
	.asciz	"report"                        @ string offset=2042
.Linfo_string118:
	.asciz	"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E" @ string offset=2049
.Linfo_string119:
	.asciz	"_ZN10helloworld4main17h2d296a82238a34ebE" @ string offset=2150
.Linfo_string120:
	.asciz	"f"                             @ string offset=2191
.Linfo_string121:
	.asciz	"argc"                          @ string offset=2193
.Linfo_string122:
	.asciz	"argv"                          @ string offset=2198
.Linfo_string123:
	.asciz	"*const *const u8"              @ string offset=2203
.Linfo_string124:
	.asciz	"self"                          @ string offset=2220
.Linfo_string125:
	.asciz	"&ExitCode"                     @ string offset=2225
.Linfo_string126:
	.asciz	"*mut {closure#0}"              @ string offset=2235
.Linfo_string127:
	.asciz	"dummy"                         @ string offset=2252
	.section	.debug_pubnames,"",%progbits
	.long	.LpubNames_end0-.LpubNames_start0 @ Length of Public Names Info
.LpubNames_start0:
	.short	2                               @ DWARF Version
	.long	.Lcu_begin0                     @ Offset of Compilation Unit Info
	.long	1977                            @ Compilation Unit Length
	.long	1100                            @ DIE offset
	.asciz	"backtrace"                     @ External Name
	.long	1429                            @ DIE offset
	.asciz	"process"                       @ External Name
	.long	1349                            @ DIE offset
	.asciz	"unix"                          @ External Name
	.long	555                             @ DIE offset
	.asciz	"result"                        @ External Name
	.long	783                             @ DIE offset
	.asciz	"function"                      @ External Name
	.long	93                              @ DIE offset
	.asciz	"core"                          @ External Name
	.long	1090                            @ DIE offset
	.asciz	"std"                           @ External Name
	.long	124                             @ DIE offset
	.asciz	"Left"                          @ External Name
	.long	989                             @ DIE offset
	.asciz	"drop_in_place<std::rt::lang_start::{closure#0}>" @ External Name
	.long	1267                            @ DIE offset
	.asciz	"lang_start"                    @ External Name
	.long	142                             @ DIE offset
	.asciz	"Unknown"                       @ External Name
	.long	921                             @ DIE offset
	.asciz	"call_once<fn(), ()>"           @ External Name
	.long	778                             @ DIE offset
	.asciz	"ops"                           @ External Name
	.long	984                             @ DIE offset
	.asciz	"ptr"                           @ External Name
	.long	585                             @ DIE offset
	.asciz	"option"                        @ External Name
	.long	571                             @ DIE offset
	.asciz	"Ok"                            @ External Name
	.long	857                             @ DIE offset
	.asciz	"call_once<std::rt::lang_start::{closure#0}, ()>" @ External Name
	.long	1487                            @ DIE offset
	.asciz	"report"                        @ External Name
	.long	130                             @ DIE offset
	.asciz	"Right"                         @ External Name
	.long	136                             @ DIE offset
	.asciz	"Center"                        @ External Name
	.long	1382                            @ DIE offset
	.asciz	"as_i32"                        @ External Name
	.long	1887                            @ DIE offset
	.asciz	"main"                          @ External Name
	.long	1185                            @ DIE offset
	.asciz	"rt"                            @ External Name
	.long	98                              @ DIE offset
	.asciz	"fmt"                           @ External Name
	.long	108                             @ DIE offset
	.asciz	"v1"                            @ External Name
	.long	577                             @ DIE offset
	.asciz	"Err"                           @ External Name
	.long	1095                            @ DIE offset
	.asciz	"sys_common"                    @ External Name
	.long	1359                            @ DIE offset
	.asciz	"process_common"                @ External Name
	.long	392                             @ DIE offset
	.asciz	"new_v1"                        @ External Name
	.long	1036                            @ DIE offset
	.asciz	"black_box<()>"                 @ External Name
	.long	1031                            @ DIE offset
	.asciz	"hint"                          @ External Name
	.long	1482                            @ DIE offset
	.asciz	"{impl#52}"                     @ External Name
	.long	1272                            @ DIE offset
	.asciz	"{closure#0}<()>"               @ External Name
	.long	38                              @ DIE offset
	.asciz	"<std::rt::lang_start::{closure#0} as core::ops::function::Fn<()>>::{vtable}" @ External Name
	.long	788                             @ DIE offset
	.asciz	"FnOnce"                        @ External Name
	.long	1434                            @ DIE offset
	.asciz	"{impl#48}"                     @ External Name
	.long	1105                            @ DIE offset
	.asciz	"__rust_begin_short_backtrace<fn(), ()>" @ External Name
	.long	1882                            @ DIE offset
	.asciz	"helloworld"                    @ External Name
	.long	1190                            @ DIE offset
	.asciz	"lang_start<()>"                @ External Name
	.long	1344                            @ DIE offset
	.asciz	"sys"                           @ External Name
	.long	0                               @ End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",%progbits
	.long	.LpubTypes_end0-.LpubTypes_start0 @ Length of Public Types Info
.LpubTypes_start0:
	.short	2                               @ DWARF Version
	.long	.Lcu_begin0                     @ Offset of Compilation Unit Info
	.long	1977                            @ Compilation Unit Length
	.long	1708                            @ DIE offset
	.asciz	"&[core::fmt::ArgumentV1]"      @ External Name
	.long	1923                            @ DIE offset
	.asciz	"isize"                         @ External Name
	.long	1323                            @ DIE offset
	.asciz	"{closure#0}"                   @ External Name
	.long	1963                            @ DIE offset
	.asciz	"*mut {closure#0}"              @ External Name
	.long	1764                            @ DIE offset
	.asciz	"Opaque"                        @ External Name
	.long	1083                            @ DIE offset
	.asciz	"u8"                            @ External Name
	.long	1843                            @ DIE offset
	.asciz	"*mut u8"                       @ External Name
	.long	1937                            @ DIE offset
	.asciz	"*const *const u8"              @ External Name
	.long	1581                            @ DIE offset
	.asciz	"*const &str"                   @ External Name
	.long	79                              @ DIE offset
	.asciz	"()"                            @ External Name
	.long	1637                            @ DIE offset
	.asciz	"usize"                         @ External Name
	.long	179                             @ DIE offset
	.asciz	"FormatSpec"                    @ External Name
	.long	480                             @ DIE offset
	.asciz	"Formatter"                     @ External Name
	.long	1800                            @ DIE offset
	.asciz	"&mut Formatter"                @ External Name
	.long	1950                            @ DIE offset
	.asciz	"&ExitCode"                     @ External Name
	.long	1856                            @ DIE offset
	.asciz	"&[usize; 3]"                   @ External Name
	.long	1551                            @ DIE offset
	.asciz	"&[&str]"                       @ External Name
	.long	1694                            @ DIE offset
	.asciz	"char"                          @ External Name
	.long	113                             @ DIE offset
	.asciz	"Alignment"                     @ External Name
	.long	1644                            @ DIE offset
	.asciz	"u64"                           @ External Name
	.long	590                             @ DIE offset
	.asciz	"Option<&[core::fmt::rt::v1::Argument]>" @ External Name
	.long	66                              @ DIE offset
	.asciz	"*const ()"                     @ External Name
	.long	149                             @ DIE offset
	.asciz	"Argument"                      @ External Name
	.long	1624                            @ DIE offset
	.asciz	"*const u8"                     @ External Name
	.long	560                             @ DIE offset
	.asciz	"Result"                        @ External Name
	.long	683                             @ DIE offset
	.asciz	"Option<usize>"                 @ External Name
	.long	1909                            @ DIE offset
	.asciz	"fn()"                          @ External Name
	.long	242                             @ DIE offset
	.asciz	"Count"                         @ External Name
	.long	450                             @ DIE offset
	.asciz	"ArgumentV1"                    @ External Name
	.long	1813                            @ DIE offset
	.asciz	"&mut dyn core::fmt::Write"     @ External Name
	.long	1771                            @ DIE offset
	.asciz	"fn(&core::fmt::::Opaque, &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error>" @ External Name
	.long	1651                            @ DIE offset
	.asciz	"&[core::fmt::rt::v1::Argument]" @ External Name
	.long	1930                            @ DIE offset
	.asciz	"i32"                           @ External Name
	.long	1751                            @ DIE offset
	.asciz	"&Opaque"                       @ External Name
	.long	1681                            @ DIE offset
	.asciz	"*const Argument"               @ External Name
	.long	1530                            @ DIE offset
	.asciz	"ExitCode"                      @ External Name
	.long	352                             @ DIE offset
	.asciz	"Arguments"                     @ External Name
	.long	1701                            @ DIE offset
	.asciz	"u32"                           @ External Name
	.long	1738                            @ DIE offset
	.asciz	"*const ArgumentV1"             @ External Name
	.long	1594                            @ DIE offset
	.asciz	"&str"                          @ External Name
	.long	0                               @ End Mark
.LpubTypes_end0:
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
	.section	.debug_line,"",%progbits
.Lline_table_start0:

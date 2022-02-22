; ModuleID = '1qy0s3krhxnn7fkb'
source_filename = "1qy0s3krhxnn7fkb"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::fmt::Arguments" = type { { [0 x { [0 x i8]*, i64 }]*, i64 }, { i64*, i64 }, { [0 x { i8*, i64* }]*, i64 } }
%"core::panic::location::Location" = type { { [0 x i8]*, i64 }, i32, i32 }
%"unwind::libunwind::_Unwind_Exception" = type { i64, void (i32, %"unwind::libunwind::_Unwind_Exception"*)*, [6 x i64] }
%"unwind::libunwind::_Unwind_Context" = type { [0 x i8] }

@vtable.0 = private unnamed_addr constant <{ i8*, [16 x i8], i8*, i8*, i8*, [0 x i8] }> <{ i8* bitcast (void (i64**)* @"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E" to i8*), [16 x i8] c"\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00", i8* bitcast (i32 (i64**)* @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E" to i8*), i8* bitcast (i32 (i64**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E" to i8*), i8* bitcast (i32 (i64**)* @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E" to i8*), [0 x i8] zeroinitializer }>, align 8, !dbg !0
@alloc33 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc34 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs" }>, align 1
@alloc35 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [75 x i8] }>, <{ [75 x i8] }>* @alloc34, i32 0, i32 0, i32 0), [16 x i8] c"K\00\00\00\00\00\00\00k\01\00\00\0D\00\00\00" }>, align 8
@alloc2 = private unnamed_addr constant <{ [14 x i8] }> <{ [14 x i8] c"Hello, world!\0A" }>, align 1
@alloc3 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [14 x i8] }>, <{ [14 x i8] }>* @alloc2, i32 0, i32 0, i32 0), [8 x i8] c"\0E\00\00\00\00\00\00\00" }>, align 8
@alloc5 = private unnamed_addr constant <{ [0 x i8] }> zeroinitializer, align 8
@__rustc_debug_gdb_scripts_section__ = linkonce_odr unnamed_addr constant [34 x i8] c"\01gdb_load_rust_pretty_printers.py\00", section ".debug_gdb_scripts", align 1

; std::sys_common::backtrace::__rust_begin_short_backtrace
; Function Attrs: noinline nonlazybind uwtable
define internal void @_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E(void ()* nonnull %f) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality !dbg !32 {
start:
  %0 = alloca { i8*, i32 }, align 8
  %f.dbg.spill = alloca void ()*, align 8
  %result.dbg.spill = alloca {}, align 1
  call void @llvm.dbg.declare(metadata {}* %result.dbg.spill, metadata !44, metadata !DIExpression()), !dbg !49
  store void ()* %f, void ()** %f.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata void ()** %f.dbg.spill, metadata !43, metadata !DIExpression()), !dbg !50
; call core::ops::function::FnOnce::call_once
  call void @_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E(void ()* nonnull %f), !dbg !51
  br label %bb1, !dbg !51

bb1:                                              ; preds = %start
; invoke core::hint::black_box
  invoke void @_ZN4core4hint9black_box17hecf72d9b21525f67E()
          to label %bb2 unwind label %cleanup, !dbg !52

bb2:                                              ; preds = %bb1
  ret void, !dbg !53

bb3:                                              ; preds = %cleanup
  br label %bb4, !dbg !54

cleanup:                                          ; preds = %bb1
  %1 = landingpad { i8*, i32 }
          cleanup
  %2 = extractvalue { i8*, i32 } %1, 0
  %3 = extractvalue { i8*, i32 } %1, 1
  %4 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 0
  store i8* %2, i8** %4, align 8
  %5 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  store i32 %3, i32* %5, align 8
  br label %bb3

bb4:                                              ; preds = %bb3
  %6 = bitcast { i8*, i32 }* %0 to i8**, !dbg !55
  %7 = load i8*, i8** %6, align 8, !dbg !55
  %8 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1, !dbg !55
  %9 = load i32, i32* %8, align 8, !dbg !55
  %10 = insertvalue { i8*, i32 } undef, i8* %7, 0, !dbg !55
  %11 = insertvalue { i8*, i32 } %10, i32 %9, 1, !dbg !55
  resume { i8*, i32 } %11, !dbg !55
}

; std::rt::lang_start
; Function Attrs: nonlazybind uwtable
define hidden i64 @_ZN3std2rt10lang_start17h95c4eabd28917cccE(void ()* nonnull %main, i64 %argc, i8** %argv) unnamed_addr #1 !dbg !56 {
start:
  %v.dbg.spill = alloca i64, align 8
  %argv.dbg.spill = alloca i8**, align 8
  %argc.dbg.spill = alloca i64, align 8
  %main.dbg.spill = alloca void ()*, align 8
  %_8 = alloca i64*, align 8
  %_4 = alloca i64, align 8
  store void ()* %main, void ()** %main.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata void ()** %main.dbg.spill, metadata !65, metadata !DIExpression()), !dbg !71
  store i64 %argc, i64* %argc.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata i64* %argc.dbg.spill, metadata !66, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.dbg.spill, metadata !67, metadata !DIExpression()), !dbg !73
  %0 = bitcast i64** %_8 to void ()**, !dbg !74
  store void ()* %main, void ()** %0, align 8, !dbg !74
  %_5.0 = bitcast i64** %_8 to {}*, !dbg !75
; call std::rt::lang_start_internal
  %1 = call i64 @_ZN3std2rt19lang_start_internal17hd15a47be08101c28E({}* nonnull align 1 %_5.0, [3 x i64]* align 8 dereferenceable(24) bitcast (<{ i8*, [16 x i8], i8*, i8*, i8*, [0 x i8] }>* @vtable.0 to [3 x i64]*), i64 %argc, i8** %argv), !dbg !76
  store i64 %1, i64* %_4, align 8, !dbg !76
  br label %bb1, !dbg !76

bb1:                                              ; preds = %start
  %v = load i64, i64* %_4, align 8, !dbg !77
  store i64 %v, i64* %v.dbg.spill, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i64* %v.dbg.spill, metadata !68, metadata !DIExpression()), !dbg !78
  ret i64 %v, !dbg !79
}

; std::rt::lang_start::{{closure}}
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E"(i64** align 8 dereferenceable(8) %_1) unnamed_addr #2 !dbg !80 {
start:
  %_1.dbg.spill = alloca i64**, align 8
  store i64** %_1, i64*** %_1.dbg.spill, align 8
  %0 = load i64**, i64*** %_1.dbg.spill, align 8, !nonnull !89
  %1 = bitcast i64** %0 to void ()**
  call void @llvm.dbg.declare(metadata i64*** %_1.dbg.spill, metadata !91, metadata !DIExpression(DW_OP_deref)), !dbg !92
  %2 = bitcast i64** %_1 to void ()**, !dbg !93
  %_3 = load void ()*, void ()** %2, align 8, !dbg !93, !nonnull !89
; call std::sys_common::backtrace::__rust_begin_short_backtrace
  call void @_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E(void ()* nonnull %_3), !dbg !94
  br label %bb1, !dbg !94

bb1:                                              ; preds = %start
; call <() as std::process::Termination>::report
  %3 = call i32 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E"(), !dbg !94
  br label %bb2, !dbg !94

bb2:                                              ; preds = %bb1
  ret i32 %3, !dbg !95
}

; std::sys::unix::process::process_common::ExitCode::as_i32
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE(i8* align 1 dereferenceable(1) %self) unnamed_addr #2 !dbg !96 {
start:
  %self.dbg.spill = alloca i8*, align 8
  store i8* %self, i8** %self.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata i8** %self.dbg.spill, metadata !109, metadata !DIExpression()), !dbg !110
  %_2 = load i8, i8* %self, align 1, !dbg !111
  %0 = zext i8 %_2 to i32, !dbg !111
  ret i32 %0, !dbg !112
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E(%"core::fmt::Arguments"* noalias nocapture sret(%"core::fmt::Arguments") dereferenceable(48) %0, [0 x { [0 x i8]*, i64 }]* nonnull align 8 %pieces.0, i64 %pieces.1, [0 x { i8*, i64* }]* nonnull align 8 %args.0, i64 %args.1) unnamed_addr #2 !dbg !113 {
start:
  %args.dbg.spill = alloca { [0 x { i8*, i64* }]*, i64 }, align 8
  %pieces.dbg.spill = alloca { [0 x { [0 x i8]*, i64 }]*, i64 }, align 8
  %_16 = alloca { i64*, i64 }, align 8
  %_3 = alloca i8, align 1
  %1 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %pieces.dbg.spill, i32 0, i32 0
  store [0 x { [0 x i8]*, i64 }]* %pieces.0, [0 x { [0 x i8]*, i64 }]** %1, align 8
  %2 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %pieces.dbg.spill, i32 0, i32 1
  store i64 %pieces.1, i64* %2, align 8
  call void @llvm.dbg.declare(metadata { [0 x { [0 x i8]*, i64 }]*, i64 }* %pieces.dbg.spill, metadata !225, metadata !DIExpression()), !dbg !227
  %3 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %args.dbg.spill, i32 0, i32 0
  store [0 x { i8*, i64* }]* %args.0, [0 x { i8*, i64* }]** %3, align 8
  %4 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %args.dbg.spill, i32 0, i32 1
  store i64 %args.1, i64* %4, align 8
  call void @llvm.dbg.declare(metadata { [0 x { i8*, i64* }]*, i64 }* %args.dbg.spill, metadata !226, metadata !DIExpression()), !dbg !228
  %_4 = icmp ult i64 %pieces.1, %args.1, !dbg !229
  br i1 %_4, label %bb1, label %bb2, !dbg !229

bb2:                                              ; preds = %start
  %_12 = add i64 %args.1, 1, !dbg !230
  %_9 = icmp ugt i64 %pieces.1, %_12, !dbg !231
  %5 = zext i1 %_9 to i8, !dbg !229
  store i8 %5, i8* %_3, align 1, !dbg !229
  br label %bb3, !dbg !229

bb1:                                              ; preds = %start
  store i8 1, i8* %_3, align 1, !dbg !229
  br label %bb3, !dbg !229

bb3:                                              ; preds = %bb2, %bb1
  %6 = load i8, i8* %_3, align 1, !dbg !229, !range !232
  %7 = trunc i8 %6 to i1, !dbg !229
  br i1 %7, label %bb4, label %bb5, !dbg !229

bb5:                                              ; preds = %bb3
  %8 = bitcast { i64*, i64 }* %_16 to {}**, !dbg !233
  store {}* null, {}** %8, align 8, !dbg !233
  %9 = bitcast %"core::fmt::Arguments"* %0 to { [0 x { [0 x i8]*, i64 }]*, i64 }*, !dbg !234
  %10 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %9, i32 0, i32 0, !dbg !234
  store [0 x { [0 x i8]*, i64 }]* %pieces.0, [0 x { [0 x i8]*, i64 }]** %10, align 8, !dbg !234
  %11 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %9, i32 0, i32 1, !dbg !234
  store i64 %pieces.1, i64* %11, align 8, !dbg !234
  %12 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 1, !dbg !234
  %13 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_16, i32 0, i32 0, !dbg !234
  %14 = load i64*, i64** %13, align 8, !dbg !234
  %15 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_16, i32 0, i32 1, !dbg !234
  %16 = load i64, i64* %15, align 8, !dbg !234
  %17 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %12, i32 0, i32 0, !dbg !234
  store i64* %14, i64** %17, align 8, !dbg !234
  %18 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %12, i32 0, i32 1, !dbg !234
  store i64 %16, i64* %18, align 8, !dbg !234
  %19 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 2, !dbg !234
  %20 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %19, i32 0, i32 0, !dbg !234
  store [0 x { i8*, i64* }]* %args.0, [0 x { i8*, i64* }]** %20, align 8, !dbg !234
  %21 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %19, i32 0, i32 1, !dbg !234
  store i64 %args.1, i64* %21, align 8, !dbg !234
  ret void, !dbg !235

bb4:                                              ; preds = %bb3
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h0ba7146865b2f9d6E([0 x i8]* nonnull align 1 bitcast (<{ [12 x i8] }>* @alloc33 to [0 x i8]*), i64 12, %"core::panic::location::Location"* align 8 dereferenceable(24) bitcast (<{ i8*, [16 x i8] }>* @alloc35 to %"core::panic::location::Location"*)) #6, !dbg !236
  unreachable, !dbg !236
}

; core::ops::function::FnOnce::call_once{{vtable.shim}}
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E"(i64** %_1) unnamed_addr #2 !dbg !237 {
start:
  %_1.dbg.spill = alloca i64**, align 8
  %_2 = alloca {}, align 1
  store i64** %_1, i64*** %_1.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata i64*** %_1.dbg.spill, metadata !246, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.declare(metadata {}* %_2, metadata !247, metadata !DIExpression()), !dbg !251
  %0 = load i64*, i64** %_1, align 8, !dbg !251, !nonnull !89
; call core::ops::function::FnOnce::call_once
  %1 = call i32 @_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE(i64* nonnull %0), !dbg !251
  br label %bb1, !dbg !251

bb1:                                              ; preds = %start
  ret i32 %1, !dbg !251
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE(i64* nonnull %0) unnamed_addr #2 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality !dbg !252 {
start:
  %1 = alloca { i8*, i32 }, align 8
  %_2 = alloca {}, align 1
  %_1 = alloca i64*, align 8
  store i64* %0, i64** %_1, align 8
  call void @llvm.dbg.declare(metadata i64** %_1, metadata !256, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata {}* %_2, metadata !257, metadata !DIExpression()), !dbg !258
; invoke std::rt::lang_start::{{closure}}
  %2 = invoke i32 @"_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E"(i64** align 8 dereferenceable(8) %_1)
          to label %bb1 unwind label %cleanup, !dbg !258

bb1:                                              ; preds = %start
  br label %bb2, !dbg !258

bb3:                                              ; preds = %cleanup
  br label %bb4, !dbg !258

cleanup:                                          ; preds = %start
  %3 = landingpad { i8*, i32 }
          cleanup
  %4 = extractvalue { i8*, i32 } %3, 0
  %5 = extractvalue { i8*, i32 } %3, 1
  %6 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 0
  store i8* %4, i8** %6, align 8
  %7 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  store i32 %5, i32* %7, align 8
  br label %bb3

bb4:                                              ; preds = %bb3
  %8 = bitcast { i8*, i32 }* %1 to i8**, !dbg !258
  %9 = load i8*, i8** %8, align 8, !dbg !258
  %10 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1, !dbg !258
  %11 = load i32, i32* %10, align 8, !dbg !258
  %12 = insertvalue { i8*, i32 } undef, i8* %9, 0, !dbg !258
  %13 = insertvalue { i8*, i32 } %12, i32 %11, 1, !dbg !258
  resume { i8*, i32 } %13, !dbg !258

bb2:                                              ; preds = %bb1
  ret i32 %2, !dbg !258
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E(void ()* nonnull %_1) unnamed_addr #2 !dbg !259 {
start:
  %_1.dbg.spill = alloca void ()*, align 8
  %_2 = alloca {}, align 1
  store void ()* %_1, void ()** %_1.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata void ()** %_1.dbg.spill, metadata !261, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata {}* %_2, metadata !262, metadata !DIExpression()), !dbg !265
  call void %_1(), !dbg !265
  br label %bb1, !dbg !265

bb1:                                              ; preds = %start
  ret void, !dbg !265
}

; core::ptr::drop_in_place<std::rt::lang_start<()>::{{closure}}>
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E"(i64** %_1) unnamed_addr #2 !dbg !266 {
start:
  %_1.dbg.spill = alloca i64**, align 8
  store i64** %_1, i64*** %_1.dbg.spill, align 8
  call void @llvm.dbg.declare(metadata i64*** %_1.dbg.spill, metadata !272, metadata !DIExpression()), !dbg !275
  ret void, !dbg !275
}

; core::hint::black_box
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core4hint9black_box17hecf72d9b21525f67E() unnamed_addr #2 !dbg !276 {
start:
  %dummy.dbg.spill = alloca {}, align 1
  call void @llvm.dbg.declare(metadata {}* %dummy.dbg.spill, metadata !282, metadata !DIExpression()), !dbg !283
  call void asm sideeffect "", "r,~{memory}"({}* undef), !dbg !284, !srcloc !285
  br label %bb1, !dbg !284

bb1:                                              ; preds = %start
  ret void, !dbg !286
}

; <() as std::process::Termination>::report
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E"() unnamed_addr #2 !dbg !287 {
start:
  %self.dbg.spill = alloca {}, align 1
  call void @llvm.dbg.declare(metadata {}* %self.dbg.spill, metadata !294, metadata !DIExpression()), !dbg !295
; call <std::process::ExitCode as std::process::Termination>::report
  %0 = call i32 @"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E"(i8 0), !dbg !296
  br label %bb1, !dbg !296

bb1:                                              ; preds = %start
  ret i32 %0, !dbg !297
}

; <std::process::ExitCode as std::process::Termination>::report
; Function Attrs: inlinehint nonlazybind uwtable
define internal i32 @"_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E"(i8 %0) unnamed_addr #2 !dbg !298 {
start:
  %self = alloca i8, align 1
  store i8 %0, i8* %self, align 1
  call void @llvm.dbg.declare(metadata i8* %self, metadata !306, metadata !DIExpression()), !dbg !307
; call std::sys::unix::process::process_common::ExitCode::as_i32
  %1 = call i32 @_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE(i8* align 1 dereferenceable(1) %self), !dbg !308
  br label %bb1, !dbg !308

bb1:                                              ; preds = %start
  ret i32 %1, !dbg !309
}

; helloworld::main
; Function Attrs: nonlazybind uwtable
define internal void @_ZN10helloworld4main17h2d296a82238a34ebE() unnamed_addr #1 !dbg !310 {
start:
  %_2 = alloca %"core::fmt::Arguments", align 8
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E(%"core::fmt::Arguments"* noalias nocapture sret(%"core::fmt::Arguments") dereferenceable(48) %_2, [0 x { [0 x i8]*, i64 }]* nonnull align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc3 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* nonnull align 8 bitcast (<{ [0 x i8] }>* @alloc5 to [0 x { i8*, i64* }]*), i64 0), !dbg !313
  br label %bb1, !dbg !313

bb1:                                              ; preds = %start
; call std::io::stdio::_print
  call void @_ZN3std2io5stdio6_print17hd9c9dbd31aa97d70E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48) %_2), !dbg !313
  br label %bb2, !dbg !313

bb2:                                              ; preds = %bb1
  ret void, !dbg !314
}

; Function Attrs: nonlazybind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*) unnamed_addr #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; std::rt::lang_start_internal
; Function Attrs: nonlazybind uwtable
declare i64 @_ZN3std2rt19lang_start_internal17hd15a47be08101c28E({}* nonnull align 1, [3 x i64]* align 8 dereferenceable(24), i64, i8**) unnamed_addr #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking5panic17h0ba7146865b2f9d6E([0 x i8]* nonnull align 1, i64, %"core::panic::location::Location"* align 8 dereferenceable(24)) unnamed_addr #4

; std::io::stdio::_print
; Function Attrs: nonlazybind uwtable
declare void @_ZN3std2io5stdio6_print17hd9c9dbd31aa97d70E(%"core::fmt::Arguments"* noalias nocapture dereferenceable(48)) unnamed_addr #1

; Function Attrs: nonlazybind
define i32 @main(i32 %0, i8** %1) unnamed_addr #5 {
top:
  %2 = load volatile i8, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__rustc_debug_gdb_scripts_section__, i32 0, i32 0), align 1
  %3 = sext i32 %0 to i64
; call std::rt::lang_start
  %4 = call i64 @_ZN3std2rt10lang_start17h95c4eabd28917cccE(void ()* @_ZN10helloworld4main17h2d296a82238a34ebE, i64 %3, i8** %1)
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

attributes #0 = { noinline nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #1 = { nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #2 = { inlinehint nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="__rust_probestack" "target-cpu"="x86-64" }
attributes #5 = { nonlazybind "target-cpu"="x86-64" }
attributes #6 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.dbg.cu = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "<std::rt::lang_start::{closure#0} as core::ops::function::Fn<()>>::{vtable}", scope: null, file: !2, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "<unknown>", directory: "")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, align: 64, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const ()", baseType: !5, size: 64, align: 64, dwarfAddressSpace: 0)
!5 = !DIBasicType(name: "()", encoding: DW_ATE_unsigned)
!6 = !{!7}
!7 = !DISubrange(count: 6, lowerBound: 0)
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"PIE Level", i32 2}
!10 = !{i32 2, !"RtLibUseGOT", i32 1}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = distinct !DICompileUnit(language: DW_LANG_Rust, file: !13, producer: "clang LLVM (rustc version 1.57.0 (f1edd0429 2021-11-29))", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, globals: !31)
!13 = !DIFile(filename: "src/main.rs", directory: "/home/carlosterberg/helloworld")
!14 = !{!15, !26}
!15 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Alignment", scope: !16, file: !2, baseType: !20, size: 8, align: 8, flags: DIFlagEnumClass, elements: !21)
!16 = !DINamespace(name: "v1", scope: !17)
!17 = !DINamespace(name: "rt", scope: !18)
!18 = !DINamespace(name: "fmt", scope: !19)
!19 = !DINamespace(name: "core", scope: null)
!20 = !DIBasicType(name: "u8", size: 8, encoding: DW_ATE_unsigned)
!21 = !{!22, !23, !24, !25}
!22 = !DIEnumerator(name: "Left", value: 0)
!23 = !DIEnumerator(name: "Right", value: 1)
!24 = !DIEnumerator(name: "Center", value: 2)
!25 = !DIEnumerator(name: "Unknown", value: 3)
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Result", scope: !27, file: !2, baseType: !20, size: 8, align: 8, flags: DIFlagEnumClass, elements: !28)
!27 = !DINamespace(name: "result", scope: !19)
!28 = !{!29, !30}
!29 = !DIEnumerator(name: "Ok", value: 0)
!30 = !DIEnumerator(name: "Err", value: 1)
!31 = !{!0}
!32 = distinct !DISubprogram(name: "__rust_begin_short_backtrace<fn(), ()>", linkageName: "_ZN3std10sys_common9backtrace28__rust_begin_short_backtrace17he77a0b057f9961a7E", scope: !34, file: !33, line: 119, type: !37, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !46, retainedNodes: !42)
!33 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys_common/backtrace.rs", directory: "", checksumkind: CSK_MD5, checksum: "6a433c65ecb3674065f414f3ec71fc02")
!34 = !DINamespace(name: "backtrace", scope: !35)
!35 = !DINamespace(name: "sys_common", scope: !36)
!36 = !DINamespace(name: "std", scope: null)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "fn()", baseType: !40, size: 64, align: 64, dwarfAddressSpace: 0)
!40 = !DISubroutineType(types: !41)
!41 = !{null}
!42 = !{!43, !44}
!43 = !DILocalVariable(name: "f", arg: 1, scope: !32, file: !33, line: 119, type: !39)
!44 = !DILocalVariable(name: "result", scope: !45, file: !33, line: 123, type: !5, align: 1)
!45 = distinct !DILexicalBlock(scope: !32, file: !33, line: 123, column: 5)
!46 = !{!47, !48}
!47 = !DITemplateTypeParameter(name: "F", type: !39)
!48 = !DITemplateTypeParameter(name: "T", type: !5)
!49 = !DILocation(line: 123, column: 9, scope: !45)
!50 = !DILocation(line: 119, column: 43, scope: !32)
!51 = !DILocation(line: 123, column: 18, scope: !32)
!52 = !DILocation(line: 126, column: 5, scope: !45)
!53 = !DILocation(line: 129, column: 2, scope: !32)
!54 = !DILocation(line: 129, column: 1, scope: !32)
!55 = !DILocation(line: 119, column: 1, scope: !32)
!56 = distinct !DISubprogram(name: "lang_start<()>", linkageName: "_ZN3std2rt10lang_start17h95c4eabd28917cccE", scope: !58, file: !57, line: 140, type: !59, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !70, retainedNodes: !64)
!57 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/rt.rs", directory: "", checksumkind: CSK_MD5, checksum: "3344817d984839ceeae3ee45e439b0f7")
!58 = !DINamespace(name: "rt", scope: !36)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !39, !61, !62}
!61 = !DIBasicType(name: "isize", size: 64, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const *const u8", baseType: !63, size: 64, align: 64, dwarfAddressSpace: 0)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const u8", baseType: !20, size: 64, align: 64, dwarfAddressSpace: 0)
!64 = !{!65, !66, !67, !68}
!65 = !DILocalVariable(name: "main", arg: 1, scope: !56, file: !57, line: 141, type: !39)
!66 = !DILocalVariable(name: "argc", arg: 2, scope: !56, file: !57, line: 142, type: !61)
!67 = !DILocalVariable(name: "argv", arg: 3, scope: !56, file: !57, line: 143, type: !62)
!68 = !DILocalVariable(name: "v", scope: !69, file: !57, line: 145, type: !61, align: 8)
!69 = distinct !DILexicalBlock(scope: !56, file: !57, line: 145, column: 5)
!70 = !{!48}
!71 = !DILocation(line: 141, column: 5, scope: !56)
!72 = !DILocation(line: 142, column: 5, scope: !56)
!73 = !DILocation(line: 143, column: 5, scope: !56)
!74 = !DILocation(line: 146, column: 10, scope: !56)
!75 = !DILocation(line: 146, column: 9, scope: !56)
!76 = !DILocation(line: 145, column: 17, scope: !56)
!77 = !DILocation(line: 145, column: 12, scope: !56)
!78 = !DILocation(line: 145, column: 12, scope: !69)
!79 = !DILocation(line: 151, column: 2, scope: !56)
!80 = distinct !DISubprogram(name: "{closure#0}<()>", linkageName: "_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17haf3fc2bcbbcd6de5E", scope: !81, file: !57, line: 146, type: !82, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !70, retainedNodes: !90)
!81 = !DINamespace(name: "lang_start", scope: !58)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !85}
!84 = !DIBasicType(name: "i32", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "&{closure#0}", baseType: !86, size: 64, align: 64, dwarfAddressSpace: 0)
!86 = !DICompositeType(tag: DW_TAG_structure_type, name: "{closure#0}", scope: !81, file: !2, size: 64, align: 64, elements: !87, templateParams: !89, identifier: "1330994e0371cc0f4656eff82c025d81")
!87 = !{!88}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "main", scope: !86, file: !2, baseType: !39, size: 64, align: 64)
!89 = !{}
!90 = !{!91}
!91 = !DILocalVariable(name: "main", scope: !80, file: !57, line: 141, type: !39, align: 8)
!92 = !DILocation(line: 141, column: 5, scope: !80)
!93 = !DILocation(line: 146, column: 77, scope: !80)
!94 = !DILocation(line: 146, column: 18, scope: !80)
!95 = !DILocation(line: 146, column: 91, scope: !80)
!96 = distinct !DISubprogram(name: "as_i32", linkageName: "_ZN3std3sys4unix7process14process_common8ExitCode6as_i3217hb58bd3de589f5a9bE", scope: !98, file: !97, line: 474, type: !105, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !89, retainedNodes: !108)
!97 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/sys/unix/process/process_common.rs", directory: "", checksumkind: CSK_MD5, checksum: "cfab9a537a845e5d2a97a9ac6ebb2d63")
!98 = !DICompositeType(tag: DW_TAG_structure_type, name: "ExitCode", scope: !99, file: !2, size: 8, align: 8, elements: !103, templateParams: !89, identifier: "b09e20bc84f4e3025c0a6f5ebe00c57d")
!99 = !DINamespace(name: "process_common", scope: !100)
!100 = !DINamespace(name: "process", scope: !101)
!101 = !DINamespace(name: "unix", scope: !102)
!102 = !DINamespace(name: "sys", scope: !36)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !98, file: !2, baseType: !20, size: 8, align: 8)
!105 = !DISubroutineType(types: !106)
!106 = !{!84, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "&ExitCode", baseType: !98, size: 64, align: 64, dwarfAddressSpace: 0)
!108 = !{!109}
!109 = !DILocalVariable(name: "self", arg: 1, scope: !96, file: !97, line: 474, type: !107)
!110 = !DILocation(line: 474, column: 19, scope: !96)
!111 = !DILocation(line: 475, column: 9, scope: !96)
!112 = !DILocation(line: 476, column: 6, scope: !96)
!113 = distinct !DISubprogram(name: "new_v1", linkageName: "_ZN4core3fmt9Arguments6new_v117h3c95ffd7d6febbd6E", scope: !115, file: !114, line: 361, type: !222, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !89, retainedNodes: !224)
!114 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/fmt/mod.rs", directory: "", checksumkind: CSK_MD5, checksum: "8e7ebdafdaa535d03fe8490be5d0b5ea")
!115 = !DICompositeType(tag: DW_TAG_structure_type, name: "Arguments", scope: !18, file: !2, size: 384, align: 64, elements: !116, templateParams: !89, identifier: "a360e155a516935c2edb707fb484e50b")
!116 = !{!117, !128, !177}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "pieces", scope: !115, file: !2, baseType: !118, size: 128, align: 64)
!118 = !DICompositeType(tag: DW_TAG_structure_type, name: "&[&str]", file: !2, size: 128, align: 64, elements: !119, templateParams: !89, identifier: "e5181a2ba73cefd2b9372dc5646453a9")
!119 = !{!120, !127}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "data_ptr", scope: !118, file: !2, baseType: !121, size: 64, align: 64)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const &str", baseType: !122, size: 64, align: 64, dwarfAddressSpace: 0)
!122 = !DICompositeType(tag: DW_TAG_structure_type, name: "&str", file: !2, size: 128, align: 64, elements: !123, templateParams: !89, identifier: "7ef2a91eecc7bcf4b4aaea2dbce79437")
!123 = !{!124, !125}
!124 = !DIDerivedType(tag: DW_TAG_member, name: "data_ptr", scope: !122, file: !2, baseType: !63, size: 64, align: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !122, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!126 = !DIBasicType(name: "usize", size: 64, encoding: DW_ATE_unsigned)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !118, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "fmt", scope: !115, file: !2, baseType: !129, size: 128, align: 64, offset: 128)
!129 = !DICompositeType(tag: DW_TAG_structure_type, name: "Option<&[core::fmt::rt::v1::Argument]>", scope: !130, file: !2, size: 128, align: 64, elements: !131, identifier: "5f76414d3968d7081799a90ac22875bd")
!130 = !DINamespace(name: "option", scope: !19)
!131 = !{!132}
!132 = !DICompositeType(tag: DW_TAG_variant_part, scope: !130, file: !2, size: 128, align: 64, elements: !133, templateParams: !136, identifier: "5f76414d3968d7081799a90ac22875bd_variant_part", discriminator: !176)
!133 = !{!134, !172}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "None", scope: !132, file: !2, baseType: !135, size: 128, align: 64, extraData: i64 0)
!135 = !DICompositeType(tag: DW_TAG_structure_type, name: "None", scope: !129, file: !2, size: 128, align: 64, elements: !89, templateParams: !136, identifier: "5f76414d3968d7081799a90ac22875bd::None")
!136 = !{!137}
!137 = !DITemplateTypeParameter(name: "T", type: !138)
!138 = !DICompositeType(tag: DW_TAG_structure_type, name: "&[core::fmt::rt::v1::Argument]", file: !2, size: 128, align: 64, elements: !139, templateParams: !89, identifier: "add0e6342cb63c6fd291c94d3505b91c")
!139 = !{!140, !171}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "data_ptr", scope: !138, file: !2, baseType: !141, size: 64, align: 64)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const Argument", baseType: !142, size: 64, align: 64, dwarfAddressSpace: 0)
!142 = !DICompositeType(tag: DW_TAG_structure_type, name: "Argument", scope: !16, file: !2, size: 448, align: 64, elements: !143, templateParams: !89, identifier: "763ee80a35beebf8b514d3c418f0e312")
!143 = !{!144, !145}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "position", scope: !142, file: !2, baseType: !126, size: 64, align: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "format", scope: !142, file: !2, baseType: !146, size: 384, align: 64, offset: 64)
!146 = !DICompositeType(tag: DW_TAG_structure_type, name: "FormatSpec", scope: !16, file: !2, size: 384, align: 64, elements: !147, templateParams: !89, identifier: "bc399e583737a2b0aabdd4d017584f65")
!147 = !{!148, !150, !151, !153, !170}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "fill", scope: !146, file: !2, baseType: !149, size: 32, align: 32, offset: 256)
!149 = !DIBasicType(name: "char", size: 32, encoding: DW_ATE_unsigned_char)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "align", scope: !146, file: !2, baseType: !15, size: 8, align: 8, offset: 320)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !146, file: !2, baseType: !152, size: 32, align: 32, offset: 288)
!152 = !DIBasicType(name: "u32", size: 32, encoding: DW_ATE_unsigned)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "precision", scope: !146, file: !2, baseType: !154, size: 128, align: 64)
!154 = !DICompositeType(tag: DW_TAG_structure_type, name: "Count", scope: !16, file: !2, size: 128, align: 64, elements: !155, identifier: "38eba57020d20ab810366aace8807a13")
!155 = !{!156}
!156 = !DICompositeType(tag: DW_TAG_variant_part, scope: !16, file: !2, size: 128, align: 64, elements: !157, templateParams: !89, identifier: "38eba57020d20ab810366aace8807a13_variant_part", discriminator: !168)
!157 = !{!158, !162, !166}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "Is", scope: !156, file: !2, baseType: !159, size: 128, align: 64, extraData: i64 0)
!159 = !DICompositeType(tag: DW_TAG_structure_type, name: "Is", scope: !154, file: !2, size: 128, align: 64, elements: !160, templateParams: !89, identifier: "38eba57020d20ab810366aace8807a13::Is")
!160 = !{!161}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !159, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "Param", scope: !156, file: !2, baseType: !163, size: 128, align: 64, extraData: i64 1)
!163 = !DICompositeType(tag: DW_TAG_structure_type, name: "Param", scope: !154, file: !2, size: 128, align: 64, elements: !164, templateParams: !89, identifier: "38eba57020d20ab810366aace8807a13::Param")
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !163, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "Implied", scope: !156, file: !2, baseType: !167, size: 128, align: 64, extraData: i64 2)
!167 = !DICompositeType(tag: DW_TAG_structure_type, name: "Implied", scope: !154, file: !2, size: 128, align: 64, elements: !89, templateParams: !89, identifier: "38eba57020d20ab810366aace8807a13::Implied")
!168 = !DIDerivedType(tag: DW_TAG_member, scope: !16, file: !2, baseType: !169, size: 64, align: 64, flags: DIFlagArtificial)
!169 = !DIBasicType(name: "u64", size: 64, encoding: DW_ATE_unsigned)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !146, file: !2, baseType: !154, size: 128, align: 64, offset: 128)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !138, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "Some", scope: !132, file: !2, baseType: !173, size: 128, align: 64)
!173 = !DICompositeType(tag: DW_TAG_structure_type, name: "Some", scope: !129, file: !2, size: 128, align: 64, elements: !174, templateParams: !136, identifier: "5f76414d3968d7081799a90ac22875bd::Some")
!174 = !{!175}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !173, file: !2, baseType: !138, size: 128, align: 64)
!176 = !DIDerivedType(tag: DW_TAG_member, scope: !130, file: !2, baseType: !169, size: 64, align: 64, flags: DIFlagArtificial)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "args", scope: !115, file: !2, baseType: !178, size: 128, align: 64, offset: 256)
!178 = !DICompositeType(tag: DW_TAG_structure_type, name: "&[core::fmt::ArgumentV1]", file: !2, size: 128, align: 64, elements: !179, templateParams: !89, identifier: "ad7c8b03f48c0dcf73f319360577f3d5")
!179 = !{!180, !221}
!180 = !DIDerivedType(tag: DW_TAG_member, name: "data_ptr", scope: !178, file: !2, baseType: !181, size: 64, align: 64)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*const ArgumentV1", baseType: !182, size: 64, align: 64, dwarfAddressSpace: 0)
!182 = !DICompositeType(tag: DW_TAG_structure_type, name: "ArgumentV1", scope: !18, file: !2, size: 128, align: 64, elements: !183, templateParams: !89, identifier: "c7ce43acbe4b6205b3d5abdc2e2d3e77")
!183 = !{!184, !187}
!184 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !182, file: !2, baseType: !185, size: 64, align: 64)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "&Opaque", baseType: !186, size: 64, align: 64, dwarfAddressSpace: 0)
!186 = !DICompositeType(tag: DW_TAG_structure_type, name: "Opaque", file: !2, align: 8, elements: !89, identifier: "db2cc22363e1d99b3a086e242402e769")
!187 = !DIDerivedType(tag: DW_TAG_member, name: "formatter", scope: !182, file: !2, baseType: !188, size: 64, align: 64, offset: 64)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "fn(&core::fmt::::Opaque, &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error>", baseType: !189, size: 64, align: 64, dwarfAddressSpace: 0)
!189 = !DISubroutineType(types: !190)
!190 = !{!26, !185, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "&mut Formatter", baseType: !192, size: 64, align: 64, dwarfAddressSpace: 0)
!192 = !DICompositeType(tag: DW_TAG_structure_type, name: "Formatter", scope: !18, file: !2, size: 512, align: 64, elements: !193, templateParams: !89, identifier: "90d9c21992f1292241ad45c3955c5499")
!193 = !{!194, !195, !196, !197, !210, !211}
!194 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !192, file: !2, baseType: !152, size: 32, align: 32, offset: 384)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "fill", scope: !192, file: !2, baseType: !149, size: 32, align: 32, offset: 416)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "align", scope: !192, file: !2, baseType: !15, size: 8, align: 8, offset: 448)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !192, file: !2, baseType: !198, size: 128, align: 64)
!198 = !DICompositeType(tag: DW_TAG_structure_type, name: "Option<usize>", scope: !130, file: !2, size: 128, align: 64, elements: !199, identifier: "4b805254fa2ee3ca2df3072d2fabafc2")
!199 = !{!200}
!200 = !DICompositeType(tag: DW_TAG_variant_part, scope: !130, file: !2, size: 128, align: 64, elements: !201, templateParams: !204, identifier: "4b805254fa2ee3ca2df3072d2fabafc2_variant_part", discriminator: !176)
!201 = !{!202, !206}
!202 = !DIDerivedType(tag: DW_TAG_member, name: "None", scope: !200, file: !2, baseType: !203, size: 128, align: 64, extraData: i64 0)
!203 = !DICompositeType(tag: DW_TAG_structure_type, name: "None", scope: !198, file: !2, size: 128, align: 64, elements: !89, templateParams: !204, identifier: "4b805254fa2ee3ca2df3072d2fabafc2::None")
!204 = !{!205}
!205 = !DITemplateTypeParameter(name: "T", type: !126)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "Some", scope: !200, file: !2, baseType: !207, size: 128, align: 64, extraData: i64 1)
!207 = !DICompositeType(tag: DW_TAG_structure_type, name: "Some", scope: !198, file: !2, size: 128, align: 64, elements: !208, templateParams: !204, identifier: "4b805254fa2ee3ca2df3072d2fabafc2::Some")
!208 = !{!209}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !207, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "precision", scope: !192, file: !2, baseType: !198, size: 128, align: 64, offset: 128)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !192, file: !2, baseType: !212, size: 128, align: 64, offset: 256)
!212 = !DICompositeType(tag: DW_TAG_structure_type, name: "&mut dyn core::fmt::Write", file: !2, size: 128, align: 64, elements: !213, templateParams: !89, identifier: "9405b243a0f4184842c4793de8cc6f20")
!213 = !{!214, !216}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "pointer", scope: !212, file: !2, baseType: !215, size: 64, align: 64, flags: DIFlagArtificial)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*mut u8", baseType: !20, size: 64, align: 64, dwarfAddressSpace: 0)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "vtable", scope: !212, file: !2, baseType: !217, size: 64, align: 64, offset: 64, flags: DIFlagArtificial)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "&[usize; 3]", baseType: !218, size: 64, align: 64, dwarfAddressSpace: 0)
!218 = !DICompositeType(tag: DW_TAG_array_type, baseType: !126, size: 192, align: 64, elements: !219)
!219 = !{!220}
!220 = !DISubrange(count: 3, lowerBound: 0)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !178, file: !2, baseType: !126, size: 64, align: 64, offset: 64)
!222 = !DISubroutineType(types: !223)
!223 = !{!115, !118, !178}
!224 = !{!225, !226}
!225 = !DILocalVariable(name: "pieces", arg: 1, scope: !113, file: !114, line: 361, type: !118)
!226 = !DILocalVariable(name: "args", arg: 2, scope: !113, file: !114, line: 361, type: !178)
!227 = !DILocation(line: 361, column: 25, scope: !113)
!228 = !DILocation(line: 361, column: 53, scope: !113)
!229 = !DILocation(line: 362, column: 12, scope: !113)
!230 = !DILocation(line: 362, column: 56, scope: !113)
!231 = !DILocation(line: 362, column: 41, scope: !113)
!232 = !{i8 0, i8 2}
!233 = !DILocation(line: 365, column: 34, scope: !113)
!234 = !DILocation(line: 365, column: 9, scope: !113)
!235 = !DILocation(line: 366, column: 6, scope: !113)
!236 = !DILocation(line: 363, column: 13, scope: !113)
!237 = distinct !DISubprogram(name: "call_once<std::rt::lang_start::{closure#0}, ()>", linkageName: "_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h05d87b071da08e66E", scope: !239, file: !238, line: 227, type: !242, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !248, retainedNodes: !245)
!238 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ops/function.rs", directory: "", checksumkind: CSK_MD5, checksum: "1a40c014f8a7b8b7cd612b461a47e902")
!239 = !DINamespace(name: "FnOnce", scope: !240)
!240 = !DINamespace(name: "function", scope: !241)
!241 = !DINamespace(name: "ops", scope: !19)
!242 = !DISubroutineType(types: !243)
!243 = !{!84, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "*mut {closure#0}", baseType: !86, size: 64, align: 64, dwarfAddressSpace: 0)
!245 = !{!246, !247}
!246 = !DILocalVariable(arg: 1, scope: !237, file: !238, line: 227, type: !244)
!247 = !DILocalVariable(arg: 2, scope: !237, file: !238, line: 227, type: !5)
!248 = !{!249, !250}
!249 = !DITemplateTypeParameter(name: "Self", type: !86)
!250 = !DITemplateTypeParameter(name: "Args", type: !5)
!251 = !DILocation(line: 227, column: 5, scope: !237)
!252 = distinct !DISubprogram(name: "call_once<std::rt::lang_start::{closure#0}, ()>", linkageName: "_ZN4core3ops8function6FnOnce9call_once17hcc7f309ae1cc237bE", scope: !239, file: !238, line: 227, type: !253, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !248, retainedNodes: !255)
!253 = !DISubroutineType(types: !254)
!254 = !{!84, !86}
!255 = !{!256, !257}
!256 = !DILocalVariable(arg: 1, scope: !252, file: !238, line: 227, type: !86)
!257 = !DILocalVariable(arg: 2, scope: !252, file: !238, line: 227, type: !5)
!258 = !DILocation(line: 227, column: 5, scope: !252)
!259 = distinct !DISubprogram(name: "call_once<fn(), ()>", linkageName: "_ZN4core3ops8function6FnOnce9call_once17he2ef528cca5ba070E", scope: !239, file: !238, line: 227, type: !37, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !263, retainedNodes: !260)
!260 = !{!261, !262}
!261 = !DILocalVariable(arg: 1, scope: !259, file: !238, line: 227, type: !39)
!262 = !DILocalVariable(arg: 2, scope: !259, file: !238, line: 227, type: !5)
!263 = !{!264, !250}
!264 = !DITemplateTypeParameter(name: "Self", type: !39)
!265 = !DILocation(line: 227, column: 5, scope: !259)
!266 = distinct !DISubprogram(name: "drop_in_place<std::rt::lang_start::{closure#0}>", linkageName: "_ZN4core3ptr85drop_in_place$LT$std..rt..lang_start$LT$$LP$$RP$$GT$..$u7b$$u7b$closure$u7d$$u7d$$GT$17h915f7ee027681576E", scope: !268, file: !267, line: 188, type: !269, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !273, retainedNodes: !271)
!267 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/ptr/mod.rs", directory: "", checksumkind: CSK_MD5, checksum: "207736266ff0d04d675044b37a0a2de6")
!268 = !DINamespace(name: "ptr", scope: !19)
!269 = !DISubroutineType(types: !270)
!270 = !{null, !244}
!271 = !{!272}
!272 = !DILocalVariable(arg: 1, scope: !266, file: !267, line: 188, type: !244)
!273 = !{!274}
!274 = !DITemplateTypeParameter(name: "T", type: !86)
!275 = !DILocation(line: 188, column: 1, scope: !266)
!276 = distinct !DISubprogram(name: "black_box<()>", linkageName: "_ZN4core4hint9black_box17hecf72d9b21525f67E", scope: !278, file: !277, line: 157, type: !279, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !70, retainedNodes: !281)
!277 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/core/src/hint.rs", directory: "", checksumkind: CSK_MD5, checksum: "353ba7433a0379654c9fa1a930951b37")
!278 = !DINamespace(name: "hint", scope: !19)
!279 = !DISubroutineType(types: !280)
!280 = !{null, !5}
!281 = !{!282}
!282 = !DILocalVariable(name: "dummy", arg: 1, scope: !276, file: !277, line: 157, type: !5)
!283 = !DILocation(line: 157, column: 21, scope: !276)
!284 = !DILocation(line: 158, column: 5, scope: !276)
!285 = !{i32 3165991}
!286 = !DILocation(line: 159, column: 2, scope: !276)
!287 = distinct !DISubprogram(name: "report", linkageName: "_ZN54_$LT$$LP$$RP$$u20$as$u20$std..process..Termination$GT$6report17hd572dd8d4d8f64c3E", scope: !289, file: !288, line: 2019, type: !291, scopeLine: 2019, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !89, retainedNodes: !293)
!288 = !DIFile(filename: "/rustc/f1edd0429582dd29cccacaf50fd134b05593bd9c/library/std/src/process.rs", directory: "", checksumkind: CSK_MD5, checksum: "f1040f95df6eac9bb0d3ca98d8a7ea2c")
!289 = !DINamespace(name: "{impl#48}", scope: !290)
!290 = !DINamespace(name: "process", scope: !36)
!291 = !DISubroutineType(types: !292)
!292 = !{!84, !5}
!293 = !{!294}
!294 = !DILocalVariable(name: "self", arg: 1, scope: !287, file: !288, line: 2019, type: !5)
!295 = !DILocation(line: 2019, column: 15, scope: !287)
!296 = !DILocation(line: 2020, column: 9, scope: !287)
!297 = !DILocation(line: 2021, column: 6, scope: !287)
!298 = distinct !DISubprogram(name: "report", linkageName: "_ZN68_$LT$std..process..ExitCode$u20$as$u20$std..process..Termination$GT$6report17h754f37281d48e2e3E", scope: !299, file: !288, line: 2053, type: !300, scopeLine: 2053, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !12, templateParams: !89, retainedNodes: !305)
!299 = !DINamespace(name: "{impl#52}", scope: !290)
!300 = !DISubroutineType(types: !301)
!301 = !{!84, !302}
!302 = !DICompositeType(tag: DW_TAG_structure_type, name: "ExitCode", scope: !290, file: !2, size: 8, align: 8, elements: !303, templateParams: !89, identifier: "1e0d389f78d9695d6933c9dd2e139dcf")
!303 = !{!304}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "__0", scope: !302, file: !2, baseType: !98, size: 8, align: 8)
!305 = !{!306}
!306 = !DILocalVariable(name: "self", arg: 1, scope: !298, file: !288, line: 2053, type: !302)
!307 = !DILocation(line: 2053, column: 15, scope: !298)
!308 = !DILocation(line: 2054, column: 9, scope: !298)
!309 = !DILocation(line: 2055, column: 6, scope: !298)
!310 = distinct !DISubprogram(name: "main", linkageName: "_ZN10helloworld4main17h2d296a82238a34ebE", scope: !312, file: !311, line: 1, type: !40, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagMainSubprogram, unit: !12, templateParams: !89, retainedNodes: !89)
!311 = !DIFile(filename: "src/main.rs", directory: "/home/carlosterberg/helloworld", checksumkind: CSK_MD5, checksum: "b64abcb167a8b9dd4f282813c31ad0da")
!312 = !DINamespace(name: "helloworld", scope: null)
!313 = !DILocation(line: 2, column: 5, scope: !310)
!314 = !DILocation(line: 3, column: 2, scope: !310)



; ModuleID = 'Regexp.bc'
source_filename = "Regexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"re\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: nofree noinline nosync nounwind readonly uwtable
define internal fastcc void @match(i8* nocapture readonly %0) unnamed_addr #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), metadata !17, metadata !DIExpression()), !dbg !16
  %2 = load i8, i8* %0, align 1, !dbg !18
  %3 = icmp eq i8 %2, 94, !dbg !20
  br i1 %3, label %.customlabel0, label %.preheader, !dbg !21

.customlabel0:                                               ; preds = %1
  %4 = getelementptr inbounds i8, i8* %0, i64 1, !dbg !22
  %5 = tail call fastcc i32 @matchhere(i8* nonnull %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)), !dbg !23
  br label %.loopexit, !dbg !24

.preheader:                                       ; preds = %1, %.customlabel1
  %.01 = phi i8* [ %7, %.customlabel1 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), %1 ]
  call void @llvm.dbg.value(metadata i8* %.01, metadata !17, metadata !DIExpression()), !dbg !16
  %6 = tail call fastcc i32 @matchhere(i8* nonnull %0, i8* %.01), !dbg !25
  %.not = icmp eq i32 %6, 0, !dbg !25
  br i1 %.not, label %.customlabel1, label %.loopexit, !dbg !28

.customlabel1:                                               ; preds = %.preheader
  %7 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !29
  call void @llvm.dbg.value(metadata i8* %7, metadata !17, metadata !DIExpression()), !dbg !16
  %8 = load i8, i8* %.01, align 1, !dbg !30
  %.not2 = icmp eq i8 %8, 0, !dbg !31
  br i1 %.not2, label %.loopexit, label %.preheader, !dbg !32, !llvm.loop !33

.loopexit:                                        ; preds = %.customlabel1, %.preheader, %.customlabel0
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree noinline nosync nounwind readonly uwtable
define internal fastcc i32 @matchhere(i8* nocapture readonly %0, i8* nocapture readonly %1) unnamed_addr #0 !dbg !38 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i8* %1, metadata !41, metadata !DIExpression()), !dbg !40
  %3 = load i8, i8* %0, align 1, !dbg !42
  %4 = icmp eq i8 %3, 0, !dbg !44
  br i1 %4, label %.loopexit, label %.lr.ph, !dbg !45

.lr.ph:                                           ; preds = %2, %.customlabel4
  %5 = phi i8 [ %7, %.customlabel4 ], [ %3, %2 ]
  %.tr17 = phi i8* [ %21, %.customlabel4 ], [ %1, %2 ]
  %.tr6 = phi i8* [ %6, %.customlabel4 ], [ %0, %2 ]
  call void @llvm.dbg.value(metadata i8* %.tr17, metadata !41, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i8* %.tr6, metadata !39, metadata !DIExpression()), !dbg !40
  %6 = getelementptr inbounds i8, i8* %.tr6, i64 1, !dbg !46
  %7 = load i8, i8* %6, align 1, !dbg !46
  %8 = icmp eq i8 %7, 42, !dbg !48
  br i1 %8, label %.customlabel0, label %.customlabel1, !dbg !49

.customlabel0:                                               ; preds = %.lr.ph
  %9 = load i8, i8* %.tr6, align 1, !dbg !50
  %10 = sext i8 %9 to i32, !dbg !50
  %11 = getelementptr inbounds i8, i8* %.tr6, i64 2, !dbg !51
  %12 = tail call fastcc i32 @matchstar(i32 %10, i8* nonnull %11, i8* %.tr17), !dbg !52
  br label %.loopexit, !dbg !53

.customlabel1:                                              ; preds = %.lr.ph
  %13 = icmp eq i8 %5, 36, !dbg !54
  %14 = icmp eq i8 %7, 0
  %or.cond = select i1 %13, i1 %14, i1 false, !dbg !56
  br i1 %or.cond, label %.customlabel2, label %.customlabel3, !dbg !56

.customlabel2:                                              ; preds = %.customlabel1
  %15 = load i8, i8* %.tr17, align 1, !dbg !57
  %16 = icmp eq i8 %15, 0, !dbg !58
  %17 = zext i1 %16 to i32, !dbg !58
  br label %.loopexit, !dbg !59

.customlabel3:                                              ; preds = %.customlabel1
  %18 = load i8, i8* %.tr17, align 1, !dbg !60
  %.not = icmp eq i8 %18, 0, !dbg !62
  br i1 %.not, label %.loopexit, label %.customlabel4, !dbg !63

.customlabel4:                                              ; preds = %.customlabel3
  %19 = icmp ne i8 %5, 46, !dbg !64
  %20 = icmp ne i8 %5, %18
  %or.cond18 = select i1 %19, i1 %20, i1 false, !dbg !65
  %21 = getelementptr inbounds i8, i8* %.tr17, i64 1
  %or.cond20 = select i1 %or.cond18, i1 true, i1 %14, !dbg !65
  call void @llvm.dbg.value(metadata i8* %6, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i8* %21, metadata !41, metadata !DIExpression()), !dbg !40
  br i1 %or.cond20, label %.loopexit, label %.lr.ph, !dbg !65

.loopexit:                                        ; preds = %.customlabel4, %.customlabel3, %2, %.customlabel2, %.customlabel0
  %.0 = phi i32 [ %12, %.customlabel0 ], [ %17, %.customlabel2 ], [ 0, %2 ], [ 0, %.customlabel3 ], [ 0, %.customlabel4 ], !dbg !40
  ret i32 %.0, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 !dbg !67 {
  %1 = alloca [7 x i8], align 1
  call void @llvm.dbg.declare(metadata [7 x i8]* %1, metadata !70, metadata !DIExpression()), !dbg !74
  %2 = getelementptr inbounds [7 x i8], [7 x i8]* %1, i64 0, i64 0, !dbg !75
  call void @klee_make_symbolic(i8* nonnull %2, i64 7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)) #4, !dbg !76
  call fastcc void @match(i8* nonnull %2), !dbg !77
  ret i32 0, !dbg !78
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) local_unnamed_addr #3

; Function Attrs: nofree noinline nosync nounwind readonly uwtable
define internal fastcc i32 @matchstar(i32 %0, i8* nocapture readonly %1, i8* nocapture readonly %2) unnamed_addr #0 !dbg !79 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.value(metadata i8* %1, metadata !84, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.value(metadata i8* %2, metadata !85, metadata !DIExpression()), !dbg !83
  %4 = icmp eq i32 %0, 46
  br i1 %4, label %.split.us, label %..split_crit_edge, !dbg !86

.split.us:                                        ; preds = %3, %.customlabel1
  %.01.us = phi i8* [ %7, %.customlabel1 ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.01.us, metadata !85, metadata !DIExpression()), !dbg !83
  %5 = tail call fastcc i32 @matchhere(i8* %1, i8* %.01.us), !dbg !87
  %.not.us = icmp eq i32 %5, 0, !dbg !87
  br i1 %.not.us, label %.customlabel0, label %.critedge, !dbg !90

.customlabel0:                                               ; preds = %.split.us
  %6 = load i8, i8* %.01.us, align 1, !dbg !91
  %.not2.us = icmp eq i8 %6, 0, !dbg !92
  br i1 %.not2.us, label %.critedge, label %.customlabel1, !dbg !93

.customlabel1:                                               ; preds = %.customlabel0
  %7 = getelementptr inbounds i8, i8* %.01.us, i64 1, !dbg !94
  call void @llvm.dbg.value(metadata i8* %7, metadata !85, metadata !DIExpression()), !dbg !83
  br label %.split.us, !dbg !95, !llvm.loop !96

..split_crit_edge:                                ; preds = %3, %.customlabel3
  %.01 = phi i8* [ %10, %.customlabel3 ], [ %2, %3 ]
  call void @llvm.dbg.value(metadata i8* %.01, metadata !85, metadata !DIExpression()), !dbg !83
  %8 = tail call fastcc i32 @matchhere(i8* %1, i8* %.01), !dbg !87
  %.not = icmp eq i32 %8, 0, !dbg !87
  br i1 %.not, label %.customlabel2, label %.critedge, !dbg !90

.customlabel2:                                              ; preds = %..split_crit_edge
  %9 = load i8, i8* %.01, align 1, !dbg !91
  %.not2 = icmp eq i8 %9, 0, !dbg !92
  br i1 %.not2, label %.critedge, label %.customlabel3, !dbg !93

.customlabel3:                                              ; preds = %.customlabel2
  %10 = getelementptr inbounds i8, i8* %.01, i64 1, !dbg !94
  call void @llvm.dbg.value(metadata i8* %10, metadata !85, metadata !DIExpression()), !dbg !83
  %11 = sext i8 %9 to i32, !dbg !98
  %12 = icmp eq i32 %11, %0, !dbg !99
  br i1 %12, label %..split_crit_edge, label %.critedge, !dbg !95, !llvm.loop !96

.critedge:                                        ; preds = %.customlabel3, %.customlabel2, %..split_crit_edge, %.split.us, %.customlabel0
  %.0 = phi i32 [ 0, %.customlabel0 ], [ 1, %.split.us ], [ 1, %..split_crit_edge ], [ 0, %.customlabel2 ], [ 0, %.customlabel3 ], !dbg !83
  ret i32 %.0, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nofree noinline nosync nounwind readonly uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Regexp.c", directory: "/home/isak/Documents/xj/klee-fork/klee/examples/regexp")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Ubuntu clang version 13.0.1-++20220115064402+fc043d8a256b-1~exp1~20220115064412.55"}
!9 = distinct !DISubprogram(name: "match", scope: !1, file: !1, line: 34, type: !10, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "re", arg: 1, scope: !9, file: !1, line: 34, type: !13)
!16 = !DILocation(line: 0, scope: !9)
!17 = !DILocalVariable(name: "text", arg: 2, scope: !9, file: !1, line: 34, type: !13)
!18 = !DILocation(line: 35, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !1, line: 35, column: 7)
!20 = !DILocation(line: 35, column: 13, scope: !19)
!21 = !DILocation(line: 35, column: 7, scope: !9)
!22 = !DILocation(line: 36, column: 24, scope: !19)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocation(line: 36, column: 5, scope: !19)
!25 = !DILocation(line: 38, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 38, column: 9)
!27 = distinct !DILexicalBlock(scope: !9, file: !1, line: 37, column: 6)
!28 = !DILocation(line: 38, column: 9, scope: !27)
!29 = !DILocation(line: 40, column: 17, scope: !9)
!30 = !DILocation(line: 40, column: 12, scope: !9)
!31 = !DILocation(line: 40, column: 20, scope: !9)
!32 = !DILocation(line: 40, column: 3, scope: !27)
!33 = distinct !{!33, !34, !35, !36}
!34 = !DILocation(line: 37, column: 3, scope: !9)
!35 = !DILocation(line: 40, column: 27, scope: !9)
!36 = !{!"llvm.loop.mustprogress"}
!37 = !DILocation(line: 42, column: 1, scope: !9)
!38 = distinct !DISubprogram(name: "matchhere", scope: !1, file: !1, line: 22, type: !10, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "re", arg: 1, scope: !38, file: !1, line: 22, type: !13)
!40 = !DILocation(line: 0, scope: !38)
!41 = !DILocalVariable(name: "text", arg: 2, scope: !38, file: !1, line: 22, type: !13)
!42 = !DILocation(line: 23, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !1, line: 23, column: 7)
!44 = !DILocation(line: 23, column: 13, scope: !43)
!45 = !DILocation(line: 23, column: 7, scope: !38)
!46 = !DILocation(line: 25, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !1, line: 25, column: 7)
!48 = !DILocation(line: 25, column: 13, scope: !47)
!49 = !DILocation(line: 25, column: 7, scope: !38)
!50 = !DILocation(line: 26, column: 22, scope: !47)
!51 = !DILocation(line: 26, column: 31, scope: !47)
!52 = !DILocation(line: 26, column: 12, scope: !47)
!53 = !DILocation(line: 26, column: 5, scope: !47)
!54 = !DILocation(line: 27, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !38, file: !1, line: 27, column: 7)
!56 = !DILocation(line: 27, column: 20, scope: !55)
!57 = !DILocation(line: 28, column: 12, scope: !55)
!58 = !DILocation(line: 28, column: 18, scope: !55)
!59 = !DILocation(line: 28, column: 5, scope: !55)
!60 = !DILocation(line: 29, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !38, file: !1, line: 29, column: 7)
!62 = !DILocation(line: 29, column: 12, scope: !61)
!63 = !DILocation(line: 29, column: 19, scope: !61)
!64 = !DILocation(line: 29, column: 28, scope: !61)
!65 = !DILocation(line: 29, column: 34, scope: !61)
!66 = !DILocation(line: 32, column: 1, scope: !38)
!67 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 51, type: !68, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!12}
!70 = !DILocalVariable(name: "re", scope: !67, file: !1, line: 53, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 56, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 7)
!74 = !DILocation(line: 53, column: 8, scope: !67)
!75 = !DILocation(line: 56, column: 22, scope: !67)
!76 = !DILocation(line: 56, column: 3, scope: !67)
!77 = !DILocation(line: 59, column: 3, scope: !67)
!78 = !DILocation(line: 61, column: 3, scope: !67)
!79 = distinct !DISubprogram(name: "matchstar", scope: !1, file: !1, line: 14, type: !80, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!12, !12, !13, !13}
!82 = !DILocalVariable(name: "c", arg: 1, scope: !79, file: !1, line: 14, type: !12)
!83 = !DILocation(line: 0, scope: !79)
!84 = !DILocalVariable(name: "re", arg: 2, scope: !79, file: !1, line: 14, type: !13)
!85 = !DILocalVariable(name: "text", arg: 3, scope: !79, file: !1, line: 14, type: !13)
!86 = !DILocation(line: 15, column: 3, scope: !79)
!87 = !DILocation(line: 16, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 16, column: 9)
!89 = distinct !DILexicalBlock(scope: !79, file: !1, line: 15, column: 6)
!90 = !DILocation(line: 16, column: 9, scope: !89)
!91 = !DILocation(line: 18, column: 12, scope: !79)
!92 = !DILocation(line: 18, column: 18, scope: !79)
!93 = !DILocation(line: 18, column: 26, scope: !79)
!94 = !DILocation(line: 18, column: 35, scope: !79)
!95 = !DILocation(line: 18, column: 3, scope: !89)
!96 = distinct !{!96, !86, !97, !36}
!97 = !DILocation(line: 18, column: 54, scope: !79)
!98 = !DILocation(line: 18, column: 30, scope: !79)
!99 = !DILocation(line: 18, column: 38, scope: !79)
!100 = !DILocation(line: 20, column: 1, scope: !79)

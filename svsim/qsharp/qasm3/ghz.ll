; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%Qubit = type opaque
%qreg = type opaque
%Array = type opaque
%Result = type opaque

@frmt_spec___int_d_ = internal constant [4 x i8] c"%d\0A\00"
@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"
@n_qubits = private constant i64 4

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare i32 @printf(i8* %0, ...)

declare %Result* @__quantum__qis__mz(%Qubit* %0)

declare void @__quantum__qis__h(%Qubit* %0)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %1)

declare %Array* @__quantum__rt__qubit_allocate_array(i64 %0)

declare void @__quantum__rt__finalize()

declare void @__quantum__rt__set_config_parameter(i8* %0, i8* %1)

declare i32 @__quantum__rt__initialize(i32 %0, i8** %1)

define i32 @main(i32 %0, i8** %1) {
  call void @__quantum__rt__set_config_parameter(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu_value, i64 0, i64 0))
  %3 = call i32 @__quantum__rt__initialize(i32 %0, i8** %1)
  %4 = call i32 @__internal_mlir_ghz()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_ghz() {
  %1 = call %Array* @__quantum__rt__qubit_allocate_array(i64 4)
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  call void @__quantum__qis__h(%Qubit* %4)
  br label %5

5:                                                ; preds = %8, %0
  %6 = phi i64 [ 0, %0 ], [ %20, %8 ]
  %7 = icmp slt i64 %6, 3
  br i1 %7, label %8, label %21

8:                                                ; preds = %5
  %9 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 %6)
  %10 = bitcast i8* %9 to %Qubit**
  %11 = load %Qubit*, %Qubit** %10, align 8
  %12 = add i64 %6, 1
  %13 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 %12)
  %14 = bitcast i8* %13 to %Qubit**
  %15 = load %Qubit*, %Qubit** %14, align 8
  call void @__quantum__qis__cnot(%Qubit* %11, %Qubit* %15), !dbg !3
  %16 = insertvalue { %Qubit*, %Qubit* } undef, %Qubit* %11, 0
  %17 = insertvalue { %Qubit*, %Qubit* } %16, %Qubit* %15, 1
  %18 = extractvalue { %Qubit*, %Qubit* } %17, 0
  %19 = extractvalue { %Qubit*, %Qubit* } %17, 1
  %20 = add i64 %6, 1
  br label %5

21:                                               ; preds = %5
  %22 = alloca i1, i64 mul (i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i64 4), align 1
  %23 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %22, 0
  %24 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %23, i1* %22, 1
  %25 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %24, i64 0, 2
  %26 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %25, i64 4, 3, 0
  %27 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %26, i64 1, 4, 0
  %28 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %29 = getelementptr i1, i1* %28, i64 0
  store i1 false, i1* %29, align 1
  %30 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %31 = getelementptr i1, i1* %30, i64 1
  store i1 false, i1* %31, align 1
  %32 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %33 = getelementptr i1, i1* %32, i64 2
  store i1 false, i1* %33, align 1
  %34 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %35 = getelementptr i1, i1* %34, i64 3
  store i1 false, i1* %35, align 1
  br label %36

36:                                               ; preds = %39, %21
  %37 = phi i64 [ 0, %21 ], [ %52, %39 ]
  %38 = icmp slt i64 %37, 4
  br i1 %38, label %39, label %53

39:                                               ; preds = %36
  %40 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 %37)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = load %Qubit*, %Qubit** %41, align 8
  %43 = call %Result* @__quantum__qis__mz(%Qubit* %42)
  %44 = bitcast %Result* %43 to i1*
  %45 = load i1, i1* %44, align 1
  %46 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %47 = getelementptr i1, i1* %46, i64 %37
  store i1 %45, i1* %47, align 1
  %48 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %27, 1
  %49 = getelementptr i1, i1* %48, i64 %37
  %50 = load i1, i1* %49, align 1
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___int_d_, i64 0, i64 0), i1 %50)
  %52 = add i64 %37, 1
  br label %36

53:                                               ; preds = %36
  call void @__quantum__rt__qubit_release_array(%Array* %1)
  ret i32 0
}

define i32 @ghz(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_ghz()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

define { %Qubit*, %Qubit* } @ctrl_x(%Qubit* %0, %Qubit* %1) !dbg !6 {
  call void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1), !dbg !3
  %3 = insertvalue { %Qubit*, %Qubit* } undef, %Qubit* %0, 0
  %4 = insertvalue { %Qubit*, %Qubit* } %3, %Qubit* %1, 1
  ret { %Qubit*, %Qubit* } %4
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !DILocation(line: 5, column: 4, scope: !4)
!4 = !DILexicalBlockFile(scope: !6, file: !5, discriminator: 0)
!5 = !DIFile(filename: "ghz", directory: "/home/coder")
!6 = distinct !DISubprogram(name: "ctrl_x", linkageName: "ctrl_x", scope: null, file: !7, type: !8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !9)
!7 = !DIFile(filename: "<unknown>", directory: "/home/coder")
!8 = !DISubroutineType(types: !9)
!9 = !{}

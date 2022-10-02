; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%Qubit = type opaque
%qreg = type opaque
%Array = type opaque
%Result = type opaque

@frmt_spec___bit_array_b_0 = internal constant [4 x i8] c"%d\0A\00"
@frmt_spec___int_d_ = internal constant [4 x i8] c"%d\0A\00"
@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__qis__t(%Qubit* %0)

declare void @__quantum__qis__h(%Qubit* %0)

declare void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare i32 @printf(i8* %0, ...)

declare void @__quantum__qis__reset(%Qubit* %0)

declare %Result* @__quantum__qis__mz(%Qubit* %0)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %1)

declare %Array* @__quantum__rt__qubit_allocate_array(i64 %0)

declare void @__quantum__rt__finalize()

declare void @__quantum__rt__set_config_parameter(i8* %0, i8* %1)

declare i32 @__quantum__rt__initialize(i32 %0, i8** %1)

define i32 @main(i32 %0, i8** %1) {
  call void @__quantum__rt__set_config_parameter(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu_value, i64 0, i64 0))
  %3 = call i32 @__quantum__rt__initialize(i32 %0, i8** %1)
  %4 = call i32 @__internal_mlir_rus()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_rus() {
  %1 = call %Array* @__quantum__rt__qubit_allocate_array(i64 2)
  %2 = alloca i1, i64 ptrtoint (i1* getelementptr (i1, i1* null, i64 1) to i64), align 1
  %3 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %2, 0
  %4 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %3, i1* %2, 1
  %5 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %4, i64 0, 2
  %6 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %5, i64 1, 3, 0
  %7 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %6, i64 1, 4, 0
  %8 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %9 = getelementptr i1, i1* %8, i64 0
  store i1 true, i1* %9, align 1
  %10 = alloca i1, i64 ptrtoint (i1* getelementptr (i1, i1* null, i64 1) to i64), align 1
  %11 = insertvalue { i1*, i1*, i64 } undef, i1* %10, 0
  %12 = insertvalue { i1*, i1*, i64 } %11, i1* %10, 1
  %13 = insertvalue { i1*, i1*, i64 } %12, i64 0, 2
  %14 = extractvalue { i1*, i1*, i64 } %13, 1
  store i1 false, i1* %14, align 1
  %15 = alloca i32, i64 ptrtoint (i32* getelementptr (i32, i32* null, i64 1) to i64), align 4
  %16 = insertvalue { i32*, i32*, i64 } undef, i32* %15, 0
  %17 = insertvalue { i32*, i32*, i64 } %16, i32* %15, 1
  %18 = insertvalue { i32*, i32*, i64 } %17, i64 0, 2
  %19 = extractvalue { i32*, i32*, i64 } %18, 1
  store i32 0, i32* %19, align 4
  br label %20

20:                                               ; preds = %24, %0
  %21 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %22 = load i1, i1* %21, align 1
  %23 = icmp eq i1 %22, true
  br i1 %23, label %24, label %40

24:                                               ; preds = %20
  call void @simplerus(%Array* %1)
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  %28 = call %Result* @__quantum__qis__mz(%Qubit* %27)
  %29 = bitcast %Result* %28 to i1*
  %30 = load i1, i1* %29, align 1
  %31 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %32 = getelementptr i1, i1* %31, i64 0
  store i1 %30, i1* %32, align 1
  %33 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %34 = bitcast i8* %33 to %Qubit**
  %35 = load %Qubit*, %Qubit** %34, align 8
  call void @__quantum__qis__reset(%Qubit* %35)
  %36 = extractvalue { i32*, i32*, i64 } %18, 1
  %37 = load i32, i32* %36, align 4
  %38 = add i32 %37, 1
  %39 = extractvalue { i32*, i32*, i64 } %18, 1
  store i32 %38, i32* %39, align 4
  br label %20

40:                                               ; preds = %20
  %41 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 1)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = load %Qubit*, %Qubit** %42, align 8
  %44 = call %Result* @__quantum__qis__mz(%Qubit* %43)
  %45 = bitcast %Result* %44 to i1*
  %46 = load i1, i1* %45, align 1
  %47 = extractvalue { i1*, i1*, i64 } %13, 1
  store i1 %46, i1* %47, align 1
  %48 = extractvalue { i32*, i32*, i64 } %18, 1
  %49 = load i32, i32* %48, align 4
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___int_d_, i64 0, i64 0), i32 %49)
  %51 = extractvalue { i1*, i1*, i64 } %13, 1
  %52 = load i1, i1* %51, align 1
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___bit_array_b_0, i64 0, i64 0), i1 %52)
  call void @__quantum__rt__qubit_release_array(%Array* %1)
  ret i32 0
}

define i32 @rus(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_rus()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

define { %Qubit*, %Qubit* } @ctrl_x(%Qubit* %0, %Qubit* %1) !dbg !3 {
  call void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1), !dbg !7
  %3 = insertvalue { %Qubit*, %Qubit* } undef, %Qubit* %0, 0
  %4 = insertvalue { %Qubit*, %Qubit* } %3, %Qubit* %1, 1
  ret { %Qubit*, %Qubit* } %4
}

define void @simplerus(%Array* %0) {
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  call void @__quantum__qis__h(%Qubit* %4)
  call void @__quantum__qis__t(%Qubit* %4)
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = load %Qubit*, %Qubit** %6, align 8
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %7), !dbg !7
  %8 = insertvalue { %Qubit*, %Qubit* } undef, %Qubit* %4, 0
  %9 = insertvalue { %Qubit*, %Qubit* } %8, %Qubit* %7, 1
  %10 = extractvalue { %Qubit*, %Qubit* } %9, 0
  %11 = extractvalue { %Qubit*, %Qubit* } %9, 1
  call void @__quantum__qis__h(%Qubit* %10)
  call void @__quantum__qis__cnot(%Qubit* %10, %Qubit* %11), !dbg !7
  %12 = extractvalue { %Qubit*, %Qubit* } %9, 0
  %13 = extractvalue { %Qubit*, %Qubit* } %9, 1
  call void @__quantum__qis__t(%Qubit* %12)
  call void @__quantum__qis__h(%Qubit* %12)
  ret void
}

define void @simplerus__interop__(%Array* %0) {
  call void @simplerus(%Array* %0)
  ret void
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "ctrl_x", linkageName: "ctrl_x", scope: null, file: !4, type: !5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "<unknown>", directory: "/home/coder")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 3, column: 4, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !9, discriminator: 0)
!9 = !DIFile(filename: "rus", directory: "/home/coder")

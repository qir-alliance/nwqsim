; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%qreg = type opaque
%Array = type opaque
%Result = type opaque
%Qubit = type opaque

@__internal_string_literal__3894899134530184853 = internal constant [8 x i8] c"Failure\00"
@frmt_spec___string_s_ = internal constant [4 x i8] c"%s\0A\00"
@__internal_string_literal__574226597152885024 = internal constant [8 x i8] c"Success\00"
@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare i32 @printf(i8* %0, ...)

declare %Result* @__quantum__qis__mz(%Qubit* %0)

declare void @__quantum__qis__z(%Qubit* %0)

declare void @__quantum__qis__h(%Qubit* %0)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %1)

declare %Array* @__quantum__rt__qubit_allocate_array(i64 %0)

declare void @__quantum__rt__finalize()

declare void @__quantum__rt__set_config_parameter(i8* %0, i8* %1)

declare i32 @__quantum__rt__initialize(i32 %0, i8** %1)

define i32 @main(i32 %0, i8** %1) {
  call void @__quantum__rt__set_config_parameter(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu_value, i64 0, i64 0))
  %3 = call i32 @__quantum__rt__initialize(i32 %0, i8** %1)
  %4 = call i32 @__internal_mlir_no-qec()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_no-qec() {
  %1 = call %Array* @__quantum__rt__qubit_allocate_array(i64 1)
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = alloca i1, i64 ptrtoint (i1* getelementptr (i1, i1* null, i64 1) to i64), align 1
  %6 = insertvalue { i1*, i1*, i64 } undef, i1* %5, 0
  %7 = insertvalue { i1*, i1*, i64 } %6, i1* %5, 1
  %8 = insertvalue { i1*, i1*, i64 } %7, i64 0, 2
  %9 = extractvalue { i1*, i1*, i64 } %8, 1
  store i1 false, i1* %9, align 1
  call void @__quantum__qis__h(%Qubit* %4)
  call void @__quantum__qis__z(%Qubit* %4)
  call void @__quantum__qis__h(%Qubit* %4)
  %10 = call %Result* @__quantum__qis__mz(%Qubit* %4)
  %11 = bitcast %Result* %10 to i1*
  %12 = load i1, i1* %11, align 1
  %13 = extractvalue { i1*, i1*, i64 } %8, 1
  store i1 %12, i1* %13, align 1
  %14 = extractvalue { i1*, i1*, i64 } %8, 1
  %15 = load i1, i1* %14, align 1
  %16 = icmp eq i1 %15, true
  br i1 %16, label %17, label %19

17:                                               ; preds = %0
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___string_s_, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__internal_string_literal__574226597152885024, i64 0, i64 0))
  br label %21

19:                                               ; preds = %0
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___string_s_, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__internal_string_literal__3894899134530184853, i64 0, i64 0))
  br label %21

21:                                               ; preds = %17, %19
  call void @__quantum__rt__qubit_release_array(%Array* %1)
  ret i32 0
}

define i32 @no-qec(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_no-qec()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}

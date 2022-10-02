; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%qreg = type opaque
%Array = type opaque
%Qubit = type opaque
%Result = type opaque

@frmt_spec___float_f_ = internal constant [5 x i8] c"%lf\0A\00"
@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare i32 @printf(i8* %0, ...)

declare void @__quantum__qis__reset(%Qubit* %0)

declare %Result* @__quantum__qis__mz(%Qubit* %0)

declare void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1)

declare void @__quantum__qis__rz(double %0, %Qubit* %1)

declare void @__quantum__qis__h(%Qubit* %0)

declare void @__quantum__qis__x(%Qubit* %0)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 %1)

declare %Array* @__quantum__rt__qubit_allocate_array(i64 %0)

declare void @__quantum__rt__finalize()

declare void @__quantum__rt__set_config_parameter(i8* %0, i8* %1)

declare i32 @__quantum__rt__initialize(i32 %0, i8** %1)

define i32 @main(i32 %0, i8** %1) {
  call void @__quantum__rt__set_config_parameter(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @qpu_value, i64 0, i64 0))
  %3 = call i32 @__quantum__rt__initialize(i32 %0, i8** %1)
  %4 = call i32 @__internal_mlir_rwpe()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_rwpe() {
  %1 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %2 = insertvalue { double*, double*, i64 } undef, double* %1, 0
  %3 = insertvalue { double*, double*, i64 } %2, double* %1, 1
  %4 = insertvalue { double*, double*, i64 } %3, i64 0, 2
  %5 = extractvalue { double*, double*, i64 } %4, 1
  store double 3.140000e-01, double* %5, align 8
  %6 = alloca i32, i64 ptrtoint (i32* getelementptr (i32, i32* null, i64 1) to i64), align 4
  %7 = insertvalue { i32*, i32*, i64 } undef, i32* %6, 0
  %8 = insertvalue { i32*, i32*, i64 } %7, i32* %6, 1
  %9 = insertvalue { i32*, i32*, i64 } %8, i64 0, 2
  %10 = extractvalue { i32*, i32*, i64 } %9, 1
  store i32 100, i32* %10, align 4
  %11 = alloca i32, i64 ptrtoint (i32* getelementptr (i32, i32* null, i64 1) to i64), align 4
  %12 = insertvalue { i32*, i32*, i64 } undef, i32* %11, 0
  %13 = insertvalue { i32*, i32*, i64 } %12, i32* %11, 1
  %14 = insertvalue { i32*, i32*, i64 } %13, i64 0, 2
  %15 = extractvalue { i32*, i32*, i64 } %14, 1
  store i32 0, i32* %15, align 4
  %16 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %17 = insertvalue { double*, double*, i64 } undef, double* %16, 0
  %18 = insertvalue { double*, double*, i64 } %17, double* %16, 1
  %19 = insertvalue { double*, double*, i64 } %18, i64 0, 2
  %20 = extractvalue { double*, double*, i64 } %19, 1
  store double 7.951000e-01, double* %20, align 8
  %21 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %22 = insertvalue { double*, double*, i64 } undef, double* %21, 0
  %23 = insertvalue { double*, double*, i64 } %22, double* %21, 1
  %24 = insertvalue { double*, double*, i64 } %23, i64 0, 2
  %25 = extractvalue { double*, double*, i64 } %24, 1
  store double 6.065000e-01, double* %25, align 8
  %26 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %27 = insertvalue { double*, double*, i64 } undef, double* %26, 0
  %28 = insertvalue { double*, double*, i64 } %27, double* %26, 1
  %29 = insertvalue { double*, double*, i64 } %28, i64 0, 2
  %30 = extractvalue { double*, double*, i64 } %29, 1
  store double 0.000000e+00, double* %30, align 8
  %31 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %32 = insertvalue { double*, double*, i64 } undef, double* %31, 0
  %33 = insertvalue { double*, double*, i64 } %32, double* %31, 1
  %34 = insertvalue { double*, double*, i64 } %33, i64 0, 2
  %35 = extractvalue { double*, double*, i64 } %34, 1
  store double 0.000000e+00, double* %35, align 8
  %36 = alloca double, i64 ptrtoint (double* getelementptr (double, double* null, i64 1) to i64), align 8
  %37 = insertvalue { double*, double*, i64 } undef, double* %36, 0
  %38 = insertvalue { double*, double*, i64 } %37, double* %36, 1
  %39 = insertvalue { double*, double*, i64 } %38, i64 0, 2
  %40 = extractvalue { double*, double*, i64 } %39, 1
  store double 0.000000e+00, double* %40, align 8
  %41 = call %Array* @__quantum__rt__qubit_allocate_array(i64 1)
  %42 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %41, i64 0)
  %43 = bitcast i8* %42 to %Qubit**
  %44 = load %Qubit*, %Qubit** %43, align 8
  %45 = call %Array* @__quantum__rt__qubit_allocate_array(i64 1)
  %46 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %45, i64 0)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = load %Qubit*, %Qubit** %47, align 8
  %49 = alloca i1, i64 ptrtoint (i1* getelementptr (i1, i1* null, i64 1) to i64), align 1
  %50 = insertvalue { i1*, i1*, i64 } undef, i1* %49, 0
  %51 = insertvalue { i1*, i1*, i64 } %50, i1* %49, 1
  %52 = insertvalue { i1*, i1*, i64 } %51, i64 0, 2
  %53 = extractvalue { i1*, i1*, i64 } %52, 1
  store i1 false, i1* %53, align 1
  call void @__quantum__qis__x(%Qubit* %44)
  br label %54

54:                                               ; preds = %120, %0
  %55 = extractvalue { i32*, i32*, i64 } %14, 1
  %56 = load i32, i32* %55, align 4
  %57 = extractvalue { i32*, i32*, i64 } %9, 1
  %58 = load i32, i32* %57, align 4
  %59 = icmp slt i32 %56, %58
  br i1 %59, label %60, label %129

60:                                               ; preds = %54
  %61 = extractvalue { double*, double*, i64 } %24, 1
  %62 = load double, double* %61, align 8
  %63 = fmul double 0x400921FB54442D18, %62
  %64 = fdiv double %63, 2.000000e+00
  %65 = extractvalue { double*, double*, i64 } %19, 1
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %64
  %68 = extractvalue { double*, double*, i64 } %29, 1
  %69 = load double, double* %68, align 8
  %70 = extractvalue { double*, double*, i64 } %29, 1
  store double %67, double* %70, align 8
  %71 = extractvalue { double*, double*, i64 } %24, 1
  %72 = load double, double* %71, align 8
  %73 = fdiv double 1.000000e+00, %72
  %74 = extractvalue { double*, double*, i64 } %34, 1
  %75 = load double, double* %74, align 8
  %76 = extractvalue { double*, double*, i64 } %34, 1
  store double %73, double* %76, align 8
  call void @__quantum__qis__h(%Qubit* %48)
  %77 = extractvalue { double*, double*, i64 } %29, 1
  %78 = load double, double* %77, align 8
  %79 = fmul double -1.000000e+00, %78
  %80 = extractvalue { double*, double*, i64 } %34, 1
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  call void @__quantum__qis__rz(double %82, %Qubit* %48)
  %83 = extractvalue { double*, double*, i64 } %4, 1
  %84 = load double, double* %83, align 8
  %85 = extractvalue { double*, double*, i64 } %34, 1
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fdiv double %87, 2.000000e+00
  %89 = extractvalue { double*, double*, i64 } %39, 1
  %90 = load double, double* %89, align 8
  %91 = extractvalue { double*, double*, i64 } %39, 1
  store double %88, double* %91, align 8
  %92 = extractvalue { double*, double*, i64 } %39, 1
  %93 = load double, double* %92, align 8
  call void @__quantum__qis__rz(double %93, %Qubit* %44)
  call void @__quantum__qis__cnot(%Qubit* %48, %Qubit* %44)
  %94 = extractvalue { double*, double*, i64 } %39, 1
  %95 = load double, double* %94, align 8
  %96 = fmul double -1.000000e+00, %95
  call void @__quantum__qis__rz(double %96, %Qubit* %44)
  call void @__quantum__qis__cnot(%Qubit* %48, %Qubit* %44)
  call void @__quantum__qis__h(%Qubit* %48)
  %97 = call %Result* @__quantum__qis__mz(%Qubit* %48)
  %98 = bitcast %Result* %97 to i1*
  %99 = load i1, i1* %98, align 1
  %100 = extractvalue { i1*, i1*, i64 } %52, 1
  store i1 %99, i1* %100, align 1
  call void @__quantum__qis__reset(%Qubit* %48)
  %101 = extractvalue { i1*, i1*, i64 } %52, 1
  %102 = load i1, i1* %101, align 1
  %103 = icmp eq i1 %102, true
  br i1 %103, label %104, label %112

104:                                              ; preds = %60
  %105 = extractvalue { double*, double*, i64 } %24, 1
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 6.065000e-01
  %108 = extractvalue { double*, double*, i64 } %19, 1
  %109 = load double, double* %108, align 8
  %110 = fadd double %109, %107
  %111 = extractvalue { double*, double*, i64 } %19, 1
  store double %110, double* %111, align 8
  br label %120

112:                                              ; preds = %60
  %113 = extractvalue { double*, double*, i64 } %24, 1
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, 6.065000e-01
  %116 = extractvalue { double*, double*, i64 } %19, 1
  %117 = load double, double* %116, align 8
  %118 = fsub double %117, %115
  %119 = extractvalue { double*, double*, i64 } %19, 1
  store double %118, double* %119, align 8
  br label %120

120:                                              ; preds = %104, %112
  %121 = extractvalue { double*, double*, i64 } %24, 1
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 7.951000e-01
  %124 = extractvalue { double*, double*, i64 } %24, 1
  store double %123, double* %124, align 8
  %125 = extractvalue { i32*, i32*, i64 } %14, 1
  %126 = load i32, i32* %125, align 4
  %127 = add i32 %126, 1
  %128 = extractvalue { i32*, i32*, i64 } %14, 1
  store i32 %127, i32* %128, align 4
  br label %54

129:                                              ; preds = %54
  call void @__quantum__qis__reset(%Qubit* %44)
  %130 = extractvalue { double*, double*, i64 } %19, 1
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, 2.000000e+00
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @frmt_spec___float_f_, i64 0, i64 0), double %132)
  call void @__quantum__rt__qubit_release_array(%Array* %45)
  call void @__quantum__rt__qubit_release_array(%Array* %41)
  ret i32 0
}

define i32 @rwpe(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_rwpe()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}

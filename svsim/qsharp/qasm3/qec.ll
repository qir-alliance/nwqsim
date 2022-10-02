; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%Qubit = type opaque
%qreg = type opaque
%Array = type opaque
%Result = type opaque

@__internal_string_literal__539948343987309739 = internal constant [18 x i8] c"Corrected Success\00"
@frmt_spec___string_s_ = internal constant [4 x i8] c"%s\0A\00"
@__internal_string_literal__574226597152885024 = internal constant [8 x i8] c"Success\00"
@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__qis__y(%Qubit* %0)

declare void @__quantum__qis__x(%Qubit* %0)

declare void @__quantum__qis__cz(%Qubit* %0, %Qubit* %1)

declare void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %1)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare void @__quantum__qis__reset(%Qubit* %0)

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
  %4 = call i32 @__internal_mlir_qec()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_qec() {
  %1 = call %Array* @__quantum__rt__qubit_allocate_array(i64 5)
  %2 = call %Array* @__quantum__rt__qubit_allocate_array(i64 1)
  %3 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %2, i64 0)
  %4 = bitcast i8* %3 to %Qubit**
  %5 = load %Qubit*, %Qubit** %4, align 8
  %6 = alloca i1, i64 mul (i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i64 4), align 1
  %7 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %6, 0
  %8 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, i1* %6, 1
  %9 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %8, i64 0, 2
  %10 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %9, i64 4, 3, 0
  %11 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %10, i64 1, 4, 0
  %12 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %13 = getelementptr i1, i1* %12, i64 0
  store i1 false, i1* %13, align 1
  %14 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %15 = getelementptr i1, i1* %14, i64 1
  store i1 false, i1* %15, align 1
  %16 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %17 = getelementptr i1, i1* %16, i64 2
  store i1 false, i1* %17, align 1
  %18 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %19 = getelementptr i1, i1* %18, i64 3
  store i1 false, i1* %19, align 1
  %20 = alloca i1, i64 ptrtoint (i1* getelementptr (i1, i1* null, i64 1) to i64), align 1
  %21 = insertvalue { i1*, i1*, i64 } undef, i1* %20, 0
  %22 = insertvalue { i1*, i1*, i64 } %21, i1* %20, 1
  %23 = insertvalue { i1*, i1*, i64 } %22, i64 0, 2
  %24 = extractvalue { i1*, i1*, i64 } %23, 1
  store i1 false, i1* %24, align 1
  %25 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %26 = bitcast i8* %25 to %Qubit**
  %27 = load %Qubit*, %Qubit** %26, align 8
  call void @__quantum__qis__h(%Qubit* %27)
  call void @encode(%Array* %1)
  br label %28

28:                                               ; preds = %31, %0
  %29 = phi i64 [ 0, %0 ], [ %35, %31 ]
  %30 = icmp slt i64 %29, 5
  br i1 %30, label %31, label %36

31:                                               ; preds = %28
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 %29)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  call void @__quantum__qis__z(%Qubit* %34)
  %35 = add i64 %29, 1
  br label %28

36:                                               ; preds = %28
  %37 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %38 = bitcast i8* %37 to %Qubit**
  %39 = load %Qubit*, %Qubit** %38, align 8
  %40 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 3)
  %41 = bitcast i8* %40 to %Qubit**
  %42 = load %Qubit*, %Qubit** %41, align 8
  %43 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 1)
  %44 = bitcast i8* %43 to %Qubit**
  %45 = load %Qubit*, %Qubit** %44, align 8
  %46 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 2)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = load %Qubit*, %Qubit** %47, align 8
  call void @__quantum__qis__reset(%Qubit* %5), !dbg !3
  call void @__quantum__qis__h(%Qubit* %5), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %39), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %42), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %45), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %48), !dbg !14
  call void @__quantum__qis__h(%Qubit* %5), !dbg !15
  %49 = call %Result* @__quantum__qis__mz(%Qubit* %5)
  %50 = bitcast %Result* %49 to i1*
  %51 = load i1, i1* %50, align 1
  %52 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %53 = getelementptr i1, i1* %52, i64 0
  store i1 %51, i1* %53, align 1
  %54 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 4)
  %55 = bitcast i8* %54 to %Qubit**
  %56 = load %Qubit*, %Qubit** %55, align 8
  call void @__quantum__qis__reset(%Qubit* %5), !dbg !3
  call void @__quantum__qis__h(%Qubit* %5), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %45), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %56), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %48), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %42), !dbg !14
  call void @__quantum__qis__h(%Qubit* %5), !dbg !15
  %57 = call %Result* @__quantum__qis__mz(%Qubit* %5)
  %58 = bitcast %Result* %57 to i1*
  %59 = load i1, i1* %58, align 1
  %60 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %61 = getelementptr i1, i1* %60, i64 1
  store i1 %59, i1* %61, align 1
  call void @__quantum__qis__reset(%Qubit* %5), !dbg !3
  call void @__quantum__qis__h(%Qubit* %5), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %39), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %48), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %42), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %56), !dbg !14
  call void @__quantum__qis__h(%Qubit* %5), !dbg !15
  %62 = call %Result* @__quantum__qis__mz(%Qubit* %5)
  %63 = bitcast %Result* %62 to i1*
  %64 = load i1, i1* %63, align 1
  %65 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %66 = getelementptr i1, i1* %65, i64 2
  store i1 %64, i1* %66, align 1
  call void @__quantum__qis__reset(%Qubit* %5), !dbg !3
  call void @__quantum__qis__h(%Qubit* %5), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %45), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %5, %Qubit* %42), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %39), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %5, %Qubit* %56), !dbg !14
  call void @__quantum__qis__h(%Qubit* %5), !dbg !15
  %67 = call %Result* @__quantum__qis__mz(%Qubit* %5)
  %68 = bitcast %Result* %67 to i1*
  %69 = load i1, i1* %68, align 1
  %70 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %71 = getelementptr i1, i1* %70, i64 3
  store i1 %69, i1* %71, align 1
  %72 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 0
  %73 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %74 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 2
  %75 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 3, 0
  %76 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 4, 0
  call void @apply_correction(i1* %72, i1* %73, i64 %74, i64 %75, i64 %76, %Array* %1)
  call void @decode(%Array* %1)
  call void @__quantum__qis__h(%Qubit* %39)
  %77 = call %Result* @__quantum__qis__mz(%Qubit* %39)
  %78 = bitcast %Result* %77 to i1*
  %79 = load i1, i1* %78, align 1
  %80 = extractvalue { i1*, i1*, i64 } %23, 1
  store i1 %79, i1* %80, align 1
  %81 = extractvalue { i1*, i1*, i64 } %23, 1
  %82 = load i1, i1* %81, align 1
  %83 = icmp eq i1 %82, true
  br i1 %83, label %84, label %112

84:                                               ; preds = %36
  %85 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %86 = getelementptr i1, i1* %85, i64 0
  %87 = load i1, i1* %86, align 1
  %88 = icmp eq i1 %87, false
  %89 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %90 = getelementptr i1, i1* %89, i64 1
  %91 = load i1, i1* %90, align 1
  %92 = icmp eq i1 %91, false
  %93 = and i1 %88, %92
  br i1 %93, label %94, label %109

94:                                               ; preds = %84
  %95 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %96 = getelementptr i1, i1* %95, i64 2
  %97 = load i1, i1* %96, align 1
  %98 = icmp eq i1 %97, false
  %99 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %100 = getelementptr i1, i1* %99, i64 3
  %101 = load i1, i1* %100, align 1
  %102 = icmp eq i1 %101, false
  %103 = and i1 %98, %102
  br i1 %103, label %104, label %106

104:                                              ; preds = %94
  %105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___string_s_, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__internal_string_literal__574226597152885024, i64 0, i64 0))
  br label %108

106:                                              ; preds = %94
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___string_s_, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__internal_string_literal__539948343987309739, i64 0, i64 0))
  br label %108

108:                                              ; preds = %104, %106
  br label %111

109:                                              ; preds = %84
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @frmt_spec___string_s_, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__internal_string_literal__539948343987309739, i64 0, i64 0))
  br label %111

111:                                              ; preds = %108, %109
  br label %137

112:                                              ; preds = %36
  %113 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %114 = getelementptr i1, i1* %113, i64 0
  %115 = load i1, i1* %114, align 1
  %116 = icmp eq i1 %115, false
  %117 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %118 = getelementptr i1, i1* %117, i64 1
  %119 = load i1, i1* %118, align 1
  %120 = icmp eq i1 %119, false
  %121 = and i1 %116, %120
  br i1 %121, label %122, label %135

122:                                              ; preds = %112
  %123 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %124 = getelementptr i1, i1* %123, i64 2
  %125 = load i1, i1* %124, align 1
  %126 = icmp eq i1 %125, false
  %127 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %128 = getelementptr i1, i1* %127, i64 3
  %129 = load i1, i1* %128, align 1
  %130 = icmp eq i1 %129, false
  %131 = and i1 %126, %130
  br i1 %131, label %132, label %133

132:                                              ; preds = %122
  br label %134

133:                                              ; preds = %122
  br label %134

134:                                              ; preds = %132, %133
  br label %136

135:                                              ; preds = %112
  br label %136

136:                                              ; preds = %134, %135
  br label %137

137:                                              ; preds = %111, %136
  br label %138

138:                                              ; preds = %141, %137
  %139 = phi i64 [ 0, %137 ], [ %145, %141 ]
  %140 = icmp slt i64 %139, 5
  br i1 %140, label %141, label %146

141:                                              ; preds = %138
  %142 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 %139)
  %143 = bitcast i8* %142 to %Qubit**
  %144 = load %Qubit*, %Qubit** %143, align 8
  call void @__quantum__qis__reset(%Qubit* %144)
  %145 = add i64 %139, 1
  br label %138

146:                                              ; preds = %138
  call void @__quantum__qis__reset(%Qubit* %5)
  call void @__quantum__rt__qubit_release_array(%Array* %2)
  call void @__quantum__rt__qubit_release_array(%Array* %1)
  ret i32 0
}

define i32 @qec(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_qec()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

define void @check_parity(%Qubit* %0, %Qubit* %1, %Qubit* %2, %Qubit* %3, %Qubit* %4) !dbg !6 {
  call void @__quantum__qis__reset(%Qubit* %4), !dbg !3
  call void @__quantum__qis__h(%Qubit* %4), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %0), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %1), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %4, %Qubit* %2), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %4, %Qubit* %3), !dbg !14
  call void @__quantum__qis__h(%Qubit* %4), !dbg !15
  ret void
}

define void @check_parity__interop__(%Qubit* %0, %Qubit* %1, %Qubit* %2, %Qubit* %3, %Qubit* %4) {
  call void @__quantum__qis__reset(%Qubit* %0), !dbg !3
  call void @__quantum__qis__h(%Qubit* %0), !dbg !10
  call void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %4), !dbg !11
  call void @__quantum__qis__cnot(%Qubit* %0, %Qubit* %3), !dbg !12
  call void @__quantum__qis__cz(%Qubit* %0, %Qubit* %2), !dbg !13
  call void @__quantum__qis__cz(%Qubit* %0, %Qubit* %1), !dbg !14
  call void @__quantum__qis__h(%Qubit* %0), !dbg !15
  ret void
}

define void @encode(%Array* %0) {
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = load %Qubit*, %Qubit** %6, align 8
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %7)
  call void @__quantum__qis__h(%Qubit* %4)
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  call void @__quantum__qis__h(%Qubit* %10)
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %13)
  call void @__quantum__qis__cnot(%Qubit* %10, %Qubit* %4)
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %7)
  %14 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = load %Qubit*, %Qubit** %15, align 8
  call void @__quantum__qis__cnot(%Qubit* %10, %Qubit* %16)
  call void @__quantum__qis__h(%Qubit* %10)
  call void @__quantum__qis__h(%Qubit* %4)
  call void @__quantum__qis__cnot(%Qubit* %10, %Qubit* %13)
  call void @__quantum__qis__cnot(%Qubit* %4, %Qubit* %16)
  call void @__quantum__qis__x(%Qubit* %13)
  ret void
}

define void @encode__interop__(%Array* %0) {
  call void @encode(%Array* %0)
  ret void
}

define void @decode(%Array* %0) {
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 3)
  %3 = bitcast i8* %2 to %Qubit**
  %4 = load %Qubit*, %Qubit** %3, align 8
  call void @__quantum__qis__x(%Qubit* %4)
  %5 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 0)
  %6 = bitcast i8* %5 to %Qubit**
  %7 = load %Qubit*, %Qubit** %6, align 8
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 4)
  %9 = bitcast i8* %8 to %Qubit**
  %10 = load %Qubit*, %Qubit** %9, align 8
  call void @__quantum__qis__cnot(%Qubit* %7, %Qubit* %10)
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 1)
  %12 = bitcast i8* %11 to %Qubit**
  %13 = load %Qubit*, %Qubit** %12, align 8
  call void @__quantum__qis__cnot(%Qubit* %13, %Qubit* %4)
  call void @__quantum__qis__h(%Qubit* %7)
  call void @__quantum__qis__h(%Qubit* %13)
  call void @__quantum__qis__cnot(%Qubit* %13, %Qubit* %10)
  %14 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %0, i64 2)
  %15 = bitcast i8* %14 to %Qubit**
  %16 = load %Qubit*, %Qubit** %15, align 8
  call void @__quantum__qis__cnot(%Qubit* %7, %Qubit* %16)
  call void @__quantum__qis__cnot(%Qubit* %13, %Qubit* %7)
  call void @__quantum__qis__cnot(%Qubit* %7, %Qubit* %4)
  call void @__quantum__qis__h(%Qubit* %13)
  call void @__quantum__qis__h(%Qubit* %7)
  call void @__quantum__qis__cnot(%Qubit* %7, %Qubit* %16)
  ret void
}

define void @decode__interop__(%Array* %0) {
  call void @decode(%Array* %0)
  ret void
}

define void @apply_correction(i1* %0, i1* %1, i64 %2, i64 %3, i64 %4, %Array* %5) {
  %7 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %0, 0
  %8 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, i1* %1, 1
  %9 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %8, i64 %2, 2
  %10 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %9, i64 %3, 3, 0
  %11 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %10, i64 %4, 4, 0
  %12 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %13 = getelementptr i1, i1* %12, i64 0
  %14 = load i1, i1* %13, align 1
  %15 = icmp eq i1 %14, false
  %16 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %17 = getelementptr i1, i1* %16, i64 1
  %18 = load i1, i1* %17, align 1
  %19 = icmp eq i1 %18, false
  %20 = and i1 %15, %19
  br i1 %20, label %21, label %66

21:                                               ; preds = %6
  %22 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %23 = getelementptr i1, i1* %22, i64 2
  %24 = load i1, i1* %23, align 1
  %25 = icmp eq i1 %24, false
  %26 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %27 = getelementptr i1, i1* %26, i64 3
  %28 = load i1, i1* %27, align 1
  %29 = icmp eq i1 %28, true
  %30 = and i1 %25, %29
  br i1 %30, label %31, label %35

31:                                               ; preds = %21
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 1)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  call void @__quantum__qis__x(%Qubit* %34)
  br label %65

35:                                               ; preds = %21
  %36 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %37 = getelementptr i1, i1* %36, i64 2
  %38 = load i1, i1* %37, align 1
  %39 = icmp eq i1 %38, true
  %40 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %41 = getelementptr i1, i1* %40, i64 3
  %42 = load i1, i1* %41, align 1
  %43 = icmp eq i1 %42, false
  %44 = and i1 %39, %43
  br i1 %44, label %45, label %49

45:                                               ; preds = %35
  %46 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 4)
  %47 = bitcast i8* %46 to %Qubit**
  %48 = load %Qubit*, %Qubit** %47, align 8
  call void @__quantum__qis__z(%Qubit* %48)
  br label %64

49:                                               ; preds = %35
  %50 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %51 = getelementptr i1, i1* %50, i64 2
  %52 = load i1, i1* %51, align 1
  %53 = icmp eq i1 %52, true
  %54 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %55 = getelementptr i1, i1* %54, i64 3
  %56 = load i1, i1* %55, align 1
  %57 = icmp eq i1 %56, true
  %58 = and i1 %53, %57
  br i1 %58, label %59, label %63

59:                                               ; preds = %49
  %60 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 2)
  %61 = bitcast i8* %60 to %Qubit**
  %62 = load %Qubit*, %Qubit** %61, align 8
  call void @__quantum__qis__x(%Qubit* %62)
  br label %63

63:                                               ; preds = %59, %49
  br label %64

64:                                               ; preds = %45, %63
  br label %65

65:                                               ; preds = %31, %64
  br label %246

66:                                               ; preds = %6
  %67 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %68 = getelementptr i1, i1* %67, i64 0
  %69 = load i1, i1* %68, align 1
  %70 = icmp eq i1 %69, false
  %71 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %72 = getelementptr i1, i1* %71, i64 1
  %73 = load i1, i1* %72, align 1
  %74 = icmp eq i1 %73, true
  %75 = and i1 %70, %74
  br i1 %75, label %76, label %125

76:                                               ; preds = %66
  %77 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %78 = getelementptr i1, i1* %77, i64 2
  %79 = load i1, i1* %78, align 1
  %80 = icmp eq i1 %79, false
  %81 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %82 = getelementptr i1, i1* %81, i64 3
  %83 = load i1, i1* %82, align 1
  %84 = icmp eq i1 %83, true
  %85 = and i1 %80, %84
  br i1 %85, label %86, label %90

86:                                               ; preds = %76
  %87 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 0)
  %88 = bitcast i8* %87 to %Qubit**
  %89 = load %Qubit*, %Qubit** %88, align 8
  call void @__quantum__qis__z(%Qubit* %89)
  br label %124

90:                                               ; preds = %76
  %91 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %92 = getelementptr i1, i1* %91, i64 2
  %93 = load i1, i1* %92, align 1
  %94 = icmp eq i1 %93, true
  %95 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %96 = getelementptr i1, i1* %95, i64 3
  %97 = load i1, i1* %96, align 1
  %98 = icmp eq i1 %97, false
  %99 = and i1 %94, %98
  br i1 %99, label %100, label %104

100:                                              ; preds = %90
  %101 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 3)
  %102 = bitcast i8* %101 to %Qubit**
  %103 = load %Qubit*, %Qubit** %102, align 8
  call void @__quantum__qis__x(%Qubit* %103)
  br label %123

104:                                              ; preds = %90
  %105 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %106 = getelementptr i1, i1* %105, i64 2
  %107 = load i1, i1* %106, align 1
  %108 = icmp eq i1 %107, true
  %109 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %110 = getelementptr i1, i1* %109, i64 3
  %111 = load i1, i1* %110, align 1
  %112 = icmp eq i1 %111, true
  %113 = and i1 %108, %112
  br i1 %113, label %114, label %118

114:                                              ; preds = %104
  %115 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 2)
  %116 = bitcast i8* %115 to %Qubit**
  %117 = load %Qubit*, %Qubit** %116, align 8
  call void @__quantum__qis__y(%Qubit* %117)
  br label %122

118:                                              ; preds = %104
  %119 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 2)
  %120 = bitcast i8* %119 to %Qubit**
  %121 = load %Qubit*, %Qubit** %120, align 8
  call void @__quantum__qis__z(%Qubit* %121)
  br label %122

122:                                              ; preds = %114, %118
  br label %123

123:                                              ; preds = %100, %122
  br label %124

124:                                              ; preds = %86, %123
  br label %245

125:                                              ; preds = %66
  %126 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %127 = getelementptr i1, i1* %126, i64 0
  %128 = load i1, i1* %127, align 1
  %129 = icmp eq i1 %128, true
  %130 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %131 = getelementptr i1, i1* %130, i64 1
  %132 = load i1, i1* %131, align 1
  %133 = icmp eq i1 %132, false
  %134 = and i1 %129, %133
  br i1 %134, label %135, label %184

135:                                              ; preds = %125
  %136 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %137 = getelementptr i1, i1* %136, i64 2
  %138 = load i1, i1* %137, align 1
  %139 = icmp eq i1 %138, false
  %140 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %141 = getelementptr i1, i1* %140, i64 3
  %142 = load i1, i1* %141, align 1
  %143 = icmp eq i1 %142, true
  %144 = and i1 %139, %143
  br i1 %144, label %145, label %149

145:                                              ; preds = %135
  %146 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 3)
  %147 = bitcast i8* %146 to %Qubit**
  %148 = load %Qubit*, %Qubit** %147, align 8
  call void @__quantum__qis__z(%Qubit* %148)
  br label %183

149:                                              ; preds = %135
  %150 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %151 = getelementptr i1, i1* %150, i64 2
  %152 = load i1, i1* %151, align 1
  %153 = icmp eq i1 %152, true
  %154 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %155 = getelementptr i1, i1* %154, i64 3
  %156 = load i1, i1* %155, align 1
  %157 = icmp eq i1 %156, false
  %158 = and i1 %153, %157
  br i1 %158, label %159, label %163

159:                                              ; preds = %149
  %160 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 1)
  %161 = bitcast i8* %160 to %Qubit**
  %162 = load %Qubit*, %Qubit** %161, align 8
  call void @__quantum__qis__z(%Qubit* %162)
  br label %182

163:                                              ; preds = %149
  %164 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %165 = getelementptr i1, i1* %164, i64 2
  %166 = load i1, i1* %165, align 1
  %167 = icmp eq i1 %166, true
  %168 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %169 = getelementptr i1, i1* %168, i64 3
  %170 = load i1, i1* %169, align 1
  %171 = icmp eq i1 %170, true
  %172 = and i1 %167, %171
  br i1 %172, label %173, label %177

173:                                              ; preds = %163
  %174 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 1)
  %175 = bitcast i8* %174 to %Qubit**
  %176 = load %Qubit*, %Qubit** %175, align 8
  call void @__quantum__qis__y(%Qubit* %176)
  br label %181

177:                                              ; preds = %163
  %178 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 0)
  %179 = bitcast i8* %178 to %Qubit**
  %180 = load %Qubit*, %Qubit** %179, align 8
  call void @__quantum__qis__x(%Qubit* %180)
  br label %181

181:                                              ; preds = %173, %177
  br label %182

182:                                              ; preds = %159, %181
  br label %183

183:                                              ; preds = %145, %182
  br label %244

184:                                              ; preds = %125
  %185 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %186 = getelementptr i1, i1* %185, i64 0
  %187 = load i1, i1* %186, align 1
  %188 = icmp eq i1 %187, true
  %189 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %190 = getelementptr i1, i1* %189, i64 1
  %191 = load i1, i1* %190, align 1
  %192 = icmp eq i1 %191, true
  %193 = and i1 %188, %192
  br i1 %193, label %194, label %243

194:                                              ; preds = %184
  %195 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %196 = getelementptr i1, i1* %195, i64 2
  %197 = load i1, i1* %196, align 1
  %198 = icmp eq i1 %197, false
  %199 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %200 = getelementptr i1, i1* %199, i64 3
  %201 = load i1, i1* %200, align 1
  %202 = icmp eq i1 %201, true
  %203 = and i1 %198, %202
  br i1 %203, label %204, label %208

204:                                              ; preds = %194
  %205 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 0)
  %206 = bitcast i8* %205 to %Qubit**
  %207 = load %Qubit*, %Qubit** %206, align 8
  call void @__quantum__qis__y(%Qubit* %207)
  br label %242

208:                                              ; preds = %194
  %209 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %210 = getelementptr i1, i1* %209, i64 2
  %211 = load i1, i1* %210, align 1
  %212 = icmp eq i1 %211, true
  %213 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %214 = getelementptr i1, i1* %213, i64 3
  %215 = load i1, i1* %214, align 1
  %216 = icmp eq i1 %215, false
  %217 = and i1 %212, %216
  br i1 %217, label %218, label %222

218:                                              ; preds = %208
  %219 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 4)
  %220 = bitcast i8* %219 to %Qubit**
  %221 = load %Qubit*, %Qubit** %220, align 8
  call void @__quantum__qis__y(%Qubit* %221)
  br label %241

222:                                              ; preds = %208
  %223 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %224 = getelementptr i1, i1* %223, i64 2
  %225 = load i1, i1* %224, align 1
  %226 = icmp eq i1 %225, true
  %227 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %228 = getelementptr i1, i1* %227, i64 3
  %229 = load i1, i1* %228, align 1
  %230 = icmp eq i1 %229, true
  %231 = and i1 %226, %230
  br i1 %231, label %232, label %236

232:                                              ; preds = %222
  %233 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 3)
  %234 = bitcast i8* %233 to %Qubit**
  %235 = load %Qubit*, %Qubit** %234, align 8
  call void @__quantum__qis__y(%Qubit* %235)
  br label %240

236:                                              ; preds = %222
  %237 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %5, i64 4)
  %238 = bitcast i8* %237 to %Qubit**
  %239 = load %Qubit*, %Qubit** %238, align 8
  call void @__quantum__qis__x(%Qubit* %239)
  br label %240

240:                                              ; preds = %232, %236
  br label %241

241:                                              ; preds = %218, %240
  br label %242

242:                                              ; preds = %204, %241
  br label %243

243:                                              ; preds = %242, %184
  br label %244

244:                                              ; preds = %183, %243
  br label %245

245:                                              ; preds = %124, %244
  br label %246

246:                                              ; preds = %65, %245
  ret void
}

define void @apply_correction__interop__(%Array* %0, i1* %1, i1* %2, i64 %3, i64 %4, i64 %5) {
  %7 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %1, 0
  %8 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, i1* %2, 1
  %9 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %8, i64 %3, 2
  %10 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %9, i64 %4, 3, 0
  %11 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %10, i64 %5, 4, 0
  %12 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 0
  %13 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 1
  %14 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 2
  %15 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 3, 0
  %16 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %11, 4, 0
  call void @apply_correction(i1* %12, i1* %13, i64 %14, i64 %15, i64 %16, %Array* %0)
  ret void
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !DILocation(line: 3, column: 4, scope: !4)
!4 = !DILexicalBlockFile(scope: !6, file: !5, discriminator: 0)
!5 = !DIFile(filename: "qec", directory: "/home/coder")
!6 = distinct !DISubprogram(name: "check_parity", linkageName: "check_parity", scope: null, file: !7, type: !8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !9)
!7 = !DIFile(filename: "<unknown>", directory: "/home/coder")
!8 = !DISubroutineType(types: !9)
!9 = !{}
!10 = !DILocation(line: 4, column: 4, scope: !4)
!11 = !DILocation(line: 5, column: 4, scope: !4)
!12 = !DILocation(line: 6, column: 4, scope: !4)
!13 = !DILocation(line: 7, column: 4, scope: !4)
!14 = !DILocation(line: 8, column: 4, scope: !4)
!15 = !DILocation(line: 9, column: 4, scope: !4)

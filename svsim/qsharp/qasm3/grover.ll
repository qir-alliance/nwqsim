; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

%qreg = type opaque
%Array = type opaque
%Qubit = type opaque

@qpu_value = internal constant [4 x i8] c"qpp\00"
@qpu = internal constant [4 x i8] c"qpu\00"

declare i8* @malloc(i64 %0)

declare void @free(i8* %0)

declare void @__quantum__rt__set_external_qreg(%qreg* %0)

declare void @__quantum__rt__qubit_release_array(%Array* %0)

declare void @__quantum__qis__ccx(%Qubit* %0, %Qubit* %1, %Qubit* %2)

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
  %4 = call i32 @__internal_mlir_grover()
  call void @__quantum__rt__finalize()
  ret i32 %4
}

define i32 @__internal_mlir_grover() {
  %1 = call %Array* @__quantum__rt__qubit_allocate_array(i64 9)
  %2 = alloca i1, i64 mul (i64 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i64), i64 9), align 1
  %3 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } undef, i1* %2, 0
  %4 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %3, i1* %2, 1
  %5 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %4, i64 0, 2
  %6 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %5, i64 9, 3, 0
  %7 = insertvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %6, i64 1, 4, 0
  %8 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %9 = getelementptr i1, i1* %8, i64 0
  store i1 false, i1* %9, align 1
  %10 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %11 = getelementptr i1, i1* %10, i64 1
  store i1 false, i1* %11, align 1
  %12 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %13 = getelementptr i1, i1* %12, i64 2
  store i1 false, i1* %13, align 1
  %14 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %15 = getelementptr i1, i1* %14, i64 3
  store i1 false, i1* %15, align 1
  %16 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %17 = getelementptr i1, i1* %16, i64 4
  store i1 false, i1* %17, align 1
  %18 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %19 = getelementptr i1, i1* %18, i64 5
  store i1 false, i1* %19, align 1
  %20 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %21 = getelementptr i1, i1* %20, i64 6
  store i1 false, i1* %21, align 1
  %22 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %23 = getelementptr i1, i1* %22, i64 7
  store i1 false, i1* %23, align 1
  %24 = extractvalue { i1*, i1*, i64, [1 x i64], [1 x i64] } %7, 1
  %25 = getelementptr i1, i1* %24, i64 8
  store i1 false, i1* %25, align 1
  %26 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 5)
  %27 = bitcast i8* %26 to %Qubit**
  %28 = load %Qubit*, %Qubit** %27, align 8
  call void @__quantum__qis__x(%Qubit* %28)
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 0)
  %30 = bitcast i8* %29 to %Qubit**
  %31 = load %Qubit*, %Qubit** %30, align 8
  call void @__quantum__qis__h(%Qubit* %31)
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 1)
  %33 = bitcast i8* %32 to %Qubit**
  %34 = load %Qubit*, %Qubit** %33, align 8
  call void @__quantum__qis__h(%Qubit* %34)
  %35 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 2)
  %36 = bitcast i8* %35 to %Qubit**
  %37 = load %Qubit*, %Qubit** %36, align 8
  call void @__quantum__qis__h(%Qubit* %37)
  %38 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 3)
  %39 = bitcast i8* %38 to %Qubit**
  %40 = load %Qubit*, %Qubit** %39, align 8
  call void @__quantum__qis__h(%Qubit* %40)
  %41 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 4)
  %42 = bitcast i8* %41 to %Qubit**
  %43 = load %Qubit*, %Qubit** %42, align 8
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  %44 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 6)
  %45 = bitcast i8* %44 to %Qubit**
  %46 = load %Qubit*, %Qubit** %45, align 8
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  %47 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 7)
  %48 = bitcast i8* %47 to %Qubit**
  %49 = load %Qubit*, %Qubit** %48, align 8
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  %50 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %1, i64 8)
  %51 = bitcast i8* %50 to %Qubit**
  %52 = load %Qubit*, %Qubit** %51, align 8
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__h(%Qubit* %28)
  call void @__quantum__qis__ccx(%Qubit* %43, %Qubit* %52, %Qubit* %28)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %43)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %43, %Qubit* %52, %Qubit* %28)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %43)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %43, %Qubit* %52, %Qubit* %28)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %43)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %43, %Qubit* %52, %Qubit* %28)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %52)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %40, %Qubit* %49, %Qubit* %43)
  call void @__quantum__qis__ccx(%Qubit* %37, %Qubit* %46, %Qubit* %49)
  call void @__quantum__qis__ccx(%Qubit* %31, %Qubit* %34, %Qubit* %46)
  call void @__quantum__qis__x(%Qubit* %43)
  call void @__quantum__qis__x(%Qubit* %31)
  call void @__quantum__qis__x(%Qubit* %34)
  call void @__quantum__qis__x(%Qubit* %37)
  call void @__quantum__qis__x(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %31)
  call void @__quantum__qis__h(%Qubit* %34)
  call void @__quantum__qis__h(%Qubit* %37)
  call void @__quantum__qis__h(%Qubit* %40)
  call void @__quantum__qis__h(%Qubit* %43)
  call void @__quantum__rt__qubit_release_array(%Array* %1)
  ret i32 0
}

define i32 @grover(%qreg* %0) {
  call void @__quantum__rt__set_external_qreg(%qreg* %0)
  %2 = call i32 @__internal_mlir_grover()
  call void @__quantum__rt__finalize()
  ret i32 %2
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}

NVCC = /sw/summit/cuda/11.4.0/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_70 -m64 -std=c++14 -rdc=true --compiler-options -fPIC -ccbin mpicxx
NVCC_LIBS = -lm -lnvshmem -I/ccs/home/angli/nvshmem/nvshmem_src_2.2.1-0/build/include -L/ccs/home/angli/nvshmem/nvshmem_src_2.2.1-0/build/lib -lcuda -lnvidia-ml 
CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp 
SCALE = -D USE_MPI
CC = mpicxx

QIRCC = /sw/summit/llvm/11.0.0-rc1/11.0.0-rc1-0/bin/clang++ 
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC
QIR_BRIDGE_PUBLIC = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer


all: qpe_nvgpu


qpe_nvgpu: main.cpp est-energy.o JW_QIR.o JW_json.o main.o ../../src/svsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu 
	$(NVCC) -ccbin $(CC) -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu est-energy.o main.o JW_QIR.o JW_json.o -o $@

est-energy.o: est-energy.IBMQ.ll
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o est-energy.o -c est-energy.IBMQ.ll

main.o: main.cpp
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o main.o -c main.cpp

JW_QIR.o: JW_QIR.cpp
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o JW_QIR.o -c JW_QIR.cpp

JW_json.o: JW_json.cpp
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o JW_json.o -c JW_json.cpp

clean:
	rm *.o qpe_nvgpu

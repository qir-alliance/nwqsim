#NVCC = /opt/nvidia/hpc_sdk/Linux_x86_64/21.9/cuda/11.4/bin/nvcc
NVCC = /opt/nvidia/hpc_sdk/Linux_x86_64/21.11/cuda/11.5/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_80 -m64 -std=c++14 -rdc=true --compiler-options -fPIC -ccbin CC
NVCC_LIBS = -lm -lcuda -I/global/homes/a/angli/nvshmem/nvshmem/include -L/global/homes/a/angli/nvshmem/nvshmem/lib/ -L/opt/nvidia/hpc_sdk/Linux_x86_64/21.9/cuda/11.4/lib64
CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp
SCALE = -D USE_MPI

QIRCC = /global/common/software/nersc/cos1.3/llvm/11.0.1/bin/clang++
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC
QIR_BRIDGE_PUBLIC = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer  -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer

all: VariationalQuantumEigensolver_nvgpu 

VariationalQuantumEigensolver_nvgpu: VariationalQuantumEigensolver_driver.cc VariationalQuantumEigensolver.ll ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o VariationalQuantumEigensolver.o -c VariationalQuantumEigensolver.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o VariationalQuantumEigensolver_driver.o -c VariationalQuantumEigensolver_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu VariationalQuantumEigensolver.o VariationalQuantumEigensolver_driver.o -o $@



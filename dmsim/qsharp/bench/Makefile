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


#all: TeleportationSample_nvgpu
#all: Qrng_nvgpu
all: Grover_nvgpu
#all: SimpleGroverSample_nvgpu


Grover_nvgpu: Grover_driver.cc Grover.ll ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o Grover.o -c Grover.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o Grover_driver.o -c Grover_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu Grover.o Grover_driver.o -o $@

TeleportationSample_nvgpu: TeleportationSample_driver.cc TeleportationSample.ll ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o TeleportationSample.o -c TeleportationSample.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o TeleportationSample_driver.o -c TeleportationSample_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu TeleportationSample.o TeleportationSample_driver.o -o $@

Qrng_nvgpu: Qrng_driver.cc Qrng.ll ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o Qrng.o -c Qrng.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o Qrng_driver.o -c Qrng_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu Qrng.o Qrng_driver.o -o $@

SimpleGroverSample_nvgpu: SimpleGroverSample_driver.cc SimpleGroverSample.ll ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o SimpleGroverSample.o -c SimpleGroverSample.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o SimpleGroverSample_driver.o -c SimpleGroverSample_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu SimpleGroverSample.o SimpleGroverSample_driver.o -o $@



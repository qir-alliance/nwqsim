NVCC = /sw/summit/cuda/11.4.0/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_70 -m64 -std=c++14 -rdc=true --compiler-options -fPIC -ccbin mpicxx

NVCC_LIBS = -lm -lnvshmem -I/ccs/home/angli/nvshmem/nvshmem_src_2.2.1-0/build/include -L/ccs/home/angli/nvshmem/nvshmem_src_2.2.1-0/build/lib -lcuda
CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp
SCALE = -D USE_MPI

QIRCC = /sw/summit/llvm/11.0.0-rc1/11.0.0-rc1-0/bin/clang++ 
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC

QIR_BRIDGE_PUBLIC = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /ccs/home/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer  -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer


all: unit_test

#all: circuit
#all: TeleportationSample_nvgpu
#all: Qrng_nvgpu
#all: Grover_nvgpu


unit_test: unit_test_nvgpu_mpi.cu svsim_nvgpu_mpi.cuh config.h device_noise.hpp
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU unit_test_nvgpu_mpi.cu -o $@

circuit: circuit.cu dmsim_nvgpu_mpi.cuh config.h device_noise.hpp
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU circuit.cu -o $@

TeleportationSample_nvgpu: TeleportationSample_driver.cc TeleportationSample.ll dmsim_nvgpu_mpi.cuh config.h qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o TeleportationSample.o -c TeleportationSample.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o TeleportationSample_driver.o -c TeleportationSample_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qsharp_wrapper.cu TeleportationSample.o TeleportationSample_driver.o -o $@

Simon_nvgpu: Simon_driver.cc Simon.ll dmsim_nvgpu_mpi.cuh config.h qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o Simon.o -c Simon.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o Simon_driver.o -c Simon_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qsharp_wrapper.cu Simon.o Simon_driver.o -o $@

Qrng_nvgpu: Qrng_driver.cc Qrng.ll dmsim_nvgpu_mpi.cuh config.h qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o Qrng.o -c Qrng.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o Qrng_driver.o -c Qrng_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qsharp_wrapper.cu Qrng.o Qrng_driver.o -o $@

SimpleGroverSample_nvgpu: SimpleGroverSample_driver.cc SimpleGroverSample.ll dmsim_nvgpu_mpi.cuh config.h qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o SimpleGroverSample.o -c SimpleGroverSample.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o SimpleGroverSample_driver.o -c SimpleGroverSample_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qsharp_wrapper.cu SimpleGroverSample.o SimpleGroverSample_driver.o -o $@

Grover_nvgpu: Grover_driver.cc Grover.ll dmsim_nvgpu_mpi.cuh config.h qsharp_wrapper.cu
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o Grover.o -c Grover.ll
	$(CC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o Grover_driver.o -c Grover_driver.cc
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qsharp_wrapper.cu Grover.o Grover_driver.o -o $@



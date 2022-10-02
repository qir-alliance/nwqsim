NVCC = /opt/nvidia/hpc_sdk/Linux_x86_64/22.5/cuda/11.7/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_80 -m64 -allow-unsupported-compiler -std=c++14 -rdc=true --compiler-options -fPIC -ccbin CC

NVCC_LIBS = -lm -lcuda -lfabric -I/global/homes/a/angli/nvshmem/nvshmem/include -L/global/homes/a/angli/nvshmem/nvshmem/lib/ -L/opt/nvidia/hpc_sdk/Linux_x86_64/22.7/cuda/11.7/lib64 -L/opt/cray/libfabric/1.15.0.0/lib64/ -lnvidia-ml -L/opt/nvidia/hpc_sdk/Linux_x86_64/22.7/cuda/11.7/lib64/stubs/

CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp
SCALE = -D USE_MPI

QIRCC = /global/common/software/nersc/cos1.3/llvm/11.0.1/bin/clang++
QIRCC_FLAGS = -std=c++17 -m64 -O3 -I. -fPIC
QIR_BRIDGE_PUBLIC = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/public/
QIR_BRIDGE_TEST = 
QIR_BRIDGE_BUILD = /global/homes/a/angli/qsharp-runtime/src/Qir/Runtime/build/
QIR_BRIDGE_FLAGS = -I. -I$(QIR_BRIDGE_PUBLIC) -L$(QIR_BRIDGE_BUILD)/lib/QIR -L$(QIR_BRIDGE_BUILD)/lib/QSharpCore -L$(QIR_BRIDGE_BUILD)/lib/QSharpFoundation -L$(QIR_BRIDGE_BUILD)/lib/Tracer -lMicrosoft.Quantum.Qir.Runtime -lMicrosoft.Quantum.Qir.QSharp.Core -lMicrosoft.Quantum.Qir.QSharp.Foundation -lMicrosoft.Quantum.Qir.Tracer


all: ghz_nvgpu


ghz_nvgpu: ghz.qasm ../QSharpQcorShim.cpp ../qsharp_wrapper.cu ../../src/svsim_nvgpu_mpi.cuh ../../src/config.h
	#docker run --rm -v /home/angli/raid/svsim_reform/svsim_qsharp/demo:/tmp/qcor qcor/cli -c "qcor --emit-llvm /tmp/qcor/ghz.qasm" 2>ghz.ll
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o ghz.o -c ghz.ll
	CC $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o QSharpQcorShim.o -c ../QSharpQcorShim.cpp
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU  ../qsharp_wrapper.cu ghz.o QSharpQcorShim.o -o $@


qpe_nvgpu: main.cpp est-energy.o JW_QIR.o JW_json.o main.o ../../src/svsim_nvgpu_mpi.cuh ../../src/config.h ../qsharp_wrapper.cu 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(QIR_BRIDGE_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ../qsharp_wrapper.cu est-energy.o main.o JW_QIR.o JW_json.o -o $@

est-energy.o: est-energy.IBMQ.ll
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) -o est-energy.o -c est-energy.IBMQ.ll

main.o: main.cpp
	CC $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o main.o -c main.cpp

JW_QIR.o: JW_QIR.cpp
	$(QIRCC) $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o JW_QIR.o -c JW_QIR.cpp

JW_json.o: JW_json.cpp
	CC $(QIRCC_FLAGS) -I$(QIR_BRIDGE_PUBLIC) $(SCALE) -D USE_NVGPU -o JW_json.o -c JW_json.cpp

clean:
	rm *.o qpe_nvgpu

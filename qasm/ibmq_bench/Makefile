NVCC = /opt/nvidia/hpc_sdk/Linux_x86_64/21.11/cuda/11.5/bin/nvcc
NVCC_FLAGS = -O3 -arch=sm_80 -m64 -std=c++14 -rdc=true --compiler-options -fPIC -ccbin CC
NVCC_LIBS = -lm -lcuda -I/global/homes/a/angli/nvshmem/nvshmem/include -L/global/homes/a/angli/nvshmem/nvshmem/lib/ -L/opt/nvidia/hpc_sdk/Linux_x86_64/21.9/cuda/11.4/lib64
CC_FLAGS = -O3 -m64 -std=c++14 -fPIC -fopenmp
SCALE = -D USE_MPI

all: adder_n10 bv_n14 cc_n12 dnn_n16 ising_n10 multiplier_n15 qf21_n15 qft_n15 qpe_n9 sat_n11 seca_n11 
#all: adder_n10 

adder_n10: adder_n10.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU adder_n10.cu -o $@

bv_n14: bv_n14.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU bv_n14.cu -o $@

cc_n12: cc_n12.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU cc_n12.cu -o $@

dnn_n16: dnn_n16.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU dnn_n16.cu -o $@

ising_n10: ising_n10.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU ising_n10.cu -o $@

multiplier_n15: multiplier_n15.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU multiplier_n15.cu -o $@

qf21_n15: qf21_n15.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qf21_n15.cu -o $@

qft_n15: qft_n15.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qft_n15.cu -o $@

qpe_n9: qpe_n9.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU qpe_n9.cu -o $@

sat_n11: sat_n11.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU sat_n11.cu -o $@

seca_n11: seca_n11.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU seca_n11.cu -o $@

vqe_uccsd_n8: vqe_uccsd_n8.cu ../../src/dmsim_nvgpu_mpi.cuh ../../src/config.h 
	$(NVCC) -ccbin CC -lnvshmem $(NVCC_FLAGS) $(NVCC_LIBS) $(SCALE) -D USE_NVGPU vqe_uccsd_n8.cu -o $@

clean:
	rm adder_n10 bv_n14 cc_n12 dnn_n16 ising_n10 multiplier_n15 qf21_n15 qft_n15 qpe_n9 sat_n11 seca_n11 vqe_uccsd_n8


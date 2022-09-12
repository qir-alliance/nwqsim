#!/bin/bash
#BSUB -P CSC297
#BSUB -W 120
#BSUB -nnodes 1
#BSUB -o out_cc.txt -e err_cc.txt

module load cmake
module load gcc/9.3.0
module load cuda/11.4.0
module load gdrcopy/2.3
module load spectrum-mpi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/qsharp-runtime/src/Qir/Runtime/build/lib/QIR:~/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpCore/:~/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpFoundation/:~/qsharp-runtime/src/Qir/Runtime/build/lib/:~/qsharp-runtime/src/Qir/Runtime/build/lib/Tracer/:/ccs/home/angli/nvshmem/nvshmem_src_2.6.0-1/build/lib/

export SHMEM_SYMMETRIC_HEAP_SIZE=2G
export NVSHMEM_SYMMETRIC_SIZE=8G

date

## "--smpiargs=-gpu" is for enabling GPU-Direct RDMA
jsrun -n4 -a1 -g1 -c1 --smpiargs="-gpu" ./qpe_nvgpu H2O/H20-6_2.json

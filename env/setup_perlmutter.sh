#Environment settings for NERSC Perlmutter HPC
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/qsharp-runtime/src/Qir/Runtime/build/lib/QIR:~/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpCore/:~/qsharp-runtime/src/Qir/Runtime/build/lib/QSharpFoundation/:~/qsharp-runtime/src/Qir/Runtime/build/lib/:~/qsharp-runtime/src/Qir/Runtime/build/lib/Tracer/:/global/homes/a/angli/nvshmem/nvshmem_src_2.2.1-0/build/lib
module load cmake
module load PrgEnv-nvidia
module load cudatoolkit
export LD_LIBRARY_PATH=/global/homes/a/angli/nvshmem/nvshmem/lib:$LD_LIBRARY_PATH
export NVSHMEM_SYMMETRIC_SIZE=32G

#module unload cgpu
#module load gcc/9.3.0
#module load cudatoolkit/21.3_11.2
#module load nersc-easybuild/21.12 
#module load GDRCopy/2.1-GCCcore-10.2.0-CUDA-11.1.1
#module load OpenMPI/4.0.5-gcccuda-2020b
#

#!/bin/bash
#SBATCH -A m4142_g
#SBATCH -C gpu
#SBATCH -q regular_ss11
#SBATCH -t 240:00
#SBATCH -n 8
#SBATCH -c 1
#SBATCH -G 8
#SBATCH --gpus-per-task=1
#SBATCH -o res_qasm

source ../../../env/setup_perlmutter.sh

srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./adder_n10
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./bv_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./cc_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./dnn_n16
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./ising_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./multiplier_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./qf21_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./qft_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./qpe_n9
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./sat_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./seca_n15
srun -N 2 -n 8 --gpus-per-task=1 --gpu-bind=single:1 ./vqe_uccsd_n8

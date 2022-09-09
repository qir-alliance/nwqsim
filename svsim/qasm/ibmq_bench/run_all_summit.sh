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

source ../../../env/setup_summit.sh

jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./adder_n10
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./bv_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./cc_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./dnn_n16
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./ising_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./multiplier_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./qf21_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./qft_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./qpe_n9
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./sat_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./seca_n15
jsrun -n8 -a1 -g1 -c1 --smpiargs="-gpu" ./vqe_uccsd_n8

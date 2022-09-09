# DM-Sim Northwest Density-Matrix Quantum Simulator

DM-Sim is implemented in C++/CUDA/HIP for general density-matrix quantum circuit simulation with noise. It needs to load backend device calibration data (including topology, T1, T2, SPAM, etc.) as a json file for runtime configuration to the simulator instance.  

## Folder Description 
|  Folder  | Description |
|:-------: | ----------- |
| src      | source code |
| test     | unit test and test code |
| qasm     | qasm interface to dmsim |
| qiksit   | qiskit interface to dmsim |
| qsharp   | qsharp and QIR interface to dmsim |
| xacc     | xacc interface to dmsim |
| cirq     | cirq interface to dmsim |

### Source File Description

|  File  | Description |
|:-----: | ----------- |
| gate.h | gate definition |  
| json.hpp | parse and store for json format |
| util.h | utility functions |
| fusion.h | gate fusion functions |
| metric.h | profile circuit metrics |
| svsim_nvgpu_mpi.cuh | svsim NVIDIA GPU cluster source file |

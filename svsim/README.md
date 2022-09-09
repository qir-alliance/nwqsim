# SV-Sim Northwest State-Vector Quantum Simulator

SV-Sim is implemented in C++/CUDA/HIP for general full-state quantum circuit simulation. It assumes qubits are all-to-all connected unless the input circuits are with respect to circuit topology. We use internal gate representations for advanced optimization and profiling.

## Folder Description 
|  Folder  | Description |
|:-------: | ----------- |
| src      | source code |
| test     | unit test and test code |
| qasm     | qasm interface to svsim |
| qiksit   | qiskit interface to svsim |
| qsharp   | qsharp and QIR interface to svsim |
| xacc     | xacc interface to svsim |
| cirq     | cirq interface to svsim |

### Source File Description

|  File  | Description |
|:-----: | ----------- |
| gate.h | gate definition |  
| json.hpp | parse and store for json format |
| util.h | utility functions |
| fusion.h | gate fusion functions |
| metric.h | profile circuit metrics |
| svsim_nvgpu_mpi.cuh | svsim NVIDIA GPU cluster source file |

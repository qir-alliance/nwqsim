# NWQSim: Northwest Quantum Circuit Simulation Environment 

A Quantum System Simulation Environment on classical multi-node, multi-CPU/GPU heterogeneous HPC systems. It currently includes a state-vector simulator SV-Sim ([SC'21](doc/svsim_sc21) for high-performance ideal simulation, and a density matrix simulator DM-Sim ([SC'20](doc/dmsim_sc20) for noise-aware simulation. It supports C++, Python, Q#/QIR, Qiskit, QASM, XACC as the front-ends, and X86/PPC CPU, NVIDIA/AMD GPU as the backends, see below:

![alt text](img/nwqsim.png)


## Current version

Latest version: **2.0**

NWQSim is under active development. Please raise any bugs and suggest features. 

## About SV-Sim

SV-Sim is implemented in C++/CUDA/HIP for general full-state quantum circuit simulation. It supports the following quantum gates as the interface based on QASM-2, QASM-3, and QIR:


|  Gate  | Format | Meaning |
|:-----: | ------ | ------- |
| X | X(q) | Pauli-X gate on qubit q |
| Y | Y(q) | Pauli-Y gate on qubit q |
| Z | Z(q) | Pauli-Z gate on qubit q |
| H | H(q) | Clifford Hadamard gate on qubit q |
| S | S(q) | Clifford sqrt(Z) phase gate on qubit q |
| SDG | SDG(q) | Clifford inverse of sqrt(Z) on qubit q |
| T | T(q) | sqrt(S) phase gate on qubit q |
| TDG | TDG(q) | Inverst of sqrt(S) on qubit q |
| ID | ID(q) | Identiy gate on qubit q |
| SX | SX(q) | sqrt(X) gate on qubit q, a basis gate for IBMQ |
| RI | RI(theta, q) | Global phase gate, U(0,0,a) in QASM3 or RI in Q#|
| RX | RX(theta, q) | Rotate around X axis for qubit q |
| RY | RY(theta, q) | Rotate around Y axis for qubit q |
| RZ | RZ(theta, q) | Rotate around Z axis for qubit q |
| P  | P(theta, q)  | Phase gate on qubit q as defined by Qiskit | 
| U  | U(theta, phi, lambda, q) | generic singl-qubit rotation gate with 3 Euler angles, see QASM2 | 
| CX | CX(ctrl, q) | CNOT or Controlled X gate on qubit q|
| CY | CY(ctrl, q) | Controlled Y gate on qubit q|
| CZ | CZ(ctrl, q) | Controlled Z gate on qubit q|
| CH | CH(ctrl, q) | Controlled H gate on qubit q|
| CS | CS(ctrl, q) | Controlled S gate on qubit q|
| CSDG | CSDG(ctrl, q) | Controlled SDG gate on qubit q|
| CT | CT(ctrl, q) | Controlled T gate on qubit q|
| CTDG | CTDG(ctrl, q) | Controlled TDG gate on qubit q|
| CRX | CRX(theta, ctrl, q) | Controlled RX gate on qubit q|
| CRY | CRY(theta, ctrl, q) | Controlled RY gate on qubit q|
| CRZ | CRZ(theta, ctrl, q) | Controlled RZ gate on qubit q|
| CSX | CSX(ctrl, q) | Controlled SX gate on qubit q|
| CP  | CP(theta, ctrl, q) | Controlled P gate on qubit q|
| CU  | CU(theta, phi, lambda, gamma, ctrl, q) | generic Controlled U gate, see Qiskit CU gate | 
| SWAP | SWAP(ctrl, q) | Swap gate on ctrl and q |
| M  | M(q) | measure qubit q on pauli-Z basis |
| MA | MA(n) | sample all qubits for n shots all-together |
| RESET  | RESET(q) | reset qubit q  to zero state | 


Internally, it supports arbitrary 1 or 2 qubit gates for optimization and extension to support new gates:
|  Gate  | Format | Meaning |
|:-----: | ------ | ------- |
| C1 | C1(a0-a3)  | Arbitrary 1-qubit gate |
| C2 | C2(a0-a15) | Arbitrary 2-qubit gate | 

## Prerequisite
SV-Sim generally only requires a C++ compiler. However, in order to build for GPUs or scaling (up and out) or using other APIs (python, qir, qiskit), we need the following libraries:

|  Dependency  | Version | Comments |
|:-----------: | ------- | -------- |
|     CUDA     | 11.0 or later | NVIDIA GPU backend only | 
|     GCC      | 7.0 or later  | Or other native C++ compiler |
|    OpenMP    | Local     | single-node only |
|     MPI      | Local   | CPU multi-node only | 
|   NVSHMEM    | 2.6.0   | NVIDIA GPU cluster scale-out only |
|  Python      | 3.4     | Python API only |
|  Pybind11    | 2.5.0   | Python API only |
|  mpi4py      | 3.0.3   | Python API on cluster only |
|   ROCM       | 3.1.0   | AMD GPU only |
|   Qiskit     | 0.20.0  | Qiskit interface only |
|  Q# runtime  | Local   | Q#/QIR interface only |

## Configure and run on ORNL Summit Supercomputer

```
$ git clone https://github.com/qir-alliance/nwqsim.git 
$ cd nwqsim/env
```
You need to update the env file “setup_summit.sh”, specify the nvshmem path at the end of the LD_LIBRARY_PATH. If you use Q#/QIR, you need to configure the qsharp runtime paths
```
$ source setup_summit.sh
$ cd ../qasm/ibmq_bench/
$ vim Makefile
```
You need to update the Makefile here, mainly the path to NVSHMEM.
You also need to update the project number in run_all.lsf
```
$ make -j 8
$ bsub run_all.lsf
```
Alternatively, you can allocate an interactive job and execute
```
$ bsub -Is -W 20 -nnodes 2 -P CSCXXX  $SHELL
$ ./run_all
```

## Configure and run on NERSC Perlmutter Supercomputer
```
$ git clone https://github.com/qir-alliance/nwqsim.git 
$ cd nwqsim/env
```
You need to update the env file “setup_perlmutter.sh”, specify the nvshmem path at the end of the LD_LIBRARY_PATH. If you use Q#/QIR, you need to configure the qsharp runtime paths
```
$ source setup_perlmutter.sh
$ cd ../qasm/ibmq_bench/
$ vim Makefile
```
You need to update the Makefile here, mainly the path to NVSHMEM.
```
$ make -j 8
```
Alternatively, you can allocate an interactive job and execute
```
$ ./run_all
```










C++/CUDA/HIP implementation for simulating generic quantum circuits through state-vector and density-matrix (with noise) on single CPU/GPU/Xeon-Phi, single-node-multi-CPUs/GPUs, and multi-node CPU/GPU cluster. It provides Python/C++ interface. It supports Q#/QIR as the front-end. It relies on PGAS-based SHMEM model for communication, this includes (1) GPUDirect Peer-to-Peer for single-node multi-GPU (NVIDIA and AMD GPUs) communication; (2) OpenSHMEM for CPU multi-node communication; (3) NVSHMEM (ROC_SHMEM) for GPU multi-node communication. Please see our Supercomputing-21[paper](doc/paper_sc21.pdf) for details. 

This repository includes a specialized implementation for Q# [QIR Runtime](https://github.com/microsoft/qsharp-runtime). We realize the multi-controlled gates, exponential gates, and intermediate measurement. We include dozens of applications from the [QDK samples](https://github.com/microsoft/Quantum). 


You may need to update "CMakeLists.txt" for configuration. You need to select the front-end: C++, Python or QIR. You need to select the backend: CPU, NVIDIA GPU or AMD GPU. You need to select the mode: single, OpenMP for single-node multi-devices, or MPI/OpenSHMEM/NVSHMEM for multi-nodes cluster. You may want to enable AVX512 optimization for Xeon-Phi KNL or high-end Intel X86 CPUs. For GPU, you may need to update the compute capability (e.g., 70 for Volta and 80 for Ampere).

We provide a script "set_env.sh" for setting-up the environment on OLCF Summit HPC, and an lsf file for job submission. 

## Prerequisite
DM-Sim requires the following packages.

|  Dependency  | Version | Comments |
|:-----------: | ------- | -------- |
|     CUDA     | 11.0 or later | For NVIDIA GPU backend | 
|     GCC      | 7.0 or later  | |
|    OpenMP    | 4.0     | For single-node scale-up |
| Spectrum-MPI | 10.3    | For NVIDIA GPU cluster scale-out RDMA|
|   NVSHMEM    | 2.0.3   | For NVIDIA GPU cluster scale-out |
|  Python      | 3.4     | For Python-API |
|  Pybind11    | 2.5.0   | For Python-API |
|  mpi4py      | 3.0.3   | For Python-API cluster scale-out |
|   ROCM       | 3.1.0   | For AMD GPU backend |

The basic CPU version only requires GCC or other standard C++ compiler. It needs CUDA for NVIDIA GPU backend and ROCM for AMD GPU backend. It needs Python and PyBind11 for supporting python interface. It needs OpenSHMEM/NVSHMEM/ROC_SHMEM for CPU/NVIDIA-GPU/AMD-GPU multi-node running.

The Q#/QIR relies on LLVM-10.0 or later, and [Q# Runtime](https://github.com/microsoft/qsharp-runtime).


## Build

```text
cd svsim
mkdir build
cd build
cmake ../
```

## Build
If you use the C++ interface, you will need to develop a C++ driver program and the circuit function. Please see the adder_n10 example under the "example" folder. 

```text
./adder_n10_cpu_sin
```

If you use the Python interface, after the library is generated, you can directly execute the python script. 

```text
python adder_n10_sin.py 10
```

An example on using the Python interface is given below:
```text
import svsim_py_omp_wrapper as svsim_omp
n_qubits = 10
n_gpus = 4
sim = svsim_omp.Simulation(n_qubits, n_gpus))
sim.append(sim.X(0)) #add an X gate
sim.append(sim.H(1)) #add an H gate
sim.upload() #upload to GPU
sim.run() #run
sim.clear_circuit() #clear existing circuit
sim.append(sim.H(0)) #add a new H gate 
sim.upload() #upload to GPU
sim.run() #run new circuit on original states
res = sim.measure(10) #measure with 10 repetitions and return in a list
```

For benchmark applications, please see our [QASMBench](https://arxiv.org/abs/2005.13018) benchmakr suite, which is released [here](https://github.com/pnnl/qasmbench).

## Support Tools

We provide the tool folder for converting OpenQASM code to a python script that can be executed on SV-Sim. 


## Authors 

#### [Ang Li](http://www.angliphd.com/), Senior Computer Scientist, Pacific Northwest National Laboratory (PNNL)

#### [Sriram Krishnamoorthy](https://hpc.pnl.gov/people/sriram/), Lab Fellow, Pacific Northwest National Laboratory (PNNL)

We are currently collaborating with Bo Fang from PNNL and the Microsoft Quantum team (Chris Granade, Bettina Heim, Stefan Wernli, Robin Kuzmin, Alan Geller, Guen Prawiroatmodjo and Martin Roetteler) on implementing the pipeline from Q# to [QIR](https://devblogs.microsoft.com/qsharp/introducing-quantum-intermediate-representation-qir/) to [SV-Sim](https://github.com/microsoft/qsharp-language/blob/main/Specifications/QIR/List.md). Many thanks to their strong support.


## Citation format

Please cite our SC-21 paper:
 - Ang Li, Bo Fang, Christopher Granade, Guen Prawiroatmodjo, Bettina Heim, Martin Roetteler and Sriram Krishnamoorthy, "SV-Sim: Scalable PGAS-based State Vector Simulation of Quantum Circuits" In Proceedings of the International Conference for High Performance Computing, Networking, Storage and Analysis, 2021.

Bibtex:
```text
@inproceedings{li2021svsim,
    title={SV-Sim: Scalable PGAS-based State Vector Simulation of Quantum Circuits},
    author={Li, Ang and Fang, Bo and Granade, Christopher and Prawiroatmodjo, Guen and Hein, Bettina and Rotteler, Martin and Krishnamoorthy, Sriram},
    booktitle={Proceedings of the International Conference for High Performance Computing, Networking, Storage and Analysis},
    year={2021}
}
``` 


## License

This project is licensed under the MIT License, see [LICENSE](LICENSE) file for details.

## Acknowledgments

**PNNL-IPID: 32166-E, ECCN: EAR99, IR: PNNL-SA-161181**

This project is fully supported by the [Quantum Science Center (QSC)](https://qscience.org/).The Pacific Northwest National Laboratory (PNNL) is operated by Battelle for the U.S. Department of Energy (DOE) under contract DE-AC05-76RL01830. 

## Contributing

Please contact us If you'd like to contribute to SV-Sim. See the contact in our paper or my [webpage](http://www.angliphd.com).



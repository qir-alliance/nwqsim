// ---------------------------------------------------------------------------
// NWQsim: Northwest Quantum Circuit Simulation Environment
// ---------------------------------------------------------------------------
// Ang Li, Senior Computer Scientist
// Pacific Northwest National Laboratory(PNNL), U.S.
// Homepage: http://www.angliphd.com
// GitHub repo: http://www.github.com/pnnl/DM-Sim
// PNNL-IPID: 31919-E, ECCN: EAR99, IR: PNNL-SA-143160
// BSD Lincese.
// ---------------------------------------------------------------------------
// File: unit_test_nvgpu_sin.cuh
// Unit test for single GPU state-vector simulation with NVIDIA GPU backend.
// ---------------------------------------------------------------------------

#include <stdio.h>
#include <mpi.h>
#include "util.h"
#include "svsim_nvgpu_mpi.cuh"

using namespace NWQSim;
using namespace std;
#define TEST(X) pass = pass && X;

bool check_sv(Simulation& sim, ValType* sv_real_expected, 
        ValType* sv_imag_expected)
{
    bool pass = true;
    for (int i=0; i<sim.dim; i++)
    {
        ValType real_diff = abs(sv_real_expected[i] - sim.sv_real_cpu[i]);
        ValType imag_diff = abs(sv_imag_expected[i] - sim.sv_imag_cpu[i]);
        //printf("(%lf,%lf)",real_diff, imag_diff);
        if ( real_diff > ERROR_BAR || imag_diff > ERROR_BAR)
        {
            pass = false;
            break;
        }
    }
    return pass;
}


//============== X Gate ================
bool test_X()
{
    const int n_qubits = 4;
    const int dim = ((IdxType)1<<(n_qubits));
    bool pass = true;
    Simulation sim(n_qubits);

    sim.X(0);
    sim.CX(0,1);
    sim.SX(1);
    sim.RX(PI/8,0);
    sim.RY(PI/9,1);
    sim.H(1);
    sim.P(PI/5,0);
    sim.CX(1,0);
    sim.H(0);



    //sim.M(0);
    //sim.RESET(0);
    //sim.RESET(1);
    // 
    
    //sim.CU(PI/6,PI/7,PI/8,PI/9,0,1);
    //sim.Y(0);
    //sim.SX(0);
    //sim.S(0);
    //sim.T(0);

    sim.sim();
    sim.print_res_sv();
    //ValType sv_real_expected[dim] = {0,1};
    //ValType sv_imag_expected[dim] = {0,0};
    //pass = check_sv(sim, sv_real_expected, sv_imag_expected);
    //std::cout << "X gate test: " << (pass?"Success":"Failed") << std::endl;
    return pass;
}

int main(int argc, char *argv[])
{
    MPI_Init(&argc, &argv);
//=================================== Initialization =====================================
    bool pass = true;

    TEST(test_X());

    //std::cout << "\nUnit Test for NVGPU SIN " 
    //<< (pass?"Success":"Failed") << " !!!" << std::endl;


    MPI_Finalize();

    return 0;
}


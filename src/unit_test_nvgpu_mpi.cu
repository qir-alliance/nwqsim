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
#include "dmsim_nvgpu_mpi.cuh"

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
    const int n_qubits = 1;
    const int dim = ((IdxType)1<<(2*n_qubits));
    bool pass = true;
    Simulation sim;
    sim.AllocateQubit();
    sim.X(0);
    sim.sim();
    //sim.print_res_sv();
    ValType sv_real_expected[dim] = {0,0,0,1};
    ValType sv_imag_expected[dim] = {0,0,0,0};
    pass = check_sv(sim, sv_real_expected, sv_imag_expected);
    std::cout << "X gate test: " << (pass?"Success":"Failed") << std::endl;
    return pass;
}

bool test_CX()
{
    bool pass = true;
    Simulation sim;
    //sim.AllocateQubit();
    //sim.AllocateQubit();
    //sim.AllocateQubit();
    //sim.AllocateQubit();
    //sim.AllocateQubit();
    //sim.AllocateQubit();
    //sim.AllocateQubit();

    //sim.ID(0);




    //sim.X(5);
    //sim.SX(6);
    //sim.RZ(PI/7,6);
    //sim.SX(6);
    //sim.CX(5,6);



    
    //sim.X(2);
    //sim.X(3);
    //sim.X(4);
    //sim.X(5);
    //sim.X(6);

    //sim.ID(1);
    //sim.X(0);
    //sim.SX(0);
    //sim.RZ(PI/7,0);

    //==== For test 1-q fusion
    //sim.X(0);
    //sim.SX(0);
    //sim.X(2);
    //sim.X(3);
    //sim.RZ(PI/3,0);
    //sim.CX(0,5);
    //sim.X(2);
    //sim.RZ(PI/9,0);
    //sim.SX(5);
    //sim.SX(0);

    //==== For test 2-q fusion
    //sim.X(0);
    //sim.SX(3);
    //sim.CX(0,3);
    //sim.X(4);
    //sim.SX(0);
    //sim.RZ(PI/7,3);
    //sim.CX(0,3);
    //sim.CX(3,0);
    //sim.CX(0,3);


    sim.X(0);
    sim.CX(0,2);
    sim.CX(2,1);
    sim.CX(0,2);

    //sim.X(4);

    //sim.X(4);
    //sim.X(5);
    //sim.X(6);

    //sim.CX(1,0);
    //sim.CX(2,1);
    //sim.CX(3,2);

    //sim.CX(0,4);


    //sim.CX(5,4);


    IdxType* res = sim.measure_all(10);
    print_measurement(res,8,10);


    //sim.CX(5,4);
    //sim.CX(6,5);

    //sim.M(0);

    //sim.sim();
    //sim.print_res_sv();

    //IdxType res0 = sim.measure(0);
    //std::cout << "=== Measure result q-0: " << res0 << std::endl;
    //sim.print_res_sv();
    //IdxType res1 = sim.measure(1);
    //std::cout << "=== Measure result q-1: " << res1 << std::endl;
    //sim.print_res_sv();



    //ValType sv_real_expected[dim] = {0.5,0,0,0.5, 0,0,0,0, 0,0,0,0, 0.5,0,0,0.5};
    //ValType sv_imag_expected[dim] = {0};
    //pass = check_sv(sim, sv_real_expected, sv_imag_expected);
    //std::cout << "CX gate test: " << (pass?"Success":"Failed") << std::endl;
    return pass;
}


int main(int argc, char *argv[])
{
    MPI_Init(&argc, &argv);
//=================================== Initialization =====================================
    bool pass = true;

    //TEST(test_X());
    TEST(test_CX());
    //std::cout << "\nUnit Test for NVGPU SIN " 
    //<< (pass?"Success":"Failed") << " !!!" << std::endl;
    



    MPI_Finalize();

    return 0;
}


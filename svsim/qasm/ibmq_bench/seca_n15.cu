#include <stdio.h>
#include <mpi.h>
#include "../../src/util.h"
#include "../../src/svsim_nvgpu_mpi.cuh"
//Use the NWQSim namespace to enable C++/CUDA APIs
using namespace NWQSim;

void prepare_circuit(Simulation &sim)
{
	sim.RZ(3.14159265359, 0);
	sim.RZ(1.57079632679, 0);
	sim.SX(0);
	sim.RZ(1.57079632679, 0);
	sim.CX(0, 1);
	sim.CX(1, 0);
	sim.CX(0, 1);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.CX(1, 4);
	sim.CX(3, 5);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(6, 7);
	sim.CX(7, 6);
	sim.CX(6, 7);
	sim.CX(4, 7);
	sim.CX(4, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.RZ(3.14159265359, 1);
	sim.CX(1, 2);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(2, 3);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.CX(4, 7);
	sim.RZ(1.57079632679, 4);
	sim.SX(4);
	sim.RZ(1.57079632679, 4);
	sim.RZ(3.14159265359, 4);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 0);
	sim.RZ(1.57079632679, 0);
	sim.SX(0);
	sim.RZ(1.57079632679, 0);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(2, 3);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 4);
	sim.SX(4);
	sim.RZ(1.57079632679, 4);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(1, 0);
	sim.RZ(1.57079632679, 0);
	sim.SX(0);
	sim.RZ(1.57079632679, 0);
	sim.RZ(1.57079632679, 4);
	sim.SX(4);
	sim.RZ(1.57079632679, 4);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.CX(2, 3);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(3.14159265359, 7);
	sim.CX(7, 6);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.CX(6, 7);
	sim.CX(7, 6);
	sim.CX(6, 7);
	sim.CX(8, 11);
	sim.CX(11, 8);
	sim.CX(8, 11);
	sim.CX(10, 12);
	sim.CX(12, 10);
	sim.CX(10, 12);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(11, 14);
	sim.CX(14, 11);
	sim.CX(11, 14);
	sim.CX(13, 14);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(12, 10);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(13, 14);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(6, 7);
	sim.CX(7, 6);
	sim.CX(6, 7);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.CX(10, 12);
	sim.CX(12, 10);
	sim.CX(10, 12);
	sim.RZ(1.57079632679, 9);
	sim.SX(9);
	sim.RZ(1.57079632679, 9);
	sim.CX(8, 9);
	sim.CX(9, 8);
	sim.CX(8, 9);
	sim.CX(8, 11);
	sim.CX(11, 8);
	sim.CX(8, 11);
	sim.CX(11, 14);
	sim.CX(14, 11);
	sim.CX(11, 14);
	sim.CX(13, 14);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(13, 12);
	sim.CX(1, 2);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(10, 12);
	sim.CX(12, 10);
	sim.CX(10, 12);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.CX(4, 7);
	sim.RZ(1.57079632679, 4);
	sim.SX(4);
	sim.RZ(1.57079632679, 4);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.CX(10, 12);
	sim.CX(10, 12);
	sim.CX(12, 10);
	sim.CX(10, 12);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(7, 10);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(0, 1);
	sim.CX(1, 0);
	sim.CX(0, 1);
	sim.CX(13, 14);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(11, 14);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(14, 11);
	sim.CX(11, 14);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(0, 1);
	sim.CX(1, 0);
	sim.CX(0, 1);
	sim.CX(2, 1);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.CX(7, 10);
	sim.CX(10, 7);
	sim.CX(7, 10);
	sim.CX(12, 10);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(13, 14);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(12, 10);
	sim.RZ(1.57079632679, 10);
	sim.SX(10);
	sim.RZ(1.57079632679, 10);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(13, 14);
	sim.RZ(1.57079632679, 13);
	sim.SX(13);
	sim.RZ(1.57079632679, 13);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(10, 12);
	sim.RZ(-0.785398163397, 12);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(14, 13);
	sim.RZ(0.785398163397, 13);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(10, 12);
	sim.RZ(0.785398163397, 10);
	sim.RZ(-0.785398163397, 12);
	sim.CX(12, 13);
	sim.CX(13, 12);
	sim.CX(12, 13);
	sim.CX(10, 12);
	sim.CX(12, 10);
	sim.CX(10, 12);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(13, 12);
	sim.RZ(-0.785398163397, 12);
	sim.RZ(0.785398163397, 13);
	sim.CX(13, 12);
	sim.RZ(0.785398163397, 14);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.CX(1, 4);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(2, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.RZ(1.57079632679, 2);
	sim.SX(2);
	sim.RZ(1.57079632679, 2);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.CX(4, 7);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(1, 4);
	sim.RZ(1.57079632679, 2);
	sim.SX(2);
	sim.RZ(1.57079632679, 2);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(1, 4);
	sim.CX(2, 3);
	sim.RZ(-0.785398163397, 3);
	sim.RZ(-0.785398163397, 4);
	sim.CX(5, 3);
	sim.RZ(0.785398163397, 3);
	sim.CX(2, 3);
	sim.RZ(0.785398163397, 2);
	sim.RZ(-0.785398163397, 3);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(3, 2);
	sim.RZ(-0.785398163397, 2);
	sim.RZ(0.785398163397, 3);
	sim.CX(3, 2);
	sim.RZ(0.785398163397, 5);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.CX(7, 4);
	sim.RZ(0.785398163397, 4);
	sim.CX(1, 4);
	sim.RZ(0.785398163397, 1);
	sim.RZ(-0.785398163397, 4);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(4, 1);
	sim.RZ(-0.785398163397, 1);
	sim.RZ(0.785398163397, 4);
	sim.CX(4, 1);
	sim.RZ(0.785398163397, 7);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.CX(13, 14);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(12, 13);
	sim.RZ(-0.785398163397, 13);
	sim.CX(14, 13);
	sim.RZ(0.785398163397, 13);
	sim.CX(12, 13);
	sim.RZ(0.785398163397, 12);
	sim.RZ(-0.785398163397, 13);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(14, 13);
	sim.CX(13, 14);
	sim.CX(13, 12);
	sim.RZ(-0.785398163397, 12);
	sim.RZ(0.785398163397, 13);
	sim.CX(13, 12);
	sim.RZ(0.785398163397, 14);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(2, 3);
	sim.RZ(-0.785398163397, 3);
	sim.CX(5, 3);
	sim.RZ(0.785398163397, 3);
	sim.CX(2, 3);
	sim.RZ(0.785398163397, 2);
	sim.RZ(-0.785398163397, 3);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(3, 2);
	sim.RZ(-0.785398163397, 2);
	sim.RZ(0.785398163397, 3);
	sim.CX(3, 2);
	sim.RZ(0.785398163397, 5);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(1, 4);
	sim.RZ(-0.785398163397, 4);
	sim.CX(7, 4);
	sim.RZ(0.785398163397, 4);
	sim.CX(1, 4);
	sim.RZ(0.785398163397, 1);
	sim.RZ(-0.785398163397, 4);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(4, 1);
	sim.RZ(-0.785398163397, 1);
	sim.RZ(0.785398163397, 4);
	sim.CX(4, 1);
	sim.RZ(0.785398163397, 7);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(1.57079632679, 14);
	sim.SX(14);
	sim.RZ(1.57079632679, 14);
	sim.RZ(3.14159265359, 14);
	sim.CX(11, 14);
	sim.CX(14, 11);
	sim.CX(11, 14);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.RZ(3.14159265359, 5);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.RZ(1.57079632679, 7);
	sim.SX(7);
	sim.RZ(1.57079632679, 7);
	sim.RZ(3.14159265359, 7);
	sim.CX(4, 7);
	sim.CX(7, 4);
	sim.CX(4, 7);
	sim.CX(1, 4);
	sim.CX(4, 1);
	sim.CX(1, 4);
	sim.CX(1, 2);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(8, 11);
	sim.CX(11, 8);
	sim.CX(8, 11);
	sim.CX(5, 8);
	sim.CX(8, 5);
	sim.CX(5, 8);
	sim.CX(3, 5);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(2, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.CX(3, 5);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(1.57079632679, 5);
	sim.SX(5);
	sim.RZ(1.57079632679, 5);
	sim.CX(5, 3);
	sim.RZ(-0.785398163397, 3);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 2);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(5, 3);
	sim.RZ(-0.785398163397, 3);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.RZ(1.57079632679, 1);
	sim.SX(1);
	sim.RZ(1.57079632679, 1);
	sim.RZ(0.785398163397, 5);
	sim.CX(3, 5);
	sim.CX(5, 3);
	sim.CX(3, 5);
	sim.CX(2, 3);
	sim.RZ(0.785398163397, 2);
	sim.RZ(-0.785398163397, 3);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.CX(2, 1);
	sim.CX(1, 2);
	sim.CX(3, 2);
	sim.RZ(-0.785398163397, 2);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 2);
	sim.CX(3, 2);
	sim.RZ(-0.785398163397, 2);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 3);
	sim.CX(2, 3);
	sim.CX(3, 2);
	sim.CX(2, 3);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 1);
	sim.RZ(-0.785398163397, 2);
	sim.CX(1, 2);
	sim.RZ(0.785398163397, 3);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(1.57079632679, 3);
	sim.SX(3);
	sim.RZ(1.57079632679, 3);
	sim.RZ(3.14159265359, 3);
}

int main(int argc, char *argv[])
{
	MPI_Init(&argc, &argv);
	Simulation sim(15);
	prepare_circuit(sim);
    auto* res = sim.measure_all(10);
    if (sim.i_gpu==0) printf("\n -------- seca_n15 ---------\n");
    if (sim.i_gpu==0) print_measurement(res,15,10);
	MPI_Finalize();
	return 0;
}

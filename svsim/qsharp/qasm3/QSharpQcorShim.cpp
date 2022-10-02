// Copyright (c) Microsoft Corporation.

// Shim for using Type1.Core gate set with a QSharp.Core simulator.

#include <stdexcept>
#include "QirTypes.hpp"
#include "QirContext.hpp"
#include "QirRuntime.hpp"

// #include "SimFactory.hpp"
extern "C" Microsoft::Quantum::IRuntimeDriver* GetSVSim(); 

extern "C"
{
    QIR_SHARED_API void __quantum__qis__x__ctl(QirArray* controls, Qubit qubit); // NOLINT
    void __quantum__qis__cnot__body(Qubit control, Qubit target) // NOLINT
    {
        QirArray* controls = __quantum__rt__array_create_1d(sizeof(Qubit), 1);
        *(Qubit*)__quantum__rt__array_get_element_ptr_1d(controls, 0) = control;
        __quantum__qis__x__ctl(controls, target);
        __quantum__rt__array_update_reference_count(controls, -1);
    }
    void __quantum__qis__cnot(Qubit control, Qubit target) // NOLINT
    {
        __quantum__qis__cnot__body(control, target);
    }
    void __quantum__qis__swap(Qubit q1, Qubit q2) // NOLINT
    {
        __quantum__qis__cnot__body(q1, q2);
        __quantum__qis__cnot__body(q2, q1);
        __quantum__qis__cnot__body(q1, q2);
    }

    QIR_SHARED_API void __quantum__qis__z__ctl(void* controls, Qubit qubit); // NOLINT
    void __quantum__qis__cz__body(Qubit control, Qubit target) // NOLINT
    {
        QirArray* controls = __quantum__rt__array_create_1d(sizeof(Qubit), 1);
        *(Qubit*)__quantum__rt__array_get_element_ptr_1d(controls, 0) = control;
        __quantum__qis__z__ctl(controls, target);
        __quantum__rt__array_update_reference_count(controls, -1);
    }
    void __quantum__qis__cz(Qubit control, Qubit target) // NOLINT
    {
        __quantum__qis__cz__body(control, target);
    }

    QIR_SHARED_API void __quantum__qis__r__body(PauliId pauli, double theta, Qubit qubit); // NOLINT
    void __quantum__qis__rx__body(double theta, Qubit qubit) // NOLINT
    {
        __quantum__qis__r__body(PauliId_X, theta, qubit);
    }
    void __quantum__qis__ry__body(double theta, Qubit qubit) // NOLINT
    {
        __quantum__qis__r__body(PauliId_Y, theta, qubit);
    }
    void __quantum__qis__rz__body(double theta, Qubit qubit) // NOLINT
    {
        __quantum__qis__r__body(PauliId_Z, theta, qubit);
    }
    void __quantum__qis__rz(double theta, Qubit qubit) // NOLINT
    {
        __quantum__qis__rz__body(theta, qubit);
    }

    void __quantum__qis__cphase(double theta, Qubit control, Qubit target) // NOLINT
    {
        double updatedTheta = theta / 2.0;
        __quantum__qis__rz__body(updatedTheta, target);
        __quantum__qis__rz__body(updatedTheta, control);
        __quantum__qis__cnot__body(control, target);
        __quantum__qis__rz__body(-updatedTheta, target);
        __quantum__qis__cnot__body(control, target);
    }

    QIR_SHARED_API Result __quantum__qis__measure__body(QirArray* paulis, QirArray* qubits); // NOLINT
    Result __quantum__qis__m__body(Qubit qubit) // NOLINT
    {
        QirArray* target = __quantum__rt__array_create_1d(sizeof(Qubit), 1);
        QirArray* paulis = __quantum__rt__array_create_1d(sizeof(PauliId), 1);
        *(Qubit*)__quantum__rt__array_get_element_ptr_1d(target, 0) = qubit;
        *__quantum__rt__array_get_element_ptr_1d(paulis, 0) = PauliId_Z;
        auto res = __quantum__qis__measure__body(paulis, target);
        __quantum__rt__array_update_reference_count(target, -1);
        __quantum__rt__array_update_reference_count(paulis, -1);
        return res;
    }
    Result __quantum__qis__mz(Qubit qubit) // NOLINT
    {
        auto res = __quantum__qis__m__body(qubit);
        bool* bit = new bool();
        *bit = __quantum__rt__result_equal(res, __quantum__rt__result_get_one());
        return reinterpret_cast<Result>(bit);
    }

    QIR_SHARED_API void __quantum__qis__x__body(Qubit); // NOLINT
    QIR_SHARED_API bool __quantum__rt__result_equal(Result, Result); // NOLINT
    QIR_SHARED_API Result __quantum__rt__result_get_one(); // NOLINT
    void __quantum__qis__reset__body(Qubit qubit) // NOLINT
    {
        auto result = __quantum__qis__m__body(qubit);
        if (__quantum__rt__result_equal(result, __quantum__rt__result_get_one()))
        {
            __quantum__qis__x__body(qubit);
        }
    }
    void __quantum__qis__reset(Qubit qubit) // NOLINT
    {
        __quantum__qis__reset__body(qubit);
    }

    QIR_SHARED_API void __quantum__qis__h__body(Qubit); // NOLINT
    void __quantum__qis__h(Qubit qubit) // NOLINT
    {
        __quantum__qis__h__body(qubit);
    }

    QIR_SHARED_API void __quantum__qis__y__body(Qubit); // NOLINT
    void __quantum__qis__y(Qubit qubit) // NOLINT
    {
        __quantum__qis__y__body(qubit);
    }

    QIR_SHARED_API void __quantum__qis__z__body(Qubit); // NOLINT
    void __quantum__qis__z(Qubit qubit) // NOLINT
    {
        __quantum__qis__z__body(qubit);
    }

    QIR_SHARED_API void __quantum__qis__t__body(Qubit); // NOLINT
    QIR_SHARED_API void __quantum__qis__t__adj(Qubit); // NOLINT
    void __quantum__qis__t(Qubit qubit) // NOLINT
    {
        __quantum__qis__t__body(qubit);
    }

    QIR_SHARED_API void __quantum__qis__x__body(Qubit); // NOLINT
    void __quantum__qis__x(Qubit qubit) // NOLINT
    {
        __quantum__qis__x__body(qubit);
    }



    void __quantum__qis__ccx(Qubit control1, Qubit control2, Qubit target) // NOLINT
    {
        __quantum__qis__h__body(target);
        __quantum__qis__t__adj(control1);
        __quantum__qis__t__adj(control2);
        __quantum__qis__cnot__body(target, control1);
        __quantum__qis__t__body(control1);
        __quantum__qis__cnot__body(control2, target);
        __quantum__qis__cnot__body(control2, control1);
        __quantum__qis__t__body(target);
        __quantum__qis__t__adj(control1);
        __quantum__qis__cnot__body(control2, target);
        __quantum__qis__cnot__body(target, control1);
        __quantum__qis__t__adj(target);
        __quantum__qis__t__body(control1);
        __quantum__qis__cnot__body(control2, control1);
        __quantum__qis__h__body(target);
    }

    void __quantum__rt__set_external_qreg(void*) {} // NOLINT
    void __quantum__rt__finalize() {} // NOLINT
    void __quantum__rt__set_config_parameter(char*, char*) {} // NOLINT
    int32_t __quantum__rt__initialize(int32_t, char**) // NOLINT
    {
        // auto sim = Microsoft::Quantum::CreateFullstateSimulator();
        // Microsoft::Quantum::InitializeQirContext(sim.release(), false);
        Microsoft::Quantum::InitializeQirContext(GetSVSim(), false);
        return 0;
    }
}
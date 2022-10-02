OPENQASM 3;

// Implements the 5 qubit perfect code for quantum error correction.
// Based on the Q# library at:
// https://github.com/microsoft/QuantumLibraries/blob/main/Standard/src/ErrorCorrection/5QubitCode.qs

// Set up for a joint XXZZ measurement of |q1 q2 q3 q4⟩ using aux.
def check_parity qubit:q1, qubit:q2, qubit:q3, qubit:q4, qubit:aux {
    reset aux;
    h aux;
    cnot aux, q1;
    cnot aux, q2;
    cz aux, q3;
    cz aux, q4;
    h aux;
}

// Encode the state from the first qubit into the remaining 4, creating
// the five qubit logical register.
def encode qubit[5]:qq {
    cnot qq[0], qq[2];
    h qq[0];
    h qq[1];
    cnot qq[0], qq[3];
    cnot qq[1], qq[0];
    cnot qq[0], qq[2];
    cnot qq[1], qq[4];
    h qq[1];
    h qq[0];
    cnot qq[1], qq[3];
    cnot qq[0], qq[4];
    x qq[3];
}

// Decode the 5 qubit register into a single qubit state, storing into
// the first qubit. This is the inverse of the encode function.
def decode qubit[5]:qq {
    x qq[3];
    cnot qq[0], qq[4];
    cnot qq[1], qq[3];
    h qq[0];
    h qq[1];
    cnot qq[1], qq[4];
    cnot qq[0], qq[2];
    cnot qq[1], qq[0];
    cnot qq[0], qq[3];
    h qq[1];
    h qq[0];
    cnot qq[0], qq[2];
}

// Based on the provided syndrome measurements, apply Pauli corrections
// to the register to correct single qubit errors.
def apply_correction(bit[4]:parity_check) qubit[5]:qq {
    if (parity_check[0] == 0 && parity_check[1] == 0) {
        if (parity_check[2] == 0 && parity_check[3] == 1) {
            x qq[1];
        } else {
            if (parity_check[2] == 1 && parity_check[3] == 0) {
                z qq[4];
            } else {
                if (parity_check[2] == 1 && parity_check[3] == 1) {
                    x qq[2];
                }
            }
        }
    } else {
        if (parity_check[0] == 0 && parity_check[1] == 1) {
            if (parity_check[2] == 0 && parity_check[3] == 1) {
                z qq[0];
            } else {
                if (parity_check[2] == 1 && parity_check[3] == 0) {
                    x qq[3];
                } else {
                    if (parity_check[2] == 1 && parity_check[3] == 1) {
                        y qq[2];
                    } else {
                        z qq[2];
                    }
                }
            }
        } else {
            if (parity_check[0] == 1 && parity_check[1] == 0) {
                if (parity_check[2] == 0 && parity_check[3] == 1) {
                    z qq[3];
                } else {
                    if (parity_check[2] == 1 && parity_check[3] == 0) {
                        z qq[1];
                    } else {
                        if (parity_check[2] == 1 && parity_check[3] == 1) {
                            y qq[1];
                        } else {
                            x qq[0];
                        }
                    }
                }
            } else {
                if (parity_check[0] == 1 && parity_check[1] == 1) {
                    if (parity_check[2] == 0 && parity_check[3] == 1) {
                        y qq[0];
                    } else {
                        if (parity_check[2] == 1 && parity_check[3] == 0) {
                            y qq[4];
                        } else {
                            if (parity_check[2] == 1 && parity_check[3] == 1) {
                                y qq[3];
                            } else {
                                x qq[4];
                            }
                        }
                    }
                }
            }
        }
    }
}

qubit qq[5];
qubit aux;

bit parity_check[4];
bit result;

// Start with an initial |+⟩ state in the target qubit.
h qq[0];

// Encode into the rest of the register.
encode qq;

// Apply a logical Z to the register.
for i in [0:5] {
    z qq[i];
}

// Perform the joint measurements to identify the syndrome.
check_parity qq[0], qq[3], qq[1], qq[2], aux;
measure aux -> parity_check[0];
check_parity qq[1], qq[4], qq[2], qq[3], aux;
measure aux -> parity_check[1];
check_parity qq[0], qq[2], qq[3], qq[4], aux;
measure aux -> parity_check[2];
check_parity qq[1], qq[3], qq[0], qq[4], aux;
measure aux -> parity_check[3];

// Apply any needed Pauli corrections.
apply_correction(parity_check) qq;

// Decode the register back into the first qubit.
decode qq;

// We expect to be in the |-⟩ state, so Hadamard and measure
// should return 1 if error correction was successful.
h qq[0];
measure qq[0] -> result;
if (result) {
    if (parity_check[0] == 0 && parity_check[1] == 0) {
        if (parity_check[2] == 0 && parity_check[3] == 0) {
            print("Success");
        } else {
            print("Corrected Success");
        }
    } else {
        print("Corrected Success");
    }
} else {
    if (parity_check[0] == 0 && parity_check[1] == 0) {
        if (parity_check[2] == 0 && parity_check[3] == 0) {
            printf("Failure");
        } else {
            printf("Corrected Failure");
        }
    } else {
        printf("Corrected Failure");
    }
}

for i in [0:5] {
    reset qq[i];
}
reset aux;

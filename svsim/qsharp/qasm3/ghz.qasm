OPENQASM 3;

const n_qubits = 4;

qubit q[n_qubits];

gate ctrl_x a, b {
    ctrl @ x a, b;
}

h q[0];
for i in [0:n_qubits-1] {
    ctrl_x q[i], q[i+1];
}

bit c[n_qubits];
for i in [0:n_qubits] {
    c[i] = measure q[i];
    print(c[i]);
}
OPENQASM 3;

qubit q;
bit result;

h q;
z q;
h q;

measure q -> result;

if (result) {
    print("Success");
} else {
    print("Failure");
}
OPENQASM 3;

/// Example of a Repeat-until-success algorithm implementing a circuit 
/// that achieves (I + i√2X)/√3 by Paetznick & Svore. This is the smallest
/// circuit found in the referenced work and described in figure 8.
/// # References
/// - [ *Adam Paetznick, Krysta M. Svore*,
///     Quantum Information & Computation 14(15 & 16): 1277-1301 (2014)
///   ](https://arxiv.org/abs/1311.1074)
/// The program executes a circuit on a "target" qubit using an "auxiliary"
/// qubit.
/// The goal is to measure Zero for the auxiliary qubit.
/// If this succeeds, the program will have effectively applied an 
/// (I + i√2X)/√3 gate on the target qubit.
/// Based on the Q# sample from https://github.com/microsoft/Quantum/blob/main/samples/algorithms/repeat-until-success/SimpleRUS.qs

gate ctrl_x a, b {
    ctrl @ x a, b;
}

def simplerus qubit[2]:qq {
    h qq[0];
    t qq[0];
    ctrl_x qq[0], qq[1];
    h qq[0];
    ctrl_x qq[0], qq[1];
    t qq[0];
    h qq[0];
}

qubit qq[2];

bit auxresult = "1";
bit targetresult;
int iterations = 0;

while (auxresult) {
    simplerus qq;
    measure qq[0] -> auxresult;
    reset qq[0];
    iterations += 1;
}

measure qq[1] -> targetresult;

print(iterations);
print(targetresult);
OPENQASM 3;

// Random Walk Phase Estimation
// For more information on Phase Estimation algorithms, see:
// https://docs.microsoft.com/en-us/azure/quantum/user-guide/libraries/standard/characterization

// This is the phase used by the Rz oracle that the random walk will estimate.
double phase = 0.314;

int n_iterations = 100;
int iteration = 0;

double mu = 0.7951;
double sigma = 0.6065;
double theta;
double time;
double c_theta;

qubit target;
qubit aux;
bit result;

// Set up the initial qubit in the |1⟩ state. This qubit must remain coherent for the 
// duration of the iterations below.
x target;

while (iteration < n_iterations) {

    // In each iteration, execute the oracle rotation on the target qubit with the aux
    // as the control, progressively adjusting our phase estimate based on measurements.

    theta = mu - (pi * sigma / 2);
    time = 1 / sigma;

    h aux;
    rz(-1 * theta * time) aux;
    c_theta = phase * time / 2;
    rz(c_theta) target;
    cnot aux, target;
    rz(-1 * c_theta) target;
    cnot aux, target;
    h aux;
    measure aux -> result;
    reset aux;

    if (result) {
        mu += sigma * 0.6065;
    } else {
        mu -= sigma * 0.6065;
    }
    sigma *= 0.7951;

    iteration += 1;
}

reset target;

print(mu * 2);
//This file archives the code that might be useful for SV-Sim


//==================== Qubit Remapping =====================
    Circuit(IdxType _n_qubits=0):
        n_qubits(_n_qubits), n_gates(0), circuit_gpu(NULL), is_reset(true)
    {}

    Circuit(IdxType _n_qubits=0):
        n_qubits(_n_qubits), n_gates(0), circuit_gpu(NULL), is_reset(true)
    {
        for (IdxType i=0; i<N_QUBIT_SLOT; i++) qmap[i] = 0;
        for (IdxType i=0; i<N_QUBIT_SLOT; i++) stat[i] = 0;
    }

    void reset()
    {
        clear();
        for (IdxType i=0; i<N_QUBIT_SLOT; i++) qmap[i] = -1;
        for (IdxType i=0; i<N_QUBIT_SLOT; i++) stat[i] = -1;
        is_reset = true;
    }

    void qubit_remap(const vector<Gate>& circuit_in, vector<Gate>& circuit_out)
    {
        if (is_reset)
        {
            for (IdxType i=0; i<circuit_in.size(); i++)
            {
                stat[circuit_in[i].qubit]++;
                if (circuit_in[i].ctrl != -1) stat[circuit_in[i].ctrl]++;
            }
            printf("\n=======stat========\n");
            for (int i=0; i<n_qubits; i++) printf("%lld ",stat[i]);
            printf("\n==================\n");
            for (IdxType i=0; i<n_qubits; i++)
            {
                IdxType max_id = 0;
                for (IdxType j=0; j<n_qubits; j++)
                    if (stat[j] > stat[i])
                        max_id = j;
                stat[max_id] = 0;
                qmap[i] = max_id;
            }
            is_reset = false;
            printf("\n=======qmap========\n");
            for (int i=0; i<n_qubits; i++) printf("%lld=>%lld ",i,qmap[i]);
            printf("\n==================\n");
        }
        printf("\n=======gate map========\n");
        for (IdxType i=0; i<n_gates; i++)
            printf("%s(qubit:%lld=>%lld,ctrl:%lld=>%lld)\n",
                    OP_NAMES[circuit_in[i].op_name], 
                    circuit_in[i].qubit, qmap[circuit_in[i].qubit],
                    circuit_in[i].ctrl, qmap[circuit_in[i].ctrl]);
        printf("\n==================\n");

        for (IdxType i=0; i<circuit_in.size(); i++)
        {
            circuit_out.push_back(circuit_in[i]);
            circuit_out[i].qubit = qmap[circuit_in[i].qubit];
            if (circuit_in[i].ctrl != -1)
                circuit_out[i].ctrl = qmap[circuit_in[i].ctrl];
        }
    }

    // for qubit remapping
    bool is_reset;
    IdxType qmap[N_QUBIT_SLOT];
    IdxType stat[N_QUBIT_SLOT];



//==================== Fuse 1-qubit gates and 2-qubit gates =====================
    void expand_ctrl(const Gate& g0, Gate& g, const IdxType ctrl) //This is to krok I for the ctrl qubit position
    {
        Gate gI(OP::C2, ctrl, -1, 0);
        gI.gm_real[0] = gI.gm_real[5] = gI.gm_real[10] = gI.gm_real[15] = 1; //set I
        kron(g0, gI, g, 4);
    }

    void expand_qubit(const Gate& g0, Gate& g, const IdxType qubit)
    {
        Gate gI(OP::C2, qubit, -1, 0);
        gI.gm_real[0] = gI.gm_real[5] = gI.gm_real[10] = gI.gm_real[15] = 1; //set I
        kron(gI, g0, g, 4);
    }

    void gate_fusion_2q_absorb_1q()
    {
        //prepare
        IdxType* table = new IdxType[n_qubits*n_qubits];
        bool* canfuse = new bool[n_qubits*n_qubits];
        for (IdxType i=0; i<n_qubits*n_qubits; i++) table[i] = -1;
        for (IdxType i=0; i<n_qubits*n_qubits; i++) canfuse[i] = false;
        vector<Gate> tmp_circuit;
        fused_circuit.clear();
        tmp_circuit.clear();

        //forward parse
        for (IdxType i=0; i<n_gates; i++)
        {
            if (circuit[i].op_name == C2) //1-qubit gate
            {
                IdxType qubit = circuit[i].qubit;
                bool fused = false;
                for (IdxType j=0; j<n_qubits; j++)
                {
                    if (canfuse[j*n_qubits+qubit] == true)
                    {
                        const Gate& g0 = circuit[i];
                        Gate& g1 = fused_circuit[table[j*n_qubits+qubit]];
                        Gate expand_g(OP::C4,-1,-1,0);
                        Gate final_g(OP::C4,-1,-1,0);
                        expand_ctrl(g0, expand_g, j);
                        //now ready to fuse
                        fuse_gate(expand_g, g1, final_g, 16); 
                        memcpy(g1.gm_real, final_g.gm_real, 256*sizeof(ValType));
                        memcpy(g1.gm_imag, final_g.gm_imag, 256*sizeof(ValType));
                        fused = true;
                        break;
                    }
                    if (canfuse[qubit*n_qubits+j] == true)
                    {
                        const Gate& g0 = circuit[i];
                        Gate& g1 = fused_circuit[table[qubit*n_qubits+j]];

                        Gate expand_g(OP::C4,-1,-1,0);
                        expand_qubit(g0, expand_g, j);

                        //now ready to fuse
                        Gate final_g(OP::C4,-1,-1,0);
                        fuse_gate(expand_g, g1, final_g, 16); 

                        memcpy(g1.gm_real, final_g.gm_real, 256*sizeof(ValType));
                        memcpy(g1.gm_imag, final_g.gm_imag, 256*sizeof(ValType));
                        fused = true;
                        break;
                    }
                }
                if (fused == false) //did not fuse with any C4 gate, add it
                {
                    for (IdxType j=0; j<n_qubits; j++)
                    {
                        canfuse[j*n_qubits+qubit] = false;
                        canfuse[qubit*n_qubits+j] = false;
                    }
                    fused_circuit.push_back(*(new Gate(circuit[i])));
                }
            }
            if (circuit[i].op_name == C4) //2-qubit gate
            {
                IdxType qubit = circuit[i].qubit;
                IdxType ctrl = circuit[i].ctrl;
                for (IdxType j=0; j<n_qubits; j++)
                {
                    canfuse[j*n_qubits+qubit] = false;
                    canfuse[qubit*n_qubits+j] = false;
                    canfuse[j*n_qubits+ctrl] = false;
                    canfuse[ctrl*n_qubits+j] = false;
                }
                fused_circuit.push_back(*(new Gate(circuit[i])));
                canfuse[ctrl*n_qubits+qubit] = true;
                table[ctrl*n_qubits+qubit] = fused_circuit.size()-1; //this gate can fuse
            }
            if (circuit[i].op_name == M) //1-qubit measure gate
            {
                IdxType qubit = circuit[i].qubit;
                for (IdxType j=0; j<n_qubits; j++)
                {
                    canfuse[j*n_qubits+qubit] = false;
                    canfuse[qubit*n_qubits+j] = false;
                }
                fused_circuit.push_back(*(new Gate(circuit[i])));
            }
            if (circuit[i].op_name == RESET) //1-qubit reset gate
            {
                IdxType qubit = circuit[i].qubit;
                for (IdxType j=0; j<n_qubits; j++)
                {
                    canfuse[j*n_qubits+qubit] = false;
                    canfuse[qubit*n_qubits+j] = false;
                }
                fused_circuit.push_back(*(new Gate(circuit[i])));
            }
            if (circuit[i].op_name == MA) //all-qubit measure gate
            {
                for (IdxType j=0; j<n_qubits; j++)
                    for (IdxType k=0; k<n_qubits; k++)
                        canfuse[j*n_qubits+k] = false;
                fused_circuit.push_back(*(new Gate(circuit[i])));
            }
        }
        //clean
        delete[] table;
        delete[] canfuse;
    }



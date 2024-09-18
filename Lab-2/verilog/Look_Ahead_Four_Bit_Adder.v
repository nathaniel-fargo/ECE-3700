module Look_Ahead_Four_Bit_Adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Out,
    output Cout
);
	
    wire [3:0] P; // Propagate signals
    wire [3:0] G; // Generate signals
    wire C1, C2, C3; // Intermediate carry signals

    // Instantiate XOR gates for Propagate signals: P = A XOR B
    xor (P[0], A[0], B[0]);
    xor (P[1], A[1], B[1]);
    xor (P[2], A[2], B[2]);
    xor (P[3], A[3], B[3]);

    // Instantiate AND gates for Generate signals: G = A AND B
    and (G[0], A[0], B[0]);
    and (G[1], A[1], B[1]);
    and (G[2], A[2], B[2]);
    and (G[3], A[3], B[3]);

    // C1 = G[0] + (P[0] * Cin)
    wire w1_1; // Intermediate wire for P[0] * Cin
    and (w1_1, P[0], Cin);
    or (C1, G[0], w1_1);

    // C2 = G[1] + (P[1] * G[0]) + (P[1] * P[0] * Cin)
    wire w2_1, w2_2; // Intermediate wires for P[1] * G[0] and P[1] * P[0] * Cin
    and (w2_1, P[1], G[0]);
    and (w2_2, P[1], P[0], Cin);
    or (C2, G[1], w2_1, w2_2);

    // C3 = G[2] + (P[2] * G[1]) + (P[2] * P[1] * G[0]) + (P[2] * P[1] * P[0] * Cin)
    wire w3_1, w3_2, w3_3; // Intermediate wires for each term
    and (w3_1, P[2], G[1]);
    and (w3_2, P[2], P[1], G[0]);
    and (w3_3, P[2], P[1], P[0], Cin);
    or (C3, G[2], w3_1, w3_2, w3_3);

    // Cout = G[3] + (P[3] * G[2]) + (P[3] * P[2] * G[1]) + (P[3] * P[2] * P[1] * G[0]) + (P[3] * P[2] * P[1] * P[0] * Cin)
    wire w4_1, w4_2, w4_3, w4_4; // Intermediate wires for each term
    and (w4_1, P[3], G[2]);
    and (w4_2, P[3], P[2], G[1]);
    and (w4_3, P[3], P[2], P[1], G[0]);
    and (w4_4, P[3], P[2], P[1], P[0], Cin);
    or (Cout, G[3], w4_1, w4_2, w4_3, w4_4);

    // Sum calculation: Sum = P XOR C (for each bit)
    xor (Out[0], P[0], Cin);
    xor (Out[1], P[1], C1);
    xor (Out[2], P[2], C2);
    xor (Out[3], P[3], C3);

endmodule
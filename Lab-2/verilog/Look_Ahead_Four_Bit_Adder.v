module Look_Ahead_Four_Bit_Adder (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] out,
    output cout
);
	
    wire [3:0] P; // Propagate signals
    wire [3:0] G; // Generate signals
    wire C1, C2, C3; // Intermediate carry signals

    // Instantiate XOR gates for Propagate signals: P = A XOR B (may or may not carry)
    xor (P[0], a[0], b[0]);
    xor (P[1], a[1], b[1]);
    xor (P[2], a[2], b[2]);
    xor (P[3], a[3], b[3]);

    // Instantiate AND gates for Generate signals: G = A AND B (will carry)
    and (G[0], a[0], b[0]);
    and (G[1], a[1], b[1]);
    and (G[2], a[2], b[2]);
    and (G[3], a[3], b[3]);

    // C1 = G[0] + (P[0] * Cin)
    wire w1_1; 
    and (w1_1, P[0], cin);
    or (C1, G[0], w1_1);

    // C2 = G[1] + (P[1] * G[0]) + (P[1] * P[0] * Cin)
    wire w2_1, w2_2; 
    and (w2_1, P[1], G[0]);
    and (w2_2, P[1], P[0], cin);
    or (C2, G[1], w2_1, w2_2);

    // C3 = G[2] + (P[2] * G[1]) + (P[2] * P[1] * G[0]) + (P[2] * P[1] * P[0] * Cin)
    wire w3_1, w3_2, w3_3;
    and (w3_1, P[2], G[1]);
    and (w3_2, P[2], P[1], G[0]);
    and (w3_3, P[2], P[1], P[0], cin);
    or (C3, G[2], w3_1, w3_2, w3_3);

    // Cout = G[3] + (P[3] * G[2]) + (P[3] * P[2] * G[1]) + (P[3] * P[2] * P[1] * G[0]) + (P[3] * P[2] * P[1] * P[0] * Cin)
    // so big
    wire w4_1, w4_2, w4_3, w4_4; 
    and (w4_1, P[3], G[2]);
    and (w4_2, P[3], P[2], G[1]);
    and (w4_3, P[3], P[2], P[1], G[0]);
    and (w4_4, P[3], P[2], P[1], P[0], cin);
    or (cout, G[3], w4_1, w4_2, w4_3, w4_4);

    // Sum calculation: Sum = P XOR C (for each bit)
    xor (out[0], P[0], cin);
    xor (out[1], P[1], C1);
    xor (out[2], P[2], C2);
    xor (out[3], P[3], C3);

endmodule
module Structural (
	input [1:0] A,
	input [1:0] B,
	input [1:0] I,
	output [1:0] F
);
	
	wire [1:0] _I;
	not(_I[0],I[0]);
	not(_I[1],I[1]);
//	
	wire I00, I01, I10, I11;
	wire [1:0] andAB, orAB, xnorAB, notA;
	wire [1:0] out0, out1, out2, out3;

	// Create versions of I
	and (I00, _I[1], _I[0]);
	and (I01, _I[1], I[0]);
	and (I10, I[1], _I[0]);
	and (I11, I[1], I[0]);

	// AND gates
	and (andAB[0], A[0], B[0]);
	and (andAB[1], A[1], B[1]);
	
	// OR gates
	or (orAB[0], A[0], B[0]);
	or (orAB[1], A[1], B[1]);

	// XNOR gates
	xnor (xnorAB[0], A[0], B[0]);
	xnor (xnorAB[1], A[1], B[1]);

	// NOT gates
	not (notA[0], A[0]);
	not (notA[1], A[1]);

	// Define outputs based on I inputs and previous logic
	and (out0[0], I00, andAB[0]);
	and (out0[1], I00, andAB[1]);

	and (out1[0], I01, orAB[0]);
	and (out1[1], I01, orAB[1]);

	and (out2[0], I10, xnorAB[0]);
	and (out2[1], I10, xnorAB[1]);

	and (out3[0], I11, notA[0]);
	and (out3[1], I11, notA[1]);

	// Combine results into F
	or (F[0], out0[0], out1[0], out2[0], out3[0]);
	or (F[1], out0[1], out1[1], out2[1], out3[1]);
	
endmodule
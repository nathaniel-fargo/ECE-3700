module Structural1 (
	input [1:0] A,
	input [1:0] B,
	input [1:0] I,
	output [1:0] F
);
	
	wire [1:0] _I;
	not(_I,I);
	
	wire I00, I01, I10, I11;
	
	and(I00, _I[1], _I[0]);
	and(I01, _I[1], I[0]);
	and(I10, I[1], _I[0]);
	and(I11, I[1], I[0]);
	
	wire [1:0] andAB, orAb, xnorAB, notA;
	
	
	and(andAB, A, B);
	or(orAB, A, B);
	xnor(xnorAB, A, B);
	not(notA, A);
	
	wire [1:0] out0, out1, out2, ou3;
	
	
	and(out0, I00, andAB);
	and(out1, I01, orAB);
	and(out2, I10, xnorAB);
	and(out3, I11, notA);
	
	or(F, out0, out1, out2, out3);
	
endmodule
	
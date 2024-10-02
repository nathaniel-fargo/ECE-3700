module Top (
	input [3:0] A,
	input [3:0] B,
	output [2:0] F
	);
	
	Comparator comp_inst (
		.A(A),
		.B(B),
		.C(C),
		.F(F)
	);

endmodule
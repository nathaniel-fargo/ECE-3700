module Top (
	input [1:0] A,
	input [1:0] B,
	input [1:0] I,
	output [1:0] F
);

	Structural struct_inst(
		.A(A),
		.B(B),
		.I(I),
		.F(F)
	);

endmodule
module Top (
	input [3:0] A,
	input [3:0] B,
	output [4:0] S
	);
	
	Look_Ahead_Four_Bit_Adder four_bit_adder_inst (
		.A(A),
		.B(B),
		.Cin(1'b0),
		.Out(S[3:0]),
		.Cout(S[4])
	);

endmodule
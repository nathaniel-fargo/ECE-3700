module Eight_Bit_Adder (
	input [7:0] a,
	input [7:0] b,
	input cin,
	output [7:0] sum,
	output cout
	);
	
	wire carry;
	
	Look_Ahead_Four_Bit_Adder adder1 (
		.a(a[3:0]),
		.b(b[3:0]),
		.cin(cin),
		.out(sum[3:0]),
		.cout(carry)
	);
	
	Look_Ahead_Four_Bit_Adder adder2 (
		.a(a[7:4]),
		.b(b[7:4]),
		.cin(carry),
		.out(sum[7:4]),
		.cout(cout)
	);
	
endmodule
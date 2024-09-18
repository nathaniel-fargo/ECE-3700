module Full_Adder (
	input a,
	input b,
	input cin,
	output sum,
	output cout
);

	assign sum = a ^ b ^ cin;
	cout = a & b | b & cin | cin & a;

endmodule
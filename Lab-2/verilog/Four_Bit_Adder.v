module Four_Bit_Adder (
	input [3:0] a,
	input [3:0] b,
	input cin,
	output [3:0] out,
	output cout
);

	wire [4:0] c;
	assign c[0] = cin; // initial carry
	
	genvar i;
	generate
		 for (i = 0; i < 4; i = i + 1) begin : adders
			  Full_Adder adder_inst (
					.a(a[i]),
					.b(b[i]),
					.cin(c[i]),
					.sum(out[i]),
					.cout(c[i+1])
			  );
		 end
	endgenerate
	
	assign cout = c[4];
	
endmodule
		
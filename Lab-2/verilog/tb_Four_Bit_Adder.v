module tb_Four_Bit_Adder;

	reg [3:0] a, b;
	reg cin;
	wire [3:0] out;
	wire cout;

	///*
	Four_Bit_Adder uut (
		.a(a),
		.b(b),
		.cin(cin),
		.out(out),
		.cout(cout)
	);
	//*/
	/*
	Look_Ahead_Four_Bit_Adder uut2 (
		.a(a),
		.b(b),
		.cin(cin),
		.out(out),
		.cout(cout)
	);
	*/
	
	integer n, i, j;
	initial begin
		for (n = 0; n < 2; n = n + 1) begin
			cin = n;
			for (i = 0; i < 16; i = i + 1) begin
				a = i;
				for (j = 0; j < 16; j = j + 1) begin
					b = j;
					#10;
					$display(" ");
					$display("cin is %d", cin);
					$display("a is %d", a);
					$display("b is %d", b);
					$display("sum is %d", out);
					$display("cout is %d", cout);
				end
			end
		end
	end

endmodule
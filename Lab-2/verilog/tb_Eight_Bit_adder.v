module tb_Eight_Bit_Adder;
	
	reg [7:0] a, b;
	reg cin;
	wire [7:0] out;
	wire cout;

	Eight_Bit_Adder uut (
		.a(a),
		.b(b),
		.cin(cin),
		.out(out),
		.cout(cout)
	);
	
	integer n, i, j;
	initial begin
		for (n = 0; n < 2; n = n + 1) begin
			cin = n;
			for (i = 0; i < 30; i = i + 1) begin
				a = i;
				for (j = 80; j < 100; j = j + 1) begin
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
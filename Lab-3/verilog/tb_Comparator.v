module tb_Comparator;
	reg [3:0] A;
	reg [3:0] B;
	reg C;
	wire [2:0] F;
	
	Comparator uut (
		.A(A),
		.B(B),
		.C(C),
		.F(F)
	);
	
	integer i, j, k;
	initial begin
		
		for (i = 0; i < 16; i = i + 1) begin
			A = i;
			for (j = 0; j < 16; j = j + 1) begin
				B = j;
				for (k = 0; k < 2; k = k + 1) begin
					C = k;
					
					#5;
					if (C == 0) begin
						$display("A is %d, B is %d, F321 is %b", A, B, F);
					end else begin
						$display("A is %d, B is %d, F321 is %b", $signed(A), $signed(B), F);
					end
				end
			end
		end
	end
endmodule
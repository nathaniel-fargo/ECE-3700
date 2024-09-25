module tb_Functional;
	reg [1:0] A;
	reg [1:0] B;
	reg [1:0] I;
	wire [1:0] F;
	
	Functional uut (
		.A(A),
		.B(B),
		.I(I),
		.F(F)
	);
	
	reg [3:0] num;
	integer i, j;
	initial begin
		// loop all 16 possible A/B combos
		for (i = 0; i < 16; i = i + 1) begin
			num = i; // set to a 4 bit register
			A = num[3:2]; // break it down by 2 bits
			B = num[1:0];
			
			// display A & B inputs
			$display("A is %b, B is %b", A, B);
		
			for (j = 0; j < 4; j = j + 1) begin
				// change I using same method
				I = j;
				// delay
				#5;
				$display("Instruction is %b output is %B", I, F); 
			end
		end
	end
endmodule
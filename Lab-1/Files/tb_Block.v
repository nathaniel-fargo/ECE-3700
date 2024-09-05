module tb_Block;

	reg [1:0] A;
	reg [1:0] B;
	reg [1:0] I;
	wire [1:0] F;
	
	reg [3:0] num;
	

	Block1 uut (
		.A(A),
		.B(B),
		.I(I),
		.F(F)
	);
	
	
	integer i, j;
	initial begin
	
		for (i = 0; i < 16; i = i + 1) begin
		
	
			num = i;
		
			
			A = num[3:2];
			B = num[1:0];
			
			$display("A is %x, B is %b", A, B);
		
			for (j = 0; j < 4; j = j + 1) begin
			
				I = j;
				#5;
				
				$display("Instruction is %x output is %B", I, F); 
			end
			
			
		end
			
	end
endmodule
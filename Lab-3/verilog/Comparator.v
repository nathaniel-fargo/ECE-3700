module Comparator (
	input wire [3:0] A,
	input wire [3:0] B,
	input wire C,
	output reg [2:0] F
	);
	
	always @(*) begin
		if (~C) begin
			// Check if A is larger than B
			F[0] <= A > B;
			// Check if A and B are equal
			F[1] <= A == B;
			// Check if A is less than B
			F[2] <= A < B;
		end else begin
			// check if A is greater than B (twos complement mode)
			if (A[3] < B[3] || (A[3] == B[3] && (A[2:0] > B[2:0]))) begin
				F = 3'b001;
			// Check for equality
			end else if (A == B) begin
				F = 3'b010;
			// otherwise A is less than B
			end else begin
				F = 3'b100;
			end
		end
	end
	
endmodule
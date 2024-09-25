module Functional(
	input [1:0] A,
	input [1:0] B,
	input [1:0] I,
	output [1:0] F
);
	
	assign F = I==2'b00 ? (A & B) : I==2'b01 ? (A | B) : I==2'b10 ? (A ~^ B) : I==2'b11 ? (~A) : 2'b00;
	
endmodule
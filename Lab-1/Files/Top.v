module Top (
	input [9:0] switches,
	output [9:0] leds
);


	wire [1:0] A, B, I, F;
	
	assign A = switches[9:8];
	assign B = switches[7:6];
	assign I = switches[1:0];
	
	Structural struct_inst(
		.A(A),
		.B(B),
		.I(I),
		.F(F)
	);
	
	assign leds[9:5] = { 1'b0, F[1], F[1], F[1], 1'b0 };
	assign leds[4:0] = { 1'b0, F[0], F[0], F[0], 1'b0 };

endmodule
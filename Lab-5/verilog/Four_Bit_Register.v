module Four_Bit_Register (
	input wire clk,
	input wire [3:0] in,
	input wire wr,
	output wire [3:0] out
);

	reg [3:0] data = 4'h0;

	always @(posedge clk) begin
		
		if (wr)
			data <= in;
	
	end
	
	assign out = data;
	
endmodule
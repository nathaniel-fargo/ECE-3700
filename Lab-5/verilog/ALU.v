module ALU (
	input clk,
	input wire [1:0] op_code,
	input wire [3:0] in1,
	input wire [3:0] in2,
	output wire [3:0] out
);
	
	/*
	assign out = 	op_code == 2'b00 ? in1 + in2 : // add
						op_code == 2'b01 ? in1 ^ in2 : // xor
						op_code == 2'b10 ? in1 | in2 : // or
						~in1;		 // not
	*/
	
	reg [3:0] out_r = 0;
	assign out = out_r;
	
	always @(posedge clk) begin
		case (op_code)
			// ADD
			2'b00: begin
				out_r <= in1 + in2;
			end
			// XOR
			2'b01: begin
				out_r <= in1 ^ in2;
			end
			// OR
			2'b10: begin
				out_r <= in1 | in2;
			end
			2'b11: begin
				out_r <= ~in1;
			end
		endcase
	end

endmodule
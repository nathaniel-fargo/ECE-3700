module Data_Path_MX (
	input wire clk,
	input wire [1:0] select,
	input wire [3:0] sw_in,
	input wire [3:0] r3,
	input wire [3:0] custom,
	output wire [3:0] data_path
);
	
	assign data_path = 	select == 2'b00 ? 4'h0 : 
								select == 2'b01 ? sw_in : 
								select == 2'b10 ? r3 : custom;
	
	/*
	always @(posedge clk) begin

		case (select):
			2'b01: begin
				data_path <= sw_in;
			end
			2'b10: begin
				data_path <= r3:
			end
			default: begin
				data_path <= 4'h0;
			end
		endcase
	end
	*/

endmodule
module FSM (
	input wire clk,
	input wire reset,
	output reg [2:0] wr_reg, // write control for R1, R2, R3
	output reg [1:0] data_path_select, // multiplexing control for datapath (00 for 0s, 01 for sw, 10 for R3, 11 for custom)
	output reg [3:0] data_path_custom, // the custom referred to above
	output reg [1:0] alu_op_code // instruction code for the alu
);

	reg [3:0] current_state, next_state;

	// State machine stuff here
	// next state logic
	always @(posedge clk) begin
		if (reset) begin
			next_state <= 0;
		end else if (current_state != 9) begin
			next_state <= current_state + 1;
		end
	end
	
	// set current state to next state
	always @(posedge clk) begin
		current_state <= next_state;
	end
	
	// Interperet state
	always @(posedge clk) begin
		
		wr_reg <= 0;
		data_path_select <= 2'b00;
		alu_op_code <= 2'b00;
	
		case (current_state)
			0: begin
				// write everything to zero
				wr_reg <= 3'b111;
			end
			1: begin
				// write r1 to switches
				data_path_select <= 2'b01;
				wr_reg <= 3'b001;
			end
			2: begin
				// write r2 to 4'b0011
				data_path_select <= 2'b11;
				data_path_custom <= 4'b0011;
				wr_reg <= 3'b010;
			end
			3: begin
				// 'add' r1 and r2
				alu_op_code <= 2'b00;
				wr_reg <= 3'b100;
			end
			4: begin
				// set r2 to output of alu
				data_path_select <= 2'b10;
				wr_reg <= 3'b010;
			end
			5: begin
				// 'or' r1 and r2
				alu_op_code <= 2'b10;
				wr_reg <= 3'b100;
			end
			6: begin
				// set r1 to output of alu
				data_path_select <= 2'b10;
				wr_reg <= 3'b001;
			end
			7: begin
				// 'not' r1
				alu_op_code <= 2'b11;
				wr_reg <= 3'b100;
			end
			8: begin
				// set r1 to output of alu
				data_path_select <= 2'b10;
				wr_reg <= 3'b001;
			end
			9: begin
				// 'xor' r1 and r2
				alu_op_code <= 2'b01;
				wr_reg <= 3'b100;
			end
		endcase
	end

endmodule
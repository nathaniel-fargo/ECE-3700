module Top (
	input clk,
	input sw_reset,
	input [3:0] sw_in,
	output [6:0] segment_display
);

	// data path
	wire [3:0] data_path;
	wire [1:0] data_path_select;
	wire [3:0] data_path_custom;
	
	// registers
	wire [3:0] r_out [0:2];
	wire [2:0] wr_reg;
	
	// alu control
	wire [3:0] alu_out;
	wire [1:0] alu_op_code;
	
	// finite state machine
	FSM fsm_inst (
		.clk(clk),
		.reset(sw_reset),
		.wr_reg(wr_reg),
		.data_path_select(data_path_select),
		.data_path_custom(data_path_custom),
		.alu_op_code(alu_op_code)
	);
	
	// arithmetic logic unit
	ALU alu_inst (
		.clk(clk),
		.op_code(alu_op_code),
		.in1(r_out[0]),
		.in2(r_out[1]),
		.out(alu_out)
	);
	
	// manage data path
	Data_Path_MX data_path_mx_inst (
		.clk(clk),
		.select(data_path_select),
		.sw_in(sw_in),
		.r3(r_out[2]),
		.custom(data_path_custom),
		.data_path(data_path)
	);
	
	// setup registers
	Four_Bit_Register reg_1 (
		.clk(clk),
		.in(data_path),
		.wr(wr_reg[0]),
		.out(r_out[0])
	);
	Four_Bit_Register reg_2 (
		.clk(clk),
		.in(data_path),
		.wr(wr_reg[1]),
		.out(r_out[1])
	);
	Four_Bit_Register reg_3 (
		.clk(clk),
		.in(alu_out),
		.wr(wr_reg[2]),
		.out(r_out[2])
	);

	// output lights
	HexTo7Seg segment_display_inst (
		.hex_input(r_out[2]),
		.segment_display(segment_display)
	);

endmodule
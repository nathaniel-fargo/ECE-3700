module Top (
	input clk_50mhz,
	input reset_sw,
	input [3:0] btn_b,
	output [6:0] segment_display
);

reg [3:0] r1, r2, r3;

wire [3:0] data_path;

reg [2:0] state, next_state;

localparam S0 = 3'b000;
localparam S1 = 3'b001;
localparam S2 = 3'b010;
localparam S3 = 3'b011;
localparam S4 = 3'b100;
localparam S5 = 3'b101;
localparam S6 = 3'b110;
localparam S7 = 3'b111;

always @(posedge clk_50mhz) begin

	if (reset_sw) begin
		next_state <= 

end

endmodule
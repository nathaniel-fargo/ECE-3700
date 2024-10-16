module Top (
	input clk_50mhz,
	input reset,
	input start,
	input stop,
	output [6:0] segment_display
);

	// hold the current output (0-9)
	reg [3:0] stopwatch_counter;
	
	// manage different states
	localparam RESET = 2'b00;
	localparam IDLE = 2'b01;
	localparam COUNTING = 2'b10;
	reg [1:0] state;
	
	initial begin
		stopwatch_counter <= 0;
		state <= IDLE;
	end
	
	// create clocks
	wire clk_1hz;
	wire clk_en = (state == COUNTING);
	
	ClkDiv50M clk_div_inst (
		.clk_50mhz(clk_50mhz),
		.clk_1hz(clk_1hz),
		.en(clk_en),
		.reset(reset)
	);
	
	// fast logic
	always @(posedge clk_50mhz) begin
	
		// handle inputs here
		if (reset) begin
			state <= RESET;
		end else if (~stop | (state == RESET)) begin
			state <= IDLE;
		end else if (~start) begin
			state <= COUNTING;
		end
		
	end
	
	// slow logic
	always @(posedge clk_1hz) begin
		// FSM
		case (state) 
			IDLE: begin
				// do nothing
			end
			COUNTING: begin
				// increment stopwatch
				stopwatch_counter <= stopwatch_counter + 1;
				if (stopwatch_counter == 9) 
					stopwatch_counter <= 0;
			end
			RESET: begin
				// reset stopwatch
				stopwatch_counter <= 0;
			end
		endcase
	end
	
	// instatiate hex to 7 segment display
	HexTo7Seg segment_display_converter_inst (
		.hex_input(stopwatch_counter),
		.segment_display(segment_display)
	);

endmodule
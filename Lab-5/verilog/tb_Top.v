module tb_Top;

	reg clk_50mhz;
	reg sw_reset;
	reg [3:0] sw_in;
	
	wire [6:0] segment_display;
	wire [3:0] hex_output;
	
	Top dut (
		.clk(clk_50mhz),
		.sw_reset(sw_reset),
		.sw_in(sw_in),
		.segment_display(segment_display)
	);
	
	assign hex_output = dut.r_out[2];

	initial begin
		clk_50mhz = 0;
		forever begin
			#10;
			clk_50mhz = ~clk_50mhz;
		end
	end
	
	initial begin
		// simulate I/O
		
		// start off
		sw_reset = 1;
		sw_in = 4'h0;
		#100;
		
		// turn on
		sw_reset = 0;
		#500;
		
		// display output
		$display("input %b, output %x", sw_in, hex_output);
		#50;
		
		// reset
		sw_reset = 1;
		#100;
		
		// change input
		sw_in = 4'b0101;
		#20;
		
		// turn on
		sw_reset = 0;
		#500;
		
		// display output
		$display("input %b, output %x", sw_in, hex_output);
		#50;
		
		// reset
		sw_reset = 1;
		#100;
		
		// change input
		sw_in = 4'b1110;
		#20;
		
		// turn on
		sw_reset = 0;
		#500;
		
		// display output
		$display("input %b, output %x", sw_in, hex_output);
		#50;
		
		// reset
		sw_reset = 1;
		#100;
		
		$display("complete");
		
		#50;
		$stop;
		
	
	end


endmodule
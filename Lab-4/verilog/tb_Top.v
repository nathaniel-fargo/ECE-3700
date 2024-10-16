module tb_Top;
	
	reg clk_50mhz;
	reg reset;
	reg start;
	reg stop;
	wire [6:0] segment_display;
	
	Top dut (
		.clk_50mhz(clk_50mhz),
		.reset(reset),
		.start(start),
		.stop(stop),
		.segment_display(segment_display)
	);
	
	initial begin
		clk_50mhz = 0;
		forever begin
			#10;
			clk_50mhz = ~clk_50mhz;
		end
	end
	
	initial begin
	
		reset = 0;
		start = 0;
		stop = 0;
	
		#1_000_000;
		
		start = 1;
		
		#2_000_000;
		
		start = 0;
		
		#2_000_000_000;
		
		stop = 1;
		
		#2_000_000;
		
		stop = 0;
		
		#1_300_000_000;
		
		reset = 1;
		
		#1_200_000_000;
		
		reset = 0;
		
		#1_000_000_000;
		
		start = 1;
		
		#2_000_000;
		
		start = 0;
		
		$done;
		
	end
	
endmodule
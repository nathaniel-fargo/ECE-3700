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
		
		reset = 1;
		
		#120000;
		
		reset = 0;
	
		reset = 0;
		start = 1;
		stop = 1;
	
		#100000;
		
		start = 0;
		
		#200000;
		
		start = 1;
		
		#200000;
		
		stop = 0;
		
		#200000;
		
		stop = 1;
		
		#300000;
		
		#100000;
		
		start = 0;
		
		#200000;
		
		start = 1;
		
		$finish;
		
	end
	
endmodule
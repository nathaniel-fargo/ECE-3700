module ClkDiv50M (
	input clk_50mhz,
	output reg clk_1hz,
	input en,
	input reset
);

	reg [31:0] clk_div = 0;
	reg reset_prev = 0;
	
	always @(posedge clk_50mhz) begin
	
		reset_prev <= reset;
		
		if (reset) begin
			
			// reset counter
			clk_div <= 0;
			
			// quick rising edge on clock reset
			if (~reset_prev) 
				clk_1hz <= 0;
			else 
				clk_1hz <= 1;
			
		end else if (en) begin
			
			clk_div <= clk_div + 1;
			
			//if (clk_div == 24_999_999) begin
			if (clk_div == 500) begin
				clk_div <= 0;
				clk_1hz <= ~clk_1hz;
			end
			
		end
	
	end
	
endmodule
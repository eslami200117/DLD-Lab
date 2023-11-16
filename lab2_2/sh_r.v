`timescale 1ns/1ns
module ShiftRegister2 (
    input wire clk,       // Clock input
    input wire reset,     // Reset input
	input wire clk_en,     // enable input
	input wire sh_en,     // enable input
    input wire in, 		 // input
    output reg [1:0] out,		//  output  
);

	always @ (posedge clk)
		if (clk_en)begin
			if (!reset)
				out <= 0;
			else if (en)
				out <= { in, out [0]}
			else 
			out <= out;			 
		end
			
endmodule

module ShiftRegister4 (
    input wire clk,       // Clock input
    input wire reset,     // Reset input
	input wire clk_en,     // enable input
	input wire sh_en,     // enable input
    input wire in, 		 // input
    output reg [3:0] out,		//  output  
);

	always @ (posedge clk)
		if (clk_en)begin
			if (!reset)
				out <= 0;
			else if (en)
				out <= {in, out [2:0]};
			else 
				out <= out;
		end

		

endmodule

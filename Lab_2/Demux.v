`timescale 1ns/1ns

module Demux (
	input wire SerIn,     
	input wire [1:0] port_num,     
	output reg p0,
	output reg p1,
	output reg p2,
	output reg p3 
);

	always @(SerIn or port_num) begin
		case (port_num)
			2'b00 : p0 = SerIn;
			2'b01 : p1 = SerIn;
			2'b10 : p2 = SerIn;
			2'b11 : p3 = SerIn;
		endcase
	end

endmodule

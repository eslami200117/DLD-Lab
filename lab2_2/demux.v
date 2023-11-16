`timescale 1ns/1ns
module Demux (
    input wire ser_in,     
    input wire [1:0]port,     
    output reg p0 ,
	output reg p1 ,
	output reg p2 ,
	output reg p3 
);

		case(port)
			2'b00 : p0 = ser_in;
			2'b01 : p1 = ser_in;
			2'b10 : p2 = ser_in;
			2'b11 : p3 = ser_in;
	endcase

endmodule

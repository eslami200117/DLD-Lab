`timescale 1ns/1ns
module tb_One_Pulser;

    reg clk;
    reg reset;
    reg clkPB;

    wire clkEn;

    One_Pulser uut (
        .clk(clk),
        .reset(reset),
        .clkPB(clkPB),
        .clkEn(clkEn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        clkPB = 0;
        #10 reset = 0;
        clkPB = 0;
        #20 clkPB = 1;
        #20 clkPB = 0;
        #20 clkPB = 1;
        #20 clkPB = 0;
		#20 ;

        $stop;
    end

endmodule



`timescale 1ns/1ns

module tb_ShiftRegister;

    parameter WIDTH = 4;

    reg clk, rst, Clk_EN;
    reg in;
    wire [WIDTH-1:0] out;
    wire [WIDTH-1:0] out2;

    ShiftRegister #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .Clk_EN(Clk_EN),
        .in(in),
        .out(out)
    );

    SynchronousShiftRegister #(WIDTH) uut2 (
        .clk(clk),
        .rst(rst),
        .Clk_EN(Clk_EN),
        .in(in),
        .out(out2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        Clk_EN = 0;
        in = 1'b1;

        #10 rst = 0;

        #10 Clk_EN = 1;
        #10 in = 1'b0;

        #10 in = 1'b1;
        #10 Clk_EN = 0;

        #20 in = 1'b0;



        #100 $stop;
    end

endmodule

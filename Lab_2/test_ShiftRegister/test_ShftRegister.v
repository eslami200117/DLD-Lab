`timescale 1ns/1ns

module tb_ShiftRegister;

    parameter WIDTH = 4;

    reg clk, rst, Clk_EN;
    reg [1:0] shift_direction;
    reg in;
    wire [WIDTH-1:0] out;

    ShiftRegister #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .Clk_EN(Clk_EN),
        .shift_direction(shift_direction),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        Clk_EN = 0;
        shift_direction = 2'b00;
        in = 1'b1;

        #10 rst = 0;

        #10 Clk_EN = 1;
        #10 in = 1'b0;

        #20 in = 1'b1;

        #20 shift_direction = 2'b10;
        #40 shift_direction = 2'b01;
        #20 in = 1'b0;



        #100 $stop;
    end

endmodule

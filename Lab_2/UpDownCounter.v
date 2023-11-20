`timescale 1ns/1ns

module UpDownCounter #(parameter WIDTH = 4) (
    input clk,          // Clock input
    input Clk_EN,
    input rst,          // Reset input
    input load,         // Load input
    input enable,       // Enable input
    input up_down,      // Up/Down control input
    input [WIDTH-1:0] data_in,   // Data input for loading
    output co,           // Carry output
    output reg [WIDTH-1:0] count_out // Output count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_out <= 0;
        end else if (enable) begin
            if (up_down & Clk_EN) begin
               count_out <= count_out + 1;
            end else if(Clk_EN) begin
                count_out <= count_out - 1;
            end
        end
    end

    assign count_out = load? data_in: count_out;
    assign co = up_down? &count_out: ~|count_out;
endmodule

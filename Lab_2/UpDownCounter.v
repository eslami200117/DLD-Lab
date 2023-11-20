`timescale 1ns/1ns

module UpDownCounter #(parameter WIDTH = 4) (
    input wire clk,          // Clock input
    input wire rst,          // Reset input
    input wire load,         // Load input
    input wire enable,       // Enable input
    input wire up_down,      // Up/Down control input
    input wire [WIDTH-1:0] data_in,   // Data input for loading
    output reg co,           // Carry output
    output reg [WIDTH-1:0] count_out // Output count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            {co,count_out} <= {(WIDTH+1){1'b0}};
        end else if (enable) begin
            if (up_down) begin
                {co,count_out} <= count_out + 1;
            end else begin
                count_out <= count_out - 1;
            end
        end
    end

    assign count_out = load? data_in: count_out;
    // assign co = up_down? &count_out: ~|count_out;
endmodule

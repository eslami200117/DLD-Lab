`timescale 1ns/1ns

module UpDownCounter #(parameter WIDTH = 4) (
    input wire clk,                      // Clock input
    input wire rst,                      // Reset input
    input wire load,                     // Load input
    input wire enable,                   // Enable input
    input wire up_down,                  // Up/Down control input
    input wire [WIDTH-1:0] data_in,      // Data input for loading
    output reg co,                        // cout
    output reg [WIDTH-1:0] count_out     // Output count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_out <= {WIDTH{1'b0}}; // Initialize to all zeros on reset
        end else begin
            if (load) begin
                count_out <= data_in; // Load data on clock edge
            end else if (enable) begin
                if (up_down) begin
                    // Up-counter logic
                    {co, count_out} <= count_out + 1;
                end else begin
                    // Down-counter logic
                    count_out <= count_out - 1;
                    if(count_out == 0) begin
                        co <= 1'b1;
                    end
                end
            end
        end
    end

endmodule

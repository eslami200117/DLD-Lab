`timescale 1ns/1ns

module ShiftRegister #(parameter WIDTH = 4) (
    input wire clk,                  // Clock input
    input wire rst,                // Reset input
    input wire Clk_EN,               // Enable input
    input wire in,       // Input
    output reg [WIDTH-1:0] out       // Output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= {WIDTH{1'b0}}; // Initialize to all zeros
        else if (Clk_EN) 
            out <= {out[WIDTH-2:0], in}; // Shift left
    end

endmodule

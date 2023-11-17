`timescale 1ns/1ns

module ShiftRegister #(parameter WIDTH = 4) (
    input wire clk,                  // Clock input
    input wire rst,                // Reset input
    input wire Clk_EN,               // Enable input
    input wire [1:0] shift_direction,// Shift direction: 2'b00 (no shift), 2'b01 (shift left), 2'b10 (shift right)
    input wire in,       // Input
    output reg [WIDTH-1:0] out       // Output
);

    always @(posedge clk) begin
        if (rst) begin
            out <= {WIDTH{1'b0}}; // Initialize to all zeros
        end else if (Clk_EN) begin
            case (shift_direction)
                2'b01: out <= {out[WIDTH-2:0], in}; // Shift left
                2'b10: out <= {in, out[WIDTH-1:1]}; // Shift right
                default: out <= out; // No shift
            endcase
        end
    end

endmodule

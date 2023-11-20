`timescale 1ns/1ns

module SynchronousShiftRegister  #(parameter WIDTH = 4)(
  input wire clk,     // Clock input
  input wire rst,     // Reset input
  input wire Clk_EN,      // Enable input
  input wire in,      // Input data
  output reg [WIDTH-1:0] out // 4-bit shift register output
);

// Always block triggered by positive edge of the clock
always @(posedge clk or posedge rst) begin
  if (rst) // Reset the shift register if rst is asserted
    out <={WIDTH{1'b0}};
  else if (Clk_EN) // Only shift when the enable signal is active
    out <= {out[WIDTH-2:0], in}; // Shift left
end

endmodule

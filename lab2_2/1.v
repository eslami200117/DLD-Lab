`timescale 1ns/1ns
module One_Pulser (
    input wire clk,       // Clock input
    input wire reset,     // Reset input
    input wire clkPB,     // Clock PB input
    output reg clkEn     // Clock enable output  
);

// Define state encoding
parameter StateA = 3'b000;
parameter StateB = 3'b001;
parameter StateC = 3'b010;
reg [2:0] ps;
reg [2:0] ns;

always@(posedge clk, posedge reset)
begin
	if(reset)
		ps <= StateA;
	else
		ps <= ns;
end

always@(ps)
begin
		case(ps)
			StateA: clkEn = 0;
			StateB: clkEn = 1'b1;
			StateC:	clkEn=0;
	endcase
end


always @(ps,clkPB) begin

     begin
        case (ps)
            StateA: begin
                if (~clkPB) begin
                    ns <= StateA; // Stay in StateA
                end else begin
                    ns <= StateB; // Transition to StateB
                end
            end
            StateB: begin
                ns <= StateC;    // Unconditionally transition to StateC
            end
            StateC: begin
                if (clkPB) begin
                    ns <= StateC; // Stay in StateC
                end else begin
                    ns <= StateA; // Transition to StateA
                end
            end
        endcase
    end
end

endmodule

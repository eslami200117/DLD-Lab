`timescale 1ns/1ns
module Counter( input clk ,rst ,clkEn ,output co );
reg [3:0]num ;
	always@(posedge clk ,posedge rst)begin
		if(rst == 1'b1)
			num <= 4'b0 ;
		else if(clkEn)
			{co,num} <= num + 1'b1;
	end
    

endmodule


module Counter2( input clk ,rst ,clkEn , [3:0]ld, output reg [3:0]Coun_out ,output co);
	always@(posedge clk ,posedge rst)begin
		if(ldcntD)
			Coun_out <= ld;
		if(rst == 1'b1)
			Coun_out <= 4'b0 ;
		else if(clkEn)
			{co,Coun_out} <= Coun_out + 1'b1;
	
	end
    

endmodule

module datapath (
                  clk, rst, ClPB, sh_en, sh_enD, ldcntD,
                  SerIn, p0, p1, p2, p3, SSD, port_num, pDcnt, co1, co2
                );

input clk;
input rst;
input ClkPB;
input SerIn;
input sh_en, sh_en_D, ldcntD;
output p0, p1, p2, p3;
output SSD;
output [1:0] port_num;
output [6:0] pDcnt;
output co1, co2; 

wire Clk_EN;
wire [3:0] Ld_data;
wire [3:0] Coun_out;



One_Pulser op(clk, rst, ClkPB, Clk_EN);

ShiftRegister2 PortNum(clk, rst, Clk_EN, sh_en, SerIn, port_num);

ShiftRegister4 DataNum(clk, rst, Clk_EN, sh_enD, SerIn, Ld_data);

Counter PortCount(clk, rst, Clk_EN, co1);

Counter2 PortCount(clk, rst, Clk_EN, ldcntD, Ld_data, Coun_out, co2);

SevenSegment Display(Coun_out, pDcnt);

Demux demux(SerIn, port_num, p0, p1, p2, p3);


endmodule
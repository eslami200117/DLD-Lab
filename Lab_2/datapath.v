`timescale 1ns/1ns

module datapath (
  input clk;
  input rst;
  input ClkPB;
  input SerIn;
  input sh_en, sh_en_D, ldcntD;
  output p0, p1, p2, p3;
  output reg Clk_EN;
  output reg [1:0] port_num;
  output [6:0] pDcnt;
  output co1, co2, co_D;
);

 

wire [3:0] Ld_data;
wire [3:0] Coun_out;



One_Pulser op(
  .clk(clk),
  .rst(rst),
  .clkPB(clkPB),
  .Clk_EN(Clk_EN),
);

ShiftRegister Data_Register(
  .clk(clk),
  .rst(rst),
  .Clk_EN(Clk_EN),
  .shift_direction(2'b10),
  .in(SerIn),
  .out(Ld_data)
);

ShiftRegister #(2) Data_Register(
  .clk(clk),
  .rst(rst),
  .Clk_EN(Clk_EN),
  .shift_direction({2'b10}),
  .in(SerIn),
  .out(port_num)
);

UpCounter Data_Counter(
  .clk(clk),
  .rst(rst),
  .load({1'b1}),
  .data_in(Ld_data),
  .co(co_D),
  .Coun_out(Coun_out)
);

UpCounter Data_Counter(
  .clk(clk),
  .rst(rst),
  .load({1'b0}),
  .data_in(Ld_data),
  .co(c2),
  .Coun_out(Coun_out)
);


UpCounter #(2) Port_Counter(
  .clk(clk),
  .rst(rst),
  .load({1'b0}),
  .data_in(Ld_data),
  .co(co1),
  .Coun_out(Coun_out)
);


SSD ssd(
  .in(Coun_out),
  .out(pDcnt)
);

Demux demux(
  .SerIn(SerIn),
  .port_num(port_num),
  .p0(p0),
  .p1(p1),
  .p2(p2),
  .p3(p3)
)


endmodule
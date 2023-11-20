`timescale 1ns/1ns

module datapath (
  input wire clk,
  input wire rst,
  input wire ClkPB,
  input wire SerIn,
  input wire sh_en, sh_en_D, ldcntD,
  input wire cnt_1, cnt_2, cnt_D,
  output p0, p1, p2, p3,
  output Clk_EN,
  output [1:0] port_num,
  output [6:0] pDcnt,
  output co1, co2, co_D
);

 

wire [3:0] Ld_data;
wire [3:0] count_out;



One_Pulser op(
  .clk(clk),
  .rst(rst),
  .ClkPB(ClkPB),
  .Clk_EN(Clk_EN)
);

ShiftRegister Data_Register(
  .clk(clk),
  .rst(rst),
  .en(sh_en_D),
  .in(SerIn),
  .out(Ld_data)
);

ShiftRegister #(2) Data_Register2(
  .clk(clk),
  .rst(rst),
  .en(sh_en),
  .in(SerIn),
  .out(port_num)
);

UpDownCounter Data_Counter(
  .clk(clk),
  .rst(rst),
  .load(ldcntD),
  .enable(cnt_D),
  .up_down({1'b0}),
  .data_in(Ld_data),
  .co(co_D),
  .count_out(count_out)
);

UpDownCounter #(2) Data_Counter2(
  .clk(clk),
  .rst(rst),
  .load({1'b0}),
  .enable(cnt_2),
  .up_down({1'b1}),
  .data_in(Ld_data),
  .co(co2),
  .count_out(count_out)
);


UpDownCounter #(1) Port_Counter(
  .clk(clk),
  .rst(rst),
  .load({1'b0}),
  .enable(cnt_1),
  .up_down({1'b1}),
  .data_in({2'b00}),
  .co(co1),
  .count_out(count_out)
);


SSD ssd(
  .in(count_out),
  .out(pDcnt)
);

Demux demux(
  .SerIn(SerIn),
  .port_num(port_num),
  .p0(p0),
  .p1(p1),
  .p2(p2),
  .p3(p3)
);

endmodule
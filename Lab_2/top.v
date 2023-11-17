`timescale 1ns/1ns

module top(
  input clk,
  input rst,
  input ClkPB,
  input SerIn,
  output Done,
  output serOutvalid,
  output p0, p1, p2, p3,
  output reg port_num,
  output [6:0] pDcnt  
);

  wire sh_en, sh_en_d, ldcntD, co1, co2, co_D;

  datapath dp(
    .clk(clk),
    .rst(rst),
    .ClkPB(ClkPB),
    .SerIn(SerIn),
    .sh_en(sh_en),
    .sh_en_d(sh_en_d),
    .ldcntD(ldcntD),
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .Clk_EN(Clk_EN),
    .port_num(port_num), 
    .pDcnt(pDcnt),
    .co1(co1),
    .co2(co2),
    .co_D(co_D)
  );

  controller c(
    .clk(clk),
    .rst(rst),
    .SerIn(SerIn),
    .co1(co1),
    .co2(co2),
    .co_D(co_D),
    .clkEn(clkEn),
    .cnt_1()
  );
  
endmodule
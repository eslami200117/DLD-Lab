`timescale 1ns/1ns

module top(
  input clk,
  input rst,
  input ClkPB,
  input SerIn,
  output reg Done,
  output reg serOutvalid,
  output reg p0, p1, p2, p3,
  output reg port_num,
  output reg [6:0] pDcnt  
);

  wire sh_en, sh_en_d, ldcntD;
  wire co1, co2, co_D;
  wire cnt_1, cnt_2, cnt_D;

  datapath dp(
    .clk(clk),
    .rst(rst),
    .ClkPB(ClkPB),
    .SerIn(SerIn),
    .sh_en(sh_en),
    .sh_en_d(sh_en_d),
    .ldcntD(ldcntD),
    .cnt_1(cnt_1), 
    .cnt_2(cnt_2), 
    .cnt_D(cnt_D),
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
    .cnt_1(cnt_1), 
    .cnt_2(cnt_2), 
    .cnt_D(cnt_D), 
    .ld_cnt_D(ldcntD), 
    .sh_en(sh_en), 
    .sh_en_D(sh_en_d), 
    .ser_out_valid(serOutvalid), 
    .done(Done)
  );
  
endmodule
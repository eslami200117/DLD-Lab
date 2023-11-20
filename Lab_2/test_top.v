`timescale 1ns/1ns

module tb_top;

  reg clk;
  reg rst;
  reg ClkPB;
  reg SerIn;

  wire Done;
  wire serOutvalid;
  wire p0, p1, p2, p3;
  wire Clk_EN;
  wire [6:0] pDcnt;
  wire [1:0] port_num;
  wire [3:0] out;
  reg en;
  wire sh_en, sh_en_D, ldcntD;
  wire co1, co2, co_D;
  wire cnt_1, cnt_2, cnt_D;

  top uut (
    .clk(clk),
    .rst(rst),
    .ClkPB(ClkPB),
    .SerIn(SerIn),
    .Done(Done),
    .serOutvalid(serOutvalid),
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .port_num(port_num),
    .Clk_EN(Clk_EN),
    .pDcnt(pDcnt)
  );

  ShiftRegister #(4) uut2 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .in(SerIn),
        .out(out)
  );

  datapath dp(
    .clk(clk),
    .rst(rst),
    .ClkPB(ClkPB),
    .SerIn(SerIn),
    .sh_en(sh_en),
    .sh_en_D(sh_en_D),
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
    .clkEn(Clk_EN),
    .cnt_1(cnt_1), 
    .cnt_2(cnt_2), 
    .cnt_D(cnt_D), 
    .ld_cnt_D(ldcntD), 
    .sh_en(sh_en), 
    .sh_en_D(sh_en_D), 
    .ser_out_valid(serOutvalid), 
    .done(Done)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    en = 0;
    #105 en = 1;
    #40 en = 0;
  end

  initial begin
    rst = 1;
    ClkPB = 0;
    SerIn = 1;

    #50 rst = 0;
    #10 ClkPB = 1;
    #10 ClkPB = 0;

    #5 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 1;
    #10 SerIn = 0;
    #10 SerIn = 0;
    #10 SerIn = 1;

    #200 $stop;
  end

endmodule

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

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
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

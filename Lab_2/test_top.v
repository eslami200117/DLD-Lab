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


wire [3:0] Ld_data;
wire [3:0] count_out;

  // top uut (
  //   .clk(clk),
  //   .rst(rst),
  //   .ClkPB(ClkPB),
  //   .SerIn(SerIn),
  //   .Done(Done),
  //   .serOutvalid(serOutvalid),
  //   .p0(p0),
  //   .p1(p1),
  //   .p2(p2),
  //   .p3(p3),
  //   .port_num(port_num),
  //   .Clk_EN(Clk_EN),
  //   .pDcnt(pDcnt)
  // );



  ShiftRegister #(4) uut2 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .in(SerIn),
        .out(out)
  );


//   One_Pulser op(
//   .clk(clk),
//   .rst(rst),
//   .ClkPB(ClkPB),
//   .Clk_EN(Clk_EN)
// );

ShiftRegister Data_Register(
  .clk(clk),
  .rst(rst),
  .en(sh_en_D),
  .in(SerIn),
  .out(Ld_data)
);

// ShiftRegister #(2) Data_Register2(
//   .clk(clk),
//   .rst(rst),
//   .en(sh_en),
//   .in(SerIn),
//   .out(port_num)
// );

// UpDownCounter Data_Counter(
//   .clk(clk),
//   .rst(rst),
//   .load(ldcntD),
//   .enable(cnt_D),
//   .up_down({1'b0}),
//   .data_in(Ld_data),
//   .co(co_D),
//   .count_out(count_out)
// );

// UpDownCounter #(2) Data_Counter2(
//   .clk(clk),
//   .rst(rst),
//   .load({1'b0}),
//   .enable(cnt_2),
//   .up_down({1'b1}),
//   .data_in(Ld_data),
//   .co(co2),
//   .count_out(count_out)
// );


// UpDownCounter #(1) Port_Counter(
//   .clk(clk),
//   .rst(rst),
//   .load({1'b0}),
//   .enable(cnt_1),
//   .up_down({1'b1}),
//   .data_in({2'b00}),
//   .co(co1),
//   .count_out(count_out)
// );


// SSD ssd(
//   .in(count_out),
//   .out(pDcnt)
// );

// Demux demux(
//   .SerIn(SerIn),
//   .port_num(port_num),
//   .p0(p0),
//   .p1(p1),
//   .p2(p2),
//   .p3(p3)
// );

//   controller c(
//     .clk(clk),
//     .rst(rst),
//     .SerIn(SerIn),
//     .co1(co1),
//     .co2(co2),
//     .co_D(co_D),
//     .clkEn(Clk_EN),
//     .cnt_1(cnt_1), 
//     .cnt_2(cnt_2), 
//     .cnt_D(cnt_D), 
//     .ld_cnt_D(ldcntD), 
//     .sh_en(sh_en), 
//     .sh_en_D(sh_en_D), 
//     .ser_out_valid(serOutvalid), 
//     .done(Done)
//   );

  // datapath dp(
  //   .clk(clk),
  //   .rst(rst),
  //   .ClkPB(ClkPB),
  //   .SerIn(SerIn),
  //   .sh_en(sh_en),
  //   .sh_en_D(sh_en_D),
  //   .ldcntD(ldcntD),
  //   .cnt_1(cnt_1), 
  //   .cnt_2(cnt_2), 
  //   .cnt_D(cnt_D),
  //   .p0(p0),
  //   .p1(p1),
  //   .p2(p2),
  //   .p3(p3),
  //   .Clk_EN(Clk_EN),
  //   .port_num(port_num), 
  //   .pDcnt(pDcnt),
  //   .co1(co1),
  //   .co2(co2),
  //   .co_D(co_D)
  // );

  // controller c(
  //   .clk(clk),
  //   .rst(rst),
  //   .SerIn(SerIn),
  //   .co1(co1),
  //   .co2(co2),
  //   .co_D(co_D),
  //   .clkEn(Clk_EN),
  //   .cnt_1(cnt_1), 
  //   .cnt_2(cnt_2), 
  //   .cnt_D(cnt_D), 
  //   .ld_cnt_D(ldcntD), 
  //   .sh_en(sh_en), 
  //   .sh_en_D(sh_en_D), 
  //   .ser_out_valid(serOutvalid), 
  //   .done(Done)
  // );

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

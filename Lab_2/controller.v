`timescale 1ns/1ns
module controller(input clk, rst, SerIn, co1, co2, co_D, clkEn, 
                  output reg cnt_1, 
                  output reg cnt_2, 
                  output reg cnt_D, 
                  output reg ld_cnt_D, 
                  output reg sh_en, 
                  output reg sh_en_D, 
                  output reg ser_out_valid, 
                  output reg done
                  );

parameter IDLE = 3'd0;
parameter PORT_NUM = 3'd1;
parameter DATA_NUM = 3'd2;
parameter TRANCE = 3'd3;
parameter DONE = 3'd4;

reg [2: 0] ps;
reg [2: 0] ns;

reg flag = 0'b0;

always@(posedge clk or posedge rst)
  begin
    if(rst)
      ps <= IDLE;
    else if(flag && ~clkEn)
      ps <= ns;
    if(clkEn)
      flag = 1'b1; 
  end

always@(ps, SerIn, co1, co2, co_D)
  begin
    case(ps)
      IDLE: ns <= SerIn? IDLE: PORT_NUM;
      PORT_NUM: ns <= co1? DATA_NUM: PORT_NUM;
      DATA_NUM: ns <= co2? TRANCE: DATA_NUM;
      TRANCE: ns <= co_D? DONE: TRANCE;
      DONE: ns <= SerIn? IDLE:PORT_NUM;
      endcase
  end

  always@(ps) begin
    {cnt_1, cnt_2, cnt_D, ld_cnt_D, sh_en, sh_en_D, ser_out_valid, done} <= 8'b0;
    case(ps)
      PORT_NUM:
        begin
          sh_en <= 1'b1;
          cnt_1 <= 1'b1;
        end
      DATA_NUM:
        begin
          sh_en_D <= 1'b1;
          cnt_2 <= 1'b1;
          ld_cnt_D <= 1'b1;
        end 
      TRANCE:
      begin
        cnt_D <= 1'b1;
        ser_out_valid <= 1'b1;
      end
      DONE:
        done <= 1'b1;
    endcase
  end

endmodule
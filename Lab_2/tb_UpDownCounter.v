`timescale 1ns/1ns

module tb_UpDownCounter;

    // Parameters
    parameter WIDTH = 4;
    
    // Signals
    reg clk, rst, load, enable, up_down;
    reg [WIDTH-1:0] data_in;
    wire co;
    wire [WIDTH-1:0] count_out;

    // Instantiate the UpDownCounter module
    UpDownCounter #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .enable(enable),
        .up_down(up_down),
        .data_in(data_in),
        .co(co),
        .count_out(count_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test scenario
    initial begin
        // Initialize inputs
        rst = 1;
        load = 0;
        enable = 0;
        up_down = 0;
        data_in = 4'b0000;

        // Apply reset
        #10 rst = 0;

        // Test case 1: Up-counter with enable
        #10 enable = 1;
        #100 data_in = 4'b1010;
        #100 up_down = 1;
        #200 enable = 0;

        // Test case 2: Down-counter with load
        #10 load = 1;
        #100 data_in = 4'b1101;
        #100 load = 0;
        #100 enable = 1;
        #200 up_down = 0;
        #200 enable = 0;

        // Add more test cases as needed

        // End simulation
        #100 $finish;
    end

endmodule

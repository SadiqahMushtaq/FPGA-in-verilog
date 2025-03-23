`timescale 1ns / 1ps

module CLB_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk = 0;
    reg reset;
    reg [1:0] in1;
    reg [1:0] in2;
    reg in3;
    reg mux_in;
//    wire [1:0] out1;
//    wire out2;
//    wire [1:0] out1_delayed;
//    wire out2_delayed;
    wire [1:0] out1_final;
    wire out2_final;

    // Instantiate the CLB module
    CLB uut (
        .clk(clk),
        .reset(reset),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .mux_in(mux_in),
//        .out1(out1),
//        .out2(out2),
//        .out1_delayed(out1_delayed),
//        .out2_delayed(out2_delayed)
        .out1_final(out1_final),
        .out2_final(out2_final)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Reset generation
    initial begin
        reset = 1;
        mux_in = 1'b0;
        #20;
        reset = 0;
    end

    // Test stimulus
    initial begin
        // Test case 1
        #30;
        in1 = 2'b00;
        in2 = 2'b00;
        in3 = 0;
        mux_in = 1'b0;
        #10;
        // Expected output: sum = 2'b00, cout = 0

        // Test case 2
        in1 = 2'b01;
        in2 = 2'b10;
        in3 = 0;
        mux_in = 1'b1;
        #20;
        // Expected output: sum = 2'b11, cout = 0

        // Test case 3
        in1 = 2'b11;
        in2 = 2'b11;
        in3 = 1;
        mux_in = 1'b0;
        #10;
        // Expected output: sum = 2'b10, cout = 1


        $stop; // Stop simulation
    end

endmodule
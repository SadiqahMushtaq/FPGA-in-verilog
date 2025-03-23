`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 12:42:52 AM
// Design Name: 
// Module Name: FPGA_new_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module FPGA_new_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg reset;
    reg [7:0] In_1;
    reg [7:0] In_2;
    reg [7:0] bitfile_input;
    wire [7:0] Sum;
    wire Cout;

    // Instantiate the module under test
    FPGA_new uut (
        .clk(clk),
        .reset(reset),
        .In_1(In_1),
        .In_2(In_2),
        .bitfile_input(bitfile_input),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generation
    always #CLK_PERIOD clk = ~clk;

    initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    In_1 = 8'b0000000;
    In_2 = 8'b00000000;
    bitfile_input = 8'b11100100; // Keeping bitfile_input constant

    // Apply test vectors
    reset = 1; // Assert reset
    #10
    // Apply input values for Test Case 3
    reset = 1'b0;
    In_1 = 8'b10101010;
    In_2 = 8'b01010101;
    #40; // Wait for 100 ns
    // Apply input values for Test Case 4
    reset = 1'b0;
    In_1 = 8'b11111111;
    In_2 = 8'b00000001;
    #200; // Wait for 100 ns
//    #10 reset = 0; // Deassert reset

//    // Apply input values for Test Case 1
//    In_1 = 8'b00001111;
//    In_2 = 8'b01010101;
//    #200 reset = 0; // Deassert reset

//    // Apply input values for Test Case 2
//    In_1 = 8'b00101111;
//    In_2 = 8'b11011101;
//    #200; // Wait for 100 ns

//    // Apply input values for Test Case 3
//    In_1 = 8'b10101010;
//    In_2 = 8'b01010101;
//    #200; // Wait for 100 ns

//    // Apply input values for Test Case 4
//    In_1 = 8'b11110000;
//    In_2 = 8'b00001111;
//    #200; // Wait for 100 ns

//    // Apply input values for Test Case 4
//    In_1 = 8'b01000000;
//    In_2 = 8'b01000000;
//    #200; // Wait for 100 ns
    $finish; // Finish simulation
end


    // Monitor outputs
    always @(posedge clk) begin
        $display("Sum: %h, Cout: %b", Sum, Cout);
    end

endmodule

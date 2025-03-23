`timescale 1ns / 1ps

module two_bit_full_adder_tb;

// Parameters
parameter PERIOD = 10;

// Signals
reg [1:0] A, B;
reg Cin;
wire [1:0] sum;
wire Cout;

// Instantiate the unit under test (UUT)
two_bit_full_adder dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .sum(sum),
    .Cout(Cout)
);

// Clock generation
reg clk = 0;
always #5 clk = ~clk;

// Test stimulus
initial begin
    // Test case 1
    A = 2'b00; B = 2'b00; Cin = 1'b0;
    #PERIOD;
    
    // Test case 2
    A = 2'b01; B = 2'b01; Cin = 1'b0;
    #PERIOD;
    
    // Test case 3
    A = 2'b10; B = 2'b10; Cin = 1'b0;
    #PERIOD;
    
    // Test case 4
    A = 2'b11; B = 2'b11; Cin = 1'b0;
    #PERIOD;
    
    // Add more test cases as needed
    
    // Finish simulation
    $finish;
end

endmodule

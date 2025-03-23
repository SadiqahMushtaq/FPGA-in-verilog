`timescale 1ns / 1ps

module D_FlipFlop_testbench;

// Parameters
parameter PERIOD = 10;

// Signals
reg clk = 0;
reg d;
reg reset;
wire q;

// Instantiate the unit under test (UUT)
D_FlipFlop dff_inst(
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

// Test stimulus
initial begin
    // Reset initialization
    reset = 1;
    d = 0;
    #20 reset = 0;

    // Test case 1: Data changes on each clock edge
    #20;
    d = 1;
    #20;
    d = 0;
    #20;
    d = 1;
    #20;

    // Test case 2: Data changes irregularly
    #20;
    d = 1;
    #30;
    d = 0;
    #40;
    d = 1;
    #10;

    // Test case 3: Data changes on rising clock edges only
    #20;
    d = 1;
    #10;
    d = 0;
    #20;
    d = 1;
    #10;

    // Test case 4: Reset is asserted
    #20;
    reset = 1;
    #10;
    reset = 0;
    #20;
    d = 1;
    #20;
    d = 0;
    #20;

    // Add more test cases as needed

    // Finish simulation
    $finish;
end

endmodule

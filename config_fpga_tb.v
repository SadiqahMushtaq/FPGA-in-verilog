`timescale 1ns / 1ps

module config_fpga_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg [1:0] Sum_CLB1, Sum_CLB2, Sum_CLB3, Sum_CLB4;
    reg Cin_CLB1, Cin_CLB2, Cin_CLB3, Cin_CLB4;
    reg Cout_CLB1, Cout_CLB2, Cout_CLB3, Cout_CLB4, C_external;
    reg [1:0] sel1, sel2, sel3, sel4;
    wire [7:0] Sum_final;
    reg CLK;

    // Instantiate the module under test
    config_fpga uut (
        .Sum_CLB1(Sum_CLB1),
        .Sum_CLB2(Sum_CLB2),
        .Sum_CLB3(Sum_CLB3),
        .Sum_CLB4(Sum_CLB4),
        .Cout_CLB1(Cout_CLB1),
        .Cout_CLB2(Cout_CLB2),
        .Cout_CLB3(Cout_CLB3),
        .Cout_CLB4(Cout_CLB4),
        .C_external(C_external),
        .sel1(sel1),
        .sel2(sel2),
        .sel3(sel3),
        .sel4(sel4),
        .Sum_final(Sum_final),
        .Cin_CLB1(Cin_CLB1),
        .Cin_CLB2(Cin_CLB2),
        .Cin_CLB3(Cin_CLB3),
        .Cin_CLB4(Cin_CLB4)
    );

    // Clock generation
    always #CLK_PERIOD CLK = ~CLK;

    // Test stimulus
    initial begin
        CLK = 0;
        // Initialize inputs
        Sum_CLB1 = 2'b00;
        Sum_CLB2 = 2'b00;
        Sum_CLB3 = 2'b00;
        Sum_CLB4 = 2'b00;
        Cout_CLB1 = 1;
        Cout_CLB2 = 0;
        Cout_CLB3 = 1;
        Cout_CLB4 = 0;
        C_external = 0;
        sel1 = 2'b00;
        sel2 = 2'b00;
        sel3 = 2'b00;
        sel4 = 2'b00;

        // Apply test vectors
        #10 Sum_CLB1 = 2'b01; // Set Sum_CLB1 to 01
        #10 Sum_CLB2 = 2'b10; // Set Sum_CLB2 to 10
        #10 Sum_CLB3 = 2'b11; // Set Sum_CLB3 to 11
        #10 Sum_CLB4 = 2'b00; // Set Sum_CLB4 to 00
        #10 sel1 = 2'b01; // Set sel1 to 01
        #10 sel2 = 2'b10; // Set sel2 to 10
        #10 sel3 = 2'b11; // Set sel3 to 11
        #10 sel4 = 2'b00; // Set sel4 to 00
        #10 C_external = 1; // Set C_external to 1

        #100; // Wait for 100 ns
        $finish; // Finish simulation
    end

endmodule

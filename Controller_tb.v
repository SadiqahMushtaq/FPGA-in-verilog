`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 11:14:12 PM
// Design Name: 
// Module Name: Controller_tb
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


`timescale 1ns / 1ps

module Controller_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg [7:0] bitfile;
    wire [1:0] Control_signal1, Control_signal2, Control_signal3, Control_signal4;
    reg CLK;

    // Instantiate the module under test
    Controller uut (
        .bitfile(bitfile),
        .Control_signal1(Control_signal1),
        .Control_signal2(Control_signal2),
        .Control_signal3(Control_signal3),
        .Control_signal4(Control_signal4)
    );

    // Clock generation
    always #CLK_PERIOD CLK = ~CLK;

    // Test stimulus
    initial begin
        CLK = 0;
        // Initialize inputs
        bitfile = 8'b00000000;

        // Apply test vectors
        #10 bitfile = 8'b11101110; // Set bitfile to 10101010

        #100; // Wait for 100 ns
        $finish; // Finish simulation
    end

    // Monitor outputs
    always @(posedge CLK) begin
        $display("Control_signal1: %b, Control_signal2: %b, Control_signal3: %b, Control_signal4: %b", 
                 Control_signal1, Control_signal2, Control_signal3, Control_signal4);
    end

endmodule


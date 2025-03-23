`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 10:57:34 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input wire [7:0] bitfile,
    output reg [1:0] Control_signal1,
    output reg [1:0] Control_signal2,
    output reg [1:0] Control_signal3,
    output reg [1:0] Control_signal4
    );
    
    always @* begin
        // Slice the bitfile into 2-bit segments for each control signal
        Control_signal1 = bitfile[1:0];
        Control_signal2 = bitfile[3:2];
        Control_signal3 = bitfile[5:4];
        Control_signal4 = bitfile[7:6];
    end
    
endmodule

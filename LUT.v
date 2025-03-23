`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2024 01:12:06 PM
// Design Name: 
// Module Name: LUT
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


module LUT(
    input [3:0] gray,
    output reg [3:0] binary
);

always @(*)
    case(gray)
        4'b0000: binary = 4'b0000;
        4'b0001: binary = 4'b0001;
        4'b0011: binary = 4'b0010;
        4'b0010: binary = 4'b0011;
        4'b0110: binary = 4'b0100;
        4'b0111: binary = 4'b0101;
        4'b0101: binary = 4'b0110;
        4'b0100: binary = 4'b0111;
        4'b1100: binary = 4'b1000;
        4'b1101: binary = 4'b1001;
        4'b1111: binary = 4'b1010;
        4'b1110: binary = 4'b1011;
        4'b1010: binary = 4'b1100;
        4'b1011: binary = 4'b1101;
        4'b1001: binary = 4'b1110;
        4'b1000: binary = 4'b1111;
        default: binary = 4'bxxxx; // Error condition
    endcase

endmodule

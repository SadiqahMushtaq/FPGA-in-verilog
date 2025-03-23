`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2024 11:58:18 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input A,      // First input bit
    input B,      // Second input bit
    input cin,    // Carry input
    output sum,   // Sum output
    output cout   // Carry output
);

    assign cout = (A && B) || (A && cin) || (B && cin);
    assign sum = A ^ B ^ cin;

endmodule
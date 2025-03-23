`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 04:02:03 PM
// Design Name: 
// Module Name: CLB
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
////////////////////////////////////////////////////////////////////////////////

module CLB(
    input wire clk,
    input wire reset,
    input wire [1:0] in1,
    input wire [1:0] in2,
    input wire in3,
    input wire mux_in,
//    output wire [1:0] out1,
//    output wire out2,
//    output wire [1:0] out1_delayed,
//    output wire out2_delayed,
    output reg [1:0] out1_final,
    output reg out2_final
);

wire [1:0] out1, out1_delayed;   
wire out2, out2_delayed;

// Instance of a two-bit full adder
two_bit_full_adder adder_inst1 (
    .A(in1),        // Input 1
    .B(in2),        // Input 2
    .Cin(in3),        // Carry in
    .sum(out1),        // Sum output
    .Cout(out2)       // Carry output
     );
     
D_FlipFlop dff_inst1(
    .d(out1),
    .clk(clk),
    .reset(reset),
    .q(out1_delayed)
    );
    
D_FlipFlop dff_inst2(
    .d(out2),
    .clk(clk),
    .reset(reset),
    .q(out2_delayed)
    );
     
always @(posedge clk) begin     
    case (mux_in)
        1'b0: begin
            out1_final = out1;
            out2_final = out2;
            end
        1'b1: begin
            out1_final = out1_delayed;
            out2_final = out2_delayed;
            end
        default: begin
            out1_final = out1;
            out2_final = out2;
            end
        endcase
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 11:40:57 PM
// Design Name: 
// Module Name: FPGA
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


module FPGA_new(
    input wire clk,
    input wire reset,
    input wire [7:0] In_1,
    input wire [7:0] In_2,
    input wire [7:0] bitfile_input,
    output wire [7:0] Sum,
    output wire Cout
    );
    
    wire [1:0] Control_signal1, Control_signal2, Control_signal3, Control_signal4;
//    reg [1:0] In_11, In_12, In_13, In_14, In_21, In_22, In_23, In_24;
    wire [1:0] In_11, In_12, In_13, In_14, In_21, In_22, In_23, In_24;
    wire [1:0] sel1, sel2, sel3, sel4;
    wire [1:0] out11_final, out12_final, out13_final, out14_final;
    wire out21_final, out22_final, out23_final, out24_final;
    wire Cin_CLB1, Cin_CLB2, Cin_CLB3, Cin_CLB4;
    
//    always @(In_1, In_2) begin
//        In_11 <= In_1[1:0];
//        In_12 <= In_1[3:2];
//        In_13 <= In_1[5:4];
//        In_14 <= In_1[6:7];
        
//        In_21 <= In_2[1:0];
//        In_22 <= In_2[3:2];
//        In_23 <= In_2[5:4];
//        In_24 <= In_2[6:7];
//   end
   
//        assign In_11 = In_1[1:0];
//        assign In_12 = In_1[3:2];
//        assign In_13 = In_1[5:4];
//        assign In_14 = In_1[7:6];
        
//        assign In_21 = In_2[1:0];
//        assign In_22 = In_2[3:2];
//        assign In_23 = In_2[5:4];
//        assign In_24 = In_2[7:6];

   
    
    Controller controller_inst1(
        .bitfile(bitfile_input),
        .Control_signal1(sel1),
        .Control_signal2(sel2),
        .Control_signal3(sel3),
        .Control_signal4(sel4)
        );
        
    CLB clb_inst1(
        .clk(clk),
        .reset(reset),
        .in1(In_11),
        .in2(In_21),
        .in3(Cin_CLB1),
        .mux_in(1'b1),                      // Not delayed
        .out1_final(out11_final),
        .out2_final(out21_final)
    );
    
    CLB clb_inst2(
        .clk(clk),
        .reset(reset),
        .in1(In_12),
        .in2(In_22),
        .in3(Cin_CLB2),
        .mux_in(1'b1),                       // Not delayed
        .out1_final(out12_final),
        .out2_final(out22_final)
    );
    
    CLB clb_inst3(
        .clk(clk),
        .reset(reset),
        .in1(In_13),
        .in2(In_23),
        .in3(Cin_CLB3),
        .mux_in(1'b1),                          // Not delayed
        .out1_final(out13_final),
        .out2_final(out23_final)
    );
    
    CLB clb_inst4(
        .clk(clk),
        .reset(reset),
        .in1(In_14),
        .in2(In_24),
        .in3(Cin_CLB4),
        .mux_in(1'b1),                 // Not delayed
        .out1_final(out14_final),
        .out2_final(out24_final)
    );
    
    // Instantiate the module
    config_fpga config_inst1(
        .In_1(In_1),
        .In_2(In_2),
        .Sum_CLB1(out11_final),
        .Sum_CLB2(out12_final),
        .Sum_CLB3(out13_final),
        .Sum_CLB4(out14_final),
        .Cout_CLB1(out21_final),
        .Cout_CLB2(out22_final),
        .Cout_CLB3(out23_final),
        .Cout_CLB4(out24_final),
        .C_external(1'b0),
        .sel1(sel1),
        .sel2(sel2),
        .sel3(sel3),
        .sel4(sel4),
        .Sum_final(Sum),
        .Cin_CLB1(Cin_CLB1),
        .Cin_CLB2(Cin_CLB2),
        .Cin_CLB3(Cin_CLB3),
        .Cin_CLB4(Cin_CLB4),
        .Cout_final(Cout),
        .In_11(In_11),
        .In_12(In_12),
        .In_13(In_13),
        .In_14(In_14),
        .In_21(In_21),
        .In_22(In_22),
        .In_23(In_23),
        .In_24(In_24)
    );
    
//    config_fpga config_inst1(
//        .Sum_CLB1(out11_final),
//        .Sum_CLB2(out12_final),
//        .Sum_CLB3(out13_final),
//        .Sum_CLB4(out14_final),
//        .Cout_CLB1(out21_final),
//        .Cout_CLB2(out22_final),
//        .Cout_CLB3(out23_final),
//        .Cout_CLB4(out24_final),
//        .C_external(1'b0),
//        .sel1(sel1),
//        .sel2(sel2),
//        .sel3(sel3),
//        .sel4(sel4),
//        .Sum_final(Sum),
//        .Cin_CLB1(Cin_CLB1),
//        .Cin_CLB2(Cin_CLB2),
//        .Cin_CLB3(Cin_CLB3),
//        .Cin_CLB4(Cin_CLB4),
//        .Cout_final(Cout)
//    );
    
//    assign Cout = out24_final;
    
endmodule
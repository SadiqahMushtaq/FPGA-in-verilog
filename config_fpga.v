`timescale 1ns / 1ps

module config_fpga(
    input wire [7:0] In_1,
    input wire [7:0] In_2, 
    input wire [1:0] Sum_CLB1,
    input wire [1:0] Sum_CLB2,
    input wire [1:0] Sum_CLB3,
    input wire [1:0] Sum_CLB4,
    input wire Cout_CLB1,       // carry coming from CLB1
    input wire Cout_CLB2,       // carry coming from CLB2
    input wire Cout_CLB3,       // carry coming from CLB3
    input wire Cout_CLB4,       // carry coming from CLB4
    input wire C_external,      // carry that is not coming from any CLB
    input wire [1:0] sel1,      // control signal from mux of CLB1
    input [1:0] sel2,      // control signal from mux of CLB2
    input [1:0] sel3,      // control signal from mux of CLB3
    input [1:0] sel4,      // control signal from mux of CLB4
    output [7:0] Sum_final,       // concatenated sum
    output reg Cin_CLB1,       // Cin to CLB1
    output reg Cin_CLB2,       // Cin to CLB2
    output reg Cin_CLB3,       // Cin to CLB3
    output reg Cin_CLB4,       // Cin to CLB4
    output reg Cout_final,
    output reg [1:0] In_11,  // first input to CLB1
    output reg [1:0] In_12,  // first input to CLB2
    output reg [1:0] In_13,  // first input to CLB3
    output reg [1:0] In_14,  // first input to CLB4
    output reg [1:0] In_21,  // second input to CLB1
    output reg [1:0] In_22,  // second input to CLB2
    output reg [1:0] In_23,  // second input to CLB3
    output reg [1:0] In_24   // second input to CLB4
    );
    
    wire [1:0] num1_1, num1_2, num1_3, num1_4, num2_1, num2_2, num2_3, num2_4; 
        // Input 1
        assign num1_1 = In_1[1:0];   // first slice 
        assign num1_2 = In_1[3:2];   // second slice
        assign num1_3 = In_1[5:4];   // third slice
        assign num1_4 = In_1[7:6];   // fourth slice
        // Input 2
        assign num2_1 = In_2[1:0];   // first slice
        assign num2_2 = In_2[3:2];   // second slice
        assign num2_3 = In_2[5:4];   // third slice
        assign num2_4 = In_2[7:6];   // fourth slice
        
//    case
always @ * begin
    // first CLB
    case (sel1) 
        // This should make three muxes for each of the inputs to CLB
        2'b00 : begin 
                Cin_CLB1 <= C_external; 
                In_11 <= num1_1; In_21 <= num2_1; 
//                Cout_final <= Cout_final;
//                Sum1 = Sum_CLB1;
                end  // This is the first CLB(A)
                
        2'b01 : begin 
                Cin_CLB1 <= Cout_CLB2; 
                In_11 <= num1_2;
                In_21 <= num2_2; 
//                Sum1 <= Sum_CLB2;
//                Cout_final <= Cout_final; // CLB2 --> CLB1
                end  
        2'b10 : begin 
                Cin_CLB1 <= Cout_CLB3; 
                In_11 <= num1_3; 
                In_21 <= num2_3; 
//                Cout_final <= Cout_final;  // x --> CLB3 --> CLB1
                end 
        2'b11 : begin 
                Cin_CLB1 <= Cout_CLB4; 
                In_11 <= num1_4; 
                In_21 <= num2_4; 
                Cout_final <= Cout_CLB1;  // x --> x --> CLB4 --> CLB1
                end 
        default: begin Cin_CLB1 <= Cin_CLB1; In_11 <= In_11; In_21 <= In_22; Cout_final <= Cout_final; end
    endcase
    
    // second CLB
    case (sel2) 
        2'b00 : begin 
                Cin_CLB2 <= C_external; 
                In_12 <= num1_1; 
                In_22 <= num2_1; 
//                Sum2 <= Sum_CLB2; 
//                Cout_final <= Cout_final; // This is the first CLB(A)
                end  
        2'b01 : begin 
                Cin_CLB2 <= Cout_CLB1;
                In_12 <= num1_2; 
                In_22 <= num2_2; 
//                Sum2 <= Sum_CLB1;
//                Cout_final <= Cout_final;  // CLB1 --> CLB2
                end   
        2'b10 : begin 
                Cin_CLB2 <= Cout_CLB3;
                In_12 <= num1_3; 
                In_22 <= num2_3; 
//                Cout_final <= Cout_final;  // x --> CLB3 --> CLB2
                end   
        2'b11 : begin 
                Cin_CLB2 <= Cout_CLB4;
                In_12 <= num1_4; 
                In_22 <= num2_4; 
                Cout_final <= Cout_CLB2;  // x --> x --> CLB4 --> CLB2
                end   
        default: begin Cin_CLB2 <= Cin_CLB2;In_12 <= In_12; In_22 <= In_22; Cout_final <= Cout_final; end   
    endcase
    
    // 
    case (sel3) 
        2'b00 : begin 
                Cin_CLB3 <= C_external; 
                In_13 <= num1_1; 
                In_23 <= num2_1; 
//                Cout_final <= Cout_final; // This is the first CLB(A)
                end  
        2'b01 : begin 
                Cin_CLB3 <= Cout_CLB1; 
                In_13 <= num1_2; 
                In_23 <= num2_2; 
//                Sum3 <= Sum_CLB1
//                Cout_final <= Cout_final; // CLB1 --> CLB3
                end   
        2'b10 : begin 
                Cin_CLB3 <= Cout_CLB2; 
                In_13 <= num1_3; 
                In_23 <= num2_3; 
//                Cout_final <= Cout_final; // x --> CLB2 --> CLB3
                end    
        2'b11 : begin 
                Cin_CLB3 <= Cout_CLB4; 
                In_13 <= num1_4; 
                In_23 <= num2_4; 
                Cout_final <= Cout_CLB3;  // x --> x --> CLB4 --> CLB3
                end   
        default: begin Cin_CLB3 <= Cin_CLB3; In_13 <= In_13; In_23 <= In_23; Cout_final <= Cout_final; end
    endcase
    
    case (sel4) 
        2'b00 : begin 
                Cin_CLB4 <= C_external; 
                In_14 <= num1_1; 
                In_24 <= num2_1; 
//                Cout_final <= Cout_final; // This is the first CLB(A)
                end  
        2'b01 : begin 
                Cin_CLB4 <= Cout_CLB1; 
                In_14 <= num1_2; 
                In_24 <= num2_2; 
//                Cout_final <= Cout_final; // CLB1 --> CLB4
                end   
        2'b10 : begin 
                Cin_CLB4 <= Cout_CLB2; 
                In_14 <= num1_3; 
                In_24 <= num2_3; 
//                Cout_final <= Cout_final;  // x --> CLB2 --> CLB4
                end   
        2'b11 : begin 
                Cin_CLB4 <= Cout_CLB3; 
                In_14 <= num1_4; 
                In_24 <= num2_4; 
                Cout_final <= Cout_CLB4;  // x --> x --> CLB4 --> CLB4
                end   
        default: begin Cin_CLB4 <= Cin_CLB4; In_14 <= In_14; In_24 <= In_24; Cout_final <= Cout_final; end
    endcase
end

assign Sum_final = {Sum_CLB4, Sum_CLB3, Sum_CLB2, Sum_CLB1};   
endmodule
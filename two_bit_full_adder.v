`timescale 1ns / 1ps

module two_bit_full_adder(
    input [1:0] A, B,
    input Cin,
    output reg [1:0] sum,
    output reg Cout
);

always @* begin
    // LUT for addition
    case({Cin, A, B})
        5'b00000: begin 
            sum = 2'b00; 
            Cout = 1'b0; 
            end
        
        5'b00001: begin 
            sum = 2'b01; 
            Cout = 1'b0; 
            end
        5'b00010: begin 
            sum = 2'b10; 
            Cout = 1'b0; 
            end
        5'b00011: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b00100: begin 
            sum = 2'b01; 
            Cout = 1'b0; 
            end
        5'b00101: begin 
            sum = 2'b10; 
            Cout = 1'b0; 
            end
        5'b00110: begin
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b00111: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b01000: begin 
            sum = 2'b10; 
            Cout = 1'b0; 
            end
        5'b01001: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b01010: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b01011: begin 
            sum = 2'b01; 
            Cout = 1'b1; 
            end
        5'b01100: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b01101: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b01110: begin 
            sum = 2'b01; 
            Cout = 1'b1; 
            end
        5'b01111: begin 
            sum = 2'b10; 
            Cout = 1'b1; 
            end
        5'b10000: begin 
            sum = 2'b01; 
            Cout = 1'b0; 
            end
        5'b10001: begin 
            sum = 2'b10; 
            Cout = 1'b0; 
            end
        5'b10010: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b10011: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b10100: begin 
            sum = 2'b10; 
            Cout = 1'b0; 
            end
        5'b10101: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b10110: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b10111: begin 
            sum = 2'b01; 
            Cout = 1'b1; 
            end
        5'b11000: begin 
            sum = 2'b11; 
            Cout = 1'b0; 
            end
        5'b11001: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b11010: begin 
            sum = 2'b01; 
            Cout = 1'b1; 
            end
        5'b11011: begin 
            sum = 2'b10; 
            Cout = 1'b1; 
            end
        5'b11100: begin 
            sum = 2'b00; 
            Cout = 1'b1; 
            end
        5'b11101: begin 
            sum = 2'b01; 
            Cout = 1'b1; 
            end
        5'b11110: begin 
            sum = 2'b10; 
            Cout = 1'b1; 
            end
        5'b11111: begin 
            sum = 2'b11; 
            Cout = 1'b1; 
            end
        default:  begin 
            sum = 2'b00; 
            Cout = 1'b0; 
            end 
    endcase
end

endmodule
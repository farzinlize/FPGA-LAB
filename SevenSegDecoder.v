`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:36 03/08/2017 
// Design Name: 
// Module Name:    SevenSegDecoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SevenSegDecoder(
    input [3:0] input1,
    output reg [6:0] output1
    );

always @(*) begin
case (input1)
	4'b0000 :      	//Hexadecimal 0
		output1 = 7'b1111110;
	4'b0001 :    		//Hexadecimal 1
		output1 = 7'b0110000;
	4'b0010 :  			// Hexadecimal 2
		output1 = 7'b1101101 ; 
	4'b0011 : 			// Hexadecimal 3
		output1 = 7'b1111001 ;
	4'b0100 :			// Hexadecimal 4
		output1 = 7'b0110011 ;
	4'b0101 :			// Hexadecimal 5
		output1 = 7'b1011011 ;  
	4'b0110 :			// Hexadecimal 6
		output1 = 7'b1011111 ;
	4'b0111 :			// Hexadecimal 7
		output1 = 7'b1110000;
	4'b1000 :     		//Hexadecimal 8
		output1 = 7'b1111111;
	4'b1001 :    		//Hexadecimal 9
		output1 = 7'b1111011 ;
	4'b1010 :  			// Hexadecimal A
		output1 = 7'b1110111 ; 
	4'b1011 : 			// Hexadecimal B
		output1 = 7'b0011111;
	4'b1100 :			// Hexadecimal C
		output1 = 7'b1001110 ;
	4'b1101 :			// Hexadecimal D
		output1 = 7'b0111101 ;
	4'b1110 :			// Hexadecimal E
		output1 = 7'b1001111 ;
	4'b1111 :			// Hexadecimal F
		output1 = 7'b1000111 ;
endcase
	output1 = ~output1;
end


endmodule

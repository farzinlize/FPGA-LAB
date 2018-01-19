`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:12:07 03/08/2017 
// Design Name: 
// Module Name:    DIPswitch 
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
module DIPswitch(
	input [7:0] in,
	output [6:0] display1,
	output [6:0] display2
   );

SevenSegDecoder instance_name (
    .input1(in[3:0]), 
    .output1(display1)
    );
	 SevenSegDecoder instance_name2 (
    .input1(in[7:4]), 
    .output1(display2)
    );

endmodule

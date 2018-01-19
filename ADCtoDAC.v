`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:56 03/12/2017 
// Design Name: 
// Module Name:    ADCtoDAC 
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
module ADCtoDAC(
	 input clk,
    input reset,
    output [9:0] out,
	 output clka,
	 output clkb,
	 output DACWriteA,
	 output DACWriteB,
	 
	 input [9:0] in,
	 output SDI,
	 output CLKIN,
	 output OE,
	 output SCLK
    );

assign SDI = 1'b0;
assign OE =	1'b0;
assign CLKIN = clk;
assign SCLK = clk;

assign clka = clk;
assign clkb = clk;
assign DACWriteA = clk;
assign DACWriteB = clk;

assign out = in;

endmodule

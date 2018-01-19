`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:27 04/05/2017 
// Design Name: 
// Module Name:    LAB-TOP 
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
module LAB_TOP(
	 input clock,
	 input [9:0] video,
	 output [6:0] display1,
	 output [6:0] display2,
	 output SDI,
	 output CLKIN,
	 output OE,
	 output SCLK
    );

assign SDI = 1'b0;
assign OE =	1'b0;
assign CLKIN = clock;
assign SCLK = clock;

parameter threshold = 10'b0000111111;
parameter threshold2 = 10'b0011111111;
wire enable;
wire [31:0] PW;
wire [31:0] PA;
wire [31:0] TOA;
wire [31:0] PRF;
wire [31:0] PC;

ChangeCLK CH_CK (
    .CLK(clock), 
    .newClock(enable)
    );

PD2TH pd2th (
    .clock(clock), 
    .enable(enable), 
    .video(video), 
    .threshold1(threshold), 
    .threshold2(threshold2), 
    .PW(PW), 
    .PA(PA), 
    .TOA(TOA), 
    .PRF(PRF), 
    .PC(PC)
    );

//PD1TH pd1th (
//    .clock(clock), 
//    .enable(enable), 
//    .video(video), 
//    .threshold(threshold), 
//    .PW(PW),
//    .PA(PA),
//    .TOA(TOA),
//    .PRF(PRF),
//    .PC(PC)
//    );

SevenSegDecoder SEG1 (
    .input1(PW[3:0]), 
    .output1(display1)
    );
	 
SevenSegDecoder SEG2 (
    .input1(PW[7:4]), 
    .output1(display2)
    );
	 
endmodule

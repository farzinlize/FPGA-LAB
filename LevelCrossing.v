`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:36:34 03/08/2017 
// Design Name: 
// Module Name:    LevelCrossing 
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
module LevelCrossing(
    input [9:0] in,
	 input [7:0] threshold,
    output [6:0] display1,
	 output [6:0] display2,
    input clk,
	 output SDI,
	 output CLKIN,
	 output OE,
	 output SCLK
    );

assign SDI = 1'b0;
assign OE =	1'b0;
assign CLKIN = clk;
assign SCLK = clk;


wire [9:0] newTH = {8'b00010100,2'b0};
reg [7:0] out;
reg flag;

initial begin
	out = 0;
	flag = 0;
end

SevenSegDecoder instance_name (
    .input1(out[3:0]), 
    .output1(display1)
    );

SevenSegDecoder instance_name1 (
    .input1(out[7:4]), 
    .output1(display2)
    );

always@(posedge clk) begin
	if (flag) begin
		if(in < newTH) begin
			flag <= 0;
		end
	end else begin
		if(in > newTH) begin
			out <= out + 1;
			flag <= 1;
		end else begin end
	end
end

endmodule

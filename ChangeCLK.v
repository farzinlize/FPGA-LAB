`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:13 03/08/2017 
// Design Name: 
// Module Name:    ChangeCLK 
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
module ChangeCLK(
    input CLK,
	 input reset,
    output reg CLKOUT
    );
	reg [31:0]counter;
	initial begin
		counter <= 0;
		CLKOUT <= 0;
	end
	always@(posedge CLK)
		begin
			if (~reset)
				begin
					counter <= 0;
				end
			if (counter == 23999000)
				begin
					counter <= 0;
					CLKOUT <= 1;
				end
			else
				begin
					counter <= counter + 1;
					CLKOUT <= 0;
				end
		end
endmodule

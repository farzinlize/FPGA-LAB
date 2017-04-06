`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Farzin Mohammadi 
// 
// Create Date:    01:08:56 03/08/2017 
// Design Name: 
// Module Name:    BCDcounter 
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
module BCDcounter(
    input clock,
    input reset,
    output [6:0] display1, 
	 output [6:0] display2
    );
	
	reg [3:0] seg1=0;
	reg [3:0] seg2=0;
	wire CLKOUT;

ChangeCLK clockChanger (
    .CLK(clock), 
    .reset(reset), 
    .CLKOUT(CLKOUT)
    );


SevenSegDecoder SEG_1 (
    .input1(seg1), 
    .output1(display1)
    );
	
	
SevenSegDecoder SEG_2 (
    .input1(seg2), 
    .output1(display2)
    );
	
	
	always@(posedge clock) begin
	if(CLKOUT)
	begin
		if(!reset)
			begin
				seg1 <= 0;
				seg2 <= 0;
				end
		else if(seg1 == 9)
			begin 
				seg2 <= seg2 +1;
				seg1 <= 0;
				end
		else if(seg2 == 10)
		begin
				seg2 <= 0;
		end
		else
		begin
		seg1 <= seg1 + 1;
		end
	end
	end

endmodule

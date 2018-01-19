`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:28:41 03/08/2017 
// Design Name: 
// Module Name:    ramp 
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
module ramp(
    input clk,
    input reset,
    output reg [9:0] out = 0,
	 output clka,
	 output clkb,
	 output DACWriteA,
	 output DACWriteB
    );
	 
	assign clka = clk;
	assign clkb = clk;
	assign DACWriteA = clk;
	assign DACWriteB = clk;
	 
always@(posedge clk) begin
	if(reset) begin
		out <= 0;
	end else begin
		out <= out + 1;
	end
end

endmodule

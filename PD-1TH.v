`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:13 03/28/2017 
// Design Name: 
// Module Name:    PD-1TH 
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
module PD1TH #(parameter VIDEO_SIZE=10)(
	 input clock,
	 input enable,
	 input [VIDEO_SIZE-1:0] video,
	 input [VIDEO_SIZE-1:0] threshold,
	 output reg [31:0] PW,
    output reg [31:0] PA,
    output reg [31:0] TOA,
	 output reg [31:0] PRF,
	 output reg [31:0] PC
    );

reg state;
reg [127:0] TIME;

initial begin
	PA = 0;
	PW = 0;
	TOA = 0;
	TIME = 0;
	state = 0;
	PC = 0;
end
	 
always@(posedge clock)begin
	if(enable) begin
		if(state)begin //Pulse Active
			if(video < threshold)begin //Pulse Ended
				state <=0;
				PW <= TIME - TOA;
			end else begin					//Pulse Still Active
				if(video > PA)
					PA <= video;
			end
		end else begin //No Pulse
			if(video >= threshold)begin	//Pulse Detected
				TOA <= TIME;
				PA <= video;
				state <= 1;
				PC <= PC + 1;
			end else begin 					//Still No Pulse
			
			end
		end
		TIME <= TIME + 1;
	end
end

endmodule

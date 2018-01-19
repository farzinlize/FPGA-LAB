`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:50 04/05/2017 
// Design Name: 
// Module Name:    PD-2TH 
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
module PD2TH #(parameter VIDEO_SIZE=10)(
	 input clock,
	 input enable,
	 input [VIDEO_SIZE-1:0] video,
	 input [VIDEO_SIZE-1:0] threshold1,
	 input [VIDEO_SIZE-1:0] threshold2,
	 output reg [31:0] PW,
    output reg [31:0] PA,
    output reg [31:0] TOA,
	 output reg [31:0] PRF,
	 output reg [31:0] PC
    );

reg [1:0] state;
reg [127:0] TIME;

initial begin
	PW = 0;
	PA = 0;
	TOA = 0;
	TIME = 0;
	state = 0;
	PC = 0;
end

always@(posedge clock)begin
	if(enable)begin
		TIME <= TIME+1;
		case(state)
		2'b00: begin //State 0
			if(video >= threshold1 && video < threshold2) begin //Rising Pulse
				state <= 1;
				TOA <= TIME;
				PA <= video;
			end else if(video >= threshold2) begin //Pulse Detected
				state <= 2;
				TOA <= TIME;
				PA <= video;
				PC <= PC + 1;
			end
		end
		2'b01: begin //State 1
			if(video >= threshold2) begin //Pulse Detected
				state <= 2;
				PA <= video;
				PC <= PC + 1;
			end else if(video < threshold1) begin //Fake Rise
				state <= 0;
			end
		end
		2'b10: begin //State 2
			if(video < threshold2 && video >= threshold1) begin //Falling Pulse
				state <= 3;
			end else if(video < threshold1) begin //Pulse Ended
				state <= 0;
				PW <= TIME - TOA;
			end else begin //Still Active
				if(video > PA)
					PA <= video;
			end
		end
		2'b11: begin //State 3
			if(video < threshold1) begin //Pulse Ended
				state <= 0;
				PW <= TIME - TOA;
			end else if(video >= threshold2) begin //Fake Fall
				state <= 2;
				if(video > PA)
					PA <= video;
			end
		end
		endcase
	end
end

endmodule

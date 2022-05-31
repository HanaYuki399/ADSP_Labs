`include "filter.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2022 12:34:18 AM
// Design Name: 
// Module Name: inter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inter(
		clk, 
		enb, 
		reset, 
		filter_out, 
		multi);
		
input clk,enb,reset;
output [15 : 0] multi;
output [17 : 0] filter_out;

multitone S1(.clk(clk),.sine(multi));



 
		
filter U1( clk, //input clk
 enb, // output rfd
 reset, // output rdy
 multi, // input [15 : 0] din   
 filter_out); //output [32 : 0] dout 
endmodule

  


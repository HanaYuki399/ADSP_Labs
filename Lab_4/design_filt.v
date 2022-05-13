`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2022 12:34:50 AM
// Design Name: 
// Module Name: design_filt
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


module design_filt(clk,clk_en,reset,sine,noise,dout,mixed
    );
	 input clk;
	 input clk_en;
	 input reset;
	 output[15:0] noise,sine,mixed;
	 output[31:0] dout;
	 
	 /*noise_ip n(
	 .clk(clk),.sine(noise));*/
	 
	 sine_ip s(
	 .clk(clk),.sine(sine));
	 assign mixed=sine+noise; //with noise 
	 //assign mixed=sine;//without noise
	 filter_iir_2 U1(
	 .clk(clk),.clk_enable(clk_en),.reset(reset),.filter_in(mixed),.filter_out(dout));
endmodule

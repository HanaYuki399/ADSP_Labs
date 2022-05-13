`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:28 05/11/2022 
// Design Name: 
// Module Name:    top_mod_lab_3_tut 
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
module top_mod_lab_3_tut(clk,sine,noise,rfd,rdy,dout,mixed
);
input clk; output [15 : 0] noise,sine,mixed;
output [32 : 0] dout;
output rfd,rdy;
noise_ip n(
.clk(clk), // input clk
.sine(noise) // output [15 : 0] sine
);
sine_ip s(
.clk(clk), // input clk
.sine(sine) // output [15 : 0] sine
);
assign mixed= sine + noise; fip_ip U1 ( .clk(clk), // input clk
.rfd(rfd), // output rfd
.rdy(rdy), // output rdy
.din(mixed), // input [15 : 0] din 
.dout(dout)); // output [32 : 0] dout 
endmodule
    



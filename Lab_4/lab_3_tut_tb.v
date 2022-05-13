`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:16 05/11/2022 
// Design Name: 
// Module Name:    lab_3_tut_tb 
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
module lab_3_tut_tb;
// Inputs 
reg clk; // Outputs
wire [15:0] sine;
wire [15:0] noise; 
wire rfd; 
wire rdy;
wire [32:0] dout;
wire [15:0] mixed;
// Instantiate the Unit Under Test (UUT)
Fir_filter uut (
.clk(clk), .sine(sine), .noise(noise),
.rfd(rfd), .rdy(rdy), .dout(dout), .mixed(mixed)
);
initial begin
// Initialize Inputs
clk = 0;
#100; // Wait 100 ns for global reset to finish
// Add stimulus here
end
always clk=~clk; 
endmodule




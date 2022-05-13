`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2022 12:31:47 AM
// Design Name: 
// Module Name: IIR_tb
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


module IIR_tb;


	// Inputs
	reg clk;
	reg clk_en;
	reg reset;

	// Outputs
	wire [15:0] sine;
	wire [15:0] noise;
	wire [31:0] dout;
	wire [15:0] mixed;

	// Instantiate the Unit Under Test (UUT)
	design_filt uut (
		.clk(clk), 
		.clk_en(clk_en), 
		.reset(reset), 
		.sine(sine), 
		.noise(noise), 
		.dout(dout), 
		.mixed(mixed)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_en=0;
		reset=1;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		clk_en=1;
        
		// Add stimulus here

	end
	always #20 clk=~clk;
      
endmodule



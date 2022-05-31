
/*module sine_wave_gen(Clk,data_out);
//declare input and output
    input clk;
    output [7:0] data_out;
//declare the sine ROM - 30 registers each 8 bit wide.  
    reg [7:0] sine [0:29];
//Internal signals  
    integer i;  
    reg [7:0] data_out; 
//Initialize the sine rom with samples. 
    initial begin
        i = 0;
        sine[0] = 0;
        sine[1] = 16;
        sine[2] = 31;
        sine[3] = 45;
        sine[4] = 58;
        sine[5] = 67;
        sine[6] = 74;
        sine[7] = 77;
        sine[8] = 77;
        sine[9] = 74;
        sine[10] = 67;
        sine[11] = 58;
        sine[12] = 45;
        sine[13] = 31;
        sine[14] = 16;
        sine[15] = 0;
        sine[16] = -16;
        sine[17] = -31;
        sine[18] = -45;
        sine[19] = -58;
        sine[20] = -67;
        sine[21] = -74;
        sine[22] = -77;
        sine[23] = -77;
        sine[24] = -74;
        sine[25] = -67;
        sine[26] = -58;
        sine[27] = -45;
        sine[28] = -31;
        sine[29] = -16;
    end
    
    //At every positive edge of the clock, output a sine wave sample.
    always@ (posedge(Clk))
    begin
        data_out = sine[i];
        i = i+ 1;
        if(i == 29)
            i = 0;
    end*/
`timescale 1ns / 1ps

module filter_tb;

	// Inputs
	reg clk;
	reg enb;
	reg reset;
	

	// Outputs
	wire [15:0] multitone;
	
	wire [17:0] filter_out;
	
	// Instantiate the Unit Under Test (UUT)
	inter uut (
		clk, 
		enb, 
		reset, 
		filter_out, 
		multitone	);
	initial begin
		// Initialize Inputs
		clk = 0;
		enb = 0;
		reset = 1;
				
		// Wait 100 ns for global reset to finish
		#100;
		enb = 1;
		reset = 0;
		
      
  		// Add stimulus here
	end
	 always #50 clk=~clk;
endmodule

    
 /*   
    
    
    
module filter_tb;


  reg   clk; 
  reg   enb; 
  reg   reset; 
  reg   signed [15:0] filter_in; //sfix16_En15
  wire  signed [17:0] filter_out; //sfix18_En
  
 Intermed UUT(clk,filter_in) 
 multitone S1(clk,filter_in);

 filter U1
               (
                clk,
                enb,
                reset,
                filter_in,
                filter_out
                );
initial begin

clk = 0;
reset = 0;
enb=0;
#50;
end
always #10 clk=~clk;
initial begin
reset = 1;
enb=1;
#10;
reset = 0;
filter_in=90;
#10
filter_in=0;
#10
filter_in=90;
#10
filter_in=0;
#10
filter_in=90;
#10
filter_in=0;
#10
filter_in=90;
#10
filter_in=0;
#10
filter_in=90;
#10 
filter_in=0;

end
endmodule

*/

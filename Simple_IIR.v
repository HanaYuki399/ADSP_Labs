module IIR_simple(inp,clock, rst, out, in_cd);
input [5:0] inp;
input [5:0]in_cd; //initial_condition
input clock;
input rst;
output out;
reg [5:0] out;
reg [5:0] temp = 6'd0;



//filter
always @(posedge clock, posedge rst)
begin
if(rst==1)
begin
	out<=0;
end
end


always @(in_cd)
begin
temp<=in_cd;
end

always @(inp)
begin
temp=0.5*temp;
out=inp+(temp);
temp=out;
end
endmodule

module IIR_simple_tb;
reg [5:0] inp;
reg clock=0;
reg rst;
reg [5:0] in_cd;
wire [5:0]out;

IIR_simple U1(.inp(inp),.clock(clock),.rst(rst),.out(out), .in_cd(in_cd));

//clock
always
begin
#5 clock=1;
#5 clock=0;
end


//input signal
initial
begin
in_cd=0;
rst=1;
#5
rst=0;
inp=6'd2;

#10
inp=6'd4;
#10
inp=6'd6;
#10
inp=6'd3;
#10
rst=1;
in_cd=1;
rst=0;
inp=6'd2;
#10

inp=6'd1;
#10

inp=6'd3;
#10

inp=6'd6;



end
endmodule

/*
inp=9;
#10
inp=3;
#10
inp=5;
#10
inp=5;
#10
inp=7;
*/




	



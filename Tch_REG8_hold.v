module Tch_REG8_hold;
parameter N = 8; // number of bits
reg clk,s,rst_n;
reg signed [N-1:0] din;
wire signed [N-1:0] qout;
REG8_hold reg_test (clk, rst_n, din, qout,s);
initial
begin
    clk=0;rst_n=0;
    #10 din=128; s=0; 
    #10 din=56; s=0;rst_n=1;
    #10 din=43; s=0;
    #10 din=27; s=0;
    #10 din=68; s=1;
    #10 din=230; s=1; 
    #10 din=75; s=1; 
    #10 din=83; s=1;
    #10 din=13; s=1;
end
initial
    $monitor ($time, " rst_n = %d, din = %d, qout = %d, s=%d",rst_n,din,qout,s);
always
    #5 clk=~clk;
initial 
    #100 $finish;
endmodule

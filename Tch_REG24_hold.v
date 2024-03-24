module Tch_REG24_hold;
parameter N = 24; // number of bits
reg clk,s,rst_n;
reg signed [N-1:0] din;
wire signed [N-1:0] qout;
REG24_hold reg_test (clk, rst_n, din, qout,s);
initial
begin
    clk=0;rst_n=0;
    #10 din=1280; s=0; 
    #10 din=1456; s=0; rst_n=1;
    #10 din=1143; s=0;
    #10 din=3527; s=0;
    #10 din=6668; s=0;
    #10 din=7230; s=0; 
    #10 din=8975; s=1; 
    #10 din=1183; s=1;
    #10 din=1783; s=1;
    #10 din=1328; s=1; rst_n=0;
    #10 din=6656; s=1; 
    #10 din=4343; s=1;
    #10 din=1427; s=1; rst_n=1;
    #10 din=3268; s=1; 
    #10 din=7330; s=0; 
    #10 din=5975; s=0; 
    #10 din=1183; s=1;
    #10 din=1013; s=1;
end
initial
    $monitor ($time, " rst_n = %d, din = %d, qout = %d, s=%d",rst_n,din,qout,s);
always
    #5 clk=~clk;
initial 
    #1000 $finish;
endmodule
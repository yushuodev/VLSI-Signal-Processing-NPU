module TchREG8out;

parameter N=8;
reg clk;
reg rst_n;
reg [N-1:0] in;
reg s;
wire [N-1:0] out;

REG8out reg8out(clk,rst_n,in,out,s);

initial
begin
    clk=0;
    rst_n=0;
    s=0;
    in=0;
    #1 rst_n=1;
    #2 in=1;
    #2 in=2;
    #2 in=3;
    #2 in=4;
    #2 in=5;
    #2 in=6;
    #2 in=7;
    #2 in=8;
    #2 in=9;
    #2 in=10;
    #2 in=11;
    #2 in=12;
    #2 in=13;
    #2 in=14;
    #2 in=15;
    #2 in=16;
    #2 in=17;
    rst_n=0;
end

always
begin
    #1 clk=~clk;
end


initial
begin
    #50 $finish;
end


endmodule
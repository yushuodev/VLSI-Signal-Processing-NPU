module REG8out(clk,rst_n,in,out,s);
parameter N=8;
input clk,s,rst_n;
input signed [N-1:0] in;
output signed [N-1:0] out;
wire signed [N-1:0] wire1;
wire signed [N-1:0] wire2;
wire signed [N-1:0] wire3;
wire signed [N-1:0] wire4;
wire signed [N-1:0] wire5;
wire signed [N-1:0] wire6;
wire signed [N-1:0] wire7;
wire signed [N-1:0] wire8;
wire signed [N-1:0] wire9;
wire signed [N-1:0] wire10;
wire signed [N-1:0] wire11;


REG8_hold reg8hold1(clk,rst_n,in,wire1,s);
REG8_hold reg8hold2(clk,rst_n,wire1,wire2,s);
REG8_hold reg8hold3(clk,rst_n,wire2,wire3,s);
REG8_hold reg8hold4(clk,rst_n,wire3,wire4,s);
REG8_hold reg8hold5(clk,rst_n,wire4,wire5,s);
REG8_hold reg8hold6(clk,rst_n,wire5,wire6,s);
REG8_hold reg8hold7(clk,rst_n,wire6,wire7,s);
REG8_hold reg8hold8(clk,rst_n,wire7,wire8,s);
REG8_hold reg8hold9(clk,rst_n,wire8,wire9,s);
REG8_hold reg8hold10(clk,rst_n,wire9,wire10,s);
REG8_hold reg8hold11(clk,rst_n,wire10,wire11,s);
REG8_hold reg8hold12(clk,rst_n,wire11,out,s);

endmodule
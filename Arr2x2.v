module Arr2x2(Err_mac, Err_mult,
             w1_in, w2_in,
             a1_in, a2_in,
             c1_out, c2_out,
             clk, rst_n, hold);
//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);
input [7:0] w1_in, w2_in, a1_in, a2_in;
input clk, rst_n, hold;
input Err_mac, Err_mult;

output [23:0] c1_out, c2_out;

wire [7:0] w11_out, w21_out, w12_out, w22_out;
wire [7:0] a11_out, a21_out, a12_out, a22_out;
wire [23:0] c11_out, c21_out, c12_out, c22_out;

//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk1, clk2);
PEreg PE11(Err_mac, Err_mult, w1_in, a1_in, 24'sh00_0000, w11_out, a11_out, c11_out, clk, rst_n, hold);
PEreg PE21(Err_mac, Err_mult, w2_in, a11_out, 24'sh00_0000, w21_out, a21_out, c21_out, clk, rst_n, hold);
PEreg PE12(Err_mac, Err_mult, w11_out, a2_in, c11_out, w12_out, a12_out, c12_out, clk, rst_n, hold);
PEreg PE22(Err_mac, Err_mult, w21_out, a12_out, c21_out, w22_out, a22_out, c22_out, clk, rst_n, hold);

//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);

assign c1_out = c12_out;
assign c2_out = c22_out;

endmodule

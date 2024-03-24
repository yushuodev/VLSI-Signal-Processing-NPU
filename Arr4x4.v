module Arr4x4(Err_mac, Err_mult,
             w1_in, w2_in, w3_in, w4_in,
             a1_in, a2_in, a3_in, a4_in,
             w1_out, w2_out, w3_out, w4_out,
             a1_out, a2_out, a3_out, a4_out,
             c1_out, c2_out, c3_out, c4_out,
             clk, rst_n, hold);
//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);
input [7:0] w1_in, w2_in, w3_in, w4_in;
input [7:0] a1_in, a2_in, a3_in, a4_in;
input clk, rst_n, hold;
input [15:0] Err_mac, Err_mult;

output [7:0] w1_out, w2_out, w3_out, w4_out;
output [7:0] a1_out, a2_out, a3_out, a4_out;
output [23:0] c1_out, c2_out, c3_out, c4_out;



wire [7:0]  w11_out, w21_out, w31_out, w41_out,
            w12_out, w22_out, w32_out, w42_out,
            w13_out, w23_out, w33_out, w43_out,
            w14_out, w24_out, w34_out, w44_out;
wire [7:0]  a11_out, a21_out, a31_out, a41_out,
            a12_out, a22_out, a32_out, a42_out,
            a13_out, a23_out, a33_out, a43_out,
            a14_out, a24_out, a34_out, a44_out;
wire [23:0] c11_out, c21_out, c31_out, c41_out,
            c12_out, c22_out, c32_out, c42_out,
            c13_out, c23_out, c33_out, c43_out,
            c14_out, c24_out, c34_out, c44_out;

//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk1, clk2);
PEreg PE11( Err_mac[0],  Err_mult[0], w1_in, a1_in,   24'sh00_0000, w11_out, a11_out, c11_out, clk, rst_n, hold);
PEreg PE21( Err_mac[1],  Err_mult[1], w2_in, a11_out, 24'sh00_0000, w21_out, a21_out, c21_out, clk, rst_n, hold);
PEreg PE31( Err_mac[2],  Err_mult[2], w3_in, a21_out, 24'sh00_0000, w31_out, a31_out, c31_out, clk, rst_n, hold);
PEreg PE41( Err_mac[3],  Err_mult[3], w4_in, a31_out, 24'sh00_0000, w41_out, a41_out, c41_out, clk, rst_n, hold);
  
PEreg PE12( Err_mac[4],  Err_mult[4], w11_out, a2_in,   c11_out, w12_out, a12_out, c12_out, clk, rst_n, hold);
PEreg PE22( Err_mac[5],  Err_mult[5], w21_out, a12_out, c21_out, w22_out, a22_out, c22_out, clk, rst_n, hold);
PEreg PE32( Err_mac[6],  Err_mult[6], w31_out, a22_out, c31_out, w32_out, a32_out, c32_out, clk, rst_n, hold);
PEreg PE42( Err_mac[7],  Err_mult[7], w41_out, a32_out, c41_out, w42_out, a42_out, c42_out, clk, rst_n, hold);
  
PEreg PE13( Err_mac[8],  Err_mult[8], w12_out, a3_in,   c12_out, w13_out, a13_out, c13_out, clk, rst_n, hold);
PEreg PE23( Err_mac[9],  Err_mult[9], w22_out, a13_out, c22_out, w23_out, a23_out, c23_out, clk, rst_n, hold);
PEreg PE33(Err_mac[10], Err_mult[10], w32_out, a23_out, c32_out, w33_out, a33_out, c33_out, clk, rst_n, hold);
PEreg PE43(Err_mac[11], Err_mult[11], w42_out, a33_out, c42_out, w43_out, a43_out, c43_out, clk, rst_n, hold);

PEreg PE14(Err_mac[12], Err_mult[12], w13_out, a4_in,   c13_out, w14_out, a14_out, c14_out, clk, rst_n, hold);
PEreg PE24(Err_mac[13], Err_mult[13], w23_out, a14_out, c23_out, w24_out, a24_out, c24_out, clk, rst_n, hold);
PEreg PE34(Err_mac[14], Err_mult[14], w33_out, a24_out, c33_out, w34_out, a34_out, c34_out, clk, rst_n, hold);
PEreg PE44(Err_mac[15], Err_mult[15], w43_out, a34_out, c43_out, w44_out, a44_out, c44_out, clk, rst_n, hold);
//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);

assign c1_out = c14_out;
assign c2_out = c24_out;
assign c3_out = c34_out;
assign c4_out = c44_out;

assign w1_out = w14_out;
assign w2_out = w24_out;
assign w3_out = w34_out;
assign w4_out = w44_out;

assign a1_out = a41_out;
assign a2_out = a42_out;
assign a3_out = a43_out;
assign a4_out = a44_out;

endmodule

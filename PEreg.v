module PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);

input signed [7:0] w_in, a_in;
input signed [23:0] c_in;
input Err_mac , Err_mult;
input clk;
input rst_n;
input hold;

output signed [7:0] w_out, a_out;
output signed [23:0] c_out;

wire signed [23:0] p_sum;

PE PE_no_reg(Err_mac, Err_mult, w_out, a_out, c_in, p_sum);
//PE(Err_mac, Err_mult, w_in, a_in, c_in, c_out);

REG8_hold regW(clk, rst_n, w_in, w_out, hold);
REG8_hold regA(clk, rst_n, a_in, a_out, 1'b0);
REG24_hold regC(clk, rst_n, p_sum, c_out, 1'b0);

endmodule

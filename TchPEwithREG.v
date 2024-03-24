module TchPEwithREG;
reg Err_mac;
reg Err_mult;
reg signed [7:0] w_in;
reg signed [7:0] a_in;
reg signed [23:0] c_in;
reg clk;
reg rst_n;
reg hold;
wire signed [23:0]c_out;
wire signed [7:0] a_out;
wire signed [7:0] w_out;
PEreg PE1(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);
//PEreg(Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold);
initial
begin
    rst_n = 1'b1;
    #1;
    rst_n = 1'b0;
    #1;
    rst_n = 1'b1;
end

initial
begin
    clk = 1'b0;
    hold = 1'b0;
    Err_mac = 1'b0;
    Err_mult = 1'b0;
    w_in = 8'd87;
    a_in = 8'd65;
    c_in = 24'd43;
    #10;
    w_in = -8'd87;
    a_in = 8'd65;
    c_in = 24'd43;
    #10
    w_in = -8'd87;
    a_in = -8'd65;
    c_in = 24'd43;
    #10
    w_in = 8'd87;
    a_in = 8'd65;
    c_in = -24'd43;
    #10
    w_in = -8'd87;
    a_in = 8'd65;
    c_in = -24'd43;
    #10
    w_in = -8'd87;
    a_in = -8'd65;
    c_in = -24'd43;
end

always
begin
    #5 clk=~clk;
end

initial
begin
    #1000 $finish;
end

initial
begin
   $monitor($time,"Err_mac=%d, Err_mult=%d, w_in=%d, a_in=%d, c_in=%d, w_out=%d, a_out=%d, c_out=%d, clk=%d, rst_n=%d, hold=%d",Err_mac, Err_mult, w_in, a_in, c_in, w_out, a_out, c_out, clk, rst_n, hold); 
end

endmodule
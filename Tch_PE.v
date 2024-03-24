module Tch_PE;

reg Err_mac;
reg Err_mult;
reg signed [7:0] w_in;
reg signed [7:0] a_in;
reg signed [23:0] c_in;
wire signed [23:0]c_out;
PE PE1(Err_mac, Err_mult, w_in, a_in, c_in, c_out);

initial
begin
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

initial
begin
    #1000 $finish;
end

initial
begin
   $monitor($time," Err_mac = %d, Err_mult= %d, w_in= %d, a_in=%d, c_in= %d, c_out= %d",Err_mac, Err_mult, w_in, a_in, c_in, c_out); 
end
endmodule

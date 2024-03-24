module TchREGout;
reg clk;
reg rst_n;
reg s;
reg p_button,s_button;
reg [31:0] in;
wire [7:0] out;

REGout regout(clk,rst_n,in,out,s,p_button,s_button);

initial
begin
    clk=1'b0;
    rst_n=1'b1;
    s=1'b0;
    rst_n=1'b0;
    p_button=1'b0;
    s_button=1'b0;
    #1 rst_n=1'b1;
    @(posedge clk) in=32'b11000000000000000000000000000000;
    @(posedge clk) in=32'b10101000101000000000000000000000;
    @(posedge clk) in=32'b10010000100011001000000000000000;
    @(posedge clk) in=32'b01111000011110000111000001100000;
    @(posedge clk) in=32'b01100000011001000110000001010100;
    @(posedge clk) in=32'b01001000010100000101000001001000;
    @(posedge clk) in=32'b00110000001111000100000000111100;
    @(posedge clk) in=32'b00011000001010000011000000110000;
    @(posedge clk) in=32'b00000000000101000010000000100100;
    @(posedge clk) in=32'b00000000000000000001000000011000;
    @(posedge clk) in=32'b00000000000000000000000000001100;
    @(posedge clk)s=1'b1;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)p_button=~p_button;
    @(posedge clk)p_button=~p_button;

    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)p_button=~p_button;
    @(posedge clk)p_button=~p_button;

    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)p_button=~p_button;
    @(posedge clk)p_button=~p_button;

    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)s_button=~s_button;
    @(posedge clk)p_button=~p_button;
    @(posedge clk)p_button=~p_button;
end


always
begin
    #10 clk=~clk;
end
/*
always


begin
    #20 p_button=~p_button;
end
*/

initial
begin
    #1000 $finish;
end

initial
begin
    $monitor($time,"clk = %d, rst_n = %d, in= %d, out = %d, s = %d, p_button = %d",clk,rst_n,in,out,s,p_button);
end


endmodule
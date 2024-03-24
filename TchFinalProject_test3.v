module TchFinalProject_test3;
reg clk;
reg x;
reg rst;
reg Err_mac;
reg Err_mult;
reg [1:0] c_select;
wire [7:0] led;
reg next;

FinalProject finalproject(clk,x,rst,led,Err_mac,Err_mult,c_select,next);

initial
begin
    clk=1'b0;
    x=1'b0;
    rst=1'b0;
    Err_mac=1'b0;
    Err_mult=1'b0;
    c_select=2'b00;
    next=0;
    #1 rst=1'b1;
    #1 rst=1'b0;
    #20 x=1'b1;
    #20 x=1'b0; 

    #500
    x=1'b1;
    c_select=2'b01;
    #10 x=1'b0;

    #500
    x=1'b1;
    c_select=2'b10;
    #20 x=1'b0;

    #500
    x=1'b1;
    c_select=2'b11;
    #20 x=1'b0;

end

initial
begin
    #350 next=1;
    #10 next=0;
    #10 next=1;
    #10 next=0;
    #10 next=1;
end

always
begin
    #2 clk=~clk;
end

initial
begin
    #5000 $finish;
end


endmodule
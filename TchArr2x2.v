module TchArr2x2;

reg Err_mac;
reg Err_mult;
reg [7:0] w1_in;
reg [7:0] w2_in;
reg [7:0] a1_in;
reg [7:0] a2_in;
wire [23:0] c1_out;
wire [23:0] c2_out;
reg clk;
reg rst_n;
reg hold;

Arr2x2 arr1(Err_mac, Err_mult, w1_in, w2_in, a1_in, a2_in, c1_out, c2_out, clk, rst_n, hold);

initial
begin
    Err_mac = 1'b0;
    Err_mult = 1'b0;
    clk=1'b0;
    w1_in=0;
    w2_in=0;
    a1_in=0;
    a2_in=0;
    rst_n=1;
    hold=0;
    #1 rst_n = 0;
    #5 rst_n = 1; 
end

initial
begin
    @(posedge clk) begin w1_in=1; w2_in=2; end
    @(posedge clk) begin w1_in=3; w2_in=4; end
    @(posedge clk) begin a1_in=1; a2_in=0; end
    #1 hold=1; //hold weight value
    @(posedge clk) begin a1_in=3; a2_in=2; end
    @(posedge clk) begin a1_in=0; a2_in=4; end
    @(posedge clk) begin a1_in=0; a2_in=0; end
    @(posedge clk) begin a1_in=0; a2_in=0; end
end



always
begin
    #5 clk=~clk;
end

initial
begin
    #100 $finish;
end

initial
begin
    $monitor($time,"w1_in = %d, w2_in = %d, a1_in = %d, a2_in = %d, c1_out= %d, c2_out= %d",w1_in,w2_in,a1_in,a2_in, c1_out, c2_out);
end

endmodule
module TchArr4x4_test1;

reg [15:0] Err_mac;
reg [15:0] Err_mult;
reg [7:0] w1_in;
reg [7:0] w2_in;
reg [7:0] w3_in;
reg [7:0] w4_in;
reg [7:0] a1_in;
reg [7:0] a2_in;
reg [7:0] a3_in;
reg [7:0] a4_in;
wire [7:0] w1_out;
wire [7:0] w2_out;
wire [7:0] w3_out;
wire [7:0] w4_out;
wire [7:0] a1_out;
wire [7:0] a2_out;
wire [7:0] a3_out;
wire [7:0] a4_out;
wire [23:0] c1_out;
wire [23:0] c2_out;
wire [23:0] c3_out;
wire [23:0] c4_out;
reg clk;
reg rst_n;
reg hold;

Arr4x4 arr1(Err_mac, Err_mult,
             w1_in, w2_in, w3_in, w4_in,
             a1_in, a2_in, a3_in, a4_in,
             w1_out, w2_out, w3_out, w4_out,
             a1_out, a2_out, a3_out, a4_out,
             c1_out, c2_out, c3_out, c4_out,
             clk, rst_n, hold);

initial
begin
    Err_mac = 16'h0000;
    Err_mult = 16'h0000;
    clk=1'b0;
    w1_in=0;
    w2_in=0;
    w3_in=0;
    w4_in=0;
    a1_in=0;
    a2_in=0;
    a3_in=0;
    a4_in=0;
    rst_n=1;
    hold=0;
    #1 rst_n = 0;
    #5 rst_n = 1; 
end

initial
begin
    @(posedge clk) begin w1_in=4; w2_in=3; w3_in=2; w4_in=1; end
    @(posedge clk) begin w1_in=8; w2_in=7; w3_in=6; w4_in=5; end
    @(posedge clk) begin w1_in=4; w2_in=3; w3_in=2; w4_in=1; end
    @(posedge clk) begin w1_in=8; w2_in=7; w3_in=6; w4_in=5; end
    @(posedge clk) begin a1_in=8; a2_in=0; a3_in=0; a4_in=0; end
    #1 hold=1; //hold weight value
    @(posedge clk) begin a1_in=7; a2_in=8; a3_in=0; a4_in=0; end
    @(posedge clk) begin a1_in=6; a2_in=7; a3_in=8; a4_in=0; end
    @(posedge clk) begin a1_in=5; a2_in=6; a3_in=7; a4_in=8; end
    @(posedge clk) begin a1_in=4; a2_in=5; a3_in=6; a4_in=7; end
    @(posedge clk) begin a1_in=3; a2_in=4; a3_in=5; a4_in=6; end
    @(posedge clk) begin a1_in=2; a2_in=3; a3_in=4; a4_in=5; end
    @(posedge clk) begin a1_in=1; a2_in=2; a3_in=3; a4_in=4; end
    @(posedge clk) begin a1_in=0; a2_in=1; a3_in=2; a4_in=3; end
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=1; a4_in=2; end
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=0; a4_in=1; end
    // input補0
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
    @(posedge clk) begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
end



always
begin
    #5 clk=~clk;
end

initial
begin
    #300 $finish;
end

initial
begin
    $monitor($time,"w1_in = %d, w2_in = %d, w3_in = %d, w4_in = %d, a1_in = %d, a2_in = %d,  a3_in = %d,  a4_in = %d c1_out= %d, c2_out= %d, c3_out= %d, c4_out= %d",w1_in,w2_in,w3_in,w4_in,a1_in,a2_in,a3_in,a4_in, c1_out, c2_out,c3_out,c4_out);
end

endmodule
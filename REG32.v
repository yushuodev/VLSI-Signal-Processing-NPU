module REG32(clk,rst_n,in,out);
parameter N=32;
input [N-1:0] in;
input clk,rst_n;
output [N-1:0] out;
reg [N-1:0] out;

always @ (posedge clk or negedge rst_n)
begin
    if(!rst_n) out <= {N{1'b0}};
    else out <= in;
end
endmodule

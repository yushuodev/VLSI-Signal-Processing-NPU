module REG8_v2(clk,rst_n,in,out,s,button);
parameter N=8;
input [N-1:0] in;
input clk,rst_n,s,button;
output [N-1:0] out;
reg clk_wire;
reg [N-1:0] out;
always @ (*)
begin
    case(s)
    1'b0:clk_wire <= clk;
    1'b1:clk_wire <= button;
    endcase
end
always @ (posedge clk_wire or negedge rst_n)
begin
    if(!rst_n) out <= {N{1'b0}};
    else out <= in;
end
endmodule

module REG24_hold(clk,rst_n,in,out,s);
parameter N=24;
input clk,s,rst_n;
input signed [N-1:0] in;
output signed [N-1:0] out;
reg signed [N-1:0] in_wire;
reg signed [N-1:0] out;
always @ (*)
begin
    case(s)
    1'b0:in_wire <= in;
    1'b1:in_wire <= out;
    endcase
end
always @ (posedge clk or negedge rst_n)
begin
    if (!rst_n) out <= {N{1'b0}};
    else out <= in_wire;
end
endmodule

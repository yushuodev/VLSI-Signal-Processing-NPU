module MUX16(s,l,r,o);
input signed [15:0] l, r;
input s;
output signed [15:0] o;
reg [15:0] o;
always @ (*)
begin
    case(s)
        1'b0 : o = l;
        1'b1 : o = r;
    endcase
end
endmodule

module REGout(clk,rst_n,in,out,s,p_button,s_button);
parameter N=32;
input [N-1:0] in;
input clk,rst_n,s,p_button,s_button;
output reg [7:0] out;
wire [7:0] w81,w82,w83,w84;
wire [31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
reg clk_wire;
reg [2:0] counter;
//REG32(clk,rst_n,in,out,s,p_button)

always @ (*)
begin
    case(s)
    1'b0:clk_wire <= clk;
    1'b1:clk_wire <= p_button;
    endcase
end

always @(posedge s_button , negedge rst_n)
begin
	if(!rst_n)
		counter <= 3'b000;
	else if(counter < 3'b011)
		counter <= counter +1;
	else
		counter <= 3'b000;
end

REG32 REG11(clk_wire,rst_n,in,w11);
REG32 REG10(clk_wire,rst_n,w11,w10);
REG32 REG9(clk_wire,rst_n,w10,w9);
REG32 REG8(clk_wire,rst_n,w9,w8);
REG32 REG7(clk_wire,rst_n,w8,w7);
REG32 REG6(clk_wire,rst_n,w7,w6);
REG32 REG5(clk_wire,rst_n,w6,w5);
REG32 REG4(clk_wire,rst_n,w5,w4);
REG32 REG3(clk_wire,rst_n,w4,w3);
REG32 REG2(clk_wire,rst_n,w3,w2);
REG32 REG1(clk_wire,rst_n,w2,w1);

always @ (*)
begin
    case(counter)
        3'b000 : out = w1[31:24];
        3'b001 : out = w1[23:16];
        3'b010 : out = w1[15:8];
        3'b011 : out = w1[7:0];
    endcase
end

endmodule

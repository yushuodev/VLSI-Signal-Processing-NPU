module FinalProject(clk,x,rst,led,Err_mac_in,Err_mult_in,c_select,NEXT);

input NEXT;
input clk;
input x, rst;
input Err_mac_in, Err_mult_in;
input [1:0] c_select;

output [7:0] led;

parameter S0 = 2'b00,S1 = 2'b01,S2=2'b10;

assign rst_n = !rst;

wire [1:0] z;
wire [3:0] counter;

reg [7:0] w1_in;
reg [7:0] w2_in;
reg [7:0] w3_in;
reg [7:0] w4_in;

reg [7:0] a1_in;
reg [7:0] a2_in;
reg [7:0] a3_in;
reg [7:0] a4_in;

reg [7:0] c_temp;

wire [23:0] c1_out;
wire [23:0] c2_out;
wire [23:0] c3_out;
wire [23:0] c4_out;

reg hold;
reg clk_s;
reg [28:0] clk_counter;
reg [15:0] Err_mac, Err_mult;
always @(*)
begin
    if(Err_mac_in)
    Err_mac = 16'b0000_0000_0001_0000;
    else
    Err_mac = 16'b0000_0000_0000_0000;

    if(Err_mult_in)
    Err_mult = 16'b0000_0010_0000_0000;
    else
    Err_mult = 16'b0000_0000_0000_0000;
end

FSM fsm(clk,x,z,rst,counter);
REG8out temp(clk_s, rst_n, c_temp, led, 1'b0);
Arr4x4 SA(Err_mac, Err_mult,
             w1_in, w2_in, w3_in, w4_in,
             a1_in, a2_in, a3_in, a4_in,
             w1_out, w2_out, w3_out, w4_out,
             a1_out, a2_out, a3_out, a4_out,
             c1_out, c2_out, c3_out, c4_out,
             clk, rst_n, hold);

always @(*)
begin
    case(c_select)
        2'b00 :  begin c_temp = c1_out[7:0];end
        2'b01 :  begin c_temp = c2_out[7:0];end
        2'b10 :  begin c_temp = c3_out[7:0];end 
        2'b11 :  begin c_temp = c4_out[7:0];end  
        default :  c_temp = c1_out[7:0];
    endcase
end
//posedge rst

//freq_div
/*
always @(posedge clk)
begin
    if(clk_counter == 28'h0000001)
        clk_div = ~clk_div;
	if(rst==1)
        begin
		clk_counter <= 28'h0000000;
        clk_div = 1'b0; 
        end
	else if(clk_counter < 28'h0a00000)
		clk_counter <= clk_counter +1;
	else
		clk_counter <= 28'h0000000;
end
*/
always @(*)
begin
		case(z)
			S0 : begin
                 clk_s = NEXT;
                 hold = 0;
				 end						
			S1 : begin
                    hold = 0;
                    clk_s = clk;
                    case(counter)
			        4'h0 : begin w1_in=4; w2_in=3; w3_in=2; w4_in=1; end
                    4'h1 : begin w1_in=8; w2_in=7; w3_in=6; w4_in=5; end
                    4'h2 : begin w1_in=4; w2_in=3; w3_in=2; w4_in=1; end
                    4'h3 : begin w1_in=8; w2_in=7; w3_in=6; w4_in=5; end				
		            endcase
				 end
			S2 : begin
                    hold = 1;
                    clk_s = clk;
                    case(counter)
			        4'h0 :begin a1_in=8; a2_in=0; a3_in=0; a4_in=0; end
                    4'h1 :begin a1_in=7; a2_in=8; a3_in=0; a4_in=0; end
                    4'h2 :begin a1_in=6; a2_in=7; a3_in=8; a4_in=0; end
                    4'h3 :begin a1_in=5; a2_in=6; a3_in=7; a4_in=8; end
                    4'h4 :begin a1_in=4; a2_in=5; a3_in=6; a4_in=7; end
                    4'h5 :begin a1_in=3; a2_in=4; a3_in=5; a4_in=6; end
                    4'h6 :begin a1_in=2; a2_in=3; a3_in=4; a4_in=5; end
                    4'h7 :begin a1_in=1; a2_in=2; a3_in=3; a4_in=4; end
                    4'h8 :begin a1_in=0; a2_in=1; a3_in=2; a4_in=3; end
                    4'h9 :begin a1_in=0; a2_in=0; a3_in=1; a4_in=2; end
                    4'ha :begin a1_in=0; a2_in=0; a3_in=0; a4_in=1; end
                    4'hb :begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
		            default: begin a1_in=0; a2_in=0; a3_in=0; a4_in=0; end
                    endcase				
				 end
		endcase
end
endmodule





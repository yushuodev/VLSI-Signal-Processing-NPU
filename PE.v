module PE(Err_mac, Err_mult, w_in, a_in, c_in, c_out);
input signed [7:0] w_in, a_in;
input signed [23:0] c_in;
input Err_mac , Err_mult;

output signed [23:0] c_out;

wire signed [15:0] product;
wire signed [7:0] shift;
wire signed [15:0] acc_in;
//reg signed [23:0] acc_in_24;
wire signed [23:0] acc_out;

//multiplier multi(product, w_in, a_in);
assign product = w_in * a_in;
MUX8 sft(w_in[1],{1'b0,a_in[6:0]},{a_in[6:0],1'b0},shift);
MUX16 bypass_mult(Err_mult,product,{8'h00,shift},acc_in);
MUX24 bypass_MAC(Err_mac,acc_out,c_in,c_out);
//wire [23:0] acc_in_24 = { 8{acc_in[15]} , acc_in[15:0] };

/*
always @ (*)
begin
    //if(acc_in[7]==1) acc_in_24 = {8'b1111_1111,acc_in};
    //else acc_in_24 = {8'b0000_0000,acc_in};
    
end
*/

assign acc_out = c_in + acc_in;
endmodule

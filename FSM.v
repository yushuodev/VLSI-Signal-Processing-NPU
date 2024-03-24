module FSM(clk,x,z,rst,counter);

input clk;
input x, rst;

output [1:0] z;
output reg [3:0] counter;

reg [1:0] Z;
reg [2:0] counter1;
reg [3:0] counter2;
reg [1:0] next_state;
reg [1:0] current_state;
//state encoding
parameter S0 = 2'b00,S1 = 2'b01,S2=2'b10;

//counter1
always @(posedge clk , posedge rst)
begin
	if(rst==1)
		counter1 <= 3'b000;
	else if(counter1 < 3'b011 && current_state==S1)
		counter1 <= counter1 +1;
	else
		counter1 <= 3'b000;
end

//counter2
always @(posedge clk , posedge rst)
begin
	if(rst==1)
		counter2 <= 4'b0000;
	else if(counter2 < 4'b1110 && current_state==S2)
		counter2 <= counter2 +1;
	else
		counter2 <= 4'b0000;
end

//CS
always @(posedge clk , posedge rst)
begin
	if(rst==1)
		begin
		current_state <= S0; 
		
		
		end
	else
		current_state <= next_state;
end

//Z <= 2'b00;
//next_state <= S0;
//OL
assign z = Z;
always @(*)
begin
if(current_state == S1)
		counter <= counter1;
	else
		counter <= counter2;
end

//NL
always @(*)
begin
		case(current_state)
			S0 : begin	
				Z = 2'b00;					
						if(x == 1)begin														
								next_state <= S1;

								end
						else begin						
								next_state <= S0;
								
							end
					 end							

			S1 : begin						
				Z = 2'b01;
						if(counter1 < 3'b011)begin
								next_state <= S1;
								end
						else	begin					
								next_state <= S2;
								
								end
					 end

			S2 : begin						
				Z = 2'b10;
						if(counter2 < 4'b1110)begin
								next_state <= S2;
								
								end
						else	begin					
								next_state <= S0;
								
								end
					 end
			default: next_state <= current_state;
			
		endcase
end

endmodule


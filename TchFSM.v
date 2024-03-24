module TchFSM;

// Declare variables

reg x,clk,rst;

wire [3:0] counter;
wire [1:0] z;


// Instantiate the module HW6_Program2 
FSM fsm(clk,x,z,rst,counter);

// Setup the monitor
initial
	$monitor($time, " x= %b, z=%b,rst=%b,counter=%b\n",x, z,rst,counter);
	
initial
begin
	clk = 1'b0;
	rst = 1'b0;
end

always
	#5 clk = ~clk;

	

// Stimulate the inputs
initial
begin	
	 x = 1'bx; rst = 1'b0;

	@(posedge clk);
	 x = 1'b0; rst = 1'b1;

	@(posedge clk);
	 x = 1'b0; rst = 1'b0;

	@(posedge clk);
	 x = 1'b1; rst = 1'b0;

	@(posedge clk);
	 x = 1'b0; rst = 1'b0;

        @(posedge clk);
	 x = 1'b0; rst = 1'b0;

        @(posedge clk);
	 x = 1'b0; rst = 1'b0;

        @(posedge clk);
	 x = 1'b0; rst = 1'b0;
	
        @(posedge clk);
	 x = 1'b0; rst = 1'b0;
	 
        @(posedge clk);
	 x = 1'b0; rst = 1'b0;

  
	#200 $stop;
end

endmodule 
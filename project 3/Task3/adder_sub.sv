//An Adder-Subtractor: Arithmetic Combinational Circuit

module adder_sub(
    input logic [15:0] 	op1,op2,  
	input logic 		Op,		
    output [15:0] 		Out,
	output logic 		over, carry
    );
	 
	logic [16:0] x,y,z;	
	logic over_add, over_sub;
	assign x = {1'b0, op1};
	assign y = {1'b0, op2};
	
	//combinational logic
	always_comb
	begin
	if(Op)
		begin
			z = x - y;
			over = over_sub;
		end	
	else
		begin
			z = x + y; 
			over = over_add;
		end	
	end

	assign over_add = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);
	assign over_sub = (x[15] & ~y[15] & ~z[15]) | (~x[15] & y[15] & z[15]);
	assign carry = z[16];
	assign Out = z[15:0];	
endmodule: adder_sub
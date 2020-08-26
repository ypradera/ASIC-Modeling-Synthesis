

module adder_sub_tb();
timeunit 1ns/1ns;
	logic signed[15:0] op1;
	logic signed[15:0] op2;
	logic Op, over, carry;
	logic signed[15:0] Out;
	logic signed [15:0] x_s, y_s;
	
	//Instantiation
	adder_sub uut (.*);
	
	initial
	begin
		op1 = 0;
		op2 = 0;
		Op = 0;
		$monitor("number1 = %d :: number2 = %d :: Out = %d :: Overflow = %d :: Carry = %d :: Op  = %d", op1, op2, Out, over, carry, Op);
	
		#10;
		op1 = 16'd2000;
			op2 = 16'd1000;
			Op = 0;		
		
		#10;
		op1 = 16'd2000;
			op2 = 16'd1000;
			Op = 1;	

		#10;
		op1 =  16'd2000;
			op2 = -16'd1000;
			Op = 0;		
		
		#10;
		op1 = 16'd2000;
			op2 = -16'd1000;
			Op = 1;


		#10;
		op1 = -16'd2000;
			op2 = -16'd1000;
			Op = 0;		
		
		#10;
		op1 = -16'd2000;
			op2 = -16'd1000;
			Op = 1;
		#10;
		
		repeat(10)
		begin
			op1 = $random;
			op2 = $random;
			#10;
				Op = ~Op;
		end
		#10 $stop;
	end

endmodule
	
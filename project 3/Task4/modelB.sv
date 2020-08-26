	////////////////////////////////////////////////////////////// 
//
// Yusme Pradera ypradera@pdx.edu
// Tamarr Stigler
//  
// Date: 7/30/2020
//
// ModelB FSM with regular case statement with one-hot state coding
// 
////////////////////////////////////////////////////////////////

module modelB(

	input logic clk, rst, x,
	output logic out
);

	
	typedef enum logic [6:0]{
					one  = 7'b0000001,
					two  = 7'b0000010, 
					tree = 7'b0000100,
					four = 7'b0001000,
					five = 7'b0010000,
					six  = 7'b0100000,
					seven= 7'b1000000 } statetype;
		
		statetype state, nextState;
		
		always_ff @(posedge clk , posedge rst) begin
			if (rst) state <= one;
			else 	 state <= nextState;
		end
			
	always_comb begin //for inputs
	unique	case (state)
			one: if(x)	nextState = two;
				 else	nextState = one;
				 
			two: if(x)	nextState = tree;
				 else 	nextState = two;
				 
		    tree: if(x) nextState = four;
				  else	nextState = tree;
			
			four: if(x) nextState = five;
				  else  nextState = four;
				  
			five: if(x) nextState = six;
				  else  nextState = five;
			
			six: if(x) nextState = seven;
				  else  nextState = six;
			
			seven:if(x) nextState = one;
				  else  nextState = seven;
				  	
		endcase
	end
			
	//outputs	
	assign out = (state == one | state == seven);
	
	endmodule: modelB
////////////////////////////////////////////////////////////// 
//
// Yusme Pradera ypradera@pdx.edu
// Tamarr Stigler
//  
// Date: 7/30/2020
//
// ModelA FSM with regular case statement with binary state coding
// 
////////////////////////////////////////////////////////////////

module modelA(

	input logic clk, rst, x,
	output logic out
);
       
	typedef enum logic [2:0] {one, two ,tree ,four, five, six, seven} statetype;

		statetype state, nextState;
		
		always_ff @(posedge clk, posedge rst) begin
			if (rst)  state <= one;
			else 	   state <= nextState;
		end
			
	always_comb begin //for inputs
		unique case (state)
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
				//default: nextState = one;  
		endcase
	end
		
	//outputs	
	assign out = (state == one | state == seven);	
	
	endmodule: modelA
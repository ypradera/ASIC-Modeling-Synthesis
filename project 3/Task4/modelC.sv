////////////////////////////////////////////////////////////// 
//
// Yusme Pradera ypradera@pdx.edu
// Tamarr Stigler
//  
// Date: 7/30/2020
//
// ModelC FSM with reverse case statement with one-hot state coding
// 
////////////////////////////////////////////////////////////////
module modelC(

	input logic clk, rst, x,
	output logic out
);

	parameter
		one  = 0, two  = 1, tree = 2,four = 3,
		five = 4, six  = 5, seven= 6 ;
		
		logic [6:0] state, next;
		
		always_ff @(posedge clk , posedge rst) begin
			if (rst) begin 
				   state     <= '0; //default assignment 
				  state[one] <= 1'b1;
			end

			else  state <= next;
		end
			
	always_comb begin //for inputs
		next = 7'b0;
	unique case (1'b1)// this is reverse case 
		state[one]: if(x)	next[two] = 1'b1;
				 else		next[one] = 1'b1;
				 
	 	state[two]: if(x)	next[tree] = 1'b1;
				 else 		next[two]  = 1'b1;
				 
		 state[tree]: if(x) next[four] = 1'b1;
				  else		next[tree] = 1'b1;
			
	 	state[four]: if(x) 	next[five] = 1'b1;
				  else  	next[four] = 1'b1;
				  
		state[five]: if(x) 	next[six]  = 1'b1;
				  else  	next[five] = 1'b1;
			
		state[six]: if(x) 	next[seven] = 1'b1;
				  else  	next[six]   = 1'b1;
			
		state[seven] :if(x) next[one]   = 1'b1;
				  else  	next[seven] = 1'b1;
		
		endcase
	end
			
	//outputs	
	assign out = (state == one | state == seven);
	
	endmodule: modelC

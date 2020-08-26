//////////////////////////////////////////////////////////////
// problem6.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/1/2020
//  
// 1 - Implementation of a circuit whose 32-bit output is formed by shifting 
// its 32-bit input three positions to the right and filling the vacant positions
// with the bit that was in the MSB before the shift occurred (shift arithmetic right).
// 
// 2 -  Write an SV model of a circuit whose 32-bit output is formed by 
// shifting its 32-bit input three positions to the left and filling 
// the vacant positions with 0 (shift logical left).
//  
////////////////////////////////////////////////////////////////



module shifter(
	input reg [31:0] in, //32-bit vector 
	output reg [31:0] out //32-bit vector 
);
	
	always_comb
		if (in[31]) begin 
			out <= in >> 3; //shift the bit positions of 3 
			out[31] <= 1;
			out[30] <= 1;
			out[29] <= 1; 
			end 
		else begin 
			out <= in >> 3; 
			out[31] <= 0; 
			out[30] <= 0;
			out[29] <= 0; 
		end 
endmodule: shifter 
	
module right;

	bit [31:0] x; 
	bit [31:0] y;

	initial
		begin 
		x = 32'b11100000000000000000000000000000;
          $display(" Initalized Input:                         %32b", x);
		y = x >> 3; 
          $display("New Output after shifting to the right:    %32b", y);
		end 
endmodule: right 

module left;

	bit [31:0] x; 
	bit [31:0] y;

	initial
		begin 
		x = 32'b11100000000000000000000000000000;
          $display("Initalized Input:                          %32b", x);
		y = x << 3; 
          $display("New Output after shifting to the left:     %32b", y);
		end 
endmodule: left 
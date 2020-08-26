//////////////////////////////////////////////////////////////
// problem4_P1.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 5/1/2020
//
//
// Project Description: Write an SV behavioral model 
// for a 16-bit carry look ahead adder 
// 
////////////////////////////////////////////////////////////////

module CLA_16BIT(A, B, cin, cout, sum);

input [15:0] A; 
input [15:0] B; 
input cin; //Carry IN
output cout; //Carry OUT 
output [15:0] sum; 

wire c4, c8, c12, c16; 

assign cout = c16; //The Last Carryout 


CLA_4BIT first(
	.ain(A[3:0]),
	.bin(B[3:0]),
	.cin(cin),
	.cout(c4),
	.sum(sum[3:0])
);

CLA_4BIT second(
	.ain(A[7:4]),
	.bin(B[7:4]),
	.cin(c4),
	.cout(c8),
	.sum(sum[7:4])
);

CLA_4BIT third(
	.ain(A[11:8]),
	.bin(B[11:8]),
	.cin(c8),
	.cout(c12),
	.sum(sum[11:8])
);

CLA_4BIT fourth(
	.ain(A[15:12]),
	.bin(B[15:12]),
	.cin(c12),
	.cout(c16),
	.sum(sum[15:12])
);

endmodule: CLA_16BIT 

module CLA_4BIT(ain, bin, cin, cout, sum);
	input [3:0] ain, bin; 
	input cin; 	
	output cout; 
	output [3:0] sum;

	wire [3:0] P, G, CO; 
	wire C4; 

	assign P = ain ^ bin; //XOR both inputs 
	assign G = ain & bin; //Anding both inputs 

	assign CO[0] = cin; 
	assign CO[1] = G[0] | (P[0] & CO[0]);
	assign CO[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & CO[0]); 
	assign CO[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & CO[0]);
	assign c4 = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | 
		(P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & CO[0]);
	assign sum = P ^ CO; 
	assign cout = c4; 

endmodule: CLA_4BIT



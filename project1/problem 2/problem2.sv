//////////////////////////////////////////////////////////////
// problem2.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 6/29/2020
//
//  Detector: if the # of logic high bits of M 
//   equals the first digital of the PSU ID number of one member of 
//    your group, the detector will give logic high, otherwise low.
// 
////////////////////////////////////////////////////////////////

//using always_comb
module first(M, OUT);
	input [8:0] M; // 9-Bit Boolean Vector M 
	output logic OUT; // Output Logic 

// The use of always_comb blocks 
always_comb begin 
	if(M == 9'b111111111) //Logic of High Bits 
		OUT <= 1; // Detector of Logic High  
	else 
		OUT <= 0; // Detector of Logic Low 
	end 

endmodule: first

// Part 2 
// Write a SV dataflow model (continuous assignments) of the detector 

module second(M, OUT);
	input [8:0] M; // 9-Bit Boolean Vector M 
	output logic OUT; // Output Logic 

// The use of continuous assignments 

	assign #10ns OUT = (M == 9'b111111111) ? 1'b1 : 1'b0;

endmodule: second 
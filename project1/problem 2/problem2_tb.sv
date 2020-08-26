//////////////////////////////////////////////////////////////
// problem2_tb.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 6/29/2020
//
// test bench to check the detector
// 
////////////////////////////////////////////////////////////////

module test(M, OUT1, OUT2); 
	input OUT1, OUT2; 
	output logic [8:0] M = 0; // The starting vector at 0 

	//Let's proseses a file descritipor to read, and write file 
	//Specifically a text file 
	integer wr; 

	//instance of the SV file from Problem 2 
	first first_tb(
		.M(M),	
		.OUT(OUT1)
	);

	//instance of the SV file from Problem 2 
	second second_tb(
		.M(M), 
		.OUT(OUT2)
	);

	initial 
		begin 

	wr = $fopen("log.txt", "a");
	$fwrite(wr, "Design for Problem2 \n"); 

	//Cover 512 Combinations of the 9-bit vector
		for(int i = 0; i < 512; i++) begin			
			if(M != 511)
				#10 M <= M + 1'b1;
		$display("Input M: %b, OUT1: %b; OUT2: %b", M, OUT1, OUT2);
		end 
		
		if(M == 511)
			begin 
			$fwrite(wr, "#RUN_TIME = %d, M = %b, MATCHED!\n", $time, M);
			end 
	$fclose(wr); 
	
	//print the generated combinations
	//Good use of our transcript 
	$monitor("Run_TIME = %d, M = %b, MATCHED!\n", $time, M);
	end 
endmodule: test 

		
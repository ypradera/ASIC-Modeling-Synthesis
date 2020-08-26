//////////////////////////////////////////////////////////////
// problem4_P1_tb.sv 
//
//  Yusme Pradera ypradera@pdx.edu
// 
//  
// Date: 6/29/2020
//
//  test bench for the 16-bit CLA
// 
////////////////////////////////////////////////////////////////

module CLA_16BIT_TB(A, B, cin, cout, sum); 
	input logic [15:0] A;
	input logic [15:0] B; 
	input logic cin; 

	output wire [15:0] sum;
	output wire cout; 

	CLA_16BIT on(
		.A(A),
		.B(B),
		.cin(cin),
		.sum(sum),
		.cout(cout)
	);

	initial 
		begin

		/* The method is the File Descriptior*/
		integer write;
		write = $fopen("log4.txt", "a");
		$fwrite(write, "Problem 4 16-Bit Adder \n");
	//Since We have 3 Inputs 
		A = 0; B = 0; cin = 0; 
		#100
		A = 16'h0000; B = 16'h0000; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'h0001; B = 16'h0000; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'h0F0F; B = 16'hF0F0; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'hFF00; B = 16'h00FF; cin = 1'b1;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'hFFF0; B = 16'h0FF0; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'h000F; B = 16'hFF00; cin = 1'b1;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'hFF00; B = 16'h0FF0; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'h0FFF; B = 16'h0F00; cin = 1'b1;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		#10 A = 16'hFFFF; B = 16'h000F; cin = 1'b0;
		$fwrite(write, "time: ", $time, "A: %h, B: %h, cin: %b, sum: %h, cout: %b\n", A,B,cin,sum,cout);
		
		$fclose(write);
		$finish; 
		end 


		initial
			begin
		
		// Objective is to "Monitor" one inital block and generate 
		// all of the possible input combinations 
		$monitor("Time=", $time);
		$monitor("The input we have is A: %b, B: %b, cin: %b, sum: %h Y(Output):%b ", A, B, cin, sum, cout);
		// Almost as if its a print statement 	
			end 
endmodule: CLA_16BIT_TB
		
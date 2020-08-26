//////////////////////////////////////////////////////////////////
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/1/2020
//
// testbench for the Behavioral model for a 2^n to n priority encoder.
// 
////////////////////////////////////////////////////////////////
module problem3_tb();
	// used for # of output bits
  parameter n= 2;
  
     logic [(2**n)-1:0] in;  //2^n bits Input
     logic [n-1:0] out;     //n bits Output 
   
// start stimulus
  initial begin 
    in = 4'b0;
  
    for (int i=0; i < 2**(2**n)-1; i = i+1 ) begin
           #2 in = in + 1'b1;
    end
      //in = 4'b0;
  // #2;in = 4'b0001;
  // #2;in = 4'b0010;
  // #2;in = 4'b0100;
  // #2;in = 4'b1000;

  end

    //instantiate problem3
    
  problem3 #(2) uut(.*);
   
  initial begin
    $monitor( "     in=%b :  out=%b    ",in,out);    
   end
  
endmodule
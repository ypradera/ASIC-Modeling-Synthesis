//////////////////////////////////////////////////////////////
// problem3.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 6/30/2020
//
// Behavioral model for a 2^n to n priority encoder.
// 
////////////////////////////////////////////////////////////////
module designA(out,in);
	parameter n= 3;
	 
    input   logic [(2**n)-1:0] in;  //2^n bits Input
    output  logic [n-1:0] out;     //n bits Output 
   
always_comb begin
    
       for(int i=0; i< (2**n); i++)begin //for loop for 2^n bits
    
         if(in[i]) begin // priority check
               out = i;// encoding section
         
         end   
   end
end

endmodule
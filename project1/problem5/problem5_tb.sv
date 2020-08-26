
//////////////////////////////////////////////////////////////////
//
// problem5_tb.sv
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/1/2020
//
// Testbench for the 8bit Wallace Tree Multiplier
// 
////////////////////////////////////////////////////////////////
module problem5_tb();
	logic [7:0] IN1, IN2;
	logic [15:0] OUT; 
	
  	int product;	
  problem5 uut(.*);

initial begin
	//forever begin
    //IN1 = $random;
	//IN2 = $random;
     	IN1 = 8'b00101011;
      	IN2 = 8'b01110000;
		product = IN1 * IN2;
	//end

end

initial begin
  $monitor("IN1 = %d   ::   IN2 = %d   ::   OUT(WALLACE) = %d    ::   Product(IN1 * IN2) = %d",IN1, IN2, OUT, product);
end
endmodule

//////////////////////////////////////////////////////////////
// problem2_tb.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/11/2020
//
// test bench for the sequencer detector
// 
////////////////////////////////////////////////////////////////
module sequencerTB();
logic [7:0] data;
logic clk = 0, sent = 0, ready, match ;

// Instantiating module
  sequencer uut(.*);

initial begin
	clk <= 0;
	
forever begin
  		// clock period
		#5 clk <= ~clk; 
	end
end

initial begin
#50
// generate random data values
for(int i =0; i<20; i = i+1)begin
#20 if(ready) begin
  		data = $random;
		sent = 1'b1;
	$monitor("data = %b", data);
		end
		
	end
		data = 8'b01010111;
		sent = 1'b1;
		$monitor("data = %b", data );
end
endmodule
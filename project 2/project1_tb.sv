//////////////////////////////////////////////////////////////
// problem1_tb.sv 
//
//  Yusme Pradera 
//  
// Date: 7/19/2020
//
// test bench for the 4bit up/down counter 
////////////////////////////////////////////////////////////////
module updowncounter_testbench();
timeunit 1ns/1ns;
	logic clk, Y, reset; 
	logic [3:0]state;
	logic [1:0] up_down;
  
  //Instantiating module
  up_down_counter dut(.*); 
   
   // clock signal 
  always  begin 
    #5; clk <= 1;
	#5; clk <= 0;
  end  
  
initial begin 
     reset <= 1; #5;
     reset <= 0; #5; 
	 
	 up_down = 2'b00; #10;
     up_down = 2'b01; #20;
	 up_down = 2'b10; #30;
	 up_down = 2'b11; #10;
     $stop;  

end

endmodule 
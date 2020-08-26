module designB_tb();
  timeunit 1ns/1ns;
  logic [7:0] in;
  logic [2:0] out;
	logic en;
  
  //instantiation
  designB uut(.*);
  
initial begin 
  
  $monitor(" in = %b ::: out = %b", in,out);
  
	in = 8'b00000001;#2;
	in = 8'b00000010;#2;
	in = 8'b00000100;#2;
	in = 8'b00001000;#2;
	in = 8'b00010000;#2;
	in = 8'b00100000;#2;
	in = 8'b01000000;#2;
	in = 8'b10000000;#2;
	
  
	end
	endmodule: designB_tb
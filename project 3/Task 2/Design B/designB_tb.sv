module designB_tb();
  timeunit 1ns/1ns;
  logic [7:0] in;
  logic [2:0] out;
	logic en;
  
  //instantiation
  designB uut(.*);
  
initial begin 
  
$monitor(" in = %b ::: out = %b", in,out);
  
	in = 8'b00000001;#10;
	in = 8'b00000010;#10;
	in = 8'b00000100;#10;
	in = 8'b00001000;#10;
	in = 8'b00010000;#10;
	in = 8'b00100000;#10;
	in = 8'b01000000;#10;
	in = 8'b10000000;#10;
  
	end
	endmodule: designB_tb
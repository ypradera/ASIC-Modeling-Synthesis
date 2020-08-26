////////////////////////////////////////////////////////////// 
//
// Yusme Pradera ypradera@pdx.edu
// Tamarr Stigler
//  
// Date: 7/30/2020
//
// testbench for all the FSM 
////////////////////////////////////////////////////////////////	
module model_tb();

	logic  clk,rst, a, b, c;
	logic out1,out2,out3;
	
	//instantiating all the FSM 
	modelA uutA( .clk(clk), .rst(rst),.x(a),.out(out1));
	modelB uutB( .clk(clk), .rst(rst),.x(b),.out(out2));
	modelC uutC( .clk(clk), .rst(rst),.x(c),.out(out3));
	
	initial begin
	clk = 0;	
	rst = 0;
	rst <= #1 1;
	forever #5 clk = ~ clk;
end
	
//stimulus for ModelA
	initial begin 
		rst <= 1;
	#10 rst <= 0; 

		a <= 0;
	#10	a <= 1;
	#10	a <= 0;
	#10	a <= 1;
	#10	a <= 1;

	
		b <= 0;
	#10	b <= 1;
	#10	b <= 0;
	#10	b <= 1;
	#10	b <= 1;

	
		c <= 0;
	#10	c <= 1;
	#10	c <= 0;
	#10	c <= 1;
	#10	c <= 1;
	
	

		$stop;	
	end
endmodule: model_tb

//////////////////////////////////////////////////////////////////
// problem3_tb.sv
// 
// Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/12/2020
//
// testbench for the FIFO controller.
// 
////////////////////////////////////////////////////////////////
module memoryControllerTB();
	logic rst, clk = 0, wr, rd,  wr_en, rd_en, emp, full;
	logic [4:0] rd_ptr, wr_ptr;

// Instantiating the module
  memoryController uut(.*);

initial begin
	forever begin
		#5 clk = ~clk;
	end
end

initial begin

rst = 0;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);

  for (int i = 0; i < (2**5) + 3; i = i + 1) begin
#20 wr = 1'b1;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);
end

#20 wr = 1'b0;

for (int i = 0; i < 2**5 + 3; i = i + 1) begin
#20 rd = 1'b1;
$display( "rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);
end

for (int i = 0; i < 2**4; i = i + 1) begin
#20 wr = 1'b1;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);
end

#20 rst = 1'b1;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);

#20 rst = 1'b0;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);

  //Generate random values for wr and rd 
//forever begin
for(int i=0; i<3; i= i+1)begin
	#20 wr = $random;
		rd = $random;
$display("rst = %b, wr = %b, rd = %b, wr_en = %b, rd_en = %b, rd_ptr = %b, wr_ptr = %b, emp = %b, full = %b", rst, wr, rd, wr_en, rd_en, rd_ptr, wr_ptr, emp, full);
end

end
endmodule
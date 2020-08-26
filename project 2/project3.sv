//////////////////////////////////////////////////////////////
// problem3.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/12/2020
//
//  logical  circuit  (FIFO Controller)  which controls the reading and writing of data 
//   from/into a FIFO.
////////////////////////////////////////////////////////////////

module memoryController(
	
  	input logic rst, clk, wr, rd,
	output logic wr_en, rd_en, emp, full,		
 	output logic [4:0] rd_ptr, wr_ptr 	
);
	

assign full = ~emp;
assign wr_en = wr & ~full;						
assign rd_en = rd & ~(rd_ptr + 1'b1 == wr_ptr);	
assign emp = (rd_ptr == wr_ptr + 1'b1) ? 1'b0 : 1'b1;  

enum logic [3:0] {	
  			INIT =	4'b0001,
			IDLE =	4'b0010,
			WR = 	4'b0100,
			RD = 	4'b1000
		} 	state = INIT, nextstate = INIT;
  
always_comb begin
  
 unique case(state)

  INIT: begin				
		rd_ptr = 0;
		wr_ptr = 0;
		nextstate = IDLE;
		end

  IDLE: begin				
		if(wr)
			nextstate = WR;
		else if(rd)
			nextstate = RD;
		else
			nextstate = IDLE;
		end	

  WR: begin				
		if(full)
			nextstate = IDLE;
		else begin
			wr_ptr = wr_ptr + 1'b1;
			nextstate = IDLE;	
		end
		end

  RD: begin				
		if(~rd_en | (rd_ptr == wr_ptr))
			nextstate = IDLE;
		else begin
			rd_ptr = rd_ptr + 1'b1;
			nextstate = IDLE;
		end
		end
endcase
end

always_ff @(posedge clk, posedge rst) begin
	if (rst)
	state <= INIT;
	else
	state <= nextstate;
end
endmodule
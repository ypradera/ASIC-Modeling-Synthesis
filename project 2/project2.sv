
//////////////////////////////////////////////////////////////
// problem2.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/12/2020
//
// Sequencer detector: compares the input sequence with  // its own built-in sequence bit by
// bit. If the input sequence is identical to the built-in // sequence, 
// it will display a message "matched",
// otherwise it will display a message "not-matched".
// Last two digits of PSU ID : 87 
// 
////////////////////////////////////////////////////////////////

module sequencer(
	input clk, sent,				
    input [7:0] data, 							
	output logic ready = 1'b1,	
	output logic match = 1'b0
  );

  	logic [7:0] latchedData;
	localparam [7:0] DIGITS = 8'b01010111; // 87 in binary 

enum logic [8:0]{	
  			BIT1 = 9'b000000001,
			BIT2 = 9'b000000010,
			BIT3 = 9'b000000100,
			BIT4 = 9'b000001000,
			BIT5 = 9'b000010000,
			BIT6 = 9'b000100000,
			BIT7 = 9'b001000000,
			BIT8 = 9'b010000000,
			MATCH = 9'b100000000
  
	} state = BIT1, nextstate = BIT1;

//	COMBINATIONAL
always_comb begin

unique case(state) 

BIT1: begin
  if(DIGITS[0] == latchedData[0]) begin	//Checking first bit
		nextstate <= BIT2;				
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			//otherwise go back to first bit, ready for data
		match <= 0;
		ready <= 1'b1;
	end
end

BIT2: begin
	if(DIGITS[1] == latchedData[1]) begin //Checks the second bit
		nextstate <= BIT3;				  
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT3: begin
	if(DIGITS[2] == latchedData[2]) begin	//Checks the third bit
		nextstate <= BIT4;					
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT4: begin
	if(DIGITS[3] == latchedData[3]) begin	//Checks the fourth bit
		nextstate <= BIT5;					
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT5: begin
	if(DIGITS[4] == latchedData[4]) begin	//Checks the fifth bit
		nextstate <= BIT6;					
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT6: begin
	if(DIGITS[5] == latchedData[5]) begin	//Checks the sixth bit
		nextstate <= BIT7;					
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT7: begin
	if(DIGITS[6] == latchedData[6]) begin	//Checks the seventh bit
		nextstate <= BIT8;					
		ready <= 1'b0;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end

BIT8: begin
	if(DIGITS[7] == latchedData[7]) begin	//Checks the eighth bit
		nextstate <= BIT1;			
		match <= 1'b1;				
		ready <= 1'b1;
	end else begin
		nextstate <= BIT1;			
		match <= 0;
		ready <= 1'b1;
	end
end
endcase
end

//	SEQUENTIAL
always_ff@(posedge clk) begin
  if (ready & sent) begin	//Latch data and if the new data was sent then ready to recieve
	
  latchedData = data;
  end

  state = nextstate; 
  end

  always_ff@(posedge match) begin
		$display("MATCHED");
		end

 always_ff@(posedge ready) begin
		if(~match) begin
		$display("NOT MATCHED");
    	end  
end 
endmodule
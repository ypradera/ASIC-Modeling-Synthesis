//////////////////////////////////////////////////////////////
// problem1.sv 
//
//  Yusme Pradera ypradera@pdx.edu
//  
// Date: 7/19/2020
//
//  FSM 4bit up/down counter
//
////////////////////////////////////////////////////////////////
module up_down_counter( 
 	input logic clk,reset,
 	input logic[1:0] up_down,
	output logic [3:0] state,
  	output logic  Y 
);
timeunit 1ns/1ns;
  typedef enum logic [3:0]{ 
   		 S1 = 4'b0000, S2 = 4'b0001,  S3 = 4'b0010, S4 = 4'b0011,
   		 S5 = 4'b0100, S6 = 4'b0101,  S7 = 4'b0110, S8 = 4'b0111,
   		 S9 = 4'b1000, S10= 4'b1001,  S11= 4'b1010, S12= 4'b1011,
    	 S13= 4'b1100, S14= 4'b1101,  S15= 4'b1110, S16= 4'b1111 } State;
  State currentState, nextState ;
  
  //Sequencial Logic
  always_ff @(posedge clk) begin: sequential
    
    if (reset) currentState <= S1;
     else  	   currentState <= nextState;
    
  end: sequential 
  
  //combinational logic modeling the FSM
  always_comb  begin : next_State
   
    case(currentState)
      S1:  if(up_down == 2'b00)   nextState = S1 ;
      else if (up_down == 2'b01) nextState = S2;
      else if (up_down == 2'b10)  nextState = S16;
      else if (up_down == 2'b11)  nextState = S1 ; 
 
      S2:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S3;
      else if (up_down == 2'b10)  nextState = S1;
      else if (up_down == 2'b11)  nextState = S2;
      
      S3:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S4;
      else if (up_down == 2'b10)  nextState = S2;
      else if (up_down == 2'b11)  nextState = S3;
      
      S4:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S5;
      else if (up_down == 2'b10)  nextState = S3;
      else if (up_down == 2'b11)  nextState = S4;
      
      S5:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S6;
      else if (up_down == 2'b10)  nextState = S4;
      else if (up_down == 2'b11)  nextState = S5;
      
      S6:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S7;
      else if (up_down == 2'b10)  nextState = S5;
      else if (up_down == 2'b11)  nextState = S6;
	  
	   S7:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S8;
      else if (up_down == 2'b10)  nextState = S6;
      else if (up_down == 2'b11)  nextState = S7;
      
      S8:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S9;
      else if (up_down == 2'b10)  nextState = S7;
      else if (up_down == 2'b11)  nextState = S8;
      
      S9:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S10;
      else if (up_down == 2'b10)  nextState = S8;
      else if (up_down == 2'b11)  nextState = S9;
      
      S10:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S11;
      else if (up_down == 2'b10)  nextState = S9;
      else if (up_down == 2'b11)  nextState = S10;
      
      S11:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S12;
      else if (up_down == 2'b10)  nextState = S10;
      else if (up_down == 2'b11)  nextState = S11;
      
      S12:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S13;
      else if (up_down == 2'b10)  nextState = S11;
      else if (up_down == 2'b11)  nextState = S12;
      
      S13:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S14;
      else if (up_down == 2'b10)  nextState = S12;
      else if (up_down == 2'b11)  nextState = S13;
      
      S14:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S15;
      else if (up_down == 2'b10)  nextState = S13;
      else if (up_down == 2'b11)  nextState = S14;
      
      S15:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S16;
      else if (up_down == 2'b10)  nextState = S14;
      else if (up_down == 2'b11)  nextState = S15;
      
      S16:	if(up_down == 2'b00)  nextState = S1;
      else if (up_down == 2'b01)  nextState = S1;
      else if (up_down == 2'b10)  nextState = S15;
      else if (up_down == 2'b11)  nextState = S16;
  
  default:   nextState = S1; // If is not any of this states then default to S1  
    endcase
	 assign state = nextState;
  end : next_State
  
  //0utput logic
  always_comb begin : OutputLogic  
    case (currentState)
      
      S1: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S2: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S3: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S4: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S5: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S6: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S7: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S8: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S9: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10)Y = 1'b1;
      
      S10: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S11: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S12: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S13: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S14: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S15: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
      
      S16: if (up_down == 2'b00 | up_down == 2'b11) Y = 1'b0;
      else if (up_down == 2'b01 | up_down == 2'b10) Y = 1'b1;
     
      default: Y = 1'b0;
    endcase
      
  end : OutputLogic
endmodule: up_down_counter
/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12-SP3
// Date      : Wed Jul 29 16:39:12 2020
/////////////////////////////////////////////////////////////


module adder_sub_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [17:0] carry;
  wire   [16:0] B_AS;
  assign carry[0] = ADD_SUB;

  FAX1 U1_15 ( .A(A[15]), .B(B_AS[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B_AS[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B_AS[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B_AS[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B_AS[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B_AS[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B_AS[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9])
         );
  FAX1 U1_8 ( .A(A[8]), .B(B_AS[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8])
         );
  FAX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7])
         );
  FAX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6])
         );
  FAX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5])
         );
  FAX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4])
         );
  FAX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3])
         );
  FAX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2])
         );
  FAX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1])
         );
  FAX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .C(carry[0]), .YC(carry[1]), .YS(SUM[0])
         );
  XOR2X1 U1 ( .A(carry[0]), .B(carry[16]), .Y(SUM[16]) );
  XOR2X1 U2 ( .A(B[9]), .B(carry[0]), .Y(B_AS[9]) );
  XOR2X1 U3 ( .A(B[8]), .B(carry[0]), .Y(B_AS[8]) );
  XOR2X1 U4 ( .A(B[7]), .B(carry[0]), .Y(B_AS[7]) );
  XOR2X1 U5 ( .A(B[6]), .B(carry[0]), .Y(B_AS[6]) );
  XOR2X1 U6 ( .A(B[5]), .B(carry[0]), .Y(B_AS[5]) );
  XOR2X1 U7 ( .A(B[4]), .B(carry[0]), .Y(B_AS[4]) );
  XOR2X1 U8 ( .A(B[3]), .B(carry[0]), .Y(B_AS[3]) );
  XOR2X1 U9 ( .A(B[2]), .B(carry[0]), .Y(B_AS[2]) );
  XOR2X1 U10 ( .A(B[1]), .B(carry[0]), .Y(B_AS[1]) );
  XOR2X1 U11 ( .A(B[15]), .B(carry[0]), .Y(B_AS[15]) );
  XOR2X1 U12 ( .A(B[14]), .B(carry[0]), .Y(B_AS[14]) );
  XOR2X1 U13 ( .A(B[13]), .B(carry[0]), .Y(B_AS[13]) );
  XOR2X1 U14 ( .A(B[12]), .B(carry[0]), .Y(B_AS[12]) );
  XOR2X1 U15 ( .A(B[11]), .B(carry[0]), .Y(B_AS[11]) );
  XOR2X1 U16 ( .A(B[10]), .B(carry[0]), .Y(B_AS[10]) );
  XOR2X1 U17 ( .A(B[0]), .B(carry[0]), .Y(B_AS[0]) );
endmodule


module adder_sub ( op1, op2, Op, Out, over, carry );
  input [15:0] op1;
  input [15:0] op2;
  output [15:0] Out;
  input Op;
  output over, carry;
  wire   \U1/U1/Z_0 , n11, n12, n13, n14;
  assign \U1/U1/Z_0  = Op;

  adder_sub_DW01_addsub_0 r62 ( .A({1'b0, op1}), .B({1'b0, op2}), .CI(1'b0), 
        .ADD_SUB(\U1/U1/Z_0 ), .SUM({carry, Out}) );
  MUX2X1 U8 ( .B(n11), .A(n12), .S(op1[15]), .Y(over) );
  NAND2X1 U9 ( .A(n13), .B(n14), .Y(n12) );
  OR2X1 U10 ( .A(n14), .B(n13), .Y(n11) );
  XOR2X1 U11 ( .A(op2[15]), .B(\U1/U1/Z_0 ), .Y(n13) );
  INVX1 U12 ( .A(Out[15]), .Y(n14) );
endmodule


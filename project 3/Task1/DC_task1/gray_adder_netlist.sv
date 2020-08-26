/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12-SP3
// Date      : Sat Aug  1 15:01:50 2020
/////////////////////////////////////////////////////////////


module gray_to_bin_0 ( b, g );
  output [3:0] b;
  input [3:0] g;
  wire   \g[3] ;
  assign b[3] = \g[3] ;
  assign \g[3]  = g[3];

  XOR2X1 U1 ( .A(g[0]), .B(b[1]), .Y(b[0]) );
  XOR2X1 U2 ( .A(b[2]), .B(g[1]), .Y(b[1]) );
  XOR2X1 U3 ( .A(g[2]), .B(\g[3] ), .Y(b[2]) );
endmodule


module gray_to_bin_1 ( b, g );
  output [3:0] b;
  input [3:0] g;
  wire   \g[3] ;
  assign b[3] = \g[3] ;
  assign \g[3]  = g[3];

  XOR2X1 U1 ( .A(g[0]), .B(b[1]), .Y(b[0]) );
  XOR2X1 U2 ( .A(b[2]), .B(g[1]), .Y(b[1]) );
  XOR2X1 U3 ( .A(g[2]), .B(\g[3] ), .Y(b[2]) );
endmodule


module bin_to_gray ( g, b );
  output [4:0] g;
  input [4:0] b;
  wire   \b[4] ;
  assign g[4] = \b[4] ;
  assign \b[4]  = b[4];

  XOR2X1 U1 ( .A(\b[4] ), .B(b[3]), .Y(g[3]) );
  XOR2X1 U2 ( .A(b[3]), .B(b[2]), .Y(g[2]) );
  XOR2X1 U3 ( .A(b[2]), .B(b[1]), .Y(g[1]) );
  XOR2X1 U4 ( .A(b[1]), .B(b[0]), .Y(g[0]) );
endmodule


module gray_adder ( x, a, b );
  output [4:0] x;
  input [3:0] a;
  input [3:0] b;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [3:0] a_bin;
  wire   [3:0] b_bin;
  wire   [4:0] sum;

  gray_to_bin_0 convert_a ( .b(a_bin), .g(a) );
  gray_to_bin_1 convert_b ( .b(b_bin), .g(b) );
  bin_to_gray convert_x ( .g(x), .b(sum) );
  OAI21X1 U3 ( .A(n3), .B(n4), .C(n5), .Y(sum[4]) );
  OAI21X1 U4 ( .A(a_bin[3]), .B(n6), .C(b_bin[3]), .Y(n5) );
  INVX1 U5 ( .A(a_bin[3]), .Y(n4) );
  XNOR2X1 U6 ( .A(n7), .B(n6), .Y(sum[3]) );
  INVX1 U7 ( .A(n3), .Y(n6) );
  AOI21X1 U8 ( .A(n8), .B(a_bin[2]), .C(n9), .Y(n3) );
  INVX1 U9 ( .A(n10), .Y(n9) );
  OAI21X1 U10 ( .A(a_bin[2]), .B(n8), .C(b_bin[2]), .Y(n10) );
  XNOR2X1 U11 ( .A(a_bin[3]), .B(b_bin[3]), .Y(n7) );
  XNOR2X1 U12 ( .A(n11), .B(n8), .Y(sum[2]) );
  OAI21X1 U13 ( .A(n12), .B(n13), .C(n14), .Y(n8) );
  OAI21X1 U14 ( .A(n15), .B(a_bin[1]), .C(b_bin[1]), .Y(n14) );
  INVX1 U15 ( .A(a_bin[1]), .Y(n13) );
  XNOR2X1 U16 ( .A(a_bin[2]), .B(b_bin[2]), .Y(n11) );
  XNOR2X1 U17 ( .A(n15), .B(n16), .Y(sum[1]) );
  XNOR2X1 U18 ( .A(a_bin[1]), .B(b_bin[1]), .Y(n16) );
  INVX1 U19 ( .A(n12), .Y(n15) );
  NAND2X1 U20 ( .A(b_bin[0]), .B(a_bin[0]), .Y(n12) );
  XOR2X1 U21 ( .A(b_bin[0]), .B(a_bin[0]), .Y(sum[0]) );
endmodule


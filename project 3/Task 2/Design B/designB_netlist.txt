/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12-SP3
// Date      : Thu Jul 30 13:02:51 2020
/////////////////////////////////////////////////////////////


module designB ( in, out, en );
  input [7:0] in;
  output [2:0] out;
  input en;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  NAND3X1 U15 ( .A(n12), .B(n13), .C(n14), .Y(out[2]) );
  NOR2X1 U16 ( .A(in[7]), .B(in[6]), .Y(n14) );
  INVX1 U17 ( .A(in[5]), .Y(n13) );
  NAND3X1 U18 ( .A(n15), .B(n16), .C(n17), .Y(out[1]) );
  OAI21X1 U19 ( .A(in[2]), .B(in[3]), .C(n18), .Y(n17) );
  NOR2X1 U20 ( .A(in[5]), .B(in[4]), .Y(n18) );
  INVX1 U21 ( .A(in[6]), .Y(n15) );
  OAI21X1 U22 ( .A(in[6]), .B(n19), .C(n16), .Y(out[0]) );
  INVX1 U23 ( .A(in[7]), .Y(n16) );
  AOI21X1 U24 ( .A(n20), .B(n12), .C(in[5]), .Y(n19) );
  INVX1 U25 ( .A(in[4]), .Y(n12) );
  OAI21X1 U26 ( .A(in[2]), .B(n21), .C(n22), .Y(n20) );
  INVX1 U27 ( .A(in[3]), .Y(n22) );
  INVX1 U28 ( .A(in[1]), .Y(n21) );
endmodule


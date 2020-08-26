///////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12-SP3
// Date      : Tue Jul 28 22:49:49 2020
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module designA_netlist( out, in );
  output [2:0] out;
  input [7:0] in;
  wire   N31, N32, N33, N34, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24;

  LATCH \out_reg[2]  ( .CLK(N31), .D(N34), .Q(out[2]) );
  LATCH \out_reg[1]  ( .CLK(N31), .D(N33), .Q(out[1]) );
  LATCH \out_reg[0]  ( .CLK(N31), .D(N32), .Q(out[0]) );
  OAI21X1 U19 ( .A(n13), .B(n14), .C(n15), .Y(N33) );
  NAND2X1 U20 ( .A(n16), .B(n17), .Y(n14) );
  OAI21X1 U21 ( .A(in[6]), .B(n18), .C(n19), .Y(N32) );
  INVX1 U22 ( .A(in[7]), .Y(n19) );
  AOI21X1 U23 ( .A(n20), .B(n16), .C(in[5]), .Y(n18) );
  OAI21X1 U24 ( .A(in[2]), .B(n21), .C(n22), .Y(n20) );
  INVX1 U25 ( .A(in[3]), .Y(n22) );
  INVX1 U26 ( .A(in[1]), .Y(n21) );
  NAND3X1 U27 ( .A(n13), .B(n23), .C(n24), .Y(N31) );
  NOR2X1 U28 ( .A(in[1]), .B(in[0]), .Y(n24) );
  INVX1 U29 ( .A(N34), .Y(n23) );
  NAND3X1 U30 ( .A(n16), .B(n17), .C(n15), .Y(N34) );
  NOR2X1 U31 ( .A(in[7]), .B(in[6]), .Y(n15) );
  INVX1 U32 ( .A(in[5]), .Y(n17) );
  INVX1 U33 ( .A(in[4]), .Y(n16) );
  NOR2X1 U34 ( .A(in[3]), .B(in[2]), .Y(n13) );
endmodule


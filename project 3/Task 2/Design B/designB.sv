module designB(
	input logic  [7:0] in,
	output logic [2:0] out,
	input logic en
);
timeunit 1ns/1ns;

	assign out[0] = ((~(in[6])) & ((~(in[4])) & (~(in[2])) & in[1]  | (~(in[4])) & in[3] | in[5])| in[7]);
	assign out[1] = ((~(in[5])) & (~(in[4])) &(in[2] | in[3]) | in[6] | in[7]);
	assign out[2] = (in[4] | in[5] | in[6] | in[7]);

endmodule: designB
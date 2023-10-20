`timescale 1ns/1ns
module Signex16(input [15:0] a, output [31:0] w);
	assign w = a[15] == 1'b0 ? {16'b0000000000000000, a} : {16'b1111111111111111, a};
endmodule

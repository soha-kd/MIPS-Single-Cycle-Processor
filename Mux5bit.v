`timescale 1ns/1ns
module Mux5bit(input [4:0] a, b, input s, output [4:0] w);
	assign w = s == 1'b0 ? a : b;
endmodule

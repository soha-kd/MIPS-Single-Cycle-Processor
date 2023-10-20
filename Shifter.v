`timescale 1ns/1ns
module Shifter(input [31:0] a, output [31:0] w);
	assign w = {a[29:0], 2'b0};
endmodule

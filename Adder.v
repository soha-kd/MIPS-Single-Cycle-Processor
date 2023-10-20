`timescale 1ns/1ns
module Adder(input [31:0]a, b, output [31:0] s, c);
	assign {c, s} = a + b;
endmodule

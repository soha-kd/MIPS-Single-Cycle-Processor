`timescale 1ns/1ns
module Signex26(input[25:0] a, output [31:0] w);
	assign w = a[25] == 1'b0 ? {6'b000000, a} : {6'b111111, a};
endmodule

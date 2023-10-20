`timescale 1ns/1ns
module PC(input clk, rst, input[31:0] a, output reg[31:0] w);
  //initial begin
    //w=32'b00000000000000000000000000000000;
	always@(posedge clk, posedge rst) begin
		if(rst)
			w = 32'b00000000000000000000000000000000;
		else
			w <= a;
	end
endmodule

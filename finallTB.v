module FinallTB();
  reg clk,rst;
  MIPS cut(clk,rst);
  initial begin
    #100
    clk=0;
    rst=1;
    #100 rst=0;
    repeat(600) #10 clk=~clk;
  end
endmodule
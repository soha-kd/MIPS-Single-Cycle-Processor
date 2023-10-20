module Ins_Mem(input rst,input [31:0]PC,output [31:0]ins);
  reg [7:0]Mem[0:65535];
  initial begin
    $readmemh("ins1.data",Mem);
  end
  assign ins={Mem[PC],Mem[PC+1],Mem[PC+2],Mem[PC+3]};
  always@(posedge rst) begin
    if(rst==1)
      $readmemh("ins2.data",Mem);
  end
endmodule
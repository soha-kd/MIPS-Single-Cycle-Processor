module Reg(input clk,input rst,input Regwf,input [4:0]r1,input [4:0]r2,input [4:0]Regwadd,input [31:0]Regwdata,output [31:0]R1,output [31:0]R2);
  reg [31:0]register[31:0];
  initial begin
    register[29]=32'b00000000000000011000011010100000;
  end
  assign R1=register[r1];
  assign R2=register[r2];
  always@(posedge clk,posedge rst)begin
    register[0]=32'b00000000000000000000000000000000;
    if(rst==1)
      register[29]=32'b00000000000000011000011010100000;
    else begin
      if(Regwf==1)
        register[Regwadd]=Regwdata;
    end
  end
endmodule
module Data_Mem(input clk,input rst,input Memwf,input [31:0]add,input [31:0]Memwdata,output [31:0]R);
  reg [7:0]Mem[0:65535];
  initial begin
    $readmemh("mem.data",Mem);
  end
  assign R={Mem[add],Mem[add+1],Mem[add+2],Mem[add+3]};
  always@(posedge clk,posedge rst) begin
    if(rst==1)
      $readmemh("mem.data",Mem);
    else begin
      if(Memwf==1)begin
        Mem[add]=Memwdata[31:24];
        Mem[add+1]=Memwdata[23:16];
        Mem[add+2]=Memwdata[15:8];
        Mem[add+3]=Memwdata[7:0];
      end
    end
  end
endmodule
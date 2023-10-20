module ALU(input [31:0]a,input [31:0]b,input [2:0]ctrl,output reg zero,output reg [31:0]ALUres);
  always@(a,b,ctrl)begin
    if(ctrl==3'b000)
      ALUres=a+b;
    else if(ctrl==3'b001)
      ALUres=a-b;
    else if(ctrl==3'b010)
      ALUres=a&b;
    else if(ctrl==3'b011)
      ALUres=a|b;
    else begin
      if(a<b)
        ALUres=32'b00000000000000000000000000000001;
      else
        ALUres=32'b00000000000000000000000000000000;
    end
    if(ALUres==32'b00000000000000000000000000000000)
      zero=1;
    else
      zero=0;
  end
endmodule
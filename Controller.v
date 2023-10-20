module Controller(input [5:0]opcode,input [5:0]func,input zero,output reg Regwf,output reg Memwf,output reg [2:0]ALUctrl,output reg [9:0]sel);
  always@(opcode,func,zero)begin
    if(opcode==6'b000000)begin
      Regwf=1;
      Memwf=0;
      ALUctrl=func[2:0];
      sel[0]=1;
      sel[1]=1;
      sel[2]=1;
      sel[4]=0;
      sel[5]=0;
      sel[7]=0;
      sel[9]=0;
    end
    else if(opcode[5:3]==3'b001)begin
      Regwf=1;
      Memwf=0;
      ALUctrl=opcode[2:0];
      sel[0]=1;
      sel[1]=0;
      sel[2]=1;
      sel[3]=0;
      sel[4]=1;
      sel[5]=0;
      sel[7]=0;
      sel[9]=0;
    end
    else if(opcode[5:3]==3'b010)begin
      ALUctrl=3'b000;
      if(opcode[2:0]==3'b000)begin
        Regwf=1;
        Memwf=0;
      end
      else begin
        Regwf=0;
        Memwf=1;
      end
      sel[0]=1;
      sel[1]=0;
      sel[2]=1;
      sel[3]=0;
      sel[4]=1;
      sel[5]=0;
      sel[7]=0;
      sel[8]=0;
      sel[9]=1;
    end
    else if(opcode[5:3]==3'b011)begin
      if(opcode[2:0]==3'b000)begin
        Regwf=0;
        Memwf=0;
        sel[3]=1;
        sel[6]=1;
        sel[7]=1;
      end
      else if(opcode[2:0]==3'b001)begin
        Regwf=0;
        Memwf=0;
        sel[0]=1;
        sel[6]=0;
        sel[7]=1;
      end
      else if(opcode[2:0]==3'b010)begin
        Regwf=1;
        Memwf=1;
        ALUctrl=3'b000;
        sel[0]=0;
        sel[2]=0;
        sel[3]=1;
        sel[5]=1;
        sel[6]=1;
        sel[7]=1;
        sel[8]=0;
        sel[9]=0;
      end
      else begin
        Regwf=0;
        Memwf=0;
        ALUctrl=3'b001;
        sel[0]=1;
        sel[3]=0;
        sel[4]=0;
        sel[5]=0;
        sel[6]=1;
        if((opcode[2:0]==3'b011 && zero==1) || (opcode[2:0]==3'b100 && zero==0))
          sel[7]=1;
        else
          sel[7]=0;
      end
    end
  end
endmodule
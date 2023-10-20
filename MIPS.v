module MIPS(input clk,input rst);
  wire Regwf,Memwf,zero;
  wire[2:0]ALUctrl;
  wire[5:0] opcode,func;
  wire[9:0] sel;
  DataPath datapath(clk,rst,Regwf,Memwf,sel,ALUctrl,opcode,func,zero);
  Controller controller(opcode,func,zero,Regwf,Memwf,ALUctrl,sel);
endmodule
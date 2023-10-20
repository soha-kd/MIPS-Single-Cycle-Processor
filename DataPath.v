`timescale 1ns/1ns
module DataPath(input clk, rst, Regwf, Memwf, input[9:0] sel, input[2:0] ALUctrl, output[5:0] opcode, func, output zero);
	reg[31:0] FOUR = 32'b00000000000000000000000000000100;
	reg[4:0] TWENTY_NINE = 5'b11101;
	wire c1, c2;
	wire [31:0] pcIn, pcOut, insOut, Regwdata, R1, R2, se16Out, se26Out;
	wire [31:0] AluInb, ALUres, m3Out, m4Out, m5Out, m6Out, adder1Out, ShifterOut, adder2Out, Memwdata, R;
	wire [4:0] r1, r2, Regwadd, m2Out;
	PC pc(clk, rst, pcIn, pcOut);
	Adder adder1(FOUR, pcOut, adder1Out, c1);

	Ins_Mem ins(rst, pcOut, insOut);
	assign opcode = insOut[31:26];
	assign func = insOut[5:0];
	Mux5bit m0(TWENTY_NINE, insOut[25:21], sel[0], r1);
	assign r2 = insOut[20:16];
	Mux5bit m1(r2, insOut[15:11], sel[1], m2Out);
	Mux5bit m2(r1, m2Out, sel[2], Regwadd);

	Signex16 signex16(insOut[15:0], se16Out);
	Signex26 signex26(insOut[25:0], se26Out);
	Mux32bit m3(se16Out, se26Out, sel[3], m3Out);

	Reg regg(clk, rst, Regwf, r1, r2, Regwadd, Regwdata, R1, R2);
	Mux32bit m4(R2, m3Out, sel[4], m4Out);
	Mux32bit m5(m4Out, FOUR, sel[5], AluInb);
	Mux32bit m6(R1, m3Out, sel[6], m6Out);
	Shifter shl2(m6Out, ShifterOut);
	Adder adder2(adder1Out, ShifterOut, adder2Out, c2);
	Mux32bit m7(adder1Out, adder2Out, sel[7], pcIn);

	ALU alu(R1, AluInb, ALUctrl, zero, ALUres);
	
	Mux32bit m8(R2, adder1Out, sel[8], Memwdata);
	Data_Mem Mem(clk, rst, Memwf, ALUres, Memwdata, R);
	Mux32bit m9(ALUres, R, sel[9], Regwdata); 
endmodule

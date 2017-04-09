`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:26 11/20/2015 
// Design Name: 
// Module Name:    Datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Datapath(OP, BEQ_BNE, PCSource, ALUOp, ALUSrcA, ALUSrcB, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, PCWriteCond, clk, rst, NbitBranchSelect);
input [2:0] ALUOp;
input[1:0] PCSource, ALUSrcB;
input BEQ_BNE, ALUSrcA, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, PCWriteCond, NbitBranchSelect, clk, rst;
output [5:0] OP;

reg [31:0] PCIn, BMuxOut;

wire [31:0] PCOut, PCMuxOut, MemDataWire, MemRegOut, RegData1Out, RegData2Out, AOut, BOut, AMuxOut, SignExtendOut, j_immOutZeroExtend, ZeroExtendOut, ALUOutWire, ALUOutRegWire, MemToRegMuxOut, IMemOut;
wire [4:0] R1Out, R2Out, R3Out, NbitBranchMuxOut;
wire [25:0] j_immOut;
wire [15:0] immOut;
wire PCEnable, ALUZero, BranchMuxOut, PCWriteCondAndOut;

//implement
   ProgramCounter PC(PCEnable, PCIn, PCOut, clk, rst);
   assign PCMuxOut = (IorD == 1'b0)? PCOut : ALUOutRegWire;
	IMem IM(PCMuxOut, IMemOut); //WHICH OUTPUT TO MEMDATAWIRE FIX LATER
	DMem DM (BOut, MemDataWire, PCMuxOut, MemToWrite, clk); 
	
	InstructionRegister IR(IMemOut, IRWrite, OP, R1Out , R2Out , R3Out, immOut, j_immOut, clk, rst);
	
	MemDataReg mdr(MemDataWire, MemRegOut, clk, rst);
	
  	assign MemToRegMuxOut = (MemToReg == 1'b0)? ALUOutRegWire : MemRegOut;
	
	
	assign NbitBranchMuxOut = (NbitBranchSelect == 1'b0)? R1Out : R3Out;
	
	
	nbit_register_file regFile(MemToRegMuxOut, RegData1Out, RegData2Out, R2Out, NbitBranchMuxOut, R1Out, RegWrite, clk);
	
	
   SignExtender SE (immOut, SignExtendOut);
 	ZeroExtender ZE (immOut, ZeroExtendOut);
	
	 RegA A (RegData1Out, AOut, clk, rst);
	 RegB B (RegData2Out, BOut, clk, rst);
    
	assign AMuxOut = (ALUSrcA == 1'b0)? PCOut : AOut;
	
	always @(*)
	 begin
	 	case(ALUSrcB)
		2'b00: BMuxOut <= BOut;
		2'b01: BMuxOut <= 1'b1;
		2'b10: BMuxOut <= SignExtendOut; 
		2'b11: BMuxOut <= ZeroExtendOut;
		default: BMuxOut <= BOut;
		endcase	
	 end
	
	ALU alu (ALUOutWire, ALUZero, AMuxOut, BMuxOut, ALUOp);
	ALUOutReg aor(ALUOutWire, ALUOutRegWire, clk, rst);
	
	JumpZeroExtender JZE(j_immOut, j_immOutZeroExtend);
	
	always @(*)
	 begin
	 	case(PCSource)
		2'b00: PCIn <= ALUOutWire;
		2'b01: PCIn <= ALUOutRegWire;
		2'b10: PCIn <= j_immOutZeroExtend; 
		default: PCIn <= ALUOutWire;
		endcase	
	 end
	 
	 assign BranchMuxOut = (BEQ_BNE == 1'b0)? ALUZero : ~ALUZero;
	 assign PCWriteCondAndOut = BranchMuxOut & PCWriteCond;
	 assign PCEnable = PCWrite | PCWriteCondAndOut;


endmodule

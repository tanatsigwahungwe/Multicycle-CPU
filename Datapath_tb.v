`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:53 11/23/2015
// Design Name:   Datapath
// Module Name:   /ad/eng/users/b/c/bcootner/Desktop/CPUProject/Datapath_tb.v
// Project Name:  CPUProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Datapath_tb;

	// Inputs
	reg BEQ_BNE;
	reg [1:0] PCSource;
	reg [2:0] ALUOp;
	reg ALUSrcA;
	reg [1:0] ALUSrcB;
	reg RegWrite;
	reg IRWrite;
	reg MemToReg;
	reg MemToWrite;
	reg MemToRead;
	reg IorD;
	reg PCWrite;
	reg PCWriteCond;
	reg clk;
	reg rst;

	// Outputs
	wire [5:0] OP;

	// Instantiate the Unit Under Test (UUT)
	Datapath uut (
		.OP(OP), 
		.BEQ_BNE(BEQ_BNE), 
		.PCSource(PCSource), 
		.ALUOp(ALUOp), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.RegWrite(RegWrite), 
		.IRWrite(IRWrite), 
		.MemToReg(MemToReg), 
		.MemToWrite(MemToWrite), 
		.MemToRead(MemToRead), 
		.IorD(IorD), 
		.PCWrite(PCWrite), 
		.PCWriteCond(PCWriteCond), 
		.clk(clk), 
		.rst(rst)
	);

   always #5 clk = ~clk;
	initial begin
		// Initialize Inputs RESET!!!
		BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 0;
		ALUSrcA = 0;
		ALUSrcB = 0;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		clk = 1;
		rst = 1;

      #10 
		rst = 0;
	
		// Instruction 1 JUMP 
		#10;
      BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b01;
		RegWrite = 0;
		IRWrite = 1'b1;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 1;
		IorD = 0;
		PCWrite = 1;
		PCWriteCond = 0;
	  
	  
      #10
		BEQ_BNE = OP[0];
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b11;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		#10
		BEQ_BNE = 0;
		PCSource = 2'b10;
		ALUOp = 0;
		ALUSrcA = 0;
		ALUSrcB = 0;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 1;
		PCWriteCond = 0;
			
		//Instruction 2 LI 
		#10;
      BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b01;
		RegWrite = 0;
		IRWrite = 1'b1;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 1;
		IorD = 0;
		PCWrite = 1;
		PCWriteCond = 0;
	  
	  #10
		BEQ_BNE = OP[0];
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b11;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		#10
		BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 1'b1;
		ALUSrcB = 2'b11;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		#10
		BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 1'b1;
		ALUSrcB = 2'b11;
		RegWrite = 1'b1;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		
		//Insturction 3 ADDI  
		#10;
      BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b01;
		RegWrite = 0;
		IRWrite = 1'b1;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 1;
		IorD = 0;
		PCWrite = 1;
		PCWriteCond = 0;
	  
	  #10
		BEQ_BNE = OP[0];
		PCSource = 0;
		ALUOp = 3'b010;
		ALUSrcA = 0;
		ALUSrcB = 2'b11;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		#10 
		BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = OP[2:0];
		ALUSrcA = 1'b1;
		ALUSrcB = 0;
		RegWrite = 0;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
		
		#10 
		BEQ_BNE = 0;
		PCSource = 0;
		ALUOp = 0;
		ALUSrcA = 0;
		ALUSrcB = 0;
		RegWrite = 1'b1;
		IRWrite = 0;
		MemToReg = 0;
		MemToWrite = 0;
		MemToRead = 0;
		IorD = 0;
		PCWrite = 0;
		PCWriteCond = 0;
	
	end
      
endmodule


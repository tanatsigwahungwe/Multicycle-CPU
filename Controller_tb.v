`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:55 11/16/2015
// Design Name:   Controller
// Module Name:   /ad/eng/users/b/c/bcootner/Desktop/CPUProject/Controller_tb.v
// Project Name:  CPUProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Controller_tb;

	// Inputs
	reg [5:0] Op;
	reg clk;
	reg rst;

	// Outputs
	wire BEQ_BNE;
	wire [1:0] PCSource;
	wire [2:0] ALUOp;
	wire ALUSrcA;
	wire [1:0] ALUSrcB;
	wire RegWrite;
	wire IRWrite;
	wire MemToReg;
	wire MemToWrite;
	wire MemToRead;
	wire IorD;
	wire PCWrite;
	wire PCWriteCond;
   wire [3:0] next_state;
	wire [3:0] current_state;
	// Instantiate the Unit Under Test (UUT)
	Controller uut (
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
     	.next_state(next_state),	
		.current_state(current_state),	
		.Op(Op), 
		.clk(clk), 
		.rst(rst)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		Op = 0;
		
		// Wait 50 ns for global reset to finish
		#50 rst = 0;
		
		Op = 6'b010010;
				
		#30
      Op = 6'b100001;
		
		
		#30
      Op = 6'b111100;
	
		#30 
		
		Op = 6'b000001;
		
		
		
				
	end
      
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:37 11/20/2015 
// Design Name: 
// Module Name:    InstructionRegister 
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
module InstructionRegister(Instruction, IRWrite, op, r1 , r2 ,r3, imm, j_imm, clk, rst);
input [31:0] Instruction;
input IRWrite, clk, rst;
output reg [5:0] op;
output reg [4:0] r1, r2, r3;
output reg [15:0] imm;
output reg [25:0] j_imm;

always @(posedge clk)
begin
  if(rst)
   begin
   op <= 6'b000000;
   r1 <= 5'b0;
   r2 <= 5'b0;
   r3 <= 5'b0;
	imm <= 16'b0;
	j_imm <= 26'b0; 
   end
 else
   begin
	if(IRWrite)
	 begin
	  op <= Instruction[31:26];
	  r1 <= Instruction[25:21];
	  r2 <= Instruction[20:16];
	  r3 <= Instruction[15:11];
	  imm <= Instruction[15:0];
	  j_imm <= Instruction[25:0];
	  end
	end
end



endmodule

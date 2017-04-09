`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:22 11/30/2015 
// Design Name: 
// Module Name:    CPU 
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
module CPU(clk, rst);
input clk, rst;

//Controller
wire [5:0] Op_Wire;
wire [2:0] ALUOp;
wire [1:0] PCSource, ALUSrcB;
wire BEQ_BNE, ALUSrcA, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, PCWriteCond, NbitBranchSelect;
wire [3:0] current_state;
wire [3:0] next_state;

Controller Control(BEQ_BNE, PCSource, ALUOp, ALUSrcA, ALUSrcB, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, next_state, current_state, PCWriteCond, Op_Wire, clk, rst, NbitBranchSelect);

Datapath Data_Path(Op_Wire, BEQ_BNE, PCSource, ALUOp, ALUSrcA, ALUSrcB, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, PCWriteCond, clk, rst, NbitBranchSelect);

endmodule

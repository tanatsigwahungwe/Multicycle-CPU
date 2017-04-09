`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:38 11/10/2015 
// Design Name: 
// Module Name:    Controller 
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
module Controller(BEQ_BNE, PCSource, ALUOp, ALUSrcA, ALUSrcB, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite,  next_state, current_state, PCWriteCond, Op, clk, rst, NbitBranchSelect);
output reg [2:0] ALUOp;
output reg [1:0] PCSource, ALUSrcB;
output reg BEQ_BNE, ALUSrcA, RegWrite, IRWrite, MemToReg, MemToWrite, MemToRead, IorD, PCWrite, PCWriteCond, NbitBranchSelect;
input clk, rst;
input [5:0] Op;
output reg[3:0] current_state;
output reg [3:0] next_state;


initial 
 begin 
  current_state = 4'b0000;
  next_state = 4'b0000;
 end
 
 always @(posedge clk)
	if(rst)
		current_state <= 4'b0000;
	else
		current_state <= next_state; 
  
 always @(*) 
 begin 
   case (current_state)
    
	 4'b0000: //state 0
	 begin 
	 ALUOp = 3'b010;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b01;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b1;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b1;
	 IorD = 1'b0;
	 PCWrite = 1'b1;
	 PCWriteCond = 1'b0;
    NbitBranchSelect = 1'b0;	
    end
	 
	 4'b0001:  //state 1
	 begin 
	 ALUOp = 3'b010;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b11;
	 BEQ_BNE = Op[0];
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	if(Op[5:3] == 3'b100)
	 begin
		NbitBranchSelect = 1'b0;	
	end
   else
   begin
      NbitBranchSelect = 1'b1;	
   end
	 end
	 
	 4'b0010: //state 2
	 begin 
	 if(Op == 6'b111011)
		begin 
			ALUOp = 3'b010;
		end
	 else if (Op == 6'b111001)
       begin
          ALUOp = 3'b010;
       end		 
	 else
		begin
			ALUOp = Op[2:0]; 
	  end	 
	 PCSource = 2'b0; 
	 if (Op == 6'b110111)
       begin
          ALUSrcB = 2'b10;
       end	
    else if (Op == 6'b110010)
       begin
          ALUSrcB = 2'b10;
       end	
    else if (Op == 6'b110011)
       begin
          ALUSrcB = 2'b10;
       end			 
	 else
		begin
			ALUSrcB = 2'b11;
	  end	 
	 
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b1;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 if(Op[5:2] == 4'b1111)
	 begin
		NbitBranchSelect = 1'b0;	
	end
   else
   begin
      NbitBranchSelect = 1'b1;	
   end 	
	end
	 
	 4'b0011: //state 3
	 begin
	 ALUOp = 3'b0;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b1;
	 IorD = 1'b1;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b0100: //state 4
	 begin
	 ALUOp = 3'b0;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b1;
	 IRWrite = 1'b0;
	 MemToReg = 1'b1;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b0101: //state 5
	 begin
	 ALUOp = 3'b0;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b1;
	 MemToRead = 1'b0;
	 IorD = 1'b1;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b0110: //state 6
	 begin
	 ALUOp = Op[2:0];
	 PCSource = 2'b0;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b1;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b0111: //state 7
	 begin
	 ALUOp = 3'b010;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b11;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b1;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b1000: //state 8
	 begin
	 ALUOp = 3'b011;
	 PCSource = 2'b01;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = Op[0];
	 ALUSrcA = 1'b1;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b1;
	 NbitBranchSelect = 1'b0;
	 end
	 
	 4'b1001: //state 9
	 begin
	 ALUOp = 3'b0;
	 PCSource = 2'b10;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b1;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b1;
	 end
	 
	 4'b1010:  //state 10
	 begin 
	 ALUOp = 3'b010;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b11;
	 BEQ_BNE = Op[0];
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	if(Op[5:3] == 3'b100)
	 begin
		NbitBranchSelect = 1'b0;	
	end
   else
   begin
      NbitBranchSelect = 1'b1;	
   end
	 end
	 
	default: 
   begin 
 	 ALUOp = 3'b0;
	 PCSource = 2'b0;
	 ALUSrcB = 2'b00;
	 BEQ_BNE = 1'b0;
	 ALUSrcA = 1'b0;
	 RegWrite = 1'b0;
	 IRWrite = 1'b0;
	 MemToReg = 1'b0;
	 MemToWrite = 1'b0;
	 MemToRead = 1'b0;
	 IorD = 1'b0;
	 PCWrite = 1'b0;
	 PCWriteCond = 1'b0;
	 NbitBranchSelect = 1'b0;
	 end	 
	 endcase 

 end

//next state logic 

always @(rst or current_state or Op)
begin 
  if(rst) 
   begin 
	next_state = 4'b0;
	end
	else
	  case (current_state)
	  4'b0000: next_state = 4'b0001;
	  4'b0001: if(Op[5:4] == 2'b01) //r type
	           next_state = 4'b0110;
				  else if(Op[5:4] == 2'b10) //Branch (i type) 
	           next_state = 4'b1010;
              else if(Op[5:4] == 2'b11) // logical (i type) 				  
	           next_state = 4'b0010;
				  else if (Op == 6'b000001)  //jump 
				  next_state = 4'b1001; 
				  else   //Noop
				  next_state = 4'b0000;
	  4'b0010: if(Op == 6'b111011) //lwi
	           next_state = 4'b0011;
				  else if(Op == 6'b111100)//sw 
	           next_state = 4'b0101;
				  else //addi, subi, ori andi slti li 
				  next_state = 4'b0111;
	 4'b0011:  next_state = 4'b0100;
	 4'b0101:  next_state = 4'b0000;
	 4'b0111:  next_state = 4'b0000;
	 4'b0110:  next_state = 4'b0111;
	 4'b1000:  next_state = 4'b0000;
	 4'b1001:  next_state = 4'b0000;
	 4'b1010:  next_state = 4'b1000;
	 default:  next_state = 4'b0000;
	endcase

end

endmodule

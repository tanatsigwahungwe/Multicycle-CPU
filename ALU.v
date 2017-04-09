`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:53 11/20/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(sum, zero, a, b, op);
input [31:0] a, b;
input [2:0] op;
output reg [31:0] sum;
output reg zero;

always @(a,b,op)
	begin
		case(op)
		3'b000: sum <= a;
		3'b001: sum <= ~a;
		3'b010: sum <= a + b; 
		3'b011: sum <= a - b;
		3'b100: sum <= a | b;
		3'b101: sum <= a & b;
		3'b111: sum <= $signed(a) < $signed(b);
		default: sum <= 0;
		endcase	
	end
	 
always @(a,b,op)
   begin
	if(a == b) 
	begin
   zero <= 1'b1;
	end	
	else 
	begin
	zero <= 1'b0;
   end
end

	 
endmodule
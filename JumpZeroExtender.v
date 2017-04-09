`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:24 11/21/2015 
// Design Name: 
// Module Name:    JumpZeroExtender 
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
module JumpZeroExtender(in, out);
input [25:0] in;
output reg [31:0] out;

always @(in)
begin
out [31:26] <= 6'b0;
out [25:0] <= in[25:0]; 
end
endmodule
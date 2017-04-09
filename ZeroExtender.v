`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:10 11/20/2015 
// Design Name: 
// Module Name:    ZeroExtender 
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
module ZeroExtender(in, out);
input [15:0] in;
output reg [31:0] out;

always @(in)
begin
out [31:16] <= 16'b0;
out [15:0] <= in[15:0]; 
end
endmodule
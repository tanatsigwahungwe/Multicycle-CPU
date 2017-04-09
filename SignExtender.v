`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:19 11/20/2015 
// Design Name: 
// Module Name:    SignExtender 
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
module SignExtender(in, out);
input [15:0] in;
output reg [31:0] out;

always @(in)
begin
out [31:16] <= {16{in[15]}};
out [15:0] <= in[15:0]; 
end
endmodule

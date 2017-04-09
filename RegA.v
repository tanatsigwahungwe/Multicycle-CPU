`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:41 11/20/2015 
// Design Name: 
// Module Name:    RegA 
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
module RegA(in, out, clk, rst);
input [31:0] in;
output reg [31:0] out;
input  clk, rst;

always @(posedge clk)
begin
 if(rst)
   begin
     out <= 32'b0;
   end
  else
   begin
    out <= in;
   end
end


endmodule

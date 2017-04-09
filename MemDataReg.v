`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:59 11/21/2015 
// Design Name: 
// Module Name:    MemDataReg 
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
module MemDataReg(in, out, clk, rst);
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

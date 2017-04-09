`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:50 11/20/2015 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(enable, address, out, clk, rst);
input enable, clk, rst;
input [31:0] address;
output reg [31:0] out; 

always @(posedge clk)
begin
  if(rst)
     begin 
       out <= 32'b0;
     end
  else
    begin
	   if(enable)
	    begin
	      out <= address;
	    end
	 end
end

endmodule

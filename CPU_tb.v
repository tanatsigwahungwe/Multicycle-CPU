`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:41:34 11/30/2015
// Design Name:   CPU
// Module Name:   /ad/eng/users/b/c/bcootner/Desktop/CPUProject/CPU_tb.v
// Project Name:  CPUProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.rst(rst)
	);

		
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		
		// Wait 50 ns for global reset to finish
		#50 rst = 0;
	

		// Add stimulus here

	end
      
endmodule


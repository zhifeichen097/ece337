// File name:   adder_16.sv
// Created:     1/19/2015
// Author:      Tim Pritchett
// Version:     1.0  Initial Design Entry
// Description: 16 bit adder design wrapper for synthesis optimization seciton of Lab 2
`timescale 1ns / 100ps
module adder_16
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	assign sum = ((a + b + carry_in) % (2 **16));
	assign overflow = ((a + b + carry_in) / (2 ** 16));
	always@*
	  begin
		for(int j = 0; j < 16; j++) begin
		   assert ((( a[j] == 1'b0) || (a[j] == 1'b0)) && ((b[j] == 1'b0) || (b[j] == 1'b1)))
		   else $error("Input  'a' or 'b' of component is not a digital logic value");
		   #(2) assert ((a[j] + b[j] + carrys[j]) % 2 == sum[j])
		   else $error("Output is not correct");
		end
	 end  

endmodule

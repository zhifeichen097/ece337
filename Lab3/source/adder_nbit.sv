// $Id: $
// File name:   adder_nbit.sv
// Created:     1/20/2019
// Author:      ZhiFei Chen
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: N-bit adder
`timescale 1ns / 100ps
module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire [(BIT_WIDTH-1):0] a,
	input wire [(BIT_WIDTH-1):0] b,
	input wire carry_in,
	output wire [(BIT_WIDTH-1):0] sum,
	output wire overflow);


	wire [BIT_WIDTH:0] carrys;
	genvar i;
	assign carrys[0] = carry_in;
	generate
	for(i=0; i <= (BIT_WIDTH - 1); i=i+1)
	   begin
		adder_1bit IX  ( .a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
	   end
	endgenerate
	assign overflow=carrys[BIT_WIDTH];
	always@*
	  begin
		for(int j = 0; j < BIT_WIDTH; j++) begin
		   assert ((( a[j] == 1'b0) || (a[j] == 1'b0)) && ((b[j] == 1'b0) || (b[j] == 1'b1)))
		   else $error("Input  'a' or 'b' of component is not a digital logic value");
		   #(2) assert ((a[j] + b[j] + carrys[j]) % 2 == sum[j])
		   else $error("Output is not correct");
		end
	 end  
endmodule

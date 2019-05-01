// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/8/2019
// Author:      ZhiFei Chen
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: parallel to serial
module flex_pts_sr#(NUM_BITS = 4, SHIFT_MSB = 1)(
	input wire clk,
	input wire n_rst,
	input wire load_enable,
	input wire shift_enable,
	output reg serial_out,
	input wire [NUM_BITS - 1: 0] parallel_in);

reg [NUM_BITS - 1: 0] next_shift; //declaring local var
reg [NUM_BITS - 1: 0] curr_shift; //declaring local var

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 0) begin
		curr_shift <= '1;
	end
	else begin
	 
		 curr_shift <= next_shift;
	end
end 
if (SHIFT_MSB == 1) begin
    assign serial_out = curr_shift[NUM_BITS-1];
end
else begin
    assign serial_out = curr_shift[0];
end
always_comb begin 
	next_shift = curr_shift;
if (load_enable == 1) begin
      next_shift = parallel_in;
end
else if(shift_enable == 1) begin
      if (SHIFT_MSB == 1) begin
           next_shift = {curr_shift[NUM_BITS-2:0], 1'b1};
	end
       else begin
           next_shift = {1'b1, curr_shift[NUM_BITS-1:1]};
	end
end
else begin
          next_shift = curr_shift;
end

 
end
endmodule 
          


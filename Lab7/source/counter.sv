// $Id: $
// File name:   counter.sv
// Created:     2/27/2019
// Author:      ZhiFei Chen
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: counter to 1k

module counter(
	       input wire  clk,
	       input wire  n_rst,
	       input wire  cnt_up,
	       input wire  clear,
	       output wire one_k_samples);

   //call flex counter
   flex_counter #(10) counter_to_1k (.clk(clk),
				     .n_rst(n_rst),
				     .clear(clear),
				     .count_out(),
				     .count_enable(cnt_up),
				     .rollover_val(10'd1000),
				     .rollover_flag(one_k_samples));
endmodule // counter

   
	    

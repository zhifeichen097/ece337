// $Id: $
// File name:   sensor_d.sv
// Created:     1/18/2019
// Author:      ZhiFei Chen
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: dataflow.
// dessign for dataflow.
// 


module sensor_d(

	input wire [3:0]sensors,
	output wire error

);


	assign and1 = sensors[1] & sensors[2];
	assign and2 = sensors[3] & sensors[1];
	assign or1 = and1 | and2;
	assign error = or1 | sensors[0];
endmodule

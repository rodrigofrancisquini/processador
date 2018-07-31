module display(clock, data_in,seg1,seg2);
	input clock;
	input [6:0] data_in;
	output [3:0] seg1;
	output [3:0] seg2;
	out1 out1(data_in, seg1, seg2);
endmodule
module display2(clock, data_in,seg1,seg2,seg3,seg4);
	input clock;
	input [14:0] data_in;
	output [6:0] seg1;
	output [6:0] seg2;
	output [6:0] seg3;
	output [6:0] seg4;
	out2 out2(data_in,seg1,seg2, seg3, seg4);
endmodule
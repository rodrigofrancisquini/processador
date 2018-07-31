module flipflop 
(
	data_in,
	clock_in, 
	control_in, 
	out_fp
);

	input data_in;
	input clock_in;
	input control_in;
	
	output reg out_fp;
	
	always@(posedge clock_in) begin
		if (control_in==1) begin
			out_fp = data_in;
		end
		end
		endmodule
		
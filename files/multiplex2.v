module multiplex2

#(
	parameter data_size = 32
)

(
	selection_in,
	data_in1,
	data_in2,
	data_in3,
	data_out
);

	input [1:0] selection_in;
	input [data_size-1:0] data_in1;
	input [data_size-1:0] data_in2;
	input [data_size-1:0] data_in3;
	output reg [data_size-1:0] data_out;
	
	always@(*)
		case (selection_in[1:0])
			2'b00: data_out = data_in1;
			2'b01: data_out = data_in2;
			2'b10: data_out = data_in3;
			default: data_out = 32'b1;
		endcase
	endmodule
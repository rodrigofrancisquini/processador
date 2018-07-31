module multiplex 
(
	selection_in,
	data_in1,
	data_in2,
	data_out
);

input selection_in;
input [31:0] data_in1;
input [31:0] data_in2;

output reg [31:0] data_out;

always@ (*)
	
	case (selection_in)
		1'b0: data_out = data_in1;
		1'b1: data_out = data_in2;
		default: data_out = 32'b1;
	endcase
endmodule
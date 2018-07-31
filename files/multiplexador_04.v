module multiplexador_04

(
	UC_mult04,
	data_in1,
	data_in2,
	data_in3,
	data_in4,
	mult_out
);

input [1:0] UC_mult04;
input [31:0] data_in1;
input [31:0] data_in2;
input [31:0] data_in3;
input [31:0] data_in4;
output reg [31:0] mult_out;
	
always@(*)
	case (UC_mult04)
		2'b00: mult_out = data_in1;
		2'b01: mult_out = data_in2;
		2'b10: mult_out = data_in3;
		2'b11: mult_out = data_in4;
		default: mult_out = 32'b1;
	endcase
endmodule
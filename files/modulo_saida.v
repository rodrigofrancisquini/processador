module modulo_saida
(
	clock,
	data_in,
	flag,
	disp_out,
	display1,
	display2,
	display3
);

input clock;
input [31:0] data_in;
input flag;
input [1:0] disp_out;

output reg[14:0]display1;
output reg[14:0]display2;
output reg[14:0]display3;

always @ (posedge clock) begin	
	if (flag==1) begin
		case (disp_out)
			2'b00: display2=data_in;
			2'b01: display1=data_in;
			2'b10: display3=data_in;
		endcase
	end
end

endmodule
module ula
(
	selection_in,
	data1,
	data2,
	data_out	
);

localparam    
	_add = 3'b000,
	_sub = 3'b001,
	_more = 3'b010,
	_less = 3'b011,
	_equal = 3'b100;

			     
input [31:0] data1;   
input [31:0] data2;
input [2:0] selection_in;

output reg [31:0]data_out;   

always @(data1 or data2 or selection_in)
begin
		case( selection_in )
			_add: 
				data_out = data1 + data2;
			_sub: 
				data_out = data1 - data2;
			_more: begin
				if(data1 > data2) data_out = 32'b00000000000000000000000000000001;
				else data_out = 32'b00000000000000000000000000000000;
			end
			_less: begin
				if(data1 < data2) data_out = 32'b00000000000000000000000000000001;
				else data_out = 32'b00000000000000000000000000000000;
			end
			_equal: begin
				if(data1 == data2) data_out = 32'b00000000000000000000000000000001;
				else data_out = 32'b00000000000000000000000000000000;
			end
			default:
				data_out = 32'b00000000000000000000000000000000;
		endcase
end



endmodule
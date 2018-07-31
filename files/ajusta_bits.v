module ajusta_bits

(
	switches,
	ajusta_out
);

input [6:0] switches;
output reg [31:0] ajusta_out;

always@ (*) begin	
	ajusta_out = {{28{1'b0}}, switches[3:0]}; 
	end
endmodule
		
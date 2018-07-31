module memoria_dados

(
	clock,
	data_in,
	endereco,
	flag,
	data_out
);

input clock;
input [1:0]flag;
input [31:0] data_in;
input [31:0] endereco;

output [31:0] data_out;

reg [31:0] memoria_dados[100:0];

always @(posedge clock)
begin
		if(flag == 2'b01) begin
			memoria_dados[endereco] = data_in;
		end
end

assign data_out = memoria_dados[endereco]; 


endmodule
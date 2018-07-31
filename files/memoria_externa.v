//----------------------------------------
// 	Disco Rigido
//----------------------------------------

module memoria_externa

#( 
  parameter data_size = 32,
  parameter memory_size = 11
)

(
	end_l,
	end_c,
	clock_in,
	instruction_out
);

input wire clock_in;
integer flag=0;

input wire [memory_size-1:0] end_l;
input wire [memory_size-1:0] end_c;

output [data_size-1:0] instruction_out;

reg [data_size-1:0] memoria_instrucoes [10:0][10:0];

always @(posedge clock_in)
begin
	if (flag == 0) begin
		memoria_instrucoes[8][0] <= 32'b11111000000000000000000000000000; // NOTHING
		memoria_instrucoes[8][1] <= 32'b11111101000000000000000000000010;  // SOi <- 2 ARRUMAR
		memoria_instrucoes[8][2] <= 32'b01100110000000000000000000000000; // SO <- 0
		memoria_instrucoes[8][3] <= 32'b01100100010000000000000000000000; // processo <- 0
		memoria_instrucoes[8][4] <= 32'b01010100111100010000000000000000;  // SOii = SO < SOi
		memoria_instrucoes[8][5] <= 32'b10010100110000000000000000101000; // branch final 40
		memoria_instrucoes[8][6] <= 32'b00001100101100100000000000000001; // add SO3i = FP + 1
		memoria_instrucoes[8][7] <= 32'b10001100100000000000000000000010;  // OUTPUT SO3i
	end
end

assign instruction_out = memoria_instrucoes[end_l][end_c];

endmodule
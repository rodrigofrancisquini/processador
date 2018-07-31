//----------------------------------------
// 	BIOS
//----------------------------------------

module bios

#( 
  parameter data_size = 32,
  parameter memory_size = 11
)

(
	end_l,
	end_c,
	clock_in,
	instruction_out,
	end_save,
	maxprocesso
);

input wire clock_in;

input wire [memory_size-1:0] end_l;
input wire [memory_size-1:0] end_c;
input wire [memory_size-1:0] end_save;
output [data_size-1:0] instruction_out;
input wire [5:0] maxprocesso;

reg [data_size-1:0] memoria_instrucoes [1:0][100:0];

always @(negedge clock_in)
begin

memoria_instrucoes[0][0] = 32'b11111000000000000000000000000000; // NOTHING
memoria_instrucoes[0][1] = 32'b01100000010000000000000000001100; // processo <- 12
memoria_instrucoes[0][2] = 32'b10001000010000000000000000000000; // output processo
memoria_instrucoes[0][3] = 32'b01100000010000000000000000100010; // processo <- 34
memoria_instrucoes[0][4] = 32'b10001000010000000000000000000001; // output processo
memoria_instrucoes[0][5] = 32'b01100000010000000001011000101110; // processo <- 5678
memoria_instrucoes[0][6] = 32'b10001000010000000000000000000010; // output processo

memoria_instrucoes[0][7] = 32'b01100110000000000000000000000000; // SO <- 0
memoria_instrucoes[0][8] = 32'b01100101000000000000000000001000; // SOi <- 8
memoria_instrucoes[0][9] = 32'b01100000100000000000000000000000; // .2 <- 0
memoria_instrucoes[0][10] = 32'b01100011110000000000000000101100; // .15 <- 44
memoria_instrucoes[0][11] = 32'b01010000010001001111000000000000;  // .1 = .2 < .15
memoria_instrucoes[0][12] = 32'b10001011110000000000000000000010;  // OUTPUT .15
memoria_instrucoes[0][13] = 32'b10010000010000000000000000010100; // branch final 20
memoria_instrucoes[0][14] = 32'b10100000111010000010000000000000; // .3 <= hdload SOi, .2
memoria_instrucoes[0][15] = 32'b10001000100000000000000000000000;  // OUTPUT .2
memoria_instrucoes[0][16] = 32'b10110000111100000010000000000000; // .3 => storeso SO, .2
memoria_instrucoes[0][17] = 32'b00001000100001000000000000000001; // add .2 = .2 + 1
memoria_instrucoes[0][18] = 32'b01100001000000000000000000001011; // .4 <- 11
memoria_instrucoes[0][19] = 32'b01110001000000000000000000000000; //jump to .4

memoria_instrucoes[0][20] = 32'b10001011110000000000000000000001; // NOTHING
memoria_instrucoes[0][21] = 32'b10001011110000000000000000000001; // NOTHING

end
assign instruction_out = memoria_instrucoes[0][end_c];
endmodule
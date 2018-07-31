module memoria_instrucoes

(
	clock,
	pc_counter,
	instruction
);

input clock;
input [9:0] pc_counter;
output [31:0] instruction;

reg [31:0] memoria_instrucoes [100:0];

always @(negedge clock)
begin
	
	memoria_instrucoes[0] <= 32'b00000000000000000000000000000000; // NOTHING
	memoria_instrucoes[1] <= 32'b00111000000000000000000000000000;  // .0 <- input
	memoria_instrucoes[2] <= 32'b01000000000000000000000000000000;  // output .0 em d1
	
	memoria_instrucoes[3] <= 32'b00111000010000000000000000000000;  // .1 <- input
	memoria_instrucoes[4] <= 32'b01000000010100000000000000000000;  // output .1 em d2
	
	memoria_instrucoes[5] <= 32'b10000000100000100000000000000000;  // .2 = (.0 == .1)
	memoria_instrucoes[6] <= 32'b01100000100000000000000000000000;  // branchi .2 to 0
	
	memoria_instrucoes[7] <= 32'b01000000011000000000000000000000;  // output .1 em d3
	
	memoria_instrucoes[8] <= 32'b00111000000000000000000000000000;  // .0 <- input
	memoria_instrucoes[9] <= 32'b01000000000000000000000000000000;  // output .0 em d1
	
	memoria_instrucoes[10] <= 32'b01001000000000000000000000000000;  // jump to .0
	
	memoria_instrucoes[11] <= 32'b11111000000000000000000000000000;  // stop
	
end

assign instruction = memoria_instrucoes[pc_counter];


endmodule
module cpu
(
	clock,
	switches,
	display1,
	display2,
	display3,
	clock_input
);

input clock;
input [6:0] switches;

output [14:0] display1;
output [14:0] display2;
output [14:0] display3;
output clock_input;

wire [31:0] ajusta_out;
wire [31:0] mult_01;
wire [31:0] mult_02;
wire [31:0] instruction;
wire [31:0] regD;
wire [31:0] regR1;
wire [31:0] regR2;
wire [31:0] ula_out;
wire [31:0] dados_memoria;

wire [9:0] pc_count;
wire [9:0] mult_03;

wire [2:0] uc_ula;

wire [1:0] UC_mult01;
wire [1:0] UC_mult02;
wire [1:0] UC_mult03;
wire [1:0] UC_counter;
wire [1:0] UC_dados;
wire [1:0] UC_registradores;

wire UC_disp_out;

pc_counter pc_counter
(	
	clock, 
	UC_counter,
	mult_03,
	pc_count
);

ajusta_bits ajusta_bits
(
	switches[6:0],
	ajusta_out
);

memoria_instrucoes memoria_instrucoes
(	
	clock,
	pc_count,
	instruction
);


controladora controladora
(
	instruction[31:27],
	regD,
	UC_registradores,
	UC_mult01,
	UC_mult02,
	UC_mult03,
	UC_counter,
	UC_dados,
	UC_disp_out,
	uc_ula,
	clock_input
);


banco_registradores banco_registradores
(
	instruction[26:22],
	instruction[21:17],
	instruction[16:12],
	clock,
	UC_registradores,
	mult_01,
	regD,
	regR1,
	regR2
);

ula ula
(
	uc_ula,
	regR1,
	mult_02,
	ula_out
);


modulo_saida modulo_saida
(
	clock,
	regD,
	UC_disp_out,
	instruction[21:20],
	display1,
	display2,
	display3
); 

memoria_dados memoria_dados
(
	clock,
	regD,
	regR1,
	UC_dados,
	dados_memoria
);


multiplexador_04 MUX_01
(
	UC_mult01,
	ajusta_out,
	ula_out,
	dados_memoria,
	instruction[9:0],
	mult_01
);

multiplexador_04 MUX_02
(
	UC_mult02,
	regR2,
	instruction[15:0],
	instruction[15:0],
	instruction[15:0],
	mult_02
);

multiplexador_04 MUX_03
(
	UC_mult03,
	instruction[9:0],
	regD,
	regR1,
	regR1,
	mult_03
);


endmodule

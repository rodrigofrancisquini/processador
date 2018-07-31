module controladora

(
	opcode,
	reg_branch,
	UC_registradores,
	UC_mult01,
	UC_mult02,
	UC_mult03,
	UC_counter,
	UC_dados,
	UC_disp_out,
	UC_ula,
	clock
);

localparam
	_add = 5'b00001,
	_addi = 5'b00010,
	_sub = 5'b00011,
	_subi = 5'b00100,
	_in = 5'b00111,
	_out = 5'b01000,
	_load = 5'b00101,
	_store = 5'b00110,
	_jump = 5'b01001,
	_jumpi = 5'b01010,
	_stop = 5'b11111,
	_branch = 5'b01011,
	_loadi = 5'b01101,
	_more = 5'b01110,
	_less = 5'b01111,
	_equal = 5'b10000,
	_branchi = 5'b01100;
			     
input [4:0] opcode;
input [31:0] reg_branch;

output reg[1:0] UC_mult01;
output reg[1:0] UC_mult02;
output reg[1:0] UC_mult03;

output reg[1:0] UC_counter;
output reg[1:0] UC_dados;

output reg [1:0] UC_registradores;
output reg UC_disp_out;
output reg [2:0]UC_ula;
output reg clock;

always@ (opcode) begin
	case (opcode)
			_add: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b000;
			end	
			_addi: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b01;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b000;
			end	
			_sub: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b001;
			end	
			_subi: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b01;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b001;
			end			
			_load: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b10;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_store: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b01;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_in: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b00;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 0;
				UC_ula = 3'bxxx;
			end
			_out: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 1;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_jumpi: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'b00;
				UC_counter = 2'b01;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_jump: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'b01;
				UC_counter = 2'b01;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_branchi: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'b00;
				if(reg_branch == 32'b00000000000000000000000000000001) UC_counter = 2'b01;
				else UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_branch: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'b10;
				if(reg_branch == 32'b00000000000000000000000000000001) UC_counter = 2'b01;
				else UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_stop: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'bxx;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b11;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
			_loadi: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b11;
				UC_mult02 = 2'bxx;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end	
			_more: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b010;
			end	
			_less: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b011;
			end	
			_equal: begin
				UC_registradores = 2'b01;
				UC_mult01 = 2'b01;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'b100;
			end	
			default: begin
				UC_registradores = 2'b00;
				UC_mult01 = 2'b00;
				UC_mult02 = 2'b00;
				UC_mult03 = 2'bxx;
				UC_counter = 2'b00;
				UC_dados = 2'b00;
				UC_disp_out = 0;
				clock = 1;
				UC_ula = 3'bxxx;
			end
					
	endcase
end
		
endmodule
					


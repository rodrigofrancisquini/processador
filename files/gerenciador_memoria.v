//----------------------------------------
// 	Memoria de instrucoes
//----------------------------------------

module gerenciador_memoria

#( 
  parameter data_size = 32,
  parameter memory_size = 11
)

(
	end_l,
	end_c,
	clock_in,
	instruction_out,
	control_memoria,
	control_addr,
	end_line,
	processo,
	data_reg3,
	data_reg2,
	data_mult1,
	control_ms,
	control_iso,
	switch
);

input wire clock_in;
input wire switch;
input wire control_ms;
input wire control_iso;
input wire [memory_size-1:0] end_l;
input wire [memory_size-1:0] end_c;
output wire[data_size-1:0] instruction_out;
output wire control_memoria;
output wire [memory_size-1:0] control_addr;
output wire [5:0] end_line;
input wire [data_size-1:0] processo;
input wire [data_size-1:0] data_reg3;
input wire [data_size-1:0] data_reg2;
input wire [data_size-1:0] data_mult1;
wire [31:0]instruction_memoria;
wire [31:0]instruction_so;
wire [31:0]instruction_bios;
reg [31:0]instruction;
reg [7:0] cont;
reg [memory_size-1:0] line;
reg [1:0] line_so;
reg [memory_size-1:0] end_c_so;
reg [memory_size-1:0] linecontrol;
reg [memory_size-1:0] finallinecontrol;
reg control;
reg regcontrol_memoria;
reg control_so;
reg control_bios;
localparam    _plus1 = 8'b00000001;
localparam    _plus1line = 11'b00000000001;
localparam    _plus1endc = 32'b000000000000000000000000000001;
localparam    _plus1processo = 6'b000001;

reg [5:0] maxprocesso;
memoria_instrucoes memoria_instrucoes
(	
	processo,
	end_c,
	clock_in,
	instruction_memoria,
	data_reg3,
	data_reg2,
	data_mult1,
	control_ms
);


initial 
	begin
		line = 11'b00000000001;
		line_so = 2'b00;
		end_c_so = 32'b000000000000000000000000000000;
		control = 0;
		regcontrol_memoria = 0;
		cont = 8'b00000000;
		control_so = 1'b1;
		control_bios = 1'b0;
		maxprocesso = 6'b000010;
	end

localparam    
	_bios = 32'b000000000000000000000000001000, //8
	_soload = 32'b000000000000000000000000001001; //9

always @(posedge clock_in)
begin
	instruction = instruction_memoria;
end

assign instruction_out = instruction;
assign control_memoria = regcontrol_memoria;
assign control_addr = end_c_so;
assign end_line = processo;
endmodule
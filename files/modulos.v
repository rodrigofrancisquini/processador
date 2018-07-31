module modulos

(
	clock_in,
	instruction,
	modu,
	valor,
	reg2,
	network_in,
	pkdis,
	indis,	
	mddis
);

input [11:0]network_in;
input clock_in;
input [31:0] valor;
input [31:0] instruction;
output [7:0]modu;
reg [7:0]buffer;
reg [7:0]nbuffer;
reg [4:0] v = 5'b00000;
input [31:0]reg2;
output [2:0] indis;
output [3:0] pkdis;
output [4:0] mddis;
reg st = 0;
reg c = 0;
reg r = 0;
initial
begin
	buffer[0] = 0;
	buffer[1] = 0;
	buffer[2] = 0;
	buffer[3] = 0;
	buffer[4] = 0;
	buffer[5] = 0;
	buffer[6] = 0;
	buffer[7] = 0;
end

always @(posedge clock_in) begin
	if(instruction[31:27] == 5'b10001 && instruction[1:0] == 2'b11) begin
		if(reg2 == 32'b00000000000000000000000000000001) begin
			buffer[valor] = 1;
		end
		else begin
			buffer[valor] = 0;
		end
	end
	else begin
		if(v != 5'b00000 && c == 0) begin
			buffer[v] = st;
			c = 1;
		end
		else if(r == 1) begin
			c = 0;
		end		
	end
end

always @(network_in or c) begin
	if(network_in[11:9] == 3'b001 && c == 0 && r == 0) begin
		v = network_in[4:0];
		st = 1;
		r = 0;
	end
	else if(network_in[11:9] == 3'b010 && c == 0 && r == 0) begin
		v = network_in[4:0];
		st = 0;
		r = 0;
	end
	else if(c == 1) begin
		r = 1;
	end
	else begin
		v = 5'b00000;
		r = 0;
	end
	
end

assign modu = buffer;
assign indis = network_in[11:9];
assign pkdis = network_in[8:5];
assign mddis = network_in[4:0];
endmodule
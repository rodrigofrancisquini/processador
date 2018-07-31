module banco_registradores

(
	add_regD,
	add_regR1,
	add_regR2,
	clock,
	UC_in,
	result,
	regD,
	regR1,
	regR2
);

input [4:0] add_regD;
input [4:0] add_regR1;
input [4:0] add_regR2;
input [31:0] result;
input clock;
input [1:0] UC_in;

output [31:0] regD;
output [31:0] regR1;
output reg [31:0] regR2;

reg[31:0] registradores [31:0];
reg [31:0] regR2_m;

always @(posedge clock)
begin
	if (UC_in == 2'b01)
	begin
		registradores[add_regD] = result;
	end
	regR2 = registradores[add_regR2];
end
 
assign regD = registradores[add_regD];
assign regR1 = registradores[add_regR1];
endmodule



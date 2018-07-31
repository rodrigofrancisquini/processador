module display7seg(clock, numero, a, b, c, d, e, f, g);

input clock;
output a,b,c,d,e,f,g;
input [3:0] numero;
reg [7:0] seg7;

always@(posedge clock)
begin

	case(numero)
	4'b0000 : seg7 = 7'b0000001;
	4'b0001 : seg7 = 7'b1001111;
	4'b0010 : seg7 = 7'b0010010;
	4'b0011 : seg7 = 7'b0000110;
	4'b0100 : seg7 = 7'b1001100;
	4'b0101 : seg7 = 7'b0100100;
	4'b0110 : seg7 = 7'b0100000;
	4'b0111 : seg7 = 7'b0001101;
	4'b1000 : seg7 = 7'b0000000;
	4'b1001 : seg7 = 7'b0000100;
	4'b1010 : seg7 = 7'b1111110;
	4'b1011 : seg7 = 7'b1111111;
	default : seg7 = ~7'b1111111;
	endcase
	end
	assign {a,b,c,d,e,f,g} = seg7;
	endmodule
module processa(
	clockautomatico,
	buzzer,
	seg7,
	seg8,
	pin_input,
	clock_out,
	switches
);

input clockautomatico;
input clock_out;
input [6:0] switches;

output buzzer;
output pin_input;
output [7:0] seg7;
output [7:0] seg8;

wire clockreduced;

wire[3:0] h0;
wire[3:0] h1;
wire[3:0] h2;
wire[3:0] h3;
wire[3:0] h4;
wire[3:0] h5;
wire[3:0] h6;
wire[3:0] h7;

wire[14:0] display1;
wire[14:0] display2;
wire[14:0] display3;

reducer reducer(clockautomatico, clockreduced);

display d1(clockautomatico, display1, h7, h6);
display d2(clockautomatico, display2, h5, h4);
display2 d3(clockautomatico, display3, h3, h2, h0, h1);
sevenseg sevenseg(clockautomatico, 0, h5, h4, h7, h6, h3, h2, h0, h1, seg7[7],seg7[6],seg7[5],seg7[4],seg7[3], seg7[2], seg7[1], seg7[0], seg8);

multiplex clock_multiplex 
(
	clock_input,
	clock_out,
	clockreduced,
	clockout_multiplex
);

cpu(clockout_multiplex, switches, 
display1, display2, display3, clock_input
);

assign pin_input = clock_input;
assign buzzer = 1;

endmodule
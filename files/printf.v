module printf

(
	data_reg1,
	data_reg2,
	data_reg3,
	extensor_out,
	data_out,
	outprintf1,
	outprintf2,
	outprintf3,
	printfext,
	printfula,
	clock_in
);

input [31:0] data_reg1;
input [31:0] data_reg2;
input [31:0] data_reg3;
input [31:0] extensor_out;
input [31:0] data_out;
input clock_in;
output [31:0] outprintf1;
output [31:0] outprintf2;
output [31:0] outprintf3;
output [31:0] printfext;
output [31:0] printfula;

assign outprintf1 = data_reg1;
assign outprintf2 = data_reg2;
assign outprintf3 = data_reg3;
assign printfext = extensor_out;
assign printfula= data_out;

endmodule
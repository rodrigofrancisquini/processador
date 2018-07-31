module reducer

(
	clock_in,
	clock_out
);

input wire clock_in;
output wire clock_out;

reg [31:0] cont;
reg out;
localparam    _plus1 = 32'b00000000000000000000000000000001;

initial
	begin
		cont = 32'b0;
		out = 0;
	end

always @(posedge clock_in)
begin
	if (cont == 32'b00000000111111111111111111111111) begin
		cont = 32'b0;
		out = 1;
	end
	else begin
		cont = cont + _plus1;
		out = 0;
	end
end

assign clock_out = out;

endmodule
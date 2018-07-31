module pc_counter

(
	clock,
	flag,
	new_add_inst,
	add_inst
);

input clock;
input [1:0] flag;
input [9:0] new_add_inst;
reg [9:0] counter;
output [9:0] add_inst;

initial
	begin
		counter = 10'b0000000000;
	end
	
always @(posedge clock)
begin
	if(flag == 2'b00) begin
		counter = counter + 10'b0000000001;
	end
	else if(flag == 2'b01) begin
		counter = new_add_inst;
	end
	else if(flag == 2'b11) begin
		counter = counter;
	end
end

assign add_inst = counter;

endmodule
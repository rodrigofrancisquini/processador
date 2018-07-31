//----------------------------------------
// 	Memoria de dados
//----------------------------------------

module network_buffer

#( 
  parameter data_size = 32,
  parameter memory_size = 11
)

(
	data_in,
	network_in,
	network_out,
	clock_in,
	network_control,
	data_out,
	interrupt_out,
	instruction,
	in_pckg_in,
	in_pckg_out,
	clock_net,
	ready
);

input clock_in;
input clock_net;
output [3:0] in_pckg_out;
output [3:0] in_pckg_in;
input [31:0] instruction;
input [1:0] network_control;
input [12:0] data_in;
input [11:0] network_in;
output [11:0] network_out;
output [12:0] data_out;
output [8:0] interrupt_out;
output ready;
reg [8:0] interrupt;
reg [11:0] buffer_in[15:0];
reg [11:0] buffer_out[15:0];
reg status_in[15:0];
reg status_out[15:0];
reg [3:0] stack_in = 4'b0000;
reg [3:0] stack_out = 4'b0000;
reg [3:0] stack_out_next = 4'b0001;
reg [3:0] stack_out_control = 4'b0000;
reg [3:0] stack_out_control_next = 4'b0001;
reg [3:0] stack_in_control = 4'b0000;
reg [3:0] stack_in_next = 4'b0001;
reg [3:0] pckg_in = 4'b0000;
reg [3:0] pckg_in_next = 4'b0000;
reg regready = 0;
reg [1:0] counter = 2'b00;
reg reset = 0;
reg[4:0] instruction_reg;
reg [11:0] instruction_out;
initial
begin
	buffer_out[0] = 12'b000000000000;
	status_out[1] = 0;
	status_out[2] = 0;
	status_out[3] = 0;
	status_out[4] = 0;
	status_out[5] = 0;
	status_out[6] = 0;
	status_out[7] = 0;
	status_out[8] = 0;
	status_out[9] = 0;
	status_out[10] = 0;
	status_out[11] = 0;
	status_out[12] = 0;
	status_out[13] = 0;
	status_out[14] = 0;
	status_out[15] = 0;
	status_in[0] = 0;
	status_in[1] = 0;
	status_in[2] = 0;
	status_in[3] = 0;
	status_in[4] = 0;
	status_in[5] = 0;
	status_in[6] = 0;
	status_in[7] = 0;
	status_in[8] = 0;
	status_in[9] = 0;
	status_in[10] = 0;
	status_in[11] = 0;
	status_in[12] = 0;
	status_in[13] = 0;
	status_in[14] = 0;
	status_in[15] = 0;
	instruction_out = 12'b000000000000;
end

always @(posedge clock_in) begin
	instruction_reg = data_in[4:0];
	if(reset == 1) stack_out_next = 4'b0001;
	if (network_control == 2'b10) begin
		//if(status_out[stack_out_next] == 0) begin
			//buffer_out[stack_out] = {instruction[2:0], stack_out[3:0], data_in[4:0]};
			stack_out = stack_out_next;
			if(stack_out_next == 4'b1111) stack_out_next = 4'b0001;
			else stack_out_next = stack_out_next + 4'b0001;
			status_out[stack_out] = 1;
			buffer_out[stack_out] = {instruction, stack_out, instruction_reg}; 
			if(regready == 0) begin
				regready = 1;
			end
			else begin
				counter = 2'b01;
				regready = 0;
			end
		//end
	end
	if(counter == 2'b01) counter = counter + 2'b01;
	else if(counter == 2'b10) begin
		counter = 2'b00;
		regready = 1;
	end
	
end

always @(posedge clock_net) begin
	pckg_in_next = network_in[8:5];
	if(network_in[11:9] == 3'b001) begin
		buffer_in[stack_in] = network_in;
		stack_in = stack_in_next;
		stack_in_next = stack_in_next + 4'b0001;
	
	end
	else begin
		
		if((pckg_in_next != 4'b0000)) begin // & (status_out[pckg_in_next] == 1)) begin
			//if(status_in[stack_in_next] == 0) begin
				//stack_in = stack_in_next;
				//if(stack_in_next == 4'b1111) stack_in_next = 4'b0001;
				//else stack_in_next = stack_in_next + 4'b0001;
					
				//buffer_in[stack_in] = network_in;
				//status_in[stack_in] = 1;
				//stack_in = stack_in + 4'b0001;	
					
				//if(stack_out_control != 4'b0000) begin
					//if(status_out[stack_out_control] == 1) begin
						
						if(status_out[stack_out_control_next] == 1) begin
							if(stack_out_control == 4'b1111) stack_out_control_next = 4'b0001;
							else stack_out_control_next = stack_out_control + 4'b0001;
							stack_out_control = stack_out_control_next;
						end
						
						
						//else begin
							//stack_out_control = 4'b0000;
							//reset = 1;
						//end
					//end
				//end
			//end
		end
		else begin
			stack_out_control = 4'b0001;	
			reset = 1;
		end
	end
end


assign data_out = buffer_in[stack_in];
assign network_out = buffer_out[stack_out_control];
assign interrupt_out = buffer_in[stack_in-1];
assign in_pckg_in = network_in[11:9]; //pckg_in_next;
assign in_pckg_out = stack_out_control;
assign ready = regready;
endmodule
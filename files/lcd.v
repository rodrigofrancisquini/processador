module lcd (clk, rs_out, rw, en, dat_out); 

input clk;
output[7:0] dat_out;
output rs_out, rw, en;

reg e;
reg [7:0] dat;
reg rs;
reg [15:0] counter;
reg [5:0] current, next;
reg clkr;
reg [1:0] cnt;

parameter set0 = 6'h0;
parameter set1 = 6'h1;
parameter set2 = 6'h2;
parameter set3 = 6'h3;
parameter set4 = 6'h4;

parameter dat0 = 6'h7;
parameter dat1 = 6'h8;
parameter dat2 = 6'h9;
parameter dat3 = 6'hA;
parameter dat4 = 6'hB;
parameter dat5 = 6'hC;
parameter dat6 = 6'hD;
parameter dat7 = 6'hE;
parameter dat8 = 6'hF;
parameter dat9 = 6'h10;

parameter dat10 = 6'h12;
parameter dat11 = 6'h13;
parameter dat12 = 6'h14;
parameter dat13 = 6'h15;
parameter dat14 = 6'h16;
parameter dat15 = 6'h17;
parameter dat16 = 6'h18;

parameter dat17 = 6'h19;
parameter dat18 = 6'h1A;
parameter dat19 = 6'h1B;
parameter dat20 = 6'h1C;
parameter dat21 = 6'h1D;
parameter dat22 = 6'h1E;
parameter dat23 = 6'h1F;
parameter dat24 = 6'h20;
parameter dat25 = 6'h21;
parameter dat26 = 6'h22;

parameter nul=6'hF1;

initial
begin
	next = set0;
	counter = 15'b000000000000001;
end

always @(posedge clk)
begin
	counter = counter + 1;
	if(counter == 16'h000f)
	clkr = ~clkr;
end
always @(posedge clk)
begin
	current = next;
	case(current)
		set0: begin rs <= 0; dat <= 8'h38; next <= set1; end 
		set1: begin rs <= 0; dat <= 8'h0C; next <= set2; end
		set2: begin rs <= 0; dat <= 8'h06; next <= set3; end
		set3: begin rs <= 0; dat <= 8'h01; next <= dat0; end
		
		dat0: begin rs <= 1; dat <= "D"; next <= dat1; end
		dat1: begin rs <= 1; dat <= "E"; next <= dat2; end
		dat2: begin rs <= 1; dat <= "V"; next <= dat3; end
		dat3: begin rs <= 1; dat <= ":"; next <= dat4; end
		dat4: begin rs <= 1; dat <= "<"; next <= dat5; end
		dat5: begin rs <= 1; dat <= "A"; next <= dat6; end
		dat6: begin rs <= 1; dat <= "-"; next <= dat7; end
		dat7: begin rs <= 1; dat <= "C"; next <= dat8; end
		dat8: begin rs <= 1; dat <= "D"; next <= dat9; end
		dat9: begin rs <= 1; dat <= "D"; next <= dat10; end
		dat10: begin rs <= 1; dat <= "D"; next <= dat11; end
		dat11: begin rs <= 1; dat <= "D"; next <= dat12; end
		
		set4: begin rs <= 0; dat <= 8'hC0; next <= dat12; end
		
		dat12: begin rs <= 1; dat <= "D"; next <= dat13; end
		dat13: begin rs <= 1; dat <= "E"; next <= dat14; end
		dat14: begin rs <= 1; dat <= "V"; next <= dat15; end
		dat15: begin rs <= 1; dat <= ":"; next <= dat16; end
		dat16: begin rs <= 1; dat <= "<"; next <= dat17; end
		dat17: begin rs <= 1; dat <= "A"; next <= dat18; end
		dat18: begin rs <= 1; dat <= "-"; next <= dat19; end
		dat19: begin rs <= 1; dat <= "C"; next <= dat20; end
		dat20: begin rs <= 1; dat <= "D"; next <= dat21; end
		dat21: begin rs <= 1; dat <= "D"; next <= dat22; end
		dat22: begin rs <= 1; dat <= "D"; next <= dat23; end
		dat23: begin rs <= 1; dat <= "D"; next <= dat24; end
		dat24: begin rs <= 1; dat <= "D"; next <= dat25; end
		dat25: begin rs <= 1; dat <= "D"; next <= dat26; end
		dat26: begin rs <= 1; dat <= "D"; next <= nul; end
		
		nul: begin rs <= 0; dat <= 8'h00;
			if(cnt != 2'h2)
				begin
					e <= 0; next <= set0; cnt = cnt + 1;
				end
			else
				begin
					next <= nul; e <= 1;
				end
			end
		default: next = set0;
		endcase
	end
	
assign en = clkr | e;
assign rw = 0;
assign dat_out = 8'b10000100;
assign rs_out = rs;
endmodule
		
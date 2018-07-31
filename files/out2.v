//http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html

module out2(
	input [14:0] binary,
	output reg [3:0] milhao,
	output reg [3:0] Hundreds,
	output reg [3:0] Tens,
	output reg [3:0] Ones
);

integer i;
	always @(binary)begin
		//set 100's, 10's and 1's to 0
		milhao = 4'd0;
		Hundreds = 4'd0;
		Tens = 4'd0;
		Ones = 4'd0;
		
		for(i=14; i>=0; i=i-1) begin
			//add 3 to columns >= 5
			if (milhao >= 5)
				milhao = milhao + 3;
			if (Hundreds >= 5)
				Hundreds = Hundreds + 3;
			if(Tens >= 5)
				Tens = Tens + 3;
			if(Ones >= 5)
				Ones = Ones + 3;
			
			//shift left ones
			milhao = milhao <<1;
			milhao[0] = Hundreds[3];
			Hundreds = Hundreds <<1;
			Hundreds[0] = Tens[3];
			Tens = Tens <<1;
			Tens[0] = Ones[3];
			Ones = Ones << 1;
			Ones[0] = binary[i];
		end
	end
endmodule
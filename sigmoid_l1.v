module sigmoid_value(in_sig,op_sig);

input  [6:0] in_sig;
output [6:0] op_sig;
reg    [6:0] sig_value;

assign op_sig = sig_value;

	always @(*) begin
	   sig_value = 7'd0;
			case(in_sig)
					7'b1101100: sig_value = 7'b0000011;
					7'b1110010: sig_value = 7'b0000100;
					7'b0001100: sig_value = 7'b0001010;
					7'b0111110: sig_value = 7'b0001111;
					7'b1010011: sig_value = 7'b0000000;
					7'b0100011: sig_value = 7'b0001110;
					7'b1000001: sig_value = 7'b0000000;
					7'b0101001: sig_value = 7'b0001110;
					7'b1011001: sig_value = 7'b0000001;
					7'b1010111: sig_value = 7'b0000001;
					7'b1101011: sig_value = 7'b0000011;
					7'b1101111: sig_value = 7'b0000100;
					7'b1000011: sig_value = 7'b0000000;
					7'b1001111: sig_value = 7'b0000000;
					7'b0001001: sig_value = 7'b0001010;
					7'b0110010: sig_value = 7'b0001111;
					7'b0101000: sig_value = 7'b0001110;
					7'b1100100: sig_value = 7'b0000010;
					7'b0101011: sig_value = 7'b0001110;
					7'b0000100: sig_value = 7'b0001000;
					7'b1001000: sig_value = 7'b0000000;
					7'b0110110: sig_value = 7'b0001111;
					7'b0011101: sig_value = 7'b0001101;
					7'b0110101: sig_value = 7'b0001111;
					7'b1000110: sig_value = 7'b0000000;
					7'b0110011: sig_value = 7'b0001111;
					7'b1011000: sig_value = 7'b0000001;
					7'b0110111: sig_value = 7'b0001111;
					7'b1110101: sig_value = 7'b0000101;
					
			default: sig_value = 7'd0;
			endcase
	end
	
endmodule	
					
					
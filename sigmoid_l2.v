module sigmoid_value2(in_sig,op_sig);

input  [6:0] in_sig;
output [6:0] op_sig;
reg    [6:0] sig_value;

assign op_sig = sig_value;

	always @(*) begin
	   sig_value = 7'd0;
			case(in_sig)
7'b0111110   :   sig_value = 7'b0000000;
7'b1110010   :   sig_value = 7'b0001011;
7'b1101110   :   sig_value = 7'b0001100;
7'b0100001   :   sig_value = 7'b0000001;
7'b1010101   :   sig_value = 7'b0001110;
7'b0101101   :   sig_value = 7'b0000000;
7'b0011010   :   sig_value = 7'b0000010;
7'b1011000   :   sig_value = 7'b0001110;
7'b0101110   :   sig_value = 7'b0000000;
7'b1100101   :   sig_value = 7'b0001111;					
			default: sig_value = 7'd0;
			endcase
	end
	
endmodule	
					
					
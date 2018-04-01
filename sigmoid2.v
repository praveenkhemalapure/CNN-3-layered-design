module table2(indx,value);
input indx;
output value;

wire [4:0]indx;
wire [15:0]value;
reg [15:0]_tv;

assign value=_tv;

always @(*)
begin
case(indx)
0: _tv=16'b0101100000000000;
1: _tv=16'b0010000000000000;
2: _tv=16'b0010000000000000;
3: _tv=16'b0011000000000000;
4: _tv=16'b0010100000000000;
5: _tv=16'b0010110000000000;
6: _tv=16'b0011000000000000;
7: _tv=16'b0011000000000000;
8: _tv=16'b0011010000000000;
9: _tv=16'b0011100000000000;
default : _tv=16'b0000000000000000;
endcase
end 
endmodule
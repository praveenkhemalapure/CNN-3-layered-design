module cnn(rst, clk, result);

input wire rst,clk;
output wire [6:0]result;

reg [11:0]address_x1;
reg [11:0]address_xx1;
wire [6:0]x1_val,w1_val;
reg [6:0]T_summ,T_sum;
reg [8:0]cnt_x1,cnt_xx1;
reg [18:0]cnt_w1,cnt_ww1;
reg start_l1,output_ram_l1,output_ram_l11,output_ram_l111,output_ram_l1111;
reg [8:0]cnt_node,cnt_nodee;
reg [13:0]sum;
reg [13:0]addr_w1;
reg [13:0]addr_ww1;
reg [4:0]cnt_l1,cnt_l11;
reg [6:0]l1_results[30:0];
wire [6:0]m1_a,m1_b;
wire [13:0]m1_result;
reg started_output,started_output1,started_output11,started_output111,started_output1111,started_output11111;
reg started_output111111;

reg [6:0]cnt_sig_l1,cnt_sig_l11;

reg start_sigmoid;
reg [6:0]sigmoid_addr,sigmoid_addr_2;
wire[6:0]sigmoid_addr_in,sigmoid_addr_2_in;
reg [6:0]sigmoid_l1_results[26:0];
wire[6:0]sigmoid_data,sigmoid_data_2;

reg start_l2,output_ram_l2,output_ram_l22,output_ram_l222,output_ram_l2222,output_ram_l22222;

reg [11:0]address_x1_l2;
reg [11:0]address_xx1_l2;
wire[6:0]w2_val;
reg [6:0]T_summ_l2,T_sum_l2;
reg [18:0]cnt_w1_l2,cnt_ww1_l2;
reg [8:0]cnt_node_l2,cnt_nodee_l2;
reg [13:0]sum_l2;
reg [13:0]addr_w;
reg [6:0]l2_results[14:0];
reg [10:0]addr_ww1_l2;
reg [50:0]cnt_x1_l2,cnt_xx1_l2;
reg [6:0]x2_val;
reg [6:0]cnt_l1_l2,cnt_l11_l2;
reg start_sigmoid_2;
wire [13:0]m2_result;
wire [10:0]addr_w2;
wire [6:0]m2_a,m2_b;
reg [10:0]cnt_xx2_l2,cnt_x2_l2;
reg start_collecting_l2,start_collecting_l22;
reg [6:0]result_out;
reg [6:0]final_data[9:0];
reg [4:0]cnt_final,cnt_finall;

//table1 m1(index,table1_out);
//table1 m2(index1,table2_out);


ram_x1 x1(.address(address_x1),.clock(clk),.data(1'b0),.wren(1'b0),.q(x1_val));
w1 weight1(.address(addr_w1),.clock(clk),.data(1'b0),.wren(1'b0),.q(w1_val));
w2 weight2(.address(addr_w2),.clock(clk),.data(1'b0),.wren(1'b0),.q(w2_val));
multiplier1 m1(.dataa(m1_a),.datab(m1_b),.result(m1_result));
multiplier1 m2(.dataa(m2_a),.datab(m2_b),.result(m2_result));
sigmoid_value sig1(sigmoid_addr_in,sigmoid_data);
sigmoid_value2 sig2(sigmoid_addr_2_in,sigmoid_data_2);

assign m1_a       = x1_val;
assign m1_b       = w1_val;	
assign result     = result_out;	
assign sigmoid_addr_in = sigmoid_addr;
assign sigmoid_addr_2_in = sigmoid_addr_2;
assign addr_w2    = addr_ww1_l2;
assign m2_a       = w2_val;
assign m2_b       = x2_val;

//assign address_x1 = address_xx1;
//assign addr_w1    = addr_ww1;
	
always @(posedge clk or posedge rst)
if(rst)
begin 
address_x1  	<= 0;
start_l1    	<= 0;
output_ram_l1  <= 0;
T_sum          <= 0;
cnt_l1         <= 0;
addr_w1        <= 0; 
cnt_node       <= 0;
cnt_x1         <= 0;
cnt_w1         <= 0;
T_sum          <= 0;
sum            <= 0;
cnt_sig_l1     <= 0;
cnt_w1_l2      <= 0;
cnt_l1_l2      <= 0;
cnt_node_l2    <= 0;
cnt_x1_l2      <= 0;
T_sum_l2       <= 0; 
cnt_x2_l2      <= 0;
cnt_final      <= 0;

end
else
begin
start_l1         <= 1;
output_ram_l1    <= start_l1;
output_ram_l11   <= output_ram_l1;
output_ram_l111  <= output_ram_l11;
output_ram_l1111 <= output_ram_l111;
started_output1   <= started_output;
started_output11   <= started_output1;
started_output111   <= started_output11;
started_output1111 <= started_output111;
started_output11111 <= started_output1111;
started_output111111 <= started_output11111;

output_ram_l2    <= start_l2;
output_ram_l22   <= output_ram_l2;
output_ram_l222  <= output_ram_l22;
output_ram_l2222 <= output_ram_l222;




T_sum            <= T_summ;
T_sum_l2         <= T_summ_l2;
cnt_l1 	 	     <= cnt_l11;
cnt_w1           <= cnt_ww1;
cnt_x1           <= cnt_xx1; 
address_x1       <= address_xx1;
addr_w1          <= addr_ww1;
cnt_node         <= cnt_nodee;
cnt_sig_l1       <= cnt_sig_l11;
cnt_x1_l2        <= cnt_xx1_l2;
cnt_w1_l2        <= cnt_ww1_l2;
cnt_l1_l2        <= cnt_l11_l2;
cnt_node_l2      <= cnt_nodee_l2;
cnt_x2_l2        <= cnt_xx2_l2;
start_collecting_l2 <= start_collecting_l22; 
cnt_final        <= cnt_finall;

//output_ram_l_l2 <= start_l2;
end 
   
	
always @(*)
begin
T_summ      = T_sum;
T_summ_l2   = T_sum_l2;
cnt_ww1     = cnt_w1;
cnt_xx1     = cnt_x1;
cnt_l11     = cnt_l1;
address_xx1 = address_x1;
addr_ww1    = addr_w1;
cnt_nodee   = cnt_node;
sum         = sum;
cnt_sig_l11 = cnt_sig_l1;
cnt_xx1_l2  = cnt_x1_l2;
cnt_ww1_l2  = cnt_w1_l2;
cnt_l11_l2  = cnt_l1_l2;
cnt_nodee_l2 = cnt_node_l2;
cnt_xx2_l2   = cnt_x2_l2;
start_collecting_l22 = start_collecting_l2;
cnt_finall   = cnt_final;


	if(start_l1 == 1)
		begin
			if(cnt_node < 26)
			begin
				if(cnt_x1 < 401)
				begin
				cnt_xx1     = cnt_x1 + 1;
				cnt_ww1     = cnt_w1 + 1;	
				address_xx1 = cnt_x1;
				addr_ww1    = cnt_w1;	
				started_output      = 0;				
				end 
				else
				begin
				cnt_xx1             = 0;
//				l1_results[cnt_l1]  = T_sum;
				started_output      = 1;
//				cnt_ll1             = cnt_l1 + 1;
				cnt_nodee   = cnt_node + 1;
				end 
			end 
			else
			begin
			cnt_ww1       = 0;
//			cnt_l1        = 0;
			end 
		end 
		
		
		if((started_output111111 == 1) && (cnt_l1 < 26))
			begin
				l1_results[cnt_l1]  = T_sum;
				$display("ans nad index %d %d",cnt_l1,T_sum);
				cnt_l11             = cnt_l1 + 1;	
				if(cnt_l1 == 25)
				begin
				start_sigmoid = 1;
				end 
			end
					//start_sigmoid = 0;
					//cnt_11 = 0;
			
			
		
	if(output_ram_l1111 == 1)
		 begin
//		  sum    = w1_val*x1_val; 	
		  sum    = m1_result; 	
		  T_summ = T_sum + sum[10:4];
		 end 
	
	if((start_sigmoid == 1) && (cnt_sig_l1 < 26))
		begin
		sigmoid_addr 				       =  l1_results[cnt_sig_l1];
		sigmoid_l1_results[cnt_sig_l1] =  sigmoid_data;  	
		$display("add data %b",sigmoid_addr,sigmoid_data);
		cnt_sig_l11						    =  cnt_sig_l1 + 1;
		if(cnt_sig_l1 == 25)	
			begin
			start_l2 = 1;
			end 
		end 
	

	if(start_l2 == 1)
		begin
			if(cnt_node_l2 < 11)
			begin
				if(cnt_x2_l2 < 26)
				begin
				cnt_ww1_l2     = cnt_w1_l2 + 1;	
				cnt_xx2_l2     = cnt_x2_l2 + 1;
				addr_ww1_l2    = cnt_ww1_l2;	
				start_collecting_l22    = 0;
				end 
				else
				begin
				cnt_nodee_l2 			  = cnt_node_l2 + 1;
				cnt_xx2_l2             = 0;
				start_collecting_l22    = 1;
				end 
			end 
			else
			begin
			cnt_ww1_l2       = 0;
			start_sigmoid_2 = 1;
//			cnt_l1_l2        = 0;
			end 
		end 
	
	
	if(start_collecting_l2 == 1)
		begin
				l2_results[cnt_l1_l2]  = T_sum_l2;
				cnt_l11_l2             = cnt_l1_l2 + 1;		
				$display("Data & cnt %b, %d",l2_results[cnt_l1_l2],cnt_l1_l2);
				
		end 
	
	if(cnt_node_l2 == 10)
		begin
		start_sigmoid_2 = 1;
		end 
	
	if(start_sigmoid_2 == 1)
		begin
		sigmoid_addr_2            = l2_results[cnt_final];
		final_data[cnt_final]     = sigmoid_data_2;
		cnt_finall                = cnt_final + 1;
		if(cnt_final == 9)
			begin
			result_out = final_data[cnt_final];
			end 
		else
			begin
			result_out = 0;			
			end 
		end 
	
	if(output_ram_l22 == 1)
		begin
		  //sum_l2       = w2_val*l1_results[cnt_x1_l2]; 	
		  x2_val       =  sigmoid_l1_results[cnt_x1_l2];
		  
		  T_summ_l2    = T_sum_l2 + m2_result[10:4];
		  cnt_xx1_l2   = cnt_x1_l2 + 1;
			if(cnt_xx1_l2 == 25)	
				begin
				cnt_xx1_l2 = 0;
				end 
				
		end 
	
	
end 	
endmodule
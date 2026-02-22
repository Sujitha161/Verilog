module seq
#(parameter s_w = 3) // state width
	(input clk,rst,d,
	output reg out);
localparam[s_w-1:0]
	s0 = 3'b000, 
	s1 = 3'b001, 
	s2 = 3'b010, 
	s3 = 3'b011, 
	s4 = 3'b100 ;
reg [s_w:0] state,ns;
always@(posedge clk or negedge rst) // 10011 detector
begin
	if (rst)
		state <= s0;
	else 
		state <= ns;
end
always@(*)
begin
	case(state)
		s0:if(d)
			ns <= s1;
		else 
			ns <= s0;
		s1:if(d)
			ns <= s1;
		else 
			ns <= s2;
		s2:if (d)
			ns <= s1;
		else
			ns <= s3;
		s3:if(d)
			ns <= s4;
		else
			ns <= s0;
		s4:if(d)
			ns <= s1;
		else
		       ns <= s2;
       endcase
end
always@(posedge clk or negedge rst)
begin
	if (ns == s4 && d)
		out <= 1;
	else 
		out <= 0;
end
endmodule








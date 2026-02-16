module t_ff(
	input d,clk,rst,
	output reg q);
always@(posedge clk or negedge rst)
begin
	if(rst)
		q<=0;
	else if(d) 
		q<=~q;
	else
		q<=q;
end
endmodule



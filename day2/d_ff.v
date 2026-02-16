module d_ff(
	input d,clk,rst,
	output reg q);
always@(posedge clk or negedge rst)
begin
    if (rst)
	q<=0;
    else 
	q<=d;
end
endmodule
	

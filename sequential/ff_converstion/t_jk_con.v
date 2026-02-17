module t_ff(
	input t,clk,rst,
	output reg q);
always@(posedge clk or negedge rst)
begin
	if (rst)
	 q<=0;
	else if(t)
		q<=~q;
	else 
		q<=q;
end
endmodule
module c_jk(
	input j,k,clk,rst,
	output q);
wire q1;
assign q1 = j&q|k&~q;
    t_ff t1 (.t(q1),.clk(clk),.rst(rst),.q(q));
    endmodule

		

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

module cd (input d,clk,rst,
	   output q);
wire q1;
assign q1 = d^q;
t_ff tff1(.t(q1),.clk(clk),.rst(rst),.q(q));
endmodule	
 

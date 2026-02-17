module d_ff(
	input d,clk,rst,
	output reg q);
always@(posedge clk)
begin
if(rst)
q<=0;
else
q<=d;
end
endmodule

module c_jk(
	input j,k,clk,rst,
	output q);
wire q1;
assign q1 = j|~k&q;
d_ff d1 (.d(q1),.clk(clk),.rst(rst),.q(q));
endmodule


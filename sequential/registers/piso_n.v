module piso(
	input [3:0] in,
	input load,clk,rst,
	output reg out);
reg [3:0]q;
always@(posedge clk or posedge rst)
begin
if (rst)
	q <= 4'b0000;
else if(load)
	q<=in;
else
begin
	q<={q[2:0],in};
	out <= q[3];
end
end
endmodule

	

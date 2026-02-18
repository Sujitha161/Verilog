module d_ff(input d,clk,rst,
	    output reg q);
always@(posedge clk or posedge rst)
begin
if (rst)
q <= 0;
else
q<=d;
end
endmodule
module pipo(
	input clk,rst,
	input [3:0]in,
	output  [3:0]q);
		d_ff d1(.d(in[3]),.clk(clk),.rst(rst),.q(q[3]));
		d_ff d2(.d(in[2]),.clk(clk),.rst(rst),.q(q[2]));
		d_ff d3(.d(in[1]),.clk(clk),.rst(rst),.q(q[1]));
		d_ff d4(.d(in[0]),.clk(clk),.rst(rst),.q(q[0]));

	endmodule


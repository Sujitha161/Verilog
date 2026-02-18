module d_ff(
	input clk,rst,d,
	output reg q);
always@(posedge clk or negedge rst)
begin
	if(rst)
		q<=0;
	else 
		q<=d;
end
endmodule
module sipo(input clk,rst,load,
	input in,
	output [3:0]q);
  d_ff d1(.d(in),.clk(clk),.rst(rst),.q(q[0]));
  d_ff d2(.d(q[0]),.clk(clk),.rst(rst),.q(q[1]));
  d_ff d3(.d(q[1]),.clk(clk),.rst(rst),.q(q[2]));
  d_ff d4(.d(q[2]),.clk(clk),.rst(rst),.q(q[3]));


  endmodule

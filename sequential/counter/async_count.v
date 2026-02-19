module d_ff(
	input d,clk,rst,
	output reg q);
always@(negedge clk )
begin
if (rst)
	q<=0;
else 
	q<=d;
end
endmodule

module asyncount(
	input clk,rst,
	output [3:0]count);
  wire [3:0]q;
	d_ff ff1 (.d(~q[0]),.clk(clk),.rst(rst),.q(q[0]));
	d_ff ff2 (.d(~q[1]),.clk(q[0]),.rst(rst),.q(q[1]));
	d_ff ff3 (.d(~q[2]),.clk(q[1]),.rst(rst),.q(q[2]));
        d_ff ff4 (.d(~q[3]),.clk(q[2]),.rst(rst),.q(q[3]));
       assign count = q;
endmodule

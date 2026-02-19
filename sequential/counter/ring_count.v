module d_ff(
        input d,clk,rst,inti,
        output reg q);
always@(negedge clk )
begin
if (rst)
        q<=inti;
else
        q<=d;
end
endmodule

module ringcount(
        input clk,rst,
	input [3:0]ori,
        output [3:0]count);
  wire [3:0]q,d;
        assign d[0] = rst ? ori[0]:q[3];
	assign d[1] = rst ?ori[1]:q[0];
	assign d[2] = rst ?ori[2]:q[1];
	assign d[3] = rst ? ori[3]:q[2];

        d_ff ff1 (.d(d[0]),.clk(clk),.rst(rst),.inti(ori[0]),.q(q[0]));
        d_ff ff2 (.d(d[1]),.clk(clk),.rst(rst),.inti(ori[1]),.q(q[1]));
        d_ff ff3 (.d(d[2]),.clk(clk),.rst(rst),.inti(ori[2]),.q(q[2]));
        d_ff ff4 (.d(d[3]),.clk(clk),.rst(rst),.inti(ori[3]),.q(q[3]));
       assign count = q;
endmodule


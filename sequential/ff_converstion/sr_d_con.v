module sr_ff(input s,r,clk,rst,
	output reg q);
always@(posedge clk)
begin
if(rst)
q<=0;
else
case({s,r})
	2'b00:q<=q;
	2'b01:q<=0;
	2'b10:q<=1;
	2'b11:q<=1'bx;
endcase
end
endmodule

module cd (input d,clk,rst,
	   output q);
 sr_ff sr1 (.s(d),.r(~d),.clk(clk),.rst(rst),.q(q));
 endmodule


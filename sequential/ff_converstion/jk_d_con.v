module jk_ff(
input j,k,clk,rst,
output reg q);
always@(posedge clk)
begin
	if(rst)
		q<=0;
	else
		case({j,k})
			2'b00:q<=q;
			2'b01:q<=0;
			2'b10:q<=1;
			2'b11:q<=~q;
		endcase
	end
	endmodule
module cd(input d,clk,rst,
	  output q);
jk_ff jk1(.j(d),.k(~d),.clk(clk),.rst(rst),.q(q));
endmodule


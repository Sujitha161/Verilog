 module sr_ff(
        input s,r,clk,
        output reg  q);

always@(posedge clk)
begin
case ({s,r})
         2'b00: q <= q;
         2'b01: q <= 0;
         2'b10: q <= 1;
         2'b11: q <= 1'bx;
         default: q <=1'b0 ;
endcase
end
endmodule

module sr_c_jk(
	input j,k,clk,
	output q);
	wire q1,q2;
	assign q1 = j & ~q;
	assign q2 = k & q;
 	sr_ff sr1 (.s(q1),.r(q2),.clk(clk),.q(q));
	endmodule



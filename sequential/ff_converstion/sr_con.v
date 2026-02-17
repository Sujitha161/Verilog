 module sr_ff(
        input s,r,clk,
        output reg  q);

always@(posedge clk)
begin
case ({s,r})
         2'b00: q <= q;
         2'b01: q <= 0;
         2'b10: q <= 1;
         2'b11: q <= ~q;
         default: q <=1'bx ;
endcase
end
endmodule

module sr_c_jk(
	input j,k,clk,
	output q_out);
 	sr_ff sr1 (.s(j),.r(k),.clk(clk),.q(q_out));
	endmodule



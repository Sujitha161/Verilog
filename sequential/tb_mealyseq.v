module tb_mealyseq;
	reg clk;
	reg rst;
	reg d;
	wire q;

mealy_seq uut (
 	.clk(clk),
	.rst(rst),
	.d(d),
	.q(q)
);

always #5clk = ~clk;

always@(posedge clk)begin
	d <= $random%2 ;
end
initial begin
	clk = 0;
	rst = 0;
	d = 0;
	
	#10 rst = 1;
	#200 $finish;
end
initial begin
	$dumpfile("out_seqmealy.vcd");
	$dumpvars (0,tb_mealyseq);
	$monitor("T=%0t | d=%b | q=%b ",$time,d,q);
end 
endmodule



module tb_sequence;
	 reg clk;
	 reg rst;
	 reg d;
	 wire Q;
sequence_detector uut(
	.clk(clk),
	.rst(rst),
	.d(d),
	.Q(Q));
 always # 5 clk = ~clk;

 initial begin
	 clk = 0;
	 rst = 0;
	 d = 0;
        #10  rst = 1;

	@(posedge clk) d <= 1;
	@(posedge clk) d <= 0;
	@(posedge clk) d <= 1;
	@(posedge clk) d <= 1;
	@(posedge clk) d <= 0;
	@(posedge clk) d <= 1;
	@(posedge clk) d <= 0;
	@(posedge clk) d <= 0;
	@(posedge clk) d <= 1;
	@(posedge clk) d <= 0;
	@(posedge clk) d <= 1;
	@(posedge clk) d <= 0;
       #200 $finish;
end
initial begin
	$dumpfile("out_sequence.vcd");
	$dumpvars(0,tb_sequence);
	$monitor("Time=%0t | d=%b | Q=%b", $time, d, Q);
end
endmodule



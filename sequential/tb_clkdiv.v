module tb_clkdiv;
	reg clk,rst;
	wire clk_out;
	wire [1:0]count;
clkdiv uut(.clk(clk),.rst(rst),.clk_out(clk_out),.count(count));

always #5 clk= ~clk;
initial begin
	clk=1;rst=1;
	#10;rst=0;
	#100 $finish;
end
initial begin
	$dumpfile("out_clkdiv.vcd");
	$dumpvars(0,tb_clkdiv);
	$monitor("time=%0t,clk=%b,rst=%b,count=%b,clk_out=%b",$time,clk,rst,count,clk_out);
end
endmodule


module tb_seq;
	parameter s_w=3;
	reg clk,rst,d;
	wire out;

seq #(.s_w(s_w))  uut (.clk(clk),.rst(rst),.d(d),.out(out));

always #5 clk = ~clk;
initial begin 
	clk = 1;rst=1;d=0;
	#10;rst=0;#10;
	d=1;#10;d=0;#10;d=0;#10;d=1;#10;d=0;#10;
	d=0;#10;d=0;#10;d=1;#10;d=1;#10;d=1;
	#200 $finish;
end
initial begin
	$dumpfile("out_seq.vcd");
	$dumpvars(0,tb_seq);
	$monitor("time=%0t,clk=%b,rst=%b,d=%b,out=%b",$time,clk,rst,d,out);
end
endmodule


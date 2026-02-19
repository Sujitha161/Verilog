module tb_d;
	reg d,clk,rst;
	wire q;
t_ff uut(.d(d),.clk(clk),.rst(rst),.q(q));

	always #5 clk = ~clk;
	initial begin
		clk=1;
		rst=0;
		d=0;#5;
		d=1;#10;
		rst=1;
		d=0;#10;rst=0;
		d=1;
		#80 $finish;
	end
	initial begin
		$dumpfile("out_d.vcd");
		$dumpvars(0,tb_d);
		$monitor("Time=%0t,d=%0b,clk=%0b,rst=%0b,q=%0b",$time,d,clk,rst,q);
	end
	endmodule



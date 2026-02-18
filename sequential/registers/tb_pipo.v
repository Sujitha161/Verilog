module tb_pipo;
	reg clk,rst;
        reg [3:0]in;
	wire [3:0]q;
pipo uut (.clk(clk),.rst(rst),.in(in),.q(q));

always #5 clk = ~clk;
initial begin 
	clk=1;rst=1;in=4'b0000;
	#10;
	rst=0;in=4'b1001;#10;
	in=4'b1000;
	#30 $finish;
end 
initial begin
	$dumpfile("out_pipo.vcd");
	$dumpvars(0,tb_pipo);
	$monitor("time=%0t clk=%b rst=%b in=%4b q=%4b",$time,clk,rst,in,q);
end
endmodule




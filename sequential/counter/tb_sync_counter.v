module tb_count;
	reg clk,rst,direc;
	wire [3:0]count;
syncounter uut(.clk(clk),.rst(rst),.direc(direc),.count(count));

always #5 clk=~clk;
initial begin
	clk=0;rst=1;direc=0;#10;
	rst=0;#10;direc=1;#100;
	direc=0;#100;
	 $finish;
end
initial begin 
	$dumpfile("out_syncount");
	$dumpvars(0,tb_count);
	$monitor("time=%0t,clk=%b,rst=%b,direc=%b,count=%b",$time,clk,rst,direc,count);
end
endmodule


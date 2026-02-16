module tb_jk;
	reg j,k,clk,rst;
        wire q;

jk_ff uut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q));

        always #5 clk=~clk;
        initial begin
                clk = 1;
		rst = 0;
		j=0;k=0;#5;
		rst=1;
                j=0;k=1;#10;
		rst=0;#5
                j=1;k=0;
		#5;rst=1;#5;j=1;k=0;
		#5;rst=0;
                j=1;k=0;#5;
		j=0;k=0;#10;
                j=1;k=1;
                #100 $finish;
        end
        initial begin
        $dumpfile("out_jk.vcd");
        $dumpvars(0,tb_jk);
        $monitor("time=%0t,j=%b,k=%b,clk=%b,rst=%b,q=%b",$time,j,k,clk,rst,q);

        end
        endmodule

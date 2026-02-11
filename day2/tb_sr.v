module tb_sr;
	reg s,r,clk;
	wire q;

sr_ff uut(.s(s),.r(r),.clk(clk),.q(q));

	always #5 clk=~clk;
	initial begin
		clk = 1;
         	s=0;r=1;#10;
		s=1;r=0;#10;
		s=0;r=0;#10;
		s=1;r=1;
		#60 $finish;
	end
	initial begin
	$dumpfile("out_sr.vcd");
        $dumpvars(0,tb_sr);
        $monitor("time=%0t,s=%b,r=%b,clk=%b,q=%b",$time,s,r,clk,q);
	end
	endmodule


        
	       

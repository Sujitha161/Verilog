module tb_modncount;
	parameter n=10;
        reg clk,rst;
        wire [3:0]count;
modncount  #(n) uut(.clk(clk),.rst(rst),.count(count));

always #5 clk=~clk;
initial begin
        clk=1;rst=1;#10;
        rst=0;#10;#100;
        $finish;
end
initial begin
        $dumpfile("out_modncount");
        $dumpvars(0,tb_modncount);
        $monitor("time=%0t,clk=%b,rst=%b,count=%b",$time,clk,rst,count);
end
endmodule

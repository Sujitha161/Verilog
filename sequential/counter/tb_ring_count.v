module tb_ringcount;
        reg clk,rst;
	reg [3:0]ori;
        wire [3:0]count;
ringcount uut(.clk(clk),.rst(rst),.ori(ori),.count(count));

always #5 clk=~clk;
initial begin
        clk=1;rst=1;ori=4'b1000;#10;
        rst=0;#10;#100;
         $finish;
end
initial begin
        $dumpfile("out_ringcount");
        $dumpvars(0,tb_ringcount);
        $monitor("time=%0t,clk=%b,rst=%b,ori=%b,count=%b",$time,clk,rst,ori,count);
end
endmodule


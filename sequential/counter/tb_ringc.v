module tb_ringc;
        reg clk,rst;
        reg ori;
        wire [3:0]count;
ringcount uut(.clk(clk),.rst(rst),.ori(ori),.count(count));

always #5 clk=~clk;
initial begin
        clk=1;rst=1;ori=0;#10;
        rst=0;#10;ori=1;#10;ori=0;
        #100 $finish;
end
initial begin
        $dumpfile("out_ringc");
        $dumpvars(0,tb_ringc);
        $monitor("time=%0t,clk=%b,rst=%b,ori=%b,count=%b",$time,clk,rst,ori,count);
end
endmodule

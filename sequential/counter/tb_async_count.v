module tb_acount;
        reg clk,rst;
        wire [3:0]count;
asyncount uut(.clk(clk),.rst(rst),.count(count));

always #5 clk=~clk;
initial begin
        clk=1;rst=1;#10;
        rst=0;#100;
         $finish;
end
initial begin
        $dumpfile("out_Count");
        $dumpvars(0,tb_acount);
        $monitor("time=%0t,clk=%b,rst=%b,count=%b",$time,clk,rst,count);
end
endmodule

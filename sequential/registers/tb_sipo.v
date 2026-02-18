module tb_sipo;
        reg clk,rst,in;
        wire [3:0]q;
sipo uut(.clk(clk),.rst(rst),.in(in),.q(q));
always #5 clk = ~clk;
initial begin
      rst =1;clk=1;in=0;#10;
      rst=0;#10;
      in=1;#10;
      in=0;#10;
      in=0;#10;
      in=1;#10;
       $finish;
      end
      initial begin
              $dumpfile("out_sipo.vcd");
              $dumpvars(0,tb_sipo);
              $monitor("Time=%0t,clk=%b,rst=%b,in=%b,q=%b",$time,clk,rst,in,q);
      end
      endmodule

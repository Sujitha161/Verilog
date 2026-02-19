module tb_piso;
        reg clk,rst,load,q;
	reg [3:0]in;
        wire out;
piso uut(.clk(clk),.rst(rst),.load(load),.in(in),.out(out));
always #5 clk = ~clk;
initial begin
      rst =1;clk=0;in=4'b0000;load=0;#10;
      rst=0; #10;
      load = 1;#10;
      in=4'b1001;#10;
      load = 0;
      #80 $finish;
      end
      initial begin
              $dumpfile("out_piso.vcd");
              $dumpvars(0,tb_piso);
              $monitor("Time=%0t,clk=%b,rst=%b,load=%b,in=%b,out=%b",$time,clk,rst,load,in,out);
      end
      endmodule

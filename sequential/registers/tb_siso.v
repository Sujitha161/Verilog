module tb_siso;
	reg clk,rst,in,direc;
	wire [3:0]d_out;
siso uut(.clk(clk),.rst(rst),.in(in),.direc(direc),.d_out(d_out));
always #5 clk = ~clk;
initial begin
      rst =1;clk=1;direc=1;in=0;#10;
      rst=0;#10;
      in=1;#10;
      in=0;#10;
      in=0;#10;
      in=1;#10;
      direc=0;
      in=0;#10;
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=1;
      #150 $finish;
      end
      initial begin
	      $dumpfile("out_siso.vcd");
	      $dumpvars(0,tb_siso);
	      $monitor("Time=%0t,clk=%b,rst=%b,in=%b,direc=%b,d_out=%b",$time,clk,rst,in,direc,d_out);
      end
      endmodule






module mealy_1011_tb;
  reg clk,rst,x;
  wire y;
  mealy_1011 dut(.*);
  initial begin
    $dumpfile("out_mealy_1011.vcd");
    $dumpvars(0,mealy_1011_tb);
    $monitor("time=%0t | rst=%b | clk=%b | x=%b | y=%b",$time,rst,clk,x,y);
  end
  always #5 clk=~clk;
  initial begin
    clk=1;
    rst=1;#10;
    rst=0;
    x=1; #10;
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;   
    x=0; #10;
    x=1; #10;
    x=1; #10;   
	$finish;
  end
endmodule

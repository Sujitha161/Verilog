module tb_demux;
    reg y;
    reg [1:0]sel;
    wire a,b,c,d;
    integer i;
 demux  uut(.y(y),.sel(sel),.a(a),.b(b),.c(c),.d(d));
 initial begin
    sel[0]=0;sel[1]=0;y=0; #10;
    for  (i=0;i<16;i++) begin
    {sel[1],sel[0],y}=i;#10;
 end
 end

 initial begin
       $dumpfile("out_demux");
       $dumpvars(0,tb_demux);	
       $monitor("time=%0t,sel[1]=%0b,sel[0]=%0b,y=%0b,a=%0b,b=%0b,c=%0b,d=%0b",$time,sel[1],sel[0],y,a,b,c,d);
      #100; $finish;
       end
 endmodule

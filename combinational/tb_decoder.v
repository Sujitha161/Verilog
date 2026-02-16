module tb_decoder;
    reg [1:0]sel;
    wire a,b,c,d;
    integer i;
 decoder  uut(.sel(sel),.a(a),.b(b),.c(c),.d(d));
 initial begin
    sel[0]=0;sel[1]=0; #10;
    for  (i=0;i<4;i++) begin
    {sel[1],sel[0]}=i;#10;
 end
 end

 initial begin
       $dumpfile("out_decoder");
       $dumpvars(0,tb_decoder);
       $monitor("time=%0t,sel[1]=%0b,sel[0]=%0b,a=%0b,b=%0b,c=%0b,d=%0b",$time,sel[1],sel[0],a,b,c,d);
      #100; $finish;
       end
 endmodule

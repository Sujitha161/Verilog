module tb_decoder;
    reg en;	
    reg [1:0]a;	
    wire [3:0]out;
    integer i;
 decoder  uut(.en(en),.a(a),.out(out));
 initial begin
    en=0;a=0; #10;
    for  (i=0;i<16;i++) begin
    {en,a[1],a[0]}=i;#10;
 end
 end

 initial begin
       $dumpfile("out_deco");
       $dumpvars(0,tb_decoder);
       $monitor("time=%0t,en=%0b,a=%02b,out=%04b",$time,en,a[1],a[0],out);
      #100; $finish;
       end
 endmodule

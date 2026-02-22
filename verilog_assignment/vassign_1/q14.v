module b
(output reg q);
reg[3:0] a=4'b110x;
initial
begin
if (a == 4'b1101) 
	q=1'b1;
else
	q=1'b0;
 end
 endmodule
 module tb;
        wire q;
b uut(.q(q));
initial begin
 $display("a=%b,q=%b",uut.a,q);//instance_name.signal_inside_module
end
endmodule

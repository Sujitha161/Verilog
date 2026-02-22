module tb;
	reg [3:0] a;
        wire q;
b uut(.a(a),.q(q));
initial begin
	a=4'b110x;
 $display("a=%b,q=%b",a,q);
end
endmodule

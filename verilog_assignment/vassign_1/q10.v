module tb;
reg [2:0] a, b;
reg [2:0]x;
initial begin
a=3'd0;
b=3'b000;
x= a || b;
	$display("a=%d,b=%b,x=%b",a,b,x);
end
endmodule

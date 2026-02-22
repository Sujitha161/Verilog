module test(output  [32:0]b);
real a=14.5;
assign b = a;
initial begin
	$monitor("time=%0t,a=%f,b=%d",$time,a,b);
end
endmodule

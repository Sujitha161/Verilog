module tbhalf;
	reg a,b;
	wire sum,carry;
halfadder uut( .a(a),.b(b),.sum(sum),.carry(carry));

initial begin
	a=0;b=0;
	#10;
	a=0;b=1;#10;
	a=1;b=0;#10;
	a=1;b=1;#10;
	$finish;
end
initial begin
	$dumpfile("out_halfadder.vcd");
	$dumpvars(0,tbhalf);
	$monitor("time=%0t,a=%b,b=%b,sum=%b,carry=%b",$time,a,b,sum,carry);

end
endmodule

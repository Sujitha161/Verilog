module tb_q;
	integer b;
initial begin
b= -'d 12/3;
$monitor("time=%0t,b=%d",$time,b);
end
endmodule

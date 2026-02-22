module test;
parameter WIDTH=8;
initial begin
	$display("WIDTH = %0d",WIDTH);
	end
endmodule
module top;
test  OUT () ;
defparam OUT.WIDTH=10;
endmodule

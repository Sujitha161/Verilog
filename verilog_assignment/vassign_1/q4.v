module tb_q;
	time  t;
initial begin
#10 t= $time;
#20 t= $time ;
	$monitor("t=%0t",t);
	#30 $finish;
end
endmodule


module tb_mux; 
		reg a,b,sel;
		wire c;
		integer i;

mux uut ( .a(a),.b(b),.sel(sel),.c(c));

initial begin 
   a = 0;
   b = 0;
   sel = 0;

   for (i = 0; i < 7 ; i = i + 1) begin
	{a,b,sel}=i;
	#10;
end
end
initial begin 
	$dumpfile("out_mux.vcd");
	$dumpvars(0,tb_mux);
	$monitor(" a=%0b b=%0b sel=%0b c=%0b",a,b,sel,c);
end
endmodule
	


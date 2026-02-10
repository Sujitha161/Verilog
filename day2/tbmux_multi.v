module tbmux_multi;
	reg a,b,c,d;
	reg [1:0]sel;
	wire y;
	integer i,j;

mux_multi uut (.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(y));

initial begin 
	a=0;
	b=0;
	c=0;
	d=0;
        sel=0;
	for(j=0;j<4;j=j+1)begin
		 {sel[1],sel[0]}=j;

	for (i = 0; i < 16;i= i+1)
	begin
	#10	{a,b,c,d}=i;
	end
   	
end
end
initial begin 
	$dumpfile("out_muxmulti.vcd");
	$dumpvars(0,tbmux_multi);
	$monitor("a=%0b b=%0b c=%0b d=%0b sel=%0b y=%0b",a,b,c,d,sel,y);
	end
	endmodule



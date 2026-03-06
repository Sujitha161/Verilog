module tbsingle_port_ram;
	parameter d_width=8,depth=8;
	reg clk,en,we;
	reg [$clog2(depth)-1:0]addr;
	reg [d_width-1:0]din;
	wire [d_width-1:0]dout;
	integer i;
single_port_ram #(.d_width(d_width),.depth(depth)) uut (.*);
//single_port_ram #(.d_width(d_width),.depth(depth)) uut (.clk(clk),.en(en),.we(we),.addr(addr),.din(din),.dout(dout));
always #5 clk = ~clk;
initial begin
	clk = 1;en=0;we=1;din=$random;addr=4'b0000;
	#10;en=1;we=1;#10;
	for ( i=0;i<depth;i++)#10
	begin
		addr <= i;
		din <= $random;
	end
	#20;we=0;repeat (5) #10 addr = $random;
//	addr = 3'b011;#10;addr=3'b001;
	#100 $finish;
end
initial begin
	$dumpfile("out_sport.vcd");
	$dumpvars(0,tbsingle_port_ram);
	$monitor("time=%0t | en=%b | we=%b | addr=%4b | din=%d | dout=%d ",$time,en,we,addr,din,dout);
end
endmodule

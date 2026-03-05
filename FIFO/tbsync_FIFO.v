module tbsync_fifo;
	reg w,r,clk,rst;
	wire empty,full;
        reg [15:0] din;
	wire[15:0] dout;
	wire[3:0] wptr,rptr;
sync_fifo uut(.w(w),.r(r),.clk(clk),.rst(rst),.empty(empty),.full(full),.din(din),.dout(dout),.wptr(wptr),.rptr(rptr));

always #5 clk = ~clk;
initial begin
	clk=0;rst=1;w=0;r=0;din=$random;
	#10;
	rst=0;#10;
	w=1;#10;din= $random;#10;
	r=1;#10;
	w=0;din=$random;#10;
	w=1;#10;r=0;#40;din=$random;
	#10;r=1;
	#100 $finish;
end
initial begin 
	$dumpfile("out_fifo.vcd");
	$dumpvars(0,tbsync_fifo);
	$monitor("time=%0t,rst=%b,w=%b,wptr=%d,r=%b,rptr=%d,full=%b,empty=%b,din=%d,dout=%d",$time,rst,w,wptr,r,rptr,full,empty,din,dout);
end
endmodule

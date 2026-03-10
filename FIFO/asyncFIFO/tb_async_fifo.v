module tb_asyncfifo;
	parameter d_width=8,ptr_width=4;
	reg wclk,rclk,wrst,rrst,we,re;
	reg [d_width-1:0]w_data;
        wire[d_width-1:0] r_dout;
	wire full ,empty;
top #(.d_width(d_width),.ptr_width(ptr_width)) uut (.*);
always #5 wclk = ~wclk;
always #10 rclk = ~rclk;
initial begin
	 wclk=0;rclk=0;wrst=0;rrst=0;we=0;re=0;w_data=8'd1;
	 #10;
	 wrst=1;rrst=1;we=1;
	 #10; 
	 w_data=8'd10;
	 #10;
	 w_data=8'd16;
	 #10;re=1;we=0;
	 #40;
	 we=1;#10;w_data=8'd12;
	 #10;w_data=8'd6;
	 /*repeat (8) 
 	 begin 
		#10;
		w_data=$random;
         end
	 #10;
	 repeat(8)
	 begin 
	 #10;
	 we=0;
         re=1;
  	 end

	 #10; we=1;re=1;
	 #10; repeat(5) #10 w_data=$random;*/
	 #100 $finish;
 end
 initial begin
	 $dumpfile("out_asyncfifo.vcd");
	 $dumpvars(0,tb_asyncfifo);
	 $monitor ("time=%0t |wclk=%b|rclk=%b|wrst=%b|rrst=%b|we=%b|re=%b|w_data=%d|b_wptr=%d|b_rptr=%d|full=%b|empty=%b|r_dout=%d",$time,wclk,rclk,wrst,rrst,we,re,w_data,uut.b_wptr,uut.b_rptr,full,empty,r_dout);
 end
 endmodule



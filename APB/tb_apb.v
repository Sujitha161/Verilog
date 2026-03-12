module tb_apb;
         parameter depth = 32 ,d_width = 32,slave=4;
 	 reg pclk,prst,apb_wr,transfer;
         reg [$clog2(depth)-1:0]apb_addr;
	 reg [$clog2(slave)-1:0]apb_saddr;
         reg [d_width-1:0] apb_pwdata;
        wire [d_width-1:0] apb_rout;

top #(.depth(depth),.d_width(d_width)) uut (.*);
always #5 pclk = ~pclk;
initial begin
	pclk = 0;prst=0;apb_wr=0;transfer=0;apb_addr=0;apb_pwdata='d10;apb_saddr=0;
       #10;
       @ (negedge pclk);
	prst=1;transfer=1;
 #10;apb_wr=1;apb_addr='b100;
 #10;apb_saddr= 2'b01;
 #10;apb_pwdata= 'd30;
	#10;
@(negedge pclk);	
 #10;transfer=1;apb_wr=0;apb_addr='b100;apb_saddr= 2'b01;
 
 #100 $finish;
 end
 initial begin
	 $dumpfile("out_apb.vcd");
	 $dumpvars(0,tb_apb);
	 $monitor("time=%0t|pclk=%b|prst=%b|psel=%b|penable=%b|psel2=%b|apb_wr=%d|transfer=%b|apb_addr=%d|apb_pwdata=%d|pready=%b|pr_data=%d|apb_rout=%d",$time,pclk,prst,uut.psel,uut.penable,uut.psel2,apb_wr,transfer,apb_addr,apb_pwdata,uut.pready,uut.pr_data,apb_rout);
 end
 endmodule


module tbdual_port;
        parameter d_width = 8,depth=8;
        reg clk,ena,enb,wea,web;
        reg [d_width-1:0] din_a,din_b;
        reg [$clog2(depth)-1:0] addr_a,addr_b;
        wire [d_width-1:0] dout_a,dout_b;
dual_port_ram #(.d_width(d_width),.depth(depth)) uut (.*);
always #5 clk = ~clk;
task data_gen;
                integer i;
		begin
        for (i=0;i<depth;i++)#10
        begin
                addr_a <= i;
                addr_b <= i;
                din_a <= $random;
                din_b <= $random;
        end
end
endtask
initial begin
	clk =0;ena=0;enb=0;wea=0;web=0;addr_a=0;addr_b=0;din_a=0;din_b=0;
	#10;
	// case 1 
	$display("write operation in both port");
	ena = 1;enb=1;wea=1;web=1;#10;
//case 2
	$display("Port A write Port B read");
         ena = 1;enb=1;wea=1;web=0;#10;
	data_gen;
//case 3	
	$display("Port A read Port B write");
	 ena = 1;enb=1;wea=0;web=1;#10;
	 data_gen;
//case 4
	$display("Read operation in both");
	 ena = 1;enb=1;wea=0;web=0;#10;
	 data_gen;
	 #100 $finish;
 end
 initial begin 
	 $dumpfile("out_dport.vcd");
	 $dumpvars(0,tbdual_port);
	 $monitor("time=%0t  |ena=%b|enb=%b|wea=%b|web=%b|addr_a=%d|din_a=%d|dout_a=%d|addr_b=%d|din_b=%d|dout_b=%d",$time,ena,enb,
		 wea,web,addr_a,din_a,dout_a,addr_b,din_b,dout_b);
 end
 endmodule


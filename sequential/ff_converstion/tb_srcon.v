module tb_srcon;
        reg j,k,clk;
        wire q_out;

sr_c_jk uut(.j(j),.k(k),.clk(clk),.q_out(q_out));

        always #5 clk=~clk;
        initial begin
                clk = 1;
                j=0;k=1;#10;
                j=1;k=0;#10;
                j=0;k=0;#10;
                j=1;k=1;
                #60 $finish;
        end
        initial begin
        $dumpfile("out_srcon.vcd");
        $dumpvars(0,tb_srcon);
        $monitor("time=%0t,j=%b,k=%b,clk=%b,q_out=%b",$time,j,k,clk,q_out);
        end
        endmodule

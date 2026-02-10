module tb_gates;
	reg a,b;
	wire and_o,or_o,not_o,nand_o,nor_o,xor_o,xnor_o;
all_gates uut(
       .a(a),.b(b),.and_o(and_o),.or_o(or_o),.not_o(not_o),.nand_o(nand_o),.nor_o(nor_o),.xor_o(xor_o),.xnor_o(xnor_o));

initial begin 
	a=0;b=0;#10;
	a=0;b=1;#10;
	a=1;b=0;#10;
	a=1;b=1;#10;
       $finish;
end
initial begin
	$dumpfile("out_gates.vcd");
	$dumpvars(0,tb_gates);
	$monitor("Time=%0t,a=%b,b=%b,and_o=%b,or_o=%b,not_o=%b,nand_o=%b,nor_o=%b,xor_o=%b,xnor_o=%b",$time,a,b,and_o,or_o,not_o,nand_o,nor_o,xor_o,xnor_o);
end
endmodule	

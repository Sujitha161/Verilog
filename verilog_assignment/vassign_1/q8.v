module tb_q;
reg[13*8:1]s;
initial
begin
s = "hello world";
$display("Value of s = %s",s[88:57]);
end
endmodule

module tb_q;
reg [2:0] a, b;
reg [2:0]y;
initial
begin
a= 3'd2;
b= 3'b111;
y = a&&b;
	$display("a=%d,b=%b,y=%3b",a,b,y);
end
endmodule


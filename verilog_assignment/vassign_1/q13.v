module tb;
reg [3:0]a;
reg [6:0]b;
initial
begin
a=4'd10;
b={a,2'd1};
$display("a=%d,a=%b,b=%d,b=%b",a,a,b,b);
end 
endmodule
